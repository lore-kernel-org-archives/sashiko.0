Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011000.outbound.protection.outlook.com [40.107.130.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D721C29CE1;
	Mon, 11 May 2026 02:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778465466; cv=fail; b=jWv9AVamX0muvXGLfzCFa8zvZ6usQKJ5QYvsYZuIhUad1G1S7YJa1J0i9nDrdtVde2erb2+mveRx74I9fx5IBcI1cHOFg1B4J13Cp3p1VjMXVx+6eDvx4vU+lZ6QYOsGO4wK8n135XY26cMFBfhMZ8Z1WHyXEZGWN8PTG/lLcSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778465466; c=relaxed/simple;
	bh=ySfZKtcGHm85p1PwT3RC1i5BJl3il+OYbF73BFXe8hA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h0MniZwx5vch/kw60Sxy4Pbme4h+/0oo8IbwqdM31SZz+m8atzyxH8S+H6H33BXAfm+H7s1DVK96ki1lbfY4EcVmQQyeq11uouSq67RGxGBXBb8WuVOtaTasywe+9WwCTa18JWmJviJoPPjVzjwmbUHkLd/EUPQ56Lk9ztlznkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aqCAOzk8; arc=fail smtp.client-ip=40.107.130.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aqCAOzk8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JCgWWLDWiF5U66rWClN7CUSWwumFtxVhzI9I9izV8APglfNqHjbXFYb8hMeeIYxXlsGHPOxHc6JDjaM+AHwyL090mdG04sOVAhFq5Pj6fiFiVDeK7NVGm9VC5OGoLilL1FUMnlH+EewoTtgT+HMwIMNIxC7FwHDx70e93gTnehz0BTpITr74pnY/BmKmKp7YSMcGZSHmZybPFGQqQahplj0DjY/qAawsXtmwDKqOuZTQp/a4ZMMyXbuXvBgA3pzGyb1UUxfFNen5UxN7IRWRf6nDi+DvoUwppdkJA+mxiIzRuB5+lpA9Zu0G3gUc8hswJsFnmOcAjpj1UVAQQeqzQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtpHVL11f0dp/KPpxLTfcnGK/2NMdEo2HEROzbbS/XE=;
 b=Ul8aubGiwBVbh4+2CAGSQ17SuK1syeLlC06nm4uKvGD+MEv1aKhRLOoCvqmsJioyQMlvQKnd2MOW9bTVVJtpjKu8P72+ij/VlSoj2yQ3qzJ/ceEX9izlV2aOzcPjqTTT0xmfzdLpdaHhH6P3OSSSIvCQM/8+1hAb7A9+5Eqtie2mGL5DYZSJywZq/YbUQK8IXeDCZvWh8GrHmzlNGMjHiMtyQERFwWMtREAORmj8sPCgLiyw6UXkSk8dqqjVUv/Ak4ypj/Umlyx+OoQtdpWoK/Fb1rsI0wvZiM2rtnl7/3HZc9nIRBbCbmKsmQ3yD8FM6LhZqJGJARr1by+btdpt0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtpHVL11f0dp/KPpxLTfcnGK/2NMdEo2HEROzbbS/XE=;
 b=aqCAOzk8lvETCb2K/e1/kLWf2Je5NQ48Ep6H5jPhfGez1WZHwTghkpeD0DbVWPMrhguSiCYF3t4ORgo/feBzoHor+xBEXyl+5RzYMBIYtsPshnWvwSMOw+0LiSaqtqZEF7dirPXilR5hlR4ygEICMM6Wzu0xm6BjWqAOci9qy4/zmJIpNnz00cauNuz4NUizUO2hLGVKgckOxmfnzCM4ms4X6WEgpzNHMryQMK2TQm0Na8vI8a9Wg/jSAX4XnVc7XUva4Gt+t7tmI7dpZYFxCX7eF80lYJnMWnBKNsIWJanztpasMzZufHvbxgwCuUbiOxDNkzpZCSSAbLYoBqSvqw==
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com (2603:10a6:10:1f4::16)
 by GV2PR04MB11351.eurprd04.prod.outlook.com (2603:10a6:150:2a3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 02:11:01 +0000
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7]) by DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 02:11:01 +0000
From: Wei Fang <wei.fang@nxp.com>
To: "sashiko@lists.linux.dev" <sashiko@lists.linux.dev>
CC: "robh@kernel.org" <robh@kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>
Subject: RE: [PATCH v6 net-next 07/15] net: enetc: add support for "Add" and
 "Delete" operations to IPFT
