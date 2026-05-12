Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B400E360EF2
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 12:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588317; cv=none; b=k0b50JJXXZFfWBq9BKrqa/qCh5nQzJVqsyqyySR0qB+Dqwv1SdnobPZ4pCJAOuXF32usBoN9c+fNxPjYB+QGeW71RJFTFkO0/aRqwW1pBe1X/GlxWsoo+rfQwhzH2uE+hfir2+Eo6AyjJkfdUejeu+yL5e/CVIOWFVxgOxrPEEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588317; c=relaxed/simple;
	bh=gGjw11PlufGwNl3rO1tsoi5rHgW19/azVIL8zYu3SN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uc+Y7bgMiL5PahiAUTKKWrNp+FFzatIfTwxLdpFHOq7oKnSDY83WH0GzGeS/lxlhOHXfI4KNV5Zsv9XSiXUsO7x+shodaXicXYFJiXZ8unLlE9N1j/bkG0WJIT5S56zF0KNHVabg2/rBJq+/MG/j9c58Lx6MefZD1a+M8cjz34I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XNQixrCb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XDQiiOG+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XNQixrCb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XDQiiOG+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CC4PB53320938
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 12:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	idtQlNG9vUrLtSGjRm2+9K5PdmPRzl7bQtv8YuavZho=; b=XNQixrCbDuYy70NC
	VYtySCPZ5Ap9wUNgnXDN9VHmZ0AG/3VVmRwkhuvps/SQEA+BExpLpoiYUP8AxuKM
	DVbPV9nA16L1EV3JwHeA+38rsxMtAk64iNf5l2oyNyM1M1aMmu1vRtmehk7beZkI
	XvlzbSl2rJh6cGKQ/eKloibD0pPURaWJd7O/3QfLsQy91EAONmHuugSMyk2aPNl4
	5a4YVs+LnltedRNmVADJMAmK/xQSGM4G5iCIGYRZPTnhz/4MFgXo+2HN4lKj6i77
	d2L7Dyaw3sBHzZbxVYREfLouA7/RObZXFJN3TGKzGuVV3bLVZejQwMOUazp1tlFp
	OFYY8w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43w1r1cw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 12:18:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b9fe2d6793so99320145ad.0
        for <sashiko@lists.linux.dev>; Tue, 12 May 2026 05:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778588314; x=1779193114; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=idtQlNG9vUrLtSGjRm2+9K5PdmPRzl7bQtv8YuavZho=;
        b=XDQiiOG+DF/E8gfNTi7yse6t/S6a9AH0R9FPVTuG6t8GKtbiu/37i5Lpt5DQmhpk6A
         A0Qz16ERnujKN9b5qUv/s86tV0pe0ImxIv6ZApOCtE8XTcjSbYcNHzS/Wb0jvp4DDDKC
         f1UbODSeOzPfdp9H/xmP+pe5PtNbH8YpjfIhmKUKoa8pSKnFx9FM07K4RPo6BCEyotpZ
         HCSFiGhVq+DvduFZj0ELo6EmFyYOZ7AI7EdLGP37g8e4RfpHTcQ/5GFucLYxTLbX3b9I
         wPn4sV0EHtbmZhhSASYkYNPMVtBFqjn2Gwks7aEcPTlK1EJWnCHTqzoiQbSDQ2ryEA4L
         V2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778588314; x=1779193114;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=idtQlNG9vUrLtSGjRm2+9K5PdmPRzl7bQtv8YuavZho=;
        b=AjMYpIFF3tgDadmgdWUkbNNZs8/3D86Vfz63z5Awq6A4MRK/84qnlf/DHG3obXC+6j
         aicM58eaovbstuONZe4eN2GFnXpzjXvgyyK16rVbfgtkvJUSKNPeZVr7qhtT6VTAbvqz
         WnmswUrkeyi+BYBa7e6kcmiGuuJLogCXa5e3iYhPIhhMUFEuS5mfVhMWykY2OcnzNgCx
         cLMht+tKIHBBdziyoSGGMaBbm5YBXBdLFno1VaEPZ5xpD5ggTg7RngcoowuMBYfujYlR
         PdBt/rPtYSByZszl/pS+x4awBJ3n6Olxy8HKThTiSBMqFqRrBBXyKYLo9MOoV7unG69M
         DSUw==
