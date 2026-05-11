Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA5C37F739
	for <sashiko@lists.linux.dev>; Mon, 11 May 2026 20:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778530246; cv=pass; b=aAYwI/JBMl1L/kyomT17UrllMm4rl8hmN7lleoLninAu/Qb1z6AglJr7buHADapeVQqJY52yr8Hidj6t+z2SgKH7lT19todItXjx8QdR5P/LHJmpyvkjwN/LaJoVAcKt1DE2qxGolHCRPONOOrdn9tAleYce2XE7mNPq/noMcr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778530246; c=relaxed/simple;
	bh=O3q+sWm+2qH8YKJrtBOMduCqmSL8cmGP3auMa2HveU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gaaY0yAWkIWpik2kVxSF+j7pOrxHoZdLMjntVd95DA6pCPOW/blc/Su4lTQf/KIsZ1W66xIAjzE7JuYO0gZmq2ZhLhICMZ6fX6/9Qz6E/l0x3SX3utDhPdlK7oAxGFFVxMSLt0XUe+V21TPOD8tdcTUB5U4+1TH45LVFZ8GRE6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ktq7uOyw; arc=pass smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ktq7uOyw"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so46742745e9.2
        for <sashiko@lists.linux.dev>; Mon, 11 May 2026 13:10:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778530244; cv=none;
        d=google.com; s=arc-20240605;
        b=dfzIY6CBDECvhfBnaknF2L01tgVNkWij2BlFMRAn/wqE+JOxCJzQzXEcLEc5mkafgM
         rSS7EeSgDh2T9AEbwJOauL4LVi5YE8bgk1GeqFgVYeUYwyYXbkQHJ+g9AIBs0+xY6ke9
         h5ZCFWF9pE4Stioey+8CkHOECMjD4sj5EjJTYE1nSO4jBJfkWADykd4y53BnkghDOksp
         vlEqHV4zqk/1TcRNH5hvZskPEDYpRBdjuidjON/iC6se4iJTTshXzSqMvoG3utVC4/3h
         mzqhJvMKR2JhizF4KkKzEPg7LQ16WDeDiO1eDgl/G9v3l0s5/ATEuSxKMctGeYklxIR5
         ki+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZeAu1KBS/N3eyE3IFqT3qbkaYSHyiTjllPRUlF208lo=;
        fh=zLD4DZDzdRbmEbmrwbqf6PIQUoXOzw55uC7na1NMzIM=;
        b=S3SikqcVZlQJi83Rqtl5LDpp8Ea3NZ3xyev6SMnhA8GMTEXrdVx/vLfl3t9CeboyK+
         T9aLKx5rMkYCJfWllZ9o86i28n407dQAiTXFtv8HDSbquh9bLrauStGnfNvx6tQu1Bbu
         zj1c7Ozaq0E73pWSG+Gwfo0OtO/lNHO/DTNGEYDuVjE/0dNhtDDcFQj5Lnh0zA0uUg3X
         thb25acXjt3gxGXzmXr/iI3ZXUfGJCeU2xckDjpfbe6cuC7An+ARHemU3QLjYBKNK19b
         gF0k4Rtsdmz+5l/r++S+7YqOX35vqJX9jXgylYak/uWbWVNifIXXW5H8jz3K9nnhB6Kg
         wuzA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778530244; x=1779135044; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZeAu1KBS/N3eyE3IFqT3qbkaYSHyiTjllPRUlF208lo=;
        b=Ktq7uOywuRQFA1KOEdEmgnwelXafYQNYGc2tTU7hinm4Uwt5u1VprUB8fQY6h82gDT
         461R/wUTDHZEWEgg/2AUaSQT4oD1Fl5hR4E/pebF6uqz6+bQJANnkW4MRqcEwX5tlU+e
         fhDqwwTlohATSwnifF9dXgE1ixQXbOHEUa26X75mgFbRFIEjFu2n0JyAteU87gyoKEsO
         xhbP+o+mNiwCKlO87h0hN9CRTXRVyH2MptScn5imwIeFz7CdepNgYOfRyIaDmAQ17ylX
         /GkGlVU0a+suWIHBmjzblL/eyCetfs5DijZK122X1Sn0fd14XmN3phPv/pe7no6VE4xS
         RGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778530244; x=1779135044;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZeAu1KBS/N3eyE3IFqT3qbkaYSHyiTjllPRUlF208lo=;
        b=JVECPHDnuG5dXnkoP2PKciL3LkvfJ7oJP8xml6Dp3GCbvdVJZb7YcTjpJqy415NKOi
         RQhvjCDoXxbp1hVUov6onkW0TKghcEeyHR+43kFRwa4os9rdEl5+iTp5hXtdKvnMVeNU
         sdhyT6ZpksvW/5eP7yH8pD5KcWNLaJ+0wFha0aNF/gsbjiYCz+WwGATYJ0aSp6WP+ph4
         m4KBV6LHK6EbrpEjW3PnSXFhd5xYzWkt3vplfad3r3xU1HuRhSrVDq7MV4MTA8DCLURs
         e9yo+8askNpa2MXMRZUvyQfcVU/kJLAv57ZWmGos8Dez3iTAyHaCpEWCyzuJva3eRT4H
         V6GA==
