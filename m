Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A5A357CE0
	for <sashiko@lists.linux.dev>; Fri,  2 Oct 2026 23:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790984067; cv=fail; b=DPRrZZugXdKnJ1Zb1S/El/LMEZAceuy2i4CooygIVt0oZzF8/KeZZ+k5+V+NPDhPiq18LjbCmgLhUObG2wacSQf0YRJkk7NPa+g8wh8qz4gGJY6alFZmz5hPwTFUOQMMJ7963r25tiPJmtwBMdEGIQErx4rHL60JmXgI8RgXxc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790984067; c=relaxed/simple;
	bh=fzZiYdnOWi9N7lOElmgogQn5Nh268M//pswFKw/4TLg=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MT1TPOBCxSZaWjflPbgggqLBH8GnMx8vOQwNZikjTTiKqfRGg/1ozM+t8ZVDZVCqN+I2C0JcrqDHyrO6mRKaeYfQn0zhSGZELyqAnbvl9PjCDu/2u/bTl3Yu6heSbdRdJnmmFfoamUpx/L+uW6j+7tVteX29R6sjaAnyk3/k6cA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qo4CrDZJ; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qo4CrDZJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790984065; x=1822520065;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=fzZiYdnOWi9N7lOElmgogQn5Nh268M//pswFKw/4TLg=;
  b=Qo4CrDZJKK6SF4g6HEAy5nsEpv91OkwEgzXKhdcxRgPzxrprmyZJDIyS
   FDjYOahvfRgVdiEN3MtqgZWT25qwD+qv7jtVqT6axZY5RyCxIpXm2qyOT
   uiZmnCKt0Yl1E3B0AkYnB9/C8dFczyO5aZogPgTAMhguStbqM1Ofrwq3L
   C06tv/qpGhp9aJdxBcUv/eXE73TAgbn2Vs8rmtFwG7YomRKxf9ft5SQUK
   3zIincGVnfUcINQaKivDG4T5lQAvpJsKh5ik2yzWCq47CbH8xFRGJHYkV
   UYfc7d7e+uCF5Yrk/hpEQeyjbMmRIBuOEQTU1ppOo+OGk2d2o2hLkxPnL
   A==;
