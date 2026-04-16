Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D652E3B8944
	for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 13:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776345191; cv=pass; b=IrQFpTyT+YkC3jyv6B0JsVz39K44kjb9ULfIa+nl6a5ujtfwb4dt6YoB3lZ95/rc5N9mEt/4rzvY8H1EHj1WGEUBqC4Rj5N5V/XYjbVJR3wUwIQ22d3ffaouyHrC57Gm+5VfLy6xLGyNa3mtY63pmqTP2nS4dpQVBtkaSgx2ks8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776345191; c=relaxed/simple;
	bh=Igi6tnJY9dqW2uqFEAkI8yxBTN/zxFPDtJhiiuyAWw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d4eOAwh86L1Eooci+WUdd3FBM6NCmnQZHEZd/pibOY+CFB3nMutw/pZnfCgQS8fx4hqWAtPlYv91o1khyGMN8DqbYLtqX57td+P77rnz6cC38qiJZxkq2LQGkpOfgNHe3b3K7WnykjjNht41E8Cq4qaoY93lD/5f3zNF8KZRJwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fcfzm8ON; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fcfzm8ON"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a40cfab24dso1894886e87.2
        for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 06:13:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776345187; cv=none;
        d=google.com; s=arc-20240605;
        b=cKvfzvYT7G/q/t+8hRsyF66PbN6UfgbkOMEbxN0zuwy3KE45dg+e5MzplqT3fALr9x
         lMlVQdv3N8bc/+XWxmtI1Qe1R7lPCmt9uwx26RGkKuA9q2GD98cbuzbG9d3Z39rQKC4+
         g0jn2i3Cl7yshlYATz23PPoYyEU3s0jTOZtRIY3ZyVOxciLq+3PLHo6EKhn0if0pV3Zj
         1IS9O0zVHkwwG9Vt2xQXD+VwW05CTz92QQWp67VCtWygisxc7KVsmbYJp5P/ir39d/N2
         DkNGm0webUftlwu2+ZPJOv0hArDLT5Jprxcrv1ba3TqLi+WqvAMQRQ/D7EF0l+b9YjEb
         GqfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JloOiKR7gKouLV0lGcQMz03Isz+4TmwR02S2Q3iy2ZE=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=BSXyhOs/7UqvqN5ahTW4PdBAf9AOrR/k4Vct3hlXZgVqw2/ukKnnLPH+kDPK+WuEIH
         cYSLCdtVyPsqXPkO0VlZiV04DCKyY8XUNKe/wlWouzHSI4yjFvAKbdzR0uOXcbamuuuF
         25vLfmxU6dh7KHOw+cVl3aH73RfrMoGMy0lXtu0HIdFw9MXQguAXObe21rwQr+C+iGkc
         Db2VnheKNmmu24vmqLkF/fgvX1G9xwANEk+RLiXX0k3s13ZhwukMDowGVS38M9c/mT6E
         qgaI4qRolML6gfd3RyIFS6spidwOOPJjJpRoGaI/D6s3fg+zJkU2Af5pIfuUzFyk4lLQ
         kf/A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776345187; x=1776949987; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JloOiKR7gKouLV0lGcQMz03Isz+4TmwR02S2Q3iy2ZE=;
        b=fcfzm8ONad2jl+EjOtAhTU3BhqSJK18+7+4QHPS/KCWjXuVjPDq3m243IrI+XWxnXt
         jjIaiX5KH5pnVjULhJTrvcQtab8OsV6gAMdkYfmADpTHk1bIRTbV04X2qQaGzzqp34g0
         EAB8tMVF8/h2nmLo3osqUHRqjB9KJtVEhZVTID8Zn7ErnzxudVt49JS0JZD0AeDh5ziY
         J/wtMEopLWVq6sGvQm0VuIgAwrPeGk1DDWzsieit3AqBdV2+OopvU0bL6XX62ULBkt3H
         L/TIrOF15PKOMoRBab9Cj5DpRkUuV35J7ps3i2MTwICz87Rv2SihYlDh55cymkC6xyud
         nocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776345187; x=1776949987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JloOiKR7gKouLV0lGcQMz03Isz+4TmwR02S2Q3iy2ZE=;
        b=WdPbDzUNmSZoaHXhIfpRp8e2Tb7oR752Gy2ZRlm5i2ul//u+W0eH8EjBvdsYZdmAPO
         Vr3j29LxxVcbDGf8fMDjya85X7LEk/4AutxTiCc2Kzl7UKajW32xFMZ9frV7w17PCY5m
         fQjWuRMwPJPzeIMO+/bpVTOfxfl4Kf7QEjhksB8xCbE5ypOa1FwUmWo2aW5HbVg1su77
         AlHxjXgNyFyYPyuqlmbknaaltyQdQuQi52WhNQCsi+9xjF2QOLI4h5Jztn+PgQamdKlT
         cFMCBkQYULndKNjJu6cu+2dweSfnXY43wODhAFslOCWNiv51wLG06B8Wp/IdF8V2ZA+i
         4dpw==
X-Gm-Message-State: AOJu0Yw1hLgclo/AaTFju+6DuriCnQKhe+Tm2JqdFGdYlGOkwVXWGhNH
	afMoSFZqcexe2ye8KGftphbMwpoPgb6uwzWGHN5Hr3tfoPPlIfR8SRbfQFytlstxCXTPdd0l9qA
	DtfZOdzGqWBaHgVSq4NjIJO/jmBhZooHgqFBcai7Z1g==