X-Forwarded-Encrypted: i=1; AFNElJ9wHzU4RRe9bew5tgv9PPP9RgJd8Pf8BcwN3x25ZQX5tpfICwduzkFKuGbp5aSynW9f/P1MxaW0@lists.linux.dev
X-Gm-Message-State: AOJu0YznCFx1NJ07spSIBsSNZAU0bUDykIWG97uPM1sLnN9nGMobYCXX
	3q0byJRWPUCUB7r5F8yKCbCSeMd4wUAGWbOUd3cdTh7s1T2A8lAJLgkfDkQkjxWZcJKn5zTLSnd
	VX8UdGKsreqKlsrgSjD0/iileSp0aSTo=
X-Gm-Gg: Acq92OFgJxCuoJO0ItDzc6gnOCLve/7XmZLQqANLRe1R2wGE2OBx8pqgj9prE05kzNJ
	GbpOIueim1qiR9j63FPx12KPEc/w5jVO81zCswVhtU0olCywaOEFtjcNO3DDcyPxA0irZyXUfPM
	BlvuZrnixpspN+YjznvMhWMLS4w+cbrXGRKU6wHDdU/kZggEw7i2xupn+X1jrqC7QA+zrb42Hg/
	Ske4lyPo5tUQL+sez+WD0Zv+L1zKVkS9wY13GvPOXwn8M9Ts8fJ0+90UNNuOgBtZmd5eernnTaT
	VUmDgzz08EFVeE8uS77Z8teBuZppCk7m0wiDC/2OgCfZm+OntA4GIsw2/iLoiFmPuVJ/nKSMWsG
	VEPkkDyUnZbIrQzbfKyJXGBVZPV/NtH80H0Ux7PNdZ/w9F8vVKj2fNR91fg==
X-Received: by 2002:a05:600c:4f8e:b0:48a:f18:ece4 with SMTP id
 5b1f17b1804b1-48e8fe7d245mr627405e9.24.1778530243488; Mon, 11 May 2026
 13:10:43 -0700 (PDT)
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
In-Reply-To: <DIG0ONMVOP0L.3QFYUPWFSKWI4@gmail.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Mon, 11 May 2026 22:10:07 +0200
X-Gm-Features: AVHnY4L-r9S0lVWrMl22FV0Sj1kUhVTnj6E46hXmJB-Pmw77jkoGnRhHec5qAa8
Message-ID: <CAP01T75942V+wKJD0yhs8yb7U5vj+y9s6efJ+UdpTMfzP31CWg@mail.gmail.com>
Subject: Re: [bpf-next v3 1/2] bpf: Offload kptr destructors that run from NMI
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Justin Suess <utilityemal77@gmail.com>, sashiko@lists.linux.dev, 
	bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 May 2026 at 19:29, Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Mon May 11, 2026 at 9:38 AM PDT, Justin Suess wrote:
