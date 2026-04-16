Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E653A4F5E
	for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 10:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776335643; cv=pass; b=fQrDr5DQgLFEaeVaBPw3pKsO/gCC80S8EsN+J9hobaCle9g0YuqMqw8M1ScqjlqvOf6R2MRNjlgmmFlFzoDBZTnPR2Nkzgao5PcPtedw+lltCEjISZ7ibUdVHiHA8MGXUo7hbWwL9micOcHlCT+nYFjzSBldWnxPOcp+YaXJObo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776335643; c=relaxed/simple;
	bh=CoEngbfGThM6voXC2Ve/EKJHUDpgR67a6sZvEMOPkEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KL9zybfQJmtdwIK+9EA1CmA93SCUzqiNOGJqDwZ2zTM+WwQCiYhnTC6Oj2vs9+r+tqLILm4equz5NtP1tYUOVOlzlnoVu37YMhluvZGPjpO6140/2x6nCTcpUTd35pA/uyqsGPbc1UYCvKZSFNNxJlHVPw7Y8yB5ZUWKUslsCUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5SLK4L0; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5SLK4L0"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a3af1b7549so9911652e87.1
        for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 03:34:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776335638; cv=none;
        d=google.com; s=arc-20240605;
        b=ZJgrlhYmdyb0RTZW20pc2odQzFknIbJ/j0/z1yl91R/L0iNGFg5TeFz82dP8Q039oM
         O+xDxkEPZDlz0/q89Gb8i958174vbsfUokWa0mVOYwCCns/tvPgADeucuV25makys2jD
         jI2rNXLdXYt9yslqUETFzAXvzrB1rbYzaCol/PKwSoq3ANbOyzEp5hOOb+4pxVpebjrS
         Vo4ih0rrxCJ6J7j5fK2iwLvtFCHW2jogyaL9Q5Rt1hqY7kfXTlI7HL3/6DQ8deDLDJE1
         1vcQdpgG3xpGps4dIH3MKYrpZF3IPTE56TzZ9yLOY/aI/5nZnsFrXrqEWZXsR9UKz5kt
         g12Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0nTgQLwO4XWmQrOPU9AIkASPB/0Kzhu0tPVLZll0cdU=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=Uot9trRz/gTzoEVZwojgBhuGGXuujQaoWZWjBQ4aq770TwkWUzGyFjHdon6wa103Yc
         nkuBndEjwcNW3dPDx8OSmZ7VuK6x+rcApEaGBOgSexDHmMbB0R9TblksMMSLzvwQToxw
         MfoaW/IteOrv4jhjNBzGjVjSt5WhHafFpyPFVWAnSQlCERW49IO33ASS2hEekXOW9m+6
         iUNvwYegZ8vGH6UDy3ouvykAsbuB/eZ0qFAhfW8rJQpe65H06DWagdWLB3ObGJQhk4V7
         hi2dKVX0TyivqJkEdO10p4PRNHYU3lS4JvvF5P/xmOqOUe3bDYppFBW2/dokkyFAwtUL
         Aojg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776335638; x=1776940438; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nTgQLwO4XWmQrOPU9AIkASPB/0Kzhu0tPVLZll0cdU=;
        b=S5SLK4L0KVdXi4qV5xIAt0KEadMdvEEvqqy0OllKD2py7RdeE1LYMzwDAXeJ3nHRco
         7hCgDumaiSGKSfSrU3hu8WAd3dmT0hR6Dc5Nma1PGoIX4kK59UkOZu/VZDAyDMWDgcZE
         Hd9CZZFQEv29jqdx0TS1UnpQSQdIoF+CLuOg059678sxZkyYWVusZUcEZx2cgwaXDWbK
         Um+USQCId9eXMh93s/c7n4rV1373As+QSq/9RY+Y/djFnTVpfUPiD7lhAKFF/mub8azR
         UY/fE4+WnlPTNoLv0kvBXhIgBURCz953X0wHd+Yznahp9f4d32SvhOk9gy0EbmjCK5d6
         ZIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776335638; x=1776940438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0nTgQLwO4XWmQrOPU9AIkASPB/0Kzhu0tPVLZll0cdU=;
        b=k6rI3fBW2qQpck2etRekwtb5L2RLP5DgleVQZJzv92x4B9vvJ9OD+YQCYjqk3ar0L7
         ohkaAx0sHHdC+elbD/W/tJWKT/AaWPHU4qr62L+0ej7PmnessCzkCinkiocV8na9necq
         WXHJ6LdWe4p2mzW5pyvl+wHnfBy/j3L1tFLxI+KCpMqSlrNWbwtRTvbsUO6py3/Mrk4t
         O6Tl2QJBzmQCmhWGMI1457e6EO/8lWRSnuu9VPVF4SDYTXw+fh4qipWFSeIbJ3fGIaqq
         BORj1U3XrZzLrJsxMvsKD82unRqQ4XSnE8W8ObsNWbsvuQApvwbEkC56pIrFiCSTK1Zg
         ANqA==
