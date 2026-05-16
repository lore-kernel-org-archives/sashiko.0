Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DFF3E5A17;
	Sat, 16 May 2026 15:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778946358; cv=none; b=GL0CBkhM1Oqx2HgQ4SPGOIZ3H4Ijh7zwt/3z2Akf/RXg06f9kV5SxYfs/34PmP55Yr4xInrgVVFG8nAZW4Y24y8Uu7pMgn1sj2rO52DTrCQHvwIwCtr5CkbZi+QyHDvdzaRLoT16SuYteJQAPdIGyiYWq2PAScyriRxAZndh/GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778946358; c=relaxed/simple;
	bh=egbemg+5nqSVkO2AOzaWkqFQ7vFLcLsKYmh0F1RjecQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rDbNFSZoDPdxWJzb8nNEIdV02SeDmHK4HupYg7yoS0b0jlTlrSaJhLpS+tBU86r89OWAcCm4qfk8xgi7lk0AOoKcs48qhbscF7oyIMJpMokWLAr0qwdOB25XLSgczJOGi9ndu8vImkEOldI6MHwAP71YUmh9x6dx+WcUzMI2E1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ncBhZ8Xx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ncBhZ8Xx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE2BC2BCB3;
	Sat, 16 May 2026 15:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778946357;
	bh=egbemg+5nqSVkO2AOzaWkqFQ7vFLcLsKYmh0F1RjecQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ncBhZ8Xxr/cCg/jaq4Sb3LzQHT4exdpxhEgji1PkYqfadgcQ8bpYjq5T53m1di5Uc
	 qw7MfVcZpcd64POVV5LkS5jH0fy28P0k/ETmSCXSIRzbWH3Ey8Z7M9fGfBKIAOhXk0
	 mlxnZe+KkV9vE3K+w8aUzJxsfpdPemsZXuXRPc7ZeddJHUes5dwgkoJV6LLUENcptA
	 VYmboTKVADQ+HHtUwFdD2OqRV/V15d5ObMZ3+jMjsvuTDdkFTJoPiwE226xmDITVX3
	 A41YFd3HbLYkP56fh5LBM0AKCjv5ddhSp2Tr8KgEA3cNtBt/rmh89x0oE8N6qRSz1b
	 +eaeS0/Eg3KYA==
Date: Sat, 16 May 2026 08:45:55 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko@lists.linux.dev
Cc: robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 11/18] riscv_cbqri: resctrl: Add cache allocation
 via capacity block mask
Message-ID: <agiRMzX3nTvO0jPM@thelio>
References: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-11-eb53831ef683@kernel.org>
 <20260512040135.51715C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512040135.51715C2BCB0@smtp.kernel.org>

On Tue, May 12, 2026 at 04:01:34AM +0000, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -595,6 +595,7 @@ config RISCV_ISA_SSQOSID
> >  	bool "Ssqosid extension support for supervisor mode Quality of Service ID"
> >  	depends on 64BIT
> >  	default n
> > +	select ARCH_HAS_CPU_RESCTRL
> 
> If CONFIG_RISCV_CBQRI_DRIVER is disabled, does this cause a linker error
> when CONFIG_RESCTRL_FS is enabled? The riscv implementation of the
> resctrl_arch_* functions is in cbqri_resctrl.c, which seems to only be
> compiled when the driver is enabled.

I will change RISCV_ISA_SSQOSID to select RISCV_CBQRI_DRIVER
unconditionally. That makes the SSQOSID=y CBQRI_DRIVER=n combination
unreachable, so the resctrl_arch_* symbols are always available when
RESCTRL_FS is enabled.

> > +u32 resctrl_arch_get_num_closid(struct rdt_resource *res)
> > +{
> > +	struct cbqri_resctrl_res *hw_res;
> > +
> > +	hw_res = container_of(res, struct cbqri_resctrl_res, resctrl_res);
> > +
> > +	/*
> > +	 * fs/resctrl calls this for resctrl-defined rids that CBQRI may not
> > +	 * back (e.g. RDT_RESOURCE_MBA from set_mba_sc() during unmount).
> > +	 * Unpicked rids have ctrl == NULL. Report no closids.
> > +	 */
> > +	if (!hw_res->ctrl)
> > +		return 0;
> > +
> > +	return hw_res->ctrl->rcid_count;
> > +}
> 
> Is there a bounds check needed for rcid_count against the 12-bit maximum?
> 
> If the firmware reports an rcid_count greater than 4096, fs/resctrl would
> permit creating groups with closid >= 4096.
> 
> This could lead to FIELD_PREP() silently truncating the upper bits in
> resctrl_arch_set_closid_rmid(), causing the task to run in a different group
> and bypassing the intended hardware isolation.

CBQRI_MAX_RCID is 1024, so there is no risk of exceeding the 12-bit
SRMCFG_RCID_MASK limit. However, I can add a WARN_ON_ONCE(rcid_count >
SRMCFG_RCID_MASK) at controller registration time so a future discovery
path like DT cannot silently bypass this.

