Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2E54C8FF4
	for <sashiko@lists.linux.dev>; Thu,  4 Jun 2026 17:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780594214; cv=pass; b=DUQypj/isTJJ/429VGRn7hSRQ2NHJ/DnKP4YkeXk7zxWzdur0sdLtoY6RTA1J34d4EHBuCP8/U0U7QvuD16IgM61lZclCere8hy/IKvgs4gVztlnJIq0DHiffxlZ+AqNT2rs/3N6ZkTFPhhjxYiDXhxh+hQUeD2CQL9d7hdokog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780594214; c=relaxed/simple;
	bh=m+4QLcA28bp5G0HKUjL3/lDC/CIvcXD0Vo0dOKDuzgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VrbXxtHBeAC1ZrI+JId+yJjstaXixQalF1o32C2QLi1c990y8zRIFnr9xgAseBfa0tYmjxY+wYatRoewyCyThAmbc9GClrl2Z4cjNZ5Ojc7eUn9JbtSf84TTTnFGNOMjqmGXgTsbBy/VBWHdSdE5A6jDCO+Y5wFq8L2TfJxgdTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sJB2aVnw; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sJB2aVnw"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b7866869so11924185e9.2
        for <sashiko@lists.linux.dev>; Thu, 04 Jun 2026 10:30:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780594210; cv=none;
        d=google.com; s=arc-20240605;
        b=DYR7jr6Rb2du3+UJoHuXVOStdJKzZDRFEPeIwFWo16b19Vpr+EFpKHPkt4xCFrE1Mi
         SMuqzq/zwvuu3kYyP2e9VqqDBKbN5SFQf9KP3ypti00DUqybESivdKZsCypGYngT8W3A
         BFkMcks+RW60RNmxWqfL81Le/0BuLcb9OVa6kloJB8xRLDuTPVaPe4b3d+UQ14yyzcZ1
         CCPUCD8JHGY/gm8gHrgXCnHEk9yxo67eDsxNigcygJuRQJ6cX5lt6SFHjK19w7OF97KA
         CKM397fgODLX1+Tf7NZVl7YuUNJKb0VE44zgBNGaAAH4hWdqQpBiJhzdPXeT717wY1IR
         Ofpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Iy+vz6DUwfjeEDVCsMRZnS+pvi9yyebM3FFxNTQM6/c=;
        fh=HlDwSYGQzTs/sWJqUxIHHBCUNjYWyNth/A6xoL/Wdh4=;
        b=lFkiT8tAzdovVOwAUBKRy2mclVSS0SutbwCMaelE8N5l7ICUDRHQPfYT7qIK9u4UYz
         VBbvvkAuhVDTsKkbFpHSvnvj7el/sdNHVoryJVpjGlLCS2SFv0XlfCatwHeysyvflML5
         lPhBjZK0J7HeMRz82qS8WbtUzwiWw9j5qQGFL3JSPqIp70Emv81NSK+f5O9fMsoqcnQX
         KYKpjR5CSigY2cyCyXB44nSXS4E48BtiIh3PGBC0rTJaqxJZjydz30swetzfW1OTddu1
         4tMqasRDkMOv5ytW49CxYhVT5T8e1ARDNS2hR0WruH0O/7r/xhnvrIHcdYmZ8YRcB4xk
         mTBw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780594210; x=1781199010; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iy+vz6DUwfjeEDVCsMRZnS+pvi9yyebM3FFxNTQM6/c=;
        b=sJB2aVnwbnMP7WGFRtC61J9Vb4ElF+VzxoiYXiegR/z5a2ADIPYqBW+3xWy/wGpLy8
         eqjGn2kpVpwuUfsKWhe6k8sxj5rAy0nbpKHqx9Tr1vSLq1DdLrGSBRnvWWtjL4GnOFNT
         ohJJmZ2y5qbasmuA293bswmuGB6cFa97vaKMt4c+rXx764cfdcAq6pX0VTJhpm5jD0bO
         AqPdoABbP7MtRpJh/e04wKAB9QUFG1lQsieOUgP5Xrw1bhpJfg3bjZY7P5iilCsQBtuw
         7TZO9vBlpER94G3J1EQGYl43OYhT7/U4kdp/F1vitwycPgUVWybAiUzUxQTH6zNI3L2/
         D1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780594210; x=1781199010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Iy+vz6DUwfjeEDVCsMRZnS+pvi9yyebM3FFxNTQM6/c=;
        b=qvdnNGG9UALW5nm88LvX77OgcL6atFludzp2yEeOPuuEG0Ixmfuw3YkeR+3MzgdB0c
         zGBJ5GFujZ925cpOio8GROhzosGAQusQ1tm2QCpTlhOsRqtIgLKfW33hFIP2oZgpk92T
         WJx+VsLXS3H91fdvOVDBp8v/lyvH2qCj/ygIMCFM1HfjDZa6SD74WWv0x3E8ymjaHE9W
         +m5aKWhrAKUzEcN4CW+I9AGGeQtOuqGvDPbylxN4AeT2Yo8pbIg9zJ5qCqU90hObKT2X
         ndycn5WiGX+irSB+NIAzX2CUup9wBKWaBdz5/2/0JOrSGT6oI9KmXam5lFnVBQDFvz8P
         3NgA==
X-Gm-Message-State: AOJu0Yym4mQwxznYgC7gryI5vFjEO8kXGCAdDdlVbAY0G1qBBu+lvFzt
	ZHzfvqs9oQVdH3iRpHP1hQ/WN0iG6k+R0YguxQqj8JdPof6oT4hze4VnJcfoFnSUuK1RPhxoIpv
	G4294cPA33EEjfyvXPZdOBOfnjZB+bX4=
