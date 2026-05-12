Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762EA383325
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 02:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778551457; cv=pass; b=Hxw78UVXm0H4Q9Lj3K9GrCI7UbPGAlB7gcsEn8UFexJ1a1E/nAA5hRcKPzvmpAOT9Vk8wiQTdhFudVlWOiW5r+GRN4QiKb3+L2EHglEHp6ZUZIbvg/7HDzZu1Pec9hXroLici/XfLHkWdfc5z10meur5/KoIeDjp90wEgWDmw3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778551457; c=relaxed/simple;
	bh=4NeX8+MH64UDuXf7smQyeQqhDeRmzD4GgNcM+hszQsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sdv1nAhwvPPKKTzlzSzkN6u2CVfrU8CUb6WXYKli1/7eXd+mA2TqwBPtwJzWUCbRTz9cMUM+MlO0PTA2dDJ2HN9oeV/9AEcEdISaCivZz5PkSb8fUz3veZZcrPp4TzuUHbNxx91wq7lXXi6jf4qNZDK8FZkFdQr8oorAIwGBzJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pU0AM0z/; arc=pass smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pU0AM0z/"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4891b0786beso32463805e9.1
        for <sashiko@lists.linux.dev>; Mon, 11 May 2026 19:04:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778551454; cv=none;
        d=google.com; s=arc-20240605;
        b=f7kob1NOJSIwxD7b8dJkZaLurDIbfLpilqdtTRjQXxcM3mmyQRw2dtWkPjRUcikMS+
         UBYVtNhrZQLAzQMNd6Ty9SxXVIQrTEVmutqtEQ0D5IgtJzW1xPQ9OdJddVJ6XxAzCOCT
         cXqROrACmm2FEkh/z20lU9Ts0ASZBfSXaruUbwHKYRPHVnia/xTrtpur5cKNUexv9Q1/
         w4fxVHbo3k0liNAd1lBVgP9JdFwv6SS9pV9MONr/PXa1XC49TxgwAJwjjJvceWpkgUyL
         3ne4wq6wdZjV7O4jHHJ3t6xTLyN4ZXk3DxSDO0FF82V8JYX/nZ5kAN8uKgf/kXKZlGbq
         scdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pi6UeXeeuhJXPitUPDrY3aHYuocNazWLnSV3iwa36yE=;
        fh=2ddeCMs3VtxhaeMThgMNt/vfsbO/Fga4FY7o1Mree5U=;
        b=X2KL8MQam+DplLHg/qkXOv8I61yyr+TDj6r2dFsXVFhyLe5TFJvOJau9tZAOoXlJpS
         WtS1UXbsv0egfsPyAdenQgM3q4k0R/0PyuYdM08YIOuLpPJji5F7UaKEuHvSS4gKoB84
         9sGmRMpUlsaGh8ZlhHdmwLdeH2MKzPGB7/iX5muNL7OAcPyJ+vuGvDOCHnoGGUX3BRxA
         ucH1/fi2tO9mkFKZwdZzilNfMzRFah7YVsNmT835wpdgm+Ivx+Rxh+HhIqekF9JZD1bO
         3GBns7Z6Stxh9iP7dC14GH/J/idHuy8Z5Pa7izu6vEPy9cZOFCUys/M0WUTyjx+RpnXb
         dolQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778551454; x=1779156254; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pi6UeXeeuhJXPitUPDrY3aHYuocNazWLnSV3iwa36yE=;
        b=pU0AM0z/jo6u5O1xbDiCQiCFjoNnTTc9MFwL5KEmL72ZcqgUnl1M4KGh+mNUClf3wH
         Z6W91sHDVtngYA9/hr9sv8zgKkBULD1PqB6jOUhBGqkYGDYfG+JaRHrt0gH6tDHR6dJ6
         QDAfMr1j0qQs3+G0N8F2JfWKmFWou7gy6qSPo0OWUJnfXWxixEjV4AAOIdRzyWPA9Ro+
         tPnJBPvGmbtjfTUXe0mcxj0E5GLBsA+AvSV7/wGozCOtBa9XVl867MOH0CHAHriQPavn
         oPDqWkp3xv/Lfwki5idbvAzlI9WH+dZQXnj2VLI4dyaW9d3xqkwVfdJQEmtEQmzmpxKk
         uszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778551454; x=1779156254;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pi6UeXeeuhJXPitUPDrY3aHYuocNazWLnSV3iwa36yE=;
        b=GcUOexSsYXKrDNp+biTrFj+4z52SwRHpBgnqctOvWh0A+EtoxQk5WE8Ml/9E3YN6pu
         ja+CpEy+BMzM/xy1SrLZp/A4JtY3ARL9P3LWyyedkKjbGRb5pYpMEVjM/UDrY7m+tduZ
         G3HNJTCddPR2wJaTZ1bvcUwBMGLVbqCVCQ+gAxNnlyt/JaDSaRqlpD6KJSM8Nu8DPqa3
         dQ/56O1nWtnPActVgkgaScDFBv6DbvhINgRNlk/Ro0MZCluthj4Q7PiJ2awTCX8cyFEV
         hB6P9LkY9iwVD892tT6se7goL5n1F/z6wWf1i1iCc9ZnD2WFItc7YbPO4r2bGdflcynV
         Tv2w==
