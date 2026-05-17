Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AB217BEBF;
	Sun, 17 May 2026 01:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778981941; cv=none; b=tUKcObWLEUh5RJimWcCsbb9Jt2O5DIdnDuACaUIpQPhReP8jGx9np5hZcjgrKu2joF1O0xx8V9S1J8a7ZBLjmyAi3KMykTOUwf/jKKk2p7kxJCtcYbx9souP65wa5myixDBUqGrLcstvtGnIG8WkUPZ/7IFQItzwxFdICVtN3Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778981941; c=relaxed/simple;
	bh=Mfe2NkDGhldrWPccxMibgN8TMO7Jvlgh3FN5rL6R8q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TGYTWYGtKXQOrl+Ddq+taod2SrESmuA9RkZAtowBm8VvbPjSPbd9L/9OjFMwG6D0MR/bnE1cNDYd9qvgO7JssQ8vTjow4sgj1KUAeHaLtukdZJyXkOi4PVG649w9dLLsqLIMgHPhDHdROBHuO1uHZwS3CVilQVpD2U4UA05ebng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mul1t1mX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mul1t1mX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E352BC19425;
	Sun, 17 May 2026 01:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778981941;
	bh=Mfe2NkDGhldrWPccxMibgN8TMO7Jvlgh3FN5rL6R8q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mul1t1mXig5Ipm7GzcTAxVKMb6uBDx+omU6L5lApvk9UcFT+JEf16Cb7hDmlugdX9
	 UzJU+51/JEyNvrNsE6ND74z/nFUagE4ySUtCjkVTippZaD743tP+YPoWj6lEAaqvUx
	 DYz5+wtEfHx4BTXwEf2iuVS9m2rjN5gsEImFxjzHKBoycscBYnVxd2iELJ4pdcB8X8
	 BFup+scRK83OITyO3tvLzkxxvzbDmF+4g0eMCXYQujMTVPL7PPrC8UViH0x6WE0hOv
	 MHFVzmr59/VTwnQtTevn01BelwXSreKMmQ2gUyqaScQbsxEKXagzLuuZVJo3uqQ5vG
	 e78GWlTwrL8lg==
Date: Sat, 16 May 2026 18:38:59 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 15/18] riscv_cbqri: resctrl: Add mbm_total_bytes
 bandwidth monitoring
Message-ID: <agkcM6FCKbc9G9Df@thelio>
References: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-15-eb53831ef683@kernel.org>
 <20260512212653.B5715C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512212653.B5715C2BCB8@smtp.kernel.org>

On Tue, May 12, 2026 at 09:26:53PM +0000, sashiko-bot@kernel.org wrote:
> > @@ -308,6 +348,76 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
> >  		mutex_unlock(&ctrl->lock);
> >  		return err;
> >  
> > +	case QOS_L3_MBM_TOTAL_EVENT_ID: {
> > +		struct cbqri_controller *bc;
> > +
> > +		/*
> > +		 * The L3 monitoring domain's id is the L3 cache id. The
> > +		 * matching ctrl domain's hw_dom->paired_bc was cached at
> > +		 * add time to avoid walking cbqri_controllers on every read.
> > +		 */
> > +		d = cbqri_find_ctrl_domain(&r->ctrl_domains, hdr->id);
> 
> Is there a list traversal race here that could happen during CPU hotplug?
> 
> When offlining a CPU, the domain removal process uses list_del_rcu() and frees 
> domains after calling synchronize_rcu(). However, cbqri_find_ctrl_domain() 
> traverses the ctrl_domains list without holding an rcu_read_lock(). 
> 
> If synchronize_rcu() does not wait for this reader, could this lead to a 
> use-after-free when the freed domain struct is accessed?

I'll change it to take cbqri_domain_list_lock in
resctrl_arch_rmid_read() and resctrl_arch_reset_rmid(), and drop the RCU
on the writer side in favor of plain list_del under the same mutex.

> > @@ -730,6 +840,16 @@ static int cbqri_resctrl_control_init(struct cbqri_resctrl_res *cbqri_res)
> >  			res->mon.num_rmid = ctrl->mcid_count;
> >  			resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID,
> >  						 false, 0, NULL);
> > +
> > +			/*
> > +			 * Expose BC bandwidth monitoring as the L3's
> > +			 * mbm_total_bytes when a BC shares topology with this
> > +			 * L3 (MPAM "MB on L3" mapping).
> > +			 */
> > +			if (cbqri_resctrl_counters[QOS_L3_MBM_TOTAL_EVENT_ID])
> > +				resctrl_enable_mon_event(QOS_L3_MBM_TOTAL_EVENT_ID,
> > +							 false, 0, NULL);
> > +
> >  			res->mon_capable = true;
> >  		}
> >  		break;
> 
> Is bandwidth monitoring inadvertently disabled if the L3 capacity controller 
> lacks occupancy monitoring? 
> 
> Because this block is inside an if condition checking ctrl->mon_capable where 
> ctrl is the L3 capacity controller, it appears the bandwidth monitoring won't 
> be exposed even if a valid and monitoring-capable bandwidth controller is 
> present on the system.

