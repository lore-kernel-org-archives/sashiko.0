Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E207283FC8
	for <sashiko@lists.linux.dev>; Wed, 15 Apr 2026 12:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257225; cv=pass; b=NWZkOCcu+3uQ7i5Ht1yURKOWaxZSkGRZR1ciFIle9qYbfyFa9jp1ci7MwlJxI8xi4fCVckM8dtYdpkzPktOwqFOtj3ZvW69MTa1arvxoBqQK5cUhwuk+zknR6c+jKhbsDPiNALiUYP3F8t3kFEa5DeBrgcyrZHzPx2TMIX3CDPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257225; c=relaxed/simple;
	bh=7r2bJR8KsrQzLNaDQYOwVaBSyqRffRu0q/J+AwtGkRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SCU3o1PAmFHfRtL2fwDWEXxCwVfWpEAvkpCcCDSSkP4Ux2NqCdZkr7ImXqdHrHdHMu+ZWvi0W7UXmdrValuXUf8NZ88rf98Gku3ftymDU1/16zWgqrfrWW70WxvzKJA9xPh1M/0x7gzfcNwZyPBtwTdJ7PnQSfR2cm2V5DFV6Kw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sPZRPuRA; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sPZRPuRA"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59e4989dacdso9549304e87.1
        for <sashiko@lists.linux.dev>; Wed, 15 Apr 2026 05:47:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776257221; cv=none;
        d=google.com; s=arc-20240605;
        b=VyU6SrJwOeYX+ln8QmfMwMQHAtCuwxOVkVt3JwBWe+eHY3wZMwBzu66afO+USLj3Sf
         apQbGPPyt7l1GFiOY+PXZ2HOyFkovhPj0zhfWS3I8yHSbHKWq/XflW12M7F3aEk1ftke
         mqu4U2MUVmjfqTBd7ecMTsUc0/7KgaQXmebwoUraLtOY1LU95g07FWzZ/0ZwTGLudlfB
         nRHKaqNdconvui2WQiBUzzrA/m7qSROVq/dyY3wB/m6aYD7Md0KEUxDF79ndx37n1bFO
         TTyAKd35A0osbVwKSfLUmjm4DZVH83UmQsPagft7Uh0cASkuqXU8RyGwLGobDqsU4xRD
         83YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hLC685DtI3sbpd+l9TIrRi7xH7TjLQTUlTqJTD2I4tw=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=MhOM3bvkZoaQsN1/9WG9qTd/7G15b9zSRJuNTDzRLeFKarUsPIOGLI4oSf+8+TcniM
         k6FPYMP8kDWzqeH6Y6bjlWWVycDFt7wtMLHZJcOkfNgOG1WQVZ9XCMcRT2kFJKpMwOlH
         uHa6nFglPgxnRZxiZ5hpFzppA0hJHcPhdh6JjQr4INcj9Ay8VoKZwChFd7XTOGMeJ/Zx
         lTIHWV2tKkhK4p7MZvyT+pqwEG2Rj4ETxp1ryqWsM9rX4XRlFyvY1dVnVpseUZkLGcBI
         4f92tcvH4Yoszh/dfHYMAGilkOAhbqH0LoVBEwBarWZpU24hLoI1mmwK+pj8rUlBPkNC
         aVbQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776257221; x=1776862021; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLC685DtI3sbpd+l9TIrRi7xH7TjLQTUlTqJTD2I4tw=;
        b=sPZRPuRA3D4ch4YyfpUqBcmkH3KRKWA/JFyqrW14XPwE7jN1BilibbzoBQE8XaBM9y
         2yPzaW3PkoBNp3MPc1SUhUhopilL2TWuzMmexeqXXelBFNQMp0CFNXlSvAdyhPQ41Eor
         +vCSX8stjEG9Z9oNrnq0tCKdOu7n0DP+q+v+jLeAnF1YvBdx2sbkf1yIv1kDM98shbcY
         t+0gPd/2CQcQ0DhWD6HU6NyxLWxyXwHUbVoqcPILUaRTPc7W/zdboHcHjqq0jVn8HO7+
         3pThdlzKMO7KTvTLwrY0zKlVU/cQzJM+aHs3TOP3t2tvU9J5OHgYcMYxBCqgvJcDgJfd
         rF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776257221; x=1776862021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hLC685DtI3sbpd+l9TIrRi7xH7TjLQTUlTqJTD2I4tw=;
        b=nPwliMdVPbUKw3CEsq366Iww3zhLPs/vEg67qJj/W1x83HOGdeUXSN4boJFvNifko8
         UsIaiH9OvToWMJDlMhGV5kJaOzSJxotEg21ilIYp1tok/iht3QiVdU2zSeq/4RQaB1hz
         vgRuaNV8vqKXXWXsq9v1vYvLb/IG8DBhm9JZ69mq+GbfTCIBMhgKDWxxm/HRJt4opK5p
         aAZlYvQl4tx+EvSWWHME/GcQQ9ZukS+QwrWWqw7UhV0QYk5ar/Tt3YSunvGt3m1VLsmj
         QQg3wC+6+xHAQVfcVmnqeYJAXwus0zwaJLoejzV+iQZ4unQwBcBRXh62MlvJES9CZKQo
         Om/w==
