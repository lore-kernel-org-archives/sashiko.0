Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023102.outbound.protection.outlook.com [40.107.159.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECBA3839A6
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 10:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.102
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778583400; cv=fail; b=MclSPEZU9yl101u3WusR7X6V7cYEEgfX+8oQuEtrcCqlqlv1TtmTskGXM1rsAWBMhr7Jeh+FCs7gm17UzAzK+hiKlQGYy3JfiRMbztDpR5M65oU16Y57J8Hm+vjRfiNabEcelOIFnxopvnLHERGgfjMjOXmH4I4XccbswUbe1NU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778583400; c=relaxed/simple;
	bh=l/u1OcmNNLJxifUnzB5rZCTAVEpZ1fLXscHQIsCK/Yo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=udIsDhOVtt/5YZfD9MFV0Jz2Yfd50MfTHfUzWGcqlKELLGQd/GR0HO0pcU37RdwdqclmQ7nGZNBuBJq+yyfcqc5/0XmWmiEnMWHPCzoclcrKbj+5qdNzryBwFfiQm1y0NpYvARkJFbb760WgEGl8v3Dlv3Aahw0aXy80va1QHhE=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=r6SUCVlQ; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=r6SUCVlQ; arc=fail smtp.client-ip=40.107.159.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="r6SUCVlQ";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="r6SUCVlQ"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MeZbueiwyYyfmXufCAUaTTLoZ+qRR7P8vQBiC+GjI+DHYkchpikPuOj5+gDqt+Z+o8PfPslsG4mMHBbcxAkfAlnYjemOqecOyoxThTpcl951p2+CYGbS+MSaD0ijbC3u67NR+fH5DbPyGGxMVTfUP9PFbqXUI7rbfxBXa4+IpMCFpnQXLxZsc9yP1uWtPyhxI4jVCWiuU3vWK+B5/d7bFx6poQKo0ddCgDx6GVHHNxa4sA+oAR5y5GdpPTvmlqmOGfhfyutFreCRzWIHM6CYOQSDncOF8tceabdMcZ6ehluKb+upFMiYCoUPJyaYrSSr9bZ1l4mJ1Oovjp0DKW4F6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/u1OcmNNLJxifUnzB5rZCTAVEpZ1fLXscHQIsCK/Yo=;
 b=EDNSARnP9B2RYs6PExPn71gaidMlITeErWRrSQfajKTHf1dMbNU+popxHPNKZfPe0FZndq1qJbnTGCD+ygA/umahKsVaFbvLpf/y9tAatDzKSXlYQRY9wNajbBWJy/VK/Wa5H89sQJDTVtxfgh9vseeybDdMtgniI/Pk3Bt95XWJhnm9vQiJDQpjBuWUML0ZrjDSR2AK18Fr+vzn7Es79L4iWlRyjKPzfbtPOcEtsAQY/EyFh6ADsGEmUiNdKtuoAoY6cueZfCb+Xqu8BdczwD1IjwrJsMvCvW1NUDXamljWyRHZLjvpVqkpyNv/DXVLBIVlpCOd21a0T8oU/Y11PQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/u1OcmNNLJxifUnzB5rZCTAVEpZ1fLXscHQIsCK/Yo=;
 b=r6SUCVlQHwtfJYQMqkoLz9UTjYuSFfMtMV5/hCRznxrO8TToSXAsYtOAZL1y12OUo7cLuO6kma/z7BRXVx1CyIi4tBNcdtcjR62ymvRtoVRU88GR2zAnz+5AyxWl8Lc+YqObnH1xdhNxzv+nd7VvdMeMRgomNP9WJ1m8C1XDO6GzBr9iFlsllNfCFHpV8ACuAn/T4pW+MemfZCLVAUKmdEm2tPVw9nmnnHqSUV8kPq6CXdRB0wfo6Lq0IOJ5XGMcyUqgEMZMZ7BSyBgmTG9ulUDDpKRBFF2aqlCt8YVP8bjVC3tlG8JnhsYHHD2bggt6L0y9WhvW3JoruOi8XkcVVQ==
Received: from CWLP265CA0408.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b6::21)
 by DU2PR04MB8629.eurprd04.prod.outlook.com (2603:10a6:10:2dc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 12 May
 2026 10:56:33 +0000
Received: from AM1PEPF000252DD.eurprd07.prod.outlook.com
 (2603:10a6:400:1b6:cafe::1e) by CWLP265CA0408.outlook.office365.com
 (2603:10a6:400:1b6::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 10:56:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM1PEPF000252DD.mail.protection.outlook.com (10.167.16.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 10:56:33 +0000
Received: from emails-3418844-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-220.eu-west-1.compute.internal [10.20.5.220])
	by mta-outgoing-dlp-588-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id C3A8B80472;
	Tue, 12 May 2026 10:56:32 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue May 12 10:56:15 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zHEKyTSoun0VECmPnDun3H8KqT4ddcLjfpM7SEvLT3fb944SIigzTbOdUi0qofCGPUZg6CTFVW8P0NT8C069BNCeFmjer4ukWXtHuyEEQmhCZwU7Rvgkquvw2Pt6uuwWVoGUqjeUuuDJijLIDPPUhf0RYOou00KsM+Ltrnm5o5JuH7zE9BjL/qWHtd1r4Upgo3yoOLcHghl70RXyM9gMTrtKzjnY1Lw2w845uH+uTV5IP2+Og6/8CUdk8L+IO6GPE8OwZDaY50m4J4K3rdwX5G9XX32AToISbLrsqcj2kqNLEH/4cYkqTMMmnCIISCTrpQNhGpVDvUOlgIigClUj9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/u1OcmNNLJxifUnzB5rZCTAVEpZ1fLXscHQIsCK/Yo=;
 b=aNKd5mghRIqlbIrIbrmUvcFMFqS57ZUswaoaKlmyplw7sODEWnL0HuABRcW2XlEKO7GP3kyW7BJ+kBNczMVslDJf3W6L6/+QYKXE0OkQ+LUvYh3b5y3crareH+5nM+aoaVcVGJMlpA5fqhcwbOSYCJ7bRY+LHuoYRuXc2c0rlDtw8fSeypksAqZUvYBeIV4771vwp0sr7S0xwqbti9SMdNZqPZsJMyS0rVcQSPKbw08gP4Bk4fVeV98lJHepqc0rI/+IXuY2j/pNjfqk+RKwp1I4pUCkSWw/KsVrEvopU96aZvAVmeLwgT1+BaqVyz01A+DHFMMUPFeMUS7a7xPACQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/u1OcmNNLJxifUnzB5rZCTAVEpZ1fLXscHQIsCK/Yo=;
 b=r6SUCVlQHwtfJYQMqkoLz9UTjYuSFfMtMV5/hCRznxrO8TToSXAsYtOAZL1y12OUo7cLuO6kma/z7BRXVx1CyIi4tBNcdtcjR62ymvRtoVRU88GR2zAnz+5AyxWl8Lc+YqObnH1xdhNxzv+nd7VvdMeMRgomNP9WJ1m8C1XDO6GzBr9iFlsllNfCFHpV8ACuAn/T4pW+MemfZCLVAUKmdEm2tPVw9nmnnHqSUV8kPq6CXdRB0wfo6Lq0IOJ5XGMcyUqgEMZMZ7BSyBgmTG9ulUDDpKRBFF2aqlCt8YVP8bjVC3tlG8JnhsYHHD2bggt6L0y9WhvW3JoruOi8XkcVVQ==
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by DB9PR04MB8316.eurprd04.prod.outlook.com
 (2603:10a6:10:246::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 10:56:12 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 10:56:12 +0000
From: Josua Mayer <josua@solid-run.com>
To: "sashiko@lists.linux.dev" <sashiko@lists.linux.dev>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "wsa+renesas@sang-engineering.com"
	<wsa+renesas@sang-engineering.com>, "robh@kernel.org" <robh@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: renesas: add support for solidrun
 rzg2lc som and hb-iiot evb
Thread-Topic: [PATCH v2 4/4] arm64: dts: renesas: add support for solidrun
 rzg2lc som and hb-iiot evb
Thread-Index: AQHc4TI6DIjgSD5sSEuZFY8/MbolS7YJuZ+AgAB/34A=
Date: Tue, 12 May 2026 10:56:11 +0000
Message-ID: <06060688-1d68-47ea-9617-0cb25bfa3c67@solid-run.com>
References: <20260511-rzg2-sr-boards-v2-4-82aebbd27891@solid-run.com>
 <20260512031832.6C52BC2BCB0@smtp.kernel.org>
In-Reply-To: <20260512031832.6C52BC2BCB0@smtp.kernel.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	GVXPR04MB12057:EE_|DB9PR04MB8316:EE_|AM1PEPF000252DD:EE_|DU2PR04MB8629:EE_
X-MS-Office365-Filtering-Correlation-Id: 191e06fa-3bba-4dfd-fa97-08deb0152135
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 5+7yErhY0BPxj/dRAPgz8zZfYGhPvGcieVbce+1LQLZexGMwVKY7Fd3jqfVCdjs3AXqEwsBVznHUnIOdaK81pCbrNZv1+G5TxKM+2Xemi2M8DdBL/y0QH4ndD4hbbeU9StaUpOUNFNMn8qck9HoiGwoq2FpXUupT/LyMO0Do9myr7FyHi+sZ6ieFuDGy/y50ZxMyUATXprZLcEtHBsJwHGSVr+Lr9p1xSHfWcIMSwPB+YlQiqbdVijX7cXHuoGIhvYBLSw3HkAki7VrNt4QY7G+Xkkebvq9e61mxxn7aktTb46smguaXbDGpK2ykqFQMJSvfkQMNaJr+EnY+gvEafmVI9d6TpWRJQUS5T9n3n6lImZjoJPwrG5ETNXAnRGKHOIIK84u3U0dAx9FQnTQLn38VCWt8oLJswHmUtGRElLAbYWc/4I+sXFvq4dMx9BrmgLTqWFAqcf4Y6MhA/BS8Xzon+I2Q8XqOLgeUPcPAEeY9Sqpqu9hdx9P3/UG2PF1Nk3XXGGCHxdZg7PTt4JuE/JWrfXcAFCXJNfbRwfC0rhINc5bx4lKCzxnPh9v9W8pCXbCNxjp+NOM2IO6NjrV8b2LHs7s0xRYepE+5V7YJ5ASCZSyqxAWTfZUqXaRouVtkjN0JJD+5h2PYXOdwGePoBQkZJ1qI6L1t97oaZADj+lQ+xdH9vspEkplpllSqtXwtEPU2SkJVtDpM4iddRWnhPkwRpCKl41k9vC5HFT+b276yMnTIM8Ei0U1rmbWcEd98
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <588FE87DDCB1F94C8866E53CAA72DA63@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 XHeiGJOTWSgy91bOqnuuZQql3YTPqDw2p9ZT/wEWfMi1FFqYXt8RhbsAyn5jieKkNHAuGKKwV4SOGoYpal088P0CV1WhDx/5rJFmVvFd8RUz3Jn586ym9HELCa50KEj3ADnFeId0SLnHgiQb+5nidmFwqUuP0H6ZlJwi9s3cnmFoiyEjflN7dXKiCaAUs1mYPUEVVDSYZG5Q6r3dfh7jegELDpvFaUQJUJ/WlVGK0B/03OtqA9MX4uYoMaUAfCplJxs+S3DGqkChhpk0GYvHXLRuviHJozAXQSY/XOPthuot9GlZvTKt8IqmxVa6IDU6b+4izse6EnWVrXjYFmbTww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8316
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 15a2c27090964c238f950a3239817d4d:solidrun,office365_emails,sent,inline:fb9b556a28e34907b812cdd40e928ce2
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	51ed3108-36df-49f0-72b1-08deb015149e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|35042699022|376014|1800799024|82310400026|14060799003|18002099003|56012099003|13003099007|22082099003;
X-Microsoft-Antispam-Message-Info:
	OTyQkol5qiz0CHdCIQaJEPUZ7D9nvyE02YxiX9l/7n3ZX2ERr4o2jt+ccnGieXQGKeP2TyTUiGOwzlcg/JX/0GSuIvesyuvNsj7ob+fxEqRamMUf6e+2RZC+vVmfyH1XaG2dGmu6xhDT8YFFVVF2v4cMD8N2OeYgmEc59IBilGNltNTmphm4vR7pcseZKelZQSFO1klmHOPPOLd/XMJLYhXiXmb9vpL9uGPOWhmpAOdKEdZvbw3N3tYm3ZsEDMBWUNFlwoedWG40gGpBAzK3yXIDhFO53jrb1rKutSp2gqW1b70jRdBVWcEVxaFFBrLuO7Obv3k3ReHBKCH2UVsvxM/MbLg/DoSvNDcPLBQnqE+WrKfMC6VWAJQmRoxyODILWw6R0QaDsMf7BmxqLzjYNO6eu9sa8dzSQMBQos87JSS3JQ+dUFcTf6A5LKqOnKCMm/MFUjGwNbQ8KuNNuPfpbBWxAad+sIUyhudi+Kbf8ApeqR0orhGpSjRMHrdygxLV0yfX1Ym4c+XjLg0uPIuN4JxDNdBov1oNUc/SEIWvtR/u5EsctuQWpAeStmu6gPfo3Rm4CJsysfBdmb0Zz5TZ46Jw2gsKVhnibARutz8g+myMTkOnSUusZrZ6qSWKwPGP7lS+MT17juut8jSNGDAOvD1egXJB7Kknn6SjJdcP5lhQGFtBgDil4prMNWVAJVNn0j5q2tL0R2RZZzuIB4SR3fzCJg45oLPvVN/zbkOCMMM=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(35042699022)(376014)(1800799024)(82310400026)(14060799003)(18002099003)(56012099003)(13003099007)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G9J/gH0G6rzVreIRCfba8jUvOuljtFu5LaeGgERZU+OvQU85SfCyYiS4ZFa90e7h0ZPeK2EbSNcusSutd5LSFumSIftKhyEs9gISzJIIiMPmfoi9k8yNK7e4oAF0JDrUU0jzjRW8AR4imllV3AXNsseJNy9py6QP6iu3L1MBmBnEf7RC4GXeJH9R0SM1wA3hWcuL3za7Kn39YYBapDjz5BW1d0oFIGocGkMtXbdvGLv7KGGtgWuxGwxctPfBEyg7K9qjl4GIxykhhSGJfkAVBb4Q4Qg5YAaXNAiIyPH9sO8tx419VISQJ6UhGeVU4dZk+UWLmxZ/tatVTtZpNwImZRiEsD4yRS54eJ1m0/GQbhPP78RbUlD0tThE0N2w3vN6gwN592dHplgzMVVwRCuKj6OCtL9c5jaNLVE/qIWefxLiIExJZyhNXrHcI12XPwb1
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:56:33.0159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 191e06fa-3bba-4dfd-fa97-08deb0152135
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8629

QW0gMTIuMDUuMjYgdW0gMDU6MTggc2NocmllYiBzYXNoaWtvLWJvdEBrZXJuZWwub3JnOg0KPiBU
aGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAz
IHBvdGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoNCj4gLSBbTG93XSBNaXNzaW5nIHVuaXQg
YWRkcmVzcyBmb3IgcmVzZXJ2ZWQtbWVtb3J5IG5vZGUgd2l0aCBhIGByZWdgIHByb3BlcnR5Lg0K
PiAtIFtMb3ddIEluY29uc2lzdGVudCB1c2Ugb2YgYCs9YCBpbnN0ZWFkIG9mIGA6PWAgZm9yIEti
dWlsZCBjb21wb3NpdGUgRFRCIGRlZmluaXRpb25zLg0KPiAtIFtMb3ddIFJlZHVuZGFudCBhZGRp
dGlvbiBvZiBzaGFyZWQgYC5kdGJvYCBvdmVybGF5IHRhcmdldHMgdG8gdGhlIE1ha2VmaWxlIHZh
cmlhYmxlLg0KPiAtLQ0KPg0KPiBjb21taXQgOGQ5ZDJjYmM3YTc3NzU0ZWUxOTk1MGNhMzFhMTdk
MDkxNmI0YjYyNw0KPiBBdXRob3I6IEpvc3VhIE1heWVyIDxqb3N1YUBzb2xpZC1ydW4uY29tPg0K
PiBhcm02NDogZHRzOiByZW5lc2FzOiBhZGQgc3VwcG9ydCBmb3Igc29saWRydW4gcnpnMmxjIHNv
bSBhbmQgaGItaWlvdCBldmINCj4NCj4gQWRkIHN1cHBvcnQgZm9yIHRoZSBTb2xpZFJ1biBSWi9H
MkxDIFNvTSBvbiBIdW1taW5nYm9hcmQgSUlvVCwgd2hpY2gNCj4gZmVhdHVyZXMgdmFyaW91cyBw
ZXJpcGhlcmFscyBpbmNsdWRpbmcgRXRoZXJuZXQsIGVNTUMsIGFuZCBXaUZpLg0KPiBUaGUgUlov
RzJMQyBTb00gaXMgcGluLWNvbXBhdGlibGUgd2l0aCB0aGUgRzJMIFNvTSB3aXRoIGEgc2xpZ2h0
bHkNCj4gcmVkdWNlZCBmZWF0dXJlIHNldC4NCj4NCj4gTGluazogaHR0cHM6Ly93d3cuc29saWQt
cnVuLmNvbS9lbWJlZGRlZC1pbmR1c3RyaWFsLWlvdC9yZW5lc2FzLXJ6LWZhbWlseS9yei1nMmxj
LXNvbS8NCj4gTGluazogaHR0cHM6Ly93d3cuc29saWQtcnVuLmNvbS9lbWJlZGRlZC1pbmR1c3Ry
aWFsLWlvdC9yZW5lc2FzLXJ6LWZhbWlseS9odW1taW5nYm9hcmQtcnotc2VyaWVzLXNiY3MvaHVt
bWluZ2JvYXJkLXJ6LWcybC1pb3Qtc2JjLw0KPg0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvcmVuZXNhcy9NYWtlZmlsZSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9N
YWtlZmlsZQ0KPj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL01ha2VmaWxlDQo+
PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvTWFrZWZpbGUNCj4+IEBAIC0xNjQs
NiArMTY0LDE3IEBAIGR0Yi0kKENPTkZJR19BUkNIX1I5QTA3RzA0MykgKz0gcjlhMDdnMDQzdTEx
LXNtYXJjLWR1LWFkdjc1MTMuZHRiDQo+PiAgcjlhMDdnMDQzdTExLXNtYXJjLXBtb2QtZHRicyA6
PSByOWEwN2cwNDN1MTEtc21hcmMuZHRiIHI5YTA3ZzA0My1zbWFyYy1wbW9kLmR0Ym8NCj4+ICBk
dGItJChDT05GSUdfQVJDSF9SOUEwN0cwNDMpICs9IHI5YTA3ZzA0M3UxMS1zbWFyYy1wbW9kLmR0
Yg0KPj4gIA0KPj4gK2R0Yi0kKENPTkZJR19BUkNIX1I5QTA3RzA0NCkgKz0gcjlhMDdnMDQ0YzIt
aHVtbWluZ2JvYXJkLWlpb3QuZHRiDQo+PiArcjlhMDdnMDQ0YzItaHVtbWluZ2JvYXJkLWlpb3Qt
ZW1tYy1kdGJzICs9IHI5YTA3ZzA0NGMyLWh1bW1pbmdib2FyZC1paW90LmR0YiByemcybC1zci1z
b20tZW1tYy5kdGJvDQo+IFRoaXMgaXNuJ3QgYSBidWcsIGJ1dCBzaG91bGQgdGhpcyB1c2UgOj0g
aW5zdGVhZCBvZiArPSBmb3IgY29uc2lzdGVuY3kgd2l0aA0KPiBzdGFuZGFyZCBLYnVpbGQgcHJh
Y3RpY2UgYW5kIG90aGVyIGNvbXBvc2l0ZSBEVEIgZGVmaW5pdGlvbnMgaW4gdGhpcyBNYWtlZmls
ZT8NClF1ZXVlZCB2b3IgdjMuDQo+DQo+PiArZHRiLSQoQ09ORklHX0FSQ0hfUjlBMDdHMDQ0KSAr
PSByOWEwN2cwNDRjMi1odW1taW5nYm9hcmQtaWlvdC1lbW1jLmR0Yg0KPj4gK3I5YTA3ZzA0NGMy
LWh1bW1pbmdib2FyZC1paW90LW1pY3Jvc2QtZHRicyArPSByOWEwN2cwNDRjMi1odW1taW5nYm9h
cmQtaWlvdC5kdGIgcnpnMmwtaHVtbWluZ2JvYXJkLWlpb3QtbWljcm9zZC5kdGJvDQo+PiArZHRi
LSQoQ09ORklHX0FSQ0hfUjlBMDdHMDQ0KSArPSByOWEwN2cwNDRjMi1odW1taW5nYm9hcmQtaWlv
dC1taWNyb3NkLmR0Yg0KPj4gK2R0Yi0kKENPTkZJR19BUkNIX1I5QTA3RzA0NCkgKz0gcnpnMmwt
aHVtbWluZ2JvYXJkLWlpb3QtcnM0ODUtYS5kdGJvDQo+IFRoaXMgaXNuJ3QgYSBidWcsIGJ1dCBz
aW5jZSByemcybC1odW1taW5nYm9hcmQtaWlvdC1yczQ4NS1hLmR0Ym8gYW5kDQo+IHJ6ZzJsLWh1
bW1pbmdib2FyZC1paW90LXJzNDg1LWIuZHRibyBhcmUgYWxyZWFkeSBhcHBlbmRlZCB0bw0KPiBk
dGItJChDT05GSUdfQVJDSF9SOUEwN0cwNDQpIGZvciB0aGUgc2hhcmVkIHI5YTA3ZzA0NGwyIFNv
QyB2YXJpYW50LCBpcyBpdA0KPiByZWR1bmRhbnQgdG8gaW5jbHVkZSB0aGVtIGhlcmU/DQoNClll
cywgcmVkdW5kYW50IGFzIGJvdGggRzJMIGFuZCBHMkxDIGFyZcKgQ09ORklHX0FSQ0hfUjlBMDdH
MDQ0Lg0KDQpRdWV1ZWQgdm9yIHYzLg0KDQo+DQo+PiArcjlhMDdnMDQ0YzItaHVtbWluZ2JvYXJk
LWlpb3QtcnM0ODUtYS1kdGJzICs9IHI5YTA3ZzA0NGMyLWh1bW1pbmdib2FyZC1paW90LmR0YiBy
emcybC1odW1taW5nYm9hcmQtaWlvdC1yczQ4NS1hLmR0Ym8NCj4+ICtkdGItJChDT05GSUdfQVJD
SF9SOUEwN0cwNDQpICs9IHI5YTA3ZzA0NGMyLWh1bW1pbmdib2FyZC1paW90LXJzNDg1LWEuZHRi
DQo+PiArZHRiLSQoQ09ORklHX0FSQ0hfUjlBMDdHMDQ0KSArPSByemcybC1odW1taW5nYm9hcmQt
aWlvdC1yczQ4NS1iLmR0Ym8NCj4gWyAuLi4gXQ0KPg0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybGMtc3Itc29tLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL3JlbmVzYXMvcnpnMmxjLXNyLXNvbS5kdHNpDQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnMmxjLXNyLXNvbS5kdHNpDQo+PiBAQCAt
MCwwICsxLDM3MyBAQA0KPiBbIC4uLiBdDQo+DQo+PiArCXJlc2VydmVkLW1lbW9yeSB7DQo+PiAr
CQlyYW5nZXM7DQo+PiArCQkjYWRkcmVzcy1jZWxscyA9IDwyPjsNCj4+ICsJCSNzaXplLWNlbGxz
ID0gPDI+Ow0KPj4gKw0KPj4gKwkJbW1wX3Jlc2VydmVkOiBsaW51eCxtdWx0aW1lZGlhIHsNCj4+
ICsJCQljb21wYXRpYmxlID0gInNoYXJlZC1kbWEtcG9vbCI7DQo+PiArCQkJcmVnID0gPDB4MCAw
eDY4MDAwMDAwIDB4MCAweDgwMDAwMDA+Ow0KPj4gKwkJCXJldXNhYmxlOw0KPj4gKwkJfTsNCj4g
RG9lcyB0aGlzIG5vZGUgbmVlZCBhIHVuaXQgYWRkcmVzcyBtYXRjaGluZyB0aGUgZmlyc3QgYWRk
cmVzcyBvZiB0aGUgcmVnIGJsb2NrDQo+IChlLmcuLCBsaW51eCxtdWx0aW1lZGlhQDY4MDAwMDAw
KSB0byBwcmV2ZW50IGEgdW5pdF9hZGRyZXNzX3ZzX3JlZyBEVEMNCj4gY29tcGlsZXIgd2Fybmlu
Zz8NClByb2JhYmx5LCBidXQgdGhlIHVzYWdlIG9mIHBhdHRlcm4gImxpbnV4LC4rQCIgKGkuZS4g
d2l0aCBhZGRyZXNzIHN1ZmZpeCkgaXMgZXh0cmVtZWx5IHJhcmUNCmluIGV4aXN0aW5nIGRldmlj
ZS10cmVlLCBvbiB2Ny4xLXJjMToNCg0K4p2vIGdyZXAgLXIgLUUgImxpbnV4LC4rQCIgYXJjaC9h
cm02NC9ib290L2R0cy8NCuKdryBncmVwIC1yIC1FICJsaW51eCwuK0AiIGFyY2gvYXJtL2Jvb3Qv
ZHRzLw0KYXJjaC9hcm0vYm9vdC9kdHMvbnZpZGlhL3RlZ3JhMTE0LWFzdXMtdGY3MDF0LmR0czrC
oCDCoCDCoCDCoCDCoCDCoCDCoCBsaW51eCxjbWFAODAwMDAwMDAgew0KYXJjaC9hcm0vYm9vdC9k
dHMvbnZpZGlhL3RlZ3JhMjAtYWNlci1hNTAwLXBpY2Fzc28uZHRzOsKgIMKgIMKgIMKgIMKgbGlu
dXgsY21hQDMwMDAwMDAwIHsNCmFyY2gvYXJtL2Jvb3QvZHRzL252aWRpYS90ZWdyYTMwLWFzdXMt
bmV4dXM3LWdyb3VwZXItY29tbW9uLmR0c2k6wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsaW51eCxj
bWFAODAwMDAwMDAgew0KYXJjaC9hcm0vYm9vdC9kdHMvbnZpZGlhL3RlZ3JhMzAtYXN1cy1wMTgw
MS10LmR0czrCoCDCoCDCoCDCoCDCoCDCoCDCoCBsaW51eCxjbWFAODAwMDAwMDAgew0KYXJjaC9h
cm0vYm9vdC9kdHMvbnZpZGlhL3RlZ3JhMzAtYXN1cy10cmFuc2Zvcm1lci1jb21tb24uZHRzaTrC
oCDCoCDCoCDCoCDCoCBsaW51eCxjbWFAODAwMDAwMDAgew0KYXJjaC9hcm0vYm9vdC9kdHMvbnZp
ZGlhL3RlZ3JhMzAtb3V5YS5kdHM6wqAgwqAgwqAgwqAgwqAgwqAgwqAgbGludXgsY21hQDgwMDAw
MDAwIHsNCmFyY2gvYXJtL2Jvb3QvZHRzL252aWRpYS90ZWdyYTMwLXBlZ2F0cm9uLWNoYWdhbGwu
ZHRzOsKgIMKgIMKgIMKgIMKgIGxpbnV4LGNtYUA4MDAwMDAwMCB7DQphcmNoL2FybS9ib290L2R0
cy9udmlkaWEvdGVncmEyMC1hc3VzLXRyYW5zZm9ybWVyLWNvbW1vbi5kdHNpOsKgIMKgIMKgIMKg
IMKgIGxpbnV4LGNtYUAzMDAwMDAwMCB7DQphcmNoL2FybS9ib290L2R0cy9udmlkaWEvdGVncmEz
MC1hc3VzLXRmNjAwdC5kdHM6wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsaW51eCxjbWFAODAwMDAw
MDAgew0KYXJjaC9hcm0vYm9vdC9kdHMvbnZpZGlhL3RlZ3JhMzAtbGcteDMuZHRzaTrCoCDCoCDC
oCDCoCDCoCDCoCBsaW51eCxjbWFAODAwMDAwMDAgew0KDQpObyBvYmplY3Rpb24gdG8gYWRkaW5n
IHRoZSBhZGRyZXNzIHN1ZmZpeCB0byBsaW51eCxtdWx0aW1lZGlhIG5vZGUgdGhvdWdoLg0KDQo+
DQo+PiArDQo+PiArCQlnbG9iYWxfY21hOiBsaW51eCxjbWFANTgwMDAwMDAgew0KPj4gKwkJCWNv
bXBhdGlibGUgPSAic2hhcmVkLWRtYS1wb29sIjsNCj4+ICsJCQlyZWcgPSA8MHgwIDB4NTgwMDAw
MDAgMHgwIDB4MTAwMDAwMDA+Ow0KPj4gKwkJCXJldXNhYmxlOw==
