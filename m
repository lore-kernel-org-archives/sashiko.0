Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822D7405C33;
	Sun, 17 May 2026 00:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778977992; cv=none; b=CC8t004DVyfdQGcMj5lUXiC1M09x0miOfMT51HYqBYGQPfKsA6qtqe8q0gSDVNrz3x21q1OLUCP69pg2ue2A+HOWHEly9HpMAnvUJMMdfRXzl0xjc9IOLZ+oKvgcosj7wiXfqSXEKANtnjalwn2uQbyVOC6oRe44WG29CUDkGCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778977992; c=relaxed/simple;
	bh=qRIb6ZmSrNofEDsljDIWiiN08PPfTUE7Lq2HqPPzlUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=scG8Kpxi3hitxovqmYFaHua77eEQFuUvdFbF5k/S3InnuyukZgA4GwBkRWmGAJ42XW8bEzjIwTrtGWEI489mckrQRPe0wl9vakiWT4QGc0LAUJvj4JNUPq11k88OEmS3L/vIv6lY+GaGyik+Cwcr454q5seDEzlofffJm7HuS38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hdL7VIT0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hdL7VIT0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA160C2BCB7;
	Sun, 17 May 2026 00:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778977992;
	bh=qRIb6ZmSrNofEDsljDIWiiN08PPfTUE7Lq2HqPPzlUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hdL7VIT09HhkiQHA7TeU6drm8yVCTUUFlkvZ1U+fzweRpcfgSouxpbl3wgbXJG2UA
	 /ywkE4bO+ZeZNhFUvFGKBljK4s9BiUs3PnbiJA0gANA5PjIU9ByVTY47YoZFzmnty3
	 xgWI5sz1I6tmdgTK+2hpH1snO3/GlgeLAxK81JjvTXzD8XXjeO0879Y3vEKQS9ii4G
	 KwLpaQkwc/2vKpbvEBrjht1B5qs4QT/hL72qgvzC5O0WxvsBwcpcoNQmrnbv1BmFbQ
	 bzasbapRgqsr73XRy4sXW5wlhYbeA7PoowXAmTHud/TtJWH9jCiuVZMSjCocrlHFsX
	 pdMdsSr8VrPgA==
Date: Sat, 16 May 2026 17:33:10 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko@lists.linux.dev
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 13/18] riscv_cbqri: resctrl: Add MB_MIN bandwidth
 allocation via Rbwb
Message-ID: <agkMxmmZOwLdSlWS@thelio>
References: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-13-eb53831ef683@kernel.org>
 <20260512054240.432A6C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512054240.432A6C2BCB0@smtp.kernel.org>

On Tue, May 12, 2026 at 05:42:39AM +0000, sashiko-bot@kernel.org wrote:
> > diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_resctrl.c
> > index d8fd9b06703fa..bcd9367e3555c 100644
> > --- a/drivers/resctrl/cbqri_resctrl.c
> > +++ b/drivers/resctrl/cbqri_resctrl.c
> > @@ -415,6 +415,9 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
> >  	case RDT_RESOURCE_L2:
> >  	case RDT_RESOURCE_L3:
> >  		return cbqri_apply_cache_config_dom(dom, r, closid, t, cfg_val);
> > +	case RDT_RESOURCE_MB_MIN:
> > +		/* sum(Rbwb) <= MRBWB validation runs inside cbqri_apply_rbwb(). */
> > +		return cbqri_apply_rbwb(dom->hw_ctrl, closid, cfg_val, true);
> 
> When a resctrl group is removed, does the framework invoke an architecture
> hook to reset the hardware control values to a minimum default?
> 
> If the CLOSID is freed but the previously configured bandwidth value remains
> pinned in the software cache (ctrl->rbwb_cache[closid]), will this abandoned
> value falsely inflate the sum during subsequent cbqri_apply_rbwb() calls?
> 
> Could this cause new allocation attempts to fail with -EINVAL, effectively
> creating a permanent denial of service for bandwidth allocations until the
> leaked CLOSID is coincidentally re-allocated?

