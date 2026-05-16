Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A154B372681
	for <sashiko@lists.linux.dev>; Sat, 16 May 2026 07:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778915042; cv=none; b=HNIUSVKOOQxf2JLEe2oXcS/Jj/tTaj0LMlpVFgWw9Ix61H6Aq03DW5BKLBjua81kWlwXfN1JvohbFNpkclzwfCnj4BnGiRLzU2Z6cggsO9ROcenHjFMYuTMiJ72EZUdAd4Hcib4hLE+X5fC9YFUqejRGAs6GzAIFTwETwvd9kxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778915042; c=relaxed/simple;
	bh=QN2x9GSk7lruQdFlnqtkHlY9/80BHtXSKUREZrFq8Dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZfE/w4gwYOLWzxY2tFwJedbgXyHo2o4Rd7N5ZDKCZUlvhhN/mRgpkkukuChAgcu7qK6GEzUTEnvTc0s3jEqHXpUpzp5f97ZCvAOu8yx/JAWY04uUfrHacCG4gcD16AuYjLOedQE3g6ok1mnuHr45B62eHJL9vF0JSeZ3N9J/uXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DCwJAiOJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HkryB1d6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DCwJAiOJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HkryB1d6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G4CggV787014
	for <sashiko@lists.linux.dev>; Sat, 16 May 2026 07:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PXNiHDMYaqzcjjrNvjUNJdNUgOI+VkHcu12M9jk3xGQ=; b=DCwJAiOJoMb432Fw
	xhYbg3q4w3dp960CN+w6U+OD2eWQc8ZmxM9ExzrYGnQVMz9+UGy+DvGBpyFbb42n
	ifZRXWA7uHil1ckAHqVu00xHJZwc+Ep6waQkWLNG8bo9WYmtVgvFG4DhJr7u8iIJ
	SD1pibotmxuQdm98meCt/0yDRGY5/8eYfs65gPM44r6mY8BIFul/ybM72QsSVFqg
	BkHe4RpK38q6IABdypcbbnJUPG+DQfKEKaTSEv7GrPrlwurN7fMOq9lzoZNI+Jmy
	UoMU8pO/Ghp32T4H/4wBl161VhcrjNAhVRHnYqaAF/EOFx0KMghMkFY5xyug9jfO
	9rjoJg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hbc89de-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko@lists.linux.dev>; Sat, 16 May 2026 07:04:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-369166fe5e3so443250a91.3
        for <sashiko@lists.linux.dev>; Sat, 16 May 2026 00:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778915040; x=1779519840; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PXNiHDMYaqzcjjrNvjUNJdNUgOI+VkHcu12M9jk3xGQ=;
        b=HkryB1d61RkVPMY2uTalo2Q85oFMVKbfajl+y1/By8Ryq2hao7+8a3q7LFQZqbYjsG
         DFj+b2jTn8U3+VpKd8AFktvyyCrDnhksHC9gc//5SkTnJJ2jqIFidWDkWd5mFNUgZT/M
         HlyGJPwmNWGksjXXgpt7avtFDJU94yAAfocmXo4fsivEMo38JbBYmhLLtmv+Yaa9yPTI
         SbSC0z9Ua3wHHLntyq1HeQiYK10C3mwqtlqi+wAGE9PZW+ShXja5OQGuMHjhFHUCHO/4
         Rrb+cCNS2m/wykGkGIJPOeGSFYaooRlgQUcAUrGda1390fsvqOxHu0v4g02y2bzL5lUP
         SAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778915040; x=1779519840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXNiHDMYaqzcjjrNvjUNJdNUgOI+VkHcu12M9jk3xGQ=;
        b=VIfX6OiDZSKwxBbFeEW1RouLOFXsPx8/tIwvUb/4rYHMgjHQHOLECfezHh82a+8c3A
         sFDFiV0wa6i9ORHZsBAufpVmlDRnh7PDe+csbwqLToO2vTl52NAHnjd8NVwxTSnwKHlO
         KUt8asUaY7LFtRPILUKeUBj9QgKrYfaMKh/j43nyHR13TPx0wqrpIvW/lDbRKZ3vydDt
         Q/dXu+6o4Ridr0SwZu5LO24jT+BOO+qcVEuMAWsevuRtK6zUGZVLnIoTHFzFlcxcWIBa
         gAj9i7lLEDNdaQrE0meLMRJlb08wAT4/aRpNHnQEl/IQlC72/yO88VZoiaILQlPM/HOs
         QkFw==
