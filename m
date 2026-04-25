Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7631F03D9
	for <sashiko@lists.linux.dev>; Sat, 25 Apr 2026 02:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777083457; cv=none; b=VxpqRzTgP8t5oPSthF4poKFIkwq45JvXjOxdPu/aeFeND+tSZ2EIdqgpvK041qmyaaT3w/6FHDzH0Seqi+baYsqxlS19/VaSz5DW5YHWCAEdn3rMNLQmXtFSOHMi4tbzbMCfXghBqiMETeVXImNIZhgZaiIfzgh660ina1WTqvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777083457; c=relaxed/simple;
	bh=B7eKxT0CklwU4a+KUGe/ivPvc9NgmkKrcfstup9BHH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxuZ01HfXE/mBjnIuYNs0uqy0gtkcuC/5QwH0Vg9FeFZtZDjqq+G1twc7IcOFfejmC2tWKZaCNPGxM+Pbrhbhm4IwFTWjQYXQCa+ZZ9r4tJpJR771AUqA6VGJxvL1cRkTfCAWQbMhnPuxyO+e7OxbbFPk+EWvT5gYEQ81fcUJRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVKNVxxU; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVKNVxxU"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-793fdbb8d3aso89368387b3.3
        for <sashiko@lists.linux.dev>; Fri, 24 Apr 2026 19:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777083455; x=1777688255; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yNwxkb+9lc8LbYT7XYKKUUPdOhjNGqAa21W0MQ/ZC/Q=;
        b=FVKNVxxU/Hxh5F44EdsgnmowkParegewcR56ktd5TmgUh47VZiMWHq82mLp8yblbaV
         abPdX7XJ7SrFpG7zaBbRqxz2sEOVuIz2mTw+zduk0bAE1AILIyWEK74fm+/Lqbu5boKr
         uAGvEaFSuxO8PrjK11qZKjDWCimTsh+AbpGdrElepXoJ0j8QJwiVvRtvXRsU9DHGKoUl
         s35ftKpYErpFYsLe7OEaSY7GsPg/Jw24BkNn/8rym9IVY26iZdQAv5OiMxAJNh7srPoX
         gte9Yxr90vXKNZK5ffGuBA8NnAgNRQUFZvA/BXQuPPSqK5f5oyzcM1CM3li7CI4IJ2B+
         Uo2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777083455; x=1777688255;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yNwxkb+9lc8LbYT7XYKKUUPdOhjNGqAa21W0MQ/ZC/Q=;
        b=GDI12mrexOmZFXAv08ayrxseJhVTjamBSVjierP1bfDTNsb6OUeeSVnh4bDh3vMtE/
         Gx8CDtsclo0gXKu7qnrM7ql0x63NIKh+lkIoXAXVdqM/JwBAslmyqad2UFBoh1QB8bB2
         0CgIUKiWVTWBTCXay5ROhhEMbb9zwEK8xHGX1xoeefG/hjegaC4Of4gryQH+ArpvPPr1
         9DDL/tZIWhrO4bzmLyN4VylPlpducLYmryzwP6SX3qeRGsVx6SoRlIUrhmbi9zwZ911e
         ufkYz78sMsix7RhkPOWkGt+KwzeffKWZq7NH2g19DD/OuedyCAeNkCxZSTan6or1/5D5
         19Dw==
X-Gm-Message-State: AOJu0YyZ5qi0+fzF9h3I2Ue9rHAbloRvBoRPLQ3NXC35WiLnSawP0IB8
	fDz3wAn0picjWrp3+VqY1bUx27gUJHlMT7aWe3ZrMYB5SHOffiVbI3NP
X-Gm-Gg: AeBDietLOy6udqpbq5PpIZTe1CQO/l3hIcraXF0/yHdU2aPcqdjkVmtD59Y4+fJdg8y
	Vp1a+L/j4iPm1wgHZtH0b4LLbj4bqb12eI75TMyPidXvYYqUlUYgbo8OC03MyxwgZLQGejVCURT
	WSCCKi+xc72vmc/eR1N0E+kZ7V07prnkvbh2mTSEXAw0WeP36mGvE22MMOiA+ruTwPMpkKRPA2v
	QO1GK8/0PxB3Y45Pe7SM94It4H0NBAbFLqS4bPNiZSf9HYhYPOnz3W9KRAaxCBJI1oZuy64VSrV
	wzi8JH3iLQN/FqBdmQ5GlkBX4qGRRkE1cTL7FV9V4CCSHFiq9L3A8h6Kn0c25Ce6z4QMcwvyr3U
	MUVzxQtXqhweqEQw4X2bJy6XzFUp0q7ZjG5OJp3AW5DAUTALsb1C7UClnYK11hmKX7iQscxeiVX
	vEf7vRaz9ZzhR3AbV8VkYm1SWpwIPYyDe8ukXUHfdPOGb7PIme+84acVNGKF/wxQ3WcTi4bdCwJ
	LXEbg==
