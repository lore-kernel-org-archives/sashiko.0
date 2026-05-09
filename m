Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7FE2147F9;
	Sat,  9 May 2026 15:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778341916; cv=none; b=pnOOdrQoAo/OWpgYXXpbWy40Ei31lvXyrjTzyRZJ6uKKHvO8TnPl54P2JkH9bW4vAFSV8wkdWTPLaKBHVW3+AHdLqNJxBlw0jmSROekQ+API0xveqYDOHnY0M/HurC5+dEPMOWikOAyfFGuTE7nP0y+MURP0lIgszJtZ0ywzwFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778341916; c=relaxed/simple;
	bh=zJjKKHTb4SrtLoHbaArm6GPOqqA4Ze5oIcY9LLBALRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMlAQZpeMT01JZq8PAIk4alq4PLSKTjInXsV1KTFP7FKdjEOh50xbLGTxk416XbKxoD3+leo5aoeH6fHvA/SMA/7S8iJtYMgcIYoNNqb+suI4khrVdQuN5xH66yWt2ch+Mjp4+qq0M7xWP9e0VY1IPJ6NLDK7NNFAiSrjMRKsUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RbT33PAp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RbT33PAp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E771CC2BCB2;
	Sat,  9 May 2026 15:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778341916;
	bh=zJjKKHTb4SrtLoHbaArm6GPOqqA4Ze5oIcY9LLBALRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RbT33PApIs5B0I+9kaRW3dfbAvw0hnBQRgXUrraiS4mz+tUNy6HGIhWEyoRojA3zu
	 3bT4Cx9OavPqdFxC3wnc4Ay8US/CPZ8zC97kHwQBCcH+VOSZmdfk1duP9vmB8vRc+5
	 bHiVO2ltNen1BvbHjQN8aAIVcGAbK6j12pi6/ULaXjMqpOQMT3RS6JQI0rxkzVQ76z
	 G8s4n6+CVb+oTUq0CoRHa8k09SZEtpjdfXKMQoRq8oId3LkiF3Hc7DMPBqKbZICKMb
	 s6W0/agg/bqzw0QwkGfbx07pGewZQfuabbjJxta2kkCTh8NmIGdiN1TtDO7bPT4cIn
	 YLTSAaLFZ5EaQ==
Date: Sat, 9 May 2026 16:51:52 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko@lists.linux.dev
Cc: Udaya Kiran Challa <challauday369@gmail.com>, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v2] dt-bindings: rtc: epson,rx6110: Convert to DT Schema
Message-ID: <20260509-undusted-impromptu-d10fa94834ea@spud>
References: <20260509095713.5818-1-challauday369@gmail.com>
 <20260509102703.33ED1C2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RAZUb+SGi9k0iY6l"
Content-Disposition: inline
In-Reply-To: <20260509102703.33ED1C2BCB2@smtp.kernel.org>


--RAZUb+SGi9k0iY6l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 09, 2026 at 10:27:02AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] The YAML binding omits a reference to the core RTC subsystem s=
chema (`rtc.yaml`).
> - [Medium] The strict requirement for SPI-specific properties was lost du=
ring the schema conversion.
> --
>=20
> commit 83ad9493a42cbad1f11db8ac3498c9be50a357d1
> Author: Udaya Kiran Challa <challauday369@gmail.com>
>=20
> dt-bindings: rtc: epson,rx6110: Convert to DT Schema
>=20
> This commit converts the Epson RX6110 Real Time Clock devicetree binding
> from the legacy text format to DT schema.
>=20
> > diff --git a/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml b/=
Documentation/devicetree/bindings/rtc/epson,rx6110.yaml
> > new file mode 100644
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml
> [ ... ]
> > +allOf:
> > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
>=20
> Should this also include a reference to rtc.yaml# in the allOf block?
> Without it, since unevaluatedProperties is false, won't valid standard RTC
> properties like start-year or aux-voltage-chargeable cause validation
> errors? This omission appears to introduce a functional regression by
> bypassing the standard nodename checks provided by the core schema.
>=20
> [ ... ]
> > +  spi-cpha: true
> > +  spi-cpol: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +unevaluatedProperties: false
>=20
> The legacy text binding listed spi-cs-high, spi-cpha, and spi-cpol as
> mandatory required properties when the device operates in SPI mode.

+ the fact that cpha/cpol are listed with : true, and spi-cs-high isn't
which is confusing IMO.

> Because they are omitted from the required list to support I2C mode, won't
> misconfigured SPI nodes missing these hardware configuration flags now
> silently pass validation? Would adding a conditional allOf/if block be
> appropriate to enforce these properties for SPI configurations and avoid
> this regression?

Don't do this, since it requires knowing what the parent node is.
If anything, make it something like
if: oneOf: <> then: allOf: <>

--RAZUb+SGi9k0iY6l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaf9YEgAKCRB4tDGHoIJi
0unrAPwMiCoAkQF0fT3m/O/baC8hdg3ydWz0NlslfeO/Mk/2lwD/dhaZ26m1AtRG
S+PkxUC7bQNeI3E0OsPcVINdThq2Wgs=
=NAap
-----END PGP SIGNATURE-----

--RAZUb+SGi9k0iY6l--
