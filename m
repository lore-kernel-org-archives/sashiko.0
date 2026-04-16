Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51772E65D
	for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 02:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776307601; cv=pass; b=h2XxUVSAGUb9KBfse0D5qu35pf2zMd0ZW72bJ3IwjHdL6KgDsMA3RqrTvd7t4SXJzeHwGhKm+GbUNcPN8NbX6O4H732QuGfLDLI+w42CWlPVK1eq8pRF2OiwSX15917a5u1UvOvt0mVSnkvfujB0Gys+BxTI3VruJgNpnXEQuWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776307601; c=relaxed/simple;
	bh=jzqWozEUYYFZPS/6kekndzo0Rcu/slzAa6UDlc4bz6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fhYvCqEj4r+Fw0DAppEGBmslgeWMVgr2VSoltGdc6QmKwLKbMBlVb4MvU0K4z3zKVFXdiI28mnDwfnE6kJpx0bvJ9h4PGDiBr7nDnH1npXNAvv/bpQMtBPdlwtiYhF3WYedDw/j1N+FI2QKAXUnDjUjbvJ9zWHxQSsYcGUzjRgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ATbH9FIS; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ATbH9FIS"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59e4a04f059so7246838e87.2
        for <sashiko@lists.linux.dev>; Wed, 15 Apr 2026 19:46:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776307597; cv=none;
        d=google.com; s=arc-20240605;
        b=IY0ggSFWK5tDN0zvn84ekU/RcA34AW0+MHVK2nCrtPSG1nLcayX8o6PHNbhIvEeZ6X
         81s0S+oMMShnXWFKF41l4rxQ8z5UXXA3QnSYSdax0SlXVSNUhl4IV3H3eCpXNM8+4TQu
         J1qjuHg8x0zdOhAgmK1h10O+3UHWAYOTg6jSV4eMBpzqFt/NLVl48EDIdpTML3z9StrS
         WAYnwCiaGrs9XGKULS0lc36YHpH7PECqk2alp4IYSoUWOsxQVge/Y1wep34AdncCLvNc
         EXKOBRT8Yu98qzXNAw6I1gBErXO5eb8aczeYdNSfes3nuSy9rdtkORuSOFBh/26/uvlt
         oLDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bMpAi1WfcnB71WumSoAXkBgMlLV2naKm0UdS2vprTuk=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=iKMqLFLzmsbEMJ3yxFI6ktK1wdVeHnIvUMW+IXvU/D1FdFOi0bQwtoKf9j4craMgEh
         B1Y3NTq8Dy3xjU4AGWQJr9XzEdhsYlbi31JnHDmJcgpNQ60g3t4CGmzR1QtJEUWHc2oz
         q29zDrJ5eSfFW1CWpxUYhxZ7J0aPnJ+gUinf8orgSf7Dv80UGkH/EOnmGdNgWNWvsRT4
         QX9/RJKpLW2yUzo15SkqLHKotuVYIJ6wCq/MJijPXLnOVp+zcksWTSko7hKCsWa/SQKE
         qKnBd5F8VzST7v/ETKv02S+DnrxE7SvBc37GrYcmQhuYuPx7x0Dh8vdC0fxO5rdpl8m/
         7mbw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776307597; x=1776912397; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMpAi1WfcnB71WumSoAXkBgMlLV2naKm0UdS2vprTuk=;
        b=ATbH9FISs9BBBuWpVcPRarxYlQmiSFfGDDOmUkfEKF8hseE2uT4zeFNFtiyEITr9pf
         azyJpkKCgsryPMNQLCxQ8Adqy3OfBBZLrp4TmEUWG4HRt40aci4EmsnMhdl/RG1wEjnU
         mKPgx0UrxQ7XdQF2NQ33Xy3LdygebhnxF8+e2Ezeqy5pYbFtLidTcYUGjB/oKI2o0Kcx
         aVBpRzytF8aSMkz8hPuihm47cuWa4lleZ5B1qtJRN5A2+HRxCq4aj+BW0NgVZFHtrT0G
         JeEUNAgAVYQY6cKOkMiAaEjIUOmIm1jaBH7G5FJcOuKwCdXjTW2Iu8dl6NuU01NO4+o3
         qplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776307597; x=1776912397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bMpAi1WfcnB71WumSoAXkBgMlLV2naKm0UdS2vprTuk=;
        b=ZA9+zMuIP/nUgeiMMA01qgS6Cfkys2y9DCPk34qPQgh9E715+fsbsM5Vx0e1WXTvBU
         7IHhYEBkhH9Q0enaCTyquGHUyeJo5n/IV01SikZ5BdVdvXaUSe1O3+Egw35xaPXdaOGU
         inJU+heU1DF4eBbhpEYpFoB0fs+hiNyGNA+52Ae3ruIVUxIRqwiQg7Svh0bFJFgf8Di+
         EnKP3LYsyEJuEaVZ9NpB+oAyg26LiL9EclvY+YtbDombSaIGBZszC+t8O4F0JpVdbKiu
         5/pEx5BGkCdATFTTce1dvsJG+ADG1oHKt491FCpheK8No8OzQP/tqXjqGcK5mA/vInbQ
         mdEw==
X-Gm-Message-State: AOJu0Yz4P8ny41K6mPusEjhiAi139DI7epi/1AlDgNTN48jzvmO9Tmv6
	E/rJAEGJnsNTlb2fOQmOnFdiUcUZ7XVpS9SYfMFMsIs1SOF+slprosOkCiQ8dsJBlf0Lu4ivBnN
	s38PhfgSbiMB4mK0mIalM1EFXDd40qkKiijZL5uA=
