Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792453366;
	b=fVoBXSRlqpgdv9gOgmX0kAoVzPu5KsUlpn1YAnVEJBIUChc7EE99aSUKRYBjeWuUAq5i
	 ao+7lv2O08fXmiOPtGFklNGV7QM0WlgF8by/eBnZ3oQQTE0GkdX1EoIrIPQCL1tTYbkAs
	 ZXiG3BvU8OWg9f1H12oOuEaFpiuSHEqeoWRMW5D9OK58edEG7hBytyYltHyNMgEdU+68d
	 EZdYwaipw5pLPRVuoINEGHzy5x/R39ApqmTxBkmRXxeiJbznTuaAygLRMhlk/4j+a3yHa
	 6C0Thvu5GWg05CZIBiv/9AoGSmGQ8waiA0HaAnSFyFfzHD6YzCgoQzUAvEV1Qm0777g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792453366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=efOq3Uu6fSityn6AP6iYoSvvn3VGVoHN0sBJDydjyd8=;
	b=kzAgNvbz2M0XP6ZJAq1sPQb2eEBQJBuOJlx88RoyJvYpTQcWn7MyfVgoYITQrDfih6Vl
	 glADYR31r9lSj3fuc07yYPm6qXZkT3DhIhXXzLqkk23ToBumFIoznlYJrSztBVrSNSebA
	 zhQkfEpX8hyquk3g4j3kQtyerXclN0mu2IWt2Piw7sFM6R6TnT7QYoQSUH2CcXsrXdrLi
	 WkqqMPwDvWuuIrkY63h/NpncActsXum5Y5QWIBvby3vDJy9Q49NpQr/yZr6m0qWs9NRgj
	 SD1m6P5hpRbqotE8UCmb6qkEQiZJRqwJqRrhZ3QXGcANDYLhwc8/zR+wXbu0w9TmcKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oAU0oNy7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEC0606A319
	for <sashiko@lists.linux.dev>; Mon, 19 Oct 2026 23:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBEC0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oAU0oNy7
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so130657f8f.0
        for <sashiko@lists.linux.dev>; Mon, 19 Oct 2026 16:42:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792453364; cv=none;
        d=google.com; s=arc-20260327;
        b=rN0l3GCNiErzaZDkypEI1DLrSFD/AK9cn0uAONRRTAdW7bWSfKOVuWrAHYSoSupSYi
         c969K/7/btLBoo9PsqakI2OE74ss1U63fyU+WVDoPPD1t5IoUqyD2FkPxsyxwA5F51Ul
         +t56bQqYF8qeJClsS8oYaOTbv7r4jDm+g0vwozugxahr9/Aefb/Ff350Yfp4cWkwtxM5
         ARtyu7F6UvKEJcKY4WCLV9YLEcjLov2S8S+0aIsMmr//ZMdnBWSTvSWr0z4AvTu22cpQ
         Z4qmgT4LhgaYA+iTMBGiP39MsUDgOG+3sg8Wrq2lPyxI+QOUv+Dq8Xqqd03kZiqZvdfD
         ZZ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=efOq3Uu6fSityn6AP6iYoSvvn3VGVoHN0sBJDydjyd8=;
        fh=pthpONoXCh/WBSyS6lyn95fljebNYrucEEuvImLb6Uk=;
        b=Usl6dbMnQyHVRoEt/pUlyB/BefDNFejxNKU61nf3jwMRaYnOAraZCUxCmSDhirvLsI
         2sAMnd3GvYpqLBULeLTH/GlgP16N5ooPDHaJevxqwVptQiWk/vu4/T1vtqKAKTtq86Rc
         c0EHDSvL/l0IKF4B6+cdn1fX22TPrBS4awIH84R6/0IxmuYS+yPeNN5susMpPOZ5KCgD
         qiFpsSaRXCKt7YAle53GVsTju8hrys9d6cFDglcUhkBBzEO1+c1dBRDbq7bcAUJBNRTW
         q1K6bZ8n3r2gFa0hVIYO728Cw+aeV9muLUqT6gHONnW49MuH6IORaMbmgxPueszzqxoX
         Juqw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792453364; x=1793058164; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=efOq3Uu6fSityn6AP6iYoSvvn3VGVoHN0sBJDydjyd8=;
        b=oAU0oNy7SSX/nL2l8Hlz5H3oUJTPkT7dU67P4G6+eok8vgjgrvOu0EFFNjGnvz4mgc
         oIX3QX+wBweWwmtUnSU/7LOaFdtqbAuRNsZA36qCJJ0wL1Gzzq0lvuWReJeY5YLjPtKI
         BseChI3VDcnVoj8RA4ixz38M5JqPxF19DtYggRbNUM6OHyIT8ZCnwH3N6eKAQgVthGhq
         FpXz3VFUNV7cdp1N9zUhAbe4T0EhDWBSJtKlACn1jP/YVK1RgRSWxgDZjPndl3mVcd8J
         81vItfefUYlB3i46hsAumxxGfPv9Ejn3VBPOAaCuNfHi0QfQp9q4EdUopVR/+nlAhGww
         hnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792453364; x=1793058164;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=efOq3Uu6fSityn6AP6iYoSvvn3VGVoHN0sBJDydjyd8=;
        b=GUlobWY/6nfWJdelt/gTSBNnotz7yrsByKwkBygrBBKNfIpoVQQYMV6142xNNu0miZ
         0kF07+B6pE1DnMWFee2eYSYzFv+Pi4qP44lDo2AphSd9h4EVgNqkQl5OtdxCOQU5iuNq
         V2Xgn1EUnSqylngGu8WIM9s90yjGnH2nuq+yTv+A4NO9q+es10RWhbSDA7MxswoFNHco
         +aCjmId4RiweH7ADATwHyqPmBX3nvyWNqokugEqJY0Q57Z04TbWzu/ykr9aI7dS6kftz
         WM/EALvZrpYMy10p3mbE+jpGFpFCyP8meS4vLjqhyKSvuUCJECxcelLe+kOujaCBd2LA
         Kv5Q==
