Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C348035B63C
	for <sashiko@lists.linux.dev>; Sun,  3 May 2026 17:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777830045; cv=none; b=AN2CZFiYxBss0RGjwaN8Li1SENc/FchC9W2x8JU+BMi4zl3SNKM8aRSGXTPM4c7FDpNty9lTus1pu3Zw8JTdSIkHJY1YLLxHSeV5mNNvMCnFpNcJb6boGBjimehIZIszi6EMIZCBHaHs7yTNAgDKuzKU4m+yVP1oCD0079KcPU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777830045; c=relaxed/simple;
	bh=diTjtOZSBlDuVlorgqO7QcZenfW6uXu61u+k+JiCeag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8Z6gQ7jvr8mWdoiesgiItT7aa1VDUvjYo/kXu8lq2pFdAot/AtVlPJKOewQVHxDj5NL3gyAUv7hCfhpOjCvMy8cFE2TRrOXujRe9ms3weFHhpvNMs3m3p2fMkOd6C/0HBPmApWe8E8yoTii32dwDjT2R1plskqyuTItLf5gDZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ScJx+Xpo; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ScJx+Xpo"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82f9fdfc965so1422100b3a.1
        for <sashiko@lists.linux.dev>; Sun, 03 May 2026 10:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777830043; x=1778434843; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=58YBnKX0CXwlWfu0ur+QCTQDeRBv2oh4WTxZbJK9nG0=;
        b=ScJx+XpokOCcupaQ3GcieaYUqKlxqVy9dpoP9eCR9vGxSp+GAzToA30WpZ5jU2Wju2
         jULDi5ad7nM//a/XxeMu3H2tdanrn6KzwTal15uksMCuNS2KR13kXJLqHBu742Y29d2u
         DG75zZEciUQdYXhmIi5GjdFX1MJRNpEHacWztKwSAXaww+6fxgcVostl+eKLiurjYIEc
         J2jJeKBY93B3gi2n8GtDmnas9zVvJ8L0SgcJx2k0sF4mF5x17O0EK9tIvDCvNqfD0Hry
         eWJ7bboTfJ7S0LKdEfAA9OytaPeTZvK8L/WltvBrNOV6qP2lrAMRtxFPoIcI645oOEdU
         MgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777830043; x=1778434843;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=58YBnKX0CXwlWfu0ur+QCTQDeRBv2oh4WTxZbJK9nG0=;
        b=Qmcdq7sx9s7/8nadNVY27FlLjIVvMcwNvxDKJ9UrZhLvhKvsWKC6/54DCRXO1xqEiz
         rfFtLa96uWAyPZSEhIotN5pssfdjjsDwoFGPnjH2THusFWChctbkkvAxYRnudHXKxTRh
         Fa5SCpAGljvw1dorKA/TQjTfjGJ+Wbeoa7joDq06SkrznRRVxnPKc9NLSOgZE5Ldp3y5
         M/+KZrVCHEu6Tjf65sUzjWRvaXshvXRvnZlCVJtSFbejZMwegN6NqUlG3alNEoMXRAnf
         IzrtNCFU9yrt4phBXmz1pGr92HnQjHTr6hO0L0ThaMMdyZlw1ym5RqwGcr/UN0wFp5hP
         4KZw==
X-Gm-Message-State: AOJu0Yznczrpp+6H0SziGXzHVNurLNbhTZ8v9jgMN88PV7vilH9il8j1
	+GHgRx7/VyK/yrDsLkeclxt2fx0KBh2KHkV2g0605iz8qRjzIBpR6CWq76aN5A==
X-Gm-Gg: AeBDieuJw2V/yvyUZBKohbak91vjMI//TuNOAcY8AbuI42j/C/W5h6X4XgnpuJDZzfW
	tP7PmWksThOWy9FVYUsgIRik/6nH5Z+0ex/Fs2cKvKFLuts6RsWuHYt1QYnRTaYDtFE9TFJj4U9
	Flc6ZibAh4tpuOhh0nnOfTxJE3DdD6j+Eyt/AHYJpImVK80nBNIWPIvVn2xUM+0q0VLeAAOCZWB
	pQ5lvOlhmZQp2z7yNfXh8Xn0bEDM5ljazX6qVPJY2010Ur39eCOv/d3PaIkXN0Z/g6N1AoN3Kg2
	asMDS330ODIDZGGWRnXYyf3m/CM2ILoEPXNetU/xiPC+xNOAPTa4fM/V7aj8UoI8rucR6ii71n4
	hUUM6BCW4ONySlmt9pl9ilKOt5UFLmXzaPFGrLfUxoD7TJ22ZseChulkZcBFSmQ2OzZ1n+7d6TY
	1tZzlQCyQvDAEfQdjgDj6TXDVkojI0iugkXGoA0V0uzU4qJHWKTNiD5qAkETiDuMnXLjIy5gKWu
	RI8EJ4F