X-Received: by 2002:a05:690c:a05c:b0:79f:4e02:50cc with SMTP id 00721157ae682-7b9ecfe1297mr273316837b3.42.1777083454774;
        Fri, 24 Apr 2026 19:17:34 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:cc96:e003:f6cc:4ed])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee89abd7sm98290457b3.1.2026.04.24.19.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 19:17:34 -0700 (PDT)
Date: Fri, 24 Apr 2026 22:17:32 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: sashiko@lists.linux.dev, bpf <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v3 1/2] bpf: Implement dtor for struct file BTF
 ID
Message-ID: <aewkPGl6vkcWS5z9@zenbox>
References: <20260424192252.695240-2-utilityemal77@gmail.com>
 <20260424195958.AED4EC19425@smtp.kernel.org>
 <aevOssMWH_Vm9CPG@zenbox>
 <CAADnVQKFtuX48V9Yy88GHGVbQyY30M3b3YBvZ2PmYt_-jbohpQ@mail.gmail.com>
 <aev6zU2vj6wmaRMG@zenbox>
 <CAADnVQJEXDh6=rKfUjuR_zjCcXfMAXUaXcXTWgUAx1-mWe_e-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAADnVQJEXDh6=rKfUjuR_zjCcXfMAXUaXcXTWgUAx1-mWe_e-w@mail.gmail.com>

On Fri, Apr 24, 2026 at 06:25:31PM -0700, Alexei Starovoitov wrote:
> On Fri, Apr 24, 2026 at 4:20 PM Justin Suess <utilityemal77@gmail.com> wrote:
> >
> >
> > So either:
> >
> > 1. allocating memory for a new irq_work on the fly, which is an
> > operation that can fail. So if we're under memory pressure the
> > element never gets freed.
> >
> > 2. preallocate an irq work for every element ahead of time.
> 
> obviously that's not what I was referring to.
> irq_work is rarely used directly like that.
> The common pattern is:
> defer_free()
> {
>         if (llist_add(head + s->offset, &df->objects))
>                 irq_work_queue(&df->work);
>
That's smart. So you can use it like a doorbell pattern and avoid
re-calling it. And avoid locking with llist.
> but before going there.
> Please enumerate "other dtors broken in NMI".
> What exactly is broken?
> What is the sequence of events?
> All map types with kptrs? or particular ones?

Only referenced kptrs.

I only tested hashmaps, not any other map types. But I don't see any
reason why this wouldn't apply to other map types.

Here are the specific dtors that know/suspect are buggy in NMI.

1. bpf_task_struct_release_dtor I confirmed. See below

2. bpf_kfree_skb_dtor can do call_rcu_hurry.

3. bpf_crypto_ctx_release_dtor does call_rcu.

4. bpf_cgroup_release_dtor frees via work queue and takes cgroup_mutex.

bpf_cpumask_release_dtor I think is safe.

I made a reproducer for one of these (task_struct dtor).

I triggered the issue by deleting the last reference to a task_struct kptr within the tp_bpf/nmi_handler prog.

`bpf_map_delete_elem()`
`  -> htab_map_delete_elem()`
`  -> free_htab_elem()`
`  -> bpf_obj_free_fields()`
`  -> bpf_task_release_dtor()`
`  -> put_task_struct_rcu_user()`
`  -> call_rcu()`

Log:
  [    1.358433] ================================
  [    1.358433] WARNING: inconsistent lock state
  [    1.358434] 7.0.0-11169-ge4ef174588b8-dirty #16 Tainted: G           OE      
  [    1.358435] --------------------------------
  [    1.358436] inconsistent {INITIAL USE} -> {IN-NMI} usage.
  [    1.358436] test_progs/134 [HC1[1]:SC0[0]:HE0:SE1] takes:
  [    1.358438] ffff8ae3bbc6f0e8 (&rdp->nocb_lock){....}-{2:2}, at: __call_rcu_common.constprop.0+0x316/0x740
  
This is done by loading a task_struct referenced kptr into a map and
deleting it later from within a tp_btf:nmi_handler BPF_PROG_TYPE_TRACING
program.

For the task_struct case;

I have a bug report:
https://lore.kernel.org/bpf/20260421201035.1729473-1-utilityemal77@gmail.com/

With reproducer:
https://gist.githubusercontent.com/RazeLighter777/5539336d79ab1854f9e9550c6dcab118/raw/082f1eeb2dd445936e64dd3a33861764690bde82/task_struct_dtor_deadlock.patch

I didn't make a reproducer for other cases.

Thanks for the tip with llist and irq_work, that blew my mind a bit.

Justin
