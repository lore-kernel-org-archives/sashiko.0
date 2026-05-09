Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022098.outbound.protection.outlook.com [52.101.101.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86392128816
	for <sashiko@lists.linux.dev>; Sat,  9 May 2026 20:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778357798; cv=fail; b=Bwo9lY1NjmfrOltCXnBXpKtY7JWDoQGKWC0Y6TEH/cUozltT4B+yh12LGiQXXjpSRGWmcqAyguYDxTdvqdk7/sHa9jWYNTgDCEs7OPCdOuTO/3XS/eQC2ucTOlZzjsRguo6VABdhP1HR2PRoBXnPu/MB1vfxMy3HHWFzBBec1Is=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778357798; c=relaxed/simple;
	bh=Rggxau4WGSXbp3V81nLrnvCJjNwCPXncchBYFsHBDws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SgubVvx93XEIwmJt2x84npT3+r0Fo0G8BcxLHwtkCoOLXfOnyJTvMTD1iiXB3MPqi0wfgmploFCC9HhfdnR8j2ZV2McGGsDqrkLPbY6blDuLKJTFbisCUfDf4lTm3hV53Qf17vG4XaLvzYuhAzFPUgM2Olz4DlO2LCmryB9fRx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.101.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+wKsUTruheegAZIqsEmKxa/nonXdMfLjOuQtoWnC7WYuCMNa5izAIZ7js3I5lU4Hrxhwwl/EC6c8TN3Q/8+QBty8ZrvI50eRPLL5xTyK9q/u6YlWZKpPGTWN3yh9acKjh4RgiNeeJyrTvgYL9A91PgKgr5WF6wHDo0tZR+8OsHXN57v4xpiZC+7wfIdqiQL1pWLhSnwBcPF6KAfWiYlYocqtMCobi+TCst+YDKcsAWWy72U3Tfyqta1KQ7MGI6qUqJ0CBr1nS5d22XwO2CVToxpDmQ2xj+AhSpgwfB9eflH2QAwUafVAU+xDlselaxHsXrWLm6mDEY4znJ3vgC7Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOd4Xa5ohS9af6R+TzvkUgdKv8MEPL2FhgPyPfjgwQY=;
 b=fljj7oA/gLFrHgEvA0d1cx4Mc6B51QMascFXDMhhQcj7RvFv5uq4wIBXpb1Hr6axwhwk2A7apy1dsnn89JC0mJK6ltTCl4H+GI6LZ10pMlNhpvc7ImXgXS6gU2BlG8sjTSGAjnoT8H/9Ziwa1CRz8nc/6qSqqU3wx461RhrrQJKzC2ivaGBPAPEaVHyCNag895dMnG/3j8l9KD0K559f7iFqU2W3N2e9tlXcUmOqK0HR4853RnV2n6r2MDipZF/PuwcyvmwnRrc54+CMwAjjYjlEROf4BAyl0+05NNPC4i6BH3Plk0c/7ESetO0TROCEKpUaenN7580mVhsHfEsUAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:70::10)
 by CW1P123MB7541.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:1d9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Sat, 9 May
 2026 20:16:33 +0000
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::de8e:2e4f:6c6:f3bf]) by CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::de8e:2e4f:6c6:f3bf%2]) with mapi id 15.20.9846.025; Sat, 9 May 2026
 20:16:32 +0000
Date: Sat, 9 May 2026 16:16:27 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: sashiko@lists.linux.dev
Cc: tj@kernel.org, mkoutny@suse.com, hannes@cmpxchg.org
Subject: Re: [PATCH 2/3] security: Expand task_setscheduler LSM hook to
 include CPU affinity mask
Message-ID: <xtuufmbshgun4nm5evpaicciyrbp4zxeug57fnmxdjtdqw7lmn@4ppozxo7dt6h>
References: <20260509164847.939294-3-atomlin@atomlin.com>
 <20260509180418.5176BC2BCB2@smtp.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260509180418.5176BC2BCB2@smtp.kernel.org>