X-CSE-ConnectionGUID: Rcv/D+kjQVCUIeILW3XyJg==
X-CSE-MsgGUID: t/PxqWPpT66+6UrQfvJmaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="91778430"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="91778430"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 16:34:25 -0700
X-CSE-ConnectionGUID: LR0Ha0TCRjOHKvvau3FVjQ==
X-CSE-MsgGUID: aB4YziecRRuYL4c411NDmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="279609288"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 16:34:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 16:34:24 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 2 Oct 2026 16:34:24 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.45) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 16:34:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DH1aJytXDZPHQr14xrUGnK8Wh6As/Ss4Sg7TjKXxYIJzS0gssIsheJiES9H8qI31weDPmmvmY1MCUfLnhPUWVkKpvU/2M5tUogisBHQUorgEF+bn2TuLHFRwFZ6B1UwWg/mBTlCj8iNpDDdkkYlooWpHR0TJozKyehgtwFqgSpsLmTDTyYoV4QgOg8UAlwMPzDNlqSdwZKcOWE30Zm7wkrF6QVTAAfTUuHmrv9EzIOOnR6eX6o8TfzHSJURvcinyUyCA3IH9f5/69bixkP3ZcuFsQX16bISEITV83aiArtTL5q2hqdc+CcafXV0g5pVdOszs7brtabfKSyaFT75xlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXkct1yymexmkAZiH5mX/ge+BLDWEHKo9agfTYTtCR4=;
 b=QNqZ87vRJ64szaCaYS5AgArg/jbHwOgyGOzJY0/n92GM16Dfm0m/X46btP/apVZ4xs3/8mABwn0jV6OhTDruA/yz8aVjvEKIeSBvV1rDF8poUIEgwfF12NaX2Ja+PfwUju7mOJ81Rluu9+CnVPsDrBdiW+9UVWBj4mIYKkDMGT7R7koG8nS2HbBE+NAnGws4+6jU+gQ5oUiE+V7RinrLKErqQZcTev9vOT+QUtK7T8/kTNB2XdwsU00UcHvJA/CbVBhcNQsWtx8bxkwXpjHbMq9u3PrVRdbDviyV8ivwvsrLi7SHPpBTNC6bo5LuvBoHGeam0yuFL070mzSYBBqRWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF0BAC23327.namprd11.prod.outlook.com (2603:10b6:f:fc02::9)
 by LV0PR11MB9839.namprd11.prod.outlook.com (2603:10b6:408:384::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Fri, 2 Oct
 2026 23:34:21 +0000
Received: from DS4PPF0BAC23327.namprd11.prod.outlook.com
 ([fe80::6fbf:c112:d0a8:f1a8]) by DS4PPF0BAC23327.namprd11.prod.outlook.com
 ([fe80::6fbf:c112:d0a8:f1a8%5]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 23:34:21 +0000
Date: Fri, 2 Oct 2026 16:34:07 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
CC: sashiko <sashiko@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>,
	Chris Mason <mason@kernel.org>, Kees Cook <kees@kernel.org>, Jason Gunthorpe
	<jgg@nvidia.com>, Jakub Kicinski <kuba@kernel.org>
Subject: Re: sashiko & pre-existing bugs
Message-ID: <asA_b1s4iVx2_v-U@aschofie-mobl2.lan>
References: <7ia4se37qwvk.fsf@castle.c.googlers.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7ia4se37qwvk.fsf@castle.c.googlers.com>
X-ClientProxiedBy: SJ0PR13CA0229.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::24) To DS4PPF0BAC23327.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::9)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF0BAC23327:EE_|LV0PR11MB9839:EE_
X-MS-Office365-Filtering-Correlation-Id: 74826276-33b7-4505-406e-08df20ddaf04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|6133799003|18002099003|22082099003|10067099003|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: uxhYfje//A7OUa4F/XtzaAiVCVfwOIQlW01gvPVLev3fLY4lWKUGQpTb+cxO+sMsmLl3/ZZrcfK/Sualxb2l8io5hvF7FWojR2camZ/Lkv+0NWzqXMe7xX7tlEozBrFyB9kXtGlIIu+GJuYacGx6kE4j5cF1wK0QsFKNAwqTLvXarXgwL7F4WvZdQ4rfGhjEg0oex82eeBbYxYuEfFvOwT+V0EaRSC/DfKTc50XyQmyaYBdrTvMSvZ9zw6KNH1IW8khKUD4Bj+Ws7DEpcMPFWsg9FoUbP3c0PlgZUnVb9E3pcS74vQl7Z1w0mfFeQ+yp2bGMfVdlDgF1YTuJl/EN7IG1AtRwhNwn5kgBxZciuksTrtyUaAR3DOFUPFAnXpwKbQrNciNMZeDHrFgABlaRuoTwyupHADcs86y4yhiuBrgqL9JycEgiDjGHO3TZ6noMmLc0NJBos+UvQeqCnEDMIJ1uyk3bELLhwp0CWe4rJj2uLPfMmvSATdWHZxReFFmcURcbUg+puwBHA65nTDy/7O9AUm6lpVSwlFWrjRX6rXS9vBesuEOCP6EdhIViXsXH5cDW3tKP7KppCUscUU6WSHARCA5eSSSgOwrx13XONODUaL6S+OIztQ3c0z4z+OGg9R2Yrj/Pv9eJ/ofutCV06mSKOmhB1Vmt9dAr3YzhlC8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF0BAC23327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(10067099003)(56012099006)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?20I8yLoDJOfn8qQMt2yVkCTDPL7iLgaA4EI6kw+8Rs0+NRQD6FEwQ2awotYs?=
 =?us-ascii?Q?ENV7xx1X6sq4d9nEXz8UvMAz6lmAICEENf9G3kIn3o2+m55ZbDmyTST8pI+z?=
 =?us-ascii?Q?pV/ki4GFzHsLpVftQR6pUVEis5Vp1KDYs0QXJIYRkaaxegyqeORU3aDzXpjb?=
 =?us-ascii?Q?n5uoCccM/rid2Y/aLLAimT+ySS5mm9Lc9iPSLYO36u9LM6bY29moJsgTXecd?=
 =?us-ascii?Q?wKI/w2ZsJO5DBQfL6eDt6tX2I3EMhQdO6yoQHDC0GyE5FzQXkWPPb+L7jcaJ?=
 =?us-ascii?Q?qXVroWYiBLyWY27h71svsbKZcA86eSmd5dcDO81ABB/dCjTDDxv9CvWSMkCu?=
 =?us-ascii?Q?vTtlou+H/8cR1S7nXEHoSk19c/HK4K6p+x5k75TOQbWj4APTseRLtFpgk32C?=
 =?us-ascii?Q?oxJ4z2hmdbpVW0Qdf5QWkwrhhr+jeuWpknfvq73WVNC/eOsRB3YY6C57l+q/?=
 =?us-ascii?Q?mwXwwAy6fSKzzneOJy5B+mWNPQWPJtyR7078CcU3m1iSjFgQOjJviKX/CTey?=
 =?us-ascii?Q?MAizp4yeXOcagc+J7b/9bR35A3HUHMm0L+dUQ+CyWOwtiR+6x5WFwhyc9MZ2?=
 =?us-ascii?Q?06pMbX2NCtmwQd/M4lrKmvik+NOe1AXZ+fajX3fXyLJIEIkbWcgoQU9MdPDH?=
 =?us-ascii?Q?fAVUUG878PhKHyd4lDvNGanX5i+akGzwywz6Xz7JdiloY1cYXpiWA1fV/BPx?=
 =?us-ascii?Q?ygaN2lCuLO2Q128bNNazJTUf0dDPwMJ//EsvNgIOSew09+I7vwKArfB2IfB9?=
 =?us-ascii?Q?KyF3Si4N0dJYYIN0yM+0auA3Jw4DjE85tM8jQz1SreMh/+3NkjzaooE8Gyg5?=
 =?us-ascii?Q?vXF1JsXowAQhJs/wRc5915KN+eGrwBtnotX0DOhxfBrhwNuCtUAReaC0LQKe?=
 =?us-ascii?Q?XL4DZeEm2PMLm6L07NIWng/YsWheavZfv7boB40Yao54hhccWiOIwFWj09jT?=
 =?us-ascii?Q?y338wsUEXIuBBIbmOyg/bEnjqVJnZYdPxVjqPgJi7e8iSr5dhmrWM2dTvj0Y?=
 =?us-ascii?Q?Wf1wJlSdhlSiTVe+OcuKZk1Lr/KZPypVrVkF5SULvoxl8jQ+YP++ll0Hz+s+?=
 =?us-ascii?Q?xGUAqHm5MdieLzESxmuYTdUIy1fhAfyGHhG5NVZOMg5FCkSXZ/ZbYLAaukXi?=
 =?us-ascii?Q?oDTZegpJRwwO4XhA36831L6irvwSy5iBJFFe6vEMT+p5ncXx76pp5eoLFwlE?=
 =?us-ascii?Q?HrKQv8YE4mEkFfl7+G+/GcK9yDSaHePq21C4jaHTuR0AIGoNHNcxxhDcFY8P?=
 =?us-ascii?Q?kJN87FKz86SHI6mz83QjQO7YNZL/IYJmtuaroXMUBscpILJy2Qur3nqhBU8R?=
 =?us-ascii?Q?2xh5mIXonxe4iySHlNL1y0qwNeX2a92pjbrsIMzfzrF3nBmb5U7H60UcUagU?=
 =?us-ascii?Q?DQGjRYMa8IrkDCXkyi1tjKycTEnhdnrG4B3RhLxPPRf4enVnZ56tdcZYN9Iq?=
 =?us-ascii?Q?J802mHir/L/6X9vXG6f8OyUDdA2WmxDaRmCy+AtPgKO9LlmBUpJqj4K2g8IX?=
 =?us-ascii?Q?NcaiNZdCAGvWT7YYouq2AkYNdcmh1imkBFGdudLx1AkWnbjmH0qLiNYpYghP?=
 =?us-ascii?Q?lFarUeWimRhPojkoFwGibGnRXx2e9jKJ3L08sr2oyCYo5V+w2TfgphZmDPZv?=
 =?us-ascii?Q?4zTrT6xu1kx5jyT/18JNaKMiLXwkP/K0a258kwhx6CRDEHqapkdbMtswD7z/?=
 =?us-ascii?Q?OaY0FHymc5thuFt+p0JlAPpDxm+O+hNZQc3KmSKqinjqZXyW1ZntAGQwWDbi?=
 =?us-ascii?Q?OHSvGzaeUxH9mYY7Bac1fZD3YY2G77o=3D?=
