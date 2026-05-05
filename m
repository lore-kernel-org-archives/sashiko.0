Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C517A3D6CC5
	for <sashiko@lists.linux.dev>; Tue,  5 May 2026 19:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778009856; cv=pass; b=ps1mTbh2PZX97iWO7pLqcMbHiVkHY0DcUCKXDddaaQMjJN1JKrVV5nurlFNFjok8TbkbmYjT733SowoGgiy1kzFWkoIpIRpSSHuWPwE8xqk1VmEfBfm7OGcUjh03Hx7sE81VhkN45YKKSw/5V7wAHWhOcwB9+aQrtu+5Dh77a7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778009856; c=relaxed/simple;
	bh=a3zVB/5vAYynCtb4zf8lzhkLA1AuHgKmJ2HODw/ZOT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MBt3Hk7pPJjc48lpphKZ9aEoEMcgLfZPFpLBl+WdfEBvxaOlNoqGyGRcea0Rk7f9Iffyj3LjGotlX1UuYB3nawfrMkwkVSzREnaEzskEvod8DSm1WqqvuhHLPU3oHcrEK2/HxNwV1ZOcOxENU4AMydLC5uhPh9R4YHlHpgVnQiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n4yGbrmA; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n4yGbrmA"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39378db197aso38842161fa.3
        for <sashiko@lists.linux.dev>; Tue, 05 May 2026 12:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778009852; cv=none;
        d=google.com; s=arc-20240605;
        b=gU9Djew5kat4M7IQByv6umrgRpVyQdsrGMVg9Nrs9GEezlrB2s5ZqldNGB1xe8spd6
         r3QsaZ/jW9wRhkCtdcQsCBCGDQeTPfLA1BWkshFSt5zdZ3wTcjx0KrNKYytnarK9szlH
         xj+RaxQ2RLy63pqiCzSHmDkkbdOzrmr2IRnN5NfnbnqeUXlgvXz8Cc09M5V7OxnyMcPm
         dhV5XA6+s8M7SsRWfPG1zlR/YyYTguozghkywhnm6T5pnyYFFS7WZi8bDrWFPbJle+g2
         gzllgZd4jVtc+naRFyrEkJoedDNPpBVfkTprONBfWPJYWFdMvljrMdjMeIlQW8yOKdUC
         z62A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AyTGTquhOThBRNg9Rcr6RTDs9jq+NcxIxr17tuis9js=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=SkRowzFpaVnHzTPcQ/tOSxGtfbRb+rg+dJpXnj2vETeql585OP46bHtxYoZL1us+75
         llU0humGUgDScgZMsPqZe4f2CAJIYQ3qFxHPmBrD1j0A3a3dHQhLqLWzGjJRO0KSwF8f
         i8gEJU/hL0tyg5NIC4W5Sv2tDVAVMUElqp9pVcAT22A3DlWXoRi29Nqfyl09VydHJZ66
         Afeejj06uEj0i806I9VxBlcrc+vG49xfUmkgoWpy9CHiMCczGuscrCz/M10SWkcJOUJn
         C+csI2CBBBXQdpASFLUNBaS5z7CcVCOC7k8J0w1vFhMoliNgxLpWwR79NlH10CZkspX4
         RYHA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778009852; x=1778614652; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyTGTquhOThBRNg9Rcr6RTDs9jq+NcxIxr17tuis9js=;
        b=n4yGbrmAUgxroNDRTyWIyWVosFeKwuNZ1vEQDNTdWaC7h7ozUbptR6oTNJn9kRgFqP
         m3jVmBibXj2ZgW/lIR/gd2Soo8iY2rOlQTjS2kPNh/SEC1XaVvqtBaW4FJywuO/eqZts
         tq/o8K+fADNBcX8dLp5D5dacdgzahsWl7sWg//9UveXVTNtMaOGOIEnhsCgCMqClUG4b
         oj4LPiyk2t9QkqMMFK6CuOPTQKSamottDfVn5hRA7Cwuot3fGIhwnyTzv2OxIu3lTGxK
         kFgg9hnBj3BvfmXQ/k+La4YjjawB8TqKf/FaVMGhbA7MXxSG8bsTWnz2SGa6jVGfw57T
         17aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778009852; x=1778614652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AyTGTquhOThBRNg9Rcr6RTDs9jq+NcxIxr17tuis9js=;
        b=PeePfHJCkh/dPViZfD/HlTUCAgPlv2rx8Ye/TRZUIiMsUB2cz9jZ9Lm5sLo1MTOmgS
         jfCTluoo8s1MSF51/mH8nMPblWF/HJfTYWjyNhLSLTRdKvhXL0b+J6h2qB4MIaS8tumG
         a7EWUpJ3EQMUdDNz82Zgjvo5BpKYvDoCKweoXI7IkO7UbHYPODYDQYt0j5SK39O9ZA7W
         rPXCyLrdk/115F9nfYAqBLLdFd5nUAMHfHFUIAfHCmoTAoeU4lQSCy0+KzRS47zRwQo9
         +5pz8BOoBrEqK0yuXDo1gv57gmQ4y11AGDMMvz65J65PTNqt76jnZel1fcRPQJuTDpjU
         ShkA==
