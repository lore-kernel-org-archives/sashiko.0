Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03F33C342B
	for <sashiko@lists.linux.dev>; Tue,  5 May 2026 19:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778009360; cv=pass; b=JXYwyY9nPeYwadFEnq6DBw7p+EbF1LCjWYRssxsZ7UJmTZgJ4BHBivIqXdYpFnnzzth/mKC/vTHQaFlY3iGuu/2Bp/LX9aaVa1NRMTBclJcPTTKywmqHOvbGEtZWhjoohBKAhWm3gds751F5Wl/Ig2cgrkw8/qkinykrq5MAEq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778009360; c=relaxed/simple;
	bh=MaS6G6QMr8iufTVyCEqfjnn6L+b/M/zJdMJcnI3bCqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dQIu7UbCjF5rFLUcpNk15erm/jZt6NKh9zqlYsThopAd55/9St8XFPiJ9JG2OvUyZRr4NzkNHboJuT4GPbxSbEa9Im/Ayzlm45AcNI08/iI8BaoCi6fw3fM07VGfLy3803quBjUPpTi1xRFlchbEhy7FGwylngF5mDMEuxqmRXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLvAm/1O; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLvAm/1O"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a62f43b76aso5176544e87.3
        for <sashiko@lists.linux.dev>; Tue, 05 May 2026 12:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778009356; cv=none;
        d=google.com; s=arc-20240605;
        b=Xq6D6zAgcogj3J3Wjy1O2zdjrd/n2ajXew1pA2s4z2mqMzeWI/mrm8FYIRpUAWuGJM
         pfQduteMBzosKidsaKa9wafeRIZXq9B0IRKdnakfDfKNEiPr8Ypc0zkO5MDjlbParA9/
         usoYrsx2ftswjbSgHB72N7uYy2DwT33xor46TQrtzYk3zY+ypYmbwGY47bwB+p7Xkrrq
         UiPp6QemyMPaFaUe02tW04uvvgCNNEJFwHvS5LyG3wBRbwBbDnIbxop5/1UdVHxF9oDL
         fpxOIv1NFszDVn386qZW5/s0SeSyWkkhHgV/AxB497PFLbdlNpbMadzLCaNoerEnaJdE
         6WPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zCpz08/sZPNZFx4FQ1Kj6Lyi+Lgvsbd/LrhdJVqAP6E=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=Eu1y8U3Xnaz/oTZw2y8wbUt6eiujWI7yW4jFEhR29Dt61sNNT23l9XQ39VYgL4yRKu
         DiI4Si91pTSe9w6/6cZlxU4h7HcYilcMXCf/aSf8mVGZkfuAcsrgLu+oKYkcCk/W7eii
         XHIh72UY9CUVBvBmY0POZEzuPMUmgMZSlgkHhVFR2ecepVV9CbA+QhmdmyYVUacVcBjE
         R5kC6n0/BvMfXeI1ZMiqxgjXodkzQGVYTWH4WG4eeI+ka/l9LRfndyjT6gGs8sMwEoCP
         wG45+jpVZWhI0ghn9zLSgDwoIeIYPfw1NaqVPYPZHZv2UVnfHboEp8nF0nuu4EHH/k81
         FVcA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778009356; x=1778614156; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCpz08/sZPNZFx4FQ1Kj6Lyi+Lgvsbd/LrhdJVqAP6E=;
        b=RLvAm/1OM4bx5+eLBQ3MXMWY5Y2FzWO+jXGBBnJX54LcxrgBG1ykCbMf3iPKC1Hr1o
         hx48aZZpD8XBsX3aDuEuu/KYUgbl+KnNiYclSY0NBGvOiwsshdrN9Nh1qG9ldKdNwgAR
         dQDiM0dta3a3shKsO46kXjoPEUujGsea/FKUhywUzJIU58Cw5m7uQY1gfQsZIPD0Htv8
         BQUC5UZtNRZuyXWvtRNo3X5QzUVleumVe00+O5i6Bjnm8T1ihKC0muHPaDku38R6Nu/9
         y5tFdscGbqWqFhrVg1ImgysreeWH2XaMQ1RzkcnQAMOVde9d2BDWTy0FPPSI+i7WrUKn
         vebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778009356; x=1778614156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zCpz08/sZPNZFx4FQ1Kj6Lyi+Lgvsbd/LrhdJVqAP6E=;
        b=eqe+xufWVEWgmtbMcnw/GVHeMRUEzR5rFuztqboa2xDNWErotOcz6IW8eZcDEcDAXg
         gWIiLLRbVta0HRkwbT5kTY+GA82fLvYk0IR5ZStE8IpG5+5Z5HHrlPW8r5iUUx/6o8B9
         5UCG/gL4U9n8r/tWPCOrxqaMPNvhJNpHEyRIC1sdkuDTIdOyG6y0nxm72m888J+9VDF8
         KDLehy5azbKIadCUNxtEeU+z2dCLcxoTb6Tciik1luYK1siMQU9Ijlqh1HxSSOZYmlED
         QG7FlpXZRvO1ln/moghL0CudE1s3chK08GqlIkhIvI65RqFafs5ec27WjsQoOK13ZPky
         x89w==
