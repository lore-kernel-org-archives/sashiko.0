Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58166331203
	for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 08:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776761692; cv=none; b=p9IXOsBAr36nZ+jEPWdRPdl9N2/WdXYN5WNZQZDoo5Kn7hKWNrTyCen9EZlIDrTVPtGrN40+P6WZkOHVRY235dIiki6mqXXW2X5uHQOksM2IhXEg9A33V7iVj7J96A6SUHby75iH0AJ94Cbyw1nBRgH7vhrdCa5KJzKM3h+920Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776761692; c=relaxed/simple;
	bh=7xGIne/B7lQhIRzggFV9bZEPeJ5QAiX46dvSj8cMi2A=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bqUhAjXzxP8PddKEhDpQU+UUUHDBDqHRqUBXdweEO2oo//qzrd9W3Wf7LRF2Oog+d5OVcxYLES/zjIoR5UnYsIdFu+7OMckjeONe0ME7RUYhG2Cp7WkJFMiEIJ0YU3DbrxrAFffo/5d1caligVxJEEE/3xpVqg5pHOe9qi5/NMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B2bjO2Da; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B2bjO2Da"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso17810405e9.2
        for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 01:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776761689; x=1777366489; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fVWbN9Xa8VHe4NPF50cJNaRWYZta6ICN9f2+GKEM6pE=;
        b=B2bjO2Dajbk7T5aAhr1BHTuOA+J2tFiH5EKmx0j+Y9NixNEUH6sfrJ3dfLahLUpMlw
         ZDDCtag7vZxHhpVLYPk5kF0m3JD0E9Ccb2D8Nlr9OF+loDpqylVRLm3vYDtocfapUY4A
         Bq4mfHApGvRvLgpMQOTNAcufMouLka8Qn7o6Xt5aZfZxL9UlOdGx48NMFZrdZ6qL0msi
         pHJTSMkqp703/4JAN6hUCPvNs1dZ3fj0y3YSfskRIPL4ByCEr9Vjk+kCver186ijAR6e
         9wgjhkoFGH/R8M6wDGaWNmeUqOrDLjtY4H3qKcrnC5TgZjMXNcUehz1lBCoKzIVUO9y4
         E7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776761689; x=1777366489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fVWbN9Xa8VHe4NPF50cJNaRWYZta6ICN9f2+GKEM6pE=;
        b=T4Cl2SIEkkZMLAAsv11CdAccwaIm2NK6vI8fqMg1bcRgj+yiR6MzThllezkUynyP8k
         B0U0IUYGY2+Oq78j8XsHbB1K0A6CuhZwXEIhUnBbzLvWrhRpexH6Os74L4tZYQthpGyT
         ZvSfhpPZoq9ZcOh0IE+kVlBPcLCt9DDpDLyp40VNKzhfT4fcgj3Ai4AsKBSro0y77nPu
         D1dFmGBeL/B4ooGjbPLI5yPRRdGbFl+AHsoMbqMAk+Q0fGJMpU6kDH0Nk5vzXfp+ngcR
         TMzTLKD+KfrHY6W4Ei48jQqqJmQLRMW6++jYVNfPX6/xMWpg7S66s7VIANjump1fxE7c
         ueIA==
X-Gm-Message-State: AOJu0Ywi8g2igHv3tp7ELIw13yRFqAYqO170XfOFE2tDwYHnXohD0xPP
	VISZ3NBIyLVCYwbEc1L1y3lniCL4P9+fwLAdPsqu/ZNGHlTDKhPvOxOg1HtFT/hu
