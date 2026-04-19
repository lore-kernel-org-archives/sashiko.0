Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606A82D839C
	for <sashiko@lists.linux.dev>; Sun, 19 Apr 2026 14:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776608642; cv=pass; b=Iv3IM3bZvJTLyQm9Rz2e1fmb4sc/5zZJdzic0saeCVVsI1ooliQoC76Az5W0/QCaQalIXgDXy2x7sYv53/xdrRSVTK6pyXElYYO2w3l2iG3WRstLpvdFJ+UG6OSn2LgLU51NpN1Lz8RoJCnydgAWVDgf29Fpk/bhuDbNbv3Xrks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776608642; c=relaxed/simple;
	bh=5vWDgxO2UffpKS7zIH+0K8t5jTehWEnK5R86hF2Ikr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E0Ek589lMKC30NbPw6mU9uRSLlrTAvGzwLkemY3LwPWrVX3cmetD2R8p/93wyxxmIsEJ38TApJ+vxz3FpfruCzCm64O7Hp/uZ7OP3KK8F2PL9uKYcbZe60x2/r5d54einDUHznSpHgJc0xxVVdprxZ7OF0ElyviDX7Mkr0tzX3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bX9adWLb; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bX9adWLb"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a0fc5e2c59so2105221e87.1
        for <sashiko@lists.linux.dev>; Sun, 19 Apr 2026 07:24:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776608638; cv=none;
        d=google.com; s=arc-20240605;
        b=G38wROGBu6wX3sVJiiVI9H5PPfAkBnDXMTX2x94Ga/SPp8Pw7WGhjsctvUt8unVFbt
         uvYKzLyeWkR+Dny1VNjk2hyJYcegdZv1gU717/ea96tbL8SxxVIuJvgdIRX0JH0LtQMt
         /A5mu5Y5z/EvpiE5STIqduleg4lHkfTh2QIXbFED9Acc+htmglnBZzRjy1DJj/JAEoEy
         oA4RqmRaax+glrWnjLnUK4q8r1cJDYgP7mqmbsiJLG95T8YUosMu0DNOPV6HxlkQ3QoO
         nUA49WL8drledaOkC+lEy4HYQ2X0HquGLvBQKeXmrBn7FK3FkbycRedzd7gYnUDRYSDy
         Ka+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eDyWThTcQJX4agFw15Ew3AfKnI9O2+hPJiJ8JlGIJTw=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=fyIUYb3IX7I9i7Ai+yw+cWMFUXka/FIfIGWAE2RbKcmb4Zq7++bRqitMCxu1VAL5TE
         EtOVydOU/ZMn4kfi4wng6sKfVdoZMlYtYBZVGF2++R/lcR9y2n2yO4Z2AhrGHcyZKKcm
         rri/VY4A3Dl+Zq0hMRZBHytovtzeI4/RPcubTzYEbeEi/sEtzw+7anRkPoSeMYqCLw2Q
         OXku8kAa47KFfYZZqrNCx5OsrM5mLFZ5W+QPb/W75Y65Fj7aW3M4cFwj83UAGsdm0iuj
         OD8SqONv4843SEltzBb4tz4Hj95AkDxjBFEL2fN4dp06L24UZhHh8eaaY4uC/F8W9uZy
         kiOQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776608638; x=1777213438; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDyWThTcQJX4agFw15Ew3AfKnI9O2+hPJiJ8JlGIJTw=;
        b=bX9adWLbQpjKXkc02LJNTkfo1DPTSSuNgWtEuG3r4uuJLbgKW/HRf1fzuyL8E6OwiU
         lKuVgtGhj025pAwCfSj6UrhMNYXRnWv1FwjqzphFEkoJfTFNnEPx1UR0XG5zrgTa1pU6
         wAT55HIFUzGJIHCHLvmEavqpQ5hffBSyKrhO32W/xJ5uBUGAXbtK8u1ZAw+yX28YeYFr
         EAz7ljcG1d6rg8B1t0O8sTuiO3lsQ+zGex2cGh3a6gUht2gowavJiGi8dNxM3sErW9+N
         khaWi8t8y90Drykyd/kcOyII1VHcoeVHAW+HvK9iyUSzjVOBzsQRlrfotFtRBdLsmr9g
         EE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776608638; x=1777213438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eDyWThTcQJX4agFw15Ew3AfKnI9O2+hPJiJ8JlGIJTw=;
        b=CK6H4S1POU5VAul4f5AyDqo2KV+odeZyCOZx0HeRD09SJ/WPqEFWI4dQdqa5WXHU4/
         +7FpRMNTXe7a2669G71Q7Sf5nmyXdjWTv5NVbfEJLz1n55ycqaJeNZuv040A95JeKVfT
         OjitvbVzwCrgeehNE+O3amc66CMZkr7fOH97vKd//F8mBeu73Ni404JrZrzB9z/UoWBH
         eh+/7mJgUnybo+Z7FU75D4bMomHGKnMlt092Veo9064DZmJBVPLJrIWzJuF+QRb8n1TV
         /V2OQ8pb/K5WjXC33xTdAyqpX9urGBFEq8eLkEqhiSMAY6G2fnp8qS8loEte1GXiRNzw
         QHCA==
