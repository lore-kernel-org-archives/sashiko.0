Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527253C278B
	for <sashiko@lists.linux.dev>; Fri, 24 Apr 2026 12:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777032709; cv=none; b=aVmMxqIkkMXIe6I+LQ5S2F3TuT9mb5r9YtMK0JwA/fQMaCo2v71TQRcc0MPOynsZNRDmroj/Jfj1f6jHKbdfXqbhypfx9hxJq7qu7se3OPk9/JmoiUEimfwMjVVQa0s8dg5Gq0bI6AE2BjLLGRAmv5Ps5W+RI05RlLi8DB+2S98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777032709; c=relaxed/simple;
	bh=H1Xu3zKY89TMSsOpK6Ebgx7PlkZVHmWf8eOHyxkrg2s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=POB+KvXaPPtAfdFTaJEUqjtwJTY9rGqiDvEQrd70Tg3/u7/zTMSnifLTTKJTE0Mzudcqg9MYeRjtEY0wT76yFlzZqPxW5OEISA810mJJb6UqeHMHzoKirzAO9T/S8Tx/w/rTw6ASjOmB6gPJhgauhS2CdqvBkQ+n9CYJZIDW2N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=H4HJ/F5D; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="H4HJ/F5D"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id DC1B7240101
	for <sashiko@lists.linux.dev>; Fri, 24 Apr 2026 14:11:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1777032702; bh=EKHZoi9C/109rsMiJOevzF0MnzkPV2PFiBDqecZ6RqU=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=H4HJ/F5Djl8WyK/frZL+U8uzKk2yUv7kbCDCFauyUFQ+1KCRXBOcXB5fwDrq+wIPH
	 MM5QHfQXa2pgC2UUzjLsb7KgJOR6jU98M2WJdGa1sAZj/kTcGpuSqgFaXS7wGt1tVp
	 Kq18GH0hVS/W3rJ0cxbp2MTOw1Yh8HpZ2Vm4E9z3MieXp/XkUfxQTGu6AN8YqbDnzc
	 xIDEvl85Di0+aidy+foIqWDktCoqgAMyUBIPiEiG4HCfWgThSX4sjmuybY+HJhGBdM
	 PrROS8bPmn9vfYeYF16VeAMj7XXS9HHDkrUd62K6eYKojmGi7gNdI+rc9xcR8dwrPj
	 EG165/XkwA/Qw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4g2Bdp1cP6z9rxF;
	Fri, 24 Apr 2026 14:11:42 +0200 (CEST)
Message-ID: <963486d61696e1f9f46e47b685a83e936aa05004.camel@posteo.de>
Subject: Re: [PATCH v9 1/2] dt-bindings: embedded-controller: Add synology
 microp devices
From: Markus Probst <markus.probst@posteo.de>
To: sashiko@lists.linux.dev
Cc: ojeda@kernel.org
Date: Fri, 24 Apr 2026 12:11:42 +0000
In-Reply-To: <20260423201251.7E7D4C2BCAF@smtp.kernel.org>
References: <20260423-synology_microp_initial-v9-1-4a8533f87e07@posteo.de>
	 <20260423201251.7E7D4C2BCAF@smtp.kernel.org>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-7a+w3c/76MLIC1M/HggS"
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt


--=-7a+w3c/76MLIC1M/HggS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-04-23 at 20:12 +0000, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 1 potential issue(s):
> - [Low] Unused `#include <dt-bindings/leds/common.h>` in the device tree =
example snippet.
> --
>=20
> commit 64a5fa0da12674dff6fa2aa515d134709ad0a024
> Author: Markus Probst <markus.probst@posteo.de>
>=20
> dt-bindings: embedded-controller: Add synology microp devices
>=20
> This commit adds the devicetree bindings for the Synology Microp
> microcontroller found on Synology NAS devices. The device is connected
> over a serial port and provides functionality for fans, LEDs, beepers,
> buttons, and system power management.
>=20
> > diff --git a/Documentation/devicetree/bindings/embedded-controller/syno=
logy,ds918p-microp.yaml b/Documentation/devicetree/bindings/embedded-contro=
ller/synology,ds918p-microp.yaml
> > new file mode 100644
> > index 0000000000000..b87034691885d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/embedded-controller/synology,ds=
918p-microp.yaml
>=20
> [ ... ]
>=20
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/leds/common.h>
>=20
> This isn't a bug, but is this include needed here?
>=20
> Neither the example nor the schema defines or uses any LED-related macros=
,
> properties, or child nodes. It appears the driver handles LED configurati=
ons
> internally based on the compatible string rather than parsing them from t=
he
> device tree, which leaves this include unused.
Will be removed in next revision.

Thanks
- Markus Probst

>=20
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    embedded-controller {
> > +      compatible =3D "synology,ds923p-microp", "synology,ds918p-microp=
";
> > +
> > +      fan-failure-gpios =3D <&gpio 68 GPIO_ACTIVE_HIGH>, <&gpio 69 GPI=
O_ACTIVE_HIGH>;
> > +    };

--=-7a+w3c/76MLIC1M/HggS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmnrXf0bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEDR2H/jnrUPSNBsP/Az2PiULce0afYB8XatU
4nzlHOCmgWZbyV93QXG0tqaJ0i9tDf6w6QHcynJQfABvKW2BRxZ0qlrVI6swx0IL
RehnIGqo0BZNs/4cnYyVsBQxacTYq3KCwW/JreH10FQwx/m/yaiDgIguJZ29pmx6
exxGe2yCBDR1LMhkPHb3WPgctfcSS6a47BpV1PNI4+XOQL/6rv37w9VBbbzKp3nF
9xfo3jAwBSXf2S7AusX+eZPA8TWdf6ZB4h9ExjSXLLZ263F8zle4kmfX5LOQ5AFW
D6mXinuR/JAj2bo2mXXZRdJzVIhUrGiaptXONMLEsGmYlY5FIZr+g5ajKOsvp85R
QZnU4KvetvwATP2a28gMT+hSDpbydI8EImmbgjHyA80pDN2IVbgUxUjhyFyosTN3
woR4CbW3CakGYmYi1C2gxb5kUN+o753Di4lYu8wuhqgZb3hAsLCKWcrMIbDBRNHr
R9k7hl4DN4NMWm81tv0dF/wOtyPV4KDKLXLDCvO8EF2KwMElvqf6LT8sI6wn9WgI
vOPrkhff0M35st4n7HTC9arqAuVWZLXEnDrxE9Jd5N3kAvE1Kbo1Qf9/aO/Rg9wI
cOICuM8ltfcr/xA4TyqAEWE0+s06sgyUUxd/uxdTaAgZorCdTZMjWnXDcRAN3A8D
gK+pd1vkpBI395+Rxge7wcxW
=c9x4
-----END PGP SIGNATURE-----

--=-7a+w3c/76MLIC1M/HggS--
