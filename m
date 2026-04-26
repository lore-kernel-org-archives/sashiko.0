Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9076D36403C
	for <sashiko@lists.linux.dev>; Sun, 26 Apr 2026 13:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777211099; cv=none; b=jv/xMXmPE9GNRBzvLhmlnKO73bCvsQQvH8br+RmV/KElLATYzqrnVvs/hciph/tF9Xad5k4kcXpIMkDpwop7CKk1cX57H1fWfk74xlAMLS8FSVvfoOcUjejyyAhAmkCO4Bp/7Y0zwFxNcTCt9XpWIXqH6S7iKyotkEuKX4yVLxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777211099; c=relaxed/simple;
	bh=cADBnB0HkhKRCFnIgNi/uhBtkc/A6Yp01isOUQOn++M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m0apeSHRyz7UCnIalQlHOHY1bjwsD/FTMk7z+eWr0NqvMhWCWaWW7sD0PFjSv88kExKbviCXc0kh0KPAjqi+hUP3FlhigcCzzNeXquqDQ5w9CMCVum59TeYvhoOyeraa0yimmxfti4tT1ABjQcpEpTpRZQSeUy6/tA0G2dxwfoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=gr0t3lDJ; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="gr0t3lDJ"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 839A7240101
	for <sashiko@lists.linux.dev>; Sun, 26 Apr 2026 15:44:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1777211090; bh=cADBnB0HkhKRCFnIgNi/uhBtkc/A6Yp01isOUQOn++M=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=gr0t3lDJ5/pJJxfvbw3OI3+vhRF04bzkGaWsvy4EEo4Yg8XzsSYl8KMgKew+gc6+O
	 yN3J0FtYiZ1LTbdOxBE62sO+C90kV1b4xRe5Wn8/aY+JiE7fU5g7Nz/SF9crypEvNb
	 m3/qyvTqKABIChHM9JSkw/AeVXfQnilKY3cbnPC8pvJiYbSfRoRi+1hHFm8qlqAuZJ
	 4bBhRy6v64h4Z7clkAgqrQW6lWwKqul3P+d+ZpKMyTxu/LNmQSJeZxjt+x5VFMEiUo
	 QGmwWnpH8nOvE/p7SJpwOUy1azRm63MSASf3iw3/Wx+MHOUmgi4ZJU7WmB/cd9Vk7S
	 M+AtBzrh3uXLA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4g3ScK52mWz9rxF;
	Sun, 26 Apr 2026 15:44:49 +0200 (CEST)
