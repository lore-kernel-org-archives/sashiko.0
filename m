Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011055.outbound.protection.outlook.com [52.101.65.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E8629CE1;
	Mon, 11 May 2026 02:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778465136; cv=fail; b=Og07QC9CBfZkWdDw1ZK8rT1VMRFBtqqCchqcYSb49PZq3KOBRCnl+AVQjp5Yt/rAlwUr8QJ+GyB1bJK2QVuFx1aOLlQ7lPVEeWm2MMtXCxcCzTetP6W8PZ8L/1yZBoiFSWP61/8H2skKVJpEwvUj/0iDPMRaT927qCO8aY9djIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778465136; c=relaxed/simple;
	bh=GBTDX0Rd43BXhV9Grton+6yK0WlhsYrkZwhoKe2pG1g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uMMKx4OEISQJHf89gl8nPLk94okQ+l2qwaBh5NQ9Z1jRmqXG0uDSWPSCBDDl9z/YUArAxPJL0JDeVN1lJGzo/vO/wBlEIqCWGIkmakYS0hA8xwVDs63elYl+J47qvLZvaa8uQdVjKcwx9R+ZeWcH0B8vqJFBDEtbI9Yoc2Ry4p0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YC6a1Pco; arc=fail smtp.client-ip=52.101.65.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YC6a1Pco"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+STB9cFpruWk6ikqSbqr5tJF5hV3j05rEWml4mR2FoAyacedxGR0gmf8j9TmCoRd6oPLvjO81ZvvSigZVtrQjhF0lgt0a3tKA2S3f0AfUBj20u5qyjb4QrdcuOoHGBXNwqp1h1+xzg2Csq4DwLabsVVu/buoAlxY2bNDYsHTqHpu8lorFdZGZ68+TiX7PJYtiDjGTsEs3ma6RIy1vdNnkT2Il8brU9q1eop33mfQP1LOqrm3s8g6tNN7OS0rw5OE8vplo/EyeCTz5jjGLWkj2aT2MzVmmAzz8aF+qpphnYBiPzWM0Vx5JPS5eU8tPhCOuY20F1oKHDkYuuQxhetBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDRQBbwrH8JVcSLSYlYH/pyR/QYj85RfbA21Fl/B8Es=;
 b=J99EUL17R+9ac2Zl8Q4oEdLDsdt/tIanVWElowkCwu+O4TuQA5JMbQlaArzWaSw1jqWARd5bvsBYKlTXG6nOzuwrG/zDeIKIqR1E5MAF7gQtYnt6TwUmkipIfRPe3xOvuvkWSUCwvbOV4NTdhQvF5xRwmeFoN5pS/1EbPK4DNQDGy5nzEQo3ZI6uYgK54V3imnwABpxXKt5XF5g7t5FGTpDDXQYt58p6I4Xm9IWQckq3oUWb3Se7XbyYJ53P73E2DBntuuMhxltgZAsTtbhgu8VQKnOHNJ7EJw2f25ChgTBH11cigO1w4yIYgjWLMjr7rfJefUQup1T4E/bqQlz0DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDRQBbwrH8JVcSLSYlYH/pyR/QYj85RfbA21Fl/B8Es=;
 b=YC6a1Pco4jZulgMIdoDNXClFHpp1G4Urx+iDrEpWPgyy3CLwuDnESZDT20aZLGdJwiw1QBNoxrup0oAUCeIAq5XHnDmQB91ZUdSe8Q17Bl7Cd8e1RVMIWnPE2q6802R9tu36A4ptTt+8VMAlL3bWv8M8yvhXbLrufkyEy1WD5VjmIhZGBEXSPsKPYBf5MlqwFIVj0KVd0GEFI7tW0VF7Gb4PWjrx/ADUBlsNnMH5Jv9nZPfJHYdj1YtGh9WmRBldEJbUnXoY5uDwSviMgM4blF0JHYT0W+35NnDGVLWpcKKJ9pfCTE8kzZ4PNmTIy4qfPHy37PVwwSQ3aM8hAkUx7g==
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com (2603:10a6:10:1f4::16)
 by GV2PR04MB11351.eurprd04.prod.outlook.com (2603:10a6:150:2a3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 02:05:30 +0000
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7]) by DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 02:05:30 +0000
From: Wei Fang <wei.fang@nxp.com>
To: "sashiko@lists.linux.dev" <sashiko@lists.linux.dev>
CC: "Frank.Li@kernel.org" <Frank.Li@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH v6 net-next 05/15] net: enetc: add support for the "Add"
 operation to VLAN filter table
Thread-Topic: [PATCH v6 net-next 05/15] net: enetc: add support for the "Add"
 operation to VLAN filter table
Thread-Index: AQHc356LyPdy4BukeUK0kaUjIPELnLYHFdqAgAD/WlA=
Date: Mon, 11 May 2026 02:05:30 +0000
Message-ID:
 <DBBPR04MB7500514E13E2678077462D9188382@DBBPR04MB7500.eurprd04.prod.outlook.com>