X-Gm-Gg: AeBDiesxX7nKiKiew/hVnvvznndu6FdAatd6lJxnKtxGKEARTpjvk+SNBMy6ua5Lapz
	jEF8s2LMsI/fLGArPtlGi7YVMfWD5O1kzbES0Tx0NbTeAM4MiAnsUIgW181u1AyUHoM9lJq7KCj
	iScIrU5GNUx1OrjllXOUCosFnbcBizjQVCQfbnMiRP5OxA9YKvolRNa4jTIPx8QMsrhDqrXig0c
	ri/ZxZNXO/WX2ThTy2QvTm7kKlHPOJNVA60npRaa96uZdZNxiKnNOpGPWNGr45UaSdypsgn2rwh
	f7a89mhvU+Qc+xJuGnpzwY+VCypJzvU2Dqo8C7dJgoFdMWQy+oIXW5sCKZ/SnOy9Bvyy6vG97Jy
	RtvUYf97+MDTYoLOOTZ2DVLp0TAei61+wThWwiuJUzxbPJkDI9rizJ51Zj60Nk+nz96uNDZu0Wu
	jAIcrdHLo=
X-Received: by 2002:a05:600c:5285:b0:48a:5333:811e with SMTP id 5b1f17b1804b1-48a53338269mr69751535e9.15.1776761688531;
        Tue, 21 Apr 2026 01:54:48 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200::d99c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a52d232afsm26326085e9.31.2026.04.21.01.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 01:54:48 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 21 Apr 2026 10:54:46 +0200
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv5 bpf-next 01/28] ftrace: Add ftrace_hash_count function
Message-ID: <aec7Vqu2wVDbx8QU@krava>
References: <20260417192502.194548-2-jolsa@kernel.org>
 <20260418005821.4F156C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418005821.4F156C19425@smtp.kernel.org>

On Sat, Apr 18, 2026 at 12:58:20AM +0000, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 1 potential issue(s):
> - [Low] ftrace_hash_count() is declared under CONFIG_DYNAMIC_FTRACE but defined under CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS, leading to potential linker errors.
> --
> 
> commit 62c46ea6c0c10abc0df16b7c684809496d439e2f
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> ftrace: Add ftrace_hash_count function
> 
> This commit adds an external ftrace_hash_count function so the hash
> count can be obtained outside of the ftrace object.
> 
> > diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> > index 28b30c6f10314..9d9ae1bc692ae 100644
> > --- a/include/linux/ftrace.h
> > +++ b/include/linux/ftrace.h
> > @@ -415,6 +415,7 @@ struct ftrace_hash *alloc_ftrace_hash(int size_bits);
> >  void free_ftrace_hash(struct ftrace_hash *hash);
> >  struct ftrace_func_entry *add_ftrace_hash_entry_direct(struct ftrace_hash *hash,
> >  						       unsigned long ip, unsigned long direct);
> > +unsigned long ftrace_hash_count(struct ftrace_hash *hash);
> >  
> >  /* The hash used to know what functions callbacks trace */
> >  struct ftrace_ops_hash {
> 
> [ ... ]
> 
> > diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> > index b2611de3f5943..57ab01fd00bda 100644
> > --- a/kernel/trace/ftrace.c
> > +++ b/kernel/trace/ftrace.c
> > @@ -6288,11 +6288,16 @@ int modify_ftrace_direct(struct ftrace_ops *ops, unsigned long addr)
> >  }
> >  EXPORT_SYMBOL_GPL(modify_ftrace_direct);
> >  
> > -static unsigned long hash_count(struct ftrace_hash *hash)
> > +static inline unsigned long hash_count(struct ftrace_hash *hash)
> >  {
> >  	return hash ? hash->count : 0;
> >  }
> >  
> > +unsigned long ftrace_hash_count(struct ftrace_hash *hash)
> > +{
> > +	return hash_count(hash);
> > +}
> > +
> 
> If a kernel is configured with CONFIG_DYNAMIC_FTRACE=y but 
> CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=n, will this result in a linker error?
> 
> The declaration in include/linux/ftrace.h is located under 
> CONFIG_DYNAMIC_FTRACE, but this definition in kernel/trace/ftrace.c is placed 
> inside a CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS block.
> 
> Code built-in to the kernel (like BPF or tracing extensions) that attempts 
> to use this new API could compile successfully but fail to link on 
> architectures that do not support direct ftrace calls.

right, will check the compilation for such config

jirka
