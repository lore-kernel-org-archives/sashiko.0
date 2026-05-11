Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013061.outbound.protection.outlook.com [40.107.159.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66C87081A;
	Mon, 11 May 2026 02:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778464916; cv=fail; b=Hm6Yxx80jqzKeijuldfURjFfZEqEKkz6o+kAUdguHSdJObm0tL88NSY11NC4BhrVgpS8R71oz7oGtvCCuXFJMMz3AkY/5WdjnAZnhCK4N4LeR9NdU5G6b+rBEQgEmWWD5iO3v+PbHVzfcVVQxpTuBJovtdOuqeXJJcDFlNimgK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778464916; c=relaxed/simple;
	bh=XG9+j5fWZFqQXXJrIyCHZ/0OHzpFcpSi0K+qUSJ6CnA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qpDKbi7SA4mVfZKiTj+qRedsCaUqFun9OR0840ezdS5F/he9VmK5+u245t6ZSz8sO5NmJXpWHikX+I7qSeLW2mGDYz6ElO0XfxEkXz6Nh7Uy+oDOy9OcwpUPsg8CmEnmj/xngGphj9ffw6VMBl5hSRD+VPuRzU5cVJHHOPruXYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TPH7GtD2; arc=fail smtp.client-ip=40.107.159.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TPH7GtD2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2CT1uF1m1Gp51LyAswvRFQMkmkGErET/LsCdSyF+vrN3QrAao9N6ohDbrpXFdZkqfKb4saIDnkdADTFDTGL9GdDGRNHuyo+IwsIgNTh3gbirAx2cPsMgvBwud9nXHi2mx4w/D4FZVIYfpdPn8bCqHL3yBWFgPsHrUtl3pF4N3sHuF4K4TAVrcT+XIjS54T6R8Db1WBAYIsqZL3vpavCnrF3QViryq51I8Rxe7duPQG3g7QyzD4Yuo+YIiInNxfY1EWFqVfqanS0vpZzxQX8k3+XAsvC35mnjDGhkqo8e7QHNJffB+iINylxLL74DB0i7waBT/Vyv6t4AMwlHx6kuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TgjKsh0MhRKgFFolD1IigJc841SqxOoMQYQq+qqL/mQ=;
 b=GTOkZ6Q2D49hQKcxK7f66YZaWKeDQrxMRSbAW/lqHacoOMJLUCiV/9mZ2zTub8GyhZEgn4+h9pvUjKpDbxNziUI0nRdcEzw7FdGaX0LRtI0khePNoMv/AaNRg744OyIQOVQtkFLTJD1JLBSWcfKxTUZqcVxWim3yevX5xAqwOrUy399uyXMPlvDIfE8j5CUNmUQ9x+XkUeDhCnZeAjTZ64UIgXGBlONJmOOTkJnCBtJoFfMq1Ukzjf/lER7DsIK7PMqY5AtkhW0dCvREMLs7FVirrx6VxDpCDMFMPzog4Rj/938E3rktYYv1ePTDlpSNcjRQVZS/568OFsd04QJwMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TgjKsh0MhRKgFFolD1IigJc841SqxOoMQYQq+qqL/mQ=;
 b=TPH7GtD2yD4CuLH5Dd9T1426zfHlYoGPHZy5q9o1hM+PLyHGPOF/r/QoNbMGwXL9F+3Dqfam63mOrPlWonfj+KyjesZI96xCXrjTFwkNVmonr7k80HD5bgbiDEOOYZK8uwnUMDg+Qut7kdEFLeljm5CAGIsSJrU208RDZz0StqGtMJ487u+ztrRGpSW08lReJZkP7nlnUzQB25glBdDSogg0mM4hMQsBXMD8qnPydLwQnPekdINa0CVz3AONjfmFUzCfaVweQz/XLorzsRkjt+igs15CpBtqOO5RxPF/kJEFOa1mJi41YMuzQgpi2hCy8Rz1gD6/uV9jbqyxwfJovA==
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com (2603:10a6:10:1f4::16)
 by GV2PR04MB11351.eurprd04.prod.outlook.com (2603:10a6:150:2a3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 02:01:51 +0000
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7]) by DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 02:01:51 +0000
From: Wei Fang <wei.fang@nxp.com>
To: "sashiko@lists.linux.dev" <sashiko@lists.linux.dev>
CC: "Frank.Li@kernel.org" <Frank.Li@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "robh@kernel.org"
	<robh@kernel.org>
