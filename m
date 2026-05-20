Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012032.outbound.protection.outlook.com [40.107.200.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB1E3A6B78
	for <sashiko@lists.linux.dev>; Wed, 20 May 2026 10:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779273463; cv=fail; b=YiXRujkTaii89PovjKrqiZufw74ely1VZrzaJ/MP6Y+9VibDp/Y8ObVxKx7NGdC5CK156XduJIcE8m/5rHBcdhOvtzBTVyxNFTA6GJFJR9OwVn+bdppF1lU5vIVAJ9CvvIJ6MKilvjcAOAIg0ldh/LVqHfSfluu9xyL4Qs7t2qE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779273463; c=relaxed/simple;
	bh=bK0kqtSZ0xBhcmpeZcEXK4RG8pa/hwlVdauFBDTerKE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aLpxFXZxBXYd37mzEcEV55hW7yxkaO7+0ZPOj66aClFS5THNMdsJT08kEPS1HJy7IiQpjfrtX+TB5oEaIjj9fvDBJLA3GqCz9qXqp4EqSd9VtFwzUwFxFm4p3CDjaF7noctUGvbpS2P5O4xtIHRVLyKV01lvpVwFFwzVro770Xw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EUaZ/DJT; arc=fail smtp.client-ip=40.107.200.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EUaZ/DJT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JNNYEPTdxGHEaLmmOh3kwff+U+iT4vEKNmnXO8OOM5bR+0vc4SoHYZLoEf67gNtIhaxHSMjXYsvBgDhYl9H+JCpWPFy3IApRDJ6KOXskgqbt/fwMHeadYAkFjt+eRDHTNcrXPX5Lp+HcPUyf9T6i4C9OpncPJ1WAhUEEgjX1fPZ3estwfbxtUs0Ko0OzhDMUbCiWEzqW9o0pXDVuMYx8jYk3xNKSi9ooEK5BAG7iM+YbvJKMcdc9XLcgo/EzTKIOiiimxpOTPNK1BARPar4jCtqTpJjhHKnOLsu23JAN3fI70tUV1mFnrC1a4TnXQMTygbc+We0eLiT7CYn58V9y4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PwMztmRydzSv/+2EluMz4bJjj9sLIPXenbEMqEo8Q84=;
 b=ZsK9EFulVfe+2EDDeEea8G0mZFVJn4TIlGkaViov/ogkqChEjOGStM7nS+I43f4kaA/K+IjafSHCQdDs82HXpZwm1hPRrkkjHT73aQljaxDFCrGOoeeWVWQ/td8hcF0K+yPgaO99BwGGlY4QYOQ4RBY4MZvLkyXl5pGfViHOg6hE90ImYWDi81vPPclyWi0aZU4LcswhF0InNCN3mtBA4BCCnmW9pYX4jdNcujW1vBScMJFOUPX8DQ9EyHqsuK4BsxXaOR2vbYuS/ZciIrZf9bHEtzfDi0LuirWdE8Sz7Td/HKBxpFAg14NIhf0aqcSbOmDD0ew9fQjp3IxR2cPvlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwMztmRydzSv/+2EluMz4bJjj9sLIPXenbEMqEo8Q84=;
 b=EUaZ/DJTgYsXYmMFvboPRpOX23eSInL43QE6Wd8DVEHznUWjU8Z+IoEu37OoT0EoOtkYwvMZqgMf/014LKMOEAFL/Bq9XUjZ4KyKmDjIxdmZXj52XT2hOLwoDpekoaUQBxlHVPS+jEEVu7vtdJlosieTK/Cz3NiBvMKkgyfhSVA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by DS0PR12MB7804.namprd12.prod.outlook.com (2603:10b6:8:142::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.19; Wed, 20 May
 2026 10:37:38 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%5]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 10:37:37 +0000
Message-ID: <06586406-bc24-4d55-87a7-e036f6835d72@amd.com>
Date: Wed, 20 May 2026 16:07:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] phy: zynqmp: fix L0_TM_DISABLE_SCRAMBLE_ENCODER mask
To: sashiko@lists.linux.dev, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: vkoul@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org,
 linux-phy@lists.infradead.org