X-Gm-Message-State: AOJu0YyCTqD/ZCVSWgzrfxJqecYN/H78X1YFh+kamIcO7HKAtX6ftPxj
	ZMk+Ai3JiHc02o22lp4xBqISgLvVhz3JwoigMpwxLbjo0KEDRuRbivBSlTeG5MPIasPBAZB4bBR
	7gwzdwLNr6YlBJ1P1gz33/5DzvXFbrLUUoOoNbVowJQ==
X-Gm-Gg: AeBDietRr0KJBBNI8wYK9QFG9rdt7uf4PwvLUCenAo3z40HDUkt2oqrVbHX/ue3NP7b
	5PfGhAELxsu5sBUDflDbtX0YunIZKTiyl6PBgvZKvcBR985heQjPwMCLx4+eGmCLuH0yJgUxFCl
	DzBmn8vieyudFtvj8PmFMLYildOpGyID0aCRwGTf9r+E8rtvod2uSAPjVtMF5OFUpbIi+5zHW5b
	N0ncL+XY0+PPqAzjVzixR62wAqyz/nEbeP7q0HISllsW8RKuRdVOn5EqxnNfhg5mKeNLkqPA6bv
	FrUQvxcJRMzwKWfWJYNIkhfUf7h5IoUKxXNbzevBadaDxQV9irE4c2KMKlg=
X-Received: by 2002:a05:6512:1393:b0:5a4:1133:c30c with SMTP id
 2adb3069b0e04-5a887ce6168mr22854e87.28.1778009355336; Tue, 05 May 2026
 12:29:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260502200722.53960-4-kerneljasonxing@gmail.com> <20260503200925.1AD38C2BCB4@smtp.kernel.org>
In-Reply-To: <20260503200925.1AD38C2BCB4@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Tue, 5 May 2026 22:28:34 +0300
X-Gm-Features: AVHnY4KMeGDD8WweymcVYm-GlzqgazHmgRb3taJk12TsKeTT6A7WVqgXP3F06Co
Message-ID: <CAL+tcoCYgJsgmxvHCJj_-2R=UcV61TRT_ghS87eZV5H8154cYw@mail.gmail.com>
Subject: Re: [PATCH net v5 3/8] xsk: handle NULL dereference of the skb
 without frags issue
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 3, 2026 at 11:09=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Completion Queue (CQ) state corruption when handling -EOVERFLOW =
for the first descriptor.
> --
>
> commit 819a57cd3753db9f503ac093f83dccc180da574d
> Author: Jason Xing <kerneljasonxing@gmail.com>
>
> xsk: handle NULL dereference of the skb without frags issue
>
> This commit fixes a NULL pointer dereference when a first descriptor
> triggers -EOVERFLOW in xsk_build_skb_zerocopy() by adding a check for
> xs->skb. It handles the first-descriptor case by manually canceling the C=
Q
> slot and incrementing invalid_descs.
>
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
> > @@ -976,9 +976,14 @@ static struct sk_buff *xsk_build_skb(struct xdp_so=
ck *xs,
> >               kfree_skb(skb);
> >
> >       if (err =3D=3D -EOVERFLOW) {
> > -             /* Drop the packet */
> > -             xsk_inc_num_desc(xs->skb);
> > -             xsk_drop_skb(xs->skb);
> > +             if (xs->skb) {
> > +                     /* Drop the packet */
> > +                     xsk_inc_num_desc(xs->skb);
> > +                     xsk_drop_skb(xs->skb);
> > +             } else {
> > +                     xsk_cq_cancel_locked(xs->pool, 1);
>
> Does this cause a Completion Queue (CQ) state corruption?
>
> When a first descriptor triggers -EOVERFLOW in xsk_build_skb_zerocopy(), =
the
> free_err path first calls kfree_skb(skb) just above this code. Because
> xsk_skb_init_misc() was called earlier, the SKB's destructor is set to
> xsk_destruct_skb(). The kfree_skb() call invokes this destructor, which
> submits a completion and increments the ring's producer index.
>
> If we then call xsk_cq_cancel_locked() here, it decrements the reservatio=
n
> index while the producer index was already incremented, breaking the core
> invariant cached_prod >=3D ring->producer.
>
> This causes space calculations to underflow and can overwrite unconsumed
> entries in the CQ.
>
> I see this was addressed later in the series by commit 88b75ff1d12b ("xsk=
:
> prevent CQ desync when freeing half-built skbs in xsk_build_skb()").

Yep, it has been resolved in the series.

Thanks,
Jason

>
> > +                     xs->tx->invalid_descs++;
> > +             }
> >               xskq_cons_release(xs->tx);
> >       } else {
> >               /* Let application retry */
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260502200722.53=
960-1-kerneljasonxing@gmail.com?part=3D3
