Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE173B2FC6;
	Wed, 13 May 2026 19:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699450; cv=none; b=EfNSAjwYfjK3atZtEn9eZ1k/lxDHVYsWwNwYqcMby92pUTAAZN2pEE2zNJg6YmLO4XtfMTyR5hk+pgISSCvcJUAnQBr2QCDFpw1cLRBx14Zr1ppwDfbYvu/wx7hbcuoLeEZJrdAan9xycx+TElJ65BtTjjAdjmD+lJKTOlTxI78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699450; c=relaxed/simple;
	bh=9MGnPPdV+VUYXwcoWGsmO7cNa+qnyLxjUe2dqB9DHPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkZz46njCA8FN8OlWka4iQEiUg+7GB5QgB11PL4ZTehkUbflKIJFAKof2nGKhwPtFMuCvCREpnx4CxLEbbugPAGU4Z7XEM8nN9Gl70tHgwRpBdgWlMo0Z9PGl21tTH/eRLzRufjkhu423eNLGPO5M6QEfGyEhnVc6xJIgteSZxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=if/ssKTf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="if/ssKTf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB1A6C19425;
	Wed, 13 May 2026 19:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778699450;
	bh=9MGnPPdV+VUYXwcoWGsmO7cNa+qnyLxjUe2dqB9DHPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=if/ssKTfRf0rQVz1zLKR7YT8p+GlSqvaWZAFdzE+p+JYykdvWtCLss2q4rDDqs4f4
	 7tpSxOVxa4CbKhVQ3ECawuFG0T8DXXe163MnUg7+7w5DLe9LSf8Bbc/I6YDiHwIUBj
	 suYWRaAgJFKAGdmFa+SgEVA95pFkYH2iQ94jklppzF7QjEBrXp8I6tIvbEQ8lSRkfJ
	 v4qzp9gMTl+ofztQndvzVUO8ctkqHh1oIplx9TZl4swrzvJHlAH2oB6EY9r7z/BXtI
	 65Uy2a602znvmdEkeZt2iwfXy9RPwFMCE1vtun5Y2KfaLXK6JKDEIvnBsN938AgPyl
	 owEdmyHL2Ul/g==
Date: Wed, 13 May 2026 21:10:47 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sashiko@lists.linux.dev
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: Add Airoha AN7583 SoC and AN7583
 Evaluation Board
Message-ID: <agTMt4_Obx_RMrrY@lore-desk>
References: <20260509-airoha-7583-v1-2-e5ad085b258e@kernel.org>
 <20260509181009.E5E6AC2BCC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UzIfF7Te10oGzSbt"
Content-Disposition: inline
In-Reply-To: <20260509181009.E5E6AC2BCC4@smtp.kernel.org>


--UzIfF7Te10oGzSbt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 6 potential issu=
e(s) to consider:
> - [High] The memory node specifies a physical size of 8GB, which is a typ=
o that will cause a fatal boot panic.
> - [Medium] The UART compatible string 'ns16550' will disable hardware FIF=
Os.
> - [Medium] The GIC maintenance interrupt polarity is incorrectly specifie=
d as active-low.
> - [Low] Missing SoC-specific compatible string for the watchdog timer.
> - [Low] Unnecessary address and size cells in the GIC node will trigger c=
ompiler warnings.
> - [Low] CPU nodes declare cooling capabilities but lack required frequenc=
y scaling properties.
> --
>=20
> commit f0ce6065ddf4c46b3e0a82baac122d34553f5f4c
> Author: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> arm64: dts: Add Airoha AN7583 SoC and AN7583 Evaluation Board
>=20
> Introduce the Airoha AN7583 SoC's dtsi and the Airoha AN7583 Evaluation
> Board's dts file.
>=20
> > diff --git a/arch/arm64/boot/dts/airoha/an7583-evb.dts b/arch/arm64/boo=
t/dts/airoha/an7583-evb.dts
> > new file mode 100644
> > index 0000000000000..76b3d94434f63
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/airoha/an7583-evb.dts
>=20
> [ ... ]
>=20
> > +	memory@80000000 {
> > +		device_type =3D "memory";
> > +		reg =3D <0x0 0x80000000 0x2 0x00000000>;
> > +	};
>=20
> Because #size-cells =3D <2>, the size array <0x2 0x00000000> sets the upp=
er
> 32 bits to 0x2, which evaluates to an enormous 8GB memory range.
>=20
> Is this a typo for 512MB (<0x0 0x20000000>) or 2GB (<0x0 0x80000000>)?
>=20
> While an identical value exists in the predecessor board's DT, it was
> safely masked there by a restrictive linux,usable-memory-range property
> in the chosen node.
>=20
> Since this board lacks that protective limit, will the kernel attempt to
> map and access the full 8GB of memory and trigger unbacked physical
> memory accesses, resulting in a fatal bus fault during early boot?