X-Received: by 2002:a05:6a00:339a:b0:835:685b:8e36 with SMTP id d2e1a72fcca58-835685b90dcmr2045072b3a.29.1777830042852;
        Sun, 03 May 2026 10:40:42 -0700 (PDT)
Received: from google.com (61-230-38-200.dynamic-ip.hinet.net. [61.230.38.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b87869sm9424990b3a.61.2026.05.03.10.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 10:40:42 -0700 (PDT)
Date: Mon, 4 May 2026 01:40:40 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next] m68k, bpf: Add initial BPF JIT compiler support
Message-ID: <afeImOJectVRN3Oa@google.com>
References: <20260429124046.3480827-1-visitorckw@gmail.com>
 <20260429131320.6F6DCC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260429131320.6F6DCC19425@smtp.kernel.org>

On Wed, Apr 29, 2026 at 01:13:19PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Critical] The BPF JIT compiler for m68k suffers from a 16-bit integer overflow when emitting memory instructions for 64-bit values (BPF_DW), resulting in an out-of-bounds read or write by approximately -64KB.
> - [High] BPF-to-BPF function calls will crash the kernel because `emit_call` hardcodes `extra_pass` to `false`.
> --
> 
> commit 700ecd8180ff5bd538d3f6e6f0d7655894abb49b
> Author: Kuan-Wei Chiu <visitorckw@gmail.com>
> 
> m68k, bpf: Add initial BPF JIT compiler support
> 
> Add a BPF JIT compiler for the m68k architecture. Generating m68k machine
> code targeting m68020+ processors.
> 
> > --- /dev/null
> > +++ b/arch/m68k/net/bpf_jit_comp.c
> [ ... ]
> > +static void emit_ldx(const struct bpf_insn *insn, struct jit_ctx *ctx)
> > +{
> [ ... ]
> > +	switch (BPF_SIZE(insn->code)) {
> [ ... ]
> > +	case BPF_DW:
> > +		emit_16(ctx, 0x2028 | (d_hi << 9));		/* move.l d16(%a0), d_hi */
> > +		emit_16(ctx, insn->off);
> > +		emit_16(ctx, 0x2028 | (d_lo << 9));		/* move.l d16+4(%a0), d_lo */
> > +		emit_16(ctx, insn->off + 4);
> > +		break;
> > +	}
> 
> Could adding 4 to insn->off cause a 16-bit signed integer overflow here?
> 
> The BPF instruction offset (insn->off) is a signed 16-bit integer that can
> reach up to 32767 for large map accesses. If insn->off is between 32764 and
> 32767, insn->off + 4 evaluates to a value exceeding the 16-bit signed maximum
> (e.g., 32768, which becomes 0x8000).
> 
> Because m68k hardware sign-extends 16-bit displacements, would emitting
> 0x8000 result in a negative 32-bit displacement (-32768), leading to an
> out-of-bounds memory access roughly 64KB behind the intended safe offset?
> 
> This same pattern appears to be present in emit_stx() and emit_st() for the
> BPF_DW cases as well.

Ack.
Will fix this by emitting a lea 4(%a0), %a0 instruction before the
second memory access.

> 
> [ ... ]
> > +static int emit_call(const struct bpf_insn *insn, struct jit_ctx *ctx)
> > +{
> > +	const s8 arg_regs[] = { BPF_REG_5, BPF_REG_4, BPF_REG_3, BPF_REG_2, BPF_REG_1 };
> > +	const s8 *tmp1 = bpf2m68k[TMP_REG_1];
> > +	u64 func_addr;
> > +	bool fixed;
> > +	int i, err;
> > +
> > +	err = bpf_jit_get_func_addr(ctx->prog, insn, false, &func_addr, &fixed);
> 
> Will this cause the JIT to emit jumps to address 0x0 for BPF-to-BPF function
> calls?
> 
> Calling bpf_jit_get_func_addr() with extra_pass hardcoded to false causes it
> to return a NULL function address for BPF-to-BPF pseudo-calls. Since the real
> addresses are not resolved, does this result in the JIT unconditionally
> emitting jsr (0), which would crash the kernel when executed?

Ack. Will fix this by passing ctx->target != NULL as the argument to
bpf_jit_get_func_addr().

Regards,
Kuan-Wei

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260429124046.3480827-1-visitorckw@gmail.com?part=1
