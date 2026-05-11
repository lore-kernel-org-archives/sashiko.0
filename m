Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3266618FC97
	for <sashiko@lists.linux.dev>; Mon, 11 May 2026 01:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778464193; cv=none; b=Li81jKjGHNdkBYENv4OvtDW6KJVt/2cU7i92p9bBn5Dlda7b+xCKXit5+DTNGxf18P3ZEP9Zg7YCKwbnxkO0ievH4UAZ2R7eMadU2ax5GsD01ka1XdAkk4VVLReQhwFaGRlTKyY4mNfbBk9DI+l0e5CsmTWFm07sBBgbjoF98Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778464193; c=relaxed/simple;
	bh=Jx4XS5wyKbq7T5KE5vQJ0AGGGHfHjRthrIB01SfH0F0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSaiONyKaOvYPtGOEsfbiCoWseVnLUZ4XPDTlSKaq9jYjKOOOEi6d8EUT98MdEyXLBk7oR+zOo677zODZK+3m9bYYXqaDnYamrEa+IbJLaA2PZfPHmOXlBlZlhgQ6J3FAZn5apAOHh0Qmy0R2Am0oKmR18YC8V4CHeqVTPQdte0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ds9UAcQd; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ds9UAcQd"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7bd810cdc5dso39337097b3.1
        for <sashiko@lists.linux.dev>; Sun, 10 May 2026 18:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778464191; x=1779068991; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BhB9fCxPYHAt/1E8KLkKkXcaVh6sGzX9RYj9Tds5So4=;
        b=ds9UAcQdsgcRJjlttrdzSmk90TW0appD0gciGbNSKug1gNtLycG6AXHdgOkv79rQ3M
         ypgU9d5zd/43+Ywz/k31Tm6clCmdnHumLliBZXfduv7zyWlWgT0/Gbz0EqdmLSuSpvo6
         bMKU+0/QmP9WaMYrFs90nRKbxn2ZgHt9S+ai9Xk5fD3V8WEBeeEdrsPf2lSnxPfSY+Vi
         bLvzuQ788gOpyw2ucaO0Ciy+f/Iyc3qH/2gkyKGn7H2eMABW7gPuuxWBD+AhTWSoSqtc
         ySy4I2JZiEzrEcrWrX4PMF5P0QDwIJxRRGfqPPt0gkm8Y0SCXY9BcsmRNFOx1tGiyP9F
         7c9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778464191; x=1779068991;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BhB9fCxPYHAt/1E8KLkKkXcaVh6sGzX9RYj9Tds5So4=;
        b=f7b7SOmycr2lE74LgHNI5jjvSM1cCKjZe60HY1TIRqLhvLBRp5P3t6SODFxxZc/oes
         Ix3oshP7e68HtHSbaAGR6DvUfZAqYVdiZVxKscZIKpCW/RnvPNhg0zhU7XCGYK+HckFn
         VcXUr7tpZMkbxwYC/BPvUwzPXZjcSeQiTOVSaGElMUmLL17q3JqaTU4AhcDtQj/InXOd
         Cod2Apu3YzkWOG8h+DHTMpZYgbqQA3DXttx0Jm2s83oQHcXkkBWV0eKcOtBaSRfV6JxA
         Aaq0vqfynSdSeM8HAu44ULfS0uSckuUd1K2xcFIkeI75NTdxTI2khMyeQW96PmFu994K
         zW4Q==
X-Gm-Message-State: AOJu0YyOjamWp2w7ZSGXQqgyeKC9c9tgqDCyagHahpEd5XBB27V/tcbf
	eUEhFNxoc1qfYMeXXlD8zlil21HZCGzHDFqok2c92SCqNJ5azB6xjuyc