X-Gm-Message-State: AFq9FYLlUlu1UzAe2ZFJ8Wep4Et9XVULivkLLCeDiElOLkQdGXcMlBvf
	hArLVhXat61XJrukjT6gW4wqxr9aNvM2F4TdlYtzBoDLWPug/vTEljPjp/7V1yFTnnt4+PANcwf
	e8HOUvtgoOAIiRqpTgthZtO3qLVFnXdx5st1N
X-Gm-Gg: AYBFou0PPeW+zPYu/puJDxZJ+z10+U5Ll3KRlL8xmROWQP1W35fY7f/65iKVG6Aa0VF
	UkEPWf5b+j0uT7/pNA1KpFg5QY5AmIjVF5skxED0wDtiGjYNrwzsiCGKWBr4HWctI7EGMnVYILJ
	LgMBXGYtihDTU6ciNR6DN6xvwM7zHcNNKk4CCUIV0KYx29jRbkmFyHXvIJ6e8ApWWCcvDgvWUDf
	O9liAphX1wgzAaq1f8NlTpzSur3YdqBIuP40NQKez5tClXTGmQvF3h2HzWoxrjifaAh22uqpA9u
	bxT7T/2r8cDbaQPDx9rZebwGT2A5nUUaWFel0kzTMpOnxeBvLgAXVrPNRNRs2o/DSgi8G+SU67J
	daOV1r0YRbxrpMA==
X-Received: by 2002:a05:6000:2c12:b0:48e:eb:56c5 with SMTP id
 ffacd0b85a97d-48e1e75993dmr1315493f8f.8.1792453364109; Mon, 19 Oct 2026
 16:42:44 -0700 (PDT)
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAPDEY+VjQ2p3uWXV19DLWCotW2wJwf1PwRdDkuzjyw6fvGx72A@mail.gmail.com>
 <7ia4a4o9btod.fsf@castle.c.googlers.com>
In-Reply-To: <7ia4a4o9btod.fsf@castle.c.googlers.com>
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Date: Mon, 19 Oct 2026 16:42:32 -0700
X-Gm-Features: AclHuK_8Ak023o7O5TF6RTluODsIowWEZJf0LfjqLcQRiFZ06jlPDlPCxa3MShQ
Message-ID: <CAPDEY+ULa_FpjffBtiBgDsbm5AnD36QjRcDObkSgQVj_QsNoQw@mail.gmail.com>
Subject: Re: Sashiko support for additional OSS projects
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: "sashiko@lists.linux.dev" <sashiko@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 8:23=E2=80=AFAM Roman Gushchin <roman.gushchin@linu=
x.dev> wrote:
>
> Mariia Nikitash <nikitash.mariiaw@gmail.com> writes:
>
> > Hi,
> >
> > I=E2=80=99ve been exploring Sashiko=E2=80=99s support for projects beyo=
nd Linux,
> > including the ongoing work around GCC, and was curious whether there=E2=
=80=99s
> > any broader direction toward a generic/default review path for
> > projects that don=E2=80=99t have dedicated Sashiko workflows or prompt =
sets.
> >
> > Is this something already being explored, or is the intended direction
> > to continue adding project-specific workflows as new projects are
> > supported?
>
> Hi Mariia,
>


Hi,


> My current thinking is that we can apply the approach tested on Linux to
> other OSS projects semi-automatically: agentically build benchmarks
> based on historically known issues and/or public discussions, then
> agentically build a custom framework and prompts and iterate based on
> benchmarks. This is what has been done with gcc.
>
> Is there a value in fully automating it? Maybe, but I'd first prove that
> it works on some other large OSS project, like gcc.
>
> Also some projects unlike Linux have extensive test suites, so maybe
> they should be better integrated into the workflow.
>
> > I=E2=80=99d be interested in contributing to this area and would apprec=
iate
> > any pointers to existing discussions or work in progress.
>
> You're more than welcome!

Thanks a lot, Roman. I=E2=80=99ll look more closely at the GCC work and thi=
nk
more about the test-suite point too.

Mariia
