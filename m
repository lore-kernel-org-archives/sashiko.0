Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3C32DB7B4
	for <sashiko@lists.linux.dev>; Wed, 15 Apr 2026 13:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776259200; cv=pass; b=ajtkLNUEp40SEsMiKj3yDthkLhtHmyAiAf7SW7dCSGb9UyQSKLQSEK4+31LBOmKQWMvha4uCXb0BCCe6HeojnrR/dcHG4BK80gyhJyWPhygGW6Vl6Z5jHHkkunj9sU9We4R8xNVDhpWaoR2Y4YtMqRfKFBCZkVoWAQtso6STvWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776259200; c=relaxed/simple;
	bh=cVvVDK2MRWzZyXz3GUm3WQXQ9PZPcYLa/itSN6r995Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CXrVqkTwF+KAkwJQYuQqD2O3LVrWqyiezcah/w9u2Wir8aWFw5KxoJNPHANwE01AWdK18Q2fcWiLRYITFmQ6HbvgfK+ocz5Yi2C3BdcJwlp1OTFoB3OeAcuhUooY/IDKze6y/zqZ/wb5NBkuNXTvt8fdh7DTw2nRlvjA9UaoO5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SX4xdVK/; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SX4xdVK/"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2dedf5f88adso205510eec.1
        for <sashiko@lists.linux.dev>; Wed, 15 Apr 2026 06:19:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776259196; cv=none;
        d=google.com; s=arc-20240605;
        b=Y+b9uHSOXCB7mo8Hh4ljOpY8zTFznHeu9NUwKURQHhmB5VEVIqhG+SBFexdeOPuuIy
         5s7LBza4piBWYwhUVKOze6bt1ms3r9rxeT3p5idOiDqaelfngHaFy13/rxdmZcE03S/w
         YxX4yCjOX7jlBZI0OqruVd3cbZrHUMsZF0opnU1FNFP1VJeY4FcY95M7OpyonpV3AnJm
         9T/5WIQiQOBZR2iLyA5tACjViaaRmGrQZQE8GpES7n/IOnwKsqmaD38n/UxpNbCOEkyU
         xMP4MK8hhqA37u8Le/i9dN2P8793t1azm/1XYvcoXUZeim08FGopCTjjNjh+n3rY5C5R
         QenA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=reYav/f2RX+zYG9Jz25IFXarapNrYkmH4ZhSUflT7K8=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=eJG7lF7qepb15eerrC4tKnmniqNEju2qEFDU4fSgLsoxib3XWfWZrhgm/km3H00RZx
         WKdisSqyKkG/lBi3GuIB54TemlXE3I2yl3K1RsoWJPs0TTRG9I6sv/vhsohi7zrtQBc1
         Fgss5CtA622El4q/LAUvzoHJEFAvwiClUPqOBCSYXRI59zTcYyw0A+NOCAwWoWm1SIhH
         7a7XbuszvnXqgBv+D848ZQ+zbXZtQy3Czr4+Ndmlx0oLEWMsdghyUw0C4mzbjnJzbFlk
         fueN+khEJA9QFizN48VZX1ZGGBWq1/AxzqhbJaJfELPLJrMfYxKw1EavtCg9M85HILV8
         iuLg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776259196; x=1776863996; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=reYav/f2RX+zYG9Jz25IFXarapNrYkmH4ZhSUflT7K8=;
        b=SX4xdVK/xOc5xb1NtwrLPsaF7wIyhreP8E/4fAi1sgEGEgolYz52kxfKw1AYOInoBG
         DLaAkLBDWSp0tO5vIwx2RlDXgCa92drXA7arbNxJYV5fpKfbElNGsQ7IUmM4masTDmLN
         xvyoaoWaclQfYUtXOR43REz91yKvgXUl2HcWMyMoXJLh+2lpMz5IOs56Hf1mKDigpoFA
         SOF2uYUFNjXhqajRAfi07dqDOCrlkWjQZQrb6gHLfdXm1K7/Qnlb0ObVwkQck1OFlbSf
         J88ICPI6irizpFWmTk5Cd0rydg34tHXF1qArMlY1nlwkB4qqzORpFzfB3Fm22w3RjpZA
         GODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776259196; x=1776863996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=reYav/f2RX+zYG9Jz25IFXarapNrYkmH4ZhSUflT7K8=;
        b=dy1Gh72Blelb5KsgvsLxjNIdnqCMuCGq3L4DR+ZHIRrmh9Gid9WLCX9qJ0YoGojrs1
         F2U69yNRX+LkebtvypwI7XYP3RBhf+awCcTz/I0B5YUE6YtwHBxVj7fmjfMdsFxFIMTc
         Jl7509P12lO8+uwA4S3nFLcAkxjyrEnctT0sSKzdc2gl5kiIbvWCi3nlpEW+Pgf9yMui
         f4Ar31teUGaEw3hAKyBetfYsJOVPufjq8KBEt+8cPzy0do0fyON1KpTHAhYvqn9LJzYl
         Bd4Eq5jAxmRIEX8cmBO6qF3l/uWkz/F0DymsUPp0hlDX+fO65Qq5CqzFlIea3+vDhkAI
         DhWw==
