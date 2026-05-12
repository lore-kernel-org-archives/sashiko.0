Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92442E413
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 01:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778550184; cv=none; b=rTr/mr7xLMP5MFgIij1f3g+wE3ecPjmgmq+Z8VNLgmDv0I0CRqZRHIIxt2CL5EhhnBedYD03iduF2ckpfYwJNglLzh6HCdwbeEQALVDV562Hw+tBSYFrtMbu8RIDCauvVXOx9A0Z/Ny3ygNxQKQvY1N+kuaWrmTzatfZqYvlReI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778550184; c=relaxed/simple;
	bh=9aPZxZ9GEDO3mZHBLEvJfdZ1DWN/G3/i+bf1/vWS4y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QnPcvbeqzPDISRkWLFWC2zhMqmlIe06neBkd/cRSvWnhx7pW9mRdc3nDGBlCvlo45K2K1HVWfT53gv2PXFckSgb6Md+9CU6bWdhsRgC8E/qFMoWDY/M3oe3SJaRhuYHKTIw9FOvIGYjz4xOn99ukqjV9aPPTNkqlJIwBmWRKASo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=axBCfRUD; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="axBCfRUD"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-65dd9b25829so808551d50.3
        for <sashiko@lists.linux.dev>; Mon, 11 May 2026 18:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778550182; x=1779154982; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gitPRycwEgLL+VEnb9jptgeXMbXBNy650cSINvraLmE=;
        b=axBCfRUDO0pMSm5Zlt5ntVG60Tq1Q1emye02E/2+rQaB8asHUAtCm7SPMUVcno7hHo
         BGLI9zhvE1VBvHUX/dEJce+nmYzI2fXns9QR4ZFNs27tHtAnEWA3kQ4EybKYrNRlLSDI
         zXXV0x8KsyGPUDPfksmeVS3O9CRi7NdTSApLVUjY0Pg30jvWR/p3HcCclkt2Whdan6Mf
         VBa291tSSaLBmpF6Lit4WZ86YdWEO/CqUj4VHQoLSrNzEP+Ye4VFv34J242qwj+lLjyI
         5w0IHmj1SBnH+41/bupJkipt1A5oeZ2h5dh7KlOlJoCbDfXBccOJt3joB+AiA0l/X4+l
         Xkhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778550182; x=1779154982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gitPRycwEgLL+VEnb9jptgeXMbXBNy650cSINvraLmE=;
        b=SlC37JpK5lMcIK5vZZCggXeTLqrdDrK6pNsEgY0Tuag7s04S+IeoOvNI5pMbvBOb9P
         Fw1Y521l1681oagUpD2KUZfS0q4dQqt41DwcoTE+g/Hz+4HQ6dByGdin+r3FRFR9GLK5
         sOQq/IUFxd68F/cvMppKkIesXDmVMjNj7l9xqAhxektZ0ndGbkZzkwuSJoF4ROS6zHxd
         gSdLkryFTXq9iZykjB0bKf+GEat3FqWZG0ip4jCzFf3Exuqq+O2RUPIIRqxDynh+/fgu
         X7OcStP2F02KBaFX6o8myqhwmP2xNd1c/U+OfICV8CZh13Mh0YP0f3TGIX0sJuAG4Civ
         Fp6w==
X-Forwarded-Encrypted: i=1; AFNElJ9JemKfCLHlCrzKRYrHwrTWIFPhfCg1NoU2oE+DoxR0F32uPE1LQTMAoiT1Nk9dxwlo4e+q9Cb5@lists.linux.dev
X-Gm-Message-State: AOJu0YwQUoZeFsqq/gDQEPyKREEjpw06m4ku14G8ByxDygzKG04tlLXz
	NiZubv+B8V8S9cFW25c6CGegAJJRY4iyC3UslbSjHtjBKPZPTSsFDmu2
