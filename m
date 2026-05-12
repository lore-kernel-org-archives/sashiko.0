Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B63A3C8C73;
	Tue, 12 May 2026 16:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778604684; cv=none; b=jtjQXzycMizHq1tgSx8QpAP92lRCPup/WpWg88oMHFoJqV+hypVswQEiAUGDVKt5obSDZ1uDF/FyldgdpIwS1y+Erc14/92Oc1ULOXpZ9NKCZBNE5nLZLX6iYdicpdxIwDUWgl2km5LMRIltydbsRVi7BHTHrlLQE+SjgA3Bk6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778604684; c=relaxed/simple;
	bh=snBBbNRQvHHnZNEiL0uSmOXZoiHVTiMLAbhb1SYyhxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kBZQNQ8tvKLjgFXyzINXX668lqHBHb3ef81gYwfn/gE6FMnIg0LoG1dcAM3KO2fSd1bQ8Uz8GTJz9H633DFkXu7y1qpfArwPpo64jtBu0Q6ItIgrtC43ZhoSLlBhazsep7xBjp0J/cYrtFKNihSGQSsWV+7KN+oZY9l+nlNJTkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PDOwjgDx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PDOwjgDx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34653C2BCB0;
	Tue, 12 May 2026 16:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778604684;
	bh=snBBbNRQvHHnZNEiL0uSmOXZoiHVTiMLAbhb1SYyhxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PDOwjgDxFklzdHYF968Aj0OZib4OAviRPtTqXcrQmbiAgL0flJgYoGcV74ALgac6M
	 36bp3gSP1Fx3IYh35ZpAcz1/0iCcb5JuCQutxug5wXQXAb3942JOxLv71QzJirOd43
	 xN4hCMHwXv2qjwm+BAPUSg9UNNc+hI91Sjh+OuDQ0OFX6HA9thTpbbxKBjCYGdfaI0
	 547+ZUnpkeLdpeSMMRPpO2YrLsIbMN8RxFzR60rMrZVn8z+ezJKWMZyuq2EyXB5jsm
	 A25AlkT/Uc/J0oWx5xnWfjuzIrAWyXW27i+BKl3mZAicAxB9z5OkEO2t6iXKZ+J3pc
	 9XYGngMTbtQxA==
Date: Tue, 12 May 2026 17:51:20 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko@lists.linux.dev
Cc: Piyush Patle <piyushpatle228@gmail.com>, krzk+dt@kernel.org,
	robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v7 04/11] dt-bindings: iio: adc: hx711: add HX710B support
Message-ID: <20260512-frantic-finch-2b268bed4e15@spud>
References: <20260510194947.31997-5-piyushpatle228@gmail.com>
 <20260511215430.4441FC2BCF5@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+3Jb8+egrKaChTot"
Content-Disposition: inline
In-Reply-To: <20260511215430.4441FC2BCF5@smtp.kernel.org>


--+3Jb8+egrKaChTot
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 09:54:29PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The `dvdd-supply` property is incorrectly permitted for the ol=
der HX711 variant, violating the intended hardware constraints and contradi=
cting the commit message.
> --
>=20
> commit b2ce63274d21d343a80ad3dfc6983d09ccc4fbdc
> Author: Piyush Patle <piyushpatle228@gmail.com>
>=20
> dt-bindings: iio: adc: hx711: add HX710B support
>    =20
> This adds the avia,hx710b compatible string and documents the hx710b-spec=
ific
> dvdd and vref supplies. It also adds constraints to forbid hx711-only
> properties on hx710b nodes and requires vref-supply for hx710b.
>=20
> > diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml =
b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> > index 9134bbe413796..b2b5c7bdf05e6 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> > +++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
>=20
> [ ... ]
>=20
> > @@ -44,6 +49,17 @@ properties:
> >        RATE pin state is determined by the board wiring.
> >      maxItems: 1
> > =20
> > +  dvdd-supply:
> > +    description:
> > +      Digital supply voltage (DVDD). For the HX710B, DVDD must be
> > +      greater than or equal to AVDD. When DVDD is a battery rail and
> > +      AVDD is a regulated supply, one channel monitors the DVDD-AVDD
> > +      difference for battery level detection.
> > +
> > +  vref-supply:
> > +    description:
> > +      Reference voltage input (VREF).
> > +
> >    clock-frequency:
>=20
> [ ... ]
>=20
> > @@ -53,6 +69,21 @@ properties:
> >      maximum: 2500000
> >      default: 400000
> > =20
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          const: avia,hx710b
> > +    then:
> > +      properties:
> > +        vsup-supply: false
> > +        rate-gpios: false
> > +      required:
> > +        - vref-supply
> > +    else:
> > +      properties:
> > +        vref-supply: false
>=20
> The commit message states the intention to document the hx710b-specific d=
vdd
> and vref supplies.
>=20
> Since dvdd-supply is defined in the top-level properties block, does this
> else clause also need to forbid dvdd-supply for the older avia,hx711 vari=
ant?
>=20
> Currently, omitting dvdd-supply: false permits the property for the older
> hx711 variant. Should dvdd-supply: false be added here?

Seemingly no, hx711 schematic has a dvdd.

--+3Jb8+egrKaChTot
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagNaiAAKCRB4tDGHoIJi
0l85AQC8+13SbY/vDMoPqlPAUnkks4tn9iFzq5Xc/7E/ZCKgZAD9Ga8y4DQRt2Rp
VWa5MpMv5dfuWxTZHCJWnd3+CAxITQM=
=qgCz
-----END PGP SIGNATURE-----

--+3Jb8+egrKaChTot--
