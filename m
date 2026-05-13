Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4CF3ED11F;
	Wed, 13 May 2026 09:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778665435; cv=none; b=bUWqdgLi2v1u3clqCnH6kyENEvwwijVfFUa+B3EViYAvOf3w2ICsuvf0cfiZ3Aa/NS1Pyymy5KUIZ+7CWVyBl8kpXJMGuEL5PWfqlwsx+rgZjnjyJGL5ozS7O8Zlc4ZSdc0V4F3JhDknkTGgA2GwS+ht4cwWCOgdy2YbQHjaRYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778665435; c=relaxed/simple;
	bh=Ub62bfMWlc5R306323COfpZrvhEMCoZst8dt+8UYDFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNM/8EeVpAZ6DvrBrL+bD4k3/rGdnR/R00JfP5umLDsplz73NYQ+szyw1XF0dr/CsLCoPbDYkdQE9p//utEiYa1KUH/IWlWnorFATfG36ySJjJS5Pe1wzvJ+SfKzWpLVSOHuEdZPM0GRRFro27NFC67bNIsnG8ssgPQMS92suI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K6mUypW6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K6mUypW6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C1FC2BCB7;
	Wed, 13 May 2026 09:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778665434;
	bh=Ub62bfMWlc5R306323COfpZrvhEMCoZst8dt+8UYDFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K6mUypW6tPKXXJCcJqDZGBHIkwqhuVK5e2zNWl/FfNF89h9GALT+5TECc3xGo5cLe
	 lwkzdaiP3cihxgij1lcEXDrajzJbGz+zV3r1MwhNh7kQZ8FJI+yjr8NNBi0L9efyvv
	 Lox6nsDCpzXaSYaOiz3nLLCEQBgSLGnXxg88DJjJDhERyrxMdWAmvQj3lCTLV6qG4F
	 dN+dgxa35w5q+BJpCtxa+04G95Xz5BRMEQD1PKZZ25ZmEEAHKJLfplYEMcWsXXbC+I
	 zglX4GXfTGz1fsH8ngHJJE5SmUwPsK+n/OD6LBA0w19T0BLsQHqCDmOg4TUh5joTtR
	 JU2XQnYIm6MEA==
Date: Wed, 13 May 2026 11:43:51 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sashiko@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
	krzk+dt@kernel.org
Subject: Re: [PATCH net-next v6 09/12] net: airoha: Do not stop GDM port if
 it is shared
Message-ID: <agRH12v6OeetUmtJ@lore-desk>
References: <20260511-airoha-eth-multi-serdes-v6-9-c899462c4f75@kernel.org>
 <20260512213116.7414FC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fA35iJO0kV4N5A4K"
Content-Disposition: inline
In-Reply-To: <20260512213116.7414FC2BCB0@smtp.kernel.org>


--fA35iJO0kV4N5A4K
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] Stopping a net_device leaves its packets in the shared QDMA hard=
ware TX ring, causing a BUG_ON kernel panic or Use-After-Free when the hard=
ware later transmits them.
> - [Medium] When decreasing the MTU on a shared GDM port with multiple act=
ive users, the hardware MTU is not reduced to match the new global maximum.
> - [Low] The function parameter `netdev` is overwritten in a loop within `=
airoha_dev_stop()`.
> --
>=20
> commit 30071ffd90f181adfa0fb1ab6717d5d5cfa7e0e8
> Author: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> net: airoha: Do not stop GDM port if it is shared
>=20
> Theoretically, in the current codebase, two independent net_devices can
> be connected to the same GDM port so we need to check the GDM port is not
> used by any other running net_device before setting the forward
> configuration to FE_PSE_PORT_DROP.
>=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index 4efd36779453e..aed182c7a5e17 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> [ ... ]
> > @@ -1759,6 +1769,7 @@ static int airoha_dev_stop(struct net_device *net=
dev)
> >  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> >  	struct airoha_gdm_port *port =3D dev->port;
> >  	struct airoha_qdma *qdma =3D dev->qdma;
> > +	u32 len =3D 0;
> >  	int i;
> > =20
> >  	netif_tx_disable(netdev);
> > @@ -1766,8 +1777,23 @@ static int airoha_dev_stop(struct net_device *ne=
tdev)
> >  	for (i =3D 0; i < netdev->num_tx_queues; i++)
> >  		netdev_tx_reset_subqueue(netdev, i);
>=20
> If another device is still using the QDMA (qdma->users > 1), the hardware=
 TX