X-Gm-Message-State: AOJu0Yyf/HYt2BGYYWlXoaXhGlMJv6ny3C2i+QwOX0U69/jc97y41aFF
	O9rOAz0O/DwDb2kUm3BbRr71QAMHBiUIW3r9QnX/p1v0wvtDyfa42K4Hvu+KQErM4MzmTWcA70r
	p1aefG1YsmAuBY0Y166r4OgkA12bwWoWZytiIDKEr0bMuFFZygp3PDWovXpSaK3wsZjs0f6A=
X-Gm-Gg: Acq92OFgEezCmmpb7JY7q9y1wVG4hclGDjP9khG2Zb8r9ZRDsIOBZf6yE2dGxtTT0EY
	Yezxjip5rRm+lKkzin5hlO44UM3ZGkCeEtduwa/q25v2ae0J9ArF96fNbZjkOAM7qAHTroH8n4+
	mqt5BxyY5GZu5RRTM65/ewq1LXdmYIue9fhmxY91sovTj1WgRqnjy8bsnmqyB6ZoEA97tKs9B54
	7bmGN0WER550BKb8QzSJFdXpKHV0GWdpbXAKEXhuYlepP92ds7LzngcVPaIY18d635w+UDH/6Hq
	p5ZHW3PwXmKzHiWdEp2n8b/Usf3x3mSOMA4fHVuqpTv1iwYebhIa+E9t/VXCq1mVApp5Z5XCpIb
	GmZ1Q39z3w5120Qv+N1GRfHJgR+Kw7AdnSHqjk5Rpd806LV6TCcB46eC8psnqs6DUZtzo/HxP4p
	RK1pkl1K8QIbUpKm8=
X-Received: by 2002:a17:90b:38ce:b0:368:d8a1:3bd4 with SMTP id 98e67ed59e1d1-369519e2088mr6591096a91.3.1778915039583;
        Sat, 16 May 2026 00:03:59 -0700 (PDT)
X-Received: by 2002:a17:90b:38ce:b0:368:d8a1:3bd4 with SMTP id 98e67ed59e1d1-369519e2088mr6591074a91.3.1778915039080;
        Sat, 16 May 2026 00:03:59 -0700 (PDT)
Received: from [10.91.222.120] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695126fc8asm4699885a91.7.2026.05.16.00.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 00:03:58 -0700 (PDT)
Message-ID: <d22e0834-4ab4-4b33-93e2-6a913889884d@oss.qualcomm.com>
Date: Sat, 16 May 2026 15:03:54 +0800
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: arduino-monza: add WLAN enable and
 rfkill GPIO
To: sashiko@lists.linux.dev,
        Qian Zhang via B4 Relay <devnull+qian.zhang.oss.qualcomm.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
        krzk+dt@kernel.org
References: <20260511-linux-next-v3-1-3e22737e71eb@oss.qualcomm.com>
 <20260512010904.12442C2BCB0@smtp.kernel.org>
Content-Language: en-US
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
In-Reply-To: <20260512010904.12442C2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cuSrVV4i c=1 sm=1 tr=0 ts=6a0816e0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=igHOnw3Yc1Eq9CvWKzsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDA2NyBTYWx0ZWRfX4P60+quAdFXY
 IvJ/yMaAZXWnhsYrVg4jn/q7BMpzNU+8koSZXd2EC9mDuNH6hk/b49exBQNKKnbn7YXNIExNHcS
 Qzj9ChGNahlhlPsCfKfKDz++jHiTLSS6pndtrtjpHTrrgGamrUYBXj+t4S+SPrC0RpCtIWV1EvA
 xu/9Uf8jxqk8ZaJpCF3HA3SeJqoebkUrYAavGM7swtevmRZTidVddJ8MxVm7KQtUQtT9gdT7Jm1
 VRohJkpTw9OTVSdaB3L4YPM4l5JKrKZ8QWTHq9tBemp3Ij1o+VHjgy7vYX4x5B2ILx996IhIHcl
 nCjC7U3cXnFYRlPEw7UEJpZa7aSM7AzHcBTFpJD//Mv296eGIefq8bo5nkiTSO71UGdi6TwOix3
 a1QtzxLZiVZzBcAGqFJ+4P1ywSoGOI8KsZ/nt18SJBaliCSpGlV/xLh1HghaRsJfLPohQ6m4hsI
 RAmqHS/DnNGiszgPm8w==