X-Gm-Message-State: AOJu0Yz9w+OrMSz4Nmt/hYmQwz9vEZ4lUWrYQM9jG4MuC7plAHEaqtAp
	rpl6R7s1napWUV0hkpyqG5T2k9B2JgYsVPodzo5P9xgYp/FRNs/kHiEy/fXqOgCuF8iShUbnqzi
	zXaWPb8Mumc2enwmGQW/PMgu5Pu0tWWZvY7eiKkKaU3nO
X-Gm-Gg: AeBDiet0p5H8+Za/K7wEEw24AWXycvYS/rxRgFR3KfdsyNNpU/rfdJUod54Za8f6Jn7
	NYV85aVd3Fd6BSfd7e9ch0za2bijFzwxVWV0bjfDghQLVabM0dLCAXnbLCHkJztFdbGV+Si+roM
	Hk7BjFZ56+q/vysIUchbf9NaZOWYggwy4GH6hizOFv+L6DCaAZETt+sKfR6bTAIy9IvYoHMEYSA
	EDPXLfQmewHGVVQUycjQdqYccn+K0/1oaRgkBif37Ibc2m5ekAbjn1J1yYc92UFqzgYFerUZpvy
	SiB2C8agkPnn5KQnug==
X-Received: by 2002:a05:6512:33c8:b0:5a4:2b2:75e3 with SMTP id
 2adb3069b0e04-5a4172cd812mr2838260e87.18.1776608638160; Sun, 19 Apr 2026
 07:23:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260418045644.28612-5-kerneljasonxing@gmail.com> <20260419045824.D9E5EC2BCAF@smtp.kernel.org>
