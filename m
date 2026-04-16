Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82DF39DBE4
	for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 12:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776341968; cv=pass; b=ObGFIj40YPCaP/+8JW5meyp46+kM/mYA++dmvhfObD1oNz85Z2ITP6gWy40j5Oe+o1Wcv8cv9bIhDpGdUVJXbNVIhqY1plrV3oM3RxjiYuE4W7hSOY7MRx4ibQor+ZwLxCiLsfKeHChPq6MZR03Mg/BwIWvRU+SIHoA1nsJqtD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776341968; c=relaxed/simple;
	bh=tUtN6Xxl6/8ZUOe0081FLqroxi56blaLuoccETQ6u14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QYBniZlZR/UTNIRAiqv9ES6ms2JVLBYe2eYXqFuIcGag7pu4+kb2vfJO9Wq1HXf3I4pbgNMr93Bl0HUxuWwIt/6xiMHy8O2qQdJ+4EZHPO1J2m+fGRxTf7O4GbRyw+XyXSfkg3uAGM8b1TC7glztvx0SBihhf7cvSYx2FrnUEo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fo3PxcUP; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fo3PxcUP"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38e84ed22bdso40420091fa.2
        for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 05:19:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776341964; cv=none;
        d=google.com; s=arc-20240605;
        b=UTddS1dSAeqPckce5nOLLZ8pH+EK93SwENYjPPwkbNXBzDeemLbeSgSfRR0sYocqON
         GxhCo1iBCYHKqrYEL5qI1LM9fqy/2YCavUgGDaLAPC4HEyxNx+hvwBMiV2I4FgWBzFkr
         9Ur7sSxGrAob0s8T54KpfhNhFYhTONfTK+eR+2HH+6UoM/927Q2/XBqosZ+YGLRECFKL
         v0x+/qlVVvIWKO7DIKYUePicT5xIuHeUMCw0ku+el4aKqxwwRQ6dhFghp+5eiesMIrjP
         vLV1+Hv/Bk2X8DBBrXood2FeYJ4Qa08rg5+cIAAL3t8jUe73BarUcxxrDLgLFkOpx29r
         NYcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ILKzf2TXIFnuxQeSOZRYDomaIK5WqLDrf3a3oWRfbEo=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=Au5kwIyJa2KG3eZcJhhTY4lbuUVpHHzJO60DJniwMeTv3Do5HvATNnET8CkMMrti/4
         PJvQSqHSIRfqFyrA1zXeht+CSTA7ApcD+V9CUfQUxJGEX87PwaDyDXLhuXEhXquW0/3C
         TAFP4D6iB3D2YtwZou0nJJ3IHZuJcyycR24bFeyZvvsx2yjvlKJobzZZWBD9WeDlICL5
         0luj2e95ZSaEw+2yNNm34Kq8/vhumNcYRoNQXrmhFIaGyhRdsitQ4hrFSwEKF/xgSdLz
         1C6QRRPfTr5Wo3Y47aAgkJUGfZqx+6sUO4BiB/k1eSJRYFU4g21UFuW0Fp/byh3nwyBi
         mFWQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776341964; x=1776946764; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILKzf2TXIFnuxQeSOZRYDomaIK5WqLDrf3a3oWRfbEo=;
        b=Fo3PxcUPSST8dumwBx6phlcnQnkH7RVZXAHdpqkcMNJ+aHQtk7mrQNyEIE9ktu0bP7
         nbELzQhvso7yhWsamhsr1B4RZk0XdQGx2DlOLaPbNzYeaAzxGmeIhP6cH8T3XGOG9Zgp
         ny3tv54HW3RgZbIBWdCcmtGVYtZtfg3JWudtS+L4g3CJLvU83OS1r4sjmHdFK/9VxuWN
         L9L8fEEzg1oZ89NyM3JCTpD8K3m55dh1ljHgh8D8YQS2xYPB0RPYKPxVER/fKQwL3Kfb
         s5tmmSte6/jWAcaWBM9hISPgGz42veTso1Wi1I0KMa9A6vTOQpg8slhblnqkUSthUkUV
         6MMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776341964; x=1776946764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ILKzf2TXIFnuxQeSOZRYDomaIK5WqLDrf3a3oWRfbEo=;
        b=Bp3DWtPybhBwenmPCY6TRpfPhjdTE+madOkVzhbwm3n3rqvfFx5IU+au92ZMlR5yUu
         Ks9YZm0BGUDxuyzr8HmdlMFNCFSqsBD/kKNuZlf0XD3nfaC0+8mSoHxutniZZuUNB0Iz
         ZMFFkKAyiXzywWdoDjq9aOFmKgPer70hJko/tNrSdJDmY2JfQkYCsdhrVMmRl6w4tEfH
         ShmxcmSDWz2/bndNREfz0sgYHPbefu0ATEvnWOP9MRiiw8zfMquTwMic+vsRRbZKmV7N
         WKdiGEIf08R0m7Tx9VoaCinW/EIr4q5W//gvXCk5QEfn7mrD+wMTNS9PCk+I9IpqXeso
         Ve2g==
X-Gm-Message-State: AOJu0YzOnrhizGtJQhBTNn2EBxpp/8a5Qw1CJ2UZysfoGKNMZgzDxKla
	d+4fpZx+pOer7yOPv4QOt2Aa1mlRU+dgGnHceTVQnf8OrievMRktpIPOsO9i95yxrUZXmxy1vvM
	hsaE7OSct4rYMo7zGC4Bobt4CEGJfY6AIc5SSZmE=
