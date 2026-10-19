Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792431047;
	b=YkiEew693fhmf59bw4V6Ea52H/LIrb2bumYWLgks306ehi6YXpAJWEx5vjBRGIengjZ0
	 zKCcIzcgiTxK8X1nG9/C5EMUXh3aS6Senx7hQtj5A9ml3p4C6OApcQE50pfB1bhrpgAnF
	 00vx3wAF+T5+6vaIyfddcW8WVdBOWV+nc/M5P9vP+PkeDhtkK9rIV6yDd/dcxIbNfbPEX
	 3h2cdsP/SKb4lAidQ53Nc/kajfmPGtDs9/TVQ7HzGZeJDxgQCON/UbLhMHel8GGQUNh5A
	 miCb4hmny69buR/WfdmwJWKaX/aUXbc2ej+4pDckC65vnx58edllaiUDi8ZWRkLe69g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792431047;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=7KCj8UwHIazehufDcetyX8ff6fmVpw3O/a3QJH0vAE8=;
	b=DECeUn9jAOzbbBmaaoB18QmvSASq9zQ93VrnlgzxRFiFT0OJtKUDoXAOTccp9xvE8Wav
	 aa8gGwnAvh+U+VFQRGsFdxOafQW+xVavRS+Be1lQG5cguv3eYu4V8IV9RssXqGUL0PE+K
	 dOE2jxqEwoy8y1Yx9zzvDU9zVxQxSYsIdB2dQ8tZ2qGRO1PjgySGYOqwSec6xC/ZnI1nP
	 5HP3F6Y65kLjSV6JekNJtqsKlKm5a8/iQRIJrfYoDHremsuYtNXxHzAZ4U0aCksZ9U+Ge
	 8CoofQElrrv81cwQWHh+GmIRQ2dPO9AYQPWe+iD0YNGEvsDcVMstASyxK4loe52LRjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JDipwopO;
	arc=fail smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B75F606A322;
	Mon, 19 Oct 2026 17:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B75F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JDipwopO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792431045; x=1823967045;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=CZLsL/U2o1918NlUXEOI3sDka2bvDK+S97nZonqv0GM=;
  b=JDipwopOLC17o6XlNa2mUVBe62Pyw1fjpVz3Q7VgqhQgpENfzBqpPhfN
   CCZU1vAEl7KQPQ5QeRxlM/T8xTQOOEIJmsk7mboH+jCMR+CwNMnMA586j
   RWMqkBAYGrnneFKrQzLi5fEuYl0Qi6d6sdBqH0pjEefgJYgrja/pckIlY
   3RaCCsWSjDWsDtpe1O3HTjTzBBPDUWIpJTL36sDJiMmCnsHNWQBLvsOrx
   606510amIY0m6j5sQOc0aUAoZYZwT6g6wdJU4rQdNLDr87OK0x275DyIn
   usaQK7ZA7Dh3pYSviEK13A/0hUknbpVUl6YgI5wSg572wcsh70JT9fIOv
   A==;