X-Gm-Gg: Acq92OGET3P/qqPooTTVN9VhmyiCHClCCRzAcjjeLhQLnZbDcRRBIIn4j+7FG6W03ck
	CAMOXPdMHAgU3Y92dSZF/bGk/U7HEEvjZStbsQoPNLaZVuJ5FlC/kAwfjTanO9SLuTWZY+NqGNk
	eb5UUGEqahCo4uryFQHa4iyFOybtGahjErMgys30Jy3vPYkcNEJG0ad4mvUSlRcLB/cDTsxn8On
	7TllO5aqMYx7LnJNtqAg66ghhhPSOCZNNvMHLEeSZg/GhzJHPcyJYQIoltuCrFS9VN+6GaGgRVr
	C627SFRcQjr30sL6eVQ/lBnUV8mNiVDQHN/USJqpuRoQJavucAdbJxiOvmxxv9x0HTn1USpVbsr
	N5Iii1EU8EYmkqWXi97pmZtt8mdukYBZ7Wx12BcuKP8mn0VX254HQaSjKCsZ6lbeZC5aEeVth7Y
	qDaG+8Nb0G6ofUK3298RWse468NrJCQS2xHffNOiehPWM2Oh8qhLBRdRMk711+QtGiFLSL
X-Received: by 2002:a05:690c:c0d8:b0:79a:3655:9df5 with SMTP id 00721157ae682-7bdf5dc6e2cmr224710627b3.12.1778464191088;
        Sun, 10 May 2026 18:49:51 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4060:ee75:92ff:98db])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd66838851sm140128157b3.23.2026.05.10.18.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 18:49:50 -0700 (PDT)
Date: Sun, 10 May 2026 21:49:49 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: sashiko@lists.linux.dev, bpf <bpf@vger.kernel.org>
Subject: Re: [bpf-next v3 1/2] bpf: Offload kptr destructors that run from NMI
Message-ID: <agEnc0aYMhuIeDlq@zenbox>
References: <20260507175453.1140400-2-utilityemal77@gmail.com>
 <20260507234520.646C4C2BCB2@smtp.kernel.org>
 <agCXEJKJh-JGMhjG@zenbox>
 <CAADnVQJdFCFJcg0Pqdnx=D2h5vHj_q4mrwSJYxRC5RW0NTFNvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAADnVQJdFCFJcg0Pqdnx=D2h5vHj_q4mrwSJYxRC5RW0NTFNvQ@mail.gmail.com>

On Sun, May 10, 2026 at 03:38:08PM -0700, Alexei Starovoitov wrote:
> On Sun, May 10, 2026 at 8:14 AM Justin Suess <utilityemal77@gmail.com> wrote:
> >
> >
> > Any help or guidance on this would be appreciated!
> 
> sorry for the delay. Everyone was at lsfmmbpf for a week+.
> 

No worries! I hope it was an enjoyable trip and I look forward to
hearing about the conference.

> All of the solutions so far are way too complicated.
> bpf_kptr_xchg() has to remain inlined as single atomic xchg
> without slowpath otherwise it ruins the concept
> and makes usage unpredictable.
> 
> Let's step back.
> What is the issue you're trying to solve?
> 
> the commit log say:
> 
> > A BPF program attached to tp_btf/nmi_handler can delete map entries or
> > swap out referenced kptrs from NMI context. Today that runs the kptr
> > destructor inline. Destructors such as bpf_cpumask_release() can take
> > RCU-related locks, so running them from NMI can deadlock the system.
> 
> and looking at selftest from patch 2 you do:
> 
> old = bpf_kptr_xchg(&value->mask, old);
> if (old)
>   bpf_cpumask_release(old);
> 
> so?
> bpf_cpumask_release() is fine to call from any context,
> because bpf_mem_cache_free_rcu() is safe everywhere including NMI.
>

My mistake on that. I picked a bad example for the test, but the test is
just exercising the nmi dtor path, and doesn't rely on the particular
type of kptr. I just picked one that was easy to acquire a reference to.

This dtor is safe. task_struct dtor, cgroup dtor, crypto_ctx dtor are
not. I've annotated why here:

crypto_ctx:

  __bpf_kfunc void bpf_crypto_ctx_release(struct bpf_crypto_ctx *ctx)
  {
  	if (refcount_dec_and_test(&ctx->usage))
  		call_rcu(&ctx->rcu, crypto_free_cb); /* UNSAFE: call_rcu */
  }
  
  __bpf_kfunc void bpf_crypto_ctx_release_dtor(void *ctx)
  {
  	bpf_crypto_ctx_release(ctx);
  }

