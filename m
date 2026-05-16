Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271592F7F0F;
	Sat, 16 May 2026 22:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778971195; cv=none; b=N0Spzj3e4YzZLHoR4y/G4eHUQavWOs8Td2hnSWfKz2zpf6xfrnFW5hOtzcYLpVyIw1DswpoLQ21NfNEASnZmSg2QYRTI6U05msC+i0D81fUitJH6Y29C7PtclqFFRGCVD278xNVGGbXsuo5dJAwzKNl7CHhhH2ODUw/YBLvB2cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778971195; c=relaxed/simple;
	bh=O9vY5xgIduoE6o099w+D8afHS0L8Ab8xEtCmV8q5JDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hI2Tklph0Ib4cpZoqUhcYXvzlyDj/GKUeGU0wweceZN+rPR+wSotNU5tMYs/42+95NSPYs9GdzdQ+/AvKsKiXp9oZa/BrGssFo/v9PSak+VMD5yER4fcORs1HeAJheI3fmy8LJ2CQaoWwnfV8IM9BnYhNIzgQPDSKIBZ+cW/wA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pMjkURX3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pMjkURX3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 854E4C19425;
	Sat, 16 May 2026 22:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778971194;
	bh=O9vY5xgIduoE6o099w+D8afHS0L8Ab8xEtCmV8q5JDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pMjkURX3WCA65Kt6Rt72D+C/t0O+n7O5bEYSyWf9Hm/ZRqIyEmmrbqLDIWQigcUnw
	 bSWdDNUZnZ8jIE7whd5M5KzieFUFbvMqLvnJe4mAzVKG2fo/OdFFCgEgzrQv9P/D/L
	 /9QvLgGb6d4DIopjFOCi0mhwvVTmbNTbpc0rrEul1F5LCQHtjhV1Qr2gFUJAI7VpZX
	 9jU5S6qENvoZJ+c0nHxM3f/We+xHxk0sKeSvYhCLUNtUCqBCjZSccpHpDtb+JYLBkU
	 uiYr9SxPMAA80oB7f0KMIojNRuhiljfuMG6Yad2jEYrCNuxZBEmMG1nDZwnkQSmpHp
	 Cd9W99Q1AgWpQ==
Date: Sat, 16 May 2026 15:39:53 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 12/18] riscv_cbqri: resctrl: Add L3 cache
 occupancy monitoring
Message-ID: <agjyOYWZLcnm4PZO@thelio>
References: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-12-eb53831ef683@kernel.org>
 <20260512050001.38B24C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512050001.38B24C2BCB0@smtp.kernel.org>

On Tue, May 12, 2026 at 05:00:00AM +0000, sashiko-bot@kernel.org wrote:
> >     resctrl_arch_reset_rmid() re-arms CONFIG_EVENT with EVT_ID=Occupancy.
> >     CONFIG_EVENT both resets the counter to 0 and selects the event, so
> >     re-arming with the same event keeps the MCID counting after reset rather
> >     than relying on sticky-last-event semantics that the CBQRI register
> >     definition does not guarantee.
> 
> The resctrl core only calls mon_event_read() with first=true (which
> triggers the arch reset hook) for Memory Bandwidth Monitoring events,
> never for L3 Occupancy.
> 
> Because resctrl_arch_reset_rmid() is never invoked for L3 Occupancy during
> RMID recycle, will the counter fail to re-arm when a new monitoring group
> is created, causing it to stop counting or inherit dirty data from previous
> users?

cbqri_init_mon_counters() pre-configures the MCID slot at domain init,
and occupancy is a current state read rather than an accumulator, so a
recycled MCID returns the live counter. I'll update the commit message
and drop the occupancy branch in resctrl_arch_reset_rmid() since it is
unreachable.

> > +/*
> > + * Per-event controller table. Only events CBQRI can back occupy a
> > + * slot, so other events do not bloat the array.
> > + */
> > +#define CBQRI_MAX_EVENT QOS_L3_OCCUP_EVENT_ID
> > +static struct cbqri_controller *cbqri_resctrl_counters[CBQRI_MAX_EVENT + 1];
> 
> This array is allocated and initialized in cbqri_resctrl_pick_counters()
> and nulled out during teardown, but its contents appear to never be accessed
> by any logic in the driver. 
> 
> Is this array just dead code?

No, cbqri_resctrl_counters[QOS_L3_MBM_TOTAL_EVENT_ID] is read in
cbqri_resctrl.c to decide whether to enable mbm_total_bytes. 