Message-ID: <ffc3c129b69992bc7be91ad56d5b3a13d760ea95.camel@posteo.de>
Subject: Re: [PATCH v9 2/2] platform: Add initial synology microp driver
From: Markus Probst <markus.probst@posteo.de>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: sashiko@lists.linux.dev, ojeda@kernel.org
Date: Sun, 26 Apr 2026 13:44:50 +0000
In-Reply-To: <CANiq72mHAByf1E--Tqt1hbDQe2i4xtD0g_q4osX1ucGARTCkKw@mail.gmail.com>
References: <20260423-synology_microp_initial-v9-2-4a8533f87e07@posteo.de>
	 <20260423215810.3516CC2BCB2@smtp.kernel.org>
	 <9c4cd34c8ba47f1cb432dff521382c0dc4717476.camel@posteo.de>
	 <CANiq72mHAByf1E--Tqt1hbDQe2i4xtD0g_q4osX1ucGARTCkKw@mail.gmail.com>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=mQINBGiDvXgBEADAXUceKafpl46S35UmDh2wRvvx+UfZbcTjeQOlSwKP7YVJ4JOZrVs93
 qReNLkOWguIqPBxR9blQ4nyYrqSCV+MMw/3ifyXIm6Pw2YRUDg+WTEOjTixRCoWDgUj1nOsvJ9tVA
 m76Ww+/pAnepVRafMID0rqEfD9oGv1YrfpeFJhyE2zUw3SyyNLIKWD6QeLRhKQRbSnsXhGLFBXCqt
 9k5JARhgQof9zvztcCVlT5KVvuyfC4H+HzeGmu9201BVyihJwKdcKPq+n/aY5FUVxNTgtI9f8wIbm
 fAjaoT1pjXSp+dszakA98fhONM98pOq723o/1ZGMZukyXFfsDGtA3BB79HoopHKujLGWAGskzClwT
 jRQxBqxh/U/lL1pc+0xPWikTNCmtziCOvv0KA0arDOMQlyFvImzX6oGVgE4ksKQYbMZ3Ikw6L1Rv1
 J+FvN0aNwOKgL2ztBRYscUGcQvA0Zo1fGCAn/BLEJvQYShWKeKqjyncVGoXFsz2AcuFKe1pwETSsN
 6OZncjy32e4ktgs07cWBfx0v62b8md36jau+B6RVnnodaA8++oXl3FRwiEW8XfXWIjy4umIv93tb8
 8ekYsfOfWkTSewZYXGoqe4RtK80ulMHb/dh2FZQIFyRdN4HOmB4FYO5sEYFr9YjHLmDkrUgNodJCX
 CeMe4BO4iaxUQARAQABtCdNYXJrdXMgUHJvYnN0IDxtYXJrdXMucHJvYnN0QHBvc3Rlby5kZT6JAl
 QEEwEIAD4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQSCdBjE9KxY53IwxHM0dh/4561
 D0gUCaIZ9HQIZAQAKCRA0dh/4561D0pKmD/92zsCfbD+SrvBpNWtbit7J9wFBNr9qSFFm2n/65qen
 NNWKDrCzDsjRbALMHSO8nigMWzjofbVjj8Nf7SDcdapRjrMCnidS0DuW3pZBo6W0sZqV/fLx+AzgQ
 7PAr6jtBbUoKW/GCGHLLtb6Hv+zjL17KGVO0DdQeoHEXMa48mJh8rS7VlUzVtpbxsWbb1wRZJTD88
 ALDOLTWGqMbCTFDKFfGcqBLdUT13vx706Q29wrDiogmQhLGYKc6fQzpHhCLNhHTl8ZVLuKVY3wTT+
 f9TzW1BDzFTAe3ZXsKhrzF+ud7vr6ff9p1Zl+Nujz94EDYHi/5Yrtp//+N/ZjDGDmqZOEA86/Gybu
 6XE/v4S85ls0cAe37WTqsMCJjVRMP52r7Y1AuOONJDe3sIsDge++XFhwfGPbZwBnwd4gEVcdrKhnO
 ntuP9TvBMFWeTvtLqlWJUt7n8f/ELCcGoO5acai1iZ59GC81GLl2izObOLNjyv3G6hia/w50Mw9MU
 dAdZQ2MxM6k+x4L5XeysdcR/2AydVLtu2LGFOrKyEe0M9XmlE6OvziWXvVVwomvTN3LaNUmaINhr7
 pHTFwDiZCSWKnwnvD2+jA1trKq1xKUQY1uGW9XgSj98pKyixHWoeEpydr+alSTB43c3m0351/9rYT
 TTi4KSk73wtapPKtaoIR3rOFHLQXbWFya3VzLnByb2JzdEBwb3N0ZW8uZGWJAlEEEwEIADsWIQSCd
 BjE9KxY53IwxHM0dh/4561D0gUCaIO9eAIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCR
 A0dh/4561D0oHZEACEmk5Ng9+OXoVxJJ+c9slBI2lYxyBO84qkWjoJ/0GpwoHk1IpyL+i+kF1Bb7y
 Hx9Tiz8ENYX7xIPTZzS8hXs1ksuo76FQUyD6onA/69xZIrYZ0NSA5HUo62qzzMSZL7od5e12R6OPR
 lR0PIuc4ecOGCEq3BLRPfZSYrL54tiase8HubXsvb6EBQ8jPI8ZUlr96ZqFEwrQZF/3ihyV6LILLk
 geExgwlTzo5Wv3piOXPTITBuzuFhBJqEnT25q2j8OumGQ+ri8oVeAzx24g1kc11pwpR0sowfa5MvZ
 WrrBcaIL7uJfR/ig7FyGnTQ1nS3btf3p0v8A3fc4eUu/K2No3l2huJp3+LHhCmpmeykOhSB63Mj3s
 3Q87LD0HE0HBkTEMwp+sD97ZRpO67H5shzJRanUaDTb/mREfzpJmRT1uuec0X2zItL7a6itgMJvYI
 KG29aJLX3fTzzVzFGPgzVZYEdhu4y53p0qEGrrC1JtKR6DRPE1hb/OdWOkjmJ75+PPLD9U5IuRd6y
 sHJWsEBR1F0wkMPkEofWsvMYJzWXx/rvTWO8N4D6HigTgBXAXNgbc3IHpHlkvKoBJptv6DRVRtIrz
 0G0cfBY0Sm7he4N2IYDWWdGnPBZ3rlLSdj5EiBU2YWgIgtLrb8ZNJ3ZlhYluGnBJDGRqy2jC9s1jY
 66sLA9rQZMHhJTzMyIDwweGlvMzJAcG9zdGVvLmV1PokCbQQTAQgAVxYhBIJ0GMT0rFjncjDEczR2
 H/jnrUPSBQJpa71VGxSAAAAAAAQADm1hbnUyLDIuNSsxLjExLDIsMgIbAwULCQgHAgIiAgYVCgkIC
 wIEFgIDAQIeBwIXgAAKCRA0dh/4561D0gKJD/9uOQKYlsDoQX65Gd0LiMT0C+5vXgr3VI0PHDOwcv
 51fJ3A1vNyPZRFPGrz8+mDEXUQOF/INfnz5Tu1QHwf+iYcWcTGAN/FHgVR6ET6VBNU2hJaKhu+Ggo
 kjYyJTOvyX+3yNRUfSny0GjTjIPuPTErjqmHF+BtjXslpgwqnNMznf3lRIuUjRORupos6p3k1DndE
 5vzUTmXSvMyXyOD2KhBl/kL76k0bHYyAQytZPag12pltrtFbA/r2phDGN2si8PooDT99bSTJjaM45
 MTAAHbHKJfvgfK41bNFD5mMtpWpL195XRtS0Nrxdg3PaYBxN5gtTG0RyZfpYRlkdEhm+jj/8RxuSG
 i/qdhRdbiI7K2IELWeQVHSNDi9JabR/UzlR4NSnhfAjRIVlRM+eFbUl8XwxwVrAkojF5IraH2qRvg
 VCmuFsHUW07FUlrDrzpjXsD73cKppoFGDCdDR0BHJepXbFLS9+AqkT+guRJlnCTg2p+TQtnbwPgKp
 Vj98JixovCl99zRYTsL2bRNU5+q8iET65VMJ1ydyNanvLd5vI/NqDkXhlXLsGmdaDTtu4R21PkToX
 dQNGrZ91M9nlIBKw8Y7c7xZ4098qX2b8JX/CxD+gC1r4C8vuA3GkhFLx+KlkON7LyiJPkrePp6Qky
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-7d5JEk9oHxhxHHUBGVnx"
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt


--=-7d5JEk9oHxhxHHUBGVnx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2026-04-26 at 15:37 +0200, Miguel Ojeda wrote:
> On Fri, Apr 24, 2026 at 1:59=E2=80=AFPM Markus Probst <markus.probst@post=
eo.de> wrote:
> >=20
> > Since this is an AI reply, I am not sure if I am supposed to reply to
> > it. Anyway, the answers:
>=20
> Up to you -- some people is just fixing the patch and providing a
> changelog in the next version. But it is great that you are taking a
> look at the report! I hope it is at least somewhat useful.
>=20
> We may eventually just send them to the mailing list like other lists
> in the kernel are doing (in which case replying may be more useful),
> or we may disable Sashiko completely if it is not worth our time. We
> are trying to see how people feel about it.
It would be an improvement if the bot had previous replies as context.
So If I reply that the found potential issue is a false positive, that
it won't appear in the next patch revision review again.

>=20
> From what I see here, there were at least 2 non-trivial true positive, ri=
ght?
Yes.

Thanks
- Markus Probst

>=20
> Thanks!
>=20
> Cheers,
> Miguel

--=-7d5JEk9oHxhxHHUBGVnx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmnuFtAbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEDR2H/jnrUPShqYQAIqqr0zykJYf2q/v1ZUH
5wgLEpRRtYZaj4yCtICR+ekO6ClbawPrVmGK1mPYC6SxyWVIffKGBnTJh1EZiz8Y
VrL6QmKjGboa8+PxXj/AQyNwkZYizE6zQ3PWBJu7Z4bgANML12d240hKhUqnnXzk
RkEVH88p0Bh7mOZkiqcBbbsONMRWyIhzpJwsV8oZAWzYULOSUBhtK3F0GsZKxl0m
RlTbPsilza0yPligRXWXtLAJaCb/jcLEBAAzb4uiYAG94dT92AnmcGILlwVx/ftH
Eg6BnU2BopFRMPPquIIv7gnyG6tkgIInlz4Mre0HzwCRoLsnyw8+KnLoEbUXEr1I
Q4MSvb8T8qYwN50yTbLsrM+glNs2VPBdujVKG18v75ZadZRLSwcdlk6FnFGUP9vj
2S0x+bQwJ/VKwYySdaFTJe/HUnDC/oa2sjSArVDHh0FcIZqT+P5tra3B4gId40pO
BuMIsNHsVuUkeTtFfbqLzkLhtK3oIRVWb8fEAt+xY7aUHvIpleNW4hGd2/oJ4IBf
tr6HrsQKEmR5b6NMr/S7/1Qr1hs585J6s8i064qKaqJ42JqYeizRgd6OrM4KnHk8
1QxxB9btQJu1YOAxx55ScoQ3JmoRfAR0YVZRSr0VJTTeACP5fd+DJW0famrHIrQE
eh5X0qOBErU4VUAHf5NKw0CC
=tz8t
-----END PGP SIGNATURE-----

--=-7d5JEk9oHxhxHHUBGVnx--