X-Gm-Message-State: AOJu0YydBHRaOzvpa4OLe/YlKcecfKxU+vz2hwqt2MzVhoEYpWFtBR0Y
	1XBbwbeQhLFzjHsntdTh7QZWdhK/9wj37+jO+L4AZ/j0zT0MuMSTRGdUeLr4EVqJf+mhBryGUyb
	XaCamX8XHrHJvkMM0oqLbZX0cjoMLImms+R3RmzZB6CVe
X-Gm-Gg: AeBDietJ/jmeGiBZ6MRZc/EKcpcSOtyQ/5XZWPnAdCEevjvhfDjuzV0k5JQ8OQhLUca
	64zHbWf+2teDIXf1WA474QQHbT/YN/Y5zkUIbdV6ubSiCmMp5kgv9b+biBMbLklHh0iqT0Ot4nF
	pXX2Fb+AoKne2L4vCGDAngkhcgXUotz+WF052BN7RUuUJwXNxhwNhBfxpZi9jlKn/UNZ5Kn8Y8G
	5e8U8GLrQvpdvUSa425/EW2XAMvq91lgKnpzMMSnSVGme5pb5+o9bG/MoRhyMXfeDXsagEdAfMY
	1EG/zy1w+naisouQRg==
X-Received: by 2002:a05:6512:3ba8:b0:5a2:be40:312 with SMTP id
 2adb3069b0e04-5a3efb2c40emr6151215e87.2.1776257219717; Wed, 15 Apr 2026
 05:46:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415082654.21026-2-kerneljasonxing@gmail.com> <20260415085138.703C8C19424@smtp.kernel.org>
In-Reply-To: <20260415085138.703C8C19424@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Wed, 15 Apr 2026 20:46:22 +0800
X-Gm-Features: AQROBzC98LkunFAXvPz8KqDBlD6LfR4VlGyVaQDNUzaIq-Mn-z8LE-U42xl_mfM
Message-ID: <CAL+tcoAcuMq_SZNvXAettKcj-wmLstJUHiBCGjdPEc2C_iVc8w@mail.gmail.com>
Subject: Re: [PATCH RFC net-next v4 01/14] xsk: introduce XDP_GENERIC_XMIT_BATCH
 setsockopt
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 4:51=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 1 potential issue(s):
> - [High] Unsafe array allocation using kmalloc for a potentially large, u=
ser-controlled size
> --
>
> commit 16fdf26210767cd884154d2717d7894d96a2ee54
> Author: Jason Xing <kernelxing@tencent.com>
> xsk: introduce XDP_GENERIC_XMIT_BATCH setsockopt
>
> This commit introduces the XDP_GENERIC_XMIT_BATCH setsockopt to allow
> batch processing in copy mode, attempting to improve throughput by
> allocating and initializing multiple skbs at one time.
>
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > index 3b46bc635c432..1194268ae8676 100644
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
> [ ... ]
> > @@ -1582,6 +1593,42 @@ static int xsk_setsockopt(struct socket *sock, i=
nt level, int optname,
> >               WRITE_ONCE(xs->max_tx_budget, budget);
> >               return 0;
> >       }
> > +     case XDP_GENERIC_XMIT_BATCH:
> > +     {
> > +             struct xsk_buff_pool *pool =3D xs->pool;
> > +             struct xsk_batch *batch =3D &xs->batch;
> > +             struct xdp_desc *descs;
> > +             struct sk_buff **skbs;
> > +             unsigned int size;
> > +             int ret =3D 0;
> > +
> > +             if (optlen !=3D sizeof(size))
> > +                     return -EINVAL;
> > +             if (copy_from_sockptr(&size, optval, sizeof(size)))
> > +                     return -EFAULT;
> > +             if (size =3D=3D batch->generic_xmit_batch)
> > +                     return 0;
> > +             if (!size || size > xs->max_tx_budget || !pool)
> > +                     return -EACCES;
> > +
> > +             mutex_lock(&xs->mutex);
> > +             skbs =3D kmalloc(size * sizeof(struct sk_buff *), GFP_KER=
NEL);
>
> Can the requested size here become large enough to trigger high-order
> allocation failures under memory fragmentation?
>
> Since size is bounded by xs->max_tx_budget, which follows the TX ring
> entries, it looks like this could reach up to 65536 on some configuration=
s.
> A 512KB contiguous allocation via kmalloc might fail on long-running
> systems and trigger page allocation warnings in the kernel log.
>
> Also, since size is a user-provided value bounded only by the maximum
> budget, could the open-coded multiplication overflow on 32-bit platforms?
>
> Would it be safer to use kvmalloc_array() here to prevent both integer
> overflows and the dependency on physically contiguous memory, similar to
> how kvcalloc() is used for the descs array right below it?

kvmalloc_array() indeed makes more sense. Will update it.

Thanks,
Jason
