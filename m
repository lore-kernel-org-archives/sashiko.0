Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670728;
	b=dgzcUkikTWnf5MoK/7bA9MlBABuJz8o20IqOfXV49FLtRIvVD+tgAbBSwiojE9cJuwCC
	 dXKKAvl/gmDj8fJ44R6iXJGMWF/gUeBAwiYhunIyCGbpRh12bhadEEwFKWYeD65/pVTIf
	 PIIwzWs1IZty1BS/PdluFphVRK5rB+42cBWoZsjbx9av8Oe+h+q+5kDOQ+Tm3fIBS60E3
	 Bj+EedjZ3j5l2kBRl2HH4ez3TtUzT4V9L9Qc+rCSuXF1icxBTx/J1Z9NJfVK7lMeex3MG
	 x5ZdUda3ew6rHSPiOfQJcdpjz6Twg06VKIPYb/stAvZXfnjiN0yisfg7PB7DxnB1qMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670728;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=ZVsC3Ix+e3aFesX0EOxrePQ/QkfxM4/UQQT1LTFST3o=;
	b=ITrcJwLuhXi7KgZfGrVSwG4eN3LzmHbq4flu6/O3OajWEfKdbRq4FmNqe3dNL21QRM3H
	 EBLY0h7RrU4FMpVTvUj/KObJbfYG3b01U51apAvDm1V15m7G+9u0ILTqUvRAuDQUtgarD
	 suTs3vnMcPfg0JsSVt0S1UfdGEYZpMYD5OrUrXCi18zR08PGGH9f8pbzbfuDEeUxty1AS
	 +QCqept3Lad4n31Y9ZgVvTkMmQkQPgxo58fvQfwkIR8xDf4awjqs3q2h1+3JJChsiglEC
	 Mxdzrj5a6+BJQRc2kxi5nVoqhhdjDMQbKO0y6oFsMGfhsI/4x1rnY+MN5GFXpfipHsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SrLk+no5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82953606A31A;
	Thu, 22 Oct 2026 12:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SrLk+no5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BEA61F000C3;
	Thu, 22 Oct 2026 12:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792670728;
	bh=ZVsC3Ix+e3aFesX0EOxrePQ/QkfxM4/UQQT1LTFST3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SrLk+no5qsD+63eftEyb6xn9jcZ4Yxj80tuTmkdG32YWRuJROkDb+yTaohNSRdUOV
	 dlqrj8vc01dPoW+wgK3uEO3xNP0qayZ4CiB6qhf+z4/llzi+GUhOSluEafPMT8egNw
	 KAqDLueT/nQZSMepeS0x7z5enNAgq10Uz4T0b2OLqsUp4nzFFIq4UTblAh7JUFiI+e
	 fep+m+XiOKGOOODlb1Ra/bbxbSvQ/7AiFMPgXoTTbkAEjgeNIpA54peKR4vWjUcHYV
	 Hs6GMQFvVsWwIfZOSIm5JsZseo1YWYboQJ1mlIe8G0WsqkFIbNhn8wqr3JFmkrkCZU
	 4SVAPc8CeIvwg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id C1CDE1AC5994; Thu, 22 Oct 2026 13:05:25 +0100 (BST)
Date: Thu, 22 Oct 2026 13:05:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Theodore Tso <tytso@mit.edu>, Shuah Khan <skhan@linuxfoundation.org>,
	Bart Van Assche <bvanassche@acm.org>,
	johannes.goede@oss.qualcomm.com, Jiri Kosina <jikos@kernel.org>,
	ksummit@lists.linux.dev, sashiko@lists.linux.dev
Subject: Re: Patch pre-submission to Sashiko
Message-ID: <atn8Bcgvj9RGGTL3@sirena.co.uk>
References: <atO3pCuUxI950ftN@mit.edu>
 <3354ebda-5158-489b-a577-5cb10e5d5fb0@oss.qualcomm.com>
 <atZ4J86j7CXF82HX@mit.edu>
 <2fef166e-088d-4ffe-8d0a-0143aebc1b26@acm.org>
 <ate8oESqneK-3sQJ@mit.edu>
 <7e473af8-2f7a-4a36-a926-e756873c9c52@linuxfoundation.org>
 <atic3bbDeyJI6MJs@sirena.co.uk>
 <atjlUoEmTagZjrYI@mit.edu>
 <atjpS__OwjZ-Q_Fh@sirena.org.uk>
 <20261021114524.4c2ea2a31a9d527b78e78768@linux-foundation.org>
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3+6KYHCfrLxfgx0S"
Content-Disposition: inline
In-Reply-To: <20261021114524.4c2ea2a31a9d527b78e78768@linux-foundation.org>
X-Cookie: FEELINGS are cascading over me!!!


--3+6KYHCfrLxfgx0S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 11:45:24AM -0700, Andrew Morton wrote:

> If someone's fixing something I don't see much value in
> retaining/maintaining a test case for something we've already fixed.=20
> This is considered good engineering practice but why bother - we fixed
> it!  Move on.

Like others have said there's a bunch of people would say the opposite.
In the particular case I referenced where the code is generally pretty
fragile (we have rather a lot of paths through that code) and we want to
do a bunch of refactoring in the area it seems especially useful to keep
the coverage.  It's far too likely that someone could make a mistake in
this area, and quite likely that someone would want to do relevant work.

--3+6KYHCfrLxfgx0S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatn8AwAKCRAv73Ows9A4
iXNYAQCXm/LDeHEC10wmZdoBTrq4EdOF+DGTsbrTEjTeD7pZHgEAoxW0gPaheVn4
bMDJeVjzdbPaUI/tI9MXcMMiL6hHPQ0=
=DLpx
-----END PGP SIGNATURE-----

--3+6KYHCfrLxfgx0S--