Subject: RE: [PATCH v6 net-next 06/15] net: enetc: add support for the
 "Update" operation to buffer pool table
Thread-Topic: [PATCH v6 net-next 06/15] net: enetc: add support for the
 "Update" operation to buffer pool table
Thread-Index: AQHc356QOmzuSm991Uy4YWZhyqKJfbYHFdkAgAD8S+A=
Date: Mon, 11 May 2026 02:01:51 +0000
Message-ID:
 <DBBPR04MB7500D614C25B584703C43BDD88382@DBBPR04MB7500.eurprd04.prod.outlook.com>
References: <20260509102954.4116624-7-wei.fang@nxp.com>
 <20260510104833.5F0AEC2BCB8@smtp.kernel.org>
In-Reply-To: <20260510104833.5F0AEC2BCB8@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR04MB7500:EE_|GV2PR04MB11351:EE_
x-ms-office365-filtering-correlation-id: b65ba409-3465-47da-1835-08deaf014485
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 583TrgI+6KMtdc9rz0oPOOfiFoQIua4U3C5owywWtJm1LOEWiUhJpO2saynS0wXOwY19mmA2HWqLsGua/Vp+JvZNx35E+qxXbTkbQxAjA4tVlWRgEBPZg3C0+RteTOjgKETwL2ptX3TN+RJMyG1Nb2kj8/MRNLrbtbaX9CDfmU1Mh/yNlWr+F8M3qwNO3ZUX9+pRL+hg8hRNj/mvmCYSdlARBeuOreo/2JDupVQGKqtShf4i4zUci8L84DjxDNi51WZwrdqTm0W6ltMBLUVVDO9JxHum54zdSGS9ZwFf5mGu/iSeCVC623jiFlOLmpE16OyOini34kPtRUFIHZ1O+1IheCfufxVeAktTv0cq9QumWfsJQ/f8ap1tfiK1xZ/zrG+2a6nx1OmPl5oeCe8OyhsDDDSL7hScyaCAKj/027yeK138WLAGqtrH15EPkgnM0VRhUnyctkR8o9ZdrkOTTX4Pw3YuIWllEz70SfIssQBaA8nxZNxqcgwgKCLEHXewx6FV66GLQIYSb/aq+bsm8Dlwolv4Vr3DIoxAKb+Inti4bFfuSka7zXFHAnQCThsbCJChJHyhZ2yRo1zf/qy74zJ2WoknEPqcmJYaSyY0wHeDExLfpOLrGDoe04QdwSQpaOe+CZR7eaE+gsPkbqkgwNGlgvKkkGd/QNI3zRexKY2AAo0Jo2xoICHlcl3JR+uYpS/LpDFuhzG5rFu09B8uN43na1Bum09sMOom66ppbzrEAhu8KE1Q7pmNp6w3B5A8
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7500.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?zjBC25Xoh8FTO2+KScPMkQsUZF6zCzfxPs316+CRHFa8wCR+mTPmZAxNdWBg?=
 =?us-ascii?Q?Ahg+Lg+1KtRaVqIVNFGIeJnUpaKtTXi5z2FYqozy3pAlj6kQFZM80a9gyfSK?=
 =?us-ascii?Q?Lw7lDEfqci/PXnG85aJCyYLCoNBhlj4iDRX+YcWH2ezjmPC5dT0mK3HkEuFR?=
 =?us-ascii?Q?FYnFK0SvsI0fucvu2LXh6OMKgDxj9rbifY6Q75YssnaSTM0fogldsyUwBnHG?=
 =?us-ascii?Q?PD3xP580tdU0ZeyfrzaKz21T16d0jTMnxIs5KGgKT4BqX71rnTDQXkFgWx9/?=
 =?us-ascii?Q?h1IX8jFjV+WO1lePHZi50rEikUeHYBspDtOfOocsD+uyq5RiaUabW1kyE7WF?=
 =?us-ascii?Q?LcdMUt8NlbTVnTN0aVodhHh/m3nTn6p+biAd+k8Q2yL4hewahaZbGRiHs6Sm?=
 =?us-ascii?Q?tSOmzqhBGe8ZlruL6WtFuUg+/7uzDebwRahtQASRlQ1naj7expDLrGfX4mIo?=
 =?us-ascii?Q?MxFmUKLJhevhcD56cC6TqNmTunJXhg6YTPeDhYUfLHj4tyY+Wl7NYHHiRGqP?=
 =?us-ascii?Q?pyEm8Vf2aXd6692/WPdBVaw8Vizpt9X+3lAzKyOvuXTV0g5ZAoMXYXRVE/gC?=
 =?us-ascii?Q?oOOm3PiyiS0UPMxQVDXMh6rUIc+Z/9Yr48jp1sH0GHpTmR+I0BXsiBgUlCbB?=
 =?us-ascii?Q?TZkDUlbHVuzmKNjbzw+IwyW5Ah5iImUzQWQCj/DEMJk4mLdepJM/Dvp15scv?=
 =?us-ascii?Q?ooCdmes0W3KBif3fYDekFjb8u+35ijwRJAK7SYwIO8emlNLg4ncwoRTBF3uo?=
 =?us-ascii?Q?LBbcAOWDEVClhqWWy1Iun1booDQwTR7FUCobzRX2SR1nR9sSU1/kBxiL1ws6?=
 =?us-ascii?Q?z7jBa1aZA+JrIxR3pMe4OPuIJQmUdhgtisn4tFOsmD9c+V2xDok3bRJGnR81?=
 =?us-ascii?Q?8wnWxz1mxtJoT8UJnH5Ser1kfUxqmXRGSjIH5tlCBPBCgxTjYsrp+WeQj6zZ?=
 =?us-ascii?Q?/eNVAIABNgXObnOaAXVaNzmobO36rTJv8j/4lgMBB4Wnm5LFGjeU56DxcQoG?=
 =?us-ascii?Q?P5DbEt1Od0X8VbokFMnItLIoKN3u8jY65sw3gV/LzBsk5sPrwthSO0CnWlfM?=
 =?us-ascii?Q?DQM40j89H2J5OSi+tSDR7wRLjMq1TSGITwikTFjh/SaMQlHtQBUOfhq7v6O1?=
 =?us-ascii?Q?lioud4yrXswlkeVNcEP8G8N0AI4xcVDqZVk3Dfz438GZUuRiK4Vr4nKgNrRt?=
 =?us-ascii?Q?BJse8v0zX6+Co3MyCCYVh2KKMja5cSMQsH/2UNcLY0DnodpbidFNaf/uwU+p?=
 =?us-ascii?Q?cN+TK4xmqvAtAJ0fZEPMdXHwZLa7cgC4DkCARZdYy+19nbI7l/rUI6M47xro?=
 =?us-ascii?Q?6qADC0eKKvUpNQwF8T42UwYriCizPW3PD8kcXt6XnlaMAsD2LWdJYmiNj54Q?=
 =?us-ascii?Q?8QhLeZ+JeUwNANQETrYp5jQM2jJp40sMst+RQSxHOZ7ESnKUB3zvWW8cR123?=
 =?us-ascii?Q?A8q9nce0fevJV9UW9yHAL/h7knami9doCXpOyCngmBdNOhxIGz3qcn0XU/Hr?=
 =?us-ascii?Q?Ggh7PDvbstVmY50HPK8MOUDw0RWU4eFMEeSARLn2bi7hq0VAxmkG2EpmuARb?=
 =?us-ascii?Q?l4UwajRS46Mrq9Lol3GCEsc+jDaHmUXTQfD3LF7LFEJr3UmxOLjO9hruddn5?=
 =?us-ascii?Q?wtO4TZdsrqU4VCuE7LSWJNuhXnuYeKAm/Ky0f5jPOvT0TZZ7CrUZmpg/myny?=
 =?us-ascii?Q?ldhXSXqW5ZcVkgDT57slKi2f+3pERzMdL+mvoWP1aZPSkG1X?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b65ba409-3465-47da-1835-08deaf014485
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2026 02:01:51.2027
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F2+mpKJYkVVOukiii2VIM5mz9YSyc3KnlDWXIbagUwDYaDUF/ifg68Uqu68l5sffHIkkEO7X4dVP4qMEPhNMVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11351

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to
> consider:
> - [High] The BPT update command incorrectly sets the `BPT_UA_BPSEU` flag
> without providing the required BPSE payload in the DMA buffer.
> --
>=20
> commit 04028be08f5e1d61341410aae72c568ebdb38953
> Author: Wei Fang <wei.fang@nxp.com>
>=20
> net: enetc: add support for the "Update" operation to buffer pool table
>=20
> This commit adds the ntmp_bpt_update_entry helper to support updating
> the specified entry of the buffer pool table.
>=20
> > diff --git a/drivers/net/ethernet/freescale/enetc/ntmp_private.h
> b/drivers/net/ethernet/freescale/enetc/ntmp_private.h
> > --- a/drivers/net/ethernet/freescale/enetc/ntmp_private.h
> > +++ b/drivers/net/ethernet/freescale/enetc/ntmp_private.h
>=20
> [ ... ]
>=20
> > @@ -175,4 +175,10 @@ struct vft_req_ua {
> >  	struct vft_cfge_data cfge;
> >  };
> >
> > +/* Buffer Pool Table Request Data Buffer Format of Update action */
> > +struct bpt_req_update {
> > +	struct ntmp_req_by_eid rbe;
> > +	struct bpt_cfge_data cfge;
> > +};
> > +
>=20
> [ ... ]
>=20
> > diff --git a/drivers/net/ethernet/freescale/enetc/ntmp.c
> b/drivers/net/ethernet/freescale/enetc/ntmp.c
> > --- a/drivers/net/ethernet/freescale/enetc/ntmp.c
> > +++ b/drivers/net/ethernet/freescale/enetc/ntmp.c
>=20
> [ ... ]
>=20
> > @@ -749,5 +755,38 @@ int ntmp_vft_add_entry(struct ntmp_user *user,
> u16 vid,
> >  }
> >  EXPORT_SYMBOL_GPL(ntmp_vft_add_entry);
> >
> > +int ntmp_bpt_update_entry(struct ntmp_user *user, u32 entry_id,
> > +			  const struct bpt_cfge_data *cfge)
> > +{
> > +	struct bpt_req_update *req;
> > +	struct netc_swcbd swcbd;
> > +	struct netc_cbdr *cbdr;
> > +	union netc_cbd cbd;
> > +	int err;
> > +
> > +	swcbd.size =3D sizeof(*req);
> > +	err =3D ntmp_alloc_data_mem(user->dev, &swcbd, (void **)&req);
> > +	if (err)
> > +		return err;
> > +
> > +	ntmp_fill_crd_eid(&req->rbe, user->tbl.bpt_ver, 0,
> > +			  NTMP_GEN_UA_CFGEU | BPT_UA_BPSEU, entry_id);
>=20
> Will this command fail due to a missing payload for the Buffer Pool Statu=
s
> Entry?
>=20
> The update action is instructed to process both CFGE and BPSE data by set=
ting
> NTMP_GEN_UA_CFGEU | BPT_UA_BPSEU, but the allocated struct
> bpt_req_update
> shown above does not contain a struct bpt_bpse_data field.
>=20
> Because the provided swcbd.size is only sizeof(*req), does this cause the
> hardware to either reject the command with a length mismatch error, or
> unintentionally read past the end of the provided buffer?

According to the NETC reference manual, there is no BPSE_DATA in the reques=
t
data, this data is maintained by the hardware's internal buffer. The BPT_UA=
_BPSEU
flag is used to indicate that the hardware should reset the BPSE_DATA of th=
e entry.

This is a false positive, please ignore it.