In-Reply-To: <20260419045824.D9E5EC2BCAF@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Sun, 19 Apr 2026 22:23:20 +0800
X-Gm-Features: AQROBzDKamq6XkjHwX1UKcPaOBGSgjCckPrWxlYvJMrYhvVx2Tr9Hbf7__1T1gM
Message-ID: <CAL+tcoCJ5LXR_mBhRfegN6-Oo7yNtf=akTcw13nfhLAfhVbHAg@mail.gmail.com>
Subject: Re: [PATCH net 4/4] xsk: fix use-after-free of xs->skb in
 xsk_build_skb() free_err path
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 19, 2026 at 12:58=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 3 potential issue(s):
> - [High] Calling `kfree_skb(skb)` in `free_err` after `xsk_skb_init_misc(=
)` triggers premature CQ submission and corrupts Queue invariants.
> - [High] Memory leak of `xsk_addr` when `alloc_page()` fails during multi=
-buffer packet processing.
> - [High] On 32-bit architectures, `xsk_skb_destructor_set_addr()` truncat=
es the 64-bit UMEM offset, corrupting the Completion Queue address.
> --
>
> commit e60e7fb34b1c59698d11da732db02bb3302ab41a
> Author: Jason Xing <kerneljasonxing@gmail.com>
>
> xsk: fix use-after-free of xs->skb in xsk_build_skb() free_err path
>
> When xsk_build_skb() processes multi-buffer packets in copy mode, the
> first descriptor stores data into the skb linear area without adding any
> frags. If a continuation descriptor fails, the error path frees the skb
> while xs->skb still points to it. This patch adds a check to ensure we
> only free skbs that were freshly allocated in this call.
>
> Link: https://lore.kernel.org/all/20260415082654.21026-4-kerneljasonxing@=
gmail.com/
>
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > index 2f00f188533c1..470f6d25ddb93 100644
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
> > @@ -974,7 +974,7 @@ static struct sk_buff *xsk_build_skb(struct xdp_soc=
k *xs,
> >       return skb;
> >
> >  free_err:
> > -     if (skb && !skb_shinfo(skb)->nr_frags)
> > +     if (skb && !xs->skb && !skb_shinfo(skb)->nr_frags)
> >               kfree_skb(skb);
>
> This isn't a regression introduced by this patch, but could calling
> kfree_skb() here trigger a premature completion queue submission?
>
> If xsk_skb_metadata() fails earlier in the function, the skb destructor
> is already set to xsk_destruct_skb by xsk_skb_init_misc().
>
> Freeing the skb here synchronously invokes xsk_destruct_skb(), which
> submits the completion to user space and increments the queue producer.
> The error path then executes xsk_cq_cancel_locked(), which decrements the
> cached producer.
>
> Will this permanently desync the completion queue invariants and report a
> successful completion for a failed transmission? Would it be safer to
> clear the skb destructor before freeing it?

Ack, the same discussion again.

>
> Also, is there a potential memory leak of the xsk_addr struct when
> alloc_page() fails during multi-buffer packet processing?
>
> When processing a continuation descriptor, an xsk_addr struct is
> dynamically allocated and stored in skb_shinfo(skb)->destructor_arg
> with num_descs set to 1. If the subsequent alloc_page() fails, the code
> jumps here to free_err and returns -EAGAIN, leaving the partial packet
> in xs->skb for a retry.
>
> If the socket is closed instead of retrying, xsk_drop_skb() is called on
> xs->skb, which calls xsk_consume_skb(). Inside xsk_consume_skb(), the
> cleanup logic uses this condition:
>
>     if (unlikely(num_descs > 1))
>
> Since num_descs is exactly 1, the condition fails. Does this permanently
> leak the xsk_addr memory?

Right. See the following inline reply.

>
> Finally, does xsk_skb_destructor_set_addr() truncate the 64-bit umem
> offset on 32-bit architectures?
>
> The inline storage attempts to cast the address to uintptr_t:
>
>     skb_shinfo(skb)->destructor_arg =3D (void *)((uintptr_t)addr | 0x1UL)=
;
>
> On 32-bit architectures, uintptr_t is 32 bits, which drops the upper 32
> bits of the u64 addr. In af_xdp unaligned mode, the chunk offset is
> stored in bits 48-63.
>
> Could this truncation lose the offset entirely, causing
> xsk_skb_destructor_get_addr() to retrieve a truncated address and
> submit it to the user-space completion queue?

Right. It can happen!

Brilliant, sashiko found another two pre-existing bugs here! I'm so
shocked at sashiko that handles the extremely complicated path so
well. It's really useful to capture the bug beforehand.

I will include the corresponding two separate patches to fix the same
problematic commit:
commit 0ebc27a4c67d44e5ce88d21cdad8201862b78837
Author: Fernando Fernandez Mancera <fmancera@suse.de>
Date:   Mon Nov 24 18:14:09 2025 +0100

    xsk: avoid data corruption on cq descriptor number

    Since commit 30f241fcf52a ("xsk: Fix immature cq descriptor
    production"), the descriptor number is stored in skb control block and
    xsk_cq_submit_addr_locked() relies on it to put the umem addrs onto
    pool's completion queue.

    skb control block shouldn't be used for this purpose as after transmit
    xsk doesn't have control over it and other subsystems could use it. Thi=
s
    leads to the following kernel panic due to a NULL pointer dereference.

Thanks,
Jason

>
> >
> >       if (err =3D=3D -EOVERFLOW) {
> >               if (xs->skb) {
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260418045644.28=
612-1-kerneljasonxing@gmail.com?part=3D4