> > @@ -205,10 +225,101 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
> >  			   u32 closid, u32 rmid, enum resctrl_event_id eventid,
> >  			   void *arch_priv, u64 *val, void *arch_mon_ctx)
> >  {
> > -	return -ENODATA;
> > +	struct cbqri_resctrl_dom *hw_dom;
> > +	struct cbqri_controller *ctrl;
> > +	struct rdt_ctrl_domain *d;
> > +	u64 ctr_val;
> > +	int err;
> > +
> > +	resctrl_arch_rmid_read_context_check();
> > +
> > +	/*
> > +	 * Each branch takes a sleeping mutex. Bail if called with IRQs
> > +	 * disabled (e.g. smp_call_function_any() from nohz_full CPUs).
> > +	 */
> > +	if (irqs_disabled())
> > +		return -EIO;
> 
> The resctrl core intentionally reads remote domains via
> smp_call_function_any() when the target CPU is nohz_full, running the
> callback in hardirq context.
> 
> Will rejecting calls in atomic context completely break cache occupancy
> monitoring for nohz_full CPUs, as any attempt to read their statistics
> will always fail with -EIO?

This matches MPAM's __read_mon(). fs/resctrl explicitly handles -EIO
from this class of drivers when dispatching via smp_call_function_any()
for nohz_full CPUs. I'll update the comment to clarify.

> > +	err = resctrl_online_mon_domain(res, &mon_dom->hdr);
> > +	if (err)
> > +		goto err_listdel;
> > +
> > +	err = cbqri_init_mon_counters(ctrl);
> 
> During domain initialization, resctrl_online_mon_domain() internally
> calls resctrl_arch_reset_rmid_all(), which loops over all max_rmid to
> issue CONFIG_EVENT MMIO operations.
> 
> Immediately after this returns, cbqri_init_mon_counters() is called,
> which loops over ctrl->mcid_count to issue the exact same CONFIG_EVENT
> MMIO operations again.
> 
> Since each CBQRI MMIO operation can sleep and take up to 1ms, does
> doing this twice per domain initialization introduce strictly redundant
> and significant latency during CPU hotplug?

Yes. I'll drop cbqri_init_mon_counters() from the L3 mon attach path,
since resctrl_arch_reset_rmid_all() called from
resctrl_online_mon_domain() already covers the same occupancy
configuration.

> > +	if (err)
> > +		goto err_offline;
> > +
> > +	return 0;
> > +
> > +err_offline:
> > +	cancel_delayed_work_sync(&mon_dom->cqm_limbo);
> > +	cancel_delayed_work_sync(&mon_dom->mbm_over);
> 
> The resctrl core only initializes mbm_over if resctrl_is_mbm_enabled()
> is true. Since the CBQRI driver only enables the L3 Occupancy event and
> not MBM, mbm_over remains completely zero-initialized from allocation.
> 
> Can calling cancel_delayed_work_sync() on a zeroed structure pass an
> uninitialized timer to del_timer_sync() and trigger kernel panics?

Yes. The fix is to guard the mbm_over cancel on
resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID). resctrl only
INIT_DELAYED_WORK's mbm_over when MBM is enabled, so a system without a
paired BC will no longer cancel a zeroed work struct.

> > +static int cbqri_attach_cpu_to_cap_ctrl(struct cbqri_controller *ctrl,
> > +					unsigned int cpu)
> > +{
> 
> The hotplug callback cbqri_resctrl_online_cpu() unconditionally skips
> controllers if !ctrl->alloc_capable.
> 
> Will this cause controllers that are only capable of monitoring to be
> ignored entirely, meaning no CPUs will ever be attached and no monitoring
> domains will be created on monitoring-only hardware?

This implementation does not support a capacity controller that supports
mon_capable but not alloc_capable. I'll add pr_warn_once() in
cbqri_resctrl_pick_caches() to make the limitation visible. 

> > -	domain = cbqri_create_ctrl_domain(ctrl, res, cpu, dom_id);
> > -	if (IS_ERR(domain))
> > -		return PTR_ERR(domain);
> > +	if (ctrl->mon_capable && ctrl->cache.cache_level == 3) {
> > +		err = cbqri_attach_cpu_to_l3_mon(ctrl, res, cpu);
> > +		if (err)
> > +			return err;
> 
> If cbqri_attach_cpu_to_l3_mon() fails here, the error is returned, but the
> CPU is not removed from the ctrl_domain mask and the domain structure is
> not freed.
> 
> Because the CPU hotplug core handles a startup failure by rolling back
> from the previous state, the offline callback for the current state
> (cbqri_resctrl_offline_cpu) is not invoked.
> 
> Does this leave the CPU permanently stranded in the ctrl_domain mask and
> leak the newly allocated domain structure?

Yes. I'll make cbqri_attach_cpu_to_cap_ctrl() roll back the
cpumask_set_cpu and tear down the new ctrl_domain when
cbqri_attach_cpu_to_l3_mon() fails.

> > +static void cbqri_detach_cpu_from_l3_mon(struct rdt_resource *res,
> > +					 unsigned int cpu)
> > +{
> > +	struct rdt_l3_mon_domain *mon_dom, *tmp;
> > +
> > +	lockdep_assert_held(&cbqri_domain_list_lock);
> > +
> > +	list_for_each_entry_safe(mon_dom, tmp, &res->mon_domains, hdr.list) {
> > +		if (!cpumask_test_cpu(cpu, &mon_dom->hdr.cpu_mask))
> > +			continue;
> > +		cpumask_clear_cpu(cpu, &mon_dom->hdr.cpu_mask);
> > +		if (cpumask_empty(&mon_dom->hdr.cpu_mask)) {
> > +			cancel_delayed_work_sync(&mon_dom->cqm_limbo);
> 
> This function is executed as a CPU hotplug callback, meaning the thread
> holds cpus_write_lock(). Concurrently, the cqm_handle_limbo() worker
> function in the resctrl core begins by acquiring cpus_read_lock().
> 
> If the worker starts executing while the hotplug thread is active, the
> worker will block on cpus_read_lock(), while the hotplug thread blocks in
> cancel_delayed_work_sync() waiting for the worker to finish.
> 
> Could this create an unresolvable AB-BA deadlock that hangs the system
> during CPU offline operations?

Yes, I will move the L3 mon_domain teardown path from
cancel_delayed_work_sync to cancel_delayed_work.

> > +			cancel_delayed_work_sync(&mon_dom->mbm_over);
> 
> (As mentioned above, mbm_over appears to be uninitialized here as well.)

I'll do the same fix here too.

-Drew