X-Gm-Message-State: AOJu0YxmH9Uq7DVdX8TzHMxHG6kxG8ZqbZv3hQNODT4ybCpXqK86crYg
	2sdmHxP5NewFDPa4hXgB1dywfPfNZdcXH2BVeStHY4KnTLnZFMGoY1fRcUJYPb/95/7RZK73R2N
	p6Xt4CJXpmWLLBLRm/BlNV3SwN5fqdSJWk7771HWNgiR8
X-Gm-Gg: AeBDieuxVctc/pnqc0gy6+ewR+0Q6pInsBKieMhf4FzgwSjLm6+V61baKNzTNq+n+wC
	dqDYwTCLXpCBdm39xC7IWceBEa4270O+fzLnwuHfBxHXTZGFPGURiUyRmyNnSt2c7DgkaZ0xdAW
	50gJRTePHOvx07I2q/wEz5j0XXGKDBsMYObLimPdgPMgXoa0pLSzv7qtqpOiQk4eyNPH7u3oZmC
	+q5p0iX8OAzQVtNbBVTHCthm1qKJApLQ0yzfjF43GMtgoDXH3huAa47b0lTEnrNsLhYHHiQPcIR
	eEPH0gwPHskKjOZulw==
X-Received: by 2002:a05:7301:4196:b0:2de:ed01:550e with SMTP id
 5a478bee46e88-2deed109858mr666443eec.8.1776259196005; Wed, 15 Apr 2026
 06:19:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415082654.21026-3-kerneljasonxing@gmail.com> <20260415085204.3F87AC19424@smtp.kernel.org>
