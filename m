Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7A43E6DFF
	for <sashiko@lists.linux.dev>; Mon, 27 Apr 2026 17:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311482; cv=none; b=fPCONbneO/rJSV+Xp/Vuh8lmtvfcLGeTKKHX3Kdn8zFEvlku2RronOzeCXoeaCahdEsZJh3wWgMm460mQ/IChf4ajx1cIg+26MSOsdYuA0KkDL25nwcujUdhn36PHX3lLzcEKJPGtrS/pkKoek2QcV2BGcZ3pXamV6wnGM31/rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311482; c=relaxed/simple;
	bh=ZoNGjq0IsGIpPDMoe9Jft3cfPxzyxAx+rUXzrdgUMS4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=g7xtwNdLTncfWdB5KPeh1lFekgSV3PTQnsATwXZM6S93PvNJ51RQzNBQLlxiE7M2A8VDJhEfLPCbvJgz1aymZTtoqvPqfbYVnAtOxy7B1KhkX/3J6lVWeue6qygppIQ0UXUSNejERBAs7gh2WK/ZNqjgbHtNhfgAaSZBh0aIVAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WU4HqZpI; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WU4HqZpI"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-354c0234c1fso11507425a91.2
        for <sashiko@lists.linux.dev>; Mon, 27 Apr 2026 10:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777311478; x=1777916278; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WUGfHBBKLKTBHfPFY8nLzpUEKNPZw0zVaxuVGypwmBw=;
        b=WU4HqZpItHJYOi5uLyX7ti6LL4XaOEcsb95zm3aEJOUICmY+qVxRs9iBN/JnRF2Dlz
         IAfYI0Dcu8hBefRG999CBnJMHyPMzcJc49OxhYFfqoBcLU/l6O3fwGlmKoLZoNpf2aFV
         14ZmjnAaSLkTkfE1FaCo3x8BIP6vLFSshJFU5xXCPYpzeBPScBFbaRbIDEDK7cDXIwjb
         jZiBsnkbamXMWOwXDQr9CL6+PV5sc7QbL4tO5gVeGoQrCcG/3gv1dQrLST3wSdEyQEAQ
         v2r73Unu/NmnLV0fzeZDn6tBzzzLBRCdnYnK9QyTcmgTSw6V5vmNoEZ5X2oQsyFxoD33
         JLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311478; x=1777916278;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WUGfHBBKLKTBHfPFY8nLzpUEKNPZw0zVaxuVGypwmBw=;
        b=YjCGZqXTqpEOpk1OFyqV7HPLFHETeIqgJiRepDNDBKeBzT5+9vt7vf0XClDQqHvjSr
         g0QiABTFYMa9OylZOBLCuViM/oJgjYco6n+X/xEH+tdvpGTDfKRLARV8NPKBJAgDAEOo
         wFFZ7hkHkbjve+Uy9ReljMkE8/WEWgJ63lKHVSQphjBiHk8R6LQej1hHogGlQ8Tny7Du
         BO3oqGq+bahW4pqRfb3HMPjzeiQlAwEKDIizWNKqlZ4qI3k+ldXmjhcAPET7od8XqsPS
         6c/CC7Cn3+v1AuPX+4DaHzWO8lIM2kyLMOEIw5fnBeMp0RA1bf6FXGxtuUJdwSX1OJhg
         Wx6w==
X-Gm-Message-State: AOJu0YxXiHr+mcuyHJmfnxotsTU7/DXtsQmbX3oUCNLTGd9kWdtqi8rI
	146wKFIJCtGnd+v0mXVUJt2zWggQB0/Y0REkbfGRIoTfUnr6CwkyHTjddNc3vp9232hxQL9NSvT
	xC8aAKgbACJna13V2dLkG2wTALFWWoDJkUZphg99E8gvfX3Ld1wJzJL9h//GghdQEP1ypubK+Br
	lwIEqq3d/o6ESKmkPCgCzglFZ3DbWuqQkOKB325A==
X-Received: from pjbbj13.prod.google.com ([2002:a17:90b:88d:b0:359:f0e8:29f8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:37c7:b0:35f:b7c1:faad
 with SMTP id 98e67ed59e1d1-36490cdb867mr41738a91.25.1777311478337; Mon, 27
 Apr 2026 10:37:58 -0700 (PDT)
Date: Mon, 27 Apr 2026 10:37:56 -0700
In-Reply-To: <20260423233145.DDC5BC2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260423150340.463896-5-seanjc@google.com> <20260423233145.DDC5BC2BCAF@smtp.kernel.org>
Message-ID: <ae-e9FQzmhnMVn1Q@google.com>
Subject: Re: [PATCH v2 4/4] perf/x86: KVM: Have perf define a dedicated struct
 for getting guest PEBS data
From: Sean Christopherson <seanjc@google.com>
To: sashiko@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Apr 23, 2026, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 1 potential issue(s):
> - [Medium] Unconditional external function call to intel_pmu_get_cross_mapped_mask() introduced in the VMX hot path.
> --
> 
> commit bf596eb4f1ae159ccdd3b9e0517c0eaa4c80ce4a
> Author: Sean Christopherson <seanjc@google.com>
> 
> perf/x86: KVM: Have perf define a dedicated struct for getting guest PEBS data
> 
> This commit introduces a dedicated struct (x86_guest_pebs) for passing guest
> PEBS data from KVM to perf. It replaces the previous method of passing an
> opaque pointer to kvm_pmu, allowing perf to define its own data requirements
> independently of KVM-internal state.
> 
> > diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> > index a29896a9ef1456..e6c1c64a8c949d 100644
> > --- a/arch/x86/kvm/vmx/vmx.c
> > +++ b/arch/x86/kvm/vmx/vmx.c
> > @@ -7313,12 +7313,15 @@ static void atomic_switch_perf_msrs(struct vcpu_vmx *vmx)
> >  	if (kvm_vcpu_has_mediated_pmu(&vmx->vcpu))
> >  		return;
> >  
> > -	pmu->host_cross_mapped_mask = 0;
> > -	if (pmu->pebs_enable & pmu->global_ctrl)
> > -		intel_pmu_cross_mapped_check(pmu);
> > +	struct x86_guest_pebs guest_pebs = {
> > +		.enable = pmu->pebs_enable,
> > +		.ds_area = pmu->ds_area,
> > +		.data_cfg = pmu->pebs_data_cfg,
> > +		.cross_mapped_mask = intel_pmu_get_cross_mapped_mask(pmu),
> > +	};
> 
> Does this introduce an unnecessary function call overhead on the VMX hot path?

Probably.  I'm not sure how much we care.  Though what does matter and should be
fixed is that intel_pmu_get_cross_mapped_mask() is a bit of a lie.  It doesn't
check _all_ PMCs, only those that are globally enabled and configured for PEBS.

I'll figure out a way to address both in the next version.

> Prior to this patch, the external function intel_pmu_cross_mapped_check()
> was conditionally called only when PEBS was enabled, which avoided an
> external function call in the vast majority of cases.
> 
> Because intel_pmu_get_cross_mapped_mask() is in a different compilation
> unit (pmu_intel.c), calling it unconditionally here results in a function
> call on every VM-entry.
> 
> Would it be better to restore the inline condition check, perhaps using a
> ternary operator when initializing cross_mapped_mask?


