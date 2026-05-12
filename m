Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322E0246783
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 01:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778550446; cv=pass; b=CkrHlHrMtSe9SfKkBWymd60gZwHcksavQzy3Eh2CZQdw5aTV7LkHiWN5Tg/Iz51EQYVvZjLsiF8Bb+XMfJ0OYryEyx13zjgqAukijmigNZMpEI1bpxLdlmmlOOf4RNfZ8FHfhiNJ32FzRnNUZV4ut78pmnavMF3ZWhS6SOtVkjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778550446; c=relaxed/simple;
	bh=mFt92ofFDbwAC8EJ3kykHIJ/05AZydy2HsAIgWaa1+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MF1/33n0DrWzXe9kUaJwABRhfTvaWaOlDiV1Sy/BhS0UkCCkJB5PEKHjtO3ww+P5qkR4JAuhuKQgJQi0Tq0NopSr94JSB6oCZCOnzBIIlCYHmPzq7x4MU5IfWlH2rE40yEcilrnwpxuteow6+NoYDpvqI37GRmb1Z3pCIRu2Reg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRMnVAEB; arc=pass smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRMnVAEB"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-43d7645adbdso2660886f8f.1
        for <sashiko@lists.linux.dev>; Mon, 11 May 2026 18:47:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778550443; cv=none;
        d=google.com; s=arc-20240605;
        b=hFdQnUzF4RCZM7oi5+Y83kSGy7JQrriWiSoxtFXYDZ8VSIKIwEzcKvDysp62ti3B3t
         FxmK6VPzt+VLTZeRNJsuss6SMf6cd7vmtRoA8D/5ymyXljVqdiko3y57F2H1thAGUIx2
         olyTGM/LO+btIOVmL1+kWq60SEB5pEukUW5/bpu2dguchGy2hncQQHfK8vCdtvuIBZRk
         ztGdop6/E/79CIIUGm7Fr+4FALgnNWh0DwKCwh032/gHJo5q0cBT3KCB0TJLFQYO9v5U
         LdqX1znvxYwbn+yVxgogO2KfSiTqCXQ6DmPGx1RcldH15DnaKerKgvcyLBU4gsmvUWv2
         F+cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=un0iP/nox0BXovMp0KiT5LCQ2CB0LlZftLKctJu7a7A=;
        fh=kCTqXLt0E2ZC0PMhqKsUyG4kqjk//0TDqqqmhMqFLq0=;
        b=TKQimVJugcfdUoVPPWKrYlTUuUHBh5L+BJV51w/omkGFhr5iMHzpDOamzC4iwRX72c
         unsXGTUZBYjTKTOnNh9UeHGOedU8TAzrQ9jpvOxupr1D1hgkifJpwcrdyOxFAzlZvOmg
         XHP5TmewPqE4tKiU+JJ2xZscYvtoF+Y5CNt+ocxqmUVrBfhHDR07F5N6DaAsXED1hSGD
         5hxJXmwt02cCJsnPpZy14Kmpyh0HKeA9yRK/mKKGLGB38QFK/S1fbIRes15ETmTzI2cj
         4QIueGEqgC1Y4o+iV9yRVTtVBvDGHin5ZNZreVhT2SjKK8R/DCNnIShILuABS6Oyx5jb
         EfkA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778550443; x=1779155243; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=un0iP/nox0BXovMp0KiT5LCQ2CB0LlZftLKctJu7a7A=;
        b=TRMnVAEBOEdCQ9+hai8H5AOLc7HsZi6LUjSJMN/fNbe8E6ZAIyp5Nt6somU0XYYCBM
         qLGh96EK+HKwniaPCi2a4wMxu2j2rPeAsn29lHA83IruhxAwsd/NIQb54wMD4xJcTiMT
         AB3XKhXBOtvvrILIvcyz1GIN095smlvXFWZKLx8qx2mQyDA2gCz0d3CpTGLEdvpayZPh
         QvuUkU7ES8srAEokrbQ1Ck7A9X/AnT/LlKhIbcVu7QgSjBWphMig4hLNXwOjODHv+Jus
         cS26160dVUaVyke4QFtuk6HLpl905vG4g8kK/AHvGSS5JI3Q/+i6qCWEOvOwTcN+sqHx
         hufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778550443; x=1779155243;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=un0iP/nox0BXovMp0KiT5LCQ2CB0LlZftLKctJu7a7A=;
        b=mA1Mr3b6QBsLrltEJVkn2v9SGgL00k2FSgHVNHMEp5CPSQhB/HQV6js8+GMAOgw+8K
         d0ZXWn6rh5+DOKfIlsdM/w1XRJ1dOmgYyWBnQq9qvqCNHPgZmFdFU2L8moFOY2Wr2Ll7
         6fdyKkqp041ZUGGbks67PKJWA7znBwT+My/hvOBs5OtiGbPxtSyUkl/FJsoE4mqVpwkZ
         lF9aXEmAzZscvhD+uhZKLaQ+U+S/Nx0RHOpkNQzVRSPBgmglrdJNThFYPhf+5SpYJRYm
         PtEARQLixhMLPmGms2gbTLVF9JwoyT8zo+mIZxVxSHwk2KqFsicC2mHw4/Vm4SSMsbLm
         F/Ww==