Thread-Topic: [PATCH v6 net-next 07/15] net: enetc: add support for "Add" and
 "Delete" operations to IPFT
Thread-Index: AQHc356UrAB9xPqHnEmu9ZrKOgX5kLYHFdsAgAEAnDA=
Date: Mon, 11 May 2026 02:11:01 +0000
Message-ID:
 <DBBPR04MB75000ABB26EFC96C65F98C1C88382@DBBPR04MB7500.eurprd04.prod.outlook.com>
References: <20260509102954.4116624-8-wei.fang@nxp.com>
 <20260510104835.0F27DC2BCB8@smtp.kernel.org>
In-Reply-To: <20260510104835.0F27DC2BCB8@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR04MB7500:EE_|GV2PR04MB11351:EE_
x-ms-office365-filtering-correlation-id: b4c34a5d-44dc-438a-08dd-08deaf028c7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|38070700021|3023799003|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 J/GcBngQW9/cLyjFL8o54b0EU110WZbPxJwAG1VQKv7GYQR82MXC5FTqhRyqFCaR+XOcm8J56xSL9wbcPfKQgOO5U2DJ47HDIt3u4sNpoForMmZ9IqZ+BoRJE40/zjMZGnTjQriBBfmLt4qYSBU4bTdWqwaxBLXa2kABa3E0IEOebQBc51ouXrC5eJ+kv00MlM4e/S8E/nAPo79Kd1CKP5SKzK0GU77mxtETCWJk/0oPwWIdCbCPvZf46OaF2nB3ch1C6A78N6wH/Ohr/w9g9aBAFm4IxDA2kZ64jH8oejhIlvm63rfbSG1HujyHLxOXasN7/0+SQgJ3WCMJxSp2kU8jknBNFIRSbBCA9tgvBV61d1S7v5TS5sK10hRKGj20cf5SVc6GwpAeMmdpVslNIrs6DjkNR2jYAhAm0U2eFHmnAQGk834a1fBky29PdCVStQB+xhtZkIG0MIG35peB3cZ5K+tpAfBk6U8+H8PBbMfLE32NlKLTlsjM1ujVvnl0dNDRjGr5ddhP6NMtVElUvG6aX+RWFswkMRrgenuKVUOPky+E1PdPDA4uQMS2LIfCQMqoiKE8BVET1vfOssRq5ozYKdtuWhaqIdKFhBHxUd9UCJygFSO5qgyHq0jl8HIR1JfdPhPmYxD8sdzmjg5jICDN8rvnKT/avoRn3c34+eXrimUamVuvXQB/WexTZpnQg/Q7jLT4pc4TSqR09jx+Ud+eMqb1s76wDkRHko88T4BpvXoibUnKUYMS4ZgJHEUb
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7500.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(38070700021)(3023799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?WDs01SXIv5WlEMIvYIICZ/ceaczfrZJJuZDd5/iq2D21gauNpTz2lIzBjeTQ?=
 =?us-ascii?Q?4qvbnXXZYMMUAUNdF/dCUWtW7ZYDaskA4AOnDH8vHeNdpZ7W9nA0RaAMKGXw?=
 =?us-ascii?Q?HeKcWvhUT4nXt6l+Bd7XUYmtabCxnOq4SGKlpSoMHOCT0zb0KpXBGhaUWNwm?=
 =?us-ascii?Q?xCqknZ6XUfmWNgaj8ecqimmN0VF6IRRLl0fMt4WX72k5OhEx2U5d10DYGiHX?=
 =?us-ascii?Q?HT0FEzca2xr8t9JO90ONdwfVzVILcTeYuXV6NMgAmxZX/+8PTboLREkyScMV?=
 =?us-ascii?Q?sagigRCjFujomllfgZe3KTWsMXR79P5RwAwbmtyMYbvUsoL0vSI79Ss8PgQu?=
 =?us-ascii?Q?SqPAV9/5rw1mhCjbgaSHpSJnNx2FHXT7kyTMamj3oCs0DVS98CkYE/gNYsgP?=
 =?us-ascii?Q?ZoG1PnS3GvopCH2Bf2W0yCb0VIQwEHvs7V4WBZnHDkPUKXow1SsRo11++2eR?=
 =?us-ascii?Q?utF1NbQZhObeLjUuekU/H8vUNOPhpoTKS1KlzYiUmT/qPT2M8qL6QBPASdj9?=
 =?us-ascii?Q?hlnudG8GHfyBoYwaL9jqGJ3WxLD3/N7IXL+0kMivLmZUMGs+Z1XRapGhGLDp?=
 =?us-ascii?Q?QdS4fZHsGLaNIe1rbuCj23pHWlUCcAh1cZ61QmtQdzpFdkKw/piBdQw4Dyja?=
 =?us-ascii?Q?lQPFnvbH/vMifkAN2Mqc+AyHZlPtSYkyw38z8flRYwO6Vw9ZZnEr5h6s4joX?=
 =?us-ascii?Q?Zsykt/m8ETSIUS7E1kCY3pqq3e3HKLQ2IP0hZOouB/EPYXcBKsgQP9LskdN4?=
 =?us-ascii?Q?340jumZVIaPnDAVsZMqR6tfKWKUQdtdRNVOX5DgFeAfW/EoCoudAlUBOmo1e?=
 =?us-ascii?Q?XC5nTPNW/0Em54EYQA77uULmV0iGPDRU/RYpTrZ2gDGEG+kUbLuXLQcjoZOb?=
 =?us-ascii?Q?g/ZBMl+Bko4WWaJAhCxZPQZz90pMobuSD81BNIhH5RjqJzN0sS1qLSzpSlhk?=
 =?us-ascii?Q?ACU7Hyj2Fg6fClt/25zKDFy1u6u+35r7X+geXV9z522lv9HtjjSpvGQ6hoKH?=
 =?us-ascii?Q?seUBOnmzHp6tdeEC5c7Gw6t/Hxw4eUyr3ESBoybNirKZwwy6f1UsVQdPI3Pp?=
 =?us-ascii?Q?CcwrkOdgdeZdzqFPKPIPNGVpAZm/pinH2lhRCUyio1cylXosqs+SPsAp+1Kv?=
 =?us-ascii?Q?Jo/gtHuW4BJ6UflcU5HfNujJv7XwDJ0PR9IA5mMUvTfyroX+pbpm3Oel0Ga8?=
 =?us-ascii?Q?Ym/5qO1zWOjlBB8la1UweDhHHEc7z5VppSN5L0UTRZ59HW94MMWqFzTW1m7U?=
 =?us-ascii?Q?YPzngAHBfGJdSbfKIhH70fNCVqK/9wWIEAXMUN+zwfQ9FoF5B2BmGeAvnrnw?=
 =?us-ascii?Q?AKPsDLpf7rXh9MuX7qygEx6G+UFOitHOdLIpcdcKQ5H0am8bwbamBHgtnUCL?=
 =?us-ascii?Q?9tIDOvFR09ZI6IxQz9tj7GcSIbjNHDTMLLfJ19eNygECuUT15IP72Kczk3pY?=
 =?us-ascii?Q?oNAxqPB6Q7e6MWi5HZlJqvPSVINgWW+OuH1szPHu/qXELFGwqKy2+SzRqIAd?=
 =?us-ascii?Q?UR7vu1wZ6RosSdw0NTYruwlZ3tYpUkAVUVIgRvljenlCPwtOdxOegcPJe21M?=
 =?us-ascii?Q?q8Ot195XnJ5Hu2TKjAX3x3c1/hhJ8kqBw18stzpq4UkDvQ9kHvHFg05ww3BK?=
 =?us-ascii?Q?shc8ahIWyhVdY9YKZZJgoWTQ8OwA26LWJPaolOG5qlMiSRARCY8K+FwIRW8n?=
 =?us-ascii?Q?dNXOEFXIpEMjcGaFZYxATm40NYGhiTuXVF3FVooxbt4/Ybic?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c34a5d-44dc-438a-08dd-08deaf028c7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2026 02:11:01.4686
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j5Nr914vMQH4xZo1LpOgX/wAs717WhTr2UBiM7bB4X1LQn0BaVm/Iu7pr+5nOPAjUFsx3VfpFA3DJ6uVXBC5mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11351

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to
> consider:
> - [High] The IPFT Add request specifies the STSE update flag but omits th=
e STSE
> data in its structure, causing hardware to misread the CFGE data.
> --
>=20
> commit 00a023617c26cf31c0233be20200f834604aaeaa
> Author: Wei Fang <wei.fang@nxp.com>
>=20
> net: enetc: add support for "Add" and "Delete" operations to IPFT
>=20
> This patch adds "Add" and "Delete" operations to the ingress port filter
> table (IPFT) for the ENETC driver. These interfaces allow the driver and
> switch to classify incoming traffic and apply specific actions based on
> a precedence value.
>=20
> > diff --git a/drivers/net/ethernet/freescale/enetc/ntmp_private.h
> b/drivers/net/ethernet/freescale/enetc/ntmp_private.h
> > --- a/drivers/net/ethernet/freescale/enetc/ntmp_private.h
> > +++ b/drivers/net/ethernet/freescale/enetc/ntmp_private.h
> [ ... ]
> > +/* Ingress Port Filter Table Request Data Buffer Format of Update and
> > + * Add actions
> > + */
> > +struct ipft_req_ua {
> > +	struct ntmp_cmn_req_data crd;
> > +	union ipft_access_key ak;
> > +	struct ipft_cfge_data cfge;
> > +};
> [ ... ]
> > diff --git a/drivers/net/ethernet/freescale/enetc/ntmp.c
> b/drivers/net/ethernet/freescale/enetc/ntmp.c
> > --- a/drivers/net/ethernet/freescale/enetc/ntmp.c
> > +++ b/drivers/net/ethernet/freescale/enetc/ntmp.c
> [ ... ]
> > +int ntmp_ipft_add_entry(struct ntmp_user *user,
> > +			struct ipft_entry_data *entry)
> > +{
> [ ... ]
> > +	swcbd.size =3D sizeof(*resp);
> > +	err =3D ntmp_alloc_data_mem(user->dev, &swcbd, (void **)&req);
> > +	if (err)
> > +		return err;
> > +
> > +	ntmp_fill_crd(&req->crd, user->tbl.ipft_ver, NTMP_QA_ENTRY_ID,
> > +		      NTMP_GEN_UA_CFGEU | NTMP_GEN_UA_STSEU);
>=20
> Does setting the NTMP_GEN_UA_STSEU flag here cause the hardware to
> expect
> STSE data in the request buffer?
>=20
> Looking at ipft_resp_query, the STSE data (__le64 match_count) sits
> strictly between KEYE and CFGE:
>=20
> struct ipft_resp_query {
> 	__le32 status;
> 	__le32 entry_id;
> 	struct ipft_keye_data keye;
> 	__le64 match_count; /* STSE_DATA */
> 	struct ipft_cfge_data cfge;
> } __packed;
>=20
> However, ipft_req_ua lacks this STSE data field, placing cfge immediately
> after ak.
>=20
> Since the hardware parses the buffer sequentially, could this cause it to
> misinterpret the req->cfge field as STSE data, and subsequently read past
> the valid data into the zero-initialized tail to populate the actual CFGE
> data?
>=20
> If the STSE update is intended, should an STSE field be added to
> struct ipft_req_ua? Alternatively, should NTMP_GEN_UA_STSEU be removed
> from the update action flags?
>=20
> > +	req->ak.keye =3D entry->keye;
> > +	req->cfge =3D entry->cfge;
>=20

According to the NETC reference manual, there is no STSE data field in the
request data (ipft_req_ua). The STSE data is the statistics element data, w=
hich
is maintained by the hardware's internal buffer. NTMP_GEN_UA_STSEU is used
to indicate the hardware to the hardware to reset the statistics of the ent=
ry.

This is a false positive, please ignore it.