References: <20260509102954.4116624-6-wei.fang@nxp.com>
 <20260510104834.3FA23C2BCB8@smtp.kernel.org>
In-Reply-To: <20260510104834.3FA23C2BCB8@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR04MB7500:EE_|GV2PR04MB11351:EE_
x-ms-office365-filtering-correlation-id: 81c54577-6975-4eb4-eff7-08deaf01c70c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|38070700021|3023799003|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 jt94NXAyA236NpLM8ueJcMpXPMVNUQcGMLJcgmCeG2QFy6aurODCG+puyE3+4jEDSPhrcc+6EHEq7W7zKnqdeRrfltNoDe14G5wkr+ubf3KS9JfUgX+lDXO63Jq6PEUmyN1zzvjn72xzG4sWyfbaOkEuXI8gZP2e7Pk8Z8fNOGDERrey/vxahfOY4n9aorl2cMeG5khOUdUiB/tjmzoSusT7FC2tcCMk8tBJTJYWp4yACN5zt+QxLFni6/PnHRSws8e6F2CkZiLq2/b6HjP3IHLM/XT2PCsPeXYtgB18jmSfZuk4dZM/flKMIaq/UXx3w19MpQkdbfuJg3mug7mb5caHCwWOjzltd7DybCYoMGhylC2j6TQ8su+7G/RWdc8VIPwXM+5IEV8RpCHXqfD+bVEKwvi/8Z0wGX/qGqaUhO0GHeamQmR0+0iv5lnS0exM55rYO6jjESqfsCq2Eyb1sh0J1C3QxBGgDc/+mIBMTat/WEpJgHFUdcxtZWQJuYUlfgL47a/maN8pdnbJWWZG+JU5rVZsZQ/uBz1Y2u2Gug5ShFePe9wn+0c+8jTFdB2xhUathmocP0Xg848s0nRS4ovskhAgv+ut551thXENaRcmtPOB3RRHp/9dr1SrGUDfuBkWGAd6EPrJE11JPrfmtxBi1HtbRATD2PITCJCFK6+XM2y8UtP1L7ok0sqpp5lJXDkz8kAIFFEEI7hi3QDJnEUdeJUKKLbmhevZcOAyVQJgsZHVLrbEId1PRe6NWyvS
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7500.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(38070700021)(3023799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QfL+W6FSdw+zEXVNIWD0nckc7iKnabf67T9qEp1NtSo18Revwi8OACPT504j?=
 =?us-ascii?Q?tx26bK4y1+5ptL8vE7n9LMnonRkNV4Mi0TEVLm24iKfn0gDEL5AAq0bEC6Zn?=
 =?us-ascii?Q?7oXjhK6j+sSKkWW/TAciXsuzSGFAdssi+mprPZXE+soTfW4UfPUc5llaSOdm?=
 =?us-ascii?Q?IoCJ5eZNeWd7axKQP9Wacfgzuz/RC+4Fke6Husbs4GieavLNo5wzCBKU0PbF?=
 =?us-ascii?Q?57oVSxYZT9n73bbFpbYREMlMaQFjS8eCOe1tNsNOZKlqF99U9+cQTfWFoltU?=
 =?us-ascii?Q?Nz0LjYy8S56WZsNOZPsbT29oKdtfpMUOQeHOv5SdyJ0ZKXyn4jPNgWhDvgZR?=
 =?us-ascii?Q?Vy+KrJmZM638yqI7+pBe/Su+7fgK5C5pncAFngnasWh9jmYQ0cYwvxKBGx09?=
 =?us-ascii?Q?jep1qfrsOuCTC6AD20ZdWRlnPTlmrogTPkjzLlW/U00wBynH+W4UJUTYp1Il?=
 =?us-ascii?Q?t49az2fwnvWQr/Q/g+fHbR9Ft10HQUtZN8nRpjSx72jeRGtQQ1jEM6Q2X6K9?=
 =?us-ascii?Q?SPgDwHCF+XV27W/8cezJ9yDpt3jUZeKtiLuYCD+l/x+LYdSUE06c6NeCSXe5?=
 =?us-ascii?Q?aDw1Jk+DkhcdJaIoNK76my6ciAWcxdjYLDFJQ+CsPxG8oUzlSCU5XSu9egRW?=
 =?us-ascii?Q?GMe4+cuOlPDcClZgt2546p/RPXCBWv+N61l9cvNP39s2BAxqBIUbKte79YM6?=
 =?us-ascii?Q?tEAiqWyTQAUtt2Z9C/g6+96ncYgBXNog2wnDssheILs7oBBypnUegG6G9X3b?=
 =?us-ascii?Q?2tVA6U03Dq6A/xo8rH4z2t+FSedhpiGiTc5aHXdQ5F4Yj6vb4Ly6th+edK/k?=
 =?us-ascii?Q?OE1dCrgwY6cxotGoffuHIvzQvvBoAQSYSXyQLmyMQ/zbnJlHPr+p420qWPNV?=
 =?us-ascii?Q?wY0Y0m+eG6ByuckMV9OVXdxD8hVhvtAHZ8lGlw5zGt52LjwaoubLmPdTBdsi?=
 =?us-ascii?Q?7TJGY77mRF+jq+RyfOKLeFY0Z0vJoI7xMNoqn+d84hxZo5ed2fx5/Op5qnwa?=
 =?us-ascii?Q?KWQtnM1UyVR1M9LgMkRe5h/bAKnyt9/OUZQzXq2jy8BaW6vykl4dYey4CfvN?=
 =?us-ascii?Q?qeQ+eKlBwG635C710HrOCCpRvyPOViU42ftt9IbVbhkSwDbBvombHD49HAUl?=
 =?us-ascii?Q?vVO9lusAu5A9bV/D9P0USfbukThpun07i0PRkj8F1ZzNAFEOchiv/pa2n0lO?=
 =?us-ascii?Q?ZG/q6ewWNLlCfoJNTHSrELgTqHTHbRMo8Hwk0NmDlV8d3QMtHaukirMcAXkY?=
 =?us-ascii?Q?yavt9wT27poCzewi8F6Qsc6IdaSiQhM0I5A/RgkQVSzbun2NTWV+J7SsYQWw?=
 =?us-ascii?Q?ouGkpfkzOU0qb3PsnUzAgXF9B7iMaafrDgz9qI3E6d+rhQMjbTYUTGecyO9P?=
 =?us-ascii?Q?ZDHF97GaB72u1oswS3mSiYi+7fIdJU8S8OcDXgx9wsBrf8LBb4Z8rcxDZuiE?=
 =?us-ascii?Q?FwDBKGIsEQ/rmHPRpblXEXMwmzzHaTUMADp6SVgTRKchwcmYjbjY/2Dx72/v?=
 =?us-ascii?Q?ys8dFL4PLBRedSmnYrmDoI6KCXpq94pmwH/slI6MOotFUrCatEtdLsdID/dO?=
 =?us-ascii?Q?3QkM/lyMM/cmJ4VklfeaOwFIVt/Na+KKrSOivpLDhbfCvVvJQKb220yf2XVt?=
 =?us-ascii?Q?ZGVUnaqnmGxtPXrRRQcfGwcz0bTLBiNZj2VZcSaFFrtUR9mvwkYZ1vmNdfSn?=
 =?us-ascii?Q?JDIKGdMkFfztR6zCPHpjMDmXKytiZg6fOaamdvbnZiKRM/MS?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c54577-6975-4eb4-eff7-08deaf01c70c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2026 02:05:30.1372
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nMbsuBRAx1RpdIIMZCj3ZZrbuJ3mSyKo2B0pYYYxyIgnxepmjEnkOVYOJKZRiy7oCWwyj7vX378jzB7VojGyhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11351

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to
> consider:
> - [Low] Missing dummy implementation for `ntmp_vft_add_entry` when
> `CONFIG_NXP_NETC_LIB` is disabled.
> --
>=20
> commit 5e0769b9fed651ba9fec062f5b68e9fec7739814
> Author: Wei Fang <wei.fang@nxp.com>
>=20
> net: enetc: add support for the "Add" operation to VLAN filter table
>=20
> This commit adds support for the Add operation to the VLAN filter table
> for the enetc switch driver. It introduces the ntmp_vft_add_entry helper
> function to facilitate adding entries using the table management protocol=
.
>=20
> > diff --git a/include/linux/fsl/ntmp.h b/include/linux/fsl/ntmp.h
> > index 4cfff835954e5..3672e0dc7726b 100644
> > --- a/include/linux/fsl/ntmp.h
> > +++ b/include/linux/fsl/ntmp.h
>=20
> [ ... ]
>=20
> > @@ -125,6 +147,8 @@ int ntmp_fdbt_delete_entry(struct ntmp_user *user,
> u32 entry_id);
> >  int ntmp_fdbt_search_port_entry(struct ntmp_user *user, int port,
> >  				u32 *resume_entry_id,
> >  				struct fdbt_entry_data *entry);
> > +int ntmp_vft_add_entry(struct ntmp_user *user, u16 vid,
> > +		       const struct vft_cfge_data *cfge);
> >  #else
> >  static inline int ntmp_init_cbdr(struct netc_cbdr *cbdr, struct device=
 *dev,
> >  				 const struct netc_cbdr_regs *regs)
>=20
> Does this need a dummy implementation for ntmp_vft_add_entry() in the #el=
se
> block?
>=20
> Other functions in this file have a static inline stub when
> CONFIG_NXP_NETC_LIB is disabled. Without a stub here, configurations wher=
e
> the caller is built but the library is not might encounter build failures
> due to an undefined reference or implicit declaration.
>=20

No need to add a dummy implementation for ntmp_vft_add_entry(), this functi=
on
is only called by NETC switch driver, and the driver will select NXP_NETC_L=
IB. So
ntmp_vft_add_entry() is always defined if NETC switch driver is built.

This is a false positive, please ignore it.