X-Forwarded-Encrypted: i=1; AFNElJ+AjWE50veP/MDYoAo2XxP1x9G3hiou8Z1P2HMwgdvoi2ayb/9SGrSk3I9/gad5MYFRZEcejlKQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyYa55GOw+9GzI/gz1ucg4GiituKhA6zsfe5b01UQI6bUj9JTY2
	Pj8WnfIiUAVpGw1F8rHqEaKyT6MvWq17ZYdMks0iPSLZ7Ku/o+vnaDKxnlw2WUQuiCX8UzTVL5s
	L41lgsD4Xrg5XbDlnmWKn190ymeM1np0=
X-Gm-Gg: Acq92OHhwQRPC2t7h2MltM6g+boS4og0ljYyUJqfN2tm9sATNfmTHBpxqeJLWWoSNnf
	rIHhYuwEKf91MPvxiYlqfz6bd6+a2Phi+zSFNmr9NPX9WcRVFWaAkjV7bQz0+G9s+kSMbmLm7lT
	9/+PahWg3FwGkRzDNBP/Ex7KgkOY4E5ZCjRJPWlVHwnBnmk8EHAes42rNjqKr+005RHG4NpnSLy
	1fmCbfFXzSp6z36ny1zSskwNvJCGkKF7nUtaYFW9DXjnbe0kMIVfWh0bVxlXa7gqt6Tbvs/kRMZ
	KDUn224sXIZWDA5tGGNy4qdQtgcflY6HtF+jbnCwHdxbAOKFVeIypYhxHAr5ZuL86T8UcFHcCtc
	7bsjcN4EUMuadRjxwl5VbozWQs163UHkNdjXycMc/6VXBQ+/OlQpi07MW
X-Received: by 2002:a05:6000:2483:b0:451:2157:6291 with SMTP id
 ffacd0b85a97d-45b14adc11bmr833840f8f.41.1778550443320; Mon, 11 May 2026
 18:47:23 -0700 (PDT)
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
 <CAP01T75942V+wKJD0yhs8yb7U5vj+y9s6efJ+UdpTMfzP31CWg@mail.gmail.com> <agKBE4Ci4_LmJ1Dc@zenbox>
In-Reply-To: <agKBE4Ci4_LmJ1Dc@zenbox>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Tue, 12 May 2026 03:46:47 +0200
X-Gm-Features: AVHnY4LK2w3gCkV7Ol2pg6asG_4E6xJevb-hMpBHMd-CD5fc-bV1lEo2ez45e-s
Message-ID: <CAP01T76i3S93kvXnQvK+NU1ee82s+ka2jQfmf-yL86r9AS2tuQ@mail.gmail.com>
Subject: Re: [bpf-next v3 1/2] bpf: Offload kptr destructors that run from NMI
To: Justin Suess <utilityemal77@gmail.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, sashiko@lists.linux.dev, 
	bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 May 2026 at 03:43, Justin Suess <utilityemal77@gmail.com> wrote:
>
> On Mon, May 11, 2026 at 10:10:07PM +0200, Kumar Kartikeya Dwivedi wrote:
> > On Mon, 11 May 2026 at 19:29, Alexei Starovoitov
> > <alexei.starovoitov@gmail.com> wrote:
> > >
> > > On Mon May 11, 2026 at 9:38 AM PDT, Justin Suess wrote:
> > > >   [   21.604660] Call Trace:
> > > >   [   21.604662]  <TASK>
> > > >   [   21.604663]  dump_stack_lvl+0x5d/0x80
> > > >   [   21.604666]  print_usage_bug.part.0+0x22b/0x2c0
> > > >   [   21.604669]  lock_acquire+0x295/0x2e0
> > > >   [   21.604671]  ? terminate_walk+0x33/0x160
> > > >   [   21.604674]  ? __call_rcu_common.constprop.0+0x309/0x730
> > > >   [   21.604679]  _raw_spin_lock+0x30/0x40
> > > >   [   21.604680]  ? __call_rcu_common.constprop.0+0x309/0x730
> > > >   [   21.604682]  __call_rcu_common.constprop.0+0x309/0x730
> > > >   [   21.604686]  bpf_obj_free_fields+0x118/0x250
> > > >   [   21.604691]  free_htab_elem+0x85/0xd0
> > > >   [   21.604694]  htab_map_delete_elem+0x168/0x230
> > > >   [   21.604698]  bpf_prog_f6a7136050cb5431_clear_task_kptrs_from_nmi+0xeb/0x144
> > > >   [   21.604700]  bpf_trace_run3+0x126/0x430
> > >
> > > that's better.
> > > Looks like we moved bpf_obj_free_fields() into htab_mem_dtor(),
> > > but left check_and_free_fields() in free_htab_elem().
> > >
> > > I think the fix is to remove check_and_free_fields() from ma path in free_htab_elem()
> > > and fallback to bpf_mem_alloc at map create time when map has kptrs
> > > with dtors. Even when BPF_F_NO_PREALLOC is not specified.
> > >
> > > Kumar,
> > >
> > > thoughts?
> > >
> > >
> >
> > Yeah, removing it from the path that helpers can invoke seems simpler.
> > Remember though, this splat is just for hashtab, we have similar
> > bpf_obj_free_fields() in array map on update. I think fundamentally
> > the main issue here is that we logically free special fields when a
> > map value is freed or deleted. When updating array maps we logically
> > 'free' and then 'update' the same map value together. For hashtab, it
> > happens on update/delete.
> >
> > We could relax this behavior to avoid eagerly freeing these special
> > fields on update or deletion. The only worry is how this would impact
> > programs that have come to rely on the existing behavior. There are
> > patterns where people expect kptr to be NULL on some new map value,
> > which causes programs to return errors when that expectation is not
> > met. Just doing the skip when irqs_disabled() doesn't save us from the
> > surprise side-effect. We need to decide upon this first before
> > discussing the shape of the solution.
> >
> > This is the theoretical concern; In practice, I think most people who
> > depend on such behavior use kptr in local storage maps (in
> > schedulers). So it probably won't be a problem in practice, even
> > though we can't judge this ahead of time. Also, we eagerly reuse map
> > values when using memalloc, so the guarantees are already pretty weak
> > I guess.
> >
> > So, if we are not going to go through a grace period (like local
> > storage) and free back to kernel allocator before reuse, we should
> > relax field freeing behavior. At best, we should cancel work for
> > timer, wq, task_work, and task_work, leaving other items as-is. E.g.
> > BPF_UPTR is used in task storage which I think is accessible to
> > tracing programs, I am not sure how safe unpin_user_page() is when
> > called from random reentrant contexts. We might have more cases in the
> > future, we cannot guarantee we can handle everything in NMIs
> > universally.
> >
> > So the best course of action seems to be relaxing
> > bpf_obj_free_fields() to bpf_obj_cancel_fields() that just does cancel
> > on async work (timer, wq, task_work) for delete / update and let other
> > fields be as-is. We likely need to do bpf_obj_free_fields()
> > additionally before prealloc_destroy() now, but that should be simple.
> > Whether or not to use bpf_ma when kptrs are used in prealloc map is a
> > separate change.
> >
> > This should hopefully resolve the issue, unless I missed other cases.
> This does sound good, so you'd set the bpf_obj_free_fields up in the
> htab allocator dtor for the final free and rely on the allocators
> existing nmi deferral?

It is already set, except for prealloc maps. But we can call it before
destroying the pcpu freelist etc.

>
> The missing piece is whether to handle this differently in NMI or just
> always do it with the deferral. Also the prealloc question needs
> answering.

There is no deferral here. I'm saying that we just cancel for timer,
wq, task work, and leave other fields as is. So we don't have active
work pending for async items.

So as long as the item keeps getting recycled in the allocator, we
don't free these fields. Once the memalloc is destroyed, the dtor runs
in a known safe context where we can assume bpf_obj_free_fields won't
deadlock or run into any problems.

>
> [...]
