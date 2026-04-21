Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860D43D565C
	for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 13:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776776515; cv=pass; b=VhUpHvscqHC7Cg7MzWcGIgGlFRT97oX23btExxQ/f97tRW7c5JbrIqiJ7R1L/hfIAQIwT6V401uuD/vCZTfMuagMelbvpc0GJlCPBnJnUF8X+fEGaChZEmHo9lQzSZQRt3ChnFE4vdPY3XCBxoKlwOxthnAUzqThf4qsxEee4G0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776776515; c=relaxed/simple;
	bh=GaHJWlX9w3tg5UyScKN1/yNMH01yHW+l6j4ppLF6A8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TurcQNgvvUvYtYSlUVl9GPZnZn9oc+GZvPfqS8Urrn8cJtKrrl0OQjvdC7S6EliY0e2Cf4Uc/Sl6ut4UneVfFu1QXVO5jnX0mGypDugDSI+2irnr1aN79TO4NJBnUVQVVjHWKxzGMIQ597Iy/2Wd6RG2CTt5z59YpIbkcmTk6Ok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XPS9XSZh; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPS9XSZh"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a40b2d26a1so3354036e87.0
        for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 06:01:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776776511; cv=none;
        d=google.com; s=arc-20240605;
        b=i/gC/pkeZuYXgrG4B2aTxpPDwxdJ0QB/sMo5kJDMXus06pevx9Z4QxrUxKpsIl/Tw/
         iJ+hVNGqfhq5rMF+3HN5xUOQJ07TGEKVQiFgL2ABQa3NSbQBA8R6dyZ3NmZgfR665l4d
         fymI3kBlVuZfyLkwBpBpbGLRO9RD6ePiz9OkEDbk0/oAvqyXcKvuxV0U0Eo2lWPDBzY4
         TkpGDq8+lNOMyUYk9pbtGKPiQF4a1ddRKQ2EG7HQnl2zGEPAGvcJh9PFrvHGRPA0H6cO
         julWBMAVv2CyWexbRp9EYxYtybBMZ6/nwybHvmP8En7TD4M0iPxj5K31TxC7hFjPUvwG
         9I0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PzSfaOp3OPbvUmyrJZzWnTnI3+fy8AsLaeuFNHP8ETw=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=aQdf1/O69I1qy/IFdQ9TuXJ7v67ys1n6EamgG/lLSEPpjH3SOyvWAT4d7voX2+JTDJ
         Kd0dVreGSutS4q6dt9qgOXmLgo1BgTCYPlek8lwbGLNfmtS5+mMIQobA3T9+ssLZADEE
         d6tOoHLsUj9NOvddWXvKrjQnIUANuLNo2QDMHGnCvvuqX/NWGzz5OpOlRu+xpNXAZqmP
         jzXDtlF6N+80HFlvfalAjtgZFVacIdg950ZvFNveVd4PHSrBE4Llcb6R7RKkilgvKEkS
         hp39LvY1fCkcK7bD2jOHjQzB07UJocemMa7A/w1h+fxItBBNmTfMaOnxlAOJpRoPHo/z
         iFkA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776776511; x=1777381311; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzSfaOp3OPbvUmyrJZzWnTnI3+fy8AsLaeuFNHP8ETw=;
        b=XPS9XSZh81snLCrjEs24N+e2MdZ1a6E193q7QNCE07hL17JGSimN15vv8LTqNIa9/B
         0zyLOgUZxy+uHKICxPleHaLrOfygI7b4WHw9hOcVibYYayfnfqylZafbVg3tisc3zkJM
         CYfAcuf24OnBW2uX1BYC1/TxFRIfEqRT3m35JFdkktXeqVeK+mcoEfQ8sGxY36dc94Uy
         Nml1Jd5h0+Bkw8wUo9GHh+c5yOw4lnpZTOsoGzxRrpou6N8mtcGD0bJ6juksBCeqrxaK
         PAHK9YG3bcPcs/7REXjtffNXsBf5aNMYaYWvY+hMMKnzC7JRqWLCFitVjdbQjtHlmdiC
         adlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776776511; x=1777381311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PzSfaOp3OPbvUmyrJZzWnTnI3+fy8AsLaeuFNHP8ETw=;
        b=YoLuOr3s+4lO7VtL42ZTIX+bj7CXurPxPq6H5LSODxv3QUgSMctbp8zh1/st+DijmW
         bSgPoPzkAT/6L2X5e2FOfkWKxJvlErFt4S5VEr0P/Min5b3uUtlKqqAopxtsjYtKErDR
         2XvogsIugQtsFt6CM0G09LZuktSgJxIT2phI7Hyy80yu6i8iD/dCfW3EHYMrjQieCxeh
         5nWHZpP81OBL6+sTRxw/eTZzEKL1gmayD8DNrXwtolQw51Uny5jEisCt8uYHCMRyj0yJ
         SGHKUmgiSpB7c34P5u94RdCNJhHecc5l/dZsoRvbfwha9rMBY1yg8ZLLhwrAgFO7TWXC
         de/g==
