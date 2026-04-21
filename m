Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747293BD641
	for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 12:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776776324; cv=pass; b=R0CPPRxLh9UntIKOpPnCAED4C4aiHcZmgpP3L5f+DiF1vFN0uRIgKwDimMssoZOTZpOeNJMK7Ql6dlgL4FzdnbSmvygQ+MI38qk4vMD65duNtZ/n71FV9Rc3LNdDiI849rAcil0Wt3waqbMqLWXg9DhxzbF996id0Vw7U+S82xM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776776324; c=relaxed/simple;
	bh=Ypq9vbVKeYDEyJgIYjEFrwetr6tzWasuBJFqaQCWKno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EmeecQE06xgXHWe7OnU9/K8o2oTSqzVIYu7riZmFLa6PXYfEJHawkNIe7+ky+IxBMUipVqVKk1irj8KLGVKg2fHi/WBKl385iekCZU2UAn149oByt4w8s6eGw94DvbuA6QNhAangGgyiMgkXsfB+oDJvrGT6qPoa6mHD5ez56PI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oki6hfhB; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oki6hfhB"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a402dea4a5so4803626e87.2
        for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 05:58:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776776320; cv=none;
        d=google.com; s=arc-20240605;
        b=GaN1h9hoE2GEqoSnx98yQl+/1ICyNNQteoBI/Txes0XDnioni1OyRtlU4HRGIsY0HS
         v4aRcSaoDdtYmje1cPjzmG0+lEZ/q5Jw3BmJxPpSs6YMQTqIEnU1fNkH1iyyH9TJ7Ozd
         Se8sYFrSeFGQBpfyVndxzwJts9eGh/wS/UNSk9TS0HgbARiLnjjuDrvbQ/rh5/T9KpJp
         gXfkNYJRJpcFrNOw6IGCAPQYNgc4Sr5D+aEYJPfvU8ME081x+VntD4Ib4LvRnZssHYBr
         z2ku1NFmkBhwEBbRBVB7813qo4UkpneN7TF4U1MJF30zJq9gOV1ENTIuBdxKRhkYoRpL
         VBRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h4dFEtY8RcrtaZeXUnmogrtpVC/Og8GraCdRaNwWc6g=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=SuCAwW+mkhtERPUKmIncVZctZMqhp548eR2ssogLjIHIgS7XjOBt9aTHi4VElWlXKQ
         0zZmJioe7UsR+GdakZbPw0lqgkgO74jlG2yOUPEq1i4mvZrAgC3cvrmZMLcN21sqWuU6
         VoRqE0uJN1+R9NcbSwAJkzC4bqq9Ae77nKODY7iWbytBstKxiD/blsb7k0Ud3tXU3vBF
         y0BAdH5HxS7l/HorPpm/UlwNlTPadwNvTe9vnySCIR4zeLZlcZWJrhTzuu3yyoYmSh8G
         KO16IGBXPazpHz8RRllgh0qt7m//KQlTaBj/FpD833HwjvP9mANAEqPQTWYfq/zCMjvL
         mICA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776776320; x=1777381120; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4dFEtY8RcrtaZeXUnmogrtpVC/Og8GraCdRaNwWc6g=;
        b=Oki6hfhBzPsL8u18OXwXjVmDbt/yl0sd/ZfzZjRhwCQtNsIzy1paLsWfz/MwR08nv4
         N4rQJ8s8ajz0GpE5XyDf04MauQVzWasCLHS1H0GzECpIhlz3A+BfG/PUV/idHUtwJI+Q
         ad87WD7l/VoLFKRkiV3K3JsZQ1irOpyGmehkFdO0ChFs6JLX1yrHh/q6tlq/p5LryAEc
         KhJD1FHQPTjpkbTYW9hxTzp6N/yMrkgEwNSS3NAd6n8yiulAHNfUIaaK3jhsFeac1DVy
         yT36BGX24gaU78ns+VVANhcZMB3m7RvXxTx3uQ7q/lVWLghK36N18PPHsoehRD2CTseV
         91ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776776320; x=1777381120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h4dFEtY8RcrtaZeXUnmogrtpVC/Og8GraCdRaNwWc6g=;
        b=gp6K+jTY+hgKE/HZReMALdYNYOcmVot5LWQmQsqQQg6Osyy83HyoSuvasEMU9ltCgv
         c6lWgqJNcNYDc144lbeeUuXEqKMqe/zwZjLmFJGBVABuFAjsNxQVawCd4+MEuIJAEO36
         QXaFaRHyUeBJNIVTOgbEnFXt58NGN0LC3ZnigXA87aElr+SAf9ahOn/s+2KaeoYJ3l/p
         u4nmAyXXew53GBtIskahyCigb6q35xGTYGF5YKaq+Vp5GwWelooMqXw6YC5KH8VlJcXD
         o16T21F7vp9vAbqFnic1P5FOzASJbqrDhqYR1puBAKdw8L2Lqes+VkTUoIKjZFZEoFG+
         kdwA==
X-Gm-Message-State: AOJu0Yz2ao6NpTqRUDGZ+ex18Y16lVGEgrr1uIGufKJbfrIkXtXKtwlT
	BkL7c6JeeACBt4eh4ITDTaPvygDEam5oDfihqArGXd7ngvpqvVKF8DfFkD/5D/g5/k31HOaFWqh
	m6z+LMb4s42EVQF5ufk8sjU3yLnCYOOjPTbjC