task_struct:

  __bpf_kfunc void bpf_task_release(struct task_struct *p)
  {
  	put_task_struct_rcu_user(p);
  }
  
  __bpf_kfunc void bpf_task_release_dtor(void *p)
  {
  	put_task_struct_rcu_user(p);
  }

  void put_task_struct_rcu_user(struct task_struct *task)
  {
  	if (refcount_dec_and_test(&task->rcu_users))
  		call_rcu(&task->rcu, delayed_put_task_struct); /* UNSAFE: call_rcu
      */
  }

cgroup_release_dtor is more complex, goes through ultimately through
callbacks to:

  static void css_release(struct percpu_ref *ref)
  {
  	struct cgroup_subsys_state *css =
  		container_of(ref, struct cgroup_subsys_state, refcnt);
  
  	INIT_WORK(&css->destroy_work, css_release_work_fn);
  	queue_work(cgroup_release_wq, &css->destroy_work); /* UNSAFE:
    workqueue */
  }

More generally, unless it's a BPF allocated object or doesn't rely on
locking/call_rcu or workqueues, the dtor is unsafe.

> hashtab introduced dtor in bpf_mem_alloc,
> so bpf_obj_free_fields() and corresponding dtor's of kptr-s
> are called from valid context.
> 
> What is the problematic sequence?

So from the beginning stepping back.

The problematic sequence:

1. ref kptr (i.e task_struct, cgroup, crypto_ctx) xchg'd into map. 

2. in a tp_btf/nmi_handler (NMI CTX) program we drop the item from the map
   with that referenced kptr field.

3. dtor runs in the nmi context

4. dtor runs call_rcu/queue_work/some bad thing in nmi, causing deadlock.

You can see this demonstrated in my task_struct reproducer [1].
It causes a deadlock by deliberately releasing the last reference to a
task_struct via a ref kptr in nmi, getting it to call_rcu and deadlock.

The typical solution to this is to run the nmi unsafe code in non-nmi
context by offloading to NMI work, as you proposed.

The problem is we need space to for the jobs we enqueue. The required
information to run the dtor is the dtor function and the original object
pointer. The number of dtors that can run in a single tp_btf/nmi_handler
prog is nearly unbounded.

The other problem is even though bpf_mem_alloc is safe in NMI generally,
we cannot allocate in path that destroys an object. If the allocation
fails due to memory pressure, we leak the object.

There are a few options, all with drawbacks.

1. Dynamically allocate the job. Non-starter, failing to allocate is
unrecoverable, memory pressure means we can't ever schedule the dtor to
run.

2. Store job ntrusively in the object : Requires a safe place to place
it within the object. Bad because not all objects have a space we can write to.
Non-starter.

3. Within the map slot (after actual kptr): Taken with my initial approach in v1.
Significant complexity and requires per-map changes. Feasible but very
complex and would need DCAS or locking to make updating the map slot and
our job information atomic.

4. Wrapping the kptr in a box and storing it in place of the kptr [2] :
Proposed by Mykyta. Would break direct load access to kptr objects.

5. Make every dtor nmi safe individually. This would require a lot of
duplicated code and require updating every destructor invididually.
Feasible technically, but seems brittle.

6. One that would be the least complex, would be forbidding xchg operations
that can run the dtor in NMI context. That would preserve the inlining fix,
but limit our usage of referenced kptrs in BPF programs that run in NMI context.

The approach here:

7. Allocate a new spot for a free job every time we xchg into the map
and put it in a global list. When in NMI and we run a dtor, we pop a
job from that slot and use it to offload our work via irq_work. If
we're not in NMI we run normally. Downside is this breaks inlining for
ref kptrs.

...

I may be missing something critical, but everything I've looked at
points to this problem being much more complex that it initially seemed.

I'm happy to discuss further and do a respin.

Justin

[1] https://lore.kernel.org/bpf/383afba6-f732-49bc-a197-147b9d8b1a29@gmail.com/
[2] https://lore.kernel.org/bpf/51a054a0-e57f-49dc-9527-36da0535087c@gmail.com/
