Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013063.outbound.protection.outlook.com [40.107.159.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D97D3603D3;
	Mon, 11 May 2026 03:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778469969; cv=fail; b=lbqLIdYJVlR8VDmrpDhsgCJpV69VPgrWRaISm74VEa2spFjb0+U20wShZwREvCg3PT0DYdk/9vc2zxjisEjhB5P6ZSxiWLvsa6ki2UA5vMfq+OjN4UstVBoPMlje+t34G3WwGZCiPF6aaByNBYNrxz/KVUdyALuIu0nE2HUgH5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778469969; c=relaxed/simple;
	bh=/PTZHyUlmmt5ZGhMHVO2cckmlicmI+XFgdrkuIOSrow=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p5oX6ecWi44UiuQnuRBa3/JBDakb1cGZyKPIoETOZS06SB9Qw2IOc401kVUQUNZuX4qzFvFj2Y9XJMOOB+KXdghOVwEMlQgU5BxtVRvqyvgbiq7uD9RbqcrcL90vf8IXe5EfQqngoSL4DFBnSI8yYpJxZLmlIdUAXiJjy5wJk8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MtPzxUzX; arc=fail smtp.client-ip=40.107.159.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MtPzxUzX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ju0YZ0S3AkvgkAKA0DTPGGsDzVX2pBQau+wMv+RUJyP1gPfvOuHL+NaXel4OhiUzKsvJgJthjlVMdLILabUT200mSxY7x6OrYdzZ4mqFY/NtU0OPyrJtaUtD+S7vnjA7rfaavfqZkfmEvCzGTSFy/eixRjXvewvE1E8Ilkn85u3Qa9ignOXkjnOZNoQ6d1zwK2MkodQd1q2lLezXpreZGJ0XI7jFLqRRGXRxRK7v4g+k07zXVfCjDW+RUio8tdKBB3maJOwiRz9dJehgs1A+aoAm1JZr0JxSGO67T+JBVpT2707NmQyRaMy+FIhUMaKNsXHRQy/rmdh8S/2UMOwpBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihBuJHmXc3Jr/CgwTNKvsDwRS0MWYSUL4FCt95Oo3k4=;
 b=AkC7zIIMjSjyuWgG6bvIOwmlnPnZ6bzFm+qnmjSHh0iA8gjiijmKDNJqdgxmPvqKX3Kc6KSIeiLdbySUphzY8YRazWZ9pOIDUp+VJ+xmErpvX1DCV+3D7ANgo75TbRfKkKClFbDcgQsC8betF01TBCEEmlclR2+dlX6RCYNqdeMwyQ3cm/VBC60YltJbn9CZsSHMOAsja6H5aPj6WOmfaaLiIptGNxRKWWlnUrAT/WCsKzw6j8fboYRAWeGkRwtcYg2ZObuZyU7pKfvf/aZRzoqHhfWJkDUT+tPzzWJr60EH2tZNYGQsLbzLHg41p/nV0bQnk/hySqMq8MO4KWVBuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihBuJHmXc3Jr/CgwTNKvsDwRS0MWYSUL4FCt95Oo3k4=;
 b=MtPzxUzXxob6SF7VoBRA5LfdmKU6RQiBnDWLrcqGU4y0LIxNf44/EhQC8eGprRF98jduAQilG3iG6bVlknjGxQ3Twlj0Bx2Hbg2xhuE3HaTy33es2GP4Ac9ZE5w2IpRFARB8b2kdXO6TnkorQnA7dZR5oRVaZi17n5WXIw+/LwekSXWatqi35prSyB62TZwnF5r0KcCfWSMHaLxDdK2TucPvnC6v8zpf6evms+Boqsc20nh/5Vta0nxVORTDlugxz0oTdL+AEXxJ8zBasTtVb99CaNz3aZWGzeB2R5+MOG1sE2T2EVoVqXoXK103O/H1wiaNnK+TUxFUCdtuFtRBoQ==
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com (2603:10a6:10:1f4::16)
 by AS8PR04MB8199.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 03:26:04 +0000
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7]) by DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 03:26:04 +0000
From: Wei Fang <wei.fang@nxp.com>
To: "sashiko@lists.linux.dev" <sashiko@lists.linux.dev>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>
Subject: RE: [PATCH v6 net-next 15/15] net: dsa: netc: add support for ethtool
 private statistics
Thread-Topic: [PATCH v6 net-next 15/15] net: dsa: netc: add support for
 ethtool private statistics