resctrl has no arch-side hook, so the cached Rbwb for the freed closid
stays counted in the sum and could prevent new allocations.

The solution is probably a new resctrl_arch_* callback that resctrl
invokes on group destroy with a CBQRI implementation that resets
rbwb_cache[closid] back to the minimum. However, that would touch
fs/resctrl and all arch backends, so I will look at addressing that in a
future series.

> > @@ -491,15 +503,42 @@ void resctrl_arch_reset_all_ctrls(struct rdt_resource *r)
> >  		return;
> >  
> >  	list_for_each_entry(d, &r->ctrl_domains, hdr.list) {
> > -		for (i = 0; i < hw_res->ctrl->rcid_count; i++) {
> > -			for (t = 0; t < CDP_NUM_TYPES; t++) {
> > +		dom = container_of(d, struct cbqri_resctrl_dom,
> > +				   resctrl_ctrl_dom);
> > +
> > +		switch (r->rid) {
> > +		case RDT_RESOURCE_MB_MIN:
> > +			/*
> > +			 * CBQRI section 4.5: Rbwb >= 1, sum(Rbwb) <= MRBWB.
> > +			 * Walk N-1..1 first so the final sum lands at
> > +			 * MRBWB. Use the unchecked helper since the
> > +			 * intermediate sum may exceed MRBWB.
> > +			 */
> 
> This isn't a bug, but is this comment accurate?
> 
> Since the loop strictly reduces the allocations for RCIDs N-1 down to 1
> before finally increasing RCID 0 to the remaining budget, doesn't the
> running hardware sum strictly decrease until the final step? 
> 
> Does the intermediate sum ever actually transiently exceed MRBWB?

I will reword the comment. The hardware sum decreases through the walk
and never exceeds MRBWB. However, the cache-based sum transiently
exceeds MRBWB.

> > +			for (i = 0; i < hw_res->ctrl->rcid_count; i++) {
> > +				u32 rcid = (i + 1) % hw_res->ctrl->rcid_count;
> > +				u64 rbwb = (rcid == 0) ?
> > +					dom->hw_ctrl->bc.mrbwb - (hw_res->ctrl->rcid_count - 1) : 1;
> 
> If the hardware capability reports mrbwb == rcid_count - 1, will this
> calculation evaluate exactly to 0 for RCID 0?
> 
> If so, does cbqri_apply_rbwb() bypass the internal sum validation
> (which checks if rbwb > 0) and blindly write 0 to the hardware, violating
> the CBQRI section 4.5 requirement that Rbwb >= 1?

cbqri_probe_bc() already rejects mrbwb < rcid_count and refuses to
register the controller in that case. So by the time this reset runs,
mrbwb >= rcid_count is guaranteed and the subtraction yields at least 1.

I'll add a WARN_ON(mrbwb < rcid_count) at the top of the reset walk, or
factor the budget calculation into a helper that the probe and reset
paths share.

> > +static int cbqri_attach_cpu_to_one_bw_res(struct cbqri_controller *ctrl,
> > +					  enum resctrl_res_level rid,
> > +					  unsigned int cpu)
> > +{
> > +	struct cbqri_resctrl_res *hw_res = &cbqri_resctrl_resources[rid];
> > +	struct rdt_resource *res = &hw_res->resctrl_res;
> > +	struct rdt_ctrl_domain *domain;
> > +	int dom_id = ctrl->mem.prox_dom;
> > +
> > +	if (!hw_res->ctrl)
> > +		return 0;
> > +
> > +	domain = cbqri_find_ctrl_domain(&res->ctrl_domains, dom_id);
> > +	if (domain) {
> 
> If a system has multiple memory bandwidth controllers within the same NUMA
> node, will the second controller match the existing domain via
> cbqri_find_ctrl_domain() here?
> 
> Since struct cbqri_resctrl_dom only stores a single hw_ctrl pointer,
> does this mean the secondary controller is never tracked by the domain and
> its hardware limits will be silently ignored during subsequent configurations?

Multiple memory bandwidth controllers are not supported. I will update
it to detect the collision and reject the second BC at registration
time. 

-Drew