> >   [   21.604660] Call Trace:
> >   [   21.604662]  <TASK>
> >   [   21.604663]  dump_stack_lvl+0x5d/0x80
> >   [   21.604666]  print_usage_bug.part.0+0x22b/0x2c0
> >   [   21.604669]  lock_acquire+0x295/0x2e0
> >   [   21.604671]  ? terminate_walk+0x33/0x160
> >   [   21.604674]  ? __call_rcu_common.constprop.0+0x309/0x730
> >   [   21.604679]  _raw_spin_lock+0x30/0x40
> >   [   21.604680]  ? __call_rcu_common.constprop.0+0x309/0x730
> >   [   21.604682]  __call_rcu_common.constprop.0+0x309/0x730
> >   [   21.604686]  bpf_obj_free_fields+0x118/0x250
> >   [   21.604691]  free_htab_elem+0x85/0xd0
> >   [   21.604694]  htab_map_delete_elem+0x168/0x230
> >   [   21.604698]  bpf_prog_f6a7136050cb5431_clear_task_kptrs_from_nmi+0xeb/0x144
> >   [   21.604700]  bpf_trace_run3+0x126/0x430
>
> that's better.
> Looks like we moved bpf_obj_free_fields() into htab_mem_dtor(),
> but left check_and_free_fields() in free_htab_elem().
>
> I think the fix is to remove check_and_free_fields() from ma path in free_htab_elem()
> and fallback to bpf_mem_alloc at map create time when map has kptrs
> with dtors. Even when BPF_F_NO_PREALLOC is not specified.
>
> Kumar,
>
> thoughts?
>
>

Yeah, removing it from the path that helpers can invoke seems simpler.
Remember though, this splat is just for hashtab, we have similar
bpf_obj_free_fields() in array map on update. I think fundamentally
the main issue here is that we logically free special fields when a
map value is freed or deleted. When updating array maps we logically
'free' and then 'update' the same map value together. For hashtab, it
happens on update/delete.

We could relax this behavior to avoid eagerly freeing these special
fields on update or deletion. The only worry is how this would impact
programs that have come to rely on the existing behavior. There are
patterns where people expect kptr to be NULL on some new map value,
which causes programs to return errors when that expectation is not
met. Just doing the skip when irqs_disabled() doesn't save us from the
surprise side-effect. We need to decide upon this first before
discussing the shape of the solution.

This is the theoretical concern; In practice, I think most people who
depend on such behavior use kptr in local storage maps (in
schedulers). So it probably won't be a problem in practice, even
though we can't judge this ahead of time. Also, we eagerly reuse map
values when using memalloc, so the guarantees are already pretty weak
I guess.

So, if we are not going to go through a grace period (like local
storage) and free back to kernel allocator before reuse, we should
relax field freeing behavior. At best, we should cancel work for
timer, wq, task_work, and task_work, leaving other items as-is. E.g.
BPF_UPTR is used in task storage which I think is accessible to
tracing programs, I am not sure how safe unpin_user_page() is when
called from random reentrant contexts. We might have more cases in the
future, we cannot guarantee we can handle everything in NMIs
universally.

So the best course of action seems to be relaxing
bpf_obj_free_fields() to bpf_obj_cancel_fields() that just does cancel
on async work (timer, wq, task_work) for delete / update and let other
fields be as-is. We likely need to do bpf_obj_free_fields()
additionally before prealloc_destroy() now, but that should be simple.
Whether or not to use bpf_ma when kptrs are used in prealloc map is a
separate change.

This should hopefully resolve the issue, unless I missed other cases.
