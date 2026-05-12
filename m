Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023138.outbound.protection.outlook.com [52.101.72.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4556367299
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 10:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.138
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778582508; cv=fail; b=TUDexs0SiIQUADyl9gAd2gPkvMzRdwBylZJVfOY5N+v/GrTmlRcST74Kph3ziEoZaelltRr3uyrWI6nCvRXnZ67fw+3n12eXmLQgP1WndRxFriaZ/wri5tdHwsa8j5mz5O0LcNgcwYfkvsXFbO9bRdREwyQskimLJS+pPsVvxGY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778582508; c=relaxed/simple;
	bh=wNVFhLlNvGDTg+Z2/ApHVwgxaB2/DK0DhCloi0TZi/k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PS1UR0cqGsacjxBciJh1oy6USj95l83rWJ1MPtxpYCuh2agWqMo9KIoOcO7zr+qfkbB2XXaA65h72ln0YBK6Og8PLWHoJWnj/i/jgmKfYUcItG2XhZl/DyMdtfuX2pASYzJu492ufFxpPXwK01gOW/Dq2YDuHEwfrlsNBuE7axo=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=PA3vNzFA; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=PA3vNzFA; arc=fail smtp.client-ip=52.101.72.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="PA3vNzFA";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="PA3vNzFA"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=j6BJo6W0QVvprUukFObNuUmgrfLcBywfeG1mRC6lZUqBGmKjGwX+F8Z1YXFYgpIp+nL9D0k5qnOO0H9E8KVmF7IiJGpttnoehQfhAcUqflYIx/biLFULpLDa02m00AloLr6bl/LWRFxzajN3kw1eg6qmYvML1OpnhAimkY/cbYxLroYdrudHfrT/wTQjYOH++MVHUW+hPI/XmVSEWQBxPnyi8k50O0aSeo7Qh2CTobrKdnzguFqdrniZyJeAUsSwfryRlXwErepHrX/fvJqBfF+PhfiH8YzVmbbqNXn4NscknHd8295JBJ8IQqhC2JnpwHNr2B+9T64H1uw+0xA6kg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNVFhLlNvGDTg+Z2/ApHVwgxaB2/DK0DhCloi0TZi/k=;
 b=WcMTCfhxK9vCKle8C1L0fLHu506catrzSU+v01M76vcG+TUntehNhJ3Y4thQncU743AaQ1lb8RKzwItlPClmHhRy1NcZQHdolqbCz8lwIhlPD/qBEX8PSRWilBMYKe2VyhmaeG9WMnrex9CPe/rnQ2HiLaZnnCzm0qofqc25za9/BWL6poGW6eB5lTw9kxVPyh6ZRZY29XrU/AXPA3GtTMkaezvsTTKNTVO3cZCh9xEy8WasR8fAAifsfPkE2NE/5+PMKT9zrj08O+mcwTn9edHMaIq7tOfk4kh++jhT9cLbFFKEGCOtT7s0HiyrYNv8uZY/rQaL6AfP3CLO9GD5BA==
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
 bh=wNVFhLlNvGDTg+Z2/ApHVwgxaB2/DK0DhCloi0TZi/k=;
 b=PA3vNzFAE9jcTL6UK/UIJuTAXESX9J/OUkGiCm+VbYdEO2fIRGRiQK4XOUqWRpajShsT0dWDw2ijnq9fmNpY0+I3YkHaLAH1Ndar6pbSZyRff2uxMY9CUiMxbZ/m3+0ht4wo8ydDOjGI2YxR0G35SYPkzYXtyQZ5wdKVFs7Agk6pZfxkY7DlQPnAg1Hy7LlmW3EufvubbrlFo2UGWo9kX6cINalU362OzCo2J/bh4Y8CRA8EpSsRaZ8TkGQzcaG7k5bM3G0aUqC9VnN06TSJgLGA40bNPHq7leEJrPWNBs/CouPyazHXqUbyftVcihMNegmz4QBli4vIg7OcATSydg==
Received: from CW1P302CA0023.GBRP302.PROD.OUTLOOK.COM (2603:10a6:400:297::19)
 by AS8PR04MB8294.eurprd04.prod.outlook.com (2603:10a6:20b:3f7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 10:41:39 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:400:297:cafe::9e) by CW1P302CA0023.outlook.office365.com
 (2603:10a6:400:297::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 10:41:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 10:41:39 +0000
Received: from emails-7593796-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-103.eu-west-1.compute.internal [10.20.6.103])
	by mta-outgoing-dlp-588-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id DD9B48046B;
	Tue, 12 May 2026 10:41:38 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue May 12 10:40:35 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VyLWyAC5q6hoPm4NXwt8QuVMruqojSkM3Vd0lCcxqBgR3WNRxjPuPyZ/grXaveIlOmtmZM2zJGMFjT4vOlp1wBJk96kklIL0Q1QqcFqiE8YEHyRIB4g+wjDrvcPK83JILB07BH3QwZ27gKIC1Fe6NZ0BCgT0BcERrwdGXQvbMEjGb68HULlB7crkRO4m+HxZjvb7TRwL+qMLgfoZIgUJwZXqJD/BeL/Lw88bpxJEf4X1R+GdXEEpfsD3md81nTUXWTyCBdFuhl09djyk78n5un0jjwJxdrUXXjfAvS6a4EYjFrE4ljqQkyMO1IHJW2RnBrWOOM0aAXAeRI6qNXVTNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNVFhLlNvGDTg+Z2/ApHVwgxaB2/DK0DhCloi0TZi/k=;
 b=jn0YUBwJqjL1dTpcbkzGz02ewH7z8IqMsM8wzsEcbeZUHcvwxCwcBeedtFbXlvpfwi/E8USZp2keXiTerrf2K3ghRRQZ3gzw3CAUufijIq32TUWMxVbRQV8ex4nun9lyOODM+A7gLb4w0o1XYzYXoanG7wkr3CJnuw86+T1eUL4nypOgGndCCezCApwouEik0tVNOLwdZU6xtjWNSNlSaC0euDID0nVnXRy/rrSAoXm1M8E5bChKhCvjQzB93hsSyMWuWZkiAkdMwbqcGW38VshEPjxS9FGWXCIo4ji2ynp1HoxID6ZT4K/trDJ2bTNmUXx/2Ap0+VRWuHAEnzxsqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNVFhLlNvGDTg+Z2/ApHVwgxaB2/DK0DhCloi0TZi/k=;
 b=PA3vNzFAE9jcTL6UK/UIJuTAXESX9J/OUkGiCm+VbYdEO2fIRGRiQK4XOUqWRpajShsT0dWDw2ijnq9fmNpY0+I3YkHaLAH1Ndar6pbSZyRff2uxMY9CUiMxbZ/m3+0ht4wo8ydDOjGI2YxR0G35SYPkzYXtyQZ5wdKVFs7Agk6pZfxkY7DlQPnAg1Hy7LlmW3EufvubbrlFo2UGWo9kX6cINalU362OzCo2J/bh4Y8CRA8EpSsRaZ8TkGQzcaG7k5bM3G0aUqC9VnN06TSJgLGA40bNPHq7leEJrPWNBs/CouPyazHXqUbyftVcihMNegmz4QBli4vIg7OcATSydg==
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by DU4PR04MB11339.eurprd04.prod.outlook.com
 (2603:10a6:10:5ef::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 10:40:32 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 10:40:32 +0000
From: Josua Mayer <josua@solid-run.com>
To: "sashiko@lists.linux.dev" <sashiko@lists.linux.dev>
CC: "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: add support for solidrun
 rzv2l som and hb-iiot evb
Thread-Topic: [PATCH v2 3/4] arm64: dts: renesas: add support for solidrun
 rzv2l som and hb-iiot evb
Thread-Index: AQHc4TI5Tjq1GD678Ey9I1ZoIln5JrYJr7mAgACFZgA=
Date: Tue, 12 May 2026 10:40:32 +0000
Message-ID: <e9e4f099-7d51-4ed6-91e3-595af71b18b2@solid-run.com>
References: <20260511-rzg2-sr-boards-v2-3-82aebbd27891@solid-run.com>
 <20260512024305.DF50CC2BCB0@smtp.kernel.org>
In-Reply-To: <20260512024305.DF50CC2BCB0@smtp.kernel.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	GVXPR04MB12057:EE_|DU4PR04MB11339:EE_|AMS1EPF00000040:EE_|AS8PR04MB8294:EE_
X-MS-Office365-Filtering-Correlation-Id: e4735d02-45ad-40ed-19fe-08deb0130c6d
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 dqxUP9PHkL/OD+3MDJCKFIS42htFOFJ4I0MK4xprNf3R2QDp+8bAet8p3c6/vxPW6xRfACIhyxiXwCkm0aXtIVxLHyoX+3m5chknizREX62qRZP9X04eZETNmoBYM5SZ17SC1e2jUF0Oc5gdQMrC74mUa3Ei7YXw2BNoNH6855c8dY7Hpc1S0d2Xis2BcNa5frb9SZtmNprsJB3a/fF4/WAeJloQLTXn7JEs1QoUA5YMMX9Ompl4sd+JwmTYq5blRkCmmv58/OC5T09FwW3+RBSSAOmBwKHshaDdrr/ZAC89jp+YoQgl8ecpjsB05CDLABkZajegUskyd1sfKdzw0P5a56nXWgQAVKIcOFvtzqgDyyIMFprvb0bjl+9bc055etzFpVTDYltM2aDzmvI15EHBXbzUw3du6J1lv1efLCQ4sjIbHv/fea+xV+wYRs6z0No0BPWxD7c0CbY2m1p2yzH3lZG4B8SNK8ltxA8oS+LYJP1JOlqpEx5Mbqgk+4Lsk8nsz9aT37PcAVnGQ3peT/YQLz55siXRD28Zi8XR/OJeIs7Uym1potL2+AXLee3RmeLHaV8QEU4iz+YgIIxAp47AzqmDXJmsgm5+rOIchIa9nKezqbW9k/ZOKKVP1q8HJgM67Lxcarx3wCgLc4WJusdjDi8rf36O7k5QpOxzwiuVtrgW0GHwyTlASk0k6Zsll7A31r20+toN3bNYEBeMlr+cZb96JD/DWerxLE57xPXJIdL3lCytmhvg1HU9fBU/
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC4DA9A86E7B1646A153FCB2B2CF91A6@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 sTH/5uwsSqOOJauDUHMqD7+gCPmXiZzxVdpEHK2Z5+HmF3sRHnO81wUTec3ZdkFNtVAliwei24cq/SzV9fy4xkRKB3uJjijbSe4ra/l1/ta8Vsy2V7LTCH0BKOln7KglXAPVGengcUeaCbN1D0c/LujUV0LWQDijCR3Z1nafFZZU84t34g8FBKOU/Ahyh+wOQlFJw4456DJublc5qKwjqKE2xZZIk9AOh7FmXRhlzT2KWXucGXokHhe192+gEPjLI4a6dEzvZQwRx5L9tjuLz5N0xlsw8+4SrjWKgzf1/Qs+c6Ee0EdrS0PDxvdogMOiN3EpuKrFqFKgDeEXHBqnQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11339
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 04e863639f42451d8d80b7700b393951:solidrun,office365_emails,sent,inline:6e3193866f3560b08800514294f08544
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	93e22aa4-17a2-4928-50a7-08deb012e4ad
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|376014|36860700016|1800799024|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BWpVmexusL0DsJ6awWwX0GCJqjDD+vdKTWLFHmcpHN/WsLqcqPiVPC1FEzyMp/LxxCdh98RW3j9NY+qIwT6HvaCqUjqXZaz1GxvxNyTUo/a4UYE5lJlLCqDH6vb/GV53k1ZHSywxmDBfA9JtqkCNKIhOxp2hfjK/O7+Otl1De7HWLApXEmHzBQZ+lmgvcG3LZA0vIOkZbdHbqtL1KNLRrj2I6H1gptcQLRTBNA9z1i0uzpNC8uER4TJoFOQkP4Hh1Q5t50E5JZjKvWHGEbv/R3Jy4s0SCOuMX68yuYIfUg5EXem0xyKNplGjkuEREROtkP1qqw5ztVe9nW54f/VPyOROBo2jX29QGcuvzjlSJj2XbO1qinZOw++Xg2Rs/Q7EjyjCfT7poVnphYo9jrqLv2GHa4+UB5YQ5nqDIPjjd2JVfyvIUmehsmDU06PpLJqASVBTBMzTQMzvaynYuSCkQ951bVpzHLzLO0Q/WNRxl0wy2ATWw+UWmDxES3p+dwOWeWZDYs1zxz821HJy3p8zkkR5Muh7mVoU/dxErM31ZOr7EkvaxeWl1aFz/y4WOHsk7IxFbdtzQoTtOYVQnTplpWbilZ5E2NVjGGU78Njf7EVIXFx6v1pfp9CStk51GwhkJuBEo4QVI8xGjkS8WNpn9KFrndPoVk+KvF5/venqB/MHgrEAhCvGX5HAVs8oyJ5ItwpzWtH3AG6yvbtR1hMckcK+d3UC1xpyN0Pfl6CdAbs=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(376014)(36860700016)(1800799024)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	H3oP+hDiQ34DKVMwftA4/MPT8Lezmkg5ZQldpUeR0zGl/DbgWyh3kom3nH1cVZxQPWNrJrLxB//vNitVo0do5ahVLb4mH0s4BST6yvR5+Mj9lV9bMyKXNVQIJ184WTabZWt2B7edydsdRYbufUniP7fIJdd9mFVikhVq2y3xQcDnkJacMAgchMzbssn7vbw3EQTrWDVdmrXS98PCEoecyp6PM2i4kI8zLtWU1/kMFWYr+kBH77ngEgIeD7emIvfVHpe9ej0epN1FRwzjotg9GLNREuKbIIBdNLcNJE8pqz5Ow8lWpj4n3S1F7tiV1Gj7bA47Y8PS5ezWwICFbE+IftYqT44Nu8OI5oloCCo218mKjMOrAyfvE/zPkJFFKEyPiaObSDHELdSAgeBvxde59AOWyOwI+y95vl7O79W6JaG/78XwsAO3i1BBvVyhF251
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:41:39.1741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4735d02-45ad-40ed-19fe-08deb0130c6d
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8294

QW0gMTIuMDUuMjYgdW0gMDQ6NDMgc2NocmllYiBzYXNoaWtvLWJvdEBrZXJuZWwub3JnOg0KPiBU
aGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAz
IHBvdGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoNCj4gLSBbTWVkaXVtXSBUaGUgY29tcG9z
aXRlIERUQiB0YXJnZXRzIGZvciB0aGUgUlovVjJMIGJvYXJkIGFyZSBtaXNzaW5nIHRoZSAnLWlp
b3QnIGlkZW50aWZpZXIsIGxlYWRpbmcgdG8gaW5jb25zaXN0ZW50IG5hbWluZy4NCj4gLSBbTWVk
aXVtXSBUaGUgc2hhcmVkIGRldmljZSB0cmVlIG92ZXJsYXlzIGFyZSBub3QgYWRkZWQgdG8gdGhl
IGluc3RhbGwgdGFyZ2V0cyBmb3IgdGhlIFI5QTA3RzA1NCBhcmNoaXRlY3R1cmUuDQo+IC0gW0xv
d10gVGhlIGAtZHRic2AgY29tcG9zaXRlIHZhcmlhYmxlcyBhcmUgcG9wdWxhdGVkIHVzaW5nIGAr
PWAgaW5zdGVhZCBvZiBgOj1gLg0KPiAtLQ0KPg0KPiBjb21taXQgMTM0NmZkZjk4OTM5ZDI0YmVk
ZDkwODVjYjdkZGZmZWUyOTI0N2ZjZg0KPiBBdXRob3I6IEpvc3VhIE1heWVyIDxqb3N1YUBzb2xp
ZC1ydW4uY29tPg0KPg0KPiBhcm02NDogZHRzOiByZW5lc2FzOiBhZGQgc3VwcG9ydCBmb3Igc29s
aWRydW4gcnp2Mmwgc29tIGFuZCBoYi1paW90IGV2Yg0KPg0KPiBUaGlzIGNvbW1pdCBhZGRzIGRl
dmljZSB0cmVlIHN1cHBvcnQgZm9yIHRoZSBTb2xpZFJ1biBSWi9WMkwgU29NIG9uIHRoZQ0KPiBI
dW1taW5nQm9hcmQgSUlvVCBwbGF0Zm9ybS4gSXQgdXRpbGl6ZXMgc2hhcmVkIGNvZGUgYW5kIGRl
dmljZSB0cmVlIG92ZXJsYXlzDQo+IGZyb20gdGhlIGV4aXN0aW5nIFJaL0cyTCBzZXJpZXMuDQo+
DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL01ha2VmaWxlIGIv
YXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL01ha2VmaWxlDQo+PiBpbmRleCAzN2NmZWZlNjZh
MzA4Li5jZGY1OWYzMjQwZTI3IDEwMDY0NA0KPj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9y
ZW5lc2FzL01ha2VmaWxlDQo+PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvTWFr
ZWZpbGUNCj4+IEBAIC0xODgsNiArMTg4LDE1IEBAIGR0Yi0kKENPTkZJR19BUkNIX1I5QTA3RzA0
NCkgKz0gcjlhMDdnMDQ0bDItc21hcmMtY3J1LWNzaS1vdjU2NDUuZHRibw0KPj4gIHI5YTA3ZzA0
NGwyLXNtYXJjLWNydS1jc2ktb3Y1NjQ1LWR0YnMgOj0gcjlhMDdnMDQ0bDItc21hcmMuZHRiIHI5
YTA3ZzA0NGwyLXNtYXJjLWNydS1jc2ktb3Y1NjQ1LmR0Ym8NCj4+ICBkdGItJChDT05GSUdfQVJD
SF9SOUEwN0cwNDQpICs9IHI5YTA3ZzA0NGwyLXNtYXJjLWNydS1jc2ktb3Y1NjQ1LmR0Yg0KPj4g
IA0KPj4gK2R0Yi0kKENPTkZJR19BUkNIX1I5QTA3RzA1NCkgKz0gcjlhMDdnMDU0bDItaHVtbWlu
Z2JvYXJkLWlpb3QuZHRiDQo+IFNob3VsZCB0aGUgc2hhcmVkIGRldmljZSB0cmVlIG92ZXJsYXlz
IGJlIGV4cGxpY2l0bHkgYWRkZWQgdG8gdGhlIGluc3RhbGwNCj4gdGFyZ2V0cyBmb3IgQ09ORklH
X0FSQ0hfUjlBMDdHMDU0Pw0KVGhleSBzaG91bGQsIHRob3VnaCBidWlsZGluZyBmb3Igb25lIHBs
YXRmb3JtIHdpdGhvdXQgdGhlIG90aGVyIGlzIHVubGlrZWx5Lg0KDQpRdWV1ZWQgZm9yIHYzLg0K
DQo+DQo+IEN1cnJlbnRseSwgb3ZlcmxheXMgbGlrZSByemcybC1zci1zb20tZW1tYy5kdGJvIGFu
ZA0KPiByemcybC1odW1taW5nYm9hcmQtaWlvdC1taWNyb3NkLmR0Ym8gYXJlIGJ1aWx0IGFzIGlu
dGVybWVkaWF0ZSBkZXBlbmRlbmNpZXMsDQo+IGJ1dCBLYnVpbGQncyBtYWtlIGR0YnNfaW5zdGFs
bCBvbmx5IGluc3RhbGxzIGFydGlmYWN0cyBwcmVzZW50IGluIGR0Yi15Lg0KPiBXaXRob3V0IGJl
aW5nIGFkZGVkIHRvIGR0Yi0kKENPTkZJR19BUkNIX1I5QTA3RzA1NCksIHdpbGwgdGhlc2Ugc3Rh
bmRhbG9uZQ0KPiAuZHRibyBmaWxlcyBiZSBtaXNzaW5nIGZyb20gdGhlIGluc3RhbGxhdGlvbiBk
aXJlY3Rvcnk/DQo+DQo+PiArcjlhMDdnMDU0bDItaHVtbWluZ2JvYXJkLWVtbWMtZHRicyArPSBy
OWEwN2cwNTRsMi1odW1taW5nYm9hcmQtaWlvdC5kdGIgcnpnMmwtc3Itc29tLWVtbWMuZHRibw0K
Pj4gK2R0Yi0kKENPTkZJR19BUkNIX1I5QTA3RzA1NCkgKz0gcjlhMDdnMDU0bDItaHVtbWluZ2Jv
YXJkLWVtbWMuZHRiDQo+IEFyZSB0aGVzZSBjb21wb3NpdGUgRFRCIHRhcmdldHMgbWlzc2luZyB0
aGUgLWlpb3QgaWRlbnRpZmllcj8NCg0KQ29ycmVjdC4NCg0KUXVldWVkIGZvciB2Mw0KDQo+DQo+
IFRoZSBiYXNlIGJvYXJkIGlzIG5hbWVkIHI5YTA3ZzA1NGwyLWh1bW1pbmdib2FyZC1paW90LmR0
cywgYnV0IHRoZSB0YXJnZXRzDQo+IG9taXQgLWlpb3QgKGZvciBleGFtcGxlLCByOWEwN2cwNTRs
Mi1odW1taW5nYm9hcmQtZW1tYy5kdGIpLiBUaGUgZXF1aXZhbGVudA0KPiBSWi9HMkwgdGFyZ2V0
cyBjb3JyZWN0bHkgaW5jbHVkZSBpdCwgc3VjaCBhcw0KPiByOWEwN2cwNDRsMi1odW1taW5nYm9h
cmQtaWlvdC1lbW1jLmR0Yi4NCj4NCj4gQ291bGQgdGhpcyBuYW1pbmcgZGlzY3JlcGFuY3kgY2F1
c2UgaXNzdWVzIGZvciBkZXBsb3ltZW50IHNjcmlwdHMNCj4gZXhwZWN0aW5nIHRoZSAtaWlvdCBz
dWJzdHJpbmcgdG8gbG9jYXRlIHRoZSBSWi9WMkwgRFRCcz8NCj4NCj4gQWxzbywgdGhpcyBpc24n
dCBhIGJ1ZywgYnV0IGlzIGl0IGludGVudGlvbmFsIHRvIHVzZSArPSBpbnN0ZWFkIG9mIDo9IGZv
cg0KPiB0aGVzZSBjb21wb3NpdGUgdmFyaWFibGVzPw0KVW5pbnRlbnRpb25hbCBjb3B5IGZyb20g
b3RoZXIgZXhhbXBsZXMuDQo+DQo+IEluIEtidWlsZCwgOj0gaXMgZ2VuZXJhbGx5IHRoZSBzdGFu
ZGFyZCBjb252ZW50aW9uIGZvciBkZWZpbmluZyBtdWx0aS1EVEINCj4gdGFyZ2V0cywgYXMgc2Vl
biBpbiB0aGUgc3Vycm91bmRpbmcgTWFrZWZpbGUgZW50cmllcy4NClF1ZXVlZCBmb3IgdjMuDQo+
DQo+PiArcjlhMDdnMDU0bDItaHVtbWluZ2JvYXJkLW1pY3Jvc2QtZHRicyArPSByOWEwN2cwNTRs
Mi1odW1taW5nYm9hcmQtaWlvdC5kdGIgcnpnMmwtaHVtbWluZ2JvYXJkLWlpb3QtbWljcm9zZC5k
dGJvDQo+PiArZHRiLSQoQ09ORklHX0FSQ0hfUjlBMDdHMDU0KSArPSByOWEwN2cwNTRsMi1odW1t
aW5nYm9hcmQtbWljcm9zZC5kdGINCj4+ICtyOWEwN2cwNTRsMi1odW1taW5nYm9hcmQtcnM0ODUt
YS1kdGJzICs9IHI5YTA3ZzA1NGwyLWh1bW1pbmdib2FyZC1paW90LmR0YiByemcybC1odW1taW5n
Ym9hcmQtaWlvdC1yczQ4NS1hLmR0Ym8NCj4+ICtkdGItJChDT05GSUdfQVJDSF9SOUEwN0cwNTQp
ICs9IHI5YTA3ZzA1NGwyLWh1bW1pbmdib2FyZC1yczQ4NS1hLmR0Yg0KPj4gK3I5YTA3ZzA1NGwy
LWh1bW1pbmdib2FyZC1yczQ4NS1iLWR0YnMgKz0gcjlhMDdnMDU0bDItaHVtbWluZ2JvYXJkLWlp
b3QuZHRiIHJ6ZzJsLWh1bW1pbmdib2FyZC1paW90LXJzNDg1LWIuZHRibw0KPj4gK2R0Yi0kKENP
TkZJR19BUkNIX1I5QTA3RzA1NCkgKz0gcjlhMDdnMDU0bDItaHVtbWluZ2JvYXJkLXJzNDg1LWIu
ZHRiDQo+IFsgLi4uIF0NCj4=
