Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB99388E4B
	for <sashiko@lists.linux.dev>; Sun, 10 May 2026 15:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778426020; cv=none; b=mj3taC5LfUKQoNdLIEScQ8a4Yz38+Jj5/dHw1ySx7ulPlROJDWiQ2hamfBr95YWGDXUoJvCzlOInkSQLFm2RPEJrupIB9sqAseI9v40RDiPy54kSK73uxtAJcb4b9bJDqrBsnF/I5lZXWHemETLitl8CXLwtJn76pK7DZ1w5FcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778426020; c=relaxed/simple;
	bh=r/WOnTGUEtMH6yCZoAP+YqqwKeh7rprH5FfTfFGcFdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XOjijuPVGWg89bOgtR6KVsSeePkrjhBaD3yghXPdIfitBGX62XWSgy8eNdzrH0STz5kA9eXqSo35kF/8Ez1ZM3ccXPs/VnUCuYuv1xqW2P0izaNosk9sLgrQesqL6UcuslvwkvC/t9KtxKdDyLfrjNuBxo1p/LrkMM7oFeIXFSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZikUT0Fr; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZikUT0Fr"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7bd5c773ef3so34539077b3.1
        for <sashiko@lists.linux.dev>; Sun, 10 May 2026 08:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778426018; x=1779030818; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N6YM/AAXzn9J0aZ953Dqra2iVWJmXRfyE6DQF3nGAEs=;
        b=ZikUT0FrC/dbUsbfiFBo/zQDln+X9+t/jvjXxdrAMeHLfkcuW5CB0noo8lCSufUfSq
         b6nnrF1Q9cx7uYHC30J1T34HrRyBi5m6BxGYLZY6fxvGdLZ634v/F9M29Gk5OxMgKiNE
         xH/0dEeN/bSP1CdOnQmqvY2b3L9Ak6pRgD4s0qFCiceR0eBiPYcoX9kf4Enqex9zbzur
         fB709Cb7TA7Bqg7giHL9P+4G5WIfGJiiIMk2iGyIEgzgIowC2I+c/nBrCpMBi1FGbOQu
         ENnuFyHf4I9iKM/2/pN5qEKe0b30iU6nsd5nfMrAkbPmSfUgVu8hbtrkIgY6ZkFiBjOZ
         5ovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778426018; x=1779030818;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N6YM/AAXzn9J0aZ953Dqra2iVWJmXRfyE6DQF3nGAEs=;
        b=n+Uyyi1zbc7xwsMWNnGbNIgWoBHuQxSUNvozlY6j0yE3C9vR0cPf+PK3HOTATl61q4
         PgNAxyvrvLJqPi5ciVn1xx0dstquEY/qhY1vLAqB8wJX1yuRlzbRlRFFB93xIsFcbdtS
         EC9mgUZvwGQzGGgIj7fWDu3BndpMN90iI0xSs7NyRHdyJX6G0KdTAx/YbFhDx5GJ19BG
         xw9990ivilSjVnSbaDfreO/286QUxXs5uSJLlucovmAioUZ00IAd44w42RM9Sb6BQnH2
         MH5bTJzXeUIovW07M/4UlIs254ByQQGCuAA+fJ/YixrhGC5CCYW1n7XqK0afwFS+00zq
         G5Rw==
X-Gm-Message-State: AOJu0YyC8/TnMY1zLnNpZDL7IC+ZBykDc/Rm4CXM6nwGd/KRfItYFuuY
	USEkZrjzLf5JhyLLDoIf4PYZlje2nt7xOo9bWA4iz97WHL+mJ/bOEhOR8vXeSiKu
X-Gm-Gg: Acq92OExhLfwTX9nliR4hy9vIPgR1KrTw/Qntet/n/MutP8Kb6Lc0TYNV625anA1Qv4
	R4lRY9JLrmndqacFfMVjUeU9jHHxrtRaRjSrg8leikQc6DNKcxKyZtmKW10hE4w9gnzmvG+NxW8
	mICWMhdyOe0MAuona0wbs4yM8CGeqHRrPNw3rwT+5GB7dC0NWxvweyhzZKxZu2O+ZMQjycdSSW/
	e/b9Hb/AvIXAX5x7/GngskwaIQ+R6dzrZBJPeT0fH4i+GhZ7LAqxR3AE+UsSwI5a/r0ejRP2x8T
	8tDgzuk872982LPsIYXrEYI1H197uznK5e/EVLuxFpJR4u6IxjxK1Ruirov78w3DkmvzLRCTC2B
	5y1TXGEbFrvPcsNlbLv3Bp+LLcwELkWI5QWdpGpm1wVb+1jBA/zVod9TU4ewm29SjF0TNCXyWOC
	fTQW1B7qtdqXhxA7S4oPcT5rmkU0i7kjS9ouf5mOon6XoP+i0ua80c/MLLsQ==
X-Received: by 2002:a05:690c:4b0c:b0:799:2b4c:1d49 with SMTP id 00721157ae682-7bdf5eef7e4mr218836357b3.36.1778426018026;
        Sun, 10 May 2026 08:13:38 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4060:ee75:92ff:98db])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6685d37fsm135045457b3.36.2026.05.10.08.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 08:13:37 -0700 (PDT)
