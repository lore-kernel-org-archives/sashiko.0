Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F80B3101C8;
	Mon, 11 May 2026 07:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778482967; cv=none; b=sufICq+WxsYIxb0WB1io6qpfhJ1vfnA1AZKyoeaB+3bTYphXuVIqY7DHQto7Q9rdFmg/4hhoN9o8I5pugEMp742Mlr2tGI1oiZhd2kNNoYb3kWStKBk1Sf+GcQUEh42f0FTgPeBLv2AkESG0zFEvVx5LUX/fsxZBfZsQZEW9cTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778482967; c=relaxed/simple;
	bh=aalilyopaoHLhz7HYdUDa8mJmjbUsfs76tdqWE+bA1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2ONDdMqQXsoGj0BiNmJJANKZl+UNQz4/kc8ddLH2HAssfDx8XYvbH0W0977XdBIZ0dTmew1JvZER/WyYs/GEAxUNx3klvM+E0LMxnFhDeAGqlzPMvr01s8ZW9p6a5LIrDP0RyyEdhv7HsOcu2LONxSozIEmDckU6SBFPvRqiqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jDQiOyQp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jDQiOyQp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9E4C2BCB0;
	Mon, 11 May 2026 07:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778482967;
	bh=aalilyopaoHLhz7HYdUDa8mJmjbUsfs76tdqWE+bA1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jDQiOyQp4uOC78v7ySz4YgJg3cRZqaXIuiFhXReBKQEOEeT5CBQX08B1b0hgHKRi4
	 QJL7tFARgtsX032BZHH3kVS1Fdm1T8LYkQfqnmGUSgmxrLt+EqR8Azl8rpDs3x0XWB
	 SCu8TD1Rds2w1CiQCSizHx7nayxX1b4MgTkT9ixzHMin1gC+BJebbVbbyu9OPhCC5w
	 JjB8Gnx7k+JeTYjaY3irJ7VzbFkoHg5i5U6lHh3hNIQURwomA9phYlaM5XaGw13wOl
	 3ZeJ45JDE86BDmme+Cgvqzs3lJh2koR+Y4IalNOmL5ZDa7iNww5k4fsS/iKa1wkxXo
	 ZITPZrMmFhw9A==
Date: Mon, 11 May 2026 09:02:44 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sashiko@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v5 11/12] net: airoha: Support multiple LAN/WAN
 interfaces for hw MAC address configuration
Message-ID: <agF_FJBKBpmHHoVA@lore-desk>
References: <20260509-airoha-eth-multi-serdes-v5-11-805e38edc2aa@kernel.org>
 <20260510140505.F219FC2BCF6@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZlIWd/tj4LYu8Qia"
Content-Disposition: inline
In-Reply-To: <20260510140505.F219FC2BCF6@smtp.kernel.org>


--ZlIWd/tj4LYu8Qia
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Probe fails completely when devices use randomly generated MAC a=
ddresses due to strict MSB validation.
> - [Medium] Strict MAC address MSB validation creates a configuration dead=
lock, preventing users from modifying MAC addresses.
> --
>=20
> commit d9f17b062a5dbe5adb3be07d9c3f501106b25dd8
> Author: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> net: airoha: Support multiple LAN/WAN interfaces for hw MAC address confi=
guration
>=20
> This commit extends the hardware MAC address configuration in the airoha
> Ethernet driver to support multiple LAN or WAN interfaces. It calculates
> the minimum and maximum lower MAC address bytes across all devices with t=
he
> same configuration, and enforces that they share the same upper 3 MAC
> address bytes.
>=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index fa37dbd76d579..623cac42dfb71 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> [ ... ]
> > -static void airoha_set_macaddr(struct airoha_gdm_dev *dev, const u8 *a=
ddr)
> > +static int airoha_set_macaddr(struct airoha_gdm_dev *dev, const u8 *ad=
dr)
> >  {
> >  	struct airoha_eth *eth =3D dev->eth;
> > -	u32 val, reg;
> > +	u8 ref_addr[ETH_ALEN] =3D {};
> > +	u32 reg, val, lmin, lmax;
> > +	int i;
> > +
> > +	lmin =3D (addr[3] << 16) | (addr[4] << 8) | addr[5];
> > +	lmax =3D lmin;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(eth->ports); i++) {
> [ ... ]
> > +			ether_addr_copy(ref_addr, netdev->dev_addr);
> > +			val =3D (netdev->dev_addr[3] << 16) |
> > +			      (netdev->dev_addr[4] << 8) | netdev->dev_addr[5];
> > +			if (val < lmin)
> > +				lmin =3D val;
> > +			if (val > lmax)
> > +				lmax =3D val;
> > +		}
> > +	}
> > +
> > +	if (!is_zero_ether_addr(ref_addr) && memcmp(ref_addr, addr, 3)) {
> > +		/* According to the HW design, hw mac address MS bits
> > +		 * must be the same for each net_device with the same
> > +		 * LAN/WAN configuration.
> > +		 */
> > +		return -EINVAL;
> > +	}
>=20
> Does this strict MSB validation cause device initialization to fail if the
> device tree does not provide MAC addresses?
>=20
> If the driver falls back to assigning addresses via eth_hw_addr_random(),
> the randomly generated addresses will almost certainly have different upp=
er
> 3 bytes. Will this cause airoha_set_macaddr() to return -EINVAL for the
> second interface, aborting initialization and failing the driver probe?
>=20
> Could this also create a configuration deadlock when users try to change
> MAC addresses from userspace?
>=20
> Since tools like 'ip link' configure interfaces sequentially, attempting =
to
> change eth0 to a new OUI would be rejected because its new MSBs won't mat=
ch
> eth1's current MSBs. Attempting to change eth1 first would similarly fail
> against eth0. Is there a way for users to successfully change the MAC
> address MSBs once the interfaces are initialized?

This is a requirement imposed by the hw design. If two (or multiple) interf=
aces
are configured as LAN (or WAN), they will need to share the mac address MSB=
s.
This requirement is not needed if the interfaces are running with different
configuration (e.g. eth0 LAN and eth1 WAN).

Regards,
Lorenzo

>=20
> [ ... ]
>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260509-airoha-eth-=
multi-serdes-v5-0-805e38edc2aa@kernel.org?part=3D11

--ZlIWd/tj4LYu8Qia
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCagF/FAAKCRA6cBh0uS2t
rDUAAQC42MjVeAQpBqx1CV5rx//gp30sR3/PT6pWl/C/wkhoEQEA5zUzxnW/i/E8
KPG2R49/1yawnEp+dMqpLYqs9pFzYAs=
=xF6L
-----END PGP SIGNATURE-----

--ZlIWd/tj4LYu8Qia--
