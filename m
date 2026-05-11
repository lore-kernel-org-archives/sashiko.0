Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B140426699
	for <sashiko@lists.linux.dev>; Mon, 11 May 2026 16:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778518754; cv=pass; b=h8mFw1u194QB37+xE9nHFdJT6wHZV7WgyDNe8fuaLMuK/lRDseTPD8flg1Q+M5Xmh8X4Mk+qomKlrFK7kOJPqBzm0EWlzUBf44EnarP+cS/u49wbQOpDGtBhk52o4dc+J4ydqTNRong99NIiYx/MGhWCigocl7kzRrOgkLPeJlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778518754; c=relaxed/simple;
	bh=Ha0rRvKWgkAo6Nig7EHFpVxlc12HQ2cMdD7ndqS7YVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZQLWqawpkz4ytjz5d824kw/IDUCa3cxU2r6eA0kg+mdc87OSPdgescavuNJ5q2EHOsHq2Cclc8zVjsxb+0+7cfjoYzu3DwYP90hXY+6SLewpGaLTgV6EPN3ujALH2rCtme01GdFJUSTIAc23yLSLhhK1oU91LOrzPn4i/FcisAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qRcWeKGv; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qRcWeKGv"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b4583f0a1aso29185865ad.3
        for <sashiko@lists.linux.dev>; Mon, 11 May 2026 09:59:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778518752; cv=none;
        d=google.com; s=arc-20240605;
        b=XCujGYdH0E8Tsl6nXla5OE/IHL3R+Q9kNchSn3DrwliT+ivvbKiwUG0jlptdPJFi7j
         90/KBeCsLKOBWCjLjUYSjlvgI1eku/kPkgew3wYzaNtKyEnG9VtN9SckZXuCh2lu0UIV
         0JMZJzb3lI7o9DQIH/jWXKQ3XnXSdTj6czASfvVMXuaAWlVRJlKzL0cNlmWpi2RL5E/A
         CTHqoDzvYBPEoHHl10bX2NXIj6v1pPQfQH6vl343MO17JPZXTM+z8vsLRJsYAysALQMv
         bihNbqcbIEvchhoKMnA26vOv2PqyN1HGdDRMs90v6Uyf3Almb1rSPcdrp1miypmBpHWh
         Ukcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0r6Qq+ozy7faGnRk36eo9W/uT7KOLT+2idzut1OQJ0g=;
        fh=rFkvtcwi5BgoMcGe76VE6iqH0R7YXpwqYb1UDU1M7eQ=;
        b=eouSvkDJmA7dJe9LkanVUqKvaLbKzvFpXGIrtmjZnPJu9ApWdpbRp2gjqmqbRXL5ql
         o9WDC3lYaigfByQ0AZxprG2BuYwBEWIARLVqkL8AAeL9oIYJHHjfslORMb0bLn0NXFTK
         d/MadTqbjQCPbiJNLI6jvnxjSDYaA6ZGMKzUa70i5FEY4tC03MqnyIkYPbGIDjKXCQPE
         hM1h0+cEPaj9M0cZ9EOAAqLokDa78WPTXauvLjk82JBPiFJ8scuaY8gAq132WOmymymz
         2gFisedk8/FLrLikRsax6DRKsglD3qFU31AhU3FtbOhkrR8Qj4vUZGaYwZbCgBImfDTX
         TaGQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778518752; x=1779123552; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0r6Qq+ozy7faGnRk36eo9W/uT7KOLT+2idzut1OQJ0g=;
        b=qRcWeKGvshej70NlM7NR5s7YuSIxpvCrSoZOMyVNZl15+hNzeMJpO/gZk32oENyvvM
         8vXNHrgxaHsZXyD2ODC+3adDdFXGZTJTCuc/najUHOxWbQYEp5SGtO/60lzJMP4L+BNb
         xo2bT9zrP2FJQcSUlKhJqVKeGhvtNYapp7rsxctNPODJhVUVQ4SBH/UAXYO27Aw+PfRB
         b2ZGQr/9G6pQBWQY8QPjTpjtGzRPQKFUUcavVr2hhPJEHGHvzDwecoouAJoRf64LgGC6
         ZgZBzRG5DZdOCl+Z98KTYn7pTiZoOFAkwkGSvpDHbpodepdzUjeyZV6eQ8hT/Di5XeyF
         Me3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778518752; x=1779123552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0r6Qq+ozy7faGnRk36eo9W/uT7KOLT+2idzut1OQJ0g=;
        b=FKpDKjlGVbZ2fk22tIfG99k6nJaOS017mXtMyfhRxMW8BVc/6IljihuBuLJOn4QI8i
         /MJhJZjRy8d91wvn8QU2J0pYEmybyS8qGlmDMdW0/lGKVSaLPum0kIZkjao4wZZ4XGb9
         JOTCgjoFcLbVfLnNod9Z/QBaV3NXDYdIfzkNvs4LO2GC9ryALiDYHUBkh5vlSwfqc38v
         CqtFAadY0OVosMnTmVcpnbLd0yAWaoIDRvrTGkUGqWQrHl0vk8zcKtKMvmK5ZzoVl+rx
         GgZcnXrOO5zdPWxOp1EOyyEV42pRYvxw0nF9phDtqi4MwJEbesmQ6E/CQAcYmFjjH0rD
         SSHg==