ack, I will fix it in v2.

>=20
> > diff --git a/arch/arm64/boot/dts/airoha/an7583.dtsi b/arch/arm64/boot/d=
ts/airoha/an7583.dtsi
> > new file mode 100644
> > index 0000000000000..64b2c7533aff6
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/airoha/an7583.dtsi
>=20
> [ ... ]
>=20
> > +		cpu0: cpu@0 {
> > +			device_type =3D "cpu";
> > +			compatible =3D "arm,cortex-a53";
> > +			reg =3D <0x0>;
> > +			enable-method =3D "psci";
> > +			next-level-cache =3D <&l2>;
> > +			#cooling-cells =3D <2>;
> > +		};
>=20
> Are required frequency scaling properties missing here?
>=20
> Both CPU nodes define #cooling-cells, but the cpufreq_cooling subsystem
> requires properties like clocks or operating-points-v2 to bind. Without
> them, is this cooling declaration functionally dead code that generates
> validation warnings?

ack, I will fix it in v2.

>=20
> [ ... ]
>=20
> > +		gic: interrupt-controller@9000000 {
> > +			compatible =3D "arm,gic-v3";
> > +			interrupt-controller;
> > +			#interrupt-cells =3D <3>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <1>;
>=20
> Do we need these address and size cells here? According to device tree
> compiler rules, specifying them without any children or a ranges property
> causes an avoid_unnecessary_addr_size warning.

ack, I will fix it in v2.

>=20
> > +			reg =3D <0x0 0x09000000 0x0 0x20000>,
> > +			      <0x0 0x09080000 0x0 0x80000>,
> > +			      <0x0 0x09400000 0x0 0x2000>,
> > +			      <0x0 0x09500000 0x0 0x2000>,
> > +			      <0x0 0x09600000 0x0 0x20000>;
> > +			interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
>=20
> Should this maintenance interrupt be active-high?
>=20
> The ARM Generic Interrupt Controller architecture specification explicitly
> mandates that the GIC maintenance interrupt is an active-high,
> level-sensitive interrupt (IRQ_TYPE_LEVEL_HIGH).
>=20
> Incorrect polarity might prevent it from firing properly and break
> hardware virtualization support.

ack, I will fix it in v2.

>=20
> > +		};
> > +
> > +		uart1: serial@1fbf0000 {
> > +			compatible =3D "ns16550";
>=20
> Could this compatible string unintentionally disable hardware FIFOs?
>=20
> In the Linux 8250 serial driver, ns16550 restricts the fifo_size to 1
> byte due to known hardware bugs in the original 16550 chip. Since modern
> UART IPs include working FIFOs, should this be declared as ns16550a to
> avoid excessive interrupt load?

ack, I will fix it in v2.

>=20
> > +			reg =3D <0x0 0x1fbf0000 0x0 0x30>;
> > +			reg-io-width =3D <4>;
> > +			reg-shift =3D <2>;
> > +			interrupts =3D <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> > +			clock-frequency =3D <1843200>;
> > +		};
> > +
> > +		watchdog@1fbf0100 {
> > +			compatible =3D "airoha,en7581-wdt";
>=20
> Would it be better to include the SoC-specific compatible string alongside
> the fallback?
>=20
> The dt-binding schema typically dictates using a string like
> "airoha,an7583-wdt", "airoha,en7581-wdt" to accurately describe the
> specific SoC and ensure any future platform-specific driver quirks can be
> cleanly applied.

ack, I will fix it in v2.

Regards,
Lorenzo

>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260509-airoha-7583=
-v1-0-e5ad085b258e@kernel.org?part=3D2

--UzIfF7Te10oGzSbt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCagTMtwAKCRA6cBh0uS2t
rPoJAPwPbPA5HyoNAXkQWW865UorPGSV/CAD5AA+IHUQ1fmlIgEA4Sp1UDY1hNTJ
NChKZJn069yy+NysZjdp0xk7LNPa1AA=
=0LIH
-----END PGP SIGNATURE-----

--UzIfF7Te10oGzSbt--
