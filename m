Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1B73A3835
	for <sashiko@lists.linux.dev>; Fri, 24 Apr 2026 11:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777029885; cv=none; b=SsYEUXWC7YAPt2vc//yBkg9YAHZ3QX8RzlpXgMQ3k+2yL3SSj/2eHRGx+f8dhgf9sEVu0Fx4xSEXLsrVcwY/HNHwvAwfj0p9suS+wCHV1+daZfPOpOUePkJDKGWykqs105JOVSOjgtfJFK8fDa+t1atz3o5/hwWKkzKllq6iTtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777029885; c=relaxed/simple;
	bh=MPVqFn8B9p4RrwT5jsaR0Lw7tNeeJ1n1bdyEL325lLk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUL1AJ76w4HTsQ90Xyandt1FVVkZuysPsCZyVTyRTrISmv0j6lLjrz8unNlTWQn+YZVQilbQ2VdG6/71h4dVKC1hxrC2BTZCxff1ma095YVYVLSUuLwX5HMo3zZ/SmJTkdDMrk9nbrtNAaqVB+taDgS8NXLUeb0Z4cuOOqz7/IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJUyDsKX; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJUyDsKX"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d7645adbdso4176540f8f.1
        for <sashiko@lists.linux.dev>; Fri, 24 Apr 2026 04:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777029883; x=1777634683; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hw7+DtCe4V1xDBwAGJTClYpq+4ukLefYtebXjXI5aJw=;
        b=bJUyDsKX1I+yrOYWc0Y10D8wUHq1PX/Qpi289RpPw1KwHQH3T4poa7LhQUVHQ96Itj
         yaC6mvkcJUo3nMAxWN+wHtQR0+CEHGuhKO3ZSjhzgjfqdR6GwdpCDoG+t+4d+e9qa71k
         Sacyat2sgdjq2+/fo1CeDkRA5NUTK5A82F5POBQ/YpiUyesClGniA5m6c8d0fspbJdGw
         j2JsRC2xcCc12xgtiK0UaVPZ6nOP6MfQBQ5F93XCuKT3iWOYh0ivOGX5/ngQ2MrYt7/b
         EkX3Ia69QNcr/X6KtaGD56MVgUSoM/PKkmi8nHJpJL82K6EJ6RM/I3DpeBBFg2QRhTha
         9yUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777029883; x=1777634683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hw7+DtCe4V1xDBwAGJTClYpq+4ukLefYtebXjXI5aJw=;
        b=cKTQrgcRMQUElGfcED/uR3T3Hrp+1cNXeEqxw55SxdzYt3x/Yc3LC8M8HxzQ2hXvYD
         tRRACkbYCnjDbPt5dEEsT8xZSURU9lqgchPtGOCrhAGf1Jc9wr5jU0ixZ3/v2zwciUiq
         JzdyXnypnsi2zJddl5mg6UukkVi9KkQ5iS9UP3lsXp2sQVaAI7EemLKLl/6UYB/VPSst
         Q4R43a7X8sfsdU7IJAl+wjjTViUAZldGlofTnt2lwiwWv47e3DWLRcSyq/4FlBSweBQk
         B2uCN/WGTm7zKyiq5hDjCyuB0thutYcvtyPai9FO32MQijRB6xnYi5joMeTFpcCqBRMW
         C2gA==
X-Gm-Message-State: AOJu0YyfgLQgxQDtNic4L5yiiM2mdTeukfNQoOvj+jMhOGIfWSfLw9L9
	tSqZN04TjTDbIrLoIipGjd+oU3kw46UfVOo+5snWJR/trWW0iZaufrIoRULxYes5
X-Gm-Gg: AeBDiesT4xt9Y9Cp7MLoHfL45+afNKrYlhrA/AKpR6KSZ1Rk2eD1AL8KdXRQ8WVmvHt
	BD40PBGnf2xnnK1XsLjcHv2h7gD0/RY9+wQs73eZz3g8uYyBZ7jBwA1pbBTaKTcxMM4klmM9w7o
	AIBnKDSB5QdhIV/qSfQwD+UVmuFCct4oRc00Hq7OQ/jKEVfNXSnCDU5+rC2QIPBl/bqIN31IXYQ
	Kk9gooYbD8VluLW5mAJZ0l1eyeuh9zQE8U65MP0TnHeGXlXW7mYjKyDtiDK3XlJ/mY2E6c6ctTL
	uco/bqFbbMKPOq0m7jxIeRiJ7I5Y8oAkR85u7up7JPXXepOgZr7/FEbzeAr5IRGen0kSRvVKP4Q
	rQghkc/zTYyliDs6fvKxyvRygEH6qx8Zp4hE6LOGUv1jTPC+GqjLPmgbAkq2IQVdcOBneNB92ia
	AVDbdzUurd9kGJuH2oUg==
X-Received: by 2002:a05:6000:2f81:b0:43e:a638:2507 with SMTP id ffacd0b85a97d-43fe3da64a6mr47793437f8f.8.1777029882819;
        Fri, 24 Apr 2026 04:24:42 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200::d99c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc09b1sm60212276f8f.9.2026.04.24.04.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 04:24:42 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 24 Apr 2026 13:24:40 +0200
To: Jiri Olsa <olsajiri@gmail.com>
Cc: sashiko@lists.linux.dev, bpf@vger.kernel.org
Subject: Re: [PATCHv5 bpf-next 04/28] bpf: Use mutex lock pool for bpf
 trampolines
Message-ID: <aetS-OVaIz9XbZBP@krava>
References: <20260417192502.194548-5-jolsa@kernel.org>
 <20260418035227.168AEC19424@smtp.kernel.org>
 <aec7bAbGlnEo3R1g@krava>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aec7bAbGlnEo3R1g@krava>

On Tue, Apr 21, 2026 at 10:55:08AM +0200, Jiri Olsa wrote:

SNIP

> > 
> > Regarding the pool initialization, the new trampoline_locks array is
> > initialized in init_trampolines(), which runs as a late_initcall.
> > 
> > Since the static array resides in the bss section and is only zero-initialized
> > before this phase, what happens if early boot BPF components (like early BPF
> > LSM policies) try to attach or modify a trampoline before late_initcall?

hum, I don't see how this could happen.. anyway we init other trampoline
tables in here, so if it's wrong, it's already broken

jirka