X-Gm-Message-State: AOJu0Yx8aVmQbIixWemznx3dz0XyhO8Rko/GTZZiPo4OdlYqW0qi7ssC
	a5GhkbWL07Sswbss2795iRfBrtULVxGhlKj8vLu0Ek2qYHmpRS0bJH1Taf0m9JQVrRbHapv24ch
	O1J1ZN4kWH3mzIOKfT2YialseiAQh3iAiM/CLRw0lJIfaKjUjacHBOmh84avJik7TBwFl
X-Gm-Gg: Acq92OHJp/UvplqxTU5MHEbVL7/Tio+LK6KmmHH7XkwaosicXmEmTHtqTYg7m4mCP16
	svQ4yft5Eij9pqMbDoCupW2nRdOuEkyt7U0JJcYEB0ICTsT5iacdSEPG6+aeIkeY97Yhu0MX212
	2UZ7IPAu7dRS3JPyl3ebiLvjCN0uEtZQRKGUZM1rculWbeklkX5f1kv0RMVitaQf6dV18tVOWQv
	hhNnVj5O3j5lhpR5K6jizs9wxB9ZphzWAmkp/+xS7AulcB1F32jRNG/TB8XCF9YBTri01+NIOvi
	g/5K2legEEh9/SqTqm6ypgpEau2VrcIzYG5xLc1s53KwnRVh2JC/FwS7UhWkHL0No+cUYo4ijz/
	9YPHaNg5FaoyPfkc6v628Gm2ofObm3AjqgL1rBBdcS0U4j+ld
X-Received: by 2002:a17:903:248:b0:2bc:8ebd:af76 with SMTP id d9443c01a7336-2bc8ebdc2b7mr130938705ad.0.1778588313909;
        Tue, 12 May 2026 05:18:33 -0700 (PDT)
X-Received: by 2002:a17:903:248:b0:2bc:8ebd:af76 with SMTP id d9443c01a7336-2bc8ebdc2b7mr130938125ad.0.1778588313253;
        Tue, 12 May 2026 05:18:33 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ec13f0sm134162035ad.80.2026.05.12.05.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 05:18:32 -0700 (PDT)
Message-ID: <21d75073-679c-4751-8308-e9ad17134b78@oss.qualcomm.com>
Date: Tue, 12 May 2026 17:48:29 +0530
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] pinctrl: qcom: Add Shikra pinctrl driver
To: sashiko@lists.linux.dev
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robh@kernel.org
References: <20260508-shikra-pinctrl-v3-2-771144cdc411@oss.qualcomm.com>
 <20260508193210.47903C2BCB0@smtp.kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260508193210.47903C2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AKmOmY3nFI9s7v4IFJLKPfxVELrupjbS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyNyBTYWx0ZWRfX99EIrIk8h/jw
 sn04NDO/LDsPnMBgcqTq9EOAkf8OSWDKlq1LpY9qgJkeDjf2bO0mVYbQAry6pRxTMPyE/uF2v5g
 T6DpqS6Ew38xT1eLod0BAWXf3q91ANAMzcWWacpy7FrnLmkPz50VuEFtZzO5AxAXyp0WvxbKJlN
 i8SA/GExEPSJGfaRMRrIPuV69i8oorJlLdma487j4Z6lSwg77a325IoRWmpMOJ3BEb89EYg1vyH
 HVFw9ufYilTveLPOa4l7GPb6qcPeT1Y7Q2/hpohGCkqYUsnNdfQC6HgGfk9CVNFfuqjS2H5nZ68
 Vjean39s8jkZDf7oiOxb+6Pvhjmi2mWQOidEacblw/tbnfc+SqFjs8M8M9BQFtdKGLDz5j/TLzK
 WKgHDCWNzHaThtY/NMSgWTVBTM9RcUUlNmZYqP7e91I1IWkSzVgbj1PNs5/yOIA8VhENLnNcVgD
 YbN3X0aZgJDJawzRmTg==
X-Proofpoint-ORIG-GUID: AKmOmY3nFI9s7v4IFJLKPfxVELrupjbS
X-Authority-Analysis: v=2.4 cv=BoGtB4X5 c=1 sm=1 tr=0 ts=6a031a9a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=o6O9cqeRkQFRtQiNs1sA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1011
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120127

