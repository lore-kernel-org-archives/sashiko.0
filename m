Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028D5547063
	for <sashiko@lists.linux.dev>; Tue,  6 Oct 2026 00:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791246904; cv=fail; b=eDQJ7TUA7Bu2Lt6meiDtFioO1i0kwxFCH8tJ8fC8UyQ5ABatb+InReKWNk6AJCeG2C1RAzbc6aNAuls9EnTafpA7F06mYjkfEZ5dcmztd1rBiDQhinBfZlOwCAx6zWDGT6r3u84lhcMDzTR7gtlnCqdT96bDPiy4yu0/jRB/pJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791246904; c=relaxed/simple;
	bh=Xhb7tOEi8vjn+u4ro32f4hUhxl8dgmf7VQPO3gDD8lo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eWwJ1CWlcKkqIg6ZWygFwmHZn6FL/Vyole/VWR8ZtK7nsuG9VCXkuZnLTaiLGpRnCLyaKhCfURq7E+8t/fmNeZ3n/tyOZQeNu+/t5dyVZbk3lm0HPLXZ8AJiQxHP4oXJ1Gd0rkyCeDKB5N4iQssX0t4yi0AADP0s6uGqP0J6AkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=fT7B8ues; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=jl7SsczA; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=lC6/o4qW reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fT7B8ues";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jl7SsczA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lC6/o4qW"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695IcG462261679;
	Mon, 5 Oct 2026 17:34:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=Xhb7tOEi8vjn+u4ro32f4hUhxl8dgmf7VQPO3gDD8lo=; b=
	fT7B8uesR+C1XpA29/rjiZAhszBqFEIK9618b/pw2Wnsg9me2krvz9P7w9Q6RLzR
	/qmd6vLEXk4Fx5vxet8aecLpYkAAr8p3Au7BvO444nJpuOixp7E5A12JRDLZwKc3
	PsV/puICzfOyAi11zYO7KCDMyxThug888JZak+zrfN9JudTgyazFR4Q1EQY4INqQ
	ADbPe5MWU0cQN+n7hoPsO80VtzlVgkvCibMOndleNaD75h1t4ZFaNn6rFEcR1T3i
	F+4VS3RxXaZHWogzS4HZ+vol0sTm8Ni6afzBjPG3uhpxK5uBzNXnXGtv7iXPowrq
	iMEAOsYsPRSUbdDwOCpUbA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4h4gwsa6xm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 17:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1791246892; bh=Xhb7tOEi8vjn+u4ro32f4hUhxl8dgmf7VQPO3gDD8lo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=jl7SsczAGrYxYK/sxVQcBEApIPKb6XSwtPtn+Q1NbGuaQW4+mCG9SpCJkV3TuA5A/
	 AeIJtlCuxgYdeyrWjybAgx9CU24t7O4NQL2QkUu9GCEbYqxQs2/LgDhj/mnqweHeRr
	 pzs3LiT2AxDLVxiT5rTawqnfv3V2j6Ls9c73KqnqFCG1ssGP42vfqA1AoNHozei34C
	 uN/ELNmqdXc2vni5mN6GpdgSpJzdOLdsu70XfV9WEzcPtrB72OY1rDcHh2k6fMF3oC
	 b2xkDBZ9Ti4jUv48ATyx0pLECKJvuMaegl+2GYFrr2QdGn347e12fkInFdPLWExWRu
	 xRC7IrSgFh0hA==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7BEA0401DD;
	Tue,  6 Oct 2026 00:34:52 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 1BB58A0351;
	Tue,  6 Oct 2026 00:34:52 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=lC6/o4qW;
	dkim-atps=neutral