X-Forwarded-Encrypted: i=1; AFNElJ8kL4vb75JYeM5uFK5qXbrNIWqyROLWZWoZ3ga8euZ+Hc9bcVjRhcFZ+5dQ7VssqEt7uGR7JIW8@lists.linux.dev
X-Gm-Message-State: AOJu0YxaeFfwYxj93q5vqcGe+uSA7ukr3tO01QfSjojxYn0tDvb/a01m
	4yYXR4Ovdaz3s+94KIpmteEKtz1oSRdEdpYBix7pC9w/L9jttoXW2YHJO0SWoMbirMu42REFZY8
	6/BlHaw6Zupgpm34QqwfSuYru8O1WSW8=
X-Gm-Gg: Acq92OEfD1djhaBBEonKWfPQmaldhy6SMJ9wFbWa5+ckU1AVy+dmmvDbvrRkANPK9IU
	hjRY7KGqraF44svqC3U/VSsf7Ld3jNHjyPxPzTkjB83XEGpSdfxcaqJUStMThHrRDfUdukYwpsv
	E/U7YL3I5OptbrSrR4COzKr9jmTLXBtiEHzLWvj+TJI9ME3u1MMyBjFs3eHhuXTcIvlGw4WbEgD
	TsRYD9+MSJN27Qua6pPyqIhMuQDK7RJyA4xqJxQmlBARPfyxU0n0Ob7Jcwd8vMu8yoUO6trTdUn
	6vNwWK8QF7c3QGcrPMM1PRJYZyiIMJSITykLOeH92z9KmC5g6IVLkPqac3ECvGToQyE1E0ZyDtD
	AQVquQ9RVdWgUSOgg7yRQP4Bv38DG3KKI4/4kXcodKqFnNpG9OH3k6t0I
X-Received: by 2002:a05:600c:37c6:b0:48e:7f22:d90 with SMTP id
 5b1f17b1804b1-48e7f7de432mr126415115e9.4.1778551453688; Mon, 11 May 2026
 19:04:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260507175453.1140400-2-utilityemal77@gmail.com>
 <20260507234520.646C4C2BCB2@smtp.kernel.org> <agCXEJKJh-JGMhjG@zenbox>
 <CAADnVQJdFCFJcg0Pqdnx=D2h5vHj_q4mrwSJYxRC5RW0NTFNvQ@mail.gmail.com>
 <agEnc0aYMhuIeDlq@zenbox> <DIFYUK5DKGAT.189D9YYSQFCUZ@gmail.com>
 <agH_0MEw4b0pB11-@suesslenovo> <DIG0ONMVOP0L.3QFYUPWFSKWI4@gmail.com>
 <CAP01T75942V+wKJD0yhs8yb7U5vj+y9s6efJ+UdpTMfzP31CWg@mail.gmail.com>
 <agKBE4Ci4_LmJ1Dc@zenbox> <CAP01T76i3S93kvXnQvK+NU1ee82s+ka2jQfmf-yL86r9AS2tuQ@mail.gmail.com>
 <DIGBOYWXZ95S.3GAGVQGUJNQD4@gmail.com>