X-Exchange-RoutingPolicyChecked: HeecsSvQ0pRbJTfLKiAdyIkAC91gTiXcHrS18O+JMTzmoCmG1d5Vemap3DZ2/dRToNrrwgSWzrKiHPpL3AjLh0/VT7uAAu7gTsX3wqKC2H1GRl71Y6e+4e/udcAE/JnSoACnIW8sU5cXVuNA5r/Di6C7Gw0f0nsjo9awO/aTZHcZey/5ZqKWEqj2VZg0bRgNhv86ojbOSAI5FBnYN1XEYCf/QtBwqCS4zDQqa9Ucxz8GeTk5pTkSQe6RQ8KrcchAUnKBLQtk9HXx3IDSNRZZ/lbZp52/WZgVG4sBztDX4aHRG4qq5hxLIa2EmiKbw1JsWGrRM+7mNNetZX7w9KIyvQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 74826276-33b7-4505-406e-08df20ddaf04
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF0BAC23327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 23:34:21.0890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L2k7NiV/CmYM1WNzDFNxVh3+NcdxDKIRWwaT3u/ffgwzjgL6sK53Q9McuOFi6E1wLNLYmTCECXCSyNQdm84kFDG/Hd4g45EzJ8fl4bI8Xrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9839
X-OriginatorOrg: intel.com

On Thu, Sep 17, 2026 at 11:30:23PM +0000, Roman Gushchin wrote:
> Hello,
> 
> as some of you might notice, a couple of days ago sashiko stopped to
> report preexisting bugs together with not-yet-introduced new issues.
> Instead, it started putting them into the database. All M: and R: in the
> current MAINTAINERS file have full access to corresponding bugs.
> 
> There is a new "Bugs" button in the top right corner which is the access
> to the database. You don't need to create an account, invent a password,
> etc. It's all stateless.

Hi Roman,

The access is not working for me for my linux-cxl and nvdimm.
I ask it to send the email link and nothing happens.

Anything else needed here?

Thanks,
Alison



> 
> If you're working on other tools which discover linux kernel issues
> and/or can generate reproducers/fix candidates and want to collaborate,
> please, reach out to me.
> 
> Thanks