X-Gm-Message-State: AOJu0YxGSYlT29Lr8AdBaLngXFY7IshtZB5QNaeTgirZ0UBmZyD9gyX8
	BZa3tCmK4MbRBtJpqZCLCU1M+RlK4bNM2al/gmCYhkkhyNhuQI2BtF6pCNunIHapidqs2wRrSZT
	/JJbGS60LqpiBrz94jUI6TCHjdV5WrdyGc+Df
X-Gm-Gg: AeBDietnUNIWavpM1PNsl7J6qWJA82j+d5o1EwwmmqPkaGbkBLMOMGkh4mKBlGy4EKu
	dze3xNU+RLqn55KI4mM0pUgwcZdLYj+mSXQgqS5FhQPrsqoau79lvSN73LSaa2+Zzazb9uwdEQn
	eFCz6U67HFT+qBli+WZhTNluHbBkFOhJ1wBUReBAP4DjWetxxw9jG1f0birjtIQ+lQbdNiEw4Ye
	cy1WQRxUq5aqvSqm1jePMOgAVe+R6NlwwfN7hKHnz8BQxNnSJZKU1IfJtscE+OrjIH9HTpAlg66
	d5I8e+75r+zZFTY03Q8=
X-Received: by 2002:a05:6512:33ca:b0:5a4:6f5:6c4e with SMTP id
 2adb3069b0e04-5a406f56e25mr3030132e87.19.1776335638365; Thu, 16 Apr 2026
 03:33:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415082654.21026-14-kerneljasonxing@gmail.com> <20260415091844.D4344C19424@smtp.kernel.org>
In-Reply-To: <20260415091844.D4344C19424@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Thu, 16 Apr 2026 18:33:20 +0800
X-Gm-Features: AQROBzAy1ikrX9HTmdqDFHnMTttP_utyWxP8-57oVu99OuknjT1EKSH2prAam6U
Message-ID: <CAL+tcoC7_UA7SQaufDkFV2APJW2UtaX0j66N=sYF0nNZJ2zASA@mail.gmail.com>
Subject: Re: [PATCH RFC net-next v4 13/14] xsk: retire old xmit path in copy mode
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 5:18=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 3 potential issue(s):
> - [Critical] Time-of-Check to Time-of-Use (TOCTOU) Use-After-Free (UAF) v=
ulnerability on `batch->desc_cache`.
> - [High] Leaked socket structure on error path in `xsk_create()`.
> - [High] Unbounded `kmalloc` size for user-controlled batch size triggers=
 `WARN_ON` and potential panic.