In-Reply-To: <DIGBOYWXZ95S.3GAGVQGUJNQD4@gmail.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Tue, 12 May 2026 04:03:36 +0200
X-Gm-Features: AVHnY4K1wmJEXjd98BpUWgRql-KtSFsNveosERGCnbAxSH6F9u3CD74J3am_-ak
Message-ID: <CAP01T75y1CuPQ9af9SgYqY=c+3q7ZXTKJJu=znAE3HtEEBMwOw@mail.gmail.com>
Subject: Re: [bpf-next v3 1/2] bpf: Offload kptr destructors that run from NMI
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Justin Suess <utilityemal77@gmail.com>, sashiko@lists.linux.dev, 
	bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 May 2026 at 03:55, Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Mon May 11, 2026 at 6:46 PM PDT, Kumar Kartikeya Dwivedi wrote:
> > On Tue, 12 May 2026 at 03:43, Justin Suess <utilityemal77@gmail.com> wrote:
> >>
> >> On Mon, May 11, 2026 at 10:10:07PM +0200, Kumar Kartikeya Dwivedi wrote:
> >> > On Mon, 11 May 2026 at 19:29, Alexei Starovoitov
> >> > <alexei.starovoitov@gmail.com> wrote:
> >> > >
> >> > > On Mon May 11, 2026 at 9:38 AM PDT, Justin Suess wrote:
> >> > > >   [   21.604660] Call Trace:
> >> > > >   [   21.604662]  <TASK>
> >> > > >   [   21.604663]  dump_stack_lvl+0x5d/0x80
> >> > > >   [   21.604666]  print_usage_bug.part.0+0x22b/0x2c0
> >> > > >   [   21.604669]  lock_acquire+0x295/0x2e0
> >> > > >   [   21.604671]  ? terminate_walk+0x33/0x160
> >> > > >   [   21.604674]  ? __call_rcu_common.constprop.0+0x309/0x730
> >> > > >   [   21.604679]  _raw_spin_lock+0x30/0x40
> >> > > >   [   21.604680]  ? __call_rcu_common.constprop.0+0x309/0x730
> >> > > >   [   21.604682]  __call_rcu_common.constprop.0+0x309/0x730
> >> > > >   [   21.604686]  bpf_obj_free_fields+0x118/0x250
> >> > > >   [   21.604691]  free_htab_elem+0x85/0xd0
> >> > > >   [   21.604694]  htab_map_delete_elem+0x168/0x230
> >> > > >   [   21.604698]  bpf_prog_f6a7136050cb5431_clear_task_kptrs_from_nmi+0xeb/0x144
> >> > > >   [   21.604700]  bpf_trace_run3+0x126/0x430
> >> > >
> >> > > that's better.
> >> > > Looks like we moved bpf_obj_free_fields() into htab_mem_dtor(),
> >> > > but left check_and_free_fields() in free_htab_elem().
> >> > >
> >> > > I think the fix is to remove check_and_free_fields() from ma path in free_htab_elem()
> >> > > and fallback to bpf_mem_alloc at map create time when map has kptrs
> >> > > with dtors. Even when BPF_F_NO_PREALLOC is not specified.
> >> > >
> >> > > Kumar,
> >> > >
> >> > > thoughts?
> >> > >
> >> > >
> >> >
> >> > Yeah, removing it from the path that helpers can invoke seems simpler.
> >> > Remember though, this splat is just for hashtab, we have similar
> >> > bpf_obj_free_fields() in array map on update. I think fundamentally
> >> > the main issue here is that we logically free special fields when a
> >> > map value is freed or deleted. When updating array maps we logically
> >> > 'free' and then 'update' the same map value together. For hashtab, it
> >> > happens on update/delete.
> >> >
> >> > We could relax this behavior to avoid eagerly freeing these special
> >> > fields on update or deletion. The only worry is how this would impact
> >> > programs that have come to rely on the existing behavior. There are
> >> > patterns where people expect kptr to be NULL on some new map value,
> >> > which causes programs to return errors when that expectation is not
> >> > met. Just doing the skip when irqs_disabled() doesn't save us from the
> >> > surprise side-effect. We need to decide upon this first before
> >> > discussing the shape of the solution.
> >> >
> >> > This is the theoretical concern; In practice, I think most people who
> >> > depend on such behavior use kptr in local storage maps (in
> >> > schedulers). So it probably won't be a problem in practice, even
> >> > though we can't judge this ahead of time. Also, we eagerly reuse map
> >> > values when using memalloc, so the guarantees are already pretty weak
> >> > I guess.
> >> >
> >> > So, if we are not going to go through a grace period (like local
> >> > storage) and free back to kernel allocator before reuse, we should
> >> > relax field freeing behavior. At best, we should cancel work for
> >> > timer, wq, task_work, and task_work, leaving other items as-is. E.g.
> >> > BPF_UPTR is used in task storage which I think is accessible to
> >> > tracing programs, I am not sure how safe unpin_user_page() is when
> >> > called from random reentrant contexts. We might have more cases in the
> >> > future, we cannot guarantee we can handle everything in NMIs
> >> > universally.
> >> >
> >> > So the best course of action seems to be relaxing
> >> > bpf_obj_free_fields() to bpf_obj_cancel_fields() that just does cancel
> >> > on async work (timer, wq, task_work) for delete / update and let other
> >> > fields be as-is. We likely need to do bpf_obj_free_fields()
> >> > additionally before prealloc_destroy() now, but that should be simple.
> >> > Whether or not to use bpf_ma when kptrs are used in prealloc map is a
> >> > separate change.
> >> >
> >> > This should hopefully resolve the issue, unless I missed other cases.
> >> This does sound good, so you'd set the bpf_obj_free_fields up in the
> >> htab allocator dtor for the final free and rely on the allocators
> >> existing nmi deferral?
> >
> > It is already set, except for prealloc maps. But we can call it before
> > destroying the pcpu freelist etc.
>
> htab_map_free->htab_free_prealloced_fields does bpf_obj_free_fields already.
> So scratch my suggestion to force bpf_mem_alloc on preallocated hash maps.
>
> >>
> >> The missing piece is whether to handle this differently in NMI or just
> >> always do it with the deferral. Also the prealloc question needs
> >> answering.
> >
> > There is no deferral here. I'm saying that we just cancel for timer,
> > wq, task work, and leave other fields as is. So we don't have active
> > work pending for async items.
> >
> > So as long as the item keeps getting recycled in the allocator, we
> > don't free these fields. Once the memalloc is destroyed, the dtor runs
> > in a known safe context where we can assume bpf_obj_free_fields won't
> > deadlock or run into any problems.
>
> So the plan is to do
> if (in_nmi()) && case BPF_KPTR* | BPF_LIST_HEAD | BPF_RB_ROOT
> just ignore it?
> And no other changes anywhere at all?
>
> That would be too good to be true :)

I don't know whether in_nmi() would be sufficient, we likely need
irqs_disabled()? At that point, why not always ignore it, since
freeing the fields is dependent on where you're running. I would still
cancel async fields, since they're already any-context safe.
