Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEE043CEE3
	for <sashiko@lists.linux.dev>; Fri,  2 Oct 2026 21:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790977413; cv=fail; b=d9QjvVfogOpXUj54RFzlIN8rYVmzQLObyOhnXk5xnUclERTGataTj7kzPP/2vQ4A0gP5xALTT3jOLcr+12njP62x4n2ACnEXtFdtQ89vjz083Bmnv76jZEdDDRPDz8WU4EyJpOqIZx81j5txsx3Tmj2+aZywEABiSCwsRtYuF5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790977413; c=relaxed/simple;
	bh=ws8n+Miw7ODf7B2oHxzUvp6pV3Col+BUwN7uB1x9ViM=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dB/6O9DhXsSQp2ZU5YljD13C6XARlmrvLSiY2aIFW5oRKHeJ5bZjGU8Iioy9Ap0tyCWDbfbeGJhe4BEf2QNuWDYpKWPUr56/uhWijOg5jc28WlK/FRriLl4Rf3uBWIdf1hwOyrhTzuF3e5B+WXgtdb6lUz/dbHHeQgkjZ17fEns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=uZqlS4QD; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=irdtRuKS; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=LmJEIsgF reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="uZqlS4QD";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="irdtRuKS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LmJEIsgF"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692L8SJT710307;
	Fri, 2 Oct 2026 14:43:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=pfptdkimsnps; bh=ws8n+Miw
	7ODf7B2oHxzUvp6pV3Col+BUwN7uB1x9ViM=; b=uZqlS4QDWPS7XTzw9L/UWMdj
	TZz0GEBYL4RfU+5ymz1z7cy6CffQ1/Sgt574BIY8GYZetY0U/3+vCjxSnWc9KMB9
	dOO+odpMLHjiARjoaY0zcwP312GcM6qb6qFOxu0uztMnpVi05LrZ2p8J8NVOBfjp
	r9zAKJzdAu9rh1Yjq4DDNmgq56YFWCG3afxxtcV/z6n2pife+tmkyZ2PPDw2sC++
	c1LBffAPY49fOcgocuZ8HpE/sHViAhfDnRiB8ZjPoA6idHVpNx3VR7CRb0kqApcK
	/4HDyijsaS53qQ9AnijB/8jeZs3DyCvco6P8gplANkgbn4wtjFbAlyKSie/Lhw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4h28qymwvw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 02 Oct 2026 14:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1790977404; bh=ws8n+Miw7ODf7B2oHxzUvp6pV3Col+BUwN7uB1x9ViM=;
	h=From:To:CC:Subject:Date:From;
	b=irdtRuKSLhJbGjjFGM1hXXwaPSxbpxLWrIdx4PYvs3mOgjAaLmoMkg2U+pN1YzcSv
	 tVNBPy/mx6HUqQR5tp8W3/jB2SzdlyNQNvk0I7ZVeAqMU/dQKpTd41oNj4a79n1mQI
	 DRzTrLseT/AFUyHvxMvvfLddRlFdNoO746jLNxXLcOCnvNew9YkbRtqLWtXRPJ4uUU
	 GvyEFIkMyupna4MsGMnY1Y8o+FqowY9sRDBKguz0CsVeIONOO+/hFY74Y8Fksgb0kb
	 w65/t4kRi0aM+RZqJqTJGt5UVKKodM6qMeV7ijemVG4rDKl5T9Ig/xCsmNlYXS+dAI
	 kvIxiiOLlNHaQ==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 310E2404F0;
	Fri,  2 Oct 2026 21:43:23 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id A0149A00A6;
	Fri,  2 Oct 2026 21:43:23 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=LmJEIsgF;
	dkim-atps=neutral
