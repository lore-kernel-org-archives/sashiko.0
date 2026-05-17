Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3742ED848;
	Sun, 17 May 2026 06:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779000988; cv=none; b=QdOkTT7lnjg/SGNecvQXOF8zn9XQttr/rd4WVOtST/0W+/cus6jI0TLYgZSXL2MFmJbk7VOS1isnGhBUIT9IhaViZ7ib68WhxhOI288eQ862MsGEigslVhk9bxm0Zp07E5LOuuFWHh+cWWoMZ17j6FCjqwCPvL79KvtW71srDx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779000988; c=relaxed/simple;
	bh=WfJI8//0rNc8Gw4ik+Cx70cFrQE8E/tdr3m42LSQEVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uLTJmjZFCSd91LomljgHzFVVq4NrF8Kr/d31zjWPZup5HgicxR3zKHLleHwg5vklW0p4T3LVyz4fKzywwcAbOlQkoCojGxlnuRQioqeCu13zCFLp9oWiNxcA/OnS2iF+nu+n+iBXpUepACokWleo0pGdBRW1QhYgCr6G/CO1cMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJRNQK/o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJRNQK/o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B4DC2BCB0;
	Sun, 17 May 2026 06:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779000987;
	bh=WfJI8//0rNc8Gw4ik+Cx70cFrQE8E/tdr3m42LSQEVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gJRNQK/oQM8kuyyNA4wjJHym5YtDnZVlBwMOJyxzo8aM+fFZojqbCm/sHxzKbdYRh
	 qcBaa4t7pshXyYaAdUJLWt7yiPWaK4qbb5b32PRpQFjm6zY1kYMN53mf2Ch4irsbWq
	 J5NhJWN99E9piS/PziKuUJMwAWsl36pJ3bJdWezBf/hQrUcNPj836Z/rSYIltA0NTR
	 d+K1QCW04pAMjTXfAybV0udAhC1wL9MHUJVSpdfkrQV2QGPTcRP23GEk9kcd7Wt3im
	 Ro3Ar4duQrLvB4uO6wN5i4vVsEgikrveNInZ0mUAIGXvu4asFOcBLJXN9WiA70zvxt
	 6JTTj+f6tfE1w==
Date: Sat, 16 May 2026 23:56:26 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko@lists.linux.dev
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 18/18] riscv: enable resctrl filesystem for Ssqosid
Message-ID: <aglmmkHKTlt9nhwq@thelio>
References: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-18-eb53831ef683@kernel.org>
 <20260512225649.4A949C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512225649.4A949C2BCB0@smtp.kernel.org>

On Tue, May 12, 2026 at 10:56:48PM +0000, sashiko-bot@kernel.org wrote:
> This commit updates the RISCV_ISA_SSQOSID Kconfig option to select
> RISCV_CBQRI_DRIVER. It conditionally selects the driver only if
> RESCTRL_FS is enabled, aiming to keep the filesystem as a user choice.
> 
> > RISCV_ISA_SSQOSID selects RISCV_CBQRI_DRIVER, which in turn depends
> > on RESCTRL_FS. Enabling the resctrl filesystem itself stays a user
> 
> Is this description accurate?
> 
> The driver configuration shows that RISCV_CBQRI_DRIVER only depends on
> RISCV && RISCV_ISA_SSQOSID. The filesystem integration is decoupled into
> a separate silent config, so the driver does not actually depend on
> the filesystem.

The commit message is wrong. I will rewrite it to describe the actual
wiring.

> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -596,6 +596,7 @@ config RISCV_ISA_SSQOSID
> >  	depends on 64BIT
> >  	default n
> >  	select ARCH_HAS_CPU_RESCTRL
> > +	select RISCV_CBQRI_DRIVER if RESCTRL_FS
> 
> Could this conditional selection lead to unexpected configurations?
> 
> Because the driver does not actually depend on the filesystem, if a user
> enables the SSQOSID extension but leaves RESCTRL_FS disabled, the
> underlying hardware driver will unexpectedly not be automatically
> selected. 
> 
> This differs from platforms like ARM64, where ARM64_MPAM unconditionally
> selects ARM64_MPAM_DRIVER regardless of the filesystem configuration.

The 'if RESCTRL_FS' guard is wrong. I will drop it so that enabling
SSQOSID always pulls in the controller driver.

-Drew
