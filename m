Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09D929B78D;
	Mon, 11 May 2026 06:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778482269; cv=none; b=GnUFN7WUxxZNj9axcHkcjcdKyZa5jDD8MUiZ1AXnSdaWVxO8uIPsVZZ7W7GkOXrebfe2abFz7YgagXHFeHJYAyhbSvBXgbMPFkAW5YyewjVtRiDiNKi2xGD+c/jhbqffFdgdTN2K2qfc+ZZ5lYBrlMxSTzmLTbutaetpm3c0+BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778482269; c=relaxed/simple;
	bh=wqD98MO+dMAu60i5VFJSDqQmQqZN+ELhw7sRVp/bcAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfjSNSuvTdr8vaiNIsWCuiIPdD7J97Kj+Del9CQllx17E5uS3z6qkZ+LvCp9dIMM7PediaQpEKfwvcdytLmsGwA4VDGLG85uCbDa/yMzyINQTdcrWMRWr7r6HfzovfnAKOkxTJ13b3xRqtQR4xymInbiGZKbtG0SCg1hxKp+2jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sgoQUKY+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sgoQUKY+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C666C2BCB0;
	Mon, 11 May 2026 06:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778482269;
	bh=wqD98MO+dMAu60i5VFJSDqQmQqZN+ELhw7sRVp/bcAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sgoQUKY+dNMX4qe0bwx56KsZt1+o1oCVmbamrfA/i8MIeLcGzKOOvlUz5fT68zfDg
	 Nx2R/065A3nb6QP5ZvZUpYbhj8aWIZxc48+p2DswiOs2l/JSJSb9AfXjQb9JrBN/Rg
	 9/Fpltgjic1sELX+YeNVUp1AYC0MyLLjF0nvZz4bBwxcUed5ZKieXCpmFwgleng3HR
	 Is3Ks7DwuWa9kJQ8QLAxhYYzZB4BBB541SewjgYBO8rAor4e+Az3MvJpFZV2cqru9u
	 ezYLWloIvOQ31eU8noTtxp7Cer0B0KJ4ODGR+hud7ZVT0LH0sxpsRPq4PopcnDoHyj
	 VzkNWD37CLi1g==
Date: Mon, 11 May 2026 08:51:06 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sashiko@lists.linux.dev
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v5 12/12] net: airoha: Better handle MIB for GDM
 with multiple port attached
Message-ID: <agF8WhrU8lTIyOjX@lore-desk>
References: <20260509-airoha-eth-multi-serdes-v5-12-805e38edc2aa@kernel.org>
 <20260510140506.DBBDCC2BCC9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Yak5kKSg5+tzS0K4"
Content-Disposition: inline
In-Reply-To: <20260510140506.DBBDCC2BCC9@smtp.kernel.org>


--Yak5kKSg5+tzS0K4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Moving the statistics lock from the port level to the device l=
evel introduces a race condition on shared hardware registers, causing cros=
s-interface statistics corruption.
> --
>=20
> commit 29334a9bde18f0777df549f0d135356a4b8bd3ee
> Author: Christian Marangi <ansuelsmth@gmail.com>
>=20
> net: airoha: Better handle MIB for GDM with multiple port attached
>=20
> This commit enables a split MIB feature for GDM3/4 to track counters per
> hardware channel instead of per GDM port. It moves the statistics structu=
re,
> including its protecting lock, from the port level to the device level.
>=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index 623cac42dfb71..b1a6586293457 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > @@ -1621,143 +1621,150 @@ static void airoha_update_hw_stats(struct air=
oha_gdm_dev *dev)
> >  	struct airoha_eth *eth =3D dev->eth;
> >  	u32 val, i =3D 0;
> > =20
> > -	spin_lock(&port->stats.lock);
> > -	u64_stats_update_begin(&port->stats.syncp);
> > +	spin_lock(&dev->stats.lock);
> > +	u64_stats_update_begin(&dev->stats.syncp);
> > +
> > +	/* Read relevant MIB for GDM with multiple port attached */
> > +	if (port->id =3D=3D AIROHA_GDM3_IDX || port->id =3D=3D AIROHA_GDM4_ID=
X)
> > +		airoha_fe_rmw(eth, REG_FE_GDM_MIB_CFG(port->id),
> > +			      FE_TX_MIB_ID_MASK | FE_RX_MIB_ID_MASK,
> > +			      FIELD_PREP(FE_TX_MIB_ID_MASK, dev->nbq) |
> > +			      FIELD_PREP(FE_RX_MIB_ID_MASK, dev->nbq));
>=20
> Does moving the lock from the port to the device level introduce a race
> condition on the shared port MIB registers?
>=20
> Because ndo_get_stats64 can be called concurrently without the RTNL lock,=
 if two
> CPUs request stats for two different devices on the same port:
>=20
> CPU1 calls airoha_update_hw_stats() for dev_A:
>     spin_lock(&dev_A->stats.lock);
>     airoha_fe_rmw(..., REG_FE_GDM_MIB_CFG(port->id), ... dev_A->nbq);
>=20
> CPU2 concurrently calls airoha_update_hw_stats() for dev_B:
>     spin_lock(&dev_B->stats.lock);
>     airoha_fe_rmw(..., REG_FE_GDM_MIB_CFG(port->id), ... dev_B->nbq);
>=20
> Could CPU1 then read the hardware counters for dev_B instead of dev_A?

ack, I will fix it in v6.

>=20
> [ ... ]
>=20
> >  	/* reset mib counters */
> >  	airoha_fe_set(eth, REG_FE_GDM_MIB_CLEAR(port->id),
> >  		      FE_GDM_MIB_RX_CLEAR_MASK | FE_GDM_MIB_TX_CLEAR_MASK);
>=20
> When CPU1 then clears the counters here, could it wipe out the unread
> hardware statistics for dev_B?
>=20
> Is a port-level lock still needed to exclusively protect access to these =
shared
> hardware MIB registers across multiple devices?

ack, I will fix it in v6.

Regards,
Lorenzo

>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260509-airoha-eth-=
multi-serdes-v5-0-805e38edc2aa@kernel.org?part=3D12

--Yak5kKSg5+tzS0K4
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCagF8WgAKCRA6cBh0uS2t
rLKuAQCVHo9zxxc0/M/2vdNjL4owOrzT2rbvhRnV2L78lFsMGQEAwZmw0aUtbQ2O
JQuPuqSO4Bf8fRR28FMUTzXWBp1DRgM=
=4akk
-----END PGP SIGNATURE-----

--Yak5kKSg5+tzS0K4--