> > +static struct rdt_ctrl_domain *cbqri_new_domain(struct cbqri_controller *ctrl)
> > +{
> > +	struct cbqri_resctrl_dom *hw_dom;
> > +	struct rdt_ctrl_domain *domain;
> > +
> > +	hw_dom = kzalloc_obj(*hw_dom, GFP_KERNEL);
> 
> Does kzalloc_obj exist in the kernel? It looks like this might cause a
> build failure due to an implicit function declaration.

kzalloc_obj() is defined in include/linux/slab.h

> > +static int cbqri_init_domain_ctrlval(struct rdt_resource *r, struct rdt_ctrl_domain *d)
> > +{
> > +	struct cbqri_resctrl_res *hw_res;
> > +	enum resctrl_conf_type t;
> > +	int err = 0;
> > +	int i;
> > +
> > +	hw_res = container_of(r, struct cbqri_resctrl_res, resctrl_res);
> > +
> > +	for (i = 0; i < hw_res->ctrl->rcid_count; i++) {
> > +		/*
> > +		 * Seed both DATA and CODE staged slots so a later mount
> > +		 * with -o cdp does not see stale CODE values.
> > +		 * CDP_NUM_TYPES is 1 on non-CDP controllers.
> > +		 */
> > +		for (t = 0; t < CDP_NUM_TYPES; t++) {
> > +			err = resctrl_arch_update_one(r, d, i, t,
> > +						      resctrl_get_default_ctrl(r));
> 
> Does this loop correctly handle non-CDP hardware? A comment mentions that
> CDP_NUM_TYPES is 1 on non-CDP controllers, but since it is a compile-time enum
> constant, the loop will always execute for t = CDP_CODE.
> 
> This could cause resctrl_arch_update_one() to send CBQRI_AT_CODE to
> controllers that do not support it, potentially triggering a hardware fault and
> aborting initialization.

The comment is wrong. CDP_NUM_TYPES is the compile-time constant 3
regardless of hardware. I will reword the misleading comment and gate
the inner loop on cdp_capable so non-CDP controllers only see CDP_NONE.

> > +static void cbqri_detach_cpu_from_ctrl_domains(struct rdt_resource *res,
> > +					       unsigned int cpu)
> > +{
> > +	struct rdt_ctrl_domain *domain, *tmp;
> > +
> > +	list_for_each_entry_safe(domain, tmp, &res->ctrl_domains, hdr.list) {
> > +		if (!cpumask_test_cpu(cpu, &domain->hdr.cpu_mask))
> > +			continue;
> > +		cpumask_clear_cpu(cpu, &domain->hdr.cpu_mask);
> > +		if (cpumask_empty(&domain->hdr.cpu_mask)) {
> > +			resctrl_offline_ctrl_domain(res, domain);
> > +			list_del_rcu(&domain->hdr.list);
> > +			synchronize_rcu();
> 
> Could this synchronize_rcu() call cause severe latency spikes during CPU
> hotplug?
> 
> This function is called synchronously from cbqri_resctrl_offline_cpu() while
> the core kernel holds the global cpu_hotplug_lock. It seems fs/resctrl manages
> these lists using standard locks, so the RCU primitives might not be necessary
> here.

This is the same list_del_rcu + synchronize_rcu pattern used by
arch/x86/kernel/cpu/resctrl/core.c for domain teardown. Readers walk
ctrl_domains under rcu_read_lock() (e.g. the schemata file walks), so
the grace period is needed before kfree.

The latency is bounded by one RCU grace period per detach, same as on
x86. I do not see a way to drop it without changing the reader side too.

> > +static int cbqri_resctrl_setup(void)
> > +{
> > +	int rid;
> > +	int err;
> > +
> > +	/* Wait for cacheinfo so cbqri_probe_cc()'s lazy fill has data. */
> > +	wait_event(wait_cacheinfo_ready, cacheinfo_ready);
> 
> Could this wait_event() potentially put the init thread to sleep indefinitely?
> 
> Because cbqri_resctrl_setup() and __cacheinfo_ready() both run as initcalls on
> the same kernel_init thread, if the previous initcall failed or the order
> changed, wait_event() would sleep forever since no other thread exists to
> wake it up.

device_initcall_sync always runs before late_initcall, so
cacheinfo_ready is already true on entry. The wait_event() is dead code.
I will drop it along with the waitqueue and just leave a comment noting
the initcall ordering CBQRI relies on.

> > +	cbqri_resctrl_accumulate_caps();
> > +
> > +	if (!exposed_alloc_capable) {
> > +		pr_debug("no resctrl-capable CBQRI controllers found\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	err = resctrl_init();
> > +	if (err)
> > +		return err;
> 
> If resctrl_init() fails, should this function call cbqri_resctrl_teardown()
> or otherwise revert the global state?
> 
> Since cbqri_resctrl_accumulate_caps() sets exposed_alloc_capable to true,
> leaving it set on failure would cause resctrl_arch_alloc_capable() to
> incorrectly return true.

If resctrl_init() fails, then the resctrl filesystem is not mountable
and nothing queries resctrl_arch_alloc_capable() afterwards. I will call
cbqri_resctrl_teardown() on the resctrl_init() error path so
exposed_alloc_capable does not stay set.

> > +static int cbqri_resctrl_online_cpu(unsigned int cpu)
> > +{
> > +	struct cbqri_controller *ctrl;
> > +	int err = 0;
> > +
> > +	mutex_lock(&cbqri_domain_list_lock);
> 
> Is the cbqri_domain_list_lock mutex necessary?
> 
> Since cbqri_resctrl_online_cpu() and cbqri_resctrl_offline_cpu() are invoked
> exclusively by the CPU hotplug state machine, the core kernel already
> serializes them globally using the cpu_hotplug_lock.

I will drop cbqri_domain_list_lock and replace it with
lockdep_assert_cpus_held() in the helpers.

-Drew
