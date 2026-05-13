Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013014.outbound.protection.outlook.com [52.101.72.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211373A640A;
	Wed, 13 May 2026 05:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778650808; cv=fail; b=QljAGIbL5/TYvXo6hs1mZJCYCKlsr7sztXKMos/W5hqSKbQs3SYcrhSOP7l3tisbfQJQutsZLWKSLydz2gUE7aG6qul+Xfzr2K1tjevT26uYN9JIduQbs9awo5XF1CCTiP8r/Re2r/Vv5kbQuyiYqeZe0rs3I6XoKTXrOVnVqeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778650808; c=relaxed/simple;
	bh=qSZCDzX9M5DE+nsliI7p4t6n9hhgZoIBUgN6CjOdpMg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R7hU/L7VaYhRbkGYYp+VrIokEKdjzx5L4wwDaAElCMrU86T808D1mfxKePBssKcIwFqtGmIjq6M6HBsW7ml71cSS7uVmnB16CPmkO3HxNLFnrcOq7+6Wgd32oxFZGRMvlZhUiK4Q7U8gyo+/M8BKGSmP5AnJ6HLN9SX098oYhbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Q95rC5rF; arc=fail smtp.client-ip=52.101.72.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Q95rC5rF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IwdT8YDHRPG43XziNd5eUvCWyWsm1a3tfvTvTSXIS/umyciVBStUZj04rEwf37hNCwq5652zcwFRk72JORw7p1jtJz8NGD+6OxpjAjOF5x86RslCiWzhel3c2Zr1XJrJcOBEp+DYtSvjEsMxLWv0kI6sQifHDAKmCwJ8gaRInJZsIH6zxhzM+hoPq16i5c7L2FZHK5vSLKAldu7vcoi+EZN3kx+MNHdYrab26TQCqJ6NRYIIzOs7rgbCaKOaE5P5wjRgEDQRejHMGJDCmvAz8eOw0sBnO7jcBnY5+FNZKJAV110TrHJg/N5iT7js2zzgdXlXJIozgO98p9YjAHKa0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/pUm9Is7WhE9sRHj2xf3GWqWj2wOggO6mbOBo1C5fg=;
 b=RibuAtqh1Y7v84mZztLnbMbO8ZrZCIZOi5CTxBD/xC09kY5007EWQTwCpporQpe8xdiI7SXwFOwIWXWJup39aKVPAUf2/6sctyusWXSThPLA8b4zQEjDOoTFc2beGOVjvTaE93gv1LT6Kj7m/zXnIL/DWoV9+Q7W2EVshFTtfAhOChuYx7hzHZMGI61mHCO77f8XqGY/uKw4k9BMECdVNzJjSGkoXOpk/EnUwh9EDHl0B2mRLEvgl+t/t2vwqS4cRJYbwjxhk/sQtBvXxga3NFOUdMYMddCSIL9MLBCu+PPICt3M5ddZDsfXIxfxuDfVxmxOk7Ktbhw2aqGoetl5vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/pUm9Is7WhE9sRHj2xf3GWqWj2wOggO6mbOBo1C5fg=;
 b=Q95rC5rF/pjUK7LwQ9or2+1fe0LGVjgQ771KubckOcVDCM93OA6LN9dMQRq4gdejkLMqvJrcF7LSO26EKBqhc3HKtCnqkDxyePTQVJQl0gmAY/jtgWRG5z4x0pgwuowFJxOsJ5/SelI57iLPplqbDWACxDMCNsS/RZQcJpJ9W6H81SKfu6fa7vTiaZ1UZKxsqUP/+47gIoT+kmrkgrzy81CqSP0E7D+rhG1UelPlGoTxby2c7b7TN4G3QpXoG++GRYU9KhzTamgjysuogUumPV5xdio2TkfLsvz75SEKEs3nnFaqtNx3GTUKOJ0TSq4EocCNnJI1bOlg+yFmKzfwyg==
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by PAXPR04MB8815.eurprd04.prod.outlook.com (2603:10a6:102:20e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Wed, 13 May
 2026 05:40:02 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9870.023; Wed, 13 May 2026
 05:40:02 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: "sashiko@lists.linux.dev" <sashiko@lists.linux.dev>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: Re: [PATCH 2/5] dt-bindings: connector: Add fsl,io-connector
 binding
Thread-Topic: Re: [PATCH 2/5] dt-bindings: connector: Add fsl,io-connector
 binding
Thread-Index: AQHc4prx7F7mxT83Wkq0mLT7Ufb4hg==
Date: Wed, 13 May 2026 05:40:02 +0000
Message-ID:
 <AM9PR04MB8353B5A99F294D4F59797437E3062@AM9PR04MB8353.eurprd04.prod.outlook.com>
References: <20260509024846.2094049-3-chancel.liu@nxp.com>
 <20260509031855.1973DC2BCB0@smtp.kernel.org>
In-Reply-To: <20260509031855.1973DC2BCB0@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8353:EE_|PAXPR04MB8815:EE_
x-ms-office365-filtering-correlation-id: d09eb735-af41-4f18-c78c-08deb0b21425
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|19092799006|1800799024|38070700021|3023799003|56012099003|22082099003|18002099003|11063799003;
x-microsoft-antispam-message-info:
 mo9X51HTcU2iLvglopX+jdNMz/dGKn1tHjqVtlG1L5GvELDNiq92xuWG48aR4LFewRYk34fT7CfmfRmDXPwiSqDwP3zafkfCL8mOhZrq39EapJZ/xvXYKraBW/kza3aO2H80P4jC/bs8YBzrBOHe8tIrR9enhU7MKyqCY/Dj5az1sBACJBe0DncqG3sGZajcly/T3zcwxPUS4/LSvzq/60xLiu0JbdP5BlSCVQmtcVFKOVle+IRo1Qj28WJjVqyyX9XBPkEUTNZmlAIP3LLBR/E5k2tP59nJ6aFDtsEpYannaQjNk67sj6lsZUDC6MWy1njEARerkMC3/T02R90oUaiV1tnjkLfv8vCEPJihVh30pnWnSPRk04IBzJ+NX8mCFFBbxhUXH/f0rH9QMKIQUJPpcoM7J5A1orNY6MRf/6iB8J+qJEq7qrbZ7Tv6LAPGYoH3W7qCjCqSDvP/V2+1bw5trVGOeyKmdsi/1CAGu4DV3Tw8SCreHdk1TBnoYEU+CaHkO7CZJFQpDYjTS1sbro0B8+Seha1Ycw8QNKz3NW09zoGMK/pThwk9Bjb4PGJQL19Y1kf7LpCYBPA6K3Dx8VQp/z6HDO1TZPvHB/zSvA8ozOq7jgYsKPwEfJVgUairhMVlBT6KNiq0uufdJEJ1YMbP4Q1c25m19peLVq1cR91TcyNiTlk4LflitgdYiATu0B5XWFS1oRxjEqihqknE4oQeYq7tKHRpOI3O/NJhGMpMtkpd+kSrgaJ7SLy8oLcE
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(1800799024)(38070700021)(3023799003)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ulo/5UDyC6HQoKdihV60E4mlJI3UjUt2QR3Bf7PzPC5fhaWWqZKLO1ZYla82?=
 =?us-ascii?Q?pUzrmjyoCBVpWn8pLUQrG6n73NOC3Wi/bQMosLn8S4Kweg3CjVAeIZ96QiMc?=
 =?us-ascii?Q?B/A4nY2jW6CN1i+CDBddtWmlQqrZgHjOU5WdpcebdAWRJzam+txUxflaOE3N?=
 =?us-ascii?Q?etBbDGmrKMxtDwCVL6PbaO+qyO3GWr4a4zfSiq2+ORgYB0KDiT5G4hxzW6Xj?=
 =?us-ascii?Q?mdpYN1LajHuztHI3ZkJXKZFqPG09JRszpCI6umtzX390HFyW9g8aC+2MFJu0?=
 =?us-ascii?Q?NeNqzJsOXAEmOLTORw22XBh6iSRjQBOYuWocQMMm4fDDPFGupSUhCQswgpEq?=
 =?us-ascii?Q?BbI8VWbJ3t93NxvKfYvk/0/lZSCpRmRVEidipQdlRLmBGoos9x2CTEuoehFu?=
 =?us-ascii?Q?9FTrMiiFn/oI0XodlP0Km+eWKKG4P6GRCcYaGJBIjbA8aRnwVqvP54t9mjla?=
 =?us-ascii?Q?+0Jozp0b+y2BKbn3dusDe2XzqvkpTiYiQ7/L/0edNBhj1DKLItSqRtdHIsKZ?=
 =?us-ascii?Q?7i3Fo8/41T2WGeMh6BQqVgoi9sfo+7TZl9c6YG46DrhgrV6N85y7TFMwkpy7?=
 =?us-ascii?Q?u3kPtoS2OOFfnt3A6Qs8/LXrb0kM6jioeGWf8c/c3v59YuGwlyVnK4lAGu8z?=
 =?us-ascii?Q?U9w/WsEwKdpVCFH5TL0CBdralyS2eFT8CKbY0kt8eVKkF9M25lrNY3ms9oLm?=
 =?us-ascii?Q?nC+BQ+8xUyB77E5LGNHcUOjNiGkEZLscALUpYAyKiAGCYSc1KUL94tEm2XG+?=
 =?us-ascii?Q?F5BmcYjuc83PGI4U4PZ40eE8Cxso4s7jMyh14mS9k7njJaY7lXrbwqhNGzDa?=
 =?us-ascii?Q?389QGv/sJGVabXTCEmTbpzMo68YNe3/VoFDD+fnLguSBlQl/4f2nYBZDXTV4?=
 =?us-ascii?Q?+HXygKjYzVF1Lwmzvt/K19iycoM1o7+wqJO2yv7qDjYLulb6AJX2tUc4VVKE?=
 =?us-ascii?Q?9rBAKY/CVpu1VEWz9seziNUxSbZqjIbPzs/6SwuHCsRkIMARxwpzA84VrV5S?=
 =?us-ascii?Q?SBnZOILQTPJJmivE2ZQKBNMavVT7RWbI3Ii91pR+oFA8F9QzqiM6EWwyqg8P?=
 =?us-ascii?Q?oJKtNWihYJmM1PMVru4dQ216M5cVN8NLNzo9LTboKNnyQHJRmwrB4v6lcl2F?=
 =?us-ascii?Q?013ByTdlMVPZgZ/kGZMShV5BoWJPzCWFDbzuHiUMirOuAgNSRBAyUID2TTQy?=
 =?us-ascii?Q?zZ6CNEVpAKi+JYR8JejCBCzdd1cQr9d4NIGCajJdw1Xz7GY7cCw0gIG2jUUb?=
 =?us-ascii?Q?PMlvVoRzg+mvwZj20DS7BV1+9k+P36qi1YZ5pNE9OJD/fLymL/tnnt0F8GDx?=
 =?us-ascii?Q?jt6NbI9dfnIJPt6ACu+sZNNmPwgBlu8Vw1CpzcHUAkfYYgHrAH8kCYh/MRFm?=
 =?us-ascii?Q?5pGnPT9t9Q2iJF8Yc6oBZus6XP5un7wtSmAlYMgwECbxaJIC1RGTUKvjWlMi?=
 =?us-ascii?Q?1NxcACJatJfkw4ai9pn6XSYsygW98C52EgDv9xvYUjNPRZfL01NsskqtS3Lu?=
 =?us-ascii?Q?XGEoOnDCZDyGFlbsJr+fPqbdCPFyvvBwpmb4x4h1xVQel3u4qEfMFu8HeKvd?=
 =?us-ascii?Q?gm17U+qxoQg+duwoxpqCBEeNu0cddBRjxAC7of8W9XJwqvE/C8gzWG1U4ddP?=
 =?us-ascii?Q?G/XQT3KRkaTE4hkuXW87lnbnjx5Kubv0LTogIf4AaiFzrY1nqIzXU1w6Yj0p?=
 =?us-ascii?Q?cCl1ApmNPNh13PdkrsPMQ7t3RR4C1RTTWMM2BNrzVOaCrif+?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d09eb735-af41-4f18-c78c-08deb0b21425
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2026 05:40:02.1399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QV3h1o7K9plIsKMBRIfUB3+b5mwDtKjSEPYulWTjrdwXsjNOC4VSMc7eZO/sziTwfszVsDFvbRBWgrrzsMsCLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8815

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s)
> to consider:
> - [Medium] Missing `#pwm-cells` property definition causes valid PWM nexu=
s
> configurations to fail schema validation.
> - [Medium] Subsystem guide violation: Provider capabilities are missing f=
rom
> the `required` list.
> --
>=20
> commit b88adcce540a59e2da49df7e20b99d2c52021962
> Author: Chancel Liu <chancel.liu@nxp.com>
>=20
> dt-bindings: connector: Add fsl,io-connector binding
>=20
> The commit adds a device tree binding for the NXP I/O connector. It acts
> as a nexus node for routing GPIOs, clocks, PWMs, and interrupts through
> index-based mappings.
>=20
> > diff --git a/Documentation/devicetree/bindings/connector/fsl,io-
> connector.yaml b/Documentation/devicetree/bindings/connector/fsl,io-
> connector.yaml
> > new file mode 100644
> > index 0000000000000..8b5038a2332e3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/connector/fsl,io-connector.yaml
>=20
> [ ... ]
>=20
> >   pwm-map:
> >     $ref: /schemas/types.yaml#/definitions/uint32-matrix
> >
> >   pwm-map-mask:
> >     $ref: /schemas/types.yaml#/definitions/uint32-array
> >
> >   pwm-map-pass-thru:
> >     $ref: /schemas/types.yaml#/definitions/uint32-array
> >
> >   '#address-cells':
> >     const: 0
>=20
> Will this fail schema validation for valid PWM nexus nodes? Since
> additionalProperties is false, omitting #pwm-cells from the properties li=
st
> means device trees including #pwm-cells will fail validation. The #pwm-ce=
lls
> property is required by the nexus mapping logic to parse PWM specifiers.
> Should #pwm-cells be added to the properties block?
>=20

Yes. The PWM nexus mapping relies on #pwm-cells. Will add in next revision.

> [ ... ]
>=20
> >   interrupt-map: true
> >
> >   interrupt-map-mask: true
> >
> > required:
> >   - compatible
>=20
> Are there missing required provider capabilities here? According to the
> dt-bindings subsystem guidelines, when hardware gains provider capabiliti=
es
> like a GPIO controller, interrupt controller, or clock provider, the
> corresponding standard properties like gpio-controller, #gpio-cells,
> #clock-cells, interrupt-controller, #interrupt-cells, and #pwm-cells must=
 be
> included in the required list. Could these be added to ensure incomplete
> nodes do not accidentally pass validation?
>=20

The connector can expose different sets of the provider domains
(GPIO/clock/PWM/interrupt) depending on the connector usage. So I think
it's not necessary to make all provider capability properties required.

> >
> > additionalProperties: false
> >
> > examples:
> >   - |
> >     #include <dt-bindings/interrupt-controller/irq.h>
> >
> >     connector {
> >         compatible =3D "fsl,io-connector";
> >         gpio-controller;
> >         #gpio-cells =3D <2>;
> >         gpio-map =3D <0 0 &gpio1 8 1>;
> >         gpio-map-mask =3D <0xff 0x0>;
> >         gpio-map-pass-thru =3D <0x0 0x1>;
> >         #clock-cells =3D <1>;
> >         clock-map =3D <0 &clk 1>;
> >         #address-cells =3D <0>;
> >         interrupt-controller;
> >         #interrupt-cells =3D <2>;
> >         interrupt-map-mask =3D <0xff 0x0>;
> >         interrupt-map =3D <0 0 &gpio2 27 IRQ_TYPE_LEVEL_LOW>;
> >     };
>=20
> Should this example section include the PWM properties as well? The
> subsystem guidelines require the example to include all required properti=
es
> to pass dt_binding_check.
>=20

Will extend examples to cover PWM as well.

Regards,=20
Chancel Liu
