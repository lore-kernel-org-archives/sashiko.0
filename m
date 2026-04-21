Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D3E331203
	for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 08:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776761713; cv=none; b=bexL62H2cVowJ62yNNXubPYxqlJLhpMztgXPVD4szGWj0fnNZv2jgNBJyIScdoNLKMJVw1hRIATVP13a8RmcXbCSXL4RCRr3L0phdbv/5J88CaO7EIqFIwYlsTq7YmaHxNS+zMOE9OZSScHQnK66oEbaYeKDX0PXkiv4eLBll90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776761713; c=relaxed/simple;
	bh=sjxMVwhX0uLBHov6ZrI/F9F6hKN9maMgZUi2QG+mzw0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rjrJiF4tw37frJMV8pgTd3cg8b0CsIMnL/mVLez2pboHq+RZpVy2phRc9aIwY856tWx/8WDoc27R7kmc/jWa/OGagHWTKESVVuGCWUXHeV8FsbIlsrUr9ufO4UwotF6Zp22wWSU6uoL7LHBSPIdpmBMJxsb/I+SqsYZp8X/EN1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d5M3BIYd; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5M3BIYd"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso54131345e9.3
        for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 01:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776761711; x=1777366511; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y/ItaIqrOxq/1z3/TSoevbCzM41LSY3UwDzcgqamzWo=;
        b=d5M3BIYdrbgOWbLlUbTkaSgkFg8ey3s2xe2lgEuUO96BNo0utjm2F4kDVt7Z4qAqBz
         bZtvReZFiYAVPea/COW8wMIXCFmkQcm6rL5pDPcWYdS9GwC08yDuIZzwJU9ttP0/x9di
         wRcMOwa7NLGfdJOf+IQKh4LjTt2bMys8alP7UPPh9oWfGm3el1yD62BnPo94UDARih0d
         3V+TG02MZjFO37Wtt5nHP7m0vUzuBYirrl89WDxDoSdvdcFBRSJr2HJAO1OnSm1Dhy6Q
         AiS6M1bERZ2QnWmn7ELdvwG/cTWySR4qV8QMpwlVK3WoAiRN6XjhUTmkUzuXrve7nUOO
         v+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776761711; x=1777366511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/ItaIqrOxq/1z3/TSoevbCzM41LSY3UwDzcgqamzWo=;
        b=nfXj/nZz4PCymMIrmolZW/Gbzw4n8Nsqyu/Lu7uf8jR+0YHJfSapXM6FwjBLBw22NZ
         VKov1e8uY1luW8HK04wfnbk/XbtAcKfvtBfssqizh4+4jBvFROUXrWfYhzPtbw1OxO7y
         HZvPQIzu+kM4zvh2dX+2Xt0NCmFcJXkS0bJAiNHpbkfKHR2h8CFOd1+tX8s3vyLKBrqK
         ig71+3AIQ/fXbu6owZjT7hhYv54Pm7qHsuqpvQO7Qt9r+bDytoVSypv9jW0o4U5waZQ4
         Ci9E0ws4yO3syg1bMsUk7H4Qk8pEh7Nx+jr3tLAo8axS7zvL3OIOz13E6j8LJikhQvAy
         6/Qw==
X-Gm-Message-State: AOJu0Yy/9yEhAiHWo3vlifNwgpeKxJwnJ2frc6zdwwxsXGhDuacB5C2o
	sdO1odz1/+0M2dQfP10KRvXtAJcvkzp1VcYauo0PXym5CXIcwdIcOpghYR0wuiV0
