Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B70B34404B;
	Sat,  9 May 2026 18:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778351545; cv=none; b=kf16D2d9o57hNcPURCwWquRT4tUUNpPkgLZVI2tU+lV1/QviaCNTZ4W7aQVhov+mCrBuiRi7G4KdI7j0or6FO99pPRIK8qCuHbo50MPzHnxZGv4FdvCq0F+XuJSMFzeqolTHMxCwkeCXb7nD6fKq5pH7eOqbSJYCVeOlyHIaYKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778351545; c=relaxed/simple;
	bh=UJKo7e3p7OEd5/fzABoOKgel67ZP1QWVVgN2nNV1XXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aJ9dC7g2GmKZZ1Jg+EGPiKMwhpoA3+mJDRjK6x5MzTCnRRguadJsUaZ/lwR/A3cVxhdbepTig3kRGcVQ66ObjcEH+LacqkGG2Yz4ZRechllkDRNxxJnJTeKpQKzmv1STI9uFFPPfzP3P0YptngJ90jJihvT5ZBjLr2/fcfjS9PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=muss45fr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="muss45fr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41816C2BCB2;
	Sat,  9 May 2026 18:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778351544;
	bh=UJKo7e3p7OEd5/fzABoOKgel67ZP1QWVVgN2nNV1XXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=muss45fr4R2QWBk2SmiYA3tnCg8cO+gosL2S8nxmltbeRj3SwX3okdurxBWvZ1D1z
	 qLYE8ItIwaaBNi2UnzMMDuCcawadIe3ChI3EngQ5A+LNYXl8BwhJm3cIHSVLn/ZDlv
	 57GX7JsMXFg3CsWidWetjJPfr5JJKokywx8/ZbfSMB4vMNyfXI5/J3sxjZB3YioC9f
	 HWzDC6kOlv2zSRyCwhvy7gKLhA6F7FIyZhbnNq6YiFbIeYGt1Xz0uWj8oTX9GCOXer
	 XVK1Sf4qsPET1rp9U6g7syz2/TVmTDypvRZ7oSS8wRBAsiw1wMgp7KhUK56vAuIFZH
	 Bc29HufmBtGkg==
Date: Sat, 9 May 2026 19:32:20 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko@lists.linux.dev
Cc: Udaya Kiran Challa <challauday369@gmail.com>, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v3] dt-bindings: rtc: epson,rx6110: Convert to DT Schema
Message-ID: <20260509-heaving-giggle-d9684940eb1c@spud>
References: <20260509181909.21871-1-challauday369@gmail.com>
 <20260509182830.40C25C2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GDNU+dClHkpMN1cB"
Content-Disposition: inline
In-Reply-To: <20260509182830.40C25C2BCB2@smtp.kernel.org>


--GDNU+dClHkpMN1cB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 09, 2026 at 06:28:29PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The use of `oneOf` in the `if` condition allows invalid config=
urations with exactly two SPI properties to silently bypass validation.
> --
>=20
> commit 61c42b03c451c90501fbc1f5dfb0ec651bc79cc8
> Author: Udaya Kiran Challa <challauday369@gmail.com>
>=20
> dt-bindings: rtc: epson,rx6110: Convert to DT Schema
>=20
> Convert the Epson RX6110 Real Time Clock devicetree binding
> from the legacy text format to DT schema.
>=20
> > diff --git a/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml b/=
Documentation/devicetree/bindings/rtc/epson,rx6110.yaml
> > new file mode 100644
> > index 0000000000000..09578de45d8db
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml
>=20
> [ ... ]
>=20
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +if:
> > +  oneOf:
> > +    - required:
> > +        - spi-cs-high
> > +    - required:
> > +        - spi-cpha
> > +    - required:
> > +        - spi-cpol
>=20
> Does this oneOf condition allow invalid configurations with exactly two
> SPI properties to silently bypass validation?
>=20
> In JSON schema, oneOf requires exactly one of the subschemas to evaluate
> to true. If a device tree node provides exactly two of the three SPI
> properties (e.g., spi-cs-high and spi-cpha, but omitting spi-cpol), the
> node satisfies two of the required conditions.
>=20
> Because it matches two subschemas rather than one, the oneOf condition
> evaluates to false. Consequently, the if condition fails, the then block
> is skipped, and the schema successfully validates the incomplete node.
>=20
> Would it be better to use anyOf here instead, to correctly trigger the
> requirement that all three properties must be present if at least one is
> provided?

^^^ This is correct, I should have suggested anyOf not oneOf.

--GDNU+dClHkpMN1cB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaf99tAAKCRB4tDGHoIJi
0hd0AQCee7oxchox/429u9DsoEMqY26Uo/yjidxud1pGUJdDWAD9FJCU+rDfX/gQ
Ckr94XDGRBEQ3qzOf1RhGXQNQXDmtg8=
=G0vN
-----END PGP SIGNATURE-----

--GDNU+dClHkpMN1cB--