The L3 mon_domain is currently anchored on the L3 CC's mon_capable path,
so a system with a mon-capable BC but a mon-incapable L3 CC loses
mbm_total_bytes. That can be addressed in a future series.

> > @@ -949,6 +1072,29 @@ static int cbqri_attach_cpu_to_l3_mon(struct cbqri_controller *ctrl,
> >  	if (err)
> >  		goto err_offline;
> >  
> > +	/*
> > +	 * Pair this L3 domain with the system's mon-capable BC. The
> > +	 * cached pointer is consulted by every rmid_read / reset_rmid.
> > +	 * BC mon init is system-wide. Failure here means mbm_total_bytes
> > +	 * is unusable for any domain, so fail the attach.
> > +	 */
> > +	{
> > +		struct cbqri_resctrl_dom *hw_dom = container_of(ctrl_dom,
> > +								struct cbqri_resctrl_dom,
> > +								resctrl_ctrl_dom);
> > +
> > +		hw_dom->paired_bc = cbqri_find_only_mon_bc();
> > +		if (hw_dom->paired_bc) {
> > +			err = cbqri_init_bc_mon_counters(hw_dom->paired_bc);
> 
> Could this sequence result in a use-after-free or a null pointer dereference?
> 
> By the time this block runs, resctrl_online_mon_domain() has already been 
> called earlier in the function, exposing the monitoring domain to user space. 
> If a concurrent sysfs read triggers resctrl_arch_rmid_read() at this moment, 
> it could pass the lockless check for bc->mbm_total_states and block waiting 
> for the hardware lock.
> 
> If cbqri_init_bc_mon_counters() fails, it drops the lock, frees 
> bc->mbm_total_states, and sets it to null. 
> 
> When the sysfs read unblocks, will it dereference the freed pointer? Might it 
> be safer to defer domain onlining until after the hardware state is fully 
> initialized?

I will change it so cbqri_init_bc_mon_counters() and the paired_bc
assignment happen before resctrl_online_mon_domain(), so no reader can
observe the half-initialized state.

> 
> Furthermore, does this unconditional assignment of cbqri_find_only_mon_bc() 
> cause bandwidth overcounting on platforms with multiple L3 domains?
> 
> If the single system-wide bandwidth controller is paired with every L3 
> domain, standard user-space tools that calculate group bandwidth by summing 
> values across all L3 domains might overcount the true system bandwidth by 
> a factor equal to the number of active L3 domains.

Only a single bandwidth controller is supported with this implemenation.
cbqri_resctrl_pick_counters() counts distinct L3 cache_ids at setup and
refuses to expose mbm_total_bytes when more than one L3 domain is
present.

-Drew