X-Gm-Gg: AeBDieshXBvV3C4oUSuJRAYneoqzwu8+9raFCdyOKpo/ed+9In2ECsAX9BxulFnlODa
	Kx4rsf0rmaOM/qctoZiLhOAWs4gKQr2Y/zJMBrgNFR4BFh2kr95pnca5yQl23WlEy2o9ytft3/J
	V0PdVJiOvL3VDeO7FCIppjwEAnG6jhwObC4CYAhrM6XDB7tdUvMcf96tjryPcNMFhnjnKCwN0fK
	yHBya5RHKih62LPhW1shQIle/FLmrIVlqpjBqlxeskKgO/5g1KiEEB/dFsNCT9V1hsuNbqgnAR4
	v3VbzI6IePVS1JrXcZe0rZI8bE+CVVeIhcYsyM/XqTukx59dRfsYBvi3aLMROkaDHFyOt1dwwQG
	nO2vyiqLsJq8VEv0dYjBM4fvQUF6ZebzJsdICJ3EudBn9fDQC6t/uSR0Y1WiB9JVSo8XF7mpcJa
	U3iRDOrbA=
X-Received: by 2002:a05:600c:890c:b0:487:1108:48af with SMTP id 5b1f17b1804b1-488fb7389a6mr192146365e9.4.1776761710590;
        Tue, 21 Apr 2026 01:55:10 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200::d99c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a55dc9f58sm75178065e9.6.2026.04.21.01.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 01:55:10 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 21 Apr 2026 10:55:08 +0200
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv5 bpf-next 04/28] bpf: Use mutex lock pool for bpf
 trampolines
Message-ID: <aec7bAbGlnEo3R1g@krava>
References: <20260417192502.194548-5-jolsa@kernel.org>
 <20260418035227.168AEC19424@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418035227.168AEC19424@smtp.kernel.org>

On Sat, Apr 18, 2026 at 03:52:26AM +0000, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 2 potential issue(s):
> - [High] False sharing in the shared mutex pool causes spurious `mutex_trylock` failures, leading to random `-EAGAIN` errors and trampoline state corruption.
> - [Medium] The `trampoline_locks` mutex pool is initialized in `late_initcall`, creating an uninitialized lock hazard for early boot BPF usage.
> --
> 
> Note: Due to system recitation restrictions, the standard inline-quoted
> patch format has been altered. The findings are summarized below in a
> free-form format without direct code quotes.
> 
> commit 8bee21cb8aa45a6b2275c87c16fbbd2fd1953e75
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> bpf: Use mutex lock pool for bpf trampolines
> 
> This commit replaces the per-trampoline mutex with a 32-bucket static mutex
> pool. This allows upcoming tracing_multi features to lock all involved
> trampolines simultaneously without exceeding the maximum lock depth.
> 
> 
> In bpf_tramp_ftrace_ops_func(), mutex_trylock() is used on the selected
> trampoline pool lock to avoid deadlocks with direct_mutex. Because multiple
> trampolines now share the same lock, could this lead to spurious trylock
> failures if an unrelated trampoline happens to hash to the same bucket?
> 
> If the trylock fails, the function returns -EAGAIN. Does this mean
> concurrent ftrace or kprobe registrations might randomly fail due to false
> sharing?
> 
> Also, when the upcoming tracing_multi feature locks all 32 mutexes at once,
> wouldn't that deterministically abort any concurrent ftrace IPMODIFY
> registrations system-wide?
> 
> Finally, if this trylock failure happens during unregistration, could ftrace
> cleanup routines ignore the -EAGAIN, potentially leaving the
> BPF_TRAMP_F_SHARE_IPMODIFY flag permanently set and corrupting the
> trampoline state?

need to process this one bit more, perhaps we could offload the
BPF_TRAMP_F_SHARE_IPMODIFY unset update to defered work queue
in case the trylock fails.. or something else

in any case we need to make ipmodify and trampolines attach via multi
link mutually exclusive, because we can't just update such trampolines
with bpf_trampoline_update call

> 
> 
> Regarding the pool initialization, the new trampoline_locks array is
> initialized in init_trampolines(), which runs as a late_initcall.
> 
> Since the static array resides in the bss section and is only zero-initialized
> before this phase, what happens if early boot BPF components (like early BPF
> LSM policies) try to attach or modify a trampoline before late_initcall?
> 
> Will this result in calling mutex_lock() on an uninitialized mutex, leading
> to crashes or lockdep warnings when CONFIG_DEBUG_MUTEXES is enabled?

right, in that case we should register it earlier, will check

jirka