X-Gm-Gg: Acq92OHJ1V4un+DT7eXC6Qscs+oNfsX7jSB6t/Fw/QWHEgTdptXp9/KFfqCmZRB2YSL
	L7Qw4Hh2u093Tq3m41q+b48u2GEehPS2bHajAfYVvba3fzKQMZ58VWhY2qqffSnvDH/vp05FUCm
	lnpB/XPvfYo3ahDPbLA2/7oLjwIIY2T6NzKPzN3wz7agSzgHn3L++oaU06RzkNr1g1yD+zNQ/T9
	o1tTcEQ9EqL5NkDSTlXKdGO0C3gnMHzQ7EupJaJsf7dCFgdHa9I79Aw+BDy77sixSIM2M1eHPUK
	rQC7InsFO3RjFWIqz9ewfRBfA/IQEef7CE1r0zGxl91dpu5xIvOKO9lN8DHAQyVCDUmQ+Whz4Up
	s/t/qgO9VO3o/PKMNYisbwMva4ww0pPi2MDziLmfVpddEJcEH0Rghvgk6m0+vSj2PvwfQUuFkQO
	eNxNjrEbZKhherjyTDSLsCYJcGnYl73W4mHFVqNAck1TlNEjHaoqILqHZcmw==
X-Received: by 2002:a05:690c:6e83:b0:79e:8299:7505 with SMTP id 00721157ae682-7bfb71f574emr158086697b3.6.1778550181848;
        Mon, 11 May 2026 18:43:01 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:6d1b:2c6f:d117:7f3e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683836asm160951577b3.25.2026.05.11.18.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 18:43:01 -0700 (PDT)
Date: Mon, 11 May 2026 21:43:00 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, 
	sashiko@lists.linux.dev, bpf <bpf@vger.kernel.org>
Subject: Re: [bpf-next v3 1/2] bpf: Offload kptr destructors that run from NMI
Message-ID: <agKBE4Ci4_LmJ1Dc@zenbox>
References: <20260507175453.1140400-2-utilityemal77@gmail.com>
 <20260507234520.646C4C2BCB2@smtp.kernel.org>
 <agCXEJKJh-JGMhjG@zenbox>
 <CAADnVQJdFCFJcg0Pqdnx=D2h5vHj_q4mrwSJYxRC5RW0NTFNvQ@mail.gmail.com>
 <agEnc0aYMhuIeDlq@zenbox>
 <DIFYUK5DKGAT.189D9YYSQFCUZ@gmail.com>
 <agH_0MEw4b0pB11-@suesslenovo>
 <DIG0ONMVOP0L.3QFYUPWFSKWI4@gmail.com>
 <CAP01T75942V+wKJD0yhs8yb7U5vj+y9s6efJ+UdpTMfzP31CWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP01T75942V+wKJD0yhs8yb7U5vj+y9s6efJ+UdpTMfzP31CWg@mail.gmail.com>

