Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020114.outbound.protection.outlook.com [52.101.69.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2619D395AF6;
	Tue, 12 May 2026 13:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.114
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778593213; cv=fail; b=raA5bi03+WMEP0Fr3OMgNmL2xLADNCxMBS6+7raC5JGidejxzjMscMzqdpaDJXL5SfVGYVAcHdPfjyhFVGFgNQkzThr/+JViJKgepMSZnSOyHnGpNdfECBU0MpkK34WZStQmZIks4QpPFjALqDLSYSYRa3VfUWRoR7xASo0e1pk=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778593213; c=relaxed/simple;
	bh=41aLuJgcKO9vCZL3PgUEj8bxRF10SNjfR8gS7feQVzM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HoFGvuNQtBE7NiRcdKpemeB9BGCMEtMhVCO6qaAWwOTzb1QBDGEV9ETk3u3PISJH5gLKIxdDxpBzsirBiug+CoJFs19OHn6MXi/ywa7QBuO5IK/Q+tmC2LUm/yWXuUwe0PhM8hZ1+Ue0UVOs6J5ufX2bx/8RRxbG497rnkihT8U=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=eZ3EtQOv; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=eZ3EtQOv; arc=fail smtp.client-ip=52.101.69.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="eZ3EtQOv";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="eZ3EtQOv"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yXjgRibER//v+SRncigQA3qftpdckYfbfH48ulQTLjHBp88YUcU2HmjSTxzkiVd+VlKJdfjn0nzPQUPC0tS0X5WOHxM+qNx28iegVFYdfkMJyVr+YuewICb7q2LKahPpsh6DpHDxtM73ATbw4zoPk4e8LskmEfKCwFV+31Oav294Ww2ToXylYk806M/3YECs1RdwaVcOPL+JtWATqJJocbrjJVUWeuepCnWuFqKZ5yJtPRc+FFZcsHnw3Q9PK5KCtQ6KFUpzML0N1M7cOdJNw3jxUz2mLHPKvQvz7E4Iz38u/6ugV8IEEODagHTFwvDfBYhvOVtFFrOeHl1VK3MTaA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41aLuJgcKO9vCZL3PgUEj8bxRF10SNjfR8gS7feQVzM=;
 b=ohIYpgSD0o0bBPCgDph2vKHzTiQgEDCOwHkB7mYKx9bDSVNe2JL7cmtwmLqnYTvDdnKvF201kuMBgEeYZC7hPwRH82Si36KguHbSblhPczoLoWZgKZQ8TVXK56xmt0myvxkjzPmYFK3ofJkgRnZLi+seCqj+cXomItm1wWPys7ZHaP9XLSnjdx5FFJJ/JieEouSuxF+qF9v+DqIhuKE4J8xxRtZPKJUFhGPP3jZMWHijVeC+2gtVbbkN0G/caV1fYTmb3ypm9kAlTJOnzdkyE45iBo95TTWVtq1Ngc6PDm44UTULb9TjFqrpY8QNkbOMPSD6yvT6UKTZ1msOfuoGrg==
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
 bh=41aLuJgcKO9vCZL3PgUEj8bxRF10SNjfR8gS7feQVzM=;
 b=eZ3EtQOvHiXn4Q+E24SM1X7yKhP6rccz5Jm96dY4P3I8G7wxECTlGYS0qFLBGehWWJ8ip2SSluErusBWsw7QL0Y/mOa27QweZ01tzBLjNeJrfV5WJI2SoyA0eIwaRhBcDTtEtSa5kr0ykv4UxCu38gHq31perPcI+jlq4vIifDGVJnBdfT+D9g7GK9g8bPY4ceyl7fZyU73V5DpFKx0079Xsl+CPBm66X13L4mGKtq0RmzSPFf8ErcECiOJv/jlE/SshYK0FIBGaMsdtQ2gVbHx7FaJ7Y7kOzH+rs0Rmxvvl0Hdr5NJ6HdppnR1IuCatuATTHMX4uxY058nhxZywEA==
Received: from DU2P250CA0021.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::26)
 by PAXPR04MB8375.eurprd04.prod.outlook.com (2603:10a6:102:1be::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 13:40:06 +0000
Received: from DU6PEPF00009525.eurprd02.prod.outlook.com
 (2603:10a6:10:231:cafe::5a) by DU2P250CA0021.outlook.office365.com
 (2603:10a6:10:231::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.16 via Frontend Transport; Tue, 12
 May 2026 13:40:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF00009525.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13 via
 Frontend Transport; Tue, 12 May 2026 13:40:06 +0000
Received: from emails-2901541-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-220.eu-west-1.compute.internal [10.20.5.220])
	by mta-outgoing-dlp-588-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 667427FC93;
	Tue, 12 May 2026 13:40:06 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue May 12 13:39:56 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lRnq8/CI2BfJy/t8ar20lIdZDHTXYqu0xJFJ6w6oWjc+Tb6CNHxRDXOqoZIkVclTymiEs0w4/HDkQhdl+VWbgOufM2Ood5qQGpPL8BhhwvbyJAwc9gKEl7DWGdOwgAaGbhN/HHBmHHjbDiQflIoLaUjO4BrwCtSu5PuK193vwCBmWkxfZuNZoy0FEUc/ROEmsJFe/uAGquw89BV1dwi2axib8H2OgA/gjMWN2ikqTgrAXEHHqbu89QMWe0im8FbakD3KwwRTr/MtQkeGh0f66vzetoOUD/3OW3Dz1pjsvT6fc1+51u2WPkLjKkDd0W4/REmvcl2S6ibKq2ccs0OPFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41aLuJgcKO9vCZL3PgUEj8bxRF10SNjfR8gS7feQVzM=;
 b=trZAVbuCZ9OI5K6qq0XiSzTvGGVZlvV7BaqX5JK999RWMwFddISx18rzQ7vQ0XtBldvCnC4ZPGkU8N0BCG394dWCIU4PGgD7seMdUwgq633VQcg5GWVGEIhW521Kz1s30SoVq6eqe/3Mt16NtD76ArjKe9I1Kwvd52MfRTzwOljqry6doAoPUR9H/DuJTEszvx4JlRy7dcUkpoRKYhSSi4H5C81cIWhsrOfOgn+tZvBorFRqt2cgiW12LNxD63qU3JMpIJX+zelwjOSsNIiu5wxnGCu6dqNSLnGUWR4ktxC0gfQhPhLl7/w60rcNDj3cxkxU5z4ghs17Hxtr0I2PiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41aLuJgcKO9vCZL3PgUEj8bxRF10SNjfR8gS7feQVzM=;
 b=eZ3EtQOvHiXn4Q+E24SM1X7yKhP6rccz5Jm96dY4P3I8G7wxECTlGYS0qFLBGehWWJ8ip2SSluErusBWsw7QL0Y/mOa27QweZ01tzBLjNeJrfV5WJI2SoyA0eIwaRhBcDTtEtSa5kr0ykv4UxCu38gHq31perPcI+jlq4vIifDGVJnBdfT+D9g7GK9g8bPY4ceyl7fZyU73V5DpFKx0079Xsl+CPBm66X13L4mGKtq0RmzSPFf8ErcECiOJv/jlE/SshYK0FIBGaMsdtQ2gVbHx7FaJ7Y7kOzH+rs0Rmxvvl0Hdr5NJ6HdppnR1IuCatuATTHMX4uxY058nhxZywEA==
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by DB9PR04MB9721.eurprd04.prod.outlook.com
 (2603:10a6:10:4c1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 13:39:54 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 13:39:54 +0000
From: Josua Mayer <josua@solid-run.com>
To: "sashiko@lists.linux.dev" <sashiko@lists.linux.dev>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "Frank.Li@kernel.org" <Frank.Li@kernel.org>
Subject: Re: [PATCH v5 10/10] arm64: dts: Add support for LX2160 Twins board
 in single configuration
Thread-Topic: [PATCH v5 10/10] arm64: dts: Add support for LX2160 Twins board
 in single configuration
Thread-Index: AQHc4I9iXKUPK7DJGUmQbGcTfeVEJLYJaiiAgAD+WYA=
Date: Tue, 12 May 2026 13:39:54 +0000
Message-ID: <dd8be911-4fc4-4c47-bec1-694e1a03dcd7@solid-run.com>
References: <20260510-lx2160-pci-v5-10-540b83852227@solid-run.com>
 <20260511222934.91EA4C2BCB0@smtp.kernel.org>
In-Reply-To: <20260511222934.91EA4C2BCB0@smtp.kernel.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	GVXPR04MB12057:EE_|DB9PR04MB9721:EE_|DU6PEPF00009525:EE_|PAXPR04MB8375:EE_
X-MS-Office365-Filtering-Correlation-Id: 75a8935a-9232-4aeb-b66b-08deb02bfa85
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|56012099003|22082099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info-Original:
 4BSUC7DdcHLjFp+QOid/XAoFiSXHJmr58jTsro31ZATKteFuWLC7/J3ztyqBrCgSfWphryPbx70rmXsylpnXQj1zIFgxa/8PeYRT8Dcs1SHnMAjDIrFfL8iTv27XDP/vPaV+JdNjVRyqXhRl5mENd6+cMWj8zhz8xyzPnoGjeCOJMqfTjo0g96Uwnf1/Px82HKQ7BMh6s6qXFZhfMEQYOWXe+visIUz98vveyd6uU2zYzORCplwnA70fammiydM6f0hQcA3bT8Ns7lXKIijYdcBb05menJGsIbG0RBQdVi5pEdlsX3eU/Ta1XNTtNop2XQ/KI3bT17/xP2XHXYCJRMBY09u6sqyaxh4X54isJSzNVFQ7RBb0vKh5FaMJCfvMlTixT4B4vSOGsmyvlLikKgfVNHzWhfkljbGaX4DadM/vf3P5371cftSH9Y6iSnS+espc1syPN80rfm80Jg1hG+evAUG2JZdFZ6kopNp6JooSaC6UXSZxkkbTzHkWwBeLFwgb/Aa5q7oWP0ma2oKEDuiMXgJotogYBo+OCyy6rIZ7PZUIjQSCWDcw75Xtc8VZKqXynjRDVerzZ8Or1Q3HYGQ1DS7RvVDBwsV7ScYQQRf2jqb2140zDyVdnvFZu7yxkOcVB+JLz4CIuePINFP+UA8+Ebd4h2jhHGqQNqIK+4Bu7xojU/4GVb5Xonp1jtJeloJC/mjVlN94lB3Ola4wZi01T+55XBk9IHQ2yciyTFy93c8lYp/PZRJG78cr7h7S
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003)(3023799003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6316C79D566DDA4FA0970FD0573FD1D4@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 Mu1sXdOoDdDfh78xonW8i+w6rcIYMuyD6eseAOpE3KhzTEYl7njaO03PvPB5PO3iM/xmHy0Qgj6fVLZa5oaanqREur7s8ZFQha4xw7zUNmVk0kVYOJVtpLDLXsmDzpRKyROLDSbUhXzfTxqajJh4SIY5DblfAUfVMPale5tP5CgkFM3LH9rI0hv7j5tkGEyeQycC0bacva89Anx73TMg3LVHFxZJWo8gUr8e/iAtDgM6s6fTsa40PJSUO5JE7GiQHzEPLHjFpan338ClvEDrEzD3rQVCE1OdQXO3lg4wWwDmonjKaZN20FMWeNj9qF1HBz0hZ+F71JmTX8l8gIEqeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9721
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 145bfadc1e3a4b929746fa97a5cd7815:solidrun,office365_emails,sent,inline:b1ddf83a736a55b35d2c8be4d40bc8ce
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f39d97fb-de29-4475-51bf-08deb02bf328
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|36860700016|376014|14060799003|1800799024|18002099003|22082099003|3023799003|56012099003;
X-Microsoft-Antispam-Message-Info:
	CEAZUCkVvy8K09qPWrXPx+N38hKwOm3161q1n1AjgbDZPPIUHR6zXsFL0kXvMHRgurbJ21dxvDfrK6H1IeD7xt/1JSaOTTcNzZw4bnQ55rlglJkTxn3PQut6I1hiKHSPXA3Ogztor6xpKY3+KXJ6Xo36J2GSA2myfEeAT7MGx4DvAWzM4bj9LP1EzDe12ZtqKI/jPbmgZctkF3NuYuHAfZenLZPRoIAQjsRH9tRLxekz0u/stvwHSX2KHsNE0ir+mkmQVkKLO1AKZw5zocOy4KZdiZpqIFmU0hxGvRy1+gdDpVx+t4jB4Gq9Fl6o9oHlH5KKqMU5WhTBEqmm+PutJVJSsfc3uuR2ZtdNqYrSHLPAKmDx520AgRSHVWcHCs2OFKnHV5izUJd0ArsM8TlMI7Ui4V0LIbHx6GNUe3w29lOV1CPqhgrYso5EBU2SimSz8zZChpMBYK+IM4JsxZ/z/wnbSTkClu2JqyQYIJJxA7zo9rySwnEXb4fXPZBToisk5AbeaQNh4G0rP5p9PJsT5yqtDo6ul5P6eziU7TShzyJZquLoQm1XZAUFd8IDI2Xoig+bQGgGBjThRCsoKHMe6+FnqFBO/FnoKO12QpKNHNaBP0qTc7hu9Kwp8hl2mRj73lQUvJkQ9aN2INlIZnJ3fXZhQKmmPmsC2RKI0EOmne7mlynmZXdk/nOEWUfEWVgewop/SGscCACg2FaR+oojZG1YTPX9mEfpw6AI10td3Sg=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(36860700016)(376014)(14060799003)(1800799024)(18002099003)(22082099003)(3023799003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LyXjDbLclZGY7xxcdEE0u6PngTr/Jvo8gUvvtwGxbe1t1bHKL+/iaYdA046taz71LZc0KejiAr9K4bVpf7kUeQvb1ZFoEcvnqlbKdRmCwogRYT3foHJKYOUHnUC9HTrvtZyLwD/Zc06Sf7xN9LsTTDKXY7gpUJDbpJHmkeBJCqW7xi+mPldwk5Oj8FyQfVrzzM3O+/xpoqB6nPkWDhF4qiXuKXISCJ+DfKsAcRnekEavMMdyn2008yUDWMWGQtkpgoWDsfSuZGoZSHFZnh9IUxWK/Cq59hca6hFMi+IWsTCrbpzP0B/dE1GLWwsPJwn3QsFXHW5AIjbnol1o8H9Mj3L9QgBr7/v+RyVZz3dybFqt0ceFUchBhuXPV0fEl64NCfK2YegyQHLitjG4jluuCtuZAYudbzZ1NMc7Ra/kWnbU/hN+GDDGErXhpwY40Dat
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 13:40:06.5905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a8935a-9232-4aeb-b66b-08deb02bfa85
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8375

QW0gMTIuMDUuMjYgdW0gMDA6Mjkgc2NocmllYiBzYXNoaWtvLWJvdEBrZXJuZWwub3JnOg0KPiBU
aGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCA1
IHBvdGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoNCj4gLSBbSGlnaF0gVW5kb2N1bWVudGVk
IGFuZCB1bnJlbGF0ZWQgU29DIHJldmlzaW9uIGNoYW5nZSBmb3IgdGhlIENsZWFyZm9nIENYIGJv
YXJkLg0KPiAtIFtIaWdoXSBUaGUgUENJLUUgT0NQIGNhcmQgY29ubmVjdG9yIGlzIG5vdCBlbmFi
bGVkIGluIHRoZSBkZXZpY2UgdHJlZS4NCj4gLSBbTG93XSBEdXBsaWNhdGUgYGZ1bmN0aW9uLWVu
dW1lcmF0b3JgIHZhbHVlIGluIHRoZSBTRlAgTEVEIGRlZmluaXRpb25zLg0KPiAtIFtMb3ddIFRo
ZSBgZHBtYWNgIG5vZGVzIHJlZmVyZW5jZWQgYXMgTEVEIGB0cmlnZ2VyLXNvdXJjZXNgIGxhY2sg
dGhlIG1hbmRhdG9yeSBgI3RyaWdnZXItc291cmNlLWNlbGxzYCBwcm9wZXJ0eS4NCj4gLSBbTG93
XSBUaGUgYGdwaW8tbXV4YCBjb25maWd1cmVkIGZvciBQV00gZmFuIG1vbml0b3JpbmcgaGFzIG5v
IGxhYmVsIGFuZCBubyBjb25zdW1lciBub2RlLg0KPiAtLQ0KPg0KPiBjb21taXQgZTEzMWIzNDFl
NTM0ZWMyMWM5NTI4OWJkNGJlZGNlZjhiYjZmY2Y1NA0KPiBBdXRob3I6IEpvc3VhIE1heWVyIDxq
b3N1YUBzb2xpZC1ydW4uY29tPg0KPg0KPiBhcm02NDogZHRzOiBBZGQgc3VwcG9ydCBmb3IgTFgy
MTYwIFR3aW5zIGJvYXJkIGluIHNpbmdsZSBjb25maWd1cmF0aW9uDQo+ICAgICANCj4gVGhpcyBj
b21taXQgYWRkcyBzdXBwb3J0IGZvciB0aGUgU29saWRSdW4gTFgyMTYwQSBUd2lucyBib2FyZCBp
biBpdHMNCj4gc2luZ2xlIENQVSBjb25maWd1cmF0aW9uLiBUaGUgYm9hcmQgZmVhdHVyZXMgc2V2
ZXJhbCBjb25uZWN0b3JzIGluY2x1ZGluZw0KPiBTRlAsIFBDSWUgT0NQLCBVU0ItMy4wLCBhbmQg
bWljcm9TRC4NCj4NCj4+IC0gUENJLUUgT0NQIGNhcmQgY29ubmVjdG9yDQo+IFRoZSBjb21taXQg
bWVzc2FnZSBleHBsaWNpdGx5IGxpc3RzIHRoZSBQQ0ktRSBPQ1AgY2FyZCBjb25uZWN0b3IgYXMg
YQ0KPiBzdXBwb3J0ZWQgZmVhdHVyZS4gSG93ZXZlciwgbG9va2luZyBhdCB0aGUgZGV2aWNlIHRy
ZWUsIGFyZSB0aGVyZSBhbnkgUENJZQ0KPiBob3N0IGNvbnRyb2xsZXIgbm9kZXMgZW5hYmxlZD8N
Cj4NCj4gQWxsIFBDSWUgaG9zdCBjb250cm9sbGVyIG5vZGVzIGRlZmF1bHQgdG8gZGlzYWJsZWQg
aW4gdGhlIGJhc2UgU29DIGRldmljZQ0KPiB0cmVlcywgYW5kIHRoaXMgZGV2aWNlIHRyZWUgZG9l
c24ndCBzZWVtIHRvIG92ZXJyaWRlIHRoZWlyIHN0YXR1cyB0byAib2theSIuDQo+DQo+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2MGEtY2xlYXJm
b2ctY3guZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2MGEtY2xl
YXJmb2ctY3guZHRzDQo+PiBpbmRleCA4MDJkNzYxMWM2NDc5Li42MDc4Y2U0N2ZhYmYxIDEwMDY0
NA0KPj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2MGEtY2xl
YXJmb2ctY3guZHRzDQo+PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wt
bHgyMTYwYS1jbGVhcmZvZy1jeC5kdHMNCj4+IEBAIC02LDcgKzYsNyBAQA0KPj4gIA0KPj4gIC9k
dHMtdjEvOw0KPj4gIA0KPj4gLSNpbmNsdWRlICJmc2wtbHgyMTYwYS5kdHNpIg0KPj4gKyNpbmNs
dWRlICJmc2wtbHgyMTYwYS1yZXYyLmR0c2kiDQo+IERvZXMgdGhpcyBjb21taXQgaW50ZW5kIHRv
IGNoYW5nZSB0aGUgU29DIHJldmlzaW9uIGZvciB0aGUgQ2xlYXJmb2cgQ1ggYm9hcmQ/DQpVbmlu
dGVudGlvbmFsLCB0byBiZSBkcm9wcGVkIGluIHY2Lg0KPg0KPiBUaGlzIGhhcmR3YXJlIGRlZmlu
aXRpb24gY2hhbmdlIGlzIG5vdCBkb2N1bWVudGVkIGluIHRoZSBjb21taXQgbWVzc2FnZS4NCj4N
Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHgyMTYw
YS1oYWxmLXR3aW5zLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1seDIx
NjBhLWhhbGYtdHdpbnMuZHRzDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAw
MDAwMDAwMDAwMC4uNDM0YjNmNDg3MzAwOA0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvYXJj
aC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2MGEtaGFsZi10d2lucy5kdHMNCj4g
WyAuLi4gXQ0KPg0KPj4gKwlsZWRzIHsNCj4+ICsJCWNvbXBhdGlibGUgPSAiZ3Bpby1sZWRzIjsN
Cj4gWyAuLi4gXQ0KPg0KPj4gKwkJbGVkX2h0X2MzX2JiOiBsZWQtc2ZwLTIgew0KPj4gKwkJCWNv
bG9yID0gPExFRF9DT0xPUl9JRF9HUkVFTj47DQo+PiArCQkJZGVmYXVsdC1zdGF0ZSA9ICJvZmYi
Ow0KPj4gKwkJCWZ1bmN0aW9uID0gTEVEX0ZVTkNUSU9OX0xBTjsNCj4+ICsJCQlmdW5jdGlvbi1l
bnVtZXJhdG9yID0gPDI+Ow0KPj4gKwkJCWdwaW9zID0gPCZleHBhbmRlcjMgMTMgR1BJT19BQ1RJ
VkVfTE9XPjsNCj4+ICsJCQl0cmlnZ2VyLXNvdXJjZXMgPSA8JmRwbWFjMTU+Ow0KPj4gKwkJCWxp
bnV4LGRlZmF1bHQtdHJpZ2dlciA9ICJuZXRkZXYiOw0KPj4gKwkJfTsNCj4+ICsNCj4+ICsJCWxl
ZF9odF9jM19hdDogbGVkLXNmcC0zIHsNCj4+ICsJCQljb2xvciA9IDxMRURfQ09MT1JfSURfR1JF
RU4+Ow0KPj4gKwkJCWRlZmF1bHQtc3RhdGUgPSAib2ZmIjsNCj4+ICsJCQlmdW5jdGlvbiA9IExF
RF9GVU5DVElPTl9MQU47DQo+PiArCQkJZnVuY3Rpb24tZW51bWVyYXRvciA9IDwyPjsNCj4gRG9l
cyB0aGlzIG5vZGUgaGF2ZSBhIGR1cGxpY2F0ZSBmdW5jdGlvbi1lbnVtZXJhdG9yPw0KUXVldWVk
IGZvciB2Ni4NCj4NCj4gSXQgc2hhcmVzIHRoZSBzYW1lIHZhbHVlIGFzIHRoZSBwcmVjZWRpbmcg
bGVkX2h0X2MzX2JiIChsZWQtc2ZwLTIpIG5vZGUuDQo+DQo+PiArCQkJZ3Bpb3MgPSA8JmV4cGFu
ZGVyMyAxMSBHUElPX0FDVElWRV9MT1c+Ow0KPj4gKwkJCXRyaWdnZXItc291cmNlcyA9IDwmZHBt
YWM2PjsNCj4gRG8gdGhlIHJlZmVyZW5jZWQgZHBtYWMgbm9kZXMgbGFjayB0aGUgI3RyaWdnZXIt
c291cmNlLWNlbGxzIHByb3BlcnR5Pw0KVGhleSBkbywgYW5kIHBvc3NpYmx5IHRoZXkgbmVlZCB0
byBrZWVwIGxhY2tpbmcgaXQuDQpNQUNzIGRvIG5vdCAoY3VycmVudGx5KSBwcm92aWRlIExFRCB0
cmlnZ2Vycywgb25seSBsaW51eCBuZXRkZXZzIGRvLg0KDQpUaGlzIGRvZXMgbm90IGZhaWwgZHRi
c19jaGVjayBhcyBvZiB2Ni4xLWMxLg0KDQo+DQo+IEFjY29yZGluZyB0byB0aGUgc3RhbmRhcmQg
TEVEIHRyaWdnZXItc291cmNlIGJpbmRpbmcsIGFueSBwcm92aWRlciBub2RlIG11c3QNCj4gZGVm
aW5lIHRoaXMgcHJvcGVydHkuIFRoZSBiYXNlIGRwbWFjIG5vZGVzIGluIGZzbC1seDIxNjBhLmR0
c2kgZG8gbm90IGFwcGVhcg0KPiB0byBkZWZpbmUgaXQuDQo+DQo+IFsgLi4uIF0NCj4NCj4+ICsJ
bXV4LWNvbnRyb2xsZXIgew0KPj4gKwkJY29tcGF0aWJsZSA9ICJncGlvLW11eCI7DQo+PiArCQkj
bXV4LWNvbnRyb2wtY2VsbHMgPSA8MD47DQo+PiArCQkvKg0KPj4gKwkJICogVGhpcyBncGlvIGNv
bnRyb2xsZWQgbXV4IGNhbiByb3V0ZSB0aGUgdGFjaG8gc2lnbmFscyBvZiA2IFBXTSBGQU4gY29u
bmVjdG9ycw0KPj4gKwkJICogdG8gdGhlIHRhY2hvIGlucHV0cyBvZiBib3RoIENFWC03IG1vZHVs
ZXMgKHR3aW5zKS4NCj4+ICsJCSAqDQo+PiArCQkgKiBUaGUgZmlyc3QgdHdpbiBjb250cm9scyB0
aGlzIG11eCBhbmQgbW9uaXRvcnMgZm91ciBmYW4gY29ubmVjdG9ycywgdHdvIGludGVuZGVkDQo+
PiArCQkgKiBmb3IgaXRzZWxmLCBhbmQgdHdvIGZvciB0aGUgT0NQIGNhcmQuDQo+PiArCQkgKg0K
Pj4gKwkJICogVGhlIHNlY29uZCB0d2luIG1vbml0b3JzIG9ubHkgdHdvIGZhbiBjb25uZWN0b3Jz
IGludGVuZGVkIGZvciBpdHNlbGYuDQo+PiArCQkgKg0KPj4gKwkJICogVGhlIHRhYmxlIGJlbG93
IG1hcHMgc2VsZWN0b3IgR1BJTyBzdGF0ZXMgdG8gbW9uaXRvcmVkIGZhbiBjb25uZWN0b3IgcGVy
IHR3aW46DQo+PiArCQkgKg0KPj4gKwkJICogfCBTRUwxIHwgU0VMMCB8IFR3aW4gMSB8IFR3aW4g
MiB8DQo+PiArCQkgKiB8IC0tLTogfCAtLS06IHwgOi0tLS0tLXwgLS0tLS0tIHwNCj4+ICsJCSAq
IHwgICAgMCB8ICAgIDAgfCBKMTAgICAgfCAgSjUwMjQgfA0KPj4gKwkJICogfCAgICAwIHwgICAg
MSB8IEo1MDE2ICB8ICBKNTAyNCB8DQo+PiArCQkgKiB8ICAgIDEgfCAgICAwIHwgSjUwMjYgIHwg
IEo1MDI1IHwNCj4+ICsJCSAqIHwgICAgMSB8ICAgIDEgfCBKNTAxMyAgfCAgSjUwMjUgfA0KPj4g
KwkJICovDQo+PiArCQltdXgtZ3Bpb3MgPSA8JmV4cGFuZGVyMCA4IEdQSU9fQUNUSVZFX0hJR0g+
LCAvKiBTRUwwICovDQo+PiArCQkJICAgIDwmZXhwYW5kZXIwIDE1IEdQSU9fQUNUSVZFX0hJR0g+
OyAvKiBTRUwxICovDQo+PiArCX07DQo+IElzIHRoaXMgbXV4LWNvbnRyb2xsZXIgbWlzc2luZyBh
IGxhYmVsIGFuZCBhIGNvbnN1bWVyIG5vZGU/DQo+DQo+IFRoZXJlIGFyZSBubyBod21vbiwgZmFu
LCBvciBvdGhlciBjb25zdW1lciBub2RlcyBkZWZpbmVkIHRoYXQgcmVmZXJlbmNlIGl0Lg0KVGhp
cyBtdXggaXMgaW1wb3NzaWJseSBjb21wbGV4IHRvIHVzZSBmcm9tIGh3bW9uIGRyaXZlci4NCkhl
bmNlIHRoZXJlIGlzIG5vIGNvbnN1bWVyLg==
