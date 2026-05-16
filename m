Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0963626D4F7;
	Sat, 16 May 2026 06:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778912132; cv=none; b=lxnsDcW+QeEJnqmoEmytX5FQR/sSOR0kOKNZoKL2jZO+Y/t9ZaIS3dS61qlDQC/kMq7EU1yrhem4hqVrbxmI8f/7PlrJNOFGvzCAR+j9zM55qtcGqEPeYG4c6xw2PN39MZCtBZdKQ0GAud/bPtAou5nztXJJrrZIIvxk3mgT7RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778912132; c=relaxed/simple;
	bh=qzjqVHKvQyATuIeQqKgJaYd4zkcX2/SrbvAc/Ym8gQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h8IrPbbFm73gcctW27VSB8f9bw88rnUvNzthB6EQRHDAw/gOO/ns0MNktiLt9aOHZrPcwabigRd6AYM4xJ6gY5a0XQ6DFnd8oICBM1zgmRFYsVr6Sl2zmTCnXiRYjF+13Hlyd5zY2EHQPMF2zmgjfC+g70i4xvQiEns5/6KTxM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BKITLAww; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BKITLAww"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1067C19425;
	Sat, 16 May 2026 06:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778912131;
	bh=qzjqVHKvQyATuIeQqKgJaYd4zkcX2/SrbvAc/Ym8gQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BKITLAwwdnOt3fCsbnX2kwZL0cXoVpJVy7zmDy05NDYnsp9lP6JUXbnnDopm5DlsD
	 XVACQtlZzxYNN964ZcJj7Bk75QUVvC4gPuu3BueDkR2eSTSasUSJ3pO3XJrR3yjaCp
	 0gYb/SF5eWgDxtVKovFPpPl6HU/ZA/E7/epwDo3o+2AwiOks48sZh7D2FRNxtxW2I9
	 /+HNDOQmaN3t0kW49nkpEriQTiifoRgqU1znbtcIcihbFLXQPhu2jHRK7/AfG4eWiI
	 Rn8gxB2GsddwkCmHLAiGf6QkjzFONxh9rnNwnN/LcZcOQi7bNcs7rcXPndcD0eZk0u
	 fTSv6jKR5PjOA==
Date: Fri, 15 May 2026 23:15:30 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko@lists.linux.dev
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 09/18] riscv_cbqri: Add bandwidth controller probe
 and allocation device ops
Message-ID: <aggLggGOeuPTQV3p@thelio>
References: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-9-eb53831ef683@kernel.org>
 <20260512022939.683A1C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512022939.683A1C2BCB0@smtp.kernel.org>

