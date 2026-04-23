Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C5A3469F4
	for <sashiko@lists.linux.dev>; Thu, 23 Apr 2026 21:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776979046; cv=none; b=cg06uWMEr99w1ANAQE/w+rrAuNrFKcffdbKa7f9BkSk4tN4Af+LeW6ODkPTd0z2SwfuXToHi5l3WJMPCjkSifiI7v0mAho5a2crcSBsN0xH0PT+UGiDhuithm5yfxQoMeoaMgWXFSPdA9MhsYOU/gsUz5LiqchkwBH7rOl8lPVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776979046; c=relaxed/simple;
	bh=Fm+nVNuY1ICShxZpqYu3gn/9FyyvPWnPJiEmEWUvGqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gkx+wKs7gb1YKW2dGrvSymjxDM4zdPXA/++bAH4SPTdz5cd3G6bMjWV8DatyherZlsdBhBz+KlvZuybmYIpg2e5PSPUlaYse+tSqQYzwB3D2RLzSg9kNZMF6tSwisHDBVDy4NnbBK4X5mOSDZDxRybEMlaMBL20MsmlF8oYSBjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TpePQHCh; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TpePQHCh"
Date: Thu, 23 Apr 2026 14:17:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776979041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fUMBWdlBMRxG9o6UGmYTayD38WvO153ApS6uDqmipjA=;
	b=TpePQHCh/WFoM5nAQ6lAMwrBudMwNmoQvmnzZxCj3O1Qc/KZfBTO6/1JMQhR3aT5F5K9Yh
	KbxsD8OWSlAFh9G0mug18eLK7fWSBj1+0ZtoRotGYz8PUxPnJI02D9OiVYgPHEDjVjR2If
	zNsD1/jKKPB8JDr0N6Btdjn8BEY7vRk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Martin KaFai Lau <martin.lau@linux.dev>
To: Kuniyuki Iwashima <kuniyu@google.com>, Jiayuan Chen <mrpre@163.com>
Cc: sashiko@lists.linux.dev, bpf@vger.kernel.org
Subject: Re: [PATCH v2 bpf] sockmap: Fix sk_psock_drop() race vs
 sock_map_{unhash,close,destroy}().
Message-ID: <202642321855.Yu6v.martin.lau@linux.dev>
References: <20260420194846.1089595-1-kuniyu@google.com>
 <20260421011357.70974C19425@smtp.kernel.org>
 <062b1b3b-dedd-422b-83a6-1ca78d7270f7@163.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <062b1b3b-dedd-422b-83a6-1ca78d7270f7@163.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Apr 21, 2026 at 11:21:27AM +0800, Jiayuan Chen wrote:
> > > @@ -1652,20 +1657,25 @@ void sock_map_destroy(struct sock *sk)
> > >   	void (*saved_destroy)(struct sock *sk);
> > >   	struct sk_psock *psock;
> > > +retry:
> > >   	rcu_read_lock();
> > >   	psock = sk_psock_get(sk);
> > >   	if (unlikely(!psock)) {
> > >   		rcu_read_unlock();
> > >   		saved_destroy = READ_ONCE(sk->sk_prot)->destroy;
> > > +		if (unlikely(saved_destroy == sock_map_destroy))
> > > +			goto retry;
> > Can this unbounded retry loop cause a hard lockup due to softirq preemption
> > or priority inversion?
> > 
> > If sk_psock_put() is called from process context with bottom-halves enabled
> > (such as from sock_map_close() after release_sock()), an interrupt could
> > preempt the thread immediately after refcount_dec_and_test(&psock->refcnt)
> > drops to 0 but before sk_psock_drop() disables BH.
> > 
> > If a network interrupt fires on the same CPU, NET_RX_SOFTIRQ may process a
> > packet (such as an RST) that triggers socket destruction via:
> > tcp_done() -> inet_csk_destroy_sock() -> sk->sk_prot->destroy()
> > 
> > Since sk_psock_drop() has not yet restored the protocol, sk->sk_prot->destroy
> > is still sock_map_destroy().
> > 
> > When sock_map_destroy() calls sk_psock_get(), it returns NULL because the
> > refcount is exactly 0. The code then falls into the !psock branch, sees that
> > sk->sk_prot->destroy is still sock_map_destroy(), and jumps to retry.
> > 
> > Because the softirq spins infinitely in this tight loop and never yields the
> > CPU, the preempted process context can never execute sk_psock_drop(),
> > resulting in a permanent hard lockup.
> 
> 
> sock_map_close(sk)
> |___ sk_psock_put(sk, psock)   <- refcnt-hits-0 window lives here
> |___ saved_close == tcp_close
>       |__tcp_close
>             |____ sock_orphan   <- SOCK_DEAD set here
>             |____(later) inet_csk_destroy_sock
> 
> At the exact instant the refcnt can be observed at 0 with
> sk_prot not yet restored, SOCK_DEAD is guaranteed not to be set.


> > A similar priority inversion deadlock could also occur on PREEMPT_RT if the
> > thread calling sk_psock_drop() is preempted by a higher-priority task.

The same SOCK_DEAD reasoning applies to PREEMPT_RT?

It is useful to have some explanation in the commit message for this case.

Kuniyuki, does the above make sense? I can fold it in before landing.
