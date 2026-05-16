Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95D927707;
	Sat, 16 May 2026 03:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778900757; cv=none; b=Lm9f+ADA/qqMXffq7y0iy+HWPc83/xTWP1Klv4kF+FOSHA5D+EUm0zqLDVKL9E4U6qQKOKiV/mJsrtJEwP7gXJMtjeCYHnQDxxlQVWCJdJ5qP5SNvjdNwm8ii3rjJ8F1ZbbtWSqkin6tbAqDtvyaB+OGtKg3jt23eY+/n2L4a2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778900757; c=relaxed/simple;
	bh=ZdO8LpvUMWMIZvaMnV6/IDHpYuzoWR3vkH4yZLYmhO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P0zUaAfKOvqx2MuWn7uZhdsZ5zYbC2tMacmgboiFbkP+nd+LSRDHHcbY8Be39HIO2NMftUcldU7x4jrtj6yNKX7Ojbw3Yrz3lkW4vsDi3nS6WaZe57kTI8C+lNdR4z+pFApaekTPkNH3yQUOqvh+aoB8j0G5N196DngS1NqTy/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kn8vmPmH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kn8vmPmH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36141C2BCB0;
	Sat, 16 May 2026 03:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778900757;
	bh=ZdO8LpvUMWMIZvaMnV6/IDHpYuzoWR3vkH4yZLYmhO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kn8vmPmHoHEvQ4Wq+VG405oaDp6Ef+xNEkLp8218o8jD+f6MbQ7uqf/AseZL1BSvT
	 1mC9Xd8yzqfL9++F1ONwnTzlzRlHKqaPrivOuV5XvZoLDBgtXhK1+xa6ZutKx+qWsg
	 23XPYeHoq/436o7+XmbyxMbW58XWPIHL3QPJWbuVYM2Sjs6lZvlHEE19jqMLVWsqGo
	 RQo5quEG6MSMK0I7ZS+Vf8V/wmze0XjWV1txbLrZx4WKwPzDYal1h+duAcb7a3jzHN
	 Tqn9quGXgWksKC4Dk3R5yoY87G28LTho0lAUjuun8ZF/CJzMMTjxby+bL4kq9cIjE3
	 fEjXsAjw8bL3g==
Date: Fri, 15 May 2026 20:05:54 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko@lists.linux.dev
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 08/18] riscv_cbqri: Add capacity controller
 monitoring device ops
Message-ID: <agffEmioJUzX3OUo@x1>
References: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-8-eb53831ef683@kernel.org>
 <20260512015859.B33A7C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512015859.B33A7C2BCB0@smtp.kernel.org>

On Tue, May 12, 2026 at 01:58:59AM +0000, sashiko-bot@kernel.org wrote:
[..] 
> > @@ -361,6 +402,28 @@ static int cbqri_probe_cc(struct cbqri_controller *ctrl)
> >  	}
> >  	cpus_read_unlock();
> >  
> > +	/* Probe monitoring features */
> > +	err = cbqri_probe_feature(ctrl, CBQRI_CC_MON_CTL_OFF,
> > +				  CBQRI_CC_MON_CTL_OP_READ_COUNTER, &status,
> > +				  &has_mon_at_code);
> 
> Does reusing cbqri_probe_feature() for the Monitoring Control Register
> (MON_CTL) execute invalid hardware commands and write to reserved bits?
> 
> Looking at cbqri_probe_feature(), it issues the operation while clearing the
> RCID but ignores the EVT_ID field. This means it issues a counter read using
> whatever uninitialized value the bootloader left in EVT_ID. Hardware is
> expected to reject a counter read for an unconfigured event, returning an
> error status instead of success.
> 
> Won't this expected failure cause the probe to falsely conclude monitoring is
> unsupported?

I will change it so every write masks the controller's input fields
clean before ORing the intended values.

> Additionally, cbqri_probe_feature() unconditionally attempts to verify Access
> Type (AT) support by modifying bits 7:5. Since the MON_CTL register layout
> does not contain an AT field, does this modify implicitly reserved bits and
> risk hardware faults?

Bits 7:5 in MON_CTL are reserved zero and should not be hazardous to write.

> Also, in the secondary AT=CODE probe within cbqri_probe_feature(), it appears
> the RCID field is not re-cleared:
> 
> cbqri_probe_feature() {
>     ...
>     reg = saved_reg;
>     FIELD_MODIFY(CBQRI_CONTROL_REGISTERS_OP_MASK, &reg, operation);
>     FIELD_MODIFY(CBQRI_CONTROL_REGISTERS_AT_MASK, &reg,
>                  CBQRI_CONTROL_REGISTERS_AT_CODE);
>     iowrite64(reg, ctrl->base + reg_offset);
>     ...
> }
> 
> If the bootloader left an out-of-bounds or invalid value in the RCID field,
> will this secondary probe execute on that invalid ID and potentially cause a
> hardware fault?

I will use (saved_reg & ~active_mask) so RCID/MCID will start from 0.

> 
> > +	if (err)
> > +		return err;
> 
> [ ... ]
> 
> > diff --git a/drivers/resctrl/cbqri_internal.h b/drivers/resctrl/cbqri_internal.h
> > index 6a581a7e417be..b1169ffc599fb 100644
> > --- a/drivers/resctrl/cbqri_internal.h
> > +++ b/drivers/resctrl/cbqri_internal.h
> 
> [ ... ]
> 
> > @@ -39,6 +41,20 @@
> >  #define CBQRI_CC_ALLOC_CTL_OP_READ_LIMIT   2
> >  #define CBQRI_CC_ALLOC_CTL_STATUS_SUCCESS  1
> >  
> > +#define CBQRI_CC_MON_CTL_OP_CONFIG_EVENT 1
> > +#define CBQRI_CC_MON_CTL_OP_READ_COUNTER 2
> > +
> > +/* mon_ctl field masks (CC and BC share an identical OP/MCID/EVT_ID/STATUS layout) */
> > +#define CBQRI_MON_CTL_OP_MASK        GENMASK(4, 0)
> > +#define CBQRI_MON_CTL_MCID_MASK      GENMASK(19, 8)
> > +#define CBQRI_MON_CTL_EVT_ID_MASK    GENMASK(27, 20)
> 
> Can FIELD_MODIFY() combined with GENMASK() zero-extend and silently clear the
> upper 32 bits of 64-bit control registers on 32-bit architectures?
> 
> Since CBQRI_MON_CTL_OP_MASK and CBQRI_MON_CTL_MCID_MASK are defined using
> GENMASK(), they yield an unsigned long (32-bit on RV32).
> 
> When FIELD_MODIFY() does *(_reg_p) &= ~(_mask) on the 64-bit u64 reg, the
> bitwise negation of the 32-bit mask is bitwise ANDed with reg. C integer
> promotion rules zero-extend the unsigned 32-bit value to something like
> 0x00000000FFFFFFE0ULL.
> 
> Will this inadvertently clear bits 63:32 of the register to 0 before it is
> written back via iowrite64(), potentially corrupting the STATUS field, the
> BUSY bit, and any hardware Write-Preserve-Read-Ignore fields?

RV32 cannot reach this code today. RISCV_CBQRI_DRIVER selects
RISCV_ISA_SSQOSID, which depends on 64BIT, so unsigned long is always
64-bit where these masks are evaluated.

However, I will widen OP/MCID/EVT_ID to GENMASK_ULL too so the masks
stay correct if the driver is ever ported.

-Drew
