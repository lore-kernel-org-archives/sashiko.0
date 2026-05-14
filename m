Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447BA135A53;
	Thu, 14 May 2026 22:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778797498; cv=none; b=SzrkBM3/GbFnMNOhqkZHXeFEc9wInIl7QivhXWSXh8QtvgqqY1N20Eb1S6NGMBJOtO+jsSPRAOzUt7jqwJtzGpM+NFZcttnEdjURb5tfhXYv/jXewGkxJocJSPcH+B+kMgo2szTejMnPLyV3okeky7lYGzlwwmJyqdVmCcY0P4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778797498; c=relaxed/simple;
	bh=dUk9JsRqi+eVVIWIQ1HsnjPxpZIfmsgJD9d96E55lbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Au3eJjgKvfMluEhx3mL5l1wM5V+/4n/Iz7844JPyECSSoSABNzXFJD8vXUYqRRDO5sYIWG8aL/4HOyMepnZMOkp7x3KM2vlWkFbM8f6/bNqnGr9TxCFYkU6XhXCJqtUDsQ3/nMfjJYmOCIK2ILj7/O67UM/lWKE/ZsAahTvp2Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XuFX6uD2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XuFX6uD2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A548C2BCB3;
	Thu, 14 May 2026 22:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778797497;
	bh=dUk9JsRqi+eVVIWIQ1HsnjPxpZIfmsgJD9d96E55lbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XuFX6uD2G4sgxbhA2crI8Itlhm9AS5wBry95zVTtonsYioWWMzBJnbMvexrmxYjxF
	 eWYJMTaPRQBxIqW2tUxzfPKVuFz52kobX9jwZFwhPJXlYJSNMkOXgStZKn65pgnJxk
	 kfDd/3OFQ11DISePfq8HHLDp4XWDNh0WsymN1xLGQ9aSbRbVJNCwfA+TtoHcmkxNLf
	 adao9FJbU6y30CLRZ2IlyG8Ag4uC0ZXJ1lDeeuzIssvozcalzTzl7IyJapR6Jn8qqt
	 vMv4b6LePfkKtfFA0KWw+dBdLFeJY6Rs7OLPhKt6Z9G9n7UKY8vUFxTmF38HnOo5OK
	 QALAdaDYAFUbg==
Date: Thu, 14 May 2026 15:24:56 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
	robh@kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, x86@kernel.org
Subject: Re: [PATCH RFC v4 03/18] riscv: add support for srmcfg CSR from
 Ssqosid extension
Message-ID: <agZLuHhsN5ezSmqg@tt-p14-dfustini>
References: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-3-eb53831ef683@kernel.org>
 <20260511235300.781C6C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511235300.781C6C2BCB0@smtp.kernel.org>