> --
>
> commit 5f2cebbff2efe715b882067f337741749751ac65
> Author: Jason Xing <kernelxing@tencent.com>
>
> xsk: retire old xmit path in copy mode
>
> This commit adds a new helper xsk_init_batch() with a default value of 1,
> and obsoletes __xsk_generic_xmit() by substituting it with
> __xsk_generic_xmit_batch() in the generic transmit path.
>
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > index 16e47f6fc30ec..232e7bf96b342 100644
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
> [ ... ]
> > @@ -1030,101 +1030,14 @@ static int __xsk_generic_xmit_batch(struct xdp=
_sock *xs)
> >       return err;
> >  }
> >
> [ ... ]
> >  static int xsk_generic_xmit(struct sock *sk)
> >  {
> > +     struct xdp_sock *xs =3D xdp_sk(sk);
> >       int ret;
> >
> >       /* Drop the RCU lock since the SKB path might sleep. */
> >       rcu_read_unlock();
> > -     ret =3D __xsk_generic_xmit(sk);
> > +     ret =3D __xsk_generic_xmit_batch(xs);
>
> By switching to __xsk_generic_xmit_batch(), does this expose a
> use-after-free race with xsk_setsockopt()?
>
> In __xsk_generic_xmit_batch(), the local pointer descs is assigned
> batch->desc_cache before acquiring xs->mutex.
>
> Concurrently, a user can call setsockopt(..., XDP_GENERIC_XMIT_BATCH),
> which acquires xs->mutex and updates the batch size via xsk_init_batch().
> This safely frees the old desc_cache array using kvfree() in
> xsk_batch_reset() because the setsockopt path does not check for
> xs->state !=3D XSK_READY.
>
> Once setsockopt drops the mutex, the blocked __xsk_generic_xmit_batch()
> thread acquires the mutex and proceeds to use its stale descs pointer.
> Can this lead to a use-after-free write into the freed descriptor array?

Ack. This is the issue we've discussed previously. I will move those
read operations underneath the mutex lock in
__xsk_generic_xmit_batch().

>
> >       /* Reaquire RCU lock before going into common code. */
> >       rcu_read_lock();
> [ ... ]
> > @@ -1620,6 +1533,34 @@ struct xdp_umem_reg_v1 {
> >       __u32 headroom;
> >  };
> >
> > +static int xsk_init_batch(struct xsk_batch *batch, unsigned int size)
> > +{
> > +     struct xdp_desc *descs;
> > +     struct sk_buff **skbs;
> > +     void **data;
> > +
> > +     skbs =3D kmalloc(size * sizeof(struct sk_buff *), GFP_KERNEL);
>
> Can this trigger a WARN_ON_ONCE in the page allocator if a user requests
> a very large batch size?
>
> The size parameter is controlled by userspace via the XDP_GENERIC_XMIT_BA=
TCH
> setsockopt and is bounded by the TX ring size (xs->max_tx_budget), which
> can be quite large.
>
> Since these pointer arrays can exceed KMALLOC_MAX_SIZE, should this be
> allocated using kvmalloc_array() similar to how the descs array is
> allocated below?

This is also what you pointed out. Even though I thought it's trivial,
I decided to use the _array() to keep safe.

>
> > +     if (!skbs)
> > +             return -ENOMEM;
> > +
> > +     data =3D kmalloc_array(size, sizeof(void *), GFP_KERNEL);
> > +     if (!data) {
> > +             kfree(skbs);
> > +             return -ENOMEM;
> > +     }
> > +
> > +     descs =3D kvcalloc(size, sizeof(struct xdp_desc), GFP_KERNEL);
> [ ... ]
> > @@ -2065,6 +1984,11 @@ static int xsk_create(struct net *net, struct so=
cket *sock, int protocol,
> >       if (!sk)
> >               return -ENOBUFS;
> >
> > +     xs =3D xdp_sk(sk);
> > +     ret =3D xsk_init_batch(&xs->batch, 1);
> > +     if (ret)
> > +             return ret;
> > +
>
> Does this leak the sk object if xsk_init_batch() fails?
>
> If xsk_init_batch() returns an error here, the function returns early
> without calling sk_free(sk).

My bad. I should have noticed this....

I'm totally getting lost in so many checks and conditions while
refactoring the xmit path...

Thanks,
Jason


>
> Because sock_init_data() has not been executed yet to link the sk to the
> sock structure, the VFS socket layer will not free the socket memory when
> tearing down the failed creation. Should this path clean up the allocated
> socket before returning?
>
> >       sock->ops =3D &xsk_proto_ops;
> >
> >       sock_init_data(sock, sk);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260415082654.21=
026-1-kerneljasonxing@gmail.com?part=3D13