X-CSE-ConnectionGUID: wOmnPye6SMyx2pPb7Kcdeg==
X-CSE-MsgGUID: sBwIdsR8RZipkGwJBLUJuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1149607"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1149607"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 10:30:18 -0700
X-CSE-ConnectionGUID: 8CjCTRZ2SrubamZdrp0ppA==
X-CSE-MsgGUID: 8E3kocXeQ76bRnInhHPIFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2557495"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 10:30:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 10:30:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 19 Oct 2026 10:30:17 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.32) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 10:30:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HjP6GPZWR5KmqbVq5MDgwJgPQB5Df854gTBXVDEutRDovjCwnEISPQQ5ozL6rWQPiA74tOHXBGMFtNwPi/Vh+67GkKQKC8mhrIuZHVcKycIKTlm3ZbOwztNY6pxn1/DT+xg6BiJoUnHNz+VK3Fj00ws2vkbSZC7voCsQhBSPUoUp1hMGpyxqpv+QwFFSomBbJDdhmaUN72pM5//Khur9oZrsmU6z2VaiP4JqFUyXm3MTy7nHPiFCVZ3qDt5bo2mlOVLFc04qbYWOX7sWPw+PhWFvlSZ0DvYIP8bJ6fA9pxYCB7Z6SHbcot5NW8bLEFEVfKG8aTs14d2EXaoRB5z66w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7KCj8UwHIazehufDcetyX8ff6fmVpw3O/a3QJH0vAE8=;
 b=SuAXn/0EYgn7ogShHsClnHiOb0Z7XeWt459UUJrnB2Lo35pOyBPQRC2mdlbDK7Gk+JkiPYeB07g3NWcJHKgU1lVp+wk2nrOmkm/OtqClKZ+hSUh3yXGSCCfPoiQfc0NwWIISe7cGxnFzqhiND1wqCrdJv77eL+C5gPIOjBz/yKBPgAjXHEIjSEXp7ZsQW7jyzap6JNCMY+0kjaSePOkE2CdLU4PsliOt9GpOznjHNRBurse3U+3zeZtsD7ktN7IPIwV4nXSTHsPQ/smTmISqfYA0ECjsTwD4xmxw+7Hxgb+i23jv/Ig6drjNuaWn4b64Wvx5dSS+aipZAIuhjW1BpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by IA1PR11MB6172.namprd11.prod.outlook.com (2603:10b6:208:3e8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 17:30:08 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 17:30:08 +0000
Date: Mon, 19 Oct 2026 13:30:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Julia Lawall <Julia.Lawall@inria.fr>
CC: Michal Simek <monstr@monstr.eu>, David Woodhouse <dwmw2@infradead.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	<ksummit@lists.linux.dev>, <sashiko@lists.linux.dev>
Subject: Re: Patch pre-submission to Sashiko
Message-ID: <atZTnSTdSUzYCEm-@intel.com>
References: <6e66c03d-4c96-4199-b45d-42a0abe251e2@monstr.eu>
 <55AD23E0-119B-46D3-8E1B-676686BB1CDB@inria.fr>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <55AD23E0-119B-46D3-8E1B-676686BB1CDB@inria.fr>
X-ClientProxiedBy: SJ0PR03CA0098.namprd03.prod.outlook.com
 (2603:10b6:a03:333::13) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|IA1PR11MB6172:EE_
X-MS-Office365-Filtering-Correlation-Id: a3d708f7-d0c1-498d-c0de-08df2e069f12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|11063799006|4143699003|261009223027099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: XGGAfQALEEnG8s1QfQ5qYYd8YjseHJbixL43BZFExyEb6xplbE2io9XLhC000+887T4am1gjLMsGxMrum/RpvA5ONCgrwVX1yDKs8snumcuDv0tHdDJdRGSCa0I7uIc9HnsYbq+pxKp88FcD4Hhl33CF0etOoXmEvpZuzLOT5CTJtQYFyZgltnEawxYQDjZmHePIQDKtSmwDYBzEwGC9mnMyoLLI1KfJ1zoLJSxGRTGJyOAORdcXLmzcya6fa6yBePXm97OqH4Uzn2DNIVQ9CNijIQO+HEr5bHY235BTVuJH/NpFN7CYsjb29ADzvIfrPzUi4pQJ7GLpB7jrpAVkkIhA7zIrsbXnEMd7JSWVCTnQXNfpjtkZMBBd/fCOoo7T6Db/n3lyLRECpfEhaIpqYNG68HYoGbpxoV4uG4s6prEjOxkvBUjHBauzjd7qbAVmbvc2c2Puca/A2P2UqU/95kHRbX0zCW/TIVf9PoDXdwtsrSM9WH5ojOg/X2nbCgV3pa/BZ4sX9opAS08J3fxnDDqfywBDdN0vi3EFyX03oPL87KX9hT1xBcpCT/HS2bUDLsqJXpJs22CbWc+bK6DDz4E01jvm1o/YhQNtleGbjmc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB7180.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(11063799006)(4143699003)(261009223027099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVpQdkxvSmVvNDZVZUx3V2NpUCtyaE5jNmJZWDc1SkRjZ2tGODlKdVUzYzRJ?=
 =?utf-8?B?K2NYV2ozQ3BRZEZtb3o4VWN1N0NJZzE2cG96VUpNU1JscmVhNk9kZEFQZ0hw?=
 =?utf-8?B?RWUrcmVPY1g4YllDck1ycWxrWlhRK3RYSVdiT1F2WlVkUndEWGFST1pPOUoz?=
 =?utf-8?B?S0tPOGd1WlpWSGI3Z3E5aVpCTFpxSkZmQjlyUTY3UGNObUYyZEsrcis5NDRJ?=
 =?utf-8?B?R2dqNkZCOGdPdUo4MFBDNWdpTWN1c2NjNWJNNEpnOWt4S3hWMyttVkhlbnRO?=
 =?utf-8?B?Y1RxZzhYQzJKNUJZR09hYlRvSnV0eVhqM0hGR3Vrbk9IbkFtbzRJbzdBVEFx?=
 =?utf-8?B?OU9sYnk3NExxOTByMkJucUpQZWRqUTI4VEEyWnNVMXh6VjF6TDhOQ0ZkcDUr?=
 =?utf-8?B?NzlkWGJMT1FxemF2M1NOM2plVmdnZHFRYk9xVmtsT0QvbytJUm4yVU5jL2pQ?=
 =?utf-8?B?ZXd3clNiSGVsc1lsb3c3eVJHRzRvR29sMGVIVkxYZUQwd3l3WlRNYnJYMnVi?=
 =?utf-8?B?TUNNZkp4cTZVSmRnSFVXcGdYOWdHQmd6MUFTU3VNVWRodkdYZ1FDZ3pteDJk?=
 =?utf-8?B?ZEVvY0RJaXBPdzFRU3VaUEdRRzZ6OHVrVWtQdVhQREVXcTRnVllCeVlBVDhB?=
 =?utf-8?B?bW5ETEQxcTJyd3Y0ZXV2dkFxQ1FqYTZUSVZkZlY3b2JCcGxFRXJhS1RPT29X?=
 =?utf-8?B?a3NGblNNTStydldPT0RmZm53Z2F5L2pkTXdPM3JpdGUwbHd1TVhleG9tRWtN?=
 =?utf-8?B?bUtRVUJCSTVPaGIvcEdYSHRSeHVsK1U4QmRyMkxjKzNnOTFCSTdWcE4vWHls?=
 =?utf-8?B?WlhLcW5GMjh4c2k2RnhESDdjemUrUFZjZEt0TGoxMUNmV2c2MDIreDgwMk5E?=
 =?utf-8?B?SFRDMTRyU1BocVhSMmhJNUw1QVcxRFRCNFRjdkFVWjBFbXNXaytEWU5MOWg2?=
 =?utf-8?B?NStxTVlUN01NZnY1bzBDRGEzMzZhdkRPT1hLSUcvU0E2MC9VSktvdDBaSDRU?=
 =?utf-8?B?Z3Fkdk5HaXp6OTFBc05oYUlKZmdpSWNzMklUaVMvczlVOWdOSmJrQ0g3bjA4?=
 =?utf-8?B?dStjSmdseVVKZWd0ckkzT042WXdyejUxeEIvUFFiUG9xWHRJQmJCYlNvcUV2?=
 =?utf-8?B?RWRUWkM4cGlqN3JJUW1sRkh0bUJwRGUrc1dHM3RHNE1xYnNKWnJheGUyQlZz?=
 =?utf-8?B?RFNJaThacGdXa25FYnhycUxQMGtmSUtEcG4vY0dCL3FuMU5sMlVwQlEveHNa?=
 =?utf-8?B?Q3VIalk2Y2swVG41YVFYNWM1RlZBVkREbkxkazcwK3RTYmprWlVLZE1ZM05I?=
 =?utf-8?B?dTloc1F2Y1BFSDljLzVnQlMzRVZlQUFHajRJMVBsclhRS3orVTFmYnk3bFlP?=
 =?utf-8?B?c05CL0VYMjF5Ylcrdm54SWE1cU12L0ppYnkycGlnaDlEZnE0U3VwREl6MUdy?=
 =?utf-8?B?TXlnOVMyMzFGSndsdEZ6N1l6VUZmQWFtTWo1MkZZMDNkc1hPcG5IVU4rMHRN?=
 =?utf-8?B?RTZwV3JLVnNmaWpDamJCUklRRXNkQXc2ZGhBWFlvTkYrbU9vVGhnblFyaTMv?=
 =?utf-8?B?c3NXVU1vMlUwWTVhM0IxdzIrc2xIZHg4MGt4OEFBRU4yWmlKOHFNTDNmQnFo?=
 =?utf-8?B?SEY2QkdyYTc0ZVBDOW1zaFVVN0pQenIxK1VjZG1Ed1ppZkFHcGdyZWZIOE95?=
 =?utf-8?B?VGxqaWs5U2dzdjFXeTZHaG9YUElGeDF3UWNKcmhyTVhLbTFxcHFrOVZvYVZB?=
 =?utf-8?B?MHFtOVFId0czSlRZQ3cvSkNtc3E5aVBtNUU1YklPZDR3NmFEV011REhjQ3Bl?=
 =?utf-8?B?SHhKOFJDcFRNdEtTUzdnNmlWeCttMmFrMU1RU3ljcDBPV2RJOVd3VWJhbFJr?=
 =?utf-8?B?SU92Q202UkUwdWR6TGQxRzNPRVhaNUdEOEt2Wktxd0RvbkdXU2hFQXJ4RWVk?=
 =?utf-8?B?Zk9PU2N0VjdidXpNRXFibU4yNndtc09mUFYyYksxbWVqOVZ2NEdxRGZVOFNz?=
 =?utf-8?B?U0RwMTBuUFA4YXVNY1F4Zm5KZUpraG9HTGdQcGNIdHpiZjQ1TVlmMHE4OWpY?=
 =?utf-8?B?Q3BjNDVhZEtWTnIrQUxiclkwdCs2WXRqbmExV1BPN3FCWnZyNGRubGxtWlZs?=
 =?utf-8?B?Q1ZOWktsdTFPT0dGUElZQnJGY1JpbW1ja090OCt3Q3Y5dTJMZlNMRVVWeGpw?=
 =?utf-8?B?THpvWm91QmMwQzVFUFlFNGNWWGUvSEIvTUgyMTdSdWZpOXpZVC9QZDc4UStC?=
 =?utf-8?B?cXZnL0JWNFgrRnFhZWkyVWhSdFFGN3paYzJ3a2xvZWFzWFM4cTJiMXI2dFR3?=
 =?utf-8?B?MmtTazF2UGZ4cS9LdERJdU5VcytUL0R0cHRjRHVERWtuVXBhcjlHUT09?=
X-Exchange-RoutingPolicyChecked: 0hadZSSiHwyamjmZ2aZtPhDykwk1DnDSqbfSgSpN9anNzpBFgaCpy41iVxmjyPy3a5EWwZS4ikSISPnNahVAEeYduzCf4fimk2kbDytmooYi5OX7Hv2bjHCsVbW1xF8CxTE1mbkCS5NP0WduwpAQMbugVCyXL+sgsW4ynzrd0A+QZu7S7k8jmihMJgdyV/tengtDSvKPm2MOuimfwW3wHiI2jrmOMcimPG+Ts74VF4IZDpnDTvKDMChun0BHTsm89SBhse9N5QZaD3tNuI7o0pGjx3ZdnibN48qoN9WN3oacP+9aoT+vutBMfu9y1Cb54tdssege1NfaQQoyV/7Meg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a3d708f7-d0c1-498d-c0de-08df2e069f12
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 17:30:08.6330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNz5RTOm2hhttkPwAq/VL+GEp7SOoBaaxY7z13LOhJWpbGW9pQqi8/Ho086SrsV9znR+LImG1S22YV5+4+e8FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6172
X-OriginatorOrg: intel.com

On Mon, Oct 19, 2026 at 08:57:23AM -0400, Julia Lawall wrote:
> 
> 
> > On 19 Oct 2026, at 08:46, Michal Simek <monstr@monstr.eu> wrote:
> > 
> > ﻿
> > 
> >> On 10/19/26 14:02, Julia Lawall wrote:
> >>> On Mon, 19 Oct 2026, Michal Simek wrote:
> >>> 
> >>> 
> >>> On 10/19/26 09:26, David Woodhouse wrote:
> >>>> On Mon, 2026-10-19 at 08:25 +0200, Krzysztof Kozlowski wrote:
> >>>>> I assume you mean they will be running it through Sashiko
> >>>>> infrastructure, so using sponsored tokens. Otherwise that possibility is
> >>>>> already there - you can run Sashiko, just a matter of money.
> >>>> 
> >>>> I have a patchset in flight where I *have* been running Sashiko (as
> >>>> well as lots of self-tests) locally, and then got further feedback on
> >>>> the list from the public Sashiko which my own run hadn't seen. Twice.
> >>>> 
> >>>> I still need to send v3...
> >>> 
> >>> Isn't it better to create a new mailing list and filter all CCs/To?
> >>> People can send patches to that mailing list and get reply without CCing
> >>> maintainers and mailing lists. They can run a lot of iterations like that.
> >>> When it is clear they can send clear v1 in a normal way.
> >> This isn't just free tokens for anyone who wants to make a change to the
> >> Linux kernel, not necessarily a change that will ever be sent to a
> >> maintainer?
> > Isn't this something what people can do even now? They will only keep mailing list and maintainer in CC.
> 
> There is still the illusion that the code risks ending up in the kernel. I guess that even with the Sashiko only list the code is still public, so perhaps that is dissuasive.

Perhaps if there was some way to point out to Sashiko where the github for that
series is and some button to request redo-review, then the polution on the
mailing list doesn't exist while dev isn't sure that the Sashiko is okay
with the changes.

The problem with this idea might be the abuse of the tokens indeed.

I also believe that the delayed Sashiko response is not good and it only
makes the pain longer.

Local runs of Sashiko might also not cover everything because of tokens
or models limitation. Then, there will always be the risk of local limited
setup not catching the same things and the loop in public mailing list to
continue.

> 
> 
> > 
> > Thanks,
> > Michal
> > 
> > --
> > Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
> > w: www.monstr.eu p: +42-0-721842854
> > Maintainer of Linux kernel - Xilinx Microblaze
> > Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
> > U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
> > TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs
> > 
> 
> 
