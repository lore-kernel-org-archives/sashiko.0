Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881F9248F57;
	Thu, 14 May 2026 23:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778801381; cv=none; b=omoBHVI/RRpMfAZMbxWGXedrpPjEoY+HUwBUeTLkyXPL66hwApoQb1IafkRlXgFDNaIxJ+ktUhBRgl5/9wk9QNbtiI3/Tw7e8Zs/FtDrjcNPKn4LFa1hCN7gQLlYmFebujTjTvo11Gi47jy1KnrRYvBi+4AuK1Lnjc3PlU8/8Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778801381; c=relaxed/simple;
	bh=CMQU0ARBBVb5oI0gfviwbztLQrFjLbmng0WfYkmI/uk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cL4xiSBZVA+e11Vc74WzgC0LffdBJvWP65FTFTvQ02rRc5UEFuKqV0a45RZuqPBSjFSq9bHnHRmBlPQYeAijRk2UD9UJno/D57QZBSWGUhG7PsWeJUB5YpJIRia/Aq+Uz0il8PEF2S6BmWUdLMkq93k6BNFZ0RwUIggJ2fQD/Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Req4l+Tt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Req4l+Tt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42AFC2BCB3;
	Thu, 14 May 2026 23:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778801381;
	bh=CMQU0ARBBVb5oI0gfviwbztLQrFjLbmng0WfYkmI/uk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Req4l+TtOxlMUGPwK3mTpgvGyw2EOaHNiO3uHC1fVoayaYfMaeCmja/OAc6ThaTsg
	 6AML9IfVrEg6Zq+IkuPn9sWWiQk5c27pCtH4fsupvLouwYBHaiwCyTDLVT1c+Gob2p
	 NfUyO0jMuSAGKpbKuu/DkZpRbLehhVRV4yyDyRlC9sNUc9RGvSis0qIZMU/ZybNjGn
	 9uTFas4XTkHdMMjyLGhBSaBQ5c0n9c2MdFLoyrocNru8W6rsGAQLLw0GZHX4IUyVk0
	 cSxMm9JNh4/7XHUMIVZg3uQSFoEq/hqczvkol6qxTV4cQR7lCdN9Y/R6pe6iwGqFOV
	 JiDDYZLgcYBUw==
Date: Thu, 14 May 2026 23:29:38 +0000
From: Yixun Lan <dlan@kernel.org>
To: sashiko@lists.linux.dev
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] riscv: dts: spacemit: k3: Add pwm support
Message-ID: <20260514232938-GKA3652691@kernel.org>
References: <20260511-04-k3-pwm-dts-v1-1-81fcde1871f8@kernel.org>
 <20260511235952.F32FBC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260511235952.F32FBC2BCB0@smtp.kernel.org>

Hi

On 23:59 Mon 11 May     , sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Device tree node name collision causes silent overwrite of PWM0 pin configuration.
> - [Medium] PWM nodes specify two clocks, violating the schema for the fallback compatible and leaving the bus clock unmanaged.
> - [Low] Widespread copy-paste errors in pinctrl child node names.
> --
> 
> commit 9a4ae96f46c2dc497874c74f2a45fcc9d68ce685
> Author: Yixun Lan <dlan@kernel.org>
> riscv: dts: spacemit: k3: Add pwm support
> 
> This commit populates the PWM device tree nodes for the SpacemiT K3 SoC.
> It also adds the corresponding pinctrl configurations to enable PWM support
> in the future.
> 
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> > index 23899d3f308a0..1fd39502071be 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> > @@ -56,6 +56,596 @@ i2c8-pins {
> >  		};
> >  	};
> >  
> > +	/omit-if-no-ref/
> > +	pwm0_0_cfg: pwm0-0-cfg {
> > +		pwm0-0-pins {
> > +			pinmux = <K3_PADCONF(0, 3)>;	/* pwm0 */
> > +
> > +			bias-pull-up = <0>;
> > +			drive-strength = <25>;
> > +		};
> > +	};
> 
> [ ... ]
> 
> > +	/omit-if-no-ref/
> > +	pwm1_0_cfg: pwm1-0-cfg {
> > +		pwm1-0-pins {
> > +			pinmux = <K3_PADCONF(1, 3)>;	/* pwm1 */
> > +
> > +			bias-pull-up = <0>;
> > +			drive-strength = <25>;
> > +		};
> > +	};
> > +
> > +	/omit-if-no-ref/
> > +	pwm1_1_cfg: pwm0-0-cfg {
> 
> Will this cause a node name collision that silently overwrites the PWM0 pin
> configuration?
> 
> The Device Tree Compiler merges nodes with identical names at the same level.
> Because this is named pwm0-0-cfg instead of pwm1-1-cfg, the pinmux property
> of pwm0_0_cfg will be overwritten by this node. If a board device tree
> references pwm0_0_cfg, will it receive the pin configuration for PWM1 instead
> of PWM0?
> 
> > +		pwm0-0-pins {
> 
> This isn't a bug, but there appear to be widespread copy-paste errors in the
> pinctrl child node names.
> 
Yes..
> For example, pwm1_1_cfg uses pwm0-0-pins, pwm1_2_cfg uses pwm1-0-pins, and
> pwm2_1_cfg uses pwm2-0-pins. While this does not cause functional issues, it
> creates a confusing device tree structure.
> 
right, this is a typo, will fix
> > +			pinmux = <K3_PADCONF(43, 6)>;	/* pwm1 */
> > +
> > +			bias-pull-up = <0>;
> > +			drive-strength = <25>;
> > +		};
> > +	};
> 
> [ ... ]
> 
> > diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > index 815debd16409b..07e43b6b256ec 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > @@ -797,6 +797,226 @@ i2c8: i2c@d401d800 {
> >  			status = "disabled";
> >  		};
> >  
> > +		pwm0: pwm@d401a000 {
> > +			compatible = "spacemit,k3-pwm", "marvell,pxa910-pwm";
> > +			reg = <0x0 0xd401a000 0x0 0x10>;
> > +			clocks = <&syscon_apbc CLK_APBC_PWM0>,
> > +				 <&syscon_apbc CLK_APBC_PWM0_BUS>;
> > +			clock-names = "func", "bus";
> 
> Could these clock definitions violate the schema for the fallback compatible
> and leave the bus clock unmanaged?
> 
> The dt-binding for marvell,pxa-pwm.yaml restricts clocks to maxItems: 1 and
> prohibits clock-names.
> 
> Additionally, the fallback driver (drivers/pwm/pwm-pxa.c) calls
> devm_clk_get(dev, NULL), which will only acquire the first func clock. If the
> SoC requires the APB bus clock to be explicitly enabled for register access,
> could this result in a bus fault when the fallback driver probes?
> 
I think this is false positive error, which due to the pwm driver change for
K3 was not merged into mainline.. will ping pwm maintainer for inclusion

https://lore.kernel.org/r/20260428-03-k3-pwm-drv-v2-0-a532bbe45556@kernel.org

> > +			resets = <&syscon_apbc RESET_APBC_PWM0>;
> > +			#pwm-cells = <3>;
> > +			status = "disabled";
> > +		};
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260511-04-k3-pwm-dts-v1-1-81fcde1871f8@kernel.org?part=1

-- 
Yixun Lan (dlan)