X-Gm-Message-State: AOJu0Yw+dfJDmD7sM6o/99YlNOAokg4KTiadHiiRM8LaGsVm3mfYWKAE
	Mtuxou26vW++xgTU7yUm+9QBcQ/uk6M2xdK7JY2I6s3MfsPOtABYQRBn+Xct9VxC4DqVBIiJ2RJ
	YS1kIf1M9A4WAlHV1d2FLNwqu5In/VhN2fw==
X-Gm-Gg: Acq92OEGRkweGgIciaFPyleyyhE5m4qqajKmDXoMjBEYm42LwV6qgwG9rRsDbcnwTkY
	8POU3hLH2pt5/T14XgmlAYSFNeq3EjlqOgD8YZ5BBpuq/ZhKemhQft67qsUIMu8KWZY0G2/uBTU
	NWdH20bUW3MhJP8ZEmZxYW3Z6cS+mwcL3uiGM6FA1UMuh7Xrnbn5Bex3HEZ2bW4EU+4Ig461MyJ
	FcSJCyelPMkuyLzljgJp1iUUXU4jl4iwo8pBy8f78TOPwi7IJFUx1bmm/bF2PXzsc7QHjembusy
	Wgb87w4C1/95XEWdYuEjYCF6vqF8AH0tM8tzEFjRmaof
X-Received: by 2002:a17:902:d60d:b0:2b0:bed1:46f7 with SMTP id
 d9443c01a7336-2bc7ac7e1f1mr110862585ad.37.1778518752260; Mon, 11 May 2026
 09:59:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260509003146.976844-2-andrii@kernel.org> <20260509021238.AE98FC2BCB0@smtp.kernel.org>
In-Reply-To: <20260509021238.AE98FC2BCB0@smtp.kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 11 May 2026 18:58:59 +0200
X-Gm-Features: AVHnY4LI-Ux-85n2hwrEp9RoQJwdvgmdyEYc_4E1KQulnnf0EoIFed0iqKrIYe0
Message-ID: <CAEf4BzZ-nASpoF+-vLYZ1D8eWRVd5JWAuhrwx8XZNrX7ZPY5_Q@mail.gmail.com>
Subject: Re: [PATCH bpf 2/2] selftests/bpf: Add tests for uprobe nop5 red zone clobbering
To: sashiko@lists.linux.dev
Cc: Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 7:12=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The `optimized_red_zone` USDT subtest is brittle and may produ=
ce false positive passes because it relies on the compiler arbitrarily plac=
ing operands in the stack's red zone.
> --
>
> commit 1fbbd69b145cd2d80be83d6482e65179431782ac
> Author: Andrii Nakryiko <andrii@kernel.org>
>
> selftests/bpf: Add tests for uprobe nop5 red zone clobbering
>
> This commit adds tests to verify that the uprobe nop5 CALL optimization d=
oes
> not clobber the x86-64 stack red zone. It introduces an assembly-level te=
st
> and a USDT subtest which intends to trigger a probe in a function where t=
he
> compiler places operands in the red zone.
>
> > diff --git a/tools/testing/selftests/bpf/usdt_2.c b/tools/testing/selft=
ests/bpf/usdt_2.c
> > index 789883aaca4c3..fc7e6d220a38b 100644
> > --- a/tools/testing/selftests/bpf/usdt_2.c
> > +++ b/tools/testing/selftests/bpf/usdt_2.c
>
> [ ... ]
>
> > @@ -13,4 +13,17 @@ void usdt_2(void)
> >       USDT(optimized_attach, usdt_2);
> >  }
> >
> > +static volatile unsigned long usdt_red_zone_arg1 =3D 0xDEADBEEF;
> > +static volatile unsigned long usdt_red_zone_arg2 =3D 0xCAFEBABE;
> > +static volatile unsigned long usdt_red_zone_arg3 =3D 0xFEEDFACE;
> > +
> > +void __attribute__((noinline)) usdt_red_zone_trigger(void)
> > +{
> > +     unsigned long a1 =3D usdt_red_zone_arg1;
> > +     unsigned long a2 =3D usdt_red_zone_arg2;
> > +     unsigned long a3 =3D usdt_red_zone_arg3;
> > +
> > +     USDT(optimized_attach, usdt_red_zone, a1, a2, a3);
>
> Is this test reliable across different compiler versions and optimization=
s?
>

No it's not, which is why I added an assembly-based test as well. It
doesn't hurt to have a C-level example which does trigger a red zone
issue in practice to show the issue is not hypothetical. But I can
also drop it, if people think it's unnecessary.

> The x86-64 USDT macro uses the "nor" inline assembly constraint, which al=
lows
> the compiler to allocate these operands to CPU registers. Because there i=
s no
> register pressure in usdt_red_zone_trigger(), modern compilers might allo=
cate
> the local variables a1, a2, and a3 directly to registers rather than the
> stack's red zone.

we compile selftests in -O0 mode, so unlikely, but in release mode it
will definitely be optimized like that

>
> If the operands are placed in registers, the uprobe CALL optimization
> clobbering [rsp-8] will not corrupt them. This could cause the test to pa=
ss
> even on buggy kernels, creating a false positive.
>
> Would it be safer to explicitly force these operands into the red zone
> using inline assembly constraints, rather than depending on the compiler'=
s
> register allocator?
>
> > +}
> > +
> >  #endif
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509003146.97=
6844-1-andrii@kernel.org?part=3D2
