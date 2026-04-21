Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDAF3A0B28
	for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 08:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776761806; cv=none; b=BpdmxCDK40atsBR5PoxH5t97rL60IwM2AYDuRVxk8lvhFvBmtjo1CZM5ZCblC3gptah72BEJKWdAt3L42HIq7v3R/JN233RckH2EX7uuSpFM/WgE322fLRpKBGxfBhdkcEpD3SUHSsFp/1TXlfp44zUAUs0AhTd2r04joBbjEnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776761806; c=relaxed/simple;
	bh=3dhBzQ+bbdEpVIHq6VxRxN5V+WYOijQC+dXe5oLtaOk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/fo8QKITOlRDWSSJnl7tandT7+UWTfj7zXDw9c0BNpTtxXh9KfULf7k91V6c6lAQl70KbuF8HKzLLsJ6b6t3dtNXWEWDn5XR8OQ1LiB44J44i6GAF4Bi6VEmcs2j51S06dQ58ICOrRG5DUVnf8U7etD7NXNVb/9LWCNk+rscHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gu4JZX/q; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gu4JZX/q"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso17829365e9.2
        for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 01:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776761803; x=1777366603; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EvjVgrD7wUaMF/ip8CIwfCZPYUhhfg7yiwwpu15Oxlk=;
        b=gu4JZX/qXSwrlsmAlYNXy/yDwRupmdKtjc53NT4JZeXi6t2USCSC0WP9x5fLo3gO4A
         EP8P9iEYANvzabuPqOL3MNW1EsPK2wNrLT5JLLgIRBKyAwRTRfMY11p0TwkJmWJ27VQb
         ewByH1hN8RY/CmW7VYifAL/bXKgd21c5fPdpISh5Wm1BJsQbOaiMHdioWzpOfbA3do8i
         6xbeGBv0tR2h5F7S7ZSEZbq9hkohBTjOvf6sCiXT/FAO0SA6LC5+/82L0Yt0VgFaLa0W
         O5pyQtELsqCoXCVY928RH0ILjHsZNOIst4vT34NJtHreZbDYRSRVCfDrcdyLIM8mlhpH
         FzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776761803; x=1777366603;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EvjVgrD7wUaMF/ip8CIwfCZPYUhhfg7yiwwpu15Oxlk=;
        b=LMGg7MC+JwCiDMJZLoP+/l2XZmZEMLz8uU22aEdRoxc5aFewZtNhAq37y3BDO4Kkyl
         1teFA51PcEO7GSXvCUQAz0W7G9pM7Q31/uiOCb24kEDwZdzBGrNlfqatqjOG65fBFayp
         Kkuc2temFGq34wVyW/vOZP5iHwSHGCgK3Q9RmSrxGM1oT+4k5ZnfZN1ZswH7AdVcWJ93
         OXFAbZMlFxlobSCZAaduSkT5L8mFmIQtjGBY202i+VcZfFRMP56zXvXoNvYilI7nToGb
         IV5BV3jEuUyTg03I3xtIXC0mfJz8LUjdaosdjoMe67lVxODxDCos3uwFs/q0chWFGGn0
         A6bw==
X-Gm-Message-State: AOJu0YxlUPywp0pJPSvv0L0cIhs3lpeQ/dV9/gsLhguq4FsJ+K/Yl5+O
	/w+FkdVqg66nMyTNCEzrWnaWlO5fRGIIYbU5+ZNmGcY1FahyGcVGy8uRgt16z5zy
X-Gm-Gg: AeBDievlmRX+i8BBZvXnEUWYqH7GNfSnrqbAh2106BlUGNKnbrSeS7A+VdUum2aA46h
	UFc7Fuf6bffAIr9sB0VA9tlE7EnDtDFOyJh0yajiu/3A5uCSEdFb9M6+7tYH3lupw7ENP4JGbg/
	+XMW3Sps6d2pHd1J553Jtu7OJTdFELgXFVk4eTsnQWYpNZKYUYzPQd6f9TaLNuvEOyqMLztJzXm
	hj4wM7lneMM3DJfBtiT1WplzIWM7P1Lo0SkRtlR7kuZEeDMMPQnZqJhLFNMBCd6tQV0QdU7qa1n
	/cAP00kzTEecUXpECNiZPIbPOcxeI3pLqt8Ooq0wcbvJNfrtblUVOQtcrRKWnhT1etfgqLTsmLl
	MuNIQgQcbBJ7bT+2o9/oUQLmqFX8F508uo67XmuWfdETqwjYM/XzbLfo6OICv6u42TqDvV3Bnfi
	RXH3LVNn1vT3CNAjgkjg==