Received: from BN1PR07CU003.outbound.protection.outlook.com (mail-bn1pr07cu00304.outbound.protection.outlook.com [40.93.12.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 44AB940409;
	Fri,  2 Oct 2026 21:43:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AsRjobzIzsmAuGZGSjTd41vwpevOdlDAlBkPEHaZuFhui8rQRTR3lQB1PaiCWYBgKanvJAJHD1AKwrVy0an+tIRX8ZYNIHoMdAk3QNKdGYueduBixaV9ZU7wElvthzpzEextSpev+C1ftYQxstxEC1+uEJZH6XiL6/swhAMgzBKA90kJqc3mMZxPRLhoag566crJagKBUVH+lxQAuSdBEMkV8A9WjCzVNHgIq01Xe4ndL+CMG7r802dpKxxWyBN9rqnWZvyHplkPtBeWdSFU2YAf9brz5MLfqfsFo8Rj9+Q8EE5jN9jFMmIyUuTtZ/desG8/nSeSmzhGLlEa6wL4Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ws8n+Miw7ODf7B2oHxzUvp6pV3Col+BUwN7uB1x9ViM=;
 b=ovhI0JAInBoYWXkxKQTncIiJlzmHt2TD3AS6ijUn/zxXCuqOHKH2DT/5z5lLyfia96vNFqLu2LnHXtis4RwmPiM+Usp78e0K7TX1aKVBlAPl1Y2ENxCIRFPsebdL4XctlQ6GRsguvF3zn9AMTaLyKr9z824opBGGw9LhGh3vScWq0AJy/lRR40vl51RUVSUd9nnsG4QW+ge5fVnghHH0nxYvAhBzPVJOlqTyF2ns+GrDlaV3C96Fi5cRrfm5kGsSPghqGjCaktqG+i6krfQaJsWI2TSaztsPR4fLkgWZCIDdSP1GSzffx3NuLoR4qETJ8HNJw8cTTp5DQPDOKcyJOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ws8n+Miw7ODf7B2oHxzUvp6pV3Col+BUwN7uB1x9ViM=;
 b=LmJEIsgF7B+Sxi/p0P4WBh7S6rBlls37Lly7buILcQ+TOzCLGm4CBcbG41vLZ/eRoK7R7sCVKmbGAWGpaI/9lFNfSUn5//7xUPSUf5/MsvYZAgUxL51oJLbWiZTtgG2NGN8Jl8+s6YKSB3ZOCM6PCgBqko+g/pEx2Dwx+jb0sOQ=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by FT1PR12MB222952.namprd12.prod.outlook.com (2603:10b6:170:d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 21:43:20 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 21:43:20 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: "sashiko@lists.linux.dev" <sashiko@lists.linux.dev>
CC: Roman Gushchin <roman.gushchin@linux.dev>
Subject: Request to receive Sashiko DWC2/DWC3 review emails
Thread-Topic: Request to receive Sashiko DWC2/DWC3 review emails
Thread-Index: AQHdUrcKC/ju+DdF+E+dbEqESZmekw==
Date: Fri, 2 Oct 2026 21:43:20 +0000
Message-ID: <asAkHMW-RhP3okYS@vbox>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|FT1PR12MB222952:EE_
x-ms-office365-filtering-correlation-id: 51d67dfd-c61d-4420-4d9c-08df20ce2d2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|56012099006|6133799003|11063799006|18002099003|38070700021;
x-microsoft-antispam-message-info:
 fi5xYBoa+TtY/cKzguSuwbIoPYLLklVD8QIsLxatTkNyb10nr1DFGUx5mACsPLTxgrTfZ1UNNM+aDFljPl1u2mM45w2Gi9wcCBYwIBGQkdNO3cr5qVyG1PothhOIYFy13c5M5ijZ2Xa/Qxsp9iXmSc7aKlUu37oFgNHk8Qw2BX8EYh49hwDcfOHjxZkxFXHD1sy7M5KFFLc9W2tbPDbCMElfpagpIxsnHpd+FnqdqBfOM//oci04EGWAZaQekzdDTx/TtKSnJhWoonexkbSk5axKf32amsTuF3+YBCfzJe4iK5TfOqUSxsrLnadYoX4sG4+fdtszcOGf7FwHdLyxzSvHZ2VkkhD6UExt14+OMHPlCkeRBmFHh7/XkYLmFC0OD60Yjf4b47WMJT6oPpRIbni35PXuHI5AKLmpNayk3nlDuGIkIXVuqnuaCrewV1+cAqfd//WZszxhFrRX67ERcZjigx1akEUNtzqUJjes2eObvqY51vKU4uyVURjLm80b3aU3PCbGGGNzi5gFypBty1cnMJJPUYJJhAbalXU8ywiLezm7zN9eUOuwx/btzZ2azQzc4UbVFsgzsfQfVkJVfY5XUfpeKIEH8HTLXlvYSi88qG7i8F2AeX7dddWfVvGgmzvQeVE/C8ubhROwJFwau+gdMj0w2XPze+UNpDmZbJ57C//QvZVSVC85qoN/Exj+krz/PsJlJMx4k76RLsBq4UZJcM8lyGJ59rnGMBA3/98=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(56012099006)(6133799003)(11063799006)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MlpuQ0NSSEFRTTdKUy9JczJhYlFYL3h4ejhBWG4zbCtwYzZOaUVMWjArK29x?=
 =?utf-8?B?eVJadDdEYUtUTDdvWEVKWW9pcld6aFVZSmNHZTk5MDczdThKTWZnYnU0b1ov?=
 =?utf-8?B?dk1iNGM0TERHcHpSMDd4bnF3STlFL1FHSUtXNFJ2dC9BeEtUcjVzMmk3L1hm?=
 =?utf-8?B?b1dEWiszWllYamZ5c2YrY0wvSDdzYmVUa0FFaUxONkdjZWJZRVRLQ0Z6bzdF?=
 =?utf-8?B?T1BGNnNvK29jYzhQMHBkbytEWWgwRkFCMEhic1RvUVgxc0c0alFiOWhVZGdr?=
 =?utf-8?B?YjhETzV4UEhNV2pZYndxSmpIWmFjREZWbHRqUSt3bFIxcnNYNXBYSkI4d3U3?=
 =?utf-8?B?UnV6dmtGbGQzV3g4d2RINlloSVROVnhOVWZOejFwTld4SmlJUktUYkxEUCtG?=
 =?utf-8?B?TVRqaUlUcHN4aWVoRU5kOUt1c0RoWG12VlRiWGxUdCtEYzg3V2ZzK3VaTVJ2?=
 =?utf-8?B?UTZsdHJjVnRqTFJQNTRKVlJmQlVDYWxCbG42Z2pZbHlXR0htV1VFa3F3Qit0?=
 =?utf-8?B?VGFPRVpXMWE5U3JzdlVPcitqclgyQVlkN04yNGlrOHdQbWRINzZ5b2dFdUto?=
 =?utf-8?B?c3FoeXJoN2dwb0VDK1hvQVB5ZlA5U0QrbnJWNTcxbGhjeHZVRkkyTXFncXBV?=
 =?utf-8?B?UGRFTWJFbHdncy9kMmwvdmhxT0ozS2hRQ04rZnJyTkNwa0tIRGgvMWt1Zzlq?=
 =?utf-8?B?WDhWZ2s4bVpHcUcwMmJjSVN3R2F4MWFuVFd6dm9XTU00VndQaGxFdXhucEhT?=
 =?utf-8?B?SWhvWTljcFE5Y0hkb3V4ZkxnUUY4NEJxQ052UXhQWlhPRXh1TS93WkxHYzVq?=
 =?utf-8?B?TThvYnV0QkpHNi9XTWtTQno1WmRjd2d0d1FTc0NiK05NU2ZOeGZwMzVZTmNK?=
 =?utf-8?B?TCs1Q1lPRGhEK09vaEVLNHY4eUVmYW0vN3c2UTAwNmVJR1gzQ3lNeTlTMUo5?=
 =?utf-8?B?UVJmMURNS21MSE9ZOGErdnFMTVFEamt0VWJFbHlURWp0REVyZzZ1QmowQzRh?=
 =?utf-8?B?K1BjWXpNNUxXVnBSdmNFN1dHTjlhcTFMMFBqVXpqeXg5eEV5cDRBNTZYUysr?=
 =?utf-8?B?RDdrWmdmYk5zTC9kbEdzVDMyM1JJSVU4Zk5rampma1RuNTlEUU94Wlg3QjRs?=
 =?utf-8?B?NkU2ZFBiWThnTnpodGdFWGpMWTlTNy9zVDlLQjl6WElrOUtWTVhUU2Y1Sk5j?=
 =?utf-8?B?aDlXUUl0NTJTcnJCQUEvUzk4THU5SC9UUjJYZGRsQnFVTCsrYS84K2R6d3I3?=
 =?utf-8?B?bzRydTJsa213K0VJUHpEMzFjVnBSaXZjZ1lpSzNXRlE4dnduUnFZdnpVRHUz?=
 =?utf-8?B?eURGbExhYmRkVUszUmY1Y3NoNXFyYUtaaTMyMW5DdzVSRzhIVjhqdUFTV1hH?=
 =?utf-8?B?WTVnQ1VhS2VQOC8xZksySXlhcXhES3JsT1d6cm91RmkyZ0JrOENraGdiUmls?=
 =?utf-8?B?UXNycHNPc2IxVWNySFByNU5zV2FZMXV5ZDVSUE5JM1VTejhCSG9WeHc4MGRv?=
 =?utf-8?B?K2pESlRjWkNOWkFUNTlWbkh1OGwxNEVPd2RYLzlUS2kzTVhVYm03VEhiMTNY?=
 =?utf-8?B?SGxncEozTXp0ZzRmK1NGQWgzYzNidksxaGlsUVN5b0FQTk0zSnZaWHhQSU5t?=
 =?utf-8?B?R3lDNjE2M2loMlgreHVaQVpQaVVaVERZV0JyWkV6YkpFYStrbW1ZSFFDQnBK?=
 =?utf-8?B?bHhuSnVQcVN3bThHNGFIMzBPd3ZNTWhsVXF6dHpVbGQvUVpPQzdsRDdSQnly?=
 =?utf-8?B?NGJTSXNGU0VsUkpwV215cERyS0FXbklxSjNvdzJqUTk0YnFTWTBWazZpOHYz?=
 =?utf-8?B?REV0cHJYUEtqOU91dDl6QU8wWnQzYjZEMlhGOWx4N1l2NWwxblNUdXRGTGdQ?=
 =?utf-8?B?UnZ0L2lwWDF5MlZrMy9GcVpZOUtGc1hFa0VWTEJndHY3YTN2dFdZK3pXSXhK?=
 =?utf-8?B?MWVhOTdwSGh3bVQ3OEVnQndtcHhMTEtSelZHTmN4MTF2K24ra29IMjRuK2Yv?=
 =?utf-8?B?SDdjL2xLS3dkajJrV0lQUGtuaDdMcG9Yam1taWYzODZaa1JsQlY5QWZyVXlv?=
 =?utf-8?B?UWlIeE9pZW5ldjNlcUVDOTM1Z1dPK2xsaVV3dk1rczVDUmc5MUZJdFlBTFpM?=
 =?utf-8?B?S1IrRXdJOHovZkxaL0hBVDZlTTYxdG5VZnl0SStHTWxlVkpqYXByMUFNZTZn?=
 =?utf-8?B?NU4raW13MkVjd0ZvVjZTWGdVOFMzb2R4djlJaS9CNmFVMmkvTkFiUlNaOGVy?=
 =?utf-8?B?NlIxVTdsTSsvV051TnlhWi9EdFFPd2ljcVRmdXR4ekRQMGlzTGMrUEFMQksr?=
 =?utf-8?B?Wk9wbXdVLzFMYnZxNHRBZDlHVHNrV2ZKSTFEWjVEK0YydUxHamNvZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A7ACEBDC455C9D49A6E51E395142EF39@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	WWvMbJLuEP7TtlyDD0L7TjZmOrKTOyewJWrd2GhO03eDA8OQ8JnlcN4yElNnjzHsOltCimmaEwovk5kpg1y4AQmvB98qXnl8IZdCQzktArDa5LFE0fH3WpHlNEd2DAkiHW+MQIhZURopFX0ZYPDMr0xuSQ+RNg09DWdJXwcuaOzdIjK57bheJxy9wBMTDNZHfC4Ta9Qwj8o+18fLxHyzSGSwMVByvpHNNDZA1C5asOKyymwBhC5ziIES0UMQ92zm1CIbXWadm0Ask88jmd0JQtaq7NFAqJqPK1WlT9QWpbXfd1WogaejO1EZZ1i8uc5Fbp4i1XJaxB1W5vFxgQcgVQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6Ui0ZIOJSonr6BtavllweiconhFyn6oObnZofFdiOP1zCIx4X3iHH6ITwpGnPx9Bf5QMd3qNrvVbphtnf3Gh3d/YOtszBikSb9UYuVI8CgqrvScTi6f/XDgGoiHKNo6Ouygg/0+pZ8iJFOIISg1b44ERaKAxIFcO1Nw8BMu0jxHNwvHKytr1Rlnb7F9D0I8xqbv+JUtmTQdNg6rKNv1CKrwA2xLXC60kvSKu6QbXL3P6UPganfG2MI1pvyV1dEEBjC2jLNqDSixFLMN9C3KWHAVBHVctQEQs9GevoAX+mgJmMm9uTjKwdRMlFDnxvSQBwQdo5Qb9VHOWnOJkOzvjY0e9SfktZtAdeiZ1bm0SO42i3rIvzTeEVN/VYCgyZwENRa9fN98KeHNbaEZTi3wiMuRCxFoDhp5NDy0AqiqqyZ3oL3/PIFOrbtCRxTCs8kdPbayBdC0zfbEl7cGU+eEoKsyYszvSrUmLX6SMPNRN/FOrhLuzaqKmXPhDKx29mdy2TJD6s2qJbGCVn5A5w6AFS+fJJJCOtaMOLH5vOc/07kiig9kkYQuRKtnO19AqPVIdIKrZiP7iHm5N/5hpkBrIMJkJbWMay3WEmyqpxLW2QixxCN888PZvOybAeiGtKsdIwnE/4hOYnFa3SdVzch2hcw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51d67dfd-c61d-4420-4d9c-08df20ce2d2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2026 21:43:20.2917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yj2j1HZipJTRL5XBcc4EWxq++K1BDWuDFPnp0ccwER2fv0Nz8P788MpfN+6t91PQKRh8+SzzCLKd02rgyM0VMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR12MB222952
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA4NiBTYWx0ZWRfXzfgYXYWMIzsU
 03AXFyvRwyJYDtolZB1mtuQNh1fu+CuPm64CcdzAqiqz+ju+hp660ReWUhGXVe9l9YWI/HwyKvN
 7zZ+LnHRJsXv7CK75xWIA/WmgBRZZO8=
X-Proofpoint-ORIG-GUID: 39Py9xIXWPykX0UuZk4nxIxWQnKnnghF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA4NiBTYWx0ZWRfX5wFto1yONlzu
 Tch6cQi/WVosGOaWZ0xmPz1Bz6ydHiL9l+9bUcudTSXeAWANui8gnFfdT/TLJ6ba5T3BYystYzN
 PGPsp8CkyRgV9n5zftfUnu5xnWjA/E2R7KJNC6sn91YJZfO9BeL+JbMpk7x8nyqBVUgwenNyhIC
 vqGhLnlRC5OOiwM7QBjxfXuZg69W6YJW6Hs1tuckNJ0KWS5r2I5ILQx5iR5wHxmraDfyLegyQ8E
 7A5cN7B+Uzed2jP+54hsjdtm/fMBRpfzre4QL3X6Rf0YvUiq8MCDRfx8tvFODfDJTTM3ZXgKleF
 gRoNGQ9xW2BDGjYhTx2+tRF/MksFwTqtSt049pS/PBm8N1yWdugYd3K5A9M02PqZxXHEEeKooRa
 tyrAPgeTYm5WtGG3yiLC96wWwoBxy2oAGKkqSuVqVAny92M+mMCieYgr4yaP/yN+FwBfo58sx66
 720kv+W6PxW6ZyzM8nw==
X-Authority-Analysis: v=2.4 cv=Vrm2kO2n c=1 sm=1 tr=0 ts=6ac0257d cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=jIQo8A4GAAAA:8 a=VwQbUJbxAAAA:8 a=XExO5iI1jyEue7rO700A:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10
X-Proofpoint-GUID: 39Py9xIXWPykX0UuZk4nxIxWQnKnnghF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_06,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2610020086

SGksDQoNCkkgbWFpbnRhaW4gdGhlIERXQzIvRFdDMyBkcml2ZXJzIGFuZCB3b3VsZCBsaWtlIHRv
IHJlY2VpdmUgU2FzaGlrbw0KcmV2aWV3IHJlc3VsdHMgZm9yIHBhdGNoZXMgaGFuZGxlZCBieSBs
aW51eC11c2IuDQoNClBsZWFzZSBhZGQgdGhpcyBhZGRyZXNzIHRvIHRoZSByZXZpZXcgQ2MgbGlz
dDoNCg0KVGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbQ0KDQpCYXNlZCBvbiBteSB1bmRlcnN0YW5k
aW5nIG9mIFNhc2hpa28sIHRoZSByZXF1ZXN0ZWQgYmVoYXZpb3IgY291bGQgYmUNCnJlcHJlc2Vu
dGVkIGJ5IHRoaXMgZXhhbXBsZSBwb2xpY3k6DQoNCltzdWJzeXN0ZW1zLnVzYi1kd2MzXQ0KbGlz
dHMgPSBbImxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmciXQ0KcmVwbHlfYWxsID0gZmFsc2UNCnJl
cGx5X3RvX2F1dGhvciA9IHRydWUNCmNjX2luZGl2aWR1YWxzID0gZmFsc2UNCmNjID0gWyJUaGlu
aC5OZ3V5ZW5Ac3lub3BzeXMuY29tIl0NCg0KVGhpcyBpcyBvbmx5IGFuIGV4YW1wbGUgYmFzZWQg
b24gbXkgdW5kZXJzdGFuZGluZzsgcGxlYXNlIGFwcGx5IHRoZQ0KYXBwcm9wcmlhdGUgY29uZmln
dXJhdGlvbi4gTGV0IG1lIGtub3cgaWYgeW91IG5lZWQgYW55IGFkZGl0aW9uYWwgaW5mby4NCg0K
VGhhbmtzLA0KVGhpbmg=