> ring is not cleaned up. NAPI polling is bound to a dummy device and conti=
nues
> running.
>=20
> When NAPI later processes the stopped device's pending TX completions, it
> unconditionally calls netdev_tx_completed_queue() which invokes
> dql_completed().
>=20
> Since BQL was reset here, will this trigger a BUG_ON in
> lib/dynamic_queue_limits.c? Furthermore, if the device was unregistered,
> would the skb->dev access in the completion handler result in a
> use-after-free?

This issue is not introduced in this patch.

>=20
> > =20
> > -	airoha_set_gdm_port_fwd_cfg(qdma->eth, REG_GDM_FWD_CFG(port->id),
> > -				    FE_PSE_PORT_DROP);
> > +	for (i =3D 0; i < ARRAY_SIZE(port->devs); i++) {
> > +		if (!port->devs[i])
> > +			continue;
> > +
> > +		netdev =3D port->devs[i]->dev;
>=20
> This isn't a bug, but this loop reassigns the local parameter netdev. Whi=
le
> it might be functionally harmless right now because netdev isn't derefere=
nced
> later in this function, could this create issues for future modifications
> expecting netdev to still point to the device being stopped?

ack, I will fix it in v7.

>=20
> > +		if (netif_running(netdev))
> > +			len =3D max_t(u32, len, netdev->mtu);
> > +	}
> > +	len +=3D ETH_HLEN + ETH_FCS_LEN;
> > +	airoha_fe_rmw(qdma->eth, REG_GDM_LEN_CFG(port->id),
> > +		      GDM_LONG_LEN_MASK,
> > +		      FIELD_PREP(GDM_LONG_LEN_MASK, len));
> > +
> [ ... ]
> > @@ -1919,13 +1945,18 @@ static void airoha_dev_get_stats64(struct net_d=
evice *netdev,
> >  static int airoha_dev_change_mtu(struct net_device *netdev, int mtu)
> >  {
> >  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> > +	u32 cur_len, len =3D ETH_HLEN + mtu + ETH_FCS_LEN;
> >  	struct airoha_gdm_port *port =3D dev->port;
> > -	u32 len =3D ETH_HLEN + mtu + ETH_FCS_LEN;
> >  	struct airoha_eth *eth =3D dev->eth;
> > =20
> > -	airoha_fe_rmw(eth, REG_GDM_LEN_CFG(port->id),
> > -		      GDM_LONG_LEN_MASK,
> > -		      FIELD_PREP(GDM_LONG_LEN_MASK, len));
> > +	cur_len =3D airoha_fe_get(eth, REG_GDM_LEN_CFG(port->id),
> > +				GDM_LONG_LEN_MASK);
> > +	if (len > cur_len || !port->users ||
> > +	    (port->users =3D=3D 1 && netif_running(netdev)))
> > +		airoha_fe_rmw(eth, REG_GDM_LEN_CFG(port->id),
> > +			      GDM_LONG_LEN_MASK,
> > +			      FIELD_PREP(GDM_LONG_LEN_MASK, len));
>=20
> If there are multiple running devices on the shared port and they all low=
er
> their MTU, this condition prevents the hardware MTU from being updated to
> match the new global maximum. Should this iterate over port->devs to comp=
ute
> the actual maximum MTU of all running devices, similar to how it is handl=
ed
> in airoha_dev_stop()?

According to my understanding, airoha_dev_change_mtu() is running with RTNL
lock held so we will always have the max configured mtu in cur_len.

Regards,
Lorenzo

>=20
> > +
> >  	WRITE_ONCE(netdev->mtu, mtu);
> > =20
> >  	return 0;
>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260511-airoha-eth-=
multi-serdes-v6-0-c899462c4f75@kernel.org?part=3D9

--fA35iJO0kV4N5A4K
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCagRH1wAKCRA6cBh0uS2t
rM31AQDunwBJ0DVCS5kAHpHwul4CaN/W8nGCUKRkGWyRHdTNNAD9HDklGrcRS6YR
qT2san+wDl2cbYm9Qr6rnVWH8iYZ8QM=
=oOYX
-----END PGP SIGNATURE-----

--fA35iJO0kV4N5A4K--