X-Proofpoint-GUID: HfC56c_GOu1kPZXXWv-JuXRnbSBXb7e2
X-Proofpoint-ORIG-GUID: HfC56c_GOu1kPZXXWv-JuXRnbSBXb7e2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1011 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605160067



On 5/12/2026 9:09 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Hardware backpowering flaw during system suspend due to uncoordinated W_DISABLE# GPIO and M.2 power supply.
> - [Medium] Missing `pinctrl` definitions for newly added GPIOs.
> - [Low] Devicetree schema violation for the fixed regulator node name.
> --
> 
Hi,

Thank you for the review.

I will address issues 2 and 3 in v4 by adding pinctrl definitions for both
GPIOs and renaming the regulator node to follow the schema requirements.

Regarding issue 1 (the suspend/resume power sequencing concern), I will
provide detailed context about the current situation when responding to
other review comments.

Regards,
Qian

> commit ea2590eabdbe9514777a7849913aa724f8e8c30b
> Author: Qian Zhang <qian.zhang@oss.qualcomm.com>
> 
> arm64: dts: qcom: arduino-monza: add WLAN enable and rfkill GPIO
> 
> This patch adds support for the QCNFA765 M.2 PCIe WLAN module by modeling
> GPIO56 as a fixed regulator for wlan_en, and GPIO54 as an rfkill-gpio node.
> The regulator is linked to the PCIe node to provide power sequencing.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
>> index ca14f0ea4dae6..e0ffe87bba90c 100644
>> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
>> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
>> @@ -153,6 +153,25 @@ vreg_nvme: regulator-3p3-m2 {
> [ ... ]
>> +	rfkill-wlan {
>> +		compatible = "rfkill-gpio";
>> +		label = "wlan";
>> +		radio-type = "wlan";
>> +		shutdown-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>;
> 
> If the bootloader leaves the pin in an alternate function or undefined state,
> the kernel might fail to control the RF kill state reliably.
> 
> Does this node require pinctrl properties to ensure GPIO 54 is muxed correctly
> and has the appropriate bias and drive strength?
> 
> Additionally, the PCIe controller's vddpe-3v3-supply is disabled by the
> pcie-qcom driver during system suspend, dropping power to the M.2 slot.
> However, the rfkill-gpio driver lacks PM suspend/resume callbacks.
> 
> If the radio is unblocked, the SoC will continue driving GPIO 54 HIGH during
> suspend while the M.2 module is unpowered.
> 
> Could this inject a logic HIGH into the unpowered module, causing current
> leakage that prevents deep sleep states or damages the hardware?
> 
> Would it be better to synchronize the power sequence to safely deassert the
> W_DISABLE# pin before dropping power, perhaps using the pwrseq-pci framework?
> 
>> +	};
>> +
>> +	wlan_reg_3v3: wlan-3v3-regulator {
> 
> This isn't a bug, but the node name wlan-3v3-regulator appears to violate the
> fixed-regulator device tree schema.
> 
> According to Documentation/devicetree/bindings/regulator/fixed-regulator.yaml,
> fixed regulator node names should match the pattern
> ^regulator(-[0-9]+v[0-9]+|-[0-9a-z-]+)?$.
> 
> Should this be renamed to something like regulator-wlan-3v3?
> 
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "wlan_en";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		vin-supply = <&vdc_3v3>;
>> +		gpio = <&tlmm 56 GPIO_ACTIVE_HIGH>;
> 
> Similar to the rfkill node, does this regulator need a pinctrl reference to
> configure GPIO 56 properly?
> 