Thread-Index: AQHc3560uEq/mPxEPkyFK/hht0XX6bYHFeIAgAEWOSA=
Date: Mon, 11 May 2026 03:26:04 +0000
Message-ID:
 <DBBPR04MB7500DB07950B62C6DBFDEF5688382@DBBPR04MB7500.eurprd04.prod.outlook.com>
References: <20260509102954.4116624-16-wei.fang@nxp.com>
 <20260510104841.11938C2BCB8@smtp.kernel.org>
In-Reply-To: <20260510104841.11938C2BCB8@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR04MB7500:EE_|AS8PR04MB8199:EE_
x-ms-office365-filtering-correlation-id: 337fd520-16f6-4654-1e66-08deaf0d0896
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 /3Xb4aEAS5RUXx+mJ0tN9jghckeg8fNmc3S59TRX57nLopcBxm2GTl2IBXFqEUOr6ea6vE7ZNadDCxHe7SBPWDPfVmxMv5obzvAlxdlVaZnYmWYM/2UhnsCPYQX5G+GvjFxQNIsqy7MlatMjlASfKKYA9xTRw9HjDMM48sZ3/iN5bn2heX27szNDpOfTgVNVzVnf7mN8lYqLYgCrH2Qz9SnHMSpTdROrcpt0qzIBZq3SN2EsDfwkRyV0e8tAaHgxxEQDy9BThe/61I6ueSviKUq225hZtVaJF5KKwFDcMCR+mGAWT4hrbVr2ZDTUyV0gEZjSMQAA/L3qebYtRB2x0z7LjbF3xtwCZlIMQJi62MYlLQt5NybQeHe57EqsR900Mynk3Le7SI4Z095fO8rFxR8p8gDW20lENCQMT08c+PewrNd4b85Xyyik+secBvCm6Qd3oSakWuRwi8j6eAkoVqPlXUsGNdGGr/ImCqNX9173R6/2Ii6hecpjnFj3cjiHTMMs5tihTlsXHHhf7v/cWjrT1PiYy6HM77gPRfL6EZrFJZ440I56DtzeRyV8otRVEZL67mHixvnthpiZrFdeKXiUO/N7BrNNUS1OPN/JE4wLpg0CxOhOCgJ2H3Vcckngm7V9qK7RIJ6lsvBuaV6uD6AJzzurMlQAM87sVAWAzfMF3AUh7+JAP+M9qs5WV1GP86VeoJwxzKcsJuun1geWTyNJwRY4R6l6uzMeYQJ5pnbE+SaA9zWMibotN/RiVMtF
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7500.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LSk1YGiO2LHCqcarmSFIdkLj0VSXF0TA+P7DVIrv5BE4Wb5aTbUr19rJFveX?=
 =?us-ascii?Q?N5pcMvD5uzNEn6VXP28h+JgKr+zxVuRPbReM6bRQV1I9sJnmbNmFfNjBqJ6C?=
 =?us-ascii?Q?9VegzAEJXM2ZP1qMp+qbb8bVMxzNrHuzwB0IRV3HkvESZCVltFsWZWB1itis?=
 =?us-ascii?Q?5de7/x+0clES7L5luxt/79/4JbxUfmWndoYHbtloyHOQdkbVJ7AAEXirnL+w?=
 =?us-ascii?Q?+cFP0XN20lj7MLbhfvvCQzfMriWZz+6FkzZeOeFBjACerxmtNArori6lmgrp?=
 =?us-ascii?Q?myG5ScF32faWIjGdrw5z60vEEc+4FEhFE5mf9fh+mEu67+rdzeSGvDP1t3H+?=
 =?us-ascii?Q?1RZwQ+xWeODm9B8gb9qvzlxbhStF2LKetqewj/rcsJ9MbeirqYQqun4yjvnj?=
 =?us-ascii?Q?tFPfVqzRk+K88kBxGAuiiF495AIobau/Sss4iar1U38doo+Zs7B6kZxho9A9?=
 =?us-ascii?Q?hnQeX+5mBKEAAv0iGUVOo4SGxEiMgXnHfxP8UUN1WryjO19JOZf9iLK3EYu0?=
 =?us-ascii?Q?ZAXNhWjRGU5pMKnj2a/bcIspg7gouDp2uWGdImIZJUcD7QcCBZ95m3qr9qfd?=
 =?us-ascii?Q?6N2BZ5SK7UP43ROWa827rN8Eq0rq42Qhm30UNIwdkeEvRRfS6nMwptfqCIc7?=
 =?us-ascii?Q?8b1aIM5Vx4pxiK2IfWtwu7BtDDfQh9I3GEjG9dBUWRoRaUgyityAAr1wJa4k?=
 =?us-ascii?Q?AHQMh82Slvk3dspwW6AQ+s4rn5ivryRYEQ/xsko5IvRJUOH2ey2BrC1QjNfi?=
 =?us-ascii?Q?s9MIHcciHrPBSB2OsnuhyTXT+JjegRZoN1daLGrHc9gncJW0irbRwND/NZp3?=
 =?us-ascii?Q?FfKipThYcaiCqChxctcDaU+l1SW4LIqmnMhfukn51vjyiabjERIMvF9fIwUp?=
 =?us-ascii?Q?XJED1GBMb5dtcTaOKaoofyYgdko92nJNfsVHPwoofzqY20lGIk4gYkrQ1+96?=
 =?us-ascii?Q?OZXEYju3d6lsYDFq+/qY0z3A5G4blCzjegDiY535ga84kUKOI82OaI10poif?=
 =?us-ascii?Q?iX9/It06Un5xalWyKufdJwFKvopIzdWDfQyAiPBYl7RdLqe9jVg6kYRZvvq/?=
 =?us-ascii?Q?wKbwmYdux9wm/aHYmP9kjnQsjZyeNEmSTxVyylrGhnWdXBt7L2m+1ffO7VPc?=
 =?us-ascii?Q?nb104M7TepXo7qcmxlIym6Zd0e1FnNgMm1ckuqlbJEnhgs3gs/mjxAP6Z1v/?=
 =?us-ascii?Q?xRCDvBDrDGSR8Q3g1K3lVXkwQAoUbgXfH9ktQZQzVhAc72yCtbaA41QTrUI/?=
 =?us-ascii?Q?uGaPcazWVc9SJ0ubRVxrbSTvlDH7I40lDG8ln5hZrjo3pldlJitdAoVoBncf?=
 =?us-ascii?Q?faV2IwDRAFw5/rCJm8zIPAqPDWc3S29WJZRHseIX7XBc4kQu4LEQ7Ytqr0vT?=
 =?us-ascii?Q?hoDPNsrgKRrFZKTAGaH41qffW3z9nkSDAajFXb6mReWHgm4c5bgNgLwxtRar?=
 =?us-ascii?Q?sFW9hDQpW5jevA6WrscbeecWQpJ7jCsVvy+yuwn1u5RElm/bEmtNPQyFCzsv?=
 =?us-ascii?Q?hklw//9PjFH1PY+2RpocKvBY/RONQJKNslZyaAXBgXnt7wCWGUk75UgkRhyi?=
 =?us-ascii?Q?uBH1hh4jNmNNiGSMRss81rH0eH4HUctAXuYicdNZVIbTjBdJy0vNKzti7xd7?=
 =?us-ascii?Q?Ca+iB+Wol1r1yJwWTumg+oth0fzS3vLgJYP/aNBODGHQVVK22Kj+Vb0wlPGM?=
 =?us-ascii?Q?prSB+c1Rr/U7qNVFY6GRXfv8MvpftgljUvH/UEPdMUZFA0Ed?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7500.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 337fd520-16f6-4654-1e66-08deaf0d0896
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2026 03:26:04.6284
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OXXg9UyMtq+jTu+Hzlb2Zqm31T2aLek2QNyFfOOhIVn2dkiCd5pxgS6Gp0hvOc1Arauy57wC3BAgLHOjhwmgQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8199

