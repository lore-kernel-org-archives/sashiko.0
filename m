Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7243395ADE
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 10:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778581604; cv=none; b=c+TAFyZmJJCMb75twFABoGjvDnKtVLnAmhxpgB81RtfIqIJAz6QPkrjSpQaj41PmlqFUSvPUsWkpsiFzMwdI5q5RxjsFFKUEP0A4jE5W8tjYMyghxUm/87gymxnd3L9e3x81X3ssRuyKfi1ZNgwLkjCJm/hUG1mhb3ROZL+8Mzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778581604; c=relaxed/simple;
	bh=wWufaAspikOQf97TdyrRbiiR4Z1Bn28LkgAbRhwLlJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BS9D1VgLQu/BfbUfw++XEeiEPsV9phTKTinLJO8xF3orZj+SYyaP0AJJgBFBTlqjAYVCqlm5F0zz55WuiyoDWzovhDGDFWo25IVF4RBKDKyHIbGMEnSLBy8QgI81+DfklDIo3w7VuBvFEUIyOHFWjffnBqbSOZghop7Ld+uHqSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T8o4nP/I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CfdWeQO8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T8o4nP/I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CfdWeQO8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5KQ1t2994880
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 10:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x4mIjIDyTp4fGlEs2tz6CwwYjcggLxk5gOYgPihpIhM=; b=T8o4nP/IUaipWkMV
	oib01KvR5sBRjp4SI1jGmMd+KFyQQ4CmMV3l92MgAeDC71D181uVQ3h/nkawUqI5
	xz2x9qmR1rg1K9lKPKNgB882FZo/Md32Q59+1cj/2CMyZagpu7rFNCDx9XJRV1Qn
	yeULADxtT9sV27MEAlWv+5/rsgtWDKYEZ3aF/p09NZcXjIgiKptAdYQFCzSxDo29
	xlp/iVYe9b+YyYMVkBJ/K6VWJsoUthU0iSH4OtJZhxsMQt5SYrlkrS5h0PeG9PFt
	YvUVoIzvhD03Az+2XJLvCGn3OolQrmr6yLA696Io+c9yt72HqDtSHuVuL0LbDMot
	2h9kCg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0tqu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 10:26:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b461b36990so58260025ad.3
        for <sashiko@lists.linux.dev>; Tue, 12 May 2026 03:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778581600; x=1779186400; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x4mIjIDyTp4fGlEs2tz6CwwYjcggLxk5gOYgPihpIhM=;
        b=CfdWeQO8MlMWC+t7D/V0pAuCP3zyYpx5XO2NSsN7I67Ihr3WWXauu+mEqUvCChbouM
         2bkrtZ1/hoe2hyrzed1q0IO/loVoNzEVhAKgwjoadzucc28VqK4JAgOtx7Q4Zfc83aqY
         W3hCMd8YzBn9Wjzg5Q4uUmm0Ucc/6yespWrZvnfryOFylEOZSsxiyNkYfCHOa7HjT3Lm
         1u9XkUud0KlW8wCyI0vHT0oCuzGbP0gqGU3luOzytBzDkJdqnRQcFUuK0nxlXUvc0Haa
         KyCJv93c1CiB8lWRjkhudcISd9qrKBNm8FqnviUFvUbLiidB9l3ovMRhyZM7JjAnStXz
         9O9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778581600; x=1779186400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4mIjIDyTp4fGlEs2tz6CwwYjcggLxk5gOYgPihpIhM=;
        b=EctV3W95uIKvQD8ENujwX3fCAm3Vmw7JOOm/0//HwB7H21eh5w93bybpGl7GKya4iU
         lPKm8XHl1L6S0Z5/Gg4ra90oMRTrPLkHrH9fiCoFcw+SBJQvAMzSftAeJ53rfPswKghF
         l7Ym8a707XlyNgKHZON8nQect5Sf2pSawxeK86n2jJHouPSEBoT/YVOhjTdhpu+cPC7O
         VxtoGyyrD7XmmEAjJbHw7be3VOf6+CZGcOAwBEcHgBVf/3dDNZW7vCaEcSCXNK0ILxMf
         8JROd/7/Sq+0RO3i0kClwQUC2c8f1qZYe/qG3iGhUPwRjEZ+WwCXJzrhMqyMgzUrbn4T
         wulg==