References: <20260511163135.2924642-2-radhey.shyam.pandey@amd.com>
 <20260512213513.852EEC2BCB0@smtp.kernel.org>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260512213513.852EEC2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0083.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26b::11) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|DS0PR12MB7804:EE_
X-MS-Office365-Filtering-Correlation-Id: 64439809-f4d3-49a9-ba6c-08deb65bcfb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|10086099003|3023799007|4143699003|11063799006|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3x2t3Q0hnqgP+YLkjh+bgZ7hs0cR1oFBpxC6E1pQlnUOI3/F51rmNfL1Nk6IE/il08Taz6La1H1dQHibLHMWwaEYJZxYAAbDVu0oug2b6HjHFiCuEGooXZ+IkfVABUleGkvi6Y5VgP3ruY0f55BFaSbpvtB2g0FdIaHmpVmy5of7JfkeDqGbxz+R398XPKJo1e2osfPnaTZhbcTTJUoQJZaoqXpT28r50gz5YHlfWcQlMg0R22wObuudUx2Vq8QydLrWvWAQ2PXPKJtd9BSVMXz7C0+R6RXAo8LUq/h4XawO7zQ8trKHq3vdBnkEZ85GsiuK7rKmOvHjxgaTEjCjaRCpkGCMo9ImDovHm6cD0AjWaLCKAs7mafg2ix9SGA3wnPU6hJB2ioDQIAnjWK9dW9a9DmboFPrBdW4GwZ0qS0nw3f0g1PgtWFCz/NO1/hG/WtkJMPzhhivuP+1/cGTOXjMBSaRTQqPd0/vkPjxGAic8Ev3KK33HAD68mRLxBYaJkLjr4FVSc2QfNKUBtP4gYofdn6Cn7Gg1UFOxAF6Tt8etnITepB/uEsHg48JpILOH9HIMstx0FJmPSASwWNmgoCtC9DQGXyIkeOOjSyG5U+GjoN5VFaJoN5mEmXC2i+Atn4AfS5ulEpwuycyqM54WsJNHUr7xZDXR3YEk0IGv35bV3HkRiVVH4/PRMlbRZ26z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10086099003)(3023799007)(4143699003)(11063799006)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2lMei84VEZXQUFHVHRUclljWHZHUzd2d2twbTh4Wm1Bb0NId3YrQ0c4ZHRF?=
 =?utf-8?B?TGZmcWFTaGlJcTJnZXM3WlNLL21MbVZ2OURTeThQY2wwUEw5UU1hS3hzRDc5?=
 =?utf-8?B?RlZuNEVZZFNkZ1htUGJqNlJ4cDY0a3RZUDdzUkcrc2h4MlpnM0g4QTZJa3pE?=
 =?utf-8?B?dnlDMmVGdWRDcFJxd1JsUDJRWDZVT0E3MitQdWdjZGxWNEtkMDhDMFdJLzQ4?=
 =?utf-8?B?dlMvTzEwM0ExT2tSdXBLRnpkc2RDbzFPbDBOeThXdkxsSHJlN3pCSkhsTkxk?=
 =?utf-8?B?V1FpdE4yMUR2enNMY3dnQU5Bd0dKMjI3bUEyRGliNE02eTB0TCs0TVJOOVdt?=
 =?utf-8?B?aW5rbUNXWkRmTEtIYmU5T0JuZnpIMGZVUjBEY2xlRXlDdUdGRi90akc4bTZ3?=
 =?utf-8?B?M3licDBCbWYyVTlHZ25LTW04Nnl1VGx1b2hWVnNwd2RuVUZEZlo3VzJTb1RU?=
 =?utf-8?B?b3FVWCsxSFBIbXJZTExvSmNKeWpJRC9ObVNLUk1zQlk4QVZrc0Q4UGhMS2lh?=
 =?utf-8?B?MVMraldwU1ZaZ2luaTBKaWFwckZlZzNXUlY5bXJHWTRWT2hsNG5FbmVXM3A2?=
 =?utf-8?B?OUZoMVAzRUhVNFJOdVhvV3NsbFl3VXNuVmNMaGtGMGJTdjl6cmN3RHdDd1Nu?=
 =?utf-8?B?enZhZ1pzMHpXNC9tRHlxM1N0UW56WHdqQ0o2eFFKR3ptYlBxL1djeS9DK2tX?=
 =?utf-8?B?VlorTEdLZ1A5YVJIb1ZoTW4xN1B3Nmg4a1YwalRxYi9QeGw3eXp3cXI3blBS?=
 =?utf-8?B?VWd0NzlMcm5pUVU3aWFieG5hSFBvNmRNT2hiTTFTUElwWXZJcXFhMlUyYWJG?=
 =?utf-8?B?aG0vTjI1Yk9JdTVidHhSQmE1TEdQWFRrTjFJRkZxNkhrQ1YzODZXeHpvOWdX?=
 =?utf-8?B?MGVmRHVQMTY3dnJsK0tnZE5vWFh5di8vWnV2b0d1azVEM3FLSG5GeER5THRP?=
 =?utf-8?B?bjkrTmY0OFZHTEU4Q0tZbHZVKzZscU9QYllQWTYvd1p2NWZHMTdEd1RMa0Zo?=
 =?utf-8?B?aWVDNHR0VWUvQktzMCt4M1Z2NmIxMkF4bG5qODNESHF3NGRKR1ZVZ0Zod2ly?=
 =?utf-8?B?SDdBcDRqZHVPcnovQlhLOXFvZ3lSWGtBb2xQbmFKTlFLcldmN1NEOHk1WEVw?=
 =?utf-8?B?VHB1OVp5Q1d2clNBdm11elVzR2xWTVYwN2NXa3h6Z0wyV2lCaWNYem5hdmY0?=
 =?utf-8?B?dnlONDFXbWNHeDlUQlJ2RExwTFpBdFV3c1M2SFYrd01aajlmeUdkRXVRWUts?=
 =?utf-8?B?VWdtRjZUcXJxclBBVFJ2V2VmZk5pVmRwaS9rZzFnZ1VxK0pkUnJZeUdMVjEy?=
 =?utf-8?B?WXZTRTVjT2ROdXd0MDNncG5pZW8rMUZEalIxVlFQNUJxNXExcU94TWZ3dUpT?=
 =?utf-8?B?R3d3WGZ3TUllUzBla1I4dEdmSy8zcGhjRGxaUU5oUkZLK0V3dytySnlPMUFp?=
 =?utf-8?B?c05VV0xXQjM5NUxleDZCZUJrSk9pbzZNT0JmalJLRmZveTRxVEhYakJlZURv?=
 =?utf-8?B?WmJrVGVIYjVIZGtOdENEVXpVeXg1MzVIdndFWmxBZHNIWTNiWTdEVkdsVHVs?=
 =?utf-8?B?Y2V2bUIxMDlUS1VyL2VHZ2ZHV0xRVHhpeUxGSS91OTI5MUdXT29ObjBqbXlh?=
 =?utf-8?B?bktzZDRncGFiVFZiU0RCR21ZL2x5b2hVbXM5ZlZtWTA1WnRuMGVWMWwvMllV?=
 =?utf-8?B?MXIxQVVRN085cFRUWTZIVjFQeHphNWtUdldPZzA0MnBORjZLSG5pM1VYc0RR?=
 =?utf-8?B?TFplcHNQT256eXQ3aUxCcTU2QzFrMzZQZzNHTGt3WStMeWc0Zi9ZbzMrb3I0?=
 =?utf-8?B?OGk5Q2lQc1ZMdDR4SC9TRk02MUZRK3UyUlJFZFlpZ1EvTjFDTGI3cVRDYzFq?=
 =?utf-8?B?Q3FaaTVKV2pHQ3owS1VKNWQ0SnozUUJBTE43N2dwOXpEQTFQVzFUWDdLV2Rw?=
 =?utf-8?B?U1dtZlFFcE5HVkc3dGtvOWN1L2lXOEVzbmxHRkRrQWJNZVVpNGVIazRjb2Nh?=
 =?utf-8?B?TXZFMmNVdnJteVFPUmtoNVF2NEJvTWZCZUREWnBsakpRMzY5SHoyRXFRZHd6?=
 =?utf-8?B?dG9IaVFIclF6NVh0ZUIzb2VtSmFtcFpMNGNRdXQreTFWZXE5eDFoMjNReS95?=
 =?utf-8?B?NTFOT3FzSGxWMW1NR3VHQ1BveXd4eHdlMmtuZzRjQ3dtanRxTzRFSExoZlho?=
 =?utf-8?B?aTdjdWc2amd5Z1Y0cWhnTE5EK1VvQkxDcHdWbVVpakpsRFduemRFMjR2YkdD?=
 =?utf-8?B?RDNabjJMUE9YbGY4ejhRM2hIa2xlYzZrNzFnMkpjcllqVjlvVlVaN3FvTitS?=
 =?utf-8?B?Nk4yS2w2VFFUdmJvbm9UT0ZyOUpSV1VQbHVnVURhYWtBVi91dXVCUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64439809-f4d3-49a9-ba6c-08deb65bcfb7
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 10:37:37.9326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lv3Mq83rsuS2zdzi7Z0KjNa63N21MrQIcbWUG1Ix24DkpPR1HWs4g6LY0Rz1mAeu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7804