On 5/9/2026 1:02 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Inconsistent eGPIO (Embedded GPIO) hardware configuration.
> --
>
> commit a63bd64b64bae3d595ab0e510830b193aeee7ba6
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
> pinctrl: qcom: Add Shikra pinctrl driver
>
> Add pinctrl driver for TLMM block found in Shikra SoC.
>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-shikra.c b/drivers/pinctrl/qcom/pinctrl-shikra.c
>> new file mode 100644
>> index 0000000000000..f063e73e5bbd5
>> --- /dev/null
>> +++ b/drivers/pinctrl/qcom/pinctrl-shikra.c
> [ ... ]
>
>> +#define PINGROUP(id, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11)	\
>> +	{						\
>> +		.grp = PINCTRL_PINGROUP("gpio" #id,	\
>> +			gpio##id##_pins,		\
>> +			ARRAY_SIZE(gpio##id##_pins)),	\
>> +		.funcs = (int[]){			\
>> +			msm_mux_gpio, /* gpio mode */	\
>> +			msm_mux_##f1,			\
>> +			msm_mux_##f2,			\
>> +			msm_mux_##f3,			\
>> +			msm_mux_##f4,			\
>> +			msm_mux_##f5,			\
>> +			msm_mux_##f6,			\
>> +			msm_mux_##f7,			\
>> +			msm_mux_##f8,			\
>> +			msm_mux_##f9,			\
>> +			msm_mux_##f10,			\
>> +			msm_mux_##f11 /* egpio mode */	\
>> +		},					\
>> +		.nfuncs = 12,				\
>> +		.ctl_reg = REG_SIZE * id,		\
>> +		.io_reg = 0x4 + REG_SIZE * id,		\
>> +		.intr_cfg_reg = 0x8 + REG_SIZE * id,	\
>> +		.intr_status_reg = 0xc + REG_SIZE * id,	\
>> +		.mux_bit = 2,			\
>> +		.pull_bit = 0,			\
>> +		.drv_bit = 6,			\
>> +		.egpio_enable = 12,		\
>> +		.egpio_present = 11,	\
> [ ... ]
>
>> +static const struct msm_pingroup shikra_groups[] = {
>> +	[0] = PINGROUP(0, qup0_se0, m_voc, _, phase_flag, _, _, _, _, _, _, _),
>> +	[1] = PINGROUP(1, qup0_se0, mpm_pwr, ddr_bist, _, phase_flag, atest_tsens, _, _, _, _, _),
> [ ... ]
>
>> +static const struct msm_pinctrl_soc_data shikra_tlmm = {
>> +	.pins = shikra_pins,
>> +	.npins = ARRAY_SIZE(shikra_pins),
>> +	.functions = shikra_functions,
>> +	.nfunctions = ARRAY_SIZE(shikra_functions),
>> +	.groups = shikra_groups,
>> +	.ngroups = ARRAY_SIZE(shikra_groups),
>> +	.ngpios = 166,
>> +	.wakeirq_map = shikra_mpm_map,
>> +	.nwakeirq_map = ARRAY_SIZE(shikra_mpm_map),
>> +	.egpio_func = 11,
>> +};
> Is the hardware eGPIO configuration completely implemented?
>
> The driver configures .egpio_func = 11 in shikra_tlmm and defines
> egpio_enable = 12 and egpio_present = 11 bits in the PINGROUP macro, indicating
> that eGPIO is mapped to function index 11.
>
> However, the driver does not define the msm_mux_egpio enum, the egpio_groups
> array, or MSM_PIN_FUNCTION(egpio). Instead, it passes the dummy function _ for
> the 11th mux slot (f11) across all pins in shikra_groups.
>
> Because .egpio_func is non-zero, the core pinctrl-msm driver will actively
> clear bit 12 (egpio_enable) of ctl_reg during any pin mux operation if bit 11
> is set.
>
> If the SoC does not support eGPIO and these bits serve another purpose, could
> this unexpectedly change the hardware state on every pin mux change? Conversely,
> if it does support eGPIO, it appears the feature would be unusable because it
> cannot be selected via the device tree since the function is not exposed.
>
> Could you clarify if eGPIO is intended to be supported on this SoC?

Yes, Shikra doesn’t seem to support eGPIO.
I’ll remove the eGPIO-related bits and .egpio_func to avoid any 
unintended behavior.

Thanks
Komal
