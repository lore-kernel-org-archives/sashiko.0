Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF60816132A;
	Sat,  9 May 2026 15:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778342197; cv=none; b=upJkNvmyeZELSLdRV2n2wvLyi6c5qTz9gv0Gd0Kg0HbAP27lWEj93UOT30cC8R7QuoqZzmg8QZtg/iqclrsxud413HjKggosIA0VvkUm6NdtjRH1xVeD2115HL4Yt6SLwcrBXukjBszjE8vaU5XKS2bGlcksGcMeEru+FPiIDi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778342197; c=relaxed/simple;
	bh=J7xfoErg0M9bRKy1dNgrxcNZ10saKgbcbMhweq31ygo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pR2MrfSfHy7CRUsW5yvCHvClVx3wcA2JoNMRLiZ5ocSOYyBtumdJHW4/2UImODkjXF6ewLTVLZ5NhtKvCvtdM48hUJTr1DbkZ83rjUc08Jh9Fj5vIELJaOXwf+Nh91euvHcUzVW8BqDGzVDPWCA7nh6aeSODO94r3rCLtNAvNbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BAHOq2LU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BAHOq2LU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3968BC2BCB2;
	Sat,  9 May 2026 15:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778342197;
	bh=J7xfoErg0M9bRKy1dNgrxcNZ10saKgbcbMhweq31ygo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BAHOq2LU9evi4P+L7j+TqnukrEX0CORErJWx+CVMhkGhmrEOyXgJhxJ6sj7vxRAZ1
	 iPLOUK+1EJGwMWqLQP7hOJ0TK+klF0Lwxva3m5sUuDWJc73IW/4qUSaJZikPIVdsi1
	 pdzstJVLo8plQ0+BZDFlkA9Tsr4xZm6tcCbbprEkE/k/jcnz1isf06vO0kFxs17h1U
	 9gXaQk6fagBXy8nM3y4aq4hfKIfp1FxnOHYKKNTx7oXJ2QEadqM1nd7K5lVzvEx+LB
	 hIyMO7aIlf97xK4b1U9ECQh1o4o204vH5zGKgI5+oLP7kWGdtYY+JDBaSuyA2Hpc2s
	 PIMt1E5IW0UiA==
Date: Sat, 9 May 2026 16:56:34 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko@lists.linux.dev
Cc: Arnd Bergmann <arnd@kernel.org>, conor+dt@kernel.org,
	krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH 1/3] [v5 net-next] dt-bindings: net: add
 st,stlc4560/p54spi binding
Message-ID: <20260509-magnifier-varnish-b948ef563e79@spud>
References: <20260507212451.3333185-2-arnd@kernel.org>
 <20260508213255.60491C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bJrnYPUhUfooe3mG"
Content-Disposition: inline
In-Reply-To: <20260508213255.60491C2BCB0@smtp.kernel.org>


--bJrnYPUhUfooe3mG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 08, 2026 at 09:32:54PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Low] Typo in the binding description: 'STLC5460' is used instead of 'S=
TLC4560'.
> - [Low] The `interrupts-extended` and `powerdown-gpios` specifiers in the=
 example lack standard secondary cells (flags/triggers).
> --
>=20
> commit b803e7cb976e6f9f5ea1b9d2c76cdffbb8fe0d67
> Author: Arnd Bergmann <arnd@arndb.de>
>=20
> dt-bindings: net: add st,stlc4560/p54spi binding
>=20
> This commit adds a device tree binding for the SPI version of the Prism54
> wireless device. It documents the known names of this device and the
> properties sufficient for its use.
>=20
> Link: https://lore.kernel.org/all/e8dc9acb-6f85-e0a9-a145-d101ca6da201@gm=
ail.com/
>=20
> > diff --git a/Documentation/devicetree/bindings/net/wireless/st,stlc4560=
=2Eyaml b/Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml
> > new file mode 100644
> > index 0000000000000..a32265c07350d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/wireless/st,stlc4560.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ST/Intersil/Conexant stlc45xx/p54spi/cx3110x SPI wireless device
> > +
> > +maintainers:
> > +  - Christian Lamparter <chunkeey@gmail.com>
> > +
> > +description:
> > +  The SPI variant of the Intersil Prism54 wireless device was sold
> > +  under a variety of names, including Conexant CX3110x and
> > +  ST Microelectronics STLC5460.
>=20
> This isn't a bug, but there's a typo in the description (STLC5460 instead
> of STLC4560).
>=20
> [ ... ]
>=20
> > +examples:
> > +  - |
> > +    spi {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        wifi@0 {
> > +            compatible =3D "st,stlc4560";
> > +            reg =3D <0>;
> > +            spi-max-frequency =3D <48000000>;
> > +            interrupts-extended =3D <&gpio 23>;
> > +            powerdown-gpios =3D <&gpio 1>;
>=20
> Do these specifiers need standard secondary cells for flags and triggers?
>=20
> Real-world GPIO controllers typically require #gpio-cells =3D <2> or
> #interrupt-cells =3D <2> to specify trigger types and active levels. While
> dt_binding_check accepts this since the phandle cell sizes are unknown,
> copying this example into a real device tree will result in a compilation
> error.

Can we make this thing not whinge about stuff like this? It's an
/example/ and these fields cannot be copy-pasted anyway.

>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260507212451.33331=
85-1-arnd@kernel.org?part=3D1

--bJrnYPUhUfooe3mG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaf9ZMQAKCRB4tDGHoIJi
0k9sAP9stjxEJKElSiyFpgtpPyogLYkUC2URiqGCBB27DRvy+wD+JiRxVbN0wI+O
Jz/5lAgWxxjvcZs3/yJq1jssLcqWGgY=
=gywH
-----END PGP SIGNATURE-----

--bJrnYPUhUfooe3mG--