Date: Sun, 10 May 2026 11:13:36 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [bpf-next v3 1/2] bpf: Offload kptr destructors that run from NMI
Message-ID: <agCXEJKJh-JGMhjG@zenbox>
References: <20260507175453.1140400-2-utilityemal77@gmail.com>
 <20260507234520.646C4C2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260507234520.646C4C2BCB2@smtp.kernel.org>

On Thu, May 07, 2026 at 11:45:19PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] TOCTOU race in `bpf_dtor_kptr_release_one()` can lead to NMI deadlocks.
> - [Low] Memory leak on initialization failure in `bpf_dtor_kptr_init()`.
> --
> 
> commit 488cdc390b90427a591d47211600c09addc95fcd
> Author: Justin Suess <utilityemal77@gmail.com>
> Date:   Thu May 7 17:54:52 2026 +0000
> 
>     bpf: Offload kptr destructors that run from NMI
> 
> This commit queues destructor-backed kptr teardowns to irq_work when
> running from NMI context. It maintains an idle-slot surplus counter to
> ensure offload slots are preallocated to prevent deadlocks.
> 
> Closes: https://lore.kernel.org/bpf/20260421201035.1729473-1-utilityemal77@gmail.com/
> 
> > diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> > index 3b1f0ba02f613..d34fdb99eb8a9 100644
> > --- a/kernel/bpf/syscall.c
> > +++ b/kernel/bpf/syscall.c
> [ ... ]
> > @@ -65,6 +69,111 @@ static DEFINE_SPINLOCK(map_idr_lock);
> > +static void bpf_dtor_kptr_release_one(void)
> > +{
> > +	struct bpf_dtor_kptr_work *job;
> > +	long surplus;
> > +
> > +	for (;;) {
> > +		surplus = atomic_long_read(&bpf_dtor_kptr_surplus);
> > +		if (surplus <= 0)
> > +			return;
> > +
> > +		job = bpf_dtor_kptr_pop_idle();
> 
> Could this sequence lead to a race condition that drains the idle pool
> too early?
> 
> If multiple threads read a positive surplus value here, they might all call
> bpf_dtor_kptr_pop_idle() before the cmpxchg executes. This could temporarily
> drain the idle pool below the required number of reserved slots.
> 
> If an NMI fires during this window and attempts to tear down a kptr, would
> bpf_dtor_kptr_offload() find the idle pool empty? If so, it looks like it
> would trigger the fallback warning and run the destructor inline from the
> NMI context, which might reintroduce the deadlocks this patch aims to
> prevent.
>
Yes this is real.

But there's a bigger problem: the push side of pcpu_freelist is not
interruptible.

If we jump to NMI during this stage then the pcpu_freelist will be
locked up because we were pushing to it, thus preventing us from
popping. Thus we just deadlock again.

I think we technically have exclusivity here on our percpu head
(we can't be in NMI and process context stimultaniously on the cpu).

So maybe it is safe to forcibly acquire that specific lock? I'm not 100%
sure.

llist won't work since we can't have multiple llist_del_first consumers,
and llist_del_all would render the list null and unusable if we jump to
it from NMI while we're borrowing it. 

Making percpu llists won't work either, since the cpu we allocate the
job one might not be the one the dtor runs on, so we need percpu
stealing, which then runs into the same multiple consumers problem if
threads steal from same cpu head.

So this code is not ready either way.

I think 128 bit cmpxchg could technically solve this problem, but don't
think we can rely on it for all architectures BPF supports.

If anyone has any guidance on this it would be much appreciated. Been
stuck on this for several weeks...

Construct I need is a data structure with atomic push, pop, and move
between sets. No specific ordering needed, but updates from producers 
must be immediately visible to all consumers. I've looked into Treiber
stacks.

Any help or guidance on this would be appreciated!
> > +		if (!job)
> > +			return;
> > +
> > +		if (!atomic_long_try_cmpxchg(&bpf_dtor_kptr_surplus, &surplus,
> > +						     surplus - 1)) {
> > +			pcpu_freelist_push(&bpf_dtor_kptr_idle, &job->fnode);
> > +			continue;
> > +		}
> > +
> > +		bpf_mem_free(&bpf_global_ma, job);
> > +		return;
> > +	}
> > +}
> [ ... ]
> > +static int __init bpf_dtor_kptr_init(void)
> > +{
> > +	int err;
> > +
> > +	err = pcpu_freelist_init(&bpf_dtor_kptr_idle);
> > +	if (err)
> > +		return err;
> > +
> > +	err = pcpu_freelist_init(&bpf_dtor_kptr_jobs);
> > +	if (err)
> > +		return err;
> 
> Does this error path leak the per-cpu memory allocated for the idle list?
> 
> If the second pcpu_freelist_init() fails, the function returns immediately.
> Should there be a cleanup path here to free the already initialized
> bpf_dtor_kptr_idle list?
> 
> > +
> > +	return 0;
> > +}
> > +late_initcall(bpf_dtor_kptr_init);
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260507175453.1140400-1-utilityemal77@gmail.com?part=1
