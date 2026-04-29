Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6B733E35B
	for <sashiko@lists.linux.dev>; Wed, 29 Apr 2026 14:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777473004; cv=none; b=LLEHBUiaG+Y1E04bWJEr2PwB/uQLrqb+lBWyiUvbyV9PwoS+teVcGBsmyw8KpCVrufftY7c1MefyjUEpaMxVDSzDoOclMLJUKPOQj9Gz+l7ZqdotmH2qDUjBnmQP3Z0a2AvffLLeRtzajssA0X2rJuKgJmEKI9yzf3ir/0Tqrxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777473004; c=relaxed/simple;
	bh=riqS/z9Pn0LjNjuMUBY3DEm9Hyd/pUt+MppfZOltlLA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UCXIIGK5wFHgbrV0N7PX4207dvHJZHPsU/MnpkSEiwaCERw0v80EnTGt9Yr/t258Y3JqAq3vDgOujEQFsTlafPaN82FdTM8PW+KX3BcHA7du4D/Zvxbgu2l4AVKzhFWOA2+2RVrbC+Vy4OM+nAVNnBM672rcCdDxb28my5NlxJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=dDvwFUne; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="dDvwFUne"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 15E63240027
	for <sashiko@lists.linux.dev>; Wed, 29 Apr 2026 16:29:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1777472999; bh=MofOoifl2K6AcqYpE2qC9ZHvwCK7pO5qvO7RMiM8j2E=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=dDvwFUnedhYuVwJoOmK5I16ccAKMThTbpc8DYSehzjnRGIalIjVpXLiVEgpraYJgx
	 plBEm70dYto7lnUdrXKq2y0z13nujiKwHOPZ8pw3nWekao7yz/0JrdQAlHWZzFLpk9
	 SDzYVHHa85cl8o0yZsO/mMimvwJrMksolSArMo4yIuX5W+8N2hUNKWitMgeXAtKpay
	 1EJsmD++takXxCJDHqGSIPLae4siPi3cMJzGe5EE26roUvKnhgHJpkXzrpAjCMxlHw
	 QMBbjw28keWEJM56r+pkQM3+pyF/oAAuSHBi5LfY0R0CqMEqKDGXxn1nFwDSfQsLpk
	 woCNyHJb3/Chg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4g5KT21llmz6tyH;
	Wed, 29 Apr 2026 16:29:58 +0200 (CEST)
Message-ID: <952d1be9979121f4868ec206ab1361b861d568e5.camel@posteo.de>
Subject: Re: [PATCH v14 2/3] rust: leds: add Mode trait
From: Markus Probst <markus.probst@posteo.de>
To: sashiko@lists.linux.dev
Cc: ojeda@kernel.org
Date: Wed, 29 Apr 2026 14:29:58 +0000
In-Reply-To: <20260427213034.E259DC19425@smtp.kernel.org>
References: <20260427-rust_leds-v14-2-4f4b17e5d516@posteo.de>
	 <20260427213034.E259DC19425@smtp.kernel.org>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-mG8kFdyAQVEeftad76/P"
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt


--=-mG8kFdyAQVEeftad76/P
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-04-27 at 21:30 +0000, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 1 potential issue(s):
> - [Low] The implementation `impl private::Sealed for Normal {}` in `rust/=
kernel/led/normal.rs` will fail to compile because the `private` module is =
not in scope.
> --
>=20
> commit 0a077c143ea17884a2c82d921e01b9d926d2e29a
> Author: Markus Probst <markus.probst@posteo.de>
>=20
> rust: leds: add Mode trait
>=20
> Add the led::Mode trait to allow for other types of led class devices
> in led::LedOps.
>=20
> > diff --git a/rust/kernel/led/normal.rs b/rust/kernel/led/normal.rs
> > index bd239f186c64..dda247145f25 100644
> > --- a/rust/kernel/led/normal.rs
> > +++ b/rust/kernel/led/normal.rs
> > @@ -6,11 +6,19 @@
> > =20
> >  use super::*;
> > =20
> > +/// The led mode for the `struct led_classdev`. Leds with this mode ca=
n only have a fixed color.
> > +pub enum Normal {}
> > +
> > +impl Mode for Normal {
> > +    type Device<T: LedOps<Mode =3D Self>> =3D Device<T>;
> > +}
> > +impl private::Sealed for Normal {}
>=20
> Will this fail to compile?
>=20
> In Rust, glob imports like use super::*; only bring public items into sco=
pe.
> Since mod private in rust/kernel/led.rs is a private module, it is not
> imported into the child module led/normal.rs.
>=20
> Using the unqualified path private::Sealed will cause a compilation error
> about an undeclared crate or module private.
>=20
> Will a similar compilation error happen in the subsequent commit for
> MultiColor in multicolor.rs?
It does compile.

--=-mG8kFdyAQVEeftad76/P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmnyFeUbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEDR2H/jnrUPSQ8EQALvAaTgS+8RcRQMSBrW5
z64gwM0cI28pVJhpCaRfCDuRGHVobQQS+1BvO7mUHXovTsitJfFtXhHJoGobYxlH
n7DSFhdd3CCOFy3DQHb6pI507pnfMgKqR6j/vv9/ndN+j7nZDn3q2wDzlBIaV54P
suXYk9llV0NWRHMXIdFjXmoMz5RWuwNwxsPJbg0a196IFu+Y0Exc7GLHq74oY82P
bHQlKPkhMVIpyqdDf6T5AH0BpOIqp3JVm/keZJTyDg28VdcQNkJcWyJxTOeq1MrS
udSpQEhdCv806GQoc5v8fuIMJoe2I6M4RStt5Ag8eje+Rn08bjZ2pF5KmxYHGA7g
pfKFFt8JFa2aDpF/AT+3yAyA/PTziM9IycIm5NM5gZQy1w91K/sZAXBxuipyDdNT
hcljx/rH8/FBD9zBNrMHEI4aSx5L0Ih0nwtaL3iScv0g3jujZx7tMEiJrbDmx8PK
v0z/7GMFVjPfRsIs8gTT4RiVfOW9nnkh+FhBDqMHvj2yTdV+IKwYare7PSFrQqpF
LIf9jlGGQYIglEgFqTyO8KBKjKey7/nDZ2XkMv8fLh4mhcpGwvzvjX0Oe/Iwwuss
ig97n+R6HiJP5A6ElryYlsnN4IMiVnZ88z5ROprOIOZxWqCd6zuLXMhC56AiQ6c4
KVpK1YTFU3XRBDSh3hqUfdSI
=8rUm
-----END PGP SIGNATURE-----

--=-mG8kFdyAQVEeftad76/P--
