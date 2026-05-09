Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8233B19EED3;
	Sat,  9 May 2026 18:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778350102; cv=none; b=ILyRHCO3kRwu53W/56ZQtHaSb7V7bvsB8SPHbZFD7VEiOaMBdC6FJQSTCeV4aANrqFIBSoRU7CKM2P20YrmJ6f+ZK/TO+qxt18a4H7hSRBSEBX3bt+NDh5ukZvgX8A5qNNcw7gwyKF09u/8RSH/MBvI9ug+oxOzg+KuEBxbneu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778350102; c=relaxed/simple;
	bh=JRsrUMf8lSnKXkLmCxNX9Cn/uJ48REVsnLSjuCuU68w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJIhFsNPMaMS6TrigObGsno+LY66b4Y4+EEtL6L/cLM9HG4iAs1/xkHR8Ku2QS+ni7FEbWEzO9fEDQbWXtTWtQ/gwEhqF0En9IaS4e0HonDt1MonbV5wifE9eiVEf6u/pjEiVWgzy2/EFkuBksXzvlkDKf4SOrlIZDdZ6O4MN7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mHW8T6bQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mHW8T6bQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A75C2BCB2;
	Sat,  9 May 2026 18:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778350102;
	bh=JRsrUMf8lSnKXkLmCxNX9Cn/uJ48REVsnLSjuCuU68w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mHW8T6bQeLSIV0/s6e5A6xrpaCdK4OgkY0g+mtYwDbQEe/NUSdRLf4hqCyam32Y/D
	 2n+IdAkA23T1YqnlvNy43bBG8uyU2dAPQQBVwysSzoSEeRQH/csV/rI+/pMedKJZpG
	 EVYL36zJ6cZqC6aicDmpf5elr2/DqVMU6se355E9Zqy3rRYywBFFWASFkgrGdyE121
	 Qao4DK6NfeOBK5OTckpeHybJZtYLMhM274l0xwgl9M89ux+PbDMligcSjZ9j80YF2M
	 qNJn4x9P9QrODuznhEfQdd8SBtm2/i2/5myHUgQEnuR8pjDn3gm2HlVde9MWYGUqbN
	 W/ay4Ors46Ouw==
Date: Sat, 9 May 2026 19:08:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: sashiko@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>,
	conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH 1/3] [v5 net-next] dt-bindings: net: add
 st,stlc4560/p54spi binding
Message-ID: <20260509-chewing-outback-1bc754a871ca@spud>
References: <20260507212451.3333185-2-arnd@kernel.org>
 <20260508213255.60491C2BCB0@smtp.kernel.org>
 <20260509-magnifier-varnish-b948ef563e79@spud>
 <877bpcmtnn.fsf@linux.dev>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ze/ku3eWboxOyXqO"
Content-Disposition: inline
In-Reply-To: <877bpcmtnn.fsf@linux.dev>


--ze/ku3eWboxOyXqO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 09, 2026 at 09:31:24AM -0700, Roman Gushchin wrote:
> Conor Dooley <conor@kernel.org> writes:
>=20
> > On Fri, May 08, 2026 at 09:32:54PM +0000, sashiko-bot@kernel.org wrote:
> >> Thank you for your contribution! Sashiko AI review found 2 potential i=
ssue(s) to consider:
> >> - [Low] Typo in the binding description: 'STLC5460' is used instead of=
 'STLC4560'.
> >> - [Low] The `interrupts-extended` and `powerdown-gpios` specifiers in =
the example lack standard secondary cells (flags/triggers).
> >> --
> >>=20
> >> commit b803e7cb976e6f9f5ea1b9d2c76cdffbb8fe0d67
> >> Author: Arnd Bergmann <arnd@arndb.de>
> >>=20
> >> dt-bindings: net: add st,stlc4560/p54spi binding
> >>=20
> >> This commit adds a device tree binding for the SPI version of the Pris=
m54
> >> wireless device. It documents the known names of this device and the
> >> properties sufficient for its use.
> >>=20
> >> Link: https://lore.kernel.org/all/e8dc9acb-6f85-e0a9-a145-d101ca6da201=
@gmail.com/
> >>=20
> >> > diff --git a/Documentation/devicetree/bindings/net/wireless/st,stlc4=
560.yaml b/Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml
> >> > new file mode 100644
> >> > index 0000000000000..a32265c07350d
> >> > --- /dev/null
> >> > +++ b/Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml
> >> > @@ -0,0 +1,61 @@
> >> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> > +%YAML 1.2
> >> > +---
> >> > +$id: http://devicetree.org/schemas/net/wireless/st,stlc4560.yaml#
> >> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> > +
> >> > +title: ST/Intersil/Conexant stlc45xx/p54spi/cx3110x SPI wireless de=
vice
> >> > +
> >> > +maintainers:
> >> > +  - Christian Lamparter <chunkeey@gmail.com>
> >> > +
> >> > +description:
> >> > +  The SPI variant of the Intersil Prism54 wireless device was sold
> >> > +  under a variety of names, including Conexant CX3110x and
> >> > +  ST Microelectronics STLC5460.
> >>=20
> >> This isn't a bug, but there's a typo in the description (STLC5460 inst=
ead
> >> of STLC4560).
> >>=20
> >> [ ... ]
> >>=20
> >> > +examples:
> >> > +  - |
> >> > +    spi {
> >> > +        #address-cells =3D <1>;
> >> > +        #size-cells =3D <0>;
> >> > +
> >> > +        wifi@0 {
> >> > +            compatible =3D "st,stlc4560";
> >> > +            reg =3D <0>;
> >> > +            spi-max-frequency =3D <48000000>;
> >> > +            interrupts-extended =3D <&gpio 23>;
> >> > +            powerdown-gpios =3D <&gpio 1>;
> >>=20
> >> Do these specifiers need standard secondary cells for flags and trigge=
rs?
> >>=20
> >> Real-world GPIO controllers typically require #gpio-cells =3D <2> or
> >> #interrupt-cells =3D <2> to specify trigger types and active levels. W=
hile
> >> dt_binding_check accepts this since the phandle cell sizes are unknown,
> >> copying this example into a real device tree will result in a compilat=
ion
> >> error.
> >
> > Can we make this thing not whinge about stuff like this? It's an
> > /example/ and these fields cannot be copy-pasted anyway.
>=20
> If you have an idea how to convert it into a rule, I'm happy to merge it
> into prompts. Something like "fields X and Y are not required for
> example dt records". Sorry, it's really far from my area of expertise, so
> I don't know what's right here and what's not.

"Ignore phandle arguments in examples, when the phandle doesn't
reference a node in the example"? Although, probably can go as far as
"ignore phandle arguments in examples", since Rob's bot does
validation on examples, and should catch a mismatch where the target of
phandle exists.

I dunno if "argument" is the correct word for the RHS of the property.

--ze/ku3eWboxOyXqO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaf94EgAKCRB4tDGHoIJi
0sZ2AQD6PKfbPd3k+eVwxvewde6nKXd9BCzpnx4kTdklvgIjQAEAnI4oZlHpOHtj
wcdJg9fN2/4IyQgK7zQxDkrPP4Md/AM=
=M6WI
-----END PGP SIGNATURE-----

--ze/ku3eWboxOyXqO--