On Tue, May 12, 2026 at 02:29:38AM +0000, sashiko-bot@kernel.org wrote:
[..]
> > +static int cbqri_bc_alloc_op(struct cbqri_controller *ctrl, int operation, int rcid)
> > +{
> > +	int reg_offset = CBQRI_BC_ALLOC_CTL_OFF;
> > +	int status;
> > +	u64 reg;
> > +
> > +	lockdep_assert_held(&ctrl->lock);
> > +
> > +	if (ctrl->faulted)
> > +		return -EIO;
> > +
> > +	if (cbqri_wait_busy_flag(ctrl, reg_offset, &reg) < 0) {
> 
> If a timeout in cbqri_wait_busy_flag() sets ctrl->faulted = true, will
> runtime operations like cbqri_bc_alloc_op() ever execute again? Because
> it returns early here when ctrl->faulted is true, the polling function
> is never called again to clear the flag, which seems to permanently
> disable the controller after a single timeout.

I'll drop the ctrl->faulted early return from cbqri_bc_alloc_op(),
cbqri_cc_alloc_op() and cbqri_mon_op() to avoid locking the controller
out for the lifetime of the driver.

> > +static int cbqri_apply_bc_field(struct cbqri_controller *ctrl, u32 closid,
> > +				void (*set)(struct cbqri_controller *, u64),
> > +				u64 (*get)(struct cbqri_controller *),
> > +				u64 val, bool *committed)
> > +{
> > +	int ret;
> > +	u64 reg;
> > +
> > +	lockdep_assert_held(&ctrl->lock);
> > +
> > +	/* Load current RCID state so the unmodified field is preserved */
> > +	ret = cbqri_bc_alloc_op(ctrl, CBQRI_BC_ALLOC_CTL_OP_READ_LIMIT, closid);
> > +	if (ret < 0)
> > +		return ret;
> 
> Does this initial read need the same sentinel protection as the
> verification read? If this READ_LIMIT silently fails, the staging
> register might retain data from a previous operation (like a different
> RCID). Since set() only modifies the target field, CONFIG_LIMIT could
> commit the stale data in the unmodified field, causing cross-RCID state
> corruption.

I'll stop relying on the register to preserve the unmodified field. I
will add an mweight_cache alongside rbwb_cache.

> > +	reg = get(ctrl);
> > +	if (reg != val) {
> > +		pr_err_ratelimited("BC field verify mismatch (reg=0x%llx != val=%llu)\n",
> > +				   reg, val);
> > +		return -EIO;
> > +	}
> > +
> > +	return 0;
> > +}
> 
> If the verification fails here and returns -EIO, *committed remains
> true. When called from cbqri_apply_rbwb(), this causes the rejected
> value to be cached in ctrl->rbwb_cache[closid]. If the requested value
> was smaller than the previous one, could this cause the software cache
> to underestimate the reserved capacity and allow future allocations to
> exceed the MRBWB hardware limit?

I'll change the order so that committed is only set to true after the
verify readback succeeds.

> > +int cbqri_apply_mweight_config(struct cbqri_controller *ctrl, u32 closid,
> > +			       u64 mweight)
> > +{
> > +	int ret;
> > +
> > +	mutex_lock(&ctrl->lock);
> > +	ret = cbqri_apply_bc_field(ctrl, closid,
> > +				   cbqri_set_mweight, cbqri_get_mweight,
> > +				   mweight, NULL);
> > +	mutex_unlock(&ctrl->lock);
> > +	return ret;
> > +}
> 
> What happens if an arbitrarily large mweight is passed in? FIELD_MODIFY
> silently truncates values larger than the 8-bit MWEIGHT_MASK. The
> verification step in cbqri_apply_bc_field() will then compare the
> truncated hardware value against the original untruncated val and
> always fail, returning -EIO and logging a hardware failure instead of
> returning -EINVAL. Should this have bounds checking similar to
> cbqri_apply_rbwb()?

I will bound mweight against FIELD_MAX(MWEIGHT_MASK) at the beginning.

> 
> > @@ -437,6 +664,83 @@ static int cbqri_probe_cc(struct cbqri_controller *ctrl)
> >  	return 0;
> >  }
> >  
> > +static int cbqri_probe_bc(struct cbqri_controller *ctrl)
> > +{
> > +	bool has_mon_at_code = false;
> > +	int err, status;
> > +	u64 reg;
> 
> [ ... ]
> 
> > +	/* Probe monitoring features */
> > +	err = cbqri_probe_feature(ctrl, CBQRI_BC_MON_CTL_OFF,
> > +				  CBQRI_BC_MON_CTL_OP_READ_COUNTER, &status,
> > +				  &has_mon_at_code);
> 
> When probing features, cbqri_probe_feature() modifies the OP mask and
> clears RCID_MASK, but it doesn't appear to clear EVT_ID_MASK:
> 
> drivers/resctrl/cbqri_devices.c:cbqri_probe_feature() {
>     ...
>     FIELD_MODIFY(CBQRI_CONTROL_REGISTERS_OP_MASK, &reg, operation);
>     reg &= ~CBQRI_CONTROL_REGISTERS_RCID_MASK;
>     iowrite64(reg, ctrl->base + reg_offset);
>     ...
> }
> 
> If the hardware or firmware left an unsupported Event ID in those bits,
> could the hardware reject the READ_COUNTER operation, causing the probe
> to see STATUS != SUCCESS and incorrectly assume monitoring is not
> supported?

I will clear OP, AT, RCID and EVT_ID on every write in the probe.

-Drew