X-ClientProxiedBy: BN9PR03CA0800.namprd03.prod.outlook.com
 (2603:10b6:408:13f::25) To CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:70::10)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB3523:EE_|CW1P123MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f649490-8093-4499-cef1-08deae07dc06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7KRhrGHU+Sz37IYmvejeA+dK5GhPTfDiD1XNSw23lPNTy6N26ZKIFC0DOKX+RbdVoB6JuKAlnPTeQH9ufF4BJufr66cEghBuGCV4s7SrxD3h19ij4jXVlBHWTkwSNxGBV1CqFTDsDZ1Be2+i1YKEP3WKeS8oDE/W0ktejvCeu3drD77VNTHClT+kWWb2hyR63hzaE2I6MKgB1P+4sq+gDjf6AxlxJpo02vw82YXASVCKw4ks9RyH317cdI924U9lvkdJ//oE3+KP3Fal0gK8nR3FFcMBbtHwMOzswjQKXoV+X7gmNbBMbr4bZ5ixDmaVw+lW0Ag924gMQ+X4b2z+60POHP+0gjA2F0Ad+1EPgv2bshZhrAsjEE2TKeFR7c2raLwG71ZmVxzdvVmt6CfjpuzG0AumLqMOEawjjZX7XsfnD+eVpIB4sx5YtNIvO4GSE6JkqT1wZHpjYSyxTdKaVFQcK+WpC0eQgCnP26d6JW6UNjQsREDJnd5fRJSYfEsG5I9bg7YqKgPPwRTjgrUhA3LihcEteAdXA5X6tmM3+R/rRyUlBaKl5SbnjCHFIqrRwR76ihpJJktnpKToF7gFijM+1kPPAjTigGbAxBhWwvHblgEkjBOMQ0G7Cc74mozG5N7LjUuH3JoMixInByGtAcCkvol9V788vEiZmZC52Fqc2HIgtiXdngM0VGBlylUj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlQ3NnBPL1VGYXd6cjZ6TEMrNDBJbVUwNFVyam9DK1B4dWw1c3FpSmpaQ2Fq?=
 =?utf-8?B?SVFZZGhzR0t4NkVoWm5DR1hLUW1nenJEWmxhY3hBTG1kMlFHQTh5VGI3aU9t?=
 =?utf-8?B?cFozU3I2bGRjRG9IWnNUV2IxZmgxb2thbW05Y21sa252VU1LbkhvalJZVmlD?=
 =?utf-8?B?UWI2d0xEc1gzRFh5LzlkTmRadStXSm9jWHhlc3FkTkJ0ekljVlVudzN0SGp1?=
 =?utf-8?B?N0t3aGhGWGZkalhBMlZjQTVMVVNYT0ViNW5lWFdkVUU3VVZOS0p3bGxWdWRR?=
 =?utf-8?B?SUp0TEVDZVF6TkFlckpnME45L1U3bjcrSDUwcDlpMy82ZVZoUk16RHRnZVBJ?=
 =?utf-8?B?Zk1TRldDRDMwQ2xtbWptUmpwLzlmQkN2VFdzdEhjWEVlampzTGplK2IyUHIx?=
 =?utf-8?B?aGVVeWQ5bVNYY1BsaStpTlJudzltV0VzQ1JlUFRJZVJYQVdCd00wYlltWk5E?=
 =?utf-8?B?SHVDYk1FUVFWZDZMK3RGUHF0UWJ6eDFPYVNFcFpQNHJiMU9DYmlSMEovUzAz?=
 =?utf-8?B?Mm9yNFFwblFwc2laT0dvZjhXRzZrdzhYZ1NHaENSYjlTRllvNXJ6Z2pUQ093?=
 =?utf-8?B?N2lKVXZNaUR2dlN2WmdMWjdmYW5KOEVabWNVSmV5Z0lHbXRWNk5TUDByZFZy?=
 =?utf-8?B?enZSMTBWa2VOelNueUNJSFhlREl4dGMyWlNJR2NqeE5HcmpCQXpxd01Ic0Qy?=
 =?utf-8?B?bXFsYk9FbUNoTVV3SHBUekF5Sm94UEJwcGk0Z1ppd0JXU3BOb3NsNUNkc3lk?=
 =?utf-8?B?SUduSk5SdHYrdEZqTDJUWmo3M0hKMzlHZGdYUk1IanRya0d3ek5XQnY0bzZa?=
 =?utf-8?B?dWVsMHMxMFEvWjdxWW53R3Q5Ym5yd3dvbzJtMHFqalBxMWtIeG42eE51dEpE?=
 =?utf-8?B?UTFBaDRWb1g5bkxiQmZnMTNrcHhRb1ZOOXNpWXZOekF2bDFBMnJmOVJCS3I2?=
 =?utf-8?B?M3FnalRvT201ZUV2SUNCc1RIL3dpdUhKWGwxTHE2d1hCL3RtS2ZEdG5LNFVK?=
 =?utf-8?B?TG1Wc2RyeTZrTnFlWUdTZHNCYWpFbWZ3Z3pzbDdoY2tWa2ZSNGo2RWxMcXZJ?=
 =?utf-8?B?dHdVMm5jeXl0aGYzSVBCaUw1M2FXUnNEQXd6RXNmQ2JlSW5UZkZJaHR0S3Nm?=
 =?utf-8?B?Nzk2bnZvcTBiR0xvKzBiVWdPZnpJQ2kxdjFndlNLcXlXV0hsNjFRTi83MTJX?=
 =?utf-8?B?M1EvWmQxMzRqMGxJaUk5Z2ZCUm9jY1d6cnZ3RUR5Tlk5K3JoSG5iUTR4dVpZ?=
 =?utf-8?B?Mlh6S3FHTXdkamZQWjdnRFVsMVBrRjI5L1laM2FCODRRRURscmQ0M3pZVTY0?=
 =?utf-8?B?bkI2bExjcTlnWlFJT1FyMVl2bjZSWDBtRXNtYmtjZWF5M3Iwa21YOEF5N29T?=
 =?utf-8?B?VThxaldGejYyYWZsdzFpVTRPY2lpeHpDdktwYmxYdlFCTjN0cWNscVBQQU83?=
 =?utf-8?B?YzhhZ1lNRGwzcUlGQ3Jja3Z0QWtiQXV6NjdHNTFoaG9QREdaUDBBVkpjME5V?=
 =?utf-8?B?ZzlsYW95Z0JHSUI4bmF5ZDJxRGdxK3NKZGc0NTFnTU5pbVRjbzlGQXp2c1FV?=
 =?utf-8?B?bXdPNFJicTlxYUVTR0pGRUdjREd6MmJuVlQwajJ2Q3ZNcEV1bTI1Q1F6Wjc3?=
 =?utf-8?B?Tnp3Z1JmdlpSS3REeVFNYVVrWHBnMXV2SGlCSHRNL2c5aHhTYzdlRm5nQ1Jl?=
 =?utf-8?B?K1RpbUtLbzBQeDcvdlRsTW5uM3ViNkUwb2l5MjRMbFZmbDl3LzdGbWZRbkxM?=
 =?utf-8?B?ODcvZDR0cnpvSGh4YW9ObGZ3YUVBbzlxOFRKYU8wZVY2bU5OMHkrWjBUMGVQ?=
 =?utf-8?B?SHI2VENISVRNb3l2Qk5LcnpZVW52bmduUk15WGZ6ZWYycDhNWndCUnV1RXoz?=
 =?utf-8?B?ZVJ1RFMycmUwK0svKytjc3lGbTRXb04vZC9YTVlHbkJaajhEeVpjaEkvZHZu?=
 =?utf-8?B?eW8zWk9GWEw1Y2FrWmhpMW5YSWxNWVlqREJHbGNxRnA3R3ZYTm1qNXFDZC9N?=
 =?utf-8?B?L216WS9SZi9xRVBPdmFYNGZIUTJEcFZwdnMwZ0o5WTF1TWYyaWZGRXdwQlpU?=
 =?utf-8?B?NjdHaVJKaG1TOXZUcEdweHRlcWJpNEVFWDE4SlJqTkZsSEN6NjdwMW8xRys3?=
 =?utf-8?B?U1ZHNWVmTFVGNTRaVHJiMkx6Vm9vcStvWkVHdFJINklZUDIrNUxOMXJQTVNC?=
 =?utf-8?B?M29IaUNHUmtQS0k0SWRBRGZtVXFJOFVIQ2NMK1pYUUR4b2VwQnEvSndkaU11?=
 =?utf-8?B?NHh3UDJzNThMMWQ3Y05PTkI5allOcStXUmpodll0VmgzaDUwZm9NdDd4MzQ0?=
 =?utf-8?B?WnhTK0ZtUTZnemF2NGtkamhUVWc1RUQ4TVgvYTdyQWpoTVVxS2JWZz09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f649490-8093-4499-cef1-08deae07dc06
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 20:16:32.4729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otQga0GBVg/nNQVPYRncDD2p22sex5Bn31mOHwzwD8dmNGS/rOVuRUxRD35sXy/KQBDlSRSMvgpqj7JyDLJ5Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P123MB7541