X-Gm-Message-State: AOJu0Yx92QkJHg0BAHVtU1OTymc24hoH5FdD63oM4K/cdcBa2W8NUFkN
	arpen+QdL/2somx8nrcdOzFx04xWTn2boUSmI17k8/mXE1LKxdpaitbdRlHb6fbNvOsykFyw3ii
	eFhajwK+IdbghtbvXcyHb6nQc60A4OmthAjyM1vFPnA==
X-Gm-Gg: AeBDiesd48TDmMx5yyMxsJZPEnZj6fOMGZMqkDoFw3jo/3kLmaalRDWMiAfHu+ik874
	rfOcNJj9v7TOh3NCVvHGoYfxz/aXxJQThOc/s//Q6f3bBbs2Y3ixuEXlGzOUIIVJbl31HLoLqPD
	Nkwg8wOoDV5/TQ0jmlVPkyFPdSSQUb7gTnOKeJKEQt0pzjocHhWB95VC89unh4TnY0AFEValA1v
	Hj6Kl2MiMoaqfzcWFE4i3ufgTGpL9T11v5uJ9+gorFOlUzAjj4B1eC2sGyaNjZzCDXMAlNoA1Vt
	eklVfm7eKAmYUdz8cQrjadL2Xt3Ae3BdbQClPM3WXJV5LB1g
X-Received: by 2002:a05:6512:128b:b0:5a8:750c:2f79 with SMTP id
 2adb3069b0e04-5a887adfdbemr38798e87.3.1778009852279; Tue, 05 May 2026
 12:37:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260502200722.53960-6-kerneljasonxing@gmail.com> <20260503200926.A500AC2BCB4@smtp.kernel.org>
In-Reply-To: <20260503200926.A500AC2BCB4@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Tue, 5 May 2026 22:36:53 +0300
X-Gm-Features: AVHnY4Lv4vujM9OdF2Kv59LtFWowj4-r1E10gZUeClG3VQAR8iTW2QBhQqUgW2g
Message-ID: <CAL+tcoAio7SLOWBh7LJp_9syGFAD+P8HbG1CzbF=cgrVN+agog@mail.gmail.com>
Subject: Re: [PATCH net v5 5/8] xsk: prevent CQ desync when freeing half-built
 skbs in xsk_build_skb()
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 3, 2026 at 11:09=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] In `xsk_build_skb_zerocopy()`, if `xsk_skb_metadata()` fails, th=
e newly allocated `skb` is leaked.
> --
>
> commit 88b75ff1d12b482a55e1724cc457909cf3ea19dd
> Author: Jason Xing <kerneljasonxing@gmail.com>
>
> xsk: prevent CQ desync when freeing half-built skbs in xsk_build_skb()
>
> Postpone the skb initialization phase in xsk_build_skb() until the first
> frag allocation is completed to prevent the skb destructor from running
> on error paths. Before the initialization, the skb can be safely freed
> by kfree_skb().
>
> Closes: https://lore.kernel.org/all/20260419045822.843BFC2BCAF@smtp.kerne=
l.org/
>
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > index 55378c3855d5..af3c5752bb63 100644
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
> > @@ -819,8 +819,6 @@ static struct sk_buff *xsk_build_skb_zerocopy(struc=
t xdp_sock *xs,
> >                       return ERR_PTR(err);
> >
> >               skb_reserve(skb, hr);
> > -
> > -             xsk_skb_init_misc(skb, xs, desc->addr);
> >               if (desc->options & XDP_TX_METADATA) {
> >                       err =3D xsk_skb_metadata(skb, buffer, desc, pool,=
 hr);
> >                       if (unlikely(err))
>
> Could this leak the newly allocated skb if xsk_skb_metadata() fails?
>
> If xsk_skb_metadata() returns an error, xsk_build_skb_zerocopy() will ret=
urn
> ERR_PTR(err) directly without freeing the skb.
>
> The caller receives the error pointer, sets its local skb variable to NUL=
L,
> and jumps to the free_err label:
>
> net/xdp/xsk.c:xsk_build_skb() {
>     ...
>         if (dev->priv_flags & IFF_TX_SKB_NO_LINEAR) {
>                 skb =3D xsk_build_skb_zerocopy(xs, desc);
>                 if (IS_ERR(skb)) {
>                         err =3D PTR_ERR(skb);
>                         skb =3D NULL;
>                         goto free_err;
>                 }
>     ...
> }
>
> Because the skb is explicitly nullified here, the kfree_skb(skb) call in
> the cleanup path is bypassed, leaving the socket buffer and its associate=
d
> sk_wmem_alloc charge leaked.
>
> While this pre-existing issue is explicitly fixed later in this patch ser=
ies
> in commit "xsk: avoid skb leak in XDP_TX_METADATA case", should it be
> addressed earlier to ensure intermediate states remain safe during a bise=
ct?

No, again, I've mentioned this previously. Not the same issue here. No
more severe issue is caused because of this. And it is fixed in the
series.

Thanks,
Jason

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260502200722.53=
960-1-kerneljasonxing@gmail.com?part=3D5