Received: from SN1PR07CU001.outbound.protection.outlook.com (mail-sn1pr07cu00101.outbound.protection.outlook.com [40.93.14.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C397B40348;
	Tue,  6 Oct 2026 00:34:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGKX3PUFf2596XBaIeQ3LFqW6nyBp6mStOj07r4ksba9A1AXLRmDSmbhDlsYaDGdy/wYbn5BI2gfdyKW0z2sXmQlip3VB+TAFlc5T+ioo/zqbn4/1U6bxCEcv6QOI4OHGOIVYVz1RMpRISiqAFXUGaVzcsmO8wH8o/ws8OHhwuZBMiwOLU1UT4bpRPkfV4UYQKGpzEjYURsnAKCs8eUp6AducGNTmJVq5crZk4xaHp6CFctir0/ImmxkDs7P+rrf6tYIVEwCruGDDdz1DaF4URtapYrxxViGcrGhDrDSXnqfTH3t8ZwruXhzj8X7uKT8sLYY8S8LsZy8unfUZrpvUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xhb7tOEi8vjn+u4ro32f4hUhxl8dgmf7VQPO3gDD8lo=;
 b=eRLM5UkqcQutNbVvNx/Wc7KNn7sAhf1Geij8XPfzpeT8wdYVojikJ/JGGcQUJABLMS+QxQNRPtXfg+yeUC2NI7hBUXeehg/sdhUfdbxU8kIJBQh/xvS5bROQJ4XY2fbBwuoBjxVxyqE3Wi2bjK27ftVhZGWv7vWA6tKpKvGO9TWfKBSAMVBaLIyzBoZM5l7Jc8clvuTHtiH2ZIZvi/kkyiJuAtvaiFb5djMz8z9JJnojEK8jh9KTElRfIGGiIz9e/DDJwsEbWNjMO0P+5Da2NOcpsMjX+Mc21NM98RIK7V4WmxM/Ytz3XrY3r3e+qqWpjQfToeLsKsK0bXTz75wVcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xhb7tOEi8vjn+u4ro32f4hUhxl8dgmf7VQPO3gDD8lo=;
 b=lC6/o4qWpCQATPjGEVCgRR5L3EuauXUH06/e3/jzkQ0x49GRa91uUbvJJLo9MRmQB6SfbD5mRSrE7uH/No0u3Y3WnrGRMk92ssCC528lig/e2MOlxTa2pEZbpuj3CVBYTHZquSisCSAuwe0lR86EVmwncaTb8YiZYUSBe+4d3Ok=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by PH7PR12MB6884.namprd12.prod.outlook.com (2603:10b6:510:1ba::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 00:34:45 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 00:34:38 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "sashiko@lists.linux.dev" <sashiko@lists.linux.dev>
Subject: Re: Request to receive Sashiko DWC2/DWC3 review emails
Thread-Topic: Request to receive Sashiko DWC2/DWC3 review emails
Thread-Index: AQHdUrcKC/ju+DdF+E+dbEqESZmek7bsQdETgANtr4A=
Date: Tue, 6 Oct 2026 00:34:38 +0000
Message-ID: <asQ7z3c7CIcEvLQe@vbox>
References: <asAkHMW-RhP3okYS@vbox> <7ia4bj9azgos.fsf@castle.c.googlers.com>
In-Reply-To: <7ia4bj9azgos.fsf@castle.c.googlers.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|PH7PR12MB6884:EE_
x-ms-office365-filtering-correlation-id: 182a9665-5b45-40fe-483f-08df23419abc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|56012099006|4143699003|11063799006|6133799003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 cqF2aPurkzvgUY0GTdTmNNLKiFmuBL4Tqo5jGp7yV4X39HI4pDXj3GVpcLQw90BY3wMawAR7RZ88l+M18nU+ov791smQtIMILcpGkQYUiuAs63PbOydF9lusemjKqurb4tXrovTPTGuyrsNyjVXL8y1IuOJXvAxeR3xZ40QIoW+xUKHlbesu4/sfIeCS/+y1fbWNVtxAxc5HgbN+GpcWilqkA3IG+5msLt2vK/qrXgt+31H7Q3P4rMXkawramieUGgySS6uJjCDDs4jy8ZCHwDjj7ITUq0Ia5RPTpAUynTwEqGNf3WsjP/c8o3OV4c4RS0GljAa1R2kujCNvqxgaG2HsFAzo086TWGllw1dvJYkyht1QkIaQgKMukboShSMKCiixBHD9tMhuWLsDUaAg5tGlChOiXDtdXfmjaIlUU9ub6nHUITNL8j/PewLkTG3Eo9ULqiEOqGZDy62fsfUJb94C9sfaglR9UI2Qen5U65odVynbp4LNz/w34Zj6aEAVyFMQhJzYDkvbYw0BW8Ma4q+d35dbs+rZ7fBcC6WQBX7KVLUxdeIEyJhFFpssyQT1ZoFTHwg+djJ++zZmWL6uyxk3UT7sXHGZItQ6YEgo52RQHxkGQLCfKB5n56NjpHAi9x/Cropj7lNMPdW9Wp0OpmsXPluIXSrhIoGZgv5rIWQ5l4Wp5M4wjy1AWaP7mhU+P0EWLUQ17rSVEMzC0XU/mT1InLunXIi2dornl1oHPic=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(56012099006)(4143699003)(11063799006)(6133799003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bk4raU5pRXprdjFiWjh6MU5nRXYwR1d4MkdRSkFCUWxtZW9PczQ2a09TZ1lV?=
 =?utf-8?B?ODIxSGhuYi82ZVpkUUxWYnJJVFoyZDQzQVZhemF5SVFJbmg3VFlWMUtYelNw?=
 =?utf-8?B?RW9NY0cwRFVHczZDTndXVGliaFlJYi92Y0lMc0ZTOGlyODVaMjdQSTZjZjBN?=
 =?utf-8?B?UlZ1NnprYlFiOXU1SzcyUDN1U1o1dkxpNkVuNHh4Qnd3NzZzTi9pcFF3LzRZ?=
 =?utf-8?B?aWsxRnRRblNzUituc29vYUwxWk1LWHZvR3pUTnZyaEFoQUJrK3Bab3hFWS9n?=
 =?utf-8?B?Nm5FakRrdzlVVURhWTdHNWw5OWYxZm5LYVZIbWpEUGJtbkQyVmU3TXphdVJn?=
 =?utf-8?B?TmJPZytMK205ZnJKYXo2czR2elRvZThFVWNaREJNZmN6Zm90bnplV1lmOEZ6?=
 =?utf-8?B?ZjB5ei8yS2NsZ3BwYjhFVEp4TWk1dy9VWkRYUFhySU1lTHBxb2ZmdlYremw0?=
 =?utf-8?B?cDh4ZjdnTmcwZWJzUG1wVm01RDRoNmFsRnQ5UktOUFlObTRTUm14OFhhclZx?=
 =?utf-8?B?NHdkM0V0RmRscVRpMGZPZkFsTTh6L3Q3Z2R0MU05YmZYbUZFOE9JUm1zKzVr?=
 =?utf-8?B?dEMvcXltang1SURNOEoyb1dkck03c1ZiZjBlQlBJbE4wU2lyZ1B6dUw4OTB2?=
 =?utf-8?B?cTNObnM1UUN5SjFaQ21xenpLYS9oZ2UrYVNKaDZmTUFyd0t5eFVETXQ4bWN4?=
 =?utf-8?B?bmpFRzd1YWFPYlQrSkdQQWpobGd6TmdHOUJML1BSM2JkbWl0Y1Z4MXMzSlYv?=
 =?utf-8?B?WXJaSVdtZUNIaXJkbjBZeTJ0Q2RnUG1CMGFLb3h4aWtaMG5hb1FDbDRBR1oy?=
 =?utf-8?B?Q3YvejNKREtoTVJFWW9oSG5PaW5udmM5dlR6UkNSK0h2MW9vNTJwSWpxcHRJ?=
 =?utf-8?B?S2lyR21hcEU3TS8yVExxb0c4cW1xZUhYV1ZvQS81ZTdSMjFSeUFRRzBVU0Rl?=
 =?utf-8?B?bVVLYmRVMjNqUDMzSnZPNUxLS3hBclJXaG1kUkNnKzFqU3Z2cisrb3R6WW03?=
 =?utf-8?B?cG8yTGZJbENYNW1pZVdTOFV3cW13VVNmbDVyaWlMcG1SWG00WVVJZXlkN05Q?=
 =?utf-8?B?d3B0Ym5qbFNOb01lTXVEMW1aSHNRaitpaWw4d2VYcTV4ZGpWWUg5SHlaSG5j?=
 =?utf-8?B?VEx5RTF3TkJTNnM5Uks1M1YzQmxjZEhoNzZqUlFubUhxcVNOT3VPS240SE5j?=
 =?utf-8?B?M0hKZTE2dXd6MmlRcHpMZVRBVGhGemJJeFJTVlYrNTMzQzB2RmY1NVo5T1hK?=
 =?utf-8?B?Rko3aVM0Z242ZW1XdG1CNFdtSGFTdW95Q3VuYWdEeExoMDZWdStxVXAycm5D?=
 =?utf-8?B?emtYdzA5eDlreFNEbTdnTnd4ODVlMUhIaHIvY1hoTzNkSkIvNXA0R2VPS1g4?=
 =?utf-8?B?T0p4L2x1cXVWYVN3dG5SL2dRVjAvTW5ES3dhdHZvSm53czNkOEpCcEo5NUtn?=
 =?utf-8?B?c1JxeWFNZmx2b01qV05HdGJMTXlwTUo2YVhQZmxsRVJ4UUdmVndaZHpWampp?=
 =?utf-8?B?dEVqQ081NzFxYXVFVFdndE1mZGZuSUV6bzdtQ2RPRThQWjVOOEVlcnhRaEhz?=
 =?utf-8?B?bERVWnRoUjRWUkFoK1F0V0FoWnNHTm10WDRlWkRWU2t3SW03Y0JOWkh3VmNp?=
 =?utf-8?B?QjJ0Q28wNHZBUm1IZkt6U1QrNHFyalUvVDd5b0RkSEZDaE9GUVZZY1pzK21G?=
 =?utf-8?B?QjA0MnYzM1FMdlV1ZVN2U0lrTGFBWFE5cTR4MUlKVVhXSEhvQzExSEhTOSto?=
 =?utf-8?B?YzNmM2NrUEptcnlGOUdubmZNK2ZQcnYya2FYZmgxK0Y3NzZ5NVFYOWprNXN1?=
 =?utf-8?B?c2N1NU5rSWFHYW1YK0kyUnExZ2dJTWo3RTZEcmtjQ0Y1UVVzdUhUTjJVcUNa?=
 =?utf-8?B?RWc5TnVaUWdsdmFHdDVPU1FZOWNUNXh6QlNrdzlWM1NvTGFmQ3J5NGUxSUFx?=
 =?utf-8?B?bXIrMlhZcE9iamZwM2E2UElQbTBNOGhYamZmSnFjUVRlb2hjekd2RXdicG83?=
 =?utf-8?B?MFJudFhJRnkvWEk0ZEJlTmtndlhaWXlGM0RvaTRIbEhCUTA3OFdNVlFGRVVz?=
 =?utf-8?B?aUM2bzFvTkl0eklGdjMxSStzNndlRUhqOGRFb0NkMUdMTzExaHRnRFUxbTRj?=
 =?utf-8?B?UnhIampRbFZEVTdMeWVYNzNVeGFMZ3RkQkM0TDdRc25nYWlOWXBZT1BaWmZB?=
 =?utf-8?B?cjlyM1JLWmVWenpNS2RsalU5aERRYk9qaTZhOEl2QkNlZHdRZHlJV2VDRk1m?=
 =?utf-8?B?UUxYSkNscFJ6djEzdEZ1V1RZY01NUnJLTXlTc0kvdVNwOVFZOVByWk1KeHY4?=
 =?utf-8?B?OUx1Q3BQczdwd3JKRG1ETEZwaFBtamdOSFlwVEhONTlEUVlqVTQzZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FDB0A5E312C92C448E75FE3C7047D12D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	5YA/Zj3pzpEfrsUzVJHPbKeA0v9l+S14Hl0aUhrTLTxGHjGMPqYsbdOQYcu5TpM0Dn5WmW0xIrcjrASYZ3QITucRdfgg8FzXhfamp6cU1Ilo3ckeMXcOl1n2MJBaH0mQVmu/ixXp1jFi9nhLBww4OC1AMaRkQmbqR4EmtZloiRBWoOGvRukGr+ohaFXieYYo9sZg+3XOCFqcIe9EvjQnmYiUgphnG9wzjiCUnEOrI27neohkaiAaq5MChEYDVSLPIUio4mrt0n1RqBp5Ly+9mREFlGQurD1Shh45SgeoMhMM5WU8o07Sui8jeC7rqYGSUyVo0FDKOtcS2dpC+HcnXg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7pLScd3zbrozFFfZGMU14gWFF6FtSvm3m5N5Z4Jy0x9XJ2aCb0LMdE72rcYv8tWjstFZ3xfzPhxaUg6GD/mMDZ1UYeZ5IhsdMNVS7qmQS3Lq60hAXbO2leDlnCNH6F6T0rm+NwuqF0CN7evT5Jb7kOsFIfpF747nxnHO4C5/CVPq/EDJkDCHktz7kCPr9Ez3MGk/CeQkwDuODWeLFYMU/3Lv8V7YU/5S+vm1l2E3Ha7YWBjgYbBVBE0e1k0u3rTfkOhIZEUszG62XOhEetSN2Gc2VbGPS8STqgX2hkpvZzCzDjBel0dXo/PGnEuU2dhP5m0HjnqrrNWB6IboQW7QyMzU37ckfiW2wtRDvtCBsPTImx9Fwe8uJmNVYgB1sxdEynd2sJ9snGx2xNQ8drHZaTLclT/nUrgWCBDQD+72auyOplXHF8jypQMkE8kXJFpCuY8IjMFYYXimd//Za6cjgChBUCxNFC3X9HwqZOvYIujGoXpc2k1N2ms3Qarlpq8jWSBaXJPWHg1QyUZ6XrQmRWsOZi5+U5c7uha3WCBFJt8UttVo5l9mJsjktDg9I0NNFo/W4TQwUioXfHg3UPyT/Fz4iNWcKkXF/DrFdzLDPNGz58DDdWlUP0VVAj86cRO8qq3rRd0n38ZGckecF82fIA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 182a9665-5b45-40fe-483f-08df23419abc
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2026 00:34:38.5264
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s/+Re07+soi7VSim+CvycXyICLIHjvAfA65Ub5Y+4iW5Iwom3JAWbg0QtJ7bFnPuLHU0+ruX1qT4pcxT9bog4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6884
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfX2aW8BnGR0kST
 KrrkPN1PgjaCYeZ6jXgcNy0sPMXqRfzzt0Wh3L2RNQS8HaqNgDNR9QM5Q6lCaSdO8SqdYd4Idiv
 xwdJC96SLPC16a9wHnYzvaz54e8rJnbFHAO9lXhFKB3LxHycIWtA0Q3c2jBbJ72VyjgpvQ4Wt8U
 EX1WfhIYOFtVd1KpSkTm2Iegrzgv5Gvd0owgh6nfeo3DIuAOW6ZfrS7VfChRAbJ5HwMy9mKH9To
 3f5qXXyCL7Jwsf1/Lkv2RIqEXCQ2s9Nl5sfX18z8aPKCGDYvT3xR0D3fMXkGhF02jKJ7IgP9N/w
 Qme+2nh1C6y6ZlSeUhn+s7ONrv88SA0fRsL3VC8z8ab4joLyHsPHpzwq1Ta6QK4ydnesRo2Ce/7
 7Bm8Jf8QoGU95qbjpkg/lEcjQkaAJEpFhn/nSf5odsoQtAvznZQ5SgqulTNQHH4aOWsQ2LuSbN9
 cXz3jwb0rbiwDgcF/4w==
X-Authority-Analysis: v=2.4 cv=N968hG9B c=1 sm=1 tr=0 ts=6ac4422d cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=jIQo8A4GAAAA:8 a=VwQbUJbxAAAA:8 a=8UtgFe5Y5A3VeyUC4z4A:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10
X-Proofpoint-GUID: XUZZZHsQPo6HVT4b5m7VaQJ9qNb-6urM
X-Proofpoint-ORIG-GUID: XUZZZHsQPo6HVT4b5m7VaQJ9qNb-6urM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfX/pBlmoayZMAr
 K8VNV5lo97vPn97OfCjBp+xeiY9IUQFrEvBn0AjaueN8OGdtkw8sJ3++1ccqiZKHOKvixSIMQm1
 eTEwMvGcUL13l7z/89Yz/apPyKG/v5U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2610060001

T24gU2F0LCBPY3QgMDMsIDIwMjYsIFJvbWFuIEd1c2hjaGluIHdyb3RlOg0KPiBUaGluaCBOZ3V5
ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+IHdyaXRlczoNCj4gDQo+ID4gSGksDQo+ID4N
Cj4gPiBJIG1haW50YWluIHRoZSBEV0MyL0RXQzMgZHJpdmVycyBhbmQgd291bGQgbGlrZSB0byBy
ZWNlaXZlIFNhc2hpa28NCj4gPiByZXZpZXcgcmVzdWx0cyBmb3IgcGF0Y2hlcyBoYW5kbGVkIGJ5
IGxpbnV4LXVzYi4NCj4gPg0KPiA+IFBsZWFzZSBhZGQgdGhpcyBhZGRyZXNzIHRvIHRoZSByZXZp
ZXcgQ2MgbGlzdDoNCj4gPg0KPiA+IFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20NCj4gPg0KPiA+
IEJhc2VkIG9uIG15IHVuZGVyc3RhbmRpbmcgb2YgU2FzaGlrbywgdGhlIHJlcXVlc3RlZCBiZWhh
dmlvciBjb3VsZCBiZQ0KPiA+IHJlcHJlc2VudGVkIGJ5IHRoaXMgZXhhbXBsZSBwb2xpY3k6DQo+
ID4NCj4gPiBbc3Vic3lzdGVtcy51c2ItZHdjM10NCj4gPiBsaXN0cyA9IFsibGludXgtdXNiQHZn
ZXIua2VybmVsLm9yZyJdDQo+ID4gcmVwbHlfYWxsID0gZmFsc2UNCj4gPiByZXBseV90b19hdXRo
b3IgPSB0cnVlDQo+ID4gY2NfaW5kaXZpZHVhbHMgPSBmYWxzZQ0KPiA+IGNjID0gWyJUaGluaC5O
Z3V5ZW5Ac3lub3BzeXMuY29tIl0NCj4gDQo+IEhpIFRoaW5oLA0KPiANCj4gY3VycmVudGx5IHNh
c2hpa28gb3BlcmF0ZXMgb24gcGVyLW1haWxpbmcgbGlzdCBjb25maWd1cmF0aW9uLA0KPiBzbyBJ
IGNhbiBvbmx5IGVuYWJsZSBpdCBmb3IgYWxsIGxpbnV4LXVzYkAgcGF0Y2hlcy4NCj4gDQo+IERv
IHlvdSBtaW5kIGNoZWNraW5nIHdpdGggb3RoZXIgbWFpbnRhaW5lcnMgaW4gbGludXgtdXNiQCBp
ZiB0aGV5IGFyZQ0KPiBvbmJvYXJkIG9yIG5vdD8NCj4gDQoNCkkgc2VlLiBMZXQgbWUgY2hlY2sg
d2l0aCB0aGUgb3RoZXIgbGludXgtdXNiIG1haW50YWluZXJzIGFuZCBnZXQgYmFjayB0bw0KeW91
LiBUaGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLg0KDQpUaGFua3MsDQpUaGluaA==