On Mon, May 11, 2026 at 10:10:07PM +0200, Kumar Kartikeya Dwivedi wrote:
> On Mon, 11 May 2026 at 19:29, Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > On Mon May 11, 2026 at 9:38 AM PDT, Justin Suess wrote:
> > >   [   21.604660] Call Trace:
> > >   [   21.604662]  <TASK>
> > >   [   21.604663]  dump_stack_lvl+0x5d/0x80
> > >   [   21.604666]  print_usage_bug.part.0+0x22b/0x2c0
> > >   [   21.604669]  lock_acquire+0x295/0x2e0
> > >   [   21.604671]  ? terminate_walk+0x33/0x160
> > >   [   21.604674]  ? __call_rcu_common.constprop.0+0x309/0x730
> > >   [   21.604679]  _raw_spin_lock+0x30/0x40
> > >   [   21.604680]  ? __call_rcu_common.constprop.0+0x309/0x730
> > >   [   21.604682]  __call_rcu_common.constprop.0+0x309/0x730
> > >   [   21.604686]  bpf_obj_free_fields+0x118/0x250
> > >   [   21.604691]  free_htab_elem+0x85/0xd0
> > >   [   21.604694]  htab_map_delete_elem+0x168/0x230
> > >   [   21.604698]  bpf_prog_f6a7136050cb5431_clear_task_kptrs_from_nmi+0xeb/0x144
> > >   [   21.604700]  bpf_trace_run3+0x126/0x430
> >
> > that's better.
> > Looks like we moved bpf_obj_free_fields() into htab_mem_dtor(),
> > but left check_and_free_fields() in free_htab_elem().
> >
> > I think the fix is to remove check_and_free_fields() from ma path in free_htab_elem()
> > and fallback to bpf_mem_alloc at map create time when map has kptrs
> > with dtors. Even when BPF_F_NO_PREALLOC is not specified.
> >
> > Kumar,
> >
> > thoughts?
> >
> >
> 
> Yeah, removing it from the path that helpers can invoke seems simpler.
> Remember though, this splat is just for hashtab, we have similar
> bpf_obj_free_fields() in array map on update. I think fundamentally
> the main issue here is that we logically free special fields when a
> map value is freed or deleted. When updating array maps we logically
> 'free' and then 'update' the same map value together. For hashtab, it
> happens on update/delete.
> 
> We could relax this behavior to avoid eagerly freeing these special
> fields on update or deletion. The only worry is how this would impact
> programs that have come to rely on the existing behavior. There are
> patterns where people expect kptr to be NULL on some new map value,
> which causes programs to return errors when that expectation is not
> met. Just doing the skip when irqs_disabled() doesn't save us from the
> surprise side-effect. We need to decide upon this first before
> discussing the shape of the solution.
> 
> This is the theoretical concern; In practice, I think most people who
> depend on such behavior use kptr in local storage maps (in
> schedulers). So it probably won't be a problem in practice, even
> though we can't judge this ahead of time. Also, we eagerly reuse map
> values when using memalloc, so the guarantees are already pretty weak
> I guess.
> 
> So, if we are not going to go through a grace period (like local
> storage) and free back to kernel allocator before reuse, we should
> relax field freeing behavior. At best, we should cancel work for
> timer, wq, task_work, and task_work, leaving other items as-is. E.g.
> BPF_UPTR is used in task storage which I think is accessible to
> tracing programs, I am not sure how safe unpin_user_page() is when
> called from random reentrant contexts. We might have more cases in the
> future, we cannot guarantee we can handle everything in NMIs
> universally.
> 
> So the best course of action seems to be relaxing
> bpf_obj_free_fields() to bpf_obj_cancel_fields() that just does cancel
> on async work (timer, wq, task_work) for delete / update and let other
> fields be as-is. We likely need to do bpf_obj_free_fields()
> additionally before prealloc_destroy() now, but that should be simple.
> Whether or not to use bpf_ma when kptrs are used in prealloc map is a
> separate change.
> 
> This should hopefully resolve the issue, unless I missed other cases.
This does sound good, so you'd set the bpf_obj_free_fields up in the
htab allocator dtor for the final free and rely on the allocators
existing nmi deferral?

The missing piece is whether to handle this differently in NMI or just
always do it with the deferral. Also the prealloc question needs
answering.

This fix would preserve the xchg inlining and allow for failure with
ENOMEM on exhaustion and not need weird locking or atomic counting.

Appreciate the time from both of you learned a lot more than I wanted to
about NMI than I bargained for writing this. There's probably more weird
NMI cases. FWIW there are zero tp_btf/nmi_handler progs anywhere I can
find on the internet so this is a weird edge case.

Since I brought this issue up I'll finish it out and send patches next
week.

Even if generic file kptr isn't possible hopefully this can stop sashiko
from complaining about every new kptr dtor getting introduced being unsafe in NMI :)
