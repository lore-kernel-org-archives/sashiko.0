Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AE047ACF9;
	Sun, 18 Oct 2026 11:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792324486; cv=none; b=rHrDPQVBwb3DGvl/XuYgWpI2v0+TutlLT7n6aALKDQDdU8RVLTgynLQKFN2e8hKpeuXQL/r45J1JDIU7LRB9qBk/A8fwYs9lcDqQkdNdtqRzjY35WWX2AXqeS0toiGyBpZRR7v56XpnyhgOwQjvUB0zQlZgOcZ20tZesRBiYCgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792324486; c=relaxed/simple;
	bh=0OllDi3YSWEYqI1YEPSnIyHkptUV+I7N50kHa4d06pY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NGL53oHCUCzbDNq0WAhZkegjf/pF/rAlTwvfYrLkRGhpg8KWwmFqqhnkWXv1GkaAjqPOhJZrhoXqMCLk1m4xKAYwZZr4MuswD7fwtTMdAY9YEsefO1gA1ps0pYQ5YY4JTmrc+ezoUfoOpGZE6pufQ8Ay3+oe9a4PrsBuD0yaJvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k3IGgl3z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k3IGgl3z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A971F000C5;
	Sun, 18 Oct 2026 11:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792324485;
	bh=R49uizXK165zPUUAUQ5Gti7zBjQR4OmW9JuqZoi6gEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k3IGgl3zNYsN/VP/QTYQEdMsAAomwjoud/aOfVr1nO/JO4KzrgHAKGVmaqgaHsMis
	 jriDDyUfMa7MzdFXTFzbLRw1R/fQAVUTh3H8tAi2dh+T1D/T5sH8v77r3TwHq66n8V
	 7OmBntf6BJ7uYfArb05utHduLB+MSsvgwDvaKsgbzrFllx6WKSxQYstAnDogCSn59Q
	 6XVLCkAyWSXmgA3R+me27sEQFDUJ5Yb5WChG/EjEh06iUfVnIIWRv2Qmh7WjNNRsX3
	 eT3cpiJBJ0IbtNjq3s4U1Mddd3EiIMeHYkaDtNC96grtm20Enrt9ghzlHSFOCAdC4I
	 f0caprONIboYQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 401251C28A95; Sun, 18 Oct 2026 12:54:31 +0100 (BST)
Date: Sun, 18 Oct 2026 12:54:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jiri Kosina <jikos@kernel.org>, ksummit@lists.linux.dev,
	sashiko@lists.linux.dev
Subject: Re: Patch pre-submission to Sashiko
Message-ID: <atSzd4EdU4_B5eKr@sirena.org.uk>
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>
 <b8960b85-a381-4279-9c36-e5cad7a8d2d4@lunn.ch>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yRKuB7bgQYK5SvlC"
Content-Disposition: inline
In-Reply-To: <b8960b85-a381-4279-9c36-e5cad7a8d2d4@lunn.ch>
X-Cookie: Whoever dies with the most toys wins.


--yRKuB7bgQYK5SvlC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 09:42:34PM +0200, Andrew Lunn wrote:
> On Sat, Oct 17, 2026 at 07:28:48PM +0200, Jiri Kosina wrote:

> > I have just received a v1 to v11 patchset submission within roughly one=
=20
> > day timeframe.

> If they are iterating that fast, they either have automated tests, or
> the code is untested. I would ask them to includes the tests in the
> patchset, to become part of tools/testing/selftests.

There's some work (init paths for drivers for example) where it's
perfectly plausible that you can reverify things fast enough to be doing
that.  It's probably a relatively long day, but it's doable.  You're
more likely to hit numbers like that over a weekend though.

--yRKuB7bgQYK5SvlC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatSzdwAKCRAv73Ows9A4
icnyAQDktFcEAKhBMMukcBXDjC1e4gYzKzs82QhPkdThcF4eKwEAj+rMO32VTD9S
SlSn6FTsu09mRS0NU2hMvLFpHwsnMAs=
=Skiz
-----END PGP SIGNATURE-----

--yRKuB7bgQYK5SvlC--