On Mon, May 11, 2026 at 11:52:59PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] Uninitialized Hardware State / Early Boot Bypass for CSR_SRMCFG
> - [High] Resource Control Bypass via Monitoring Group (MCID) evaluation flaw
> - [High] Hardware/Software State Desync on Boot CPU Resume from Suspend
> - [Medium] Redundant loop and Data Race in hotplug initialization
> - [Medium] Initcall returns positive hotplug state ID on success
> --
> 
> commit 0e2697a6f259670c211c47e45e2448410a9ac7b9
> Author: Drew Fustini <fustini@kernel.org>
> 
> riscv: add support for srmcfg CSR from Ssqosid extension
>     
> This commit adds support for the srmcfg CSR defined in the Ssqosid ISA
> extension. It introduces a per-task srmcfg field mirrored to a per-CPU
> cache to optimize context switching and configure resource management IDs.
>     
> Link: https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0
> 
> > diff --git a/arch/riscv/include/asm/qos.h b/arch/riscv/include/asm/qos.h
> > new file mode 100644
> > index 0000000000000..6988fe37551ee
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/qos.h
> > @@ -0,0 +1,64 @@
> [ ... ]
> > +static inline void __switch_to_srmcfg(struct task_struct *next)
> > +{
> > +	u32 thread_srmcfg;
> > +
> > +	thread_srmcfg = READ_ONCE(next->thread.srmcfg);
> > +
> > +	/* Default-group tasks (thread.srmcfg == 0) follow this CPU's default. */
> > +	if (thread_srmcfg == 0)
> > +		thread_srmcfg = __this_cpu_read(cpu_srmcfg_default);
> 
> Does this logic correctly handle tasks assigned to a specific monitoring
> group but the default resource group?
> 
> The srmcfg CSR encodes both the Resource Control ID (RCID) and Monitoring
> Counter ID (MCID).
> 
> If a task is placed in the default resource allocation group (RCID=0) but
> is assigned a specific monitoring group (MCID!=0), its thread.srmcfg will
> be non-zero.
> 
> The thread_srmcfg == 0 check will fail, bypassing the cpu_srmcfg_default
> override. This would allow the task to escape the CPU's restricted RCID
> allocation.
> 
> Could the RCID and MCID fields be extracted and evaluated independently?

Yes, good catch. v5 will rewrite __switch_to_srmcfg() to evaluate RCID
and MCID against cpu_srmcfg_default independently, matching x86 RDT's
__resctrl_sched_in() per-field logic. A task in the default RCID group
with a specific MCID (or vice versa) now correctly inherits the CPU
default for the unassigned dimension.

> 
> > diff --git a/arch/riscv/kernel/qos.c b/arch/riscv/kernel/qos.c
> > new file mode 100644
> > index 0000000000000..75bda2ed89e1f
> > --- /dev/null
> > +++ b/arch/riscv/kernel/qos.c
> > @@ -0,0 +1,49 @@
> [ ... ]
> > +/* cached value of srmcfg csr for each cpu */
> > +DEFINE_PER_CPU(u32, cpu_srmcfg);
> 
> Will this cause the CSR write to be bypassed during early boot?
> 
> DEFINE_PER_CPU places the cache in .bss or implicitly zero-initializes it.
> 
> During early boot, context switches occur to threads like idle or init
> before the arch_initcall executes, and these early threads have
> thread.srmcfg == 0.
> 
> When __switch_to_srmcfg() checks if thread_srmcfg != __this_cpu_read(cpu_srmcfg),
> it will evaluate to 0 != 0 and skip writing the CSR. This means the CPU
> would execute all early boot code with an implementation-defined,
> potentially random hardware CSR state.
> 
> Could we statically initialize the per-CPU variable, for example:
> 
> DEFINE_PER_CPU(u32, cpu_srmcfg) = U32_MAX;

I will fix in v5

> > +
> > +/* default srmcfg value for each cpu, set via resctrl cpu assignment */
> > +DEFINE_PER_CPU(u32, cpu_srmcfg_default);
> > +
> > +/*
> > + * Seed the per-CPU srmcfg cache to a sentinel that no real srmcfg encoding
> > + * can produce (MCID << 16 | RCID, both fields well under 16 bits) so the
> > + * next __switch_to_srmcfg() unconditionally writes the CSR. Ssqosid v1.0
> > + * leaves CSR state across hart stop/start implementation-defined, so the
> > + * cached value cannot be trusted after online.
> > + */
> > +static int riscv_srmcfg_online(unsigned int cpu)
> > +{
> > +	per_cpu(cpu_srmcfg, cpu) = U32_MAX;
> > +	return 0;
> > +}
> 
> How is the boot CPU's cache handled during system resume from suspend?

I will add a CPU PM notifier that invalidates cpu_srmcfg on CPU_PM_EXIT
and CPU_PM_ENTER_FAILED, so the boot CPU also forces a CSR write on
resume.
 
> > +static int __init riscv_srmcfg_init(void)
> > +{
> > +	unsigned int cpu;
> > +	int err;
> > +
> > +	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SSQOSID))
> > +		return 0;
> > +
> > +	/* Seed already-online CPUs. The cpuhp callback covers later onlines. */
> > +	for_each_online_cpu(cpu)
> > +		per_cpu(cpu_srmcfg, cpu) = U32_MAX;
> 
> Is this manual iteration over online CPUs necessary?

No, I will drop it. cpuhp_setup_state() already invokes the startup
callback on every already-online CPU.

> > +	err = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/srmcfg:online",
> > +				riscv_srmcfg_online, NULL);
> > +	if (err < 0)
> > +		pr_warn("srmcfg cpuhp registration failed (%d), cpus brought online after boot will not invalidate the CSR_SRMCFG cache\n",
> > +			err);
> > +	return err;
> > +}
> > +arch_initcall(riscv_srmcfg_init);
> 
> Does this return a false failure during boot?

do_one_initcall() in init/main.c ignores positive return values from
initcalls. I will leave this as-is.

thanks,
drew