In-Reply-To: <20260415085204.3F87AC19424@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Wed, 15 Apr 2026 21:19:15 +0800
X-Gm-Features: AQROBzCTbko2gkyRBF0aL5pTN-Jlo3x3SnxbUODTV8U0Vj3aNOjitv5gNgR5c5Q
Message-ID: <CAL+tcoDS_R9AFX1jJCuO0ikk23g6e0WLMayUUZyUEYrWVhcFSA@mail.gmail.com>
Subject: Re: [PATCH RFC net-next v4 02/14] xsk: extend xsk_build_skb() to
 support passing an already allocated skb
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 4:52=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 1 potential issue(s):
> - [High] Inconsistent ownership semantics of `allocated_skb` on error pat=
hs lead to a memory leak in the zero-copy path.
> --
>
> commit a6016c1c59927d7e151f38b7f237ad699db86b1e
> Author: Jason Xing <kernelxing@tencent.com>
>
> xsk: extend xsk_build_skb() to support passing an already allocated skb
>
> This patch extends xsk_build_skb() to accept an allocated_skb parameter,
> allowing the batch feature to reuse an already allocated skb instead of
> allocating a new one.
>
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > index 1194268ae8676..becc8ebfd82f8 100644
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
>
> [ ... ]
>
> > @@ -793,15 +797,16 @@ static struct sk_buff *xsk_build_skb_zerocopy(str=
uct xdp_sock *xs,
> >       return skb;
> >  }
> >
> > -static struct sk_buff *xsk_build_skb(struct xdp_sock *xs,
> > -                                  struct xdp_desc *desc)
> > +struct sk_buff *xsk_build_skb(struct xdp_sock *xs,
> > +                           struct sk_buff *allocated_skb,
> > +                           struct xdp_desc *desc)
> >  {
> >       struct net_device *dev =3D xs->dev;
> >       struct sk_buff *skb =3D xs->skb;
> >       int err;
> >
> >       if (dev->priv_flags & IFF_TX_SKB_NO_LINEAR) {
> > -             skb =3D xsk_build_skb_zerocopy(xs, desc);
> > +             skb =3D xsk_build_skb_zerocopy(xs, allocated_skb, desc);
> >               if (IS_ERR(skb)) {
> >                       err =3D PTR_ERR(skb);
> >                       skb =3D NULL;
> >                       goto free_err;
>
> Does this leak allocated_skb on the zero-copy error path?
>
> If xsk_build_skb_zerocopy() fails on the first descriptor (e.g., if
> xsk_skb_metadata() returns an error due to invalid metadata), it returns =
an
> ERR_PTR without freeing the SKB.
>
> Because skb is then explicitly set to NULL before jumping to free_err,
> kfree_skb() is skipped.
>
> While the original code also had a leak here for internally allocated SKB=
s,

Awesome! sashiko spotted a real bug prior to the series. I will cook a
standalone patch to fix that first.

Also I checked the MAX_SKB_FRAGS situation in xsk_build_skb_zerocopy()
that has the absolutely same issue.

While reviewing the whole destruction of skb in the error conditions,
I realized that there is one problem in between patch 2 and 13. Here
at least I need to add the following codes to make sure no wrong
accounting happen:
diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
index 3bf81b838075..19bc786decbc 100644
--- a/net/xdp/xsk.c
+++ b/net/xdp/xsk.c
@@ -904,14 +904,16 @@ struct sk_buff *xsk_build_skb(struct xdp_sock *xs,
        if (skb && !skb_shinfo(skb)->nr_frags)
                kfree_skb(skb);

-       if (err =3D=3D -EOVERFLOW) {
-               /* Drop the packet */
-               xsk_inc_num_desc(xs->skb);
-               xsk_drop_skb(xs->skb);
-               xskq_cons_release(xs->tx);
-       } else {
-               /* Let application retry */
-               xsk_cq_cancel_locked(xs->pool, 1);
+       if (!allocated_skb) {
+               if (err =3D=3D -EOVERFLOW) {
+                       /* Drop the packet */
+                       xsk_inc_num_desc(xs->skb);
+                       xsk_drop_skb(xs->skb);
+                       xskq_cons_release(xs->tx);
+               } else {
+                       /* Let application retry */
+                       xsk_cq_cancel_locked(xs->pool, 1);
+               }
        }

        return ERR_PTR(err);

And the above part will be removed in patch 13. It prevents someone
from bisecting in between two patches and triggering the issue.

Thanks,
Jason

> this patch extends the issue to caller-provided SKBs. In copy mode,
> xsk_build_skb() correctly frees allocated_skb on error, but the zero-copy
> path does not.
>
> Could this lead to memory exhaustion if a caller assumes xsk_build_skb()
> always consumes or frees the provided SKB on error?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260415082654.21=
026-1-kerneljasonxing@gmail.com?part=3D2