X-Received: by 2002:a05:600c:1da1:b0:488:79a3:f04c with SMTP id 5b1f17b1804b1-488fb7863femr258221345e9.27.1776761803250;
        Tue, 21 Apr 2026 01:56:43 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200::d99c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb735d3dsm229577645e9.2.2026.04.21.01.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 01:56:42 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 21 Apr 2026 10:56:41 +0200
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv5 bpf-next 18/28] libbpf: Add bpf_link_create support for
 tracing_multi link
Message-ID: <aec7yX-RdKmzBZuo@krava>
References: <20260417192502.194548-19-jolsa@kernel.org>
 <20260418035011.164BEC19424@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260418035011.164BEC19424@smtp.kernel.org>

On Sat, Apr 18, 2026 at 03:50:10AM +0000, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 1 potential issue(s):
> - [Low] The patch relies on UAPI identifiers (`BPF_TRACE_FENTRY_MULTI`, `BPF_TRACE_FEXIT_MULTI`, `BPF_TRACE_FSESSION_MULTI` and `attr.link_create.tracing_multi`) that are missing from the kernel's UAPI headers.
> --
> 
> commit c0f93aeff516311471202b8e10f7e659acca62b7
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> libbpf: Add bpf_link_create support for tracing_multi link
> 
> This commit adds bpf_link_create support for the tracing_multi link,
> introducing a new tracing_multi record in struct bpf_link_create_opts.
> 
> > diff --git a/tools/lib/bpf/bpf.c b/tools/lib/bpf/bpf.c
> > index 5846de3642090..ad4c94b6758d3 100644
> > --- a/tools/lib/bpf/bpf.c
> > +++ b/tools/lib/bpf/bpf.c
> > @@ -790,6 +790,15 @@ int bpf_link_create(int prog_fd, int target_fd,
> >  		if (!OPTS_ZEROED(opts, uprobe_multi))
> >  			return libbpf_err(-EINVAL);
> >  		break;
> > +	case BPF_TRACE_FENTRY_MULTI:
> > +	case BPF_TRACE_FEXIT_MULTI:
> > +	case BPF_TRACE_FSESSION_MULTI:
> > +		attr.link_create.tracing_multi.ids = ptr_to_u64(OPTS_GET(opts, tracing_multi.ids, 0));
> 
> Are BPF_TRACE_FENTRY_MULTI, BPF_TRACE_FEXIT_MULTI, BPF_TRACE_FSESSION_MULTI,
> and attr.link_create.tracing_multi defined in the kernel's UAPI headers?

it part of the related kernel patches:
  bpf: Add multi tracing attach types
  bpf: Add support for tracing multi link

jirka


> 
> It looks like these enum variants and the tracing_multi structure within the
> link_create union of union bpf_attr are missing from include/uapi/linux/bpf.h
> and tools/include/uapi/linux/bpf.h. Attempting to use these undeclared
> identifiers breaks compilation. Is there a missing patch in this series that
> updates the UAPI headers?
> 
> > +		attr.link_create.tracing_multi.cookies = ptr_to_u64(OPTS_GET(opts, tracing_multi.cookies, 0));
> > +		attr.link_create.tracing_multi.cnt = OPTS_GET(opts, tracing_multi.cnt, 0);
> > +		if (!OPTS_ZEROED(opts, tracing_multi))
> > +			return libbpf_err(-EINVAL);
> > +		break;
> >  	case BPF_TRACE_RAW_TP:
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260417192502.194548-19-jolsa@kernel.org?part=1