X-Gm-Gg: AeBDievs8qUinOA/fyTTlR2ii8WYXKitZXqaXPI+ofLfSiNykfwwQkXHy3rPFHMIAON
	VDXo6eijW1G0umhgs1nZY9RmBwuIH6TrDKRYIr/MZBSyfSuGTgpOIeX5YsjU8+HLRrbFdRzcOWM
	62B2/b/zBEuN/g9ltr2H0ITzBn1RoahgRoftlORV0ENEdzBw/S/y95vkE0z+eRTYYZmBTBrm/Ev
	obF0VvDvTY4ARgXrXNSJfg9BztjoWrQDim0q0ZveeVtI+ynvo7YvetBZ+SUpGJ9++17c7gvNT9g
	960yNM4ByCBkgfwLsI8=
X-Received: by 2002:a05:6512:a91:b0:5a3:ff60:b72e with SMTP id
 2adb3069b0e04-5a3ff60c455mr4177412e87.39.1776307596793; Wed, 15 Apr 2026
 19:46:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415082654.21026-5-kerneljasonxing@gmail.com> <20260415093822.79A76C19424@smtp.kernel.org>
In-Reply-To: <20260415093822.79A76C19424@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Thu, 16 Apr 2026 10:45:58 +0800
X-Gm-Features: AQROBzAef71r8tiUdyeZgUJhpnVKcyP5ZGIv1I1HR-iZo_mj3Web780eg-zTQnU
Message-ID: <CAL+tcoDbMq9s5tQkpBQfjWZGajUtJxhYzxJ9vD-hpq7uU3RYNQ@mail.gmail.com>
Subject: Re: [PATCH RFC net-next v4 04/14] xsk: cache data buffers to avoid
 frequently calling kmalloc_reserve
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 5:38=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 2 potential issue(s):
> - [High] Cached data buffers are consumed without validating current allo=
cation flags, potentially violating memory placement constraints.
> - [Medium] Meaningful code and commit message mismatch regarding cache re=
fill logic.
> --
>
> commit 5a442e9c44f0a64a147908843084cffe5e2fed9f
> Author: Jason Xing <kernelxing@tencent.com>
>
> xsk: cache data buffers to avoid frequently calling kmalloc_reserve
>
> This commit introduces a per-socket data buffer cache for small packets
> to reduce kmalloc_reserve() overhead. It adds bulk allocation from
> skb_small_head_cache and persists unused buffers across batch cycles.
>
> >     Inside the Phase-1 per-descriptor loop, when a small packet needs a
> >     data buffer and the cache is empty, a single kmem_cache_alloc_bulk(=
)
> >     refills it with generic_xmit_batch objects. Subsequent small packet=
s
> >     pop directly from the cache. Large packets bypass the cache entirel=
y
> >     and fall back to kmalloc_reserve(). Unused buffers remain in the
> >     cache for the next batch.
>
> Is this description accurate? Looking at the implementation below, the bu=
lk
> allocation happens outside the Phase-1 loop. If the cache runs empty duri=
ng
> the loop, it appears to fall back to kmalloc_reserve() for each subsequen=
t
> packet rather than refilling the cache via kmem_cache_alloc_bulk(). Could
> the commit message be updated to match the actual execution flow?

Will update it.

>
> > diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> > index c7e42c2966cdd..3b3969adfd23f 100644
> > --- a/net/core/skbuff.c
> > +++ b/net/core/skbuff.c
> [ ... ]
> > @@ -709,10 +718,17 @@ int xsk_alloc_batch_skb(struct xdp_sock *xs, u32 =
nb_pkts, u32 nb_descs, int *err
> >
> >                       skb =3D skbs[skb_count - 1 - i];
> >                       skbuff_clear(skb);
> > -                     data =3D kmalloc_reserve(&size, gfp_mask, node, s=
kb);
> > -                     if (unlikely(!data)) {
> > -                             *err =3D -ENOBUFS;
> > -                             break;
> > +                     if (dc_count &&
> > +                         SKB_HEAD_ALIGN(size) <=3D SKB_SMALL_HEAD_CACH=
E_SIZE) {
>
> If the socket's sk_allocation (which populates gfp_mask) was modified to
> require restricted memory placement (e.g. __GFP_DMA), could this code use=
 a
> standard memory buffer left over from a previous batch?
>
> While the bulk allocation check before the loop correctly avoids allocati=
ng
> from skb_small_head_cache if KMALLOC_NOT_NORMAL_BITS is set, the
> consumption path here only checks dc_count. Does this need to validate
> gfp_mask against KMALLOC_NOT_NORMAL_BITS before consuming from the cache,
> to ensure memory placement constraints are not bypassed?

I can add the check but it seems meaningless to me. In the whole
implementation of xsk, there is no place where sk_allocation can be
set to a different value other than GPF_KERNEL.

Thanks,
Jason

>
> > +                             data =3D dc[--dc_count];
> > +                             size =3D SKB_SMALL_HEAD_CACHE_SIZE;
> > +                     } else {
> > +                             data =3D kmalloc_reserve(&size, gfp_mask,
> > +                                                    node, skb);
> > +                             if (unlikely(!data)) {
> > +                                     *err =3D -ENOBUFS;
> > +                                     break;
> > +                             }
> >                       }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260415082654.21=
026-1-kerneljasonxing@gmail.com?part=3D4