X-Gm-Message-State: AOJu0YwqqlbWlXyE5b5V7GaQbM4MD2u72ndvNChzqDSWRZQl/YNRrtjx
	qx0FDiJXWGnKrq9Ft1I9cMVv4vnx7AJGHReBs2MTfIKTNR5ggJbYy1L5e7rEronbvpjSQKTWhIK
	jct/5puNLU7CAgRcx3ngXX6UQzzKG3Zw0qx6KzbKot8BTy1nRdf4RrvFf34wxuK2GJfoY
X-Gm-Gg: Acq92OFgZeTm2wyndcInIE50whrB2xRyqrsGjyGYDtmn9TNVYRybVyX1cU43AFx03vF
	rrhPDqTxOOMM2q/ZtlJ2iSXcyjUIUU+nmvXnQfshvW1a+iaCs6T3JFvs6IJNitzq3eYRAYTg8+w
	uwMb98xEiQWgS5sJXSfEW0F7/+YXLQpOCCJayw7xVPgOCzFXOjWRbd/tuNNZh2zQTQ5ckkxu5OP
	//s0c7dYNrSLD/BUlK4z30wlLPhv4tuQDRpmf+r9Nowsx6rs4Uimk0yMjUVeYTdkRYrDBU6Vzef
	bq7yfud6cqDrE7gZ+wuFDFai7stjslxZm2vlcf42U63++NnW2jYAbXHS2gBaK00sr9kXerkxhWh
	AIQXgc2tZrDRArmngU6PFZPvcVlcHxurgvnEsnbglRw71kYS+npkJmw==
X-Received: by 2002:a17:903:8d0:b0:2b9:ec37:2977 with SMTP id d9443c01a7336-2baf0e5e35cmr174643265ad.38.1778581599899;
        Tue, 12 May 2026 03:26:39 -0700 (PDT)
X-Received: by 2002:a17:903:8d0:b0:2b9:ec37:2977 with SMTP id d9443c01a7336-2baf0e5e35cmr174643035ad.38.1778581599436;
        Tue, 12 May 2026 03:26:39 -0700 (PDT)
Received: from [10.92.217.84] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3ff52sm133993175ad.26.2026.05.12.03.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 03:26:38 -0700 (PDT)
Message-ID: <e1c6649d-06e2-493a-a4d4-e18b9044892c@oss.qualcomm.com>
Date: Tue, 12 May 2026 15:56:36 +0530
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI/ASPM: Mask ASPM states based on Devicetree properties
To: sashiko@lists.linux.dev, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org
References: <20260511-aspm-v1-1-b4a9fe955cf9@oss.qualcomm.com>
 <20260512004624.B82F7C2BCB0@smtp.kernel.org>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260512004624.B82F7C2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PN0/P/qC c=1 sm=1 tr=0 ts=6a030061 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4obT95Fy9AywzWNa8ycA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: _e_Q0QxvrJVUicWC02WRMIXP7feT8nwS
X-Proofpoint-ORIG-GUID: _e_Q0QxvrJVUicWC02WRMIXP7feT8nwS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwNyBTYWx0ZWRfX0OMbqc4SMPC5
 xgIOdXmTOlUm19CwZE6Mf/7JVylvFAUceZIRbtqjCtjmcE8QdG1LEhvbOy+45BF3Stb8eeqtwE7
 d16068aFhUTy5sMt4QZnQtq5mJQR30ZycTnsQx15AGCqvXyrHaBnW+pgKoGi+3LADYmUKIvZEgc
 hFt5Gzfy+7lXU4IaxySowtE4SRdRkt9z2XAzaEZ+WaP5M0uXyUwwMiZZtza+UVL0VxQNQoONzV+
 9FtBWJ3Vr/qM2d6quJgWwWFVWpL/5CGiZSnl4ZHtdo6C98nTk1r6PvctjWepbG8Z5vnOaNcaijH
 m2eq7x7mzregJ9r2fI/i0e14Cl+9cjnW3s+mxP7YTS4D4RGbdYHhJx++oLoyySbF5X4f1M6TB7N
 cqeznfsCqmOY2+Dzj8ReWp4qKgdW74XCY7/sB+RdH6nVS5qXNBcOC7LkHrLAzDTw/kc/vBIZ0R5
 MDE3Sz9xCgsQVDKfazw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1011 spamscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120107