X-Gm-Gg: Acq92OGWZ9Wkoo5jgSszANWFoquzlniKkk0ZHb9+qvvu/vJavt9OmqcDisDDTnFLrYD
	9kQXE5Ag1XjNjtlb65wIE39OZhojTBRtyR2Pr4KwHWtVZvxUmtMZfL8nOshgjUWf+WWA5jvp7Yp
	9FIJi0GE0QzlaatKuww+mO9WkyN4hyryVhYsYN+CtPnju19QpsHqTD/CzS00nurqmiTmvMiY6f5
	lf4G0Lgv2H2BmbwCg+S+TXz4mBpKrF0b2Raz7qjpIRmJq855MmgH7c1Cyyrj5Sgs7xjG52B1Y8+
	D/+17uT8VfMWMihMOXN8+qkxgzXSTflbKqD1djNxWN/hr5trmcDcEWagJfGgkXvdrjy7Sm6Tikx
	vg/2EAmx7hsLqidOy/RkHto3AReZxL1sVMQ==
X-Received: by 2002:a05:600c:c48e:b0:490:625e:bb68 with SMTP id
 5b1f17b1804b1-490b5eb7369mr136430945e9.3.1780594210178; Thu, 04 Jun 2026
 10:30:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260413-kasan-v1-2-1a5831230821@bootlin.com> <20260425050557.827F3C2BCB2@smtp.kernel.org>
 <DJ094TM6SLCC.2FU5ZV435P1UK@bootlin.com> <CAADnVQ+u=pCMcB1=K_WQ3Ae5ML92of+DA1Z-sKRhHq2KoUJbnw@mail.gmail.com>
 <DJ0FMRLUKG6Z.3QLENZVQRK0VL@bootlin.com>
In-Reply-To: <DJ0FMRLUKG6Z.3QLENZVQRK0VL@bootlin.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 4 Jun 2026 10:29:58 -0700
X-Gm-Features: AVVi8CeMl-Jp0vf2YN2r8DUHxEgd4USimJ3GXXd1JeYMdxnMuga2ac4trc1sZ7U
Message-ID: <CAADnVQKgm3CN8BvGL0SSDmoKgokdSbg_DeSzf84NkZHSCz-=Jg@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 2/8] bpf: mark instructions accessing program stack
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: sashiko@lists.linux.dev, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 10:14=E2=80=AFAM Alexis Lothor=C3=A9
<alexis.lothore@bootlin.com> wrote:
>
> On Thu Jun 4, 2026 at 6:24 PM CEST, Alexei Starovoitov wrote:
> > On Thu, Jun 4, 2026 at 5:23=E2=80=AFAM Alexis Lothor=C3=A9
> > <alexis.lothore@bootlin.com> wrote:
> >>
> >> On Sat Apr 25, 2026 at 7:05 AM CEST, sashiko-bot wrote:
> >>
> >> [...]
> >>
> >> >>  #define LR_FRAMENO_BITS     3
> >> >>  #define LR_SPI_BITS 6
> >> > [ ... ]
> >> >> @@ -6493,6 +6498,8 @@ static int check_mem_access(struct bpf_verifi=
er_env *env, int insn_idx, u32 regn
> >> >>              else
> >> >>                      err =3D check_stack_write(env, regno, off, siz=
e,
> >> >>                                              value_regno, insn_idx)=
;
> >> >> +
> >> >> +            mark_insn_accesses_stack(env, insn_idx);
> >> >
> >> > Global subprograms are verified independently of their call sites, a=
nd pointer
> >> > arguments are tracked as PTR_TO_MEM rather than PTR_TO_STACK. Inside=
 the
> >> > subprogram, check_mem_access() evaluates loads and stores under the
> >> > PTR_TO_MEM branch, which does not invoke mark_insn_accesses_stack().
> >> >
> >> > If a BPF caller dynamically passes a pointer to its stack as an argu=
ment to
> >> > the global subprogram, will the JIT-compiled global subprogram execu=
te with
> >> > KASAN checks enabled for those accesses?
> >> >
> >> > Does this erroneously monitor the BPF stack, bypassing the intended
> >> > suppression mechanism?
> >>
> >> After having thought about this one for quite some time, I see no
> >> simple way to correctly distinguish stack accesses hidden behing a
> >> PTR_TO_MEM passed to a global subprog, as those are verified separatel=
y.
> >>
> >> I can either:
> >> 1. skip PTR_TO_MEM memory instrumentation when we are in global
> >> subprograms, at the risk of missing instrumentation on passed memory
> >> accesses that _need_ to be instrumented
> >> 2. systematically instrument passed PTR_TO_MEM memory accesses in glob=
al
> >> subprog, at the risk of inserting unneeded instrumentation when the
> >> passed memory comes in fact from caller memory.
> >>
> >> I then propose to be conservative and apply 2:  the only downside I ca=
n
> >> think of is that a few alwasy-passing kasan checks will be inserted, b=
ut
> >> we are at least sure not to miss any instrumentation.
> >
> > Isn't it the other way around? Replacing LDX with asan_load() will
> > check stack access, but it doesn't have shadow memory behind it?
> > Or you mean to assume kasan_vmalloc and vmalloced_stack kconfig?
>
> Ah yes, my bad, I did not state it explicitely, but my point above
> indeed assumes that we are with CONFIG_KASAN_VMALLOC and
> CONFIG_VMAP_STACK

ok, then it's an ok path forward. Better than option 1,
since skipping all of PTR_TO_MEM in global subprogs would leave a big gap.