On 5/13/2026 3:05 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Unhandled Error Path in `xpsgtr_phy_init()` masks clock initialization failures.
> --

As AI review mentions - This isn't a bug introduced by this patch, but 
there is a pre-existing issue in xpsgtr_phy_init().

For this pre-existing issue is it ok to send a separate series and will
include others error handling gaps. So far i have identified two issues.

phy: zynqmp: balance pm_runtime on probe allocation failure
phy: zynqmp: fix xpsgtr_phy_init() clock error handling

Thanks,
Radhey

> 
> commit f38f7c8479703290a0f18153b9a9207f41500566
> Author: Nava kishore Manne <nava.kishore.manne@amd.com>
> 
> phy: zynqmp: fix L0_TM_DISABLE_SCRAMBLE_ENCODER mask
> 
> The L0_TX_DIG_61 register bit 2 is a reserved read-only field.
> The previous mask value 0x0f incorrectly included bit 2, causing
> unintended writes to a reserved bit on every scrambler bypass
> operation.
> 
> Correct the mask to (BIT(3) | GENMASK(1, 0)) to cover only the
> valid scramble bypass control bits.
> 
>> diff --git a/drivers/phy/xilinx/phy-zynqmp.c b/drivers/phy/xilinx/phy-zynqmp.c
>> index fe6b4925d1662..c037d7c13d485 100644
>> --- a/drivers/phy/xilinx/phy-zynqmp.c
>> +++ b/drivers/phy/xilinx/phy-zynqmp.c
>> @@ -53,7 +53,7 @@
>>   #define L0_TM_DIG_6			0x106c
>>   #define L0_TM_DIS_DESCRAMBLE_DECODER	0x0f
>>   #define L0_TX_DIG_61			0x00f4
>> -#define L0_TM_DISABLE_SCRAMBLE_ENCODER	0x0f
>> +#define L0_TM_DISABLE_SCRAMBLE_ENCODER	(BIT(3) | GENMASK(1, 0))
>>   
>>   /* PLL Test Mode register parameters */
>>   #define L0_TM_PLL_DIG_37		0x2094
> 
> This isn't a bug introduced by this patch, but there is a pre-existing
> issue in xpsgtr_phy_init().
> 
> If clk_prepare_enable() fails, the error path appears to mask the failure:
> 
> drivers/phy/xilinx/phy-zynqmp.c:xpsgtr_phy_init() {
> 	int ret = 0;
> 
> 	mutex_lock(&gtr_dev->gtr_mutex);
> 
> 	/* Configure and enable the clock when peripheral phy_init call */
> 	if (clk_prepare_enable(gtr_dev->clk[gtr_phy->refclk]))
> 		goto out;
> ...
> out:
> 	mutex_unlock(&gtr_dev->gtr_mutex);
> 	return ret;
> }
> 
> Since ret is initialized to 0, will this return 0 instead of the actual error
> code from clk_prepare_enable()?
> 
> If the function falsely reports success, the PHY framework will consider the
> device initialized.
> 
> During teardown, could xpsgtr_phy_exit() unconditionally call
> clk_disable_unprepare() on a clock that was never enabled, causing a clock
> reference count underflow and a kernel WARN_ON?
> 
> Furthermore, would allowing the upper layer to access PHY registers without a
> running clock risk hanging the AXI bus on ZynqMP, potentially leading to an
> asynchronous external abort (system panic)?
> 

