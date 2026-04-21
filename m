Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761CA39F165
	for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 08:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776761799; cv=none; b=CDEz9WPMzx/x9Gkh1JB/0RYvJk+KcwneTVFh6pR9VHwA0ufT+8JwqbXS1UJWfVkredmQWWSKewsfzdE7MWdaSz4alJLtLL9f71hDdVukjxrqaXGyIWdiw6nbaIIyuB1Tdqd0cSqjUvyZmQVgLxu8rgcijImBGTYCAAEBg4II81o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776761799; c=relaxed/simple;
	bh=xFe6GTxk5OpjI0bwR0p4DbCifJm1OGLBMKQ/rkuKQB4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dBYmmNIu/qaW5avGoAmG4Y1TzjLE3QXGZL4qWJHWRNAZ7gfEUsIxEpyxZrpjxxDppmV5ewNxcItigYsyOBwb4fuojEjx1ZxzqWClmdTX/zDnSZ+befKyQ7R2duK2Tze3tknlPCK9M+w3UBjlOpB1o1KPOqsK0nZRfHJXEcCxhjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1RZvvs1; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1RZvvs1"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso33790025e9.3
        for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 01:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776761797; x=1777366597; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fJGTnZ/i4iiKDQkhhblybqqq0JPrJTq68F+X2OSciiY=;
        b=I1RZvvs1E8FpFxflHjLi3gKArDQirjiIkQpTWMNZ8tn0OaUYj+eOIBekI3L8t2byx6
         zMqcqjJ8DTRy+oVRJGRghUduZ8VmXcLfNXaDUlXca5Mz+E/sVPErEXw+4QNvMpEybaFc
         4/Pas9GA09/5y4458drlDbnz2S4Q6kx1Ql66REztRDlBOz6Fjdwn0Pft+7Ujx+jLnH02
         +sCuafHqmet/EZaAFS+zpk6SdtweArI524WsASZq2YSR0B25DIykEN1FOMHGVuI+K+IV
         Dw2mHbQem87bkNtiYAI4iCmXq9ZowKvjwt/ZNdUfHutnTqTuRolLX1u2tPOC+qbn0bAM
         Vm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776761797; x=1777366597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fJGTnZ/i4iiKDQkhhblybqqq0JPrJTq68F+X2OSciiY=;
        b=fKRprJdEMlE7dVa2DodpL1dDRhIez+8rsisJaj7jOzj2sAlmDmaYUpy1RW47fWWt8m
         qERxFXSkWk2eklJEa43KnUl3CxGGyuLwteQM2jeb3KauAuIBnYFsYfsDhZ9iOptpBPs/
         E3N0R2nRvNck0Kv1hyMSOak6kyjy2DnJKSpfvTlCS935fE20h+EU0qjYxmeOKQFyGGlw
         77UINZ6KIT9Hr/AWl+KCrNF7HYmD1UwPrUo91YNyZ/W58T+O03vXh3j6tBwvad7eCHhG
         gzIDqltcpiZfxaAiq1xfF8ZseRyOqhW3byznZ8G4wWR8n8QiZVUwo6yk9uZjPBqFnMWx
         5M2A==
X-Gm-Message-State: AOJu0YxM/qt8+vbGoVALk/4Xbs7tZqy8FU7J7+vGoHVLMT6KLBcjfkkq
	r7SXdwR5AIzZ+iEZ4EMwvqsiOjkuzWaq1R8OmGujopRNHfjB3Oxu24Xi5I3MN/kn