X-Gm-Gg: AeBDiesONsAErz6FL29WiT5oFgWtSs3r9FtU0ULnERV6kiIi8agsXU8MUdas2RYKv0c
	klmFWc+hliLcXZxhpykYch96QmXn1Gcceoi7C/W2ep2kraLBlGRnBOqhdIAGhMHWmOn/FfJp2NT
	7UIm0AVWq3UYwj5I8LScP7HeDunzV2A9it6H1r2aVx4qHcB/98Ji8peM2hVxlIeLdQn6GL/1Udl
	YmvuUqhqR5wNWZAxABb6gaAQMKeKwIBclYTlh5gqNrwcABdAl/9x35fFmz3EIiBeZvzGUqoPLUW
	/zSJ0QcL/l73/HagJw==
X-Received: by 2002:a05:6512:239d:b0:5a4:505:f62f with SMTP id
 2adb3069b0e04-5a4172ca7fbmr5337248e87.6.1776776319287; Tue, 21 Apr 2026
 05:58:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420082805.14844-6-kerneljasonxing@gmail.com> <20260421094025.684A0C2BCB0@smtp.kernel.org>
In-Reply-To: <20260421094025.684A0C2BCB0@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Tue, 21 Apr 2026 20:58:01 +0800
X-Gm-Features: AQROBzDLRai2NsErGwP6JqUZsExStq91zppFmZENRMO6-KgFjDCR30CiO_K2g9M
Message-ID: <CAL+tcoBDnrThvfP+4JdATXHs1Ti351jGCnzb9x69QEXXr=HbyQ@mail.gmail.com>
Subject: Re: [PATCH net v2 5/8] xsk: avoid skb leak in XDP_TX_METADATA case
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 5:40=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 2 potential issue(s):
> - [Critical] Time-of-Check to Time-of-Use (TOCTOU) vulnerability in `xsk_=
skb_metadata` allows unprivileged users to bypass bounds checks and cause o=
ut-of-bounds memory accesses.
> - [High] Software checksumming calculation fails completely because `skb_=
checksum_help()` is invoked on an incomplete and non-linear SKB.
> --
>
> commit aef1b3344bd952f39b1181e046ab7d9ce77fbc8a
> Author: Jason Xing <kerneljasonxing@gmail.com>
>
> xsk: avoid skb leak in XDP_TX_METADATA case
>
> This commit explicitly adds a call to kfree_skb() (via
> xsk_drop_untrans_skb) when xsk_skb_metadata() returns an error, preventin=
g
> an skb leak if metadata processing fails.
>
> Link: https://lore.kernel.org/all/20260415085204.3F87AC19424@smtp.kernel.=
org/
>
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > index 55b448abb8178..fd5432fb807e1 100644
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
> > @@ -829,8 +829,10 @@ static struct sk_buff *xsk_build_skb_zerocopy(stru=
ct xdp_sock *xs,
> >               xsk_skb_init_misc(skb, xs, desc->addr);
> >               if (desc->options & XDP_TX_METADATA) {
> >                       err =3D xsk_skb_metadata(skb, buffer, desc, pool,=
 hr);
>
> While looking at this metadata handling, I noticed a couple of pre-existi=
ng
> regressions.
>
> Will skb_checksum_help() always fail when called here?
>
> xsk_skb_metadata() is called right after allocating the SKB but before an=
y
> payload fragments are appended via skb_fill_page_desc() further down in
> xsk_build_skb_zerocopy(). This means skb->len and skb_headlen(skb) are 0.
>
> If software checksumming is enabled, xsk_skb_metadata() calls
> skb_checksum_help(skb). Since skb_headlen(skb) is 0, won't the check
> offset >=3D skb_headlen(skb) in skb_checksum_help() always evaluate to tr=
ue,
> triggering a warning and causing the packet to be dropped?

Patch 1 has already dealt with this issue.

>
> Also, can a user-space program modify the checksum metadata concurrently?
>
> In xsk_skb_metadata(), the metadata is read directly from the UMEM buffer=
,
> which is shared memory mapped into user-space:
>
> net/xdp/xsk.c:xsk_skb_metadata() {
>     ...
>         if (meta->flags & XDP_TXMD_FLAGS_CHECKSUM) {
>                 if (unlikely(meta->request.csum_start +
>                              meta->request.csum_offset +
>                              sizeof(__sum16) > desc->len))
>                         return -EINVAL;
>
>                 skb->csum_start =3D hr + meta->request.csum_start;
>                 skb->csum_offset =3D meta->request.csum_offset;
>     ...
> }
>
> The bounds check does not use READ_ONCE(). Could a user-space application
> modify meta->request.csum_start and meta->request.csum_offset between the
> check and the assignment? If so, it might bypass the bounds check and spe=
cify
> arbitrarily large offsets, causing out-of-bounds writes when the hardware
> inserts the checksum.

Yes, you're right about this pre-existing behavior but currently I
don't have any interest in expanding the series. Maybe I will
construct it as a follow-up patch.

>
> > -                     if (unlikely(err))
> > +                     if (unlikely(err)) {
> > +                             xsk_drop_untrans_skb(skb);
> >                               return ERR_PTR(err);
> > +                     }
> >               }
> >       } else {
> >               struct xsk_addrs *xsk_addr;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260420082805.14=
844-1-kerneljasonxing@gmail.com?part=3D5