X-Gm-Message-State: AOJu0YzkTugTvcutppx1idAb8OhuT6aByVzRh7M6GvP/ILEWzEJTVak8
	FGgodz1276SyDuJEVEPUQK7ObnjfBVor0NoriUOCyQbgSKAVatqv4Y9OsDzoe73WIfU7OJcMTBr
	vd4CesY5HBYKK+SNhnzSu9wJxMtQ3nhYYOfbf
X-Gm-Gg: AeBDiesLPQA7c4XMs81cq5v2VEwICuneSIZ+cubsFSW7NaTi7rD4sirFPhjsP47R0Ne
	meWkkZmwz2lpHmQ23rCE1rVAln1nnc4tM4x+SSXpvyISC4C+LurmmfQfsDtM8jetfCpe/0vseb3
	P1j2DcVTI7acpWNcz8Yebld7gMYbKQjeLxOly7q//txYAfXS1f4DAKp6+ihcKKFCwIkAx714HuL
	E1TMdKSDwUKVtwz+6YKVx6Q4zpj5ZeRzIPzMSt6kXcwL3uNdMNSF1qhD+TR+RlIK2CMsqcEul+O
	m84u8K15NJBmZw/66Q==
X-Received: by 2002:a05:6512:3b14:b0:5a3:cc81:eff3 with SMTP id
 2adb3069b0e04-5a4172de8bcmr7078744e87.26.1776776509571; Tue, 21 Apr 2026
 06:01:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420082805.14844-9-kerneljasonxing@gmail.com> <20260421094026.6543DC2BCB0@smtp.kernel.org>
In-Reply-To: <20260421094026.6543DC2BCB0@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Tue, 21 Apr 2026 21:01:12 +0800
X-Gm-Features: AQROBzBxpLyVgyjRklod6h-NoILWg6y-B3K75HS_oiwFefqG5VLPxmKczA37GFA
Message-ID: <CAL+tcoBZw3jQYnuDJYciOtLmTNvwyJpNHwgo-=Rs47c155P1sg@mail.gmail.com>
Subject: Re: [PATCH net v2 8/8] xsk: fix u64 descriptor address truncation on
 32-bit architectures
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 5:40=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 1 potential issue(s):
> - [High] On 32-bit systems, xsk_drop_untrans_skb() will call kmem_cache_f=
ree() on an uninitialized destructor_arg pointer in early allocation failur=
e paths, causing slab corruption.
> --
>
> commit cf643670755512ad76d19d6d0707e86a2a05c671
> Author: Jason Xing <kerneljasonxing@gmail.com>
>
> xsk: fix u64 descriptor address truncation on 32-bit architectures
>
> This commit fixes a truncation issue of the 64-bit descriptor address
> on 32-bit architectures by allocating an xsk_addrs struct to store the
> full address instead of packing it into the destructor_arg pointer.
> It also updates the related cleanup and initialization functions to
> handle the newly allocated struct.
>
> Link: https://lore.kernel.org/all/20260419045824.D9E5EC2BCAF@smtp.kernel.=
org/
>
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > index 9c06a4e868725..0232559d5348f 100644
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
> [ ... ]
> > @@ -799,6 +825,12 @@ static int xsk_skb_metadata(struct sk_buff *skb, v=
oid *buffer,
> >
> >  static void xsk_drop_untrans_skb(struct sk_buff *skb)
> >  {
> > +     if (!IS_ENABLED(CONFIG_64BIT) && !xsk_skb_destructor_is_addr(skb)=
) {
> > +             struct xsk_addrs *xsk_addr;
> > +
> > +             xsk_addr =3D (struct xsk_addrs *)skb_shinfo(skb)->destruc=
tor_arg;
> > +             kmem_cache_free(xsk_tx_generic_cache, xsk_addr);
> > +     }
>
> Could this pass an uninitialized pointer to kmem_cache_free() and cause s=
lab
> corruption?
>
> When a new socket buffer is allocated via sock_alloc_send_skb(), the
> networking core's __alloc_skb() function only zeroes the skb_shared_info
> struct up to the dataref field. The destructor_arg field resides after
> dataref and contains uninitialized garbage from the slab.
>
> If an error occurs before destructor_arg is explicitly initialized, such =
as
> when xsk_skb_init_misc() returns -ENOMEM:
>
> xsk_build_skb_zerocopy()
>     ...
>     skb =3D sock_alloc_send_skb(&xs->sk, hr, 1, &err);
>     ...
>     err =3D xsk_skb_init_misc(skb, xs, desc->addr);
>     if (unlikely(err)) {
>         xsk_drop_untrans_skb(skb);
>         return ERR_PTR(err);
>     }
>
> In xsk_drop_untrans_skb() on 32-bit systems, xsk_skb_destructor_is_addr(s=
kb)
> evaluates to !skb_shinfo(skb)->destructor_arg. Because destructor_arg
> contains non-zero garbage, the function returns false. The check in
> xsk_drop_untrans_skb() (!xsk_skb_destructor_is_addr(skb)) then succeeds,
> passing the garbage pointer to kmem_cache_free().

Yes, you're right. After I removed the untrans_skb code block as
suggested by Stan, the problem is gone :)

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260420082805.14=
844-1-kerneljasonxing@gmail.com?part=3D8