On Sat, May 09, 2026 at 06:04:17PM +0000, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/mips/kernel/mips-mt-fpaff.c b/arch/mips/kernel/mips-mt-fpaff.c
> > index 10172fc4f627b..a6a61393fc1a6 100644
> > --- a/arch/mips/kernel/mips-mt-fpaff.c
> > +++ b/arch/mips/kernel/mips-mt-fpaff.c
> [ ... ]
> > @@ -108,7 +108,7 @@ asmlinkage long mipsmt_sys_sched_setaffinity(pid_t pid, unsigned int len,
> >  		goto out_unlock;
> >  	}
> >  
> > -	retval = security_task_setscheduler(p);
> > +	retval = security_task_setscheduler(p, new_mask);
> 
> Does this pass uninitialized memory to the BPF LSM when CONFIG_CPUMASK_OFFSTACK
> is enabled?
> 
> In the existing code, copy_from_user() overwrites the pointer, and then
> alloc_cpumask_var() allocates new memory without zeroing it. Passing
> new_mask to the hook here exposes that uninitialized heap memory to
> the security modules.
> 
> I see this underlying memory corruption issue is fixed later in the series
> by commit 15fc15a070c4388ae44399001bd1e9ad8ec7a7be, but does passing it
> here introduce an intermediate information leak?

Yes. The next iteration will include a suitable prerequisite solution.
Patch 3 will contain the actual fix.

> > diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> > index ecd8d45a0dd21..233430d94dfd3 100644
> > --- a/kernel/cgroup/cpuset.c
> > +++ b/kernel/cgroup/cpuset.c
> [ ... ]
> > @@ -3587,7 +3587,7 @@ static int cpuset_can_fork(struct task_struct *task, struct css_set *cset)
> >  	if (ret)
> >  		goto out_unlock;
> >  
> > -	ret = security_task_setscheduler(task);
> > +	ret = security_task_setscheduler(task, NULL);
> 
> Should this pass cs->effective_cpus instead of NULL?

Acknowledged. Indeed this should be cs->effective_cpus.


Kind regards,
-- 
Aaron Tomlin