X-Gm-Gg: AeBDiesxO6p2Cz9HyVH7DoPmv4JtHmspWXeDP/PMwr5/JLP83UXqIcDH+KDjsyAl3Vt
	wNyIv2xp0GWyTIC42I/12/K+rHXn+kfsTB7iidMywViNX4o2EGstp4f+Pmr2XptW67SJwg8x+fI
	oBOx1XU+GIjB7gJACj9LuA02F0UKC5TqjbpLAoBGE81Pg/7bZfmEfnxI+eNlSxQ8ssAl43HHatS
	rf2xcUcuaoctvHiOJtmpDsf3OfB/WwWwm5R+kaOWpsxoFRSHLoJDQaWOns4KaNm0wa/7OdoQr3n
	XKaju9wtT/jpynWctvc=
X-Received: by 2002:a05:6512:1248:b0:5a3:ffc6:6600 with SMTP id
 2adb3069b0e04-5a3ffc66782mr5756835e87.31.1776345186718; Thu, 16 Apr 2026
 06:13:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415082654.21026-15-kerneljasonxing@gmail.com> <20260415094721.7C052C19424@smtp.kernel.org>
In-Reply-To: <20260415094721.7C052C19424@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Thu, 16 Apr 2026 21:12:29 +0800
X-Gm-Features: AQROBzCeGXvciSVxk-HpPiNiOGKinHbcNq2f1IMKWCFDQrCxv3yvqsdRowIHJ0E
Message-ID: <CAL+tcoDN3CDCyvgQasEF+7H5K20rJQov6UoVffytY37=ajnFpA@mail.gmail.com>
Subject: Re: [PATCH RFC net-next v4 14/14] xsk: optimize xsk_build_skb for
 batch copy-mode fast path
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 5:47=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 2 potential issue(s):
> - [High] An SKB memory leak occurs when xsk_build_skb() returns an error =
for a newly assigned SKB.
> - [Medium] The prefetch instruction uses the raw AF_XDP descriptor addres=
s without extracting the offset, creating an invalid pointer in unaligned m=
ode.
> --
>
> commit 7bdeef673e571c57c404cb8d05446f46b3e2676e
> Author: Jason Xing <kernelxing@tencent.com>
>
> xsk: optimize xsk_build_skb for batch copy-mode fast path
>
> This commit introduces three targeted optimizations for the batch
> copy-mode TX hot path in XDP sockets, including replacing skb_store_bits(=
)
> with memcpy(), inlining UMEM address computation, and prefetching the
> next descriptor's UMEM data.
>
> > diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> > index 3b3969adfd23f..0fccb0c8cbe90 100644
> > --- a/net/core/skbuff.c
> > +++ b/net/core/skbuff.c
> > @@ -751,14 +751,28 @@ int xsk_alloc_batch_skb(struct xdp_sock *xs, u32 =
nb_pkts, u32 nb_descs, int *err
> >       if (total_truesize)
> >               refcount_add(total_truesize, &xs->sk.sk_wmem_alloc);
> >
> > -     /* Phase 3: Build SKBs with packet data */
> > +     /* Phase 3: Build SKBs with packet data. */
> > +     struct xsk_buff_pool *pool =3D xs->pool;
> > +     void *pool_addrs =3D pool->addrs;
> > +     bool unaligned =3D pool->unaligned;
> > +
> >       for (j =3D 0; j < alloc_descs; j++) {
> > +             u64 addr =3D descs[j].addr;
> > +             void *buffer;
> > +
> > +             if (unaligned)
> > +                     addr =3D xp_unaligned_add_offset_to_addr(addr);
> > +             buffer =3D pool_addrs + addr;
> > +
> > +             if (j + 1 < alloc_descs)
> > +                     prefetch(pool_addrs + descs[j + 1].addr);
>
> Does this prefetch use the raw AF_XDP descriptor address without extracti=
ng
> the offset?
>
> In unaligned mode, an AF_XDP descriptor addr field encodes a chunk offset
> in its upper 16 bits. While xp_unaligned_add_offset_to_addr() is used to
> decode the current descriptor address, the prefetch directly adds
> descs[j + 1].addr to pool_addrs.
>
> Could this result in an out-of-bounds pointer in unaligned mode, failing =
to
> hide memory latency and causing cache pollution?

Will handle unaligned mode soon.

>
> > +
> >               if (!xs->skb) {
> >                       skb =3D skbs[skb_count - 1 - k];
> >                       k++;
> >               }
> >
> > -             skb =3D xsk_build_skb(xs, skb, &descs[j]);
> > +             skb =3D xsk_build_skb(xs, skb, &descs[j], buffer);
> >               if (IS_ERR(skb)) {
> >                       *err =3D PTR_ERR(skb);
> >                       break;
>
> Can this leak the newly assigned SKB if xsk_build_skb() returns an error?

This patch doesn't introduce any new stuff here...

>
> If xsk_build_skb() fails, it returns ERR_PTR(err) and the loop breaks. Si=
nce
> k was already incremented, the cleanup loop in Phase 4 (while (k < i)
> kfree_skb(...)) reclaims unused SKBs starting from the current k, skippin=
g
> the failed SKB at index k - 1.
>
> Could a malicious userspace program exploit this to systematically leak S=
KBs
> by triggering metadata errors?

I confirm this claim is wrong because 1) xsk_build_skb() frees the skb
directly if frag is zero, or 2) __xsk_generic_xmit_batch() takes
responsibility to free xs->skb if frag is not zero and err is not
-EAGAIN.

Thanks,
Jason

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260415082654.21=
026-1-kerneljasonxing@gmail.com?part=3D14