On 5/12/2026 6:16 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Modifying `link->aspm_support` bypasses `pcie_config_aspm_l1ss()`, failing to disable ASPM L1 Substates in hardware if the bootloader previously enabled them.
> - [Medium] The `aspm-no-l1` override only masks `PCIE_LINK_STATE_L1` from `link->aspm_support`, failing to mask the functionally dependent L1 PM Substates (`PCIE_LINK_STATE_L1SS`), leading to sysfs inconsistency.
> --
>
> commit 3739505256d4ced724de1faf6f3f111a9994fa59
> Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>
> PCI/ASPM: Mask ASPM states based on Devicetree properties
>
> This commit updates ASPM link initialization to check for aspm-no-l0s,
> aspm-no-l1, and aspm-no-l1ss Devicetree properties. It masks the
> corresponding ASPM states from link->aspm_support before applying the
> default ASPM policy.
>
> Link: https://github.com/devicetree-org/dt-schema/pull/188
> Link: https://github.com/devicetree-org/dt-schema/pull/190
>
>> diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
>> index 925373b98dff0..3111ef7fd226e 100644
>> --- a/drivers/pci/pcie/aspm.c
>> +++ b/drivers/pci/pcie/aspm.c
> [ ... ]
>
>> @@ -806,6 +813,15 @@ static void pcie_aspm_override_default_link_state(struct pcie_link_state *link)
>>  
>>  	/* For devicetree platforms, enable L0s and L1 by default */
>>  	if (of_have_populated_dt()) {
>> +		if (pcie_link_has_aspm_override(link, "aspm-no-l0s"))
>> +			link->aspm_support &= ~PCIE_LINK_STATE_L0S;
>> +
>> +		if (pcie_link_has_aspm_override(link, "aspm-no-l1"))
>> +			link->aspm_support &= ~PCIE_LINK_STATE_L1;
> Should this also clear PCIE_LINK_STATE_L1SS?
>
> If we clear only PCIE_LINK_STATE_L1, link->aspm_capable will retain the
> L1SS bits while dropping the L1 bit. The sysfs visibility check in
> aspm_ctrl_attrs_are_visible() relies on aspm_capable, which means the main
> L1 control attribute will be hidden, but the L1.1 and L1.2 substate
> attributes will be incorrectly exposed.
>
> Any userspace attempts to enable these exposed L1SS attributes via sysfs
> will silently fail, as pcie_config_aspm_link() enforces:
>
> if (!(state & PCIE_LINK_STATE_L1))
>         state &= ~PCIE_LINK_STATE_L1SS;
ack
>> +
>> +		if (pcie_link_has_aspm_override(link, "aspm-no-l1ss"))
>> +			link->aspm_support &= ~PCIE_LINK_STATE_L1SS;
> Will modifying link->aspm_support here bypass disabling ASPM L1 Substates
> in hardware if the bootloader previously enabled them?
>
> By clearing bits from link->aspm_support, the changes propagate to
> link->aspm_capable. Later, when the kernel applies the ASPM policy in
> pcie_config_aspm_link(), the hardware update for L1SS is guarded by:
>
> if (link->aspm_capable & PCIE_LINK_STATE_L1SS)
>
> Because the capability bit was cleared by the DT override, the kernel skips
> calling pcie_config_aspm_l1ss() entirely, leaving the hardware actively
> using L1SS if the firmware or bootloader had enabled it.
>
> Would setting bits in link->aspm_disable instead (similar to
> pci_disable_link_state()) correctly disable these states in hardware
> while keeping aspm_capable intact?
we can't keep aspm_capable intact as this can expose l1ss capability to sysfs
as pointed
by you in the above, I will do like below, 
 if (pcie_link_has_aspm_override(link, "aspm-no-l1ss")) {
      /*
       * Clear L1SS in hardware before updating aspm_support. Once
       * aspm_capable is derived from aspm_support, pcie_config_aspm_link()
       * skips pcie_config_aspm_l1ss() entirely via the aspm_capable guard,
       * leaving firmware-enabled L1SS substates active in hardware.
       */
      if (link->aspm_support & PCIE_LINK_STATE_L1SS)
          pcie_config_aspm_l1ss(link, 0);
      link->aspm_support &= ~PCIE_LINK_STATE_L1SS;
  }

Bjorn,
can you share your taught's on this.

- Krishna Chaitanya.
>> +
>>  		if (link->aspm_support & PCIE_LINK_STATE_L0S)
>>  			link->aspm_default |= PCIE_LINK_STATE_L0S;
>>  		if (link->aspm_support & PCIE_LINK_STATE_L1)