X-Gm-Gg: AeBDieuOhsbPVfnkHa2Mr/s3NMYz5QWfD81kk+2bSIQ8KSEHfge2g2gmwKg0NDp2EzM
	t0GXBMn5BDUFEXLi9XuEBvfIsZzQcpYDm7yTAlMu2q2x9GXpaHX8jE/rBH3HmmBO/JYjuwJs2SZ
	MIiGwIiI16p7CXrLE6cVLXvgB1XksPrcHhtZnK0Ek5VRfcx0URClVcHl+hYYQzh1GQOeRj793Mw
	YjhoOMHE+XLItZfPEZmn9LRey1+fPOLW/wfPjsMMGZt16dHiUay6294XjV36pnu079xcYuOgxgQ
	dH348552czQcLuysbrNXjWunnSlMkw==
X-Received: by 2002:a05:6512:3192:b0:5a2:bb8e:d4f4 with SMTP id
 2adb3069b0e04-5a3ef906681mr8036490e87.15.1776341963805; Thu, 16 Apr 2026
 05:19:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415082654.21026-5-kerneljasonxing@gmail.com>
 <20260415093822.79A76C19424@smtp.kernel.org> <CAL+tcoDbMq9s5tQkpBQfjWZGajUtJxhYzxJ9vD-hpq7uU3RYNQ@mail.gmail.com>
In-Reply-To: <CAL+tcoDbMq9s5tQkpBQfjWZGajUtJxhYzxJ9vD-hpq7uU3RYNQ@mail.gmail.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Thu, 16 Apr 2026 20:18:46 +0800
X-Gm-Features: AQROBzDX6UeNBNYFxkf6uUL0MhYAcF7vDabM4TqiAgTIdXevyhyLpwRjeOgewnE
Message-ID: <CAL+tcoAvMFo848fHqgCbTxrA_mt71DcRAuD9WEfSsBgdR7jrvA@mail.gmail.com>
Subject: Re: [PATCH RFC net-next v4 04/14] xsk: cache data buffers to avoid
 frequently calling kmalloc_reserve
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 10:45=E2=80=AFAM Jason Xing <kerneljasonxing@gmail.=
com> wrote:
>
> On Wed, Apr 15, 2026 at 5:38=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> >
> > Sashiko AI review found 2 potential issue(s):
> > - [High] Cached data buffers are consumed without validating current al=
location flags, potentially violating memory placement constraints.
> > - [Medium] Meaningful code and commit message mismatch regarding cache =
refill logic.
> > --
> >
> > commit 5a442e9c44f0a64a147908843084cffe5e2fed9f
> > Author: Jason Xing <kernelxing@tencent.com>
> >
> > xsk: cache data buffers to avoid frequently calling kmalloc_reserve
> >
> > This commit introduces a per-socket data buffer cache for small packets
> > to reduce kmalloc_reserve() overhead. It adds bulk allocation from
> > skb_small_head_cache and persists unused buffers across batch cycles.
> >
> > >     Inside the Phase-1 per-descriptor loop, when a small packet needs=
 a
> > >     data buffer and the cache is empty, a single kmem_cache_alloc_bul=
k()
> > >     refills it with generic_xmit_batch objects. Subsequent small pack=
ets
> > >     pop directly from the cache. Large packets bypass the cache entir=
ely
> > >     and fall back to kmalloc_reserve(). Unused buffers remain in the
> > >     cache for the next batch.
> >
> > Is this description accurate? Looking at the implementation below, the =
bulk
> > allocation happens outside the Phase-1 loop. If the cache runs empty du=
ring
> > the loop, it appears to fall back to kmalloc_reserve() for each subsequ=
ent
> > packet rather than refilling the cache via kmem_cache_alloc_bulk(). Cou=
ld
> > the commit message be updated to match the actual execution flow?
>
> Will update it.
>
> >
> > > diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> > > index c7e42c2966cdd..3b3969adfd23f 100644
> > > --- a/net/core/skbuff.c
> > > +++ b/net/core/skbuff.c
> > [ ... ]
> > > @@ -709,10 +718,17 @@ int xsk_alloc_batch_skb(struct xdp_sock *xs, u3=
2 nb_pkts, u32 nb_descs, int *err
> > >
> > >                       skb =3D skbs[skb_count - 1 - i];
> > >                       skbuff_clear(skb);
> > > -                     data =3D kmalloc_reserve(&size, gfp_mask, node,=
 skb);
> > > -                     if (unlikely(!data)) {
> > > -                             *err =3D -ENOBUFS;
> > > -                             break;
> > > +                     if (dc_count &&
> > > +                         SKB_HEAD_ALIGN(size) <=3D SKB_SMALL_HEAD_CA=
CHE_SIZE) {
> >
> > If the socket's sk_allocation (which populates gfp_mask) was modified t=
o
> > require restricted memory placement (e.g. __GFP_DMA), could this code u=
se a
> > standard memory buffer left over from a previous batch?
> >
> > While the bulk allocation check before the loop correctly avoids alloca=
ting
> > from skb_small_head_cache if KMALLOC_NOT_NORMAL_BITS is set, the
> > consumption path here only checks dc_count. Does this need to validate
> > gfp_mask against KMALLOC_NOT_NORMAL_BITS before consuming from the cach=
e,
> > to ensure memory placement constraints are not bypassed?
>
> I can add the check but it seems meaningless to me. In the whole
> implementation of xsk, there is no place where sk_allocation can be
> set to a different value other than GPF_KERNEL.

After a few rounds of investigation, I finally gave up the idea of
using KMALLOC_NOT_NORMAL_BITS. The reason has been explained.

Thanks,
Jason