X-Gm-Gg: AeBDies5Y8Fya1KYDlGrX/zKK261Z1ADICjS68Q6gMzpWwn3Sv42jilEn2tpCIVfGDv
	f0Fpafyskbkk/to/77VFBLjLBpHiRxxv1i8DRpHvz1PqDOH99Q4dGB8SeAvBHliiY+f8hkopSuH
	1YRHC73o4AKiDJNkXL22EbWmaHElc7vt0Es8uvL/SxS6lV66r0fVOIW1Bq6ajsOR+Q+yUWjn4Cw
	SWHYC5IOBSUui+BA83OpT6UwstOhPO1ph8IxLK2bkZDoP59uyooyEOOER3onktWVC6J/lTvEh2g
	M1ShrCwYT6x5MT+QP6StYlLjdvmd0ZAAzNeIxr3xXWO6vInXFpjXufyN7V1bg0QziKwVeOyA9JQ
	on8RGfubHVgL+W4oe4e396kXXyANE5WoTuLbwhpHeIHFwu2Qm4jZtdJiqKdhtlJ+y7q4MKq+Ojo
	RcDcyGRagfyl+/Sj8rnA==
X-Received: by 2002:a05:600c:1da1:b0:488:79a3:f04c with SMTP id 5b1f17b1804b1-488fb7863femr258215435e9.27.1776761796740;
        Tue, 21 Apr 2026 01:56:36 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200::d99c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb77b001sm160916955e9.3.2026.04.21.01.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 01:56:36 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 21 Apr 2026 10:56:34 +0200
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv5 bpf-next 13/28] bpf: Add support for tracing multi link
Message-ID: <aec7woEWsDxnDvqv@krava>
References: <20260417192502.194548-14-jolsa@kernel.org>
 <20260418085839.ADC19C19424@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418085839.ADC19C19424@smtp.kernel.org>

On Sat, Apr 18, 2026 at 08:58:39AM +0000, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 1 potential issue(s):
> - [Low] The patch references several undeclared identifiers and incomplete types, causing compilation failures.
> --
> 
> commit fc7697083b71bebef41d2da3a91ca2a0741ad6f0
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> bpf: Add support for tracing multi link
> 
> Adding a new link to allow attaching a BPF program to multiple function
> BTF IDs, represented by struct bpf_tracing_multi_link.
> 
> > diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> > index a3c0214ca9341..da3e01dd7ee9a 100644
> > --- a/kernel/bpf/syscall.c
> > +++ b/kernel/bpf/syscall.c
> [ ... ]
> > @@ -5748,6 +5748,8 @@ static int link_create(union bpf_attr *attr, bpfptr_t uattr)
> >  			ret = bpf_iter_link_attach(attr, uattr, prog);
> >  		else if (prog->expected_attach_type == BPF_LSM_CGROUP)
> >  			ret = cgroup_bpf_link_attach(attr, prog);
> > +		else if (is_tracing_multi(prog->expected_attach_type))
> > +			ret = bpf_tracing_multi_attach(prog, attr);
> 
> Is is_tracing_multi() defined anywhere? It doesn't appear to be declared
> in this patch or the existing kernel tree, which could lead to a build
> failure.

it's added in "bpf: Add multi tracing attach types"

> 
> > diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> > index af7079aa0f36d..df06a733a2e71 100644
> > --- a/kernel/trace/bpf_trace.c
> > +++ b/kernel/trace/bpf_trace.c
> [ ... ]
> > +static void bpf_tracing_multi_link_release(struct bpf_link *link)
> > +{
> > +	struct bpf_tracing_multi_link *tr_link =
> > +		container_of(link, struct bpf_tracing_multi_link, link);
> > +
> > +	WARN_ON_ONCE(bpf_trampoline_multi_detach(link->prog, tr_link));
> > +}
> 
> Where is struct bpf_tracing_multi_link defined? It seems to be an
> incomplete type here. 
> 
> Similarly, bpf_trampoline_multi_detach() doesn't appear to be declared in
> this patch. Will this cause compilation errors when dereferencing or
> calling these?

defined in previous patch "bpf: Add bpf_trampoline_multi_attach/detach functions"

> 
> [ ... ]
> > +	err = bpf_link_prime(&link->link, &link_primer);
> > +	if (err)
> > +		goto error;
> > +
> > +	link->nodes_cnt = cnt;
> > +
> > +	err = bpf_trampoline_multi_attach(prog, ids, link);
> 
> Does bpf_trampoline_multi_attach() also miss a declaration?

defined in previous patch "bpf: Add bpf_trampoline_multi_attach/detach functions"

what do I miss? ;-)

jirka
