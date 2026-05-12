Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943192C1788;
	Tue, 12 May 2026 16:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778604285; cv=none; b=JBr1lFAF/lGM63PR+GrUcJ6YHrRUMXvCuIXWLsSg2kGudnHYh2dCWoOFG7ISe7HmBT/9XJ+lHlXcsGg9uvLOVMBd10xVQMJQ83oyCkVg23Wa9Aju2HF57HawooPUqMtE8RnWuJ4D6aRB5/uDpO4p2S7Dahe4ggVrVdOtLimloIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778604285; c=relaxed/simple;
	bh=qBe780EEoSq3WZerOuuNcvFvJd92SdQMTIiqjoeOExI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lK0DUei5GPL7x3pRZN9WzrtajoNKZIjLhlS+0i0HBLdQm7GhzN+meKe+4rvN1Ynnm6HuH2pS8YsARJ7lRpXdZtELPNQ9fUZ29U5g9uREfwVO1RdSSNEvqnYzbtrW5JAB1HCjxq6jhkxMhe2UT5nt+0A3nJhePikOtvssqKINl7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oeqpcs+R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oeqpcs+R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C487C2BCB0;
	Tue, 12 May 2026 16:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778604285;
	bh=qBe780EEoSq3WZerOuuNcvFvJd92SdQMTIiqjoeOExI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oeqpcs+R8iZWKIGzlAcstWBARRoWir7QtKFUuyKk+V2A0pGr8ZActyrvOgr9sU5cB
	 C6OjnBdxr4nG9VSXnHX1G19T9sUXUPzzgp8d27QxxxiWFNW9SqeNXvecxnNkCBISRQ
	 HiJ+cI6GPDQY/OeW/BCrb8BIg4SARBjSDZLp8gBRlHwmth2u+KYhHQQCI2UpX9gT73
	 kTzY1i2jGrRMOp05AYDq9AfAlEApNha9ljolv7w8VpZXZ4kYdk8hfqZGrrHuGzBHcC
	 oIXcg3t0fYnd4q0oI9LEswgCR7kk5K9NFWkcsuh7jk/2wruakbNpN69FGY+2mW2wMr
	 XEiISkaML9N5w==
Date: Tue, 12 May 2026 17:44:41 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko@lists.linux.dev
Cc: Jisheng Zhang <jszhang@kernel.org>, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: i3c: dw: Add apb reset
Message-ID: <20260512-curvy-ashes-bde0e8e8d473@spud>
References: <20260511031945.3228-3-jszhang@kernel.org>
 <20260511230001.1B220C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DryAQInIECRvEhk7"
Content-Disposition: inline
In-Reply-To: <20260511230001.1B220C2BCB0@smtp.kernel.org>


--DryAQInIECRvEhk7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 11:00:00PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Adding a second item to the `resets` and `reset-names` list wi=
thout specifying `minItems: 1` makes both resets strictly required whenever=
 the property is present, breaking DT schema backward compatibility.
> --
>=20
> commit 0c4b11b6e45b719eb15a1a87171391a4bfb310b9
> Author: Jisheng Zhang <jszhang@kernel.org>
>=20
> dt-bindings: i3c: dw: Add apb reset
>=20
> This commit updates the DesignWare I3C master binding to support an
> optional APB interface reset signal.
>=20
> > diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.y=
aml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> > index 613dce7757bc3..2575442b28ff4 100644
> > --- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> > +++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> > @@ -38,10 +38,12 @@ properties:
> >    resets:
> >      items:
> >        - description: Reset signal
> > +      - description: APB interface reset signal
>=20
> Does adding this second item inadvertently make the APB reset strictly
> mandatory for validation? In dt-schema, when items are defined as a list,
> minItems implicitly defaults to the length of that list. Without an
> explicit minItems: 1 constraint, device trees defining only the single
> core_rst reset might fail schema validation.
>=20
> > =20
> >    reset-names:
> >      items:
> >        - const: core_rst
> > +      - const: apb_rst
>=20
> Should minItems: 1 be added to both the resets and reset-names properties
> to maintain backward compatibility?=20
>=20
> Since the driver gracefully handles a missing apb_rst by using
> devm_reset_control_get_optional_exclusive_deasserted(), adding the minIte=
ms
> constraint would keep single-reset configurations perfectly valid.

Obviously this is all crap and can be ignored, since the other reset is
added in the series.

--DryAQInIECRvEhk7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagNY+QAKCRB4tDGHoIJi
0ikJAQC7LIxijJWf+xlPboDCs5YDj39wv60+tEqfC2s3l3kC6wD/TXs6yuBmbGkH
S+dgxRcbFt05dFBbleuaebnfXJckbA8=
=vDjU
-----END PGP SIGNATURE-----

--DryAQInIECRvEhk7--