> commit 66f17e671c095a381aeff77d1d8c0cae1e43722c
> Author: Wei Fang <wei.fang@nxp.com>
>=20
> net: dsa: netc: add support for ethtool private statistics
>=20
> Implement the ethtool private statistics interface to expose additional
> port-level and MAC-level counters that are not covered by the standard
> IEEE 802.3 statistics. The pMAC counters are only reported when the port
> supports Frame Preemption (802.1Qbu/802.3br).
>=20
> > diff --git a/drivers/net/dsa/netc/netc_ethtool.c
> b/drivers/net/dsa/netc/netc_ethtool.c
> > index ac8940b5a85c6..8d04db534347c 100644
> > --- a/drivers/net/dsa/netc/netc_ethtool.c
> > +++ b/drivers/net/dsa/netc/netc_ethtool.c
> > @@ -19,6 +19,56 @@ static const struct ethtool_rmon_hist_range
> netc_rmon_ranges[] =3D {
> >  	{ }
> >  };
> >
> > +static const struct netc_port_stat netc_port_counters[] =3D {
> > +	{ NETC_PTGSLACR,	"port gate late arrival frames" },
> > +	{ NETC_PSDFTCR,	"port SDF transmit frames" },
> > +	{ NETC_PSDFDDCR,	"port SDF drop duplicate frames" },
> > +	{ NETC_PRXDCR,		"port rx discard frames" },
> > +	{ NETC_PRXDCRRR,	"port rx discard read-reset" },
> > +	{ NETC_PRXDCRR0,	"port rx discard reason 0" },
> > +	{ NETC_PRXDCRR1,	"port rx discard reason 1" },
> > +	{ NETC_PTXDCR,		"port tx discard frames" },
> > +	{ NETC_PTXDCRRR,	"port tx discard read-reset" },
> > +	{ NETC_PTXDCRR0,	"port tx discard reason 0" },
> > +	{ NETC_PTXDCRR1,	"port tx discard reason 1" },
> > +	{ NETC_BPDCR,		"bridge port discard frames" },
> > +	{ NETC_BPDCRRR,	"bridge port discard read-reset" },
> > +	{ NETC_BPDCRR0,	"bridge port discard reason 0" },
> > +	{ NETC_BPDCRR1,	"bridge port discard reason 1" },
> > +};
> > +
> > +static const struct netc_port_stat netc_emac_counters[] =3D {
> > +	{ NETC_PM_ROCT(0),	"eMAC rx octets" },
> > +	{ NETC_PM_RVLAN(0),	"eMAC rx VLAN frames" },
> > +	{ NETC_PM_RERR(0),	"eMAC rx frame errors" },
> > +	{ NETC_PM_RUCA(0),	"eMAC rx unicast frames" },
> > +	{ NETC_PM_RDRP(0),	"eMAC rx dropped packets" },
> > +	{ NETC_PM_RPKT(0),	"eMAC rx packets" },
> > +	{ NETC_PM_TOCT(0),	"eMAC tx octets" },
> > +	{ NETC_PM_TVLAN(0),	"eMAC tx VLAN frames" },
> > +	{ NETC_PM_TFCS(0),	"eMAC tx FCS errors" },
> > +	{ NETC_PM_TUCA(0),	"eMAC tx unicast frames" },
> > +	{ NETC_PM_TPKT(0),	"eMAC tx packets" },
> > +	{ NETC_PM_TUND(0),	"eMAC tx undersized packets" },
> > +	{ NETC_PM_TIOCT(0),	"eMAC tx invalid octets" },
> > +};
> > +
> > +static const struct netc_port_stat netc_pmac_counters[] =3D {
> > +	{ NETC_PM_ROCT(1),	"pMAC rx octets" },
> > +	{ NETC_PM_RVLAN(1),	"pMAC rx VLAN frames" },
> > +	{ NETC_PM_RERR(1),	"pMAC rx frame errors" },
> > +	{ NETC_PM_RUCA(1),	"pMAC rx unicast frames" },
> > +	{ NETC_PM_RDRP(1),	"pMAC rx dropped packets" },
> > +	{ NETC_PM_RPKT(1),	"pMAC rx packets" },
> > +	{ NETC_PM_TOCT(1),	"pMAC tx octets" },
> > +	{ NETC_PM_TVLAN(1),	"pMAC tx VLAN frames" },
> > +	{ NETC_PM_TFCS(1),	"pMAC tx FCS errors" },
> > +	{ NETC_PM_TUCA(1),	"pMAC tx unicast frames" },
> > +	{ NETC_PM_TPKT(1),	"pMAC tx packets" },
> > +	{ NETC_PM_TUND(1),	"pMAC tx undersized packets" },
> > +	{ NETC_PM_TIOCT(1),	"pMAC tx invalid octets" },
> > +};
>=20
> Should these standard MAC statistics be exposed as private ethtool string=
s?
>=20
> Many of the counters defined in netc_emac_counters and netc_pmac_counters=
,
> such as rx octets, rx packets, rx dropped packets, and tx FCS errors,
> appear to correspond directly to existing standard uAPIs like
> struct rtnl_link_stats64 or struct ethtool_eth_mac_stats.
>=20
> Since the driver already implements netc_port_get_eth_mac_stats(), which
> supports both eMAC and pMAC sources, could these standard counters be
> reported through the standard interfaces instead to avoid duplicating
> them in ethtool -S?
>=20

For the NETC switch, its ports support preemption, so each port has two MAC=
s
(express MAC and preemptive MAC). The driver-private statistics can help us=
ers
obtain statistics for each MAC, just like the standard statistics of ethtoo=
l.
However, rtnl_link_stats64 retrieves the combined statistics of the two MAC=
s.

In addition, ethtool_eth_mac_stats only has the FCS error counter for RX,
not TX. what I added to driver-private was TX's FCS error counter.

Please ignore this warning.

