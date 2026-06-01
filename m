Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66017225397
	for <sashiko@lists.linux.dev>; Mon,  1 Jun 2026 08:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303634; cv=none; b=bAdHO+hLun/Z/PMtzJIvBekwBeeFP2ocFLxrDX+epoRczoTrzWCoIP8/k3pJDDULTXNf3dgYJl/iGkqaBm5eu0EDaPdOpxG2ipnl6hiEsXg56vr14cOXziSAkec3eR8XmjrCJlxS2kj2fIg+CzpiD0BuU+wcwuNmZefPD3r9SgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303634; c=relaxed/simple;
	bh=HDFTA2sdOoNmLu4sgK+uQjQ31zICDRsmsBxIHFqevCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g6AX/DRLoWdPsF8KR7pMI2CfO2Gb6NwQLMt+2TFLUjkzTmfr2UCXdnwEHNdHvsXWMlrIL7H4Stq2hVuh24sESg+KQYckqdp3mj2ihxQPbhpxLYf9eL/bSEr97BeNdEkW/igaml0z9+bZzbcg6caP0wnmVnKwbrEpWKz6VBq841A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IQPpez4c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Enohtnrs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IQPpez4c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Enohtnrs"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65166u111286003
	for <sashiko@lists.linux.dev>; Mon, 1 Jun 2026 08:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jyWLJBHTJApg4SyZUuUBijx04Lc4pqCdUxZ57jJVAv0=; b=IQPpez4cwac0Uh0G
	k8Xr65k8pOkbk6VuIGD28mmHQ/OJpVWhp1LHIaopUv3037zNGB4lNMSDiEwCwPDu
	R3IYrah2c+jIaSn6UWKtFOx2/caHfe6ktec+2qBr28XjXd5UEKTTfWUQh8CRCVqQ
	zatckqXdvavnOBRw3+dHn/0t/eOTsBXZilOzTdW2Po1p8/hRD7VsBCHzMP9IXzDU
	qI6Zincgo05Nwn4c90xD/+uUydLCP9vpOl2ujGucuSiz5Ph6PoeGaNHAqIBzD6oq
	JUpDiOjLpU8wPXl8AA10+qxwHZB1DWhx2Hq4+C4cuw3VJY4kQIV034mGg/QBQ3yc
	70E8uQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efs66xfej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko@lists.linux.dev>; Mon, 01 Jun 2026 08:47:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84247fed609so448936b3a.0
        for <sashiko@lists.linux.dev>; Mon, 01 Jun 2026 01:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780303632; x=1780908432; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jyWLJBHTJApg4SyZUuUBijx04Lc4pqCdUxZ57jJVAv0=;
        b=Enohtnrs+FbAkOjSCic50U4V9EqzNwaiEyUalX1e2CUPo8A+Z7+HXEP4+UzNRJ28JW
         ri+Fr8hgR2b8R90dN0zQhD2LNoA5gY3DQ+WXfOHyYoIrvo4yVy7+LKJKV3LRfIhGgYl+
         zGGQsgnc/EeaoxT1DgEz/rmmG4xpYcRJm0VclQeVpRnTZqmPZ6anKgq9jzmDTb1m0Qdk
         hpC9Z7S2gXZDcP9AMou4kfU4IHTmdicO0C7rmVrJWYE4nZvYI83y/jNB7fy61C7ZSXxD
         vzWI4Cg4GTWe638IAvMgwj/rTZsW2mkUm5vbYts4YgzdXYjHD2Ty1bHTrU+JhMw0QDlt
         ulHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303632; x=1780908432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jyWLJBHTJApg4SyZUuUBijx04Lc4pqCdUxZ57jJVAv0=;
        b=ZrcWtS0HqSzPqI9m+WxOobJ3AgYJWkdf69gRkMQacKsNjIiH0+GHLx9HaCSMQ6hoDg
         QGWnQVbd601IWJjqG+Lscyi0xkMKFim4gho2OX8XBeYwWIEEb2YWHf+sxX7pbWJiJytL
         8nU/c5qNhiBPMYWNj2yW4srKiC/XpZEgIi1T/Qiwhb39fORuNaYlGYEY8/Ihnrb5qYfR
         ZZeFM6faBtMgWIAAHuA574nZzF5MMZD6evefwTDPdaT3uuk3YrjiYAbLPDl1aGdGnWHD
         FDPhg/qHqCtdptIQKelRQPorti44NBtphpG5MzLtu1Q/fVQP0dgotitfTCNJO96JLBir
         Az1A==
X-Forwarded-Encrypted: i=1; AFNElJ/A7NNg3ZQmD1G4W5m3OwFd7RRG3FqWlAtAZcAJXyOT9JICnNRLicGEPsuVn8V5PhDdeFJxDBVS@lists.linux.dev
X-Gm-Message-State: AOJu0YzQN5D9I7wv101h5t7De3J+KpSCrepbFCd2Y2n4lhE28TUYD49Z
	zwhUB4vdmMU1v0vPxVr08gD3rTyU+LWsyIYdnbZsRi3hrICaT4iY+FhLJLmDya9QtIWTsKltn3u
	Npg8RnQoK2EM+zRnrSHkvdrtYFDWnOhnE5amKc+eWvgMVpErJSxJYcdNNfltggLP7ERAF
X-Gm-Gg: Acq92OGURL/7uHrPDZnyhnOvDWHPoJTHyQ2fvuU0JipHG/Yk33sPu/EzcZRqPXwwEHV
	LQ3HPzHpaNx5KHeUno2BhwUhD/K6hYbu4dDQOR9qlt6V69LIBDxcy2kYFf7nywbpst4lda4uUEd
	Ag1/kPgDHhzNtfEdBo9tAPgtHOjGut79wt0opurFrXp5+cUIMFAE2SUq2gnfU+siAQ1VbO6EMrw
	hPYUAxuH65ALKJCGyRelP0Gjwe8zGwHC5R19YBnR3klSOkzuedjGEjkC7TWyHMxplf7adMDNGI4
	Robs7zzrm4KYLsxEenGlAmoNOBUMvVZkyNflj6bi2pRmgKSvVFfAMqle4R9s8WRUbVlPdIRO4nm
	11nrnKyj3t5WPqm0muFmmcGiwrxUqMkeroIzOs53ZaIpoW1vYS+lbMDNLWjKYrmmvtv3ZN0nDw6
	1r3aYvrmhgNITmr9pjV4dnNCc003k=
X-Received: by 2002:a05:6a00:390e:b0:842:5719:455c with SMTP id d2e1a72fcca58-84257194b18mr2357042b3a.25.1780303632022;
        Mon, 01 Jun 2026 01:47:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:390e:b0:842:5719:455c with SMTP id d2e1a72fcca58-84257194b18mr2357016b3a.25.1780303631556;
        Mon, 01 Jun 2026 01:47:11 -0700 (PDT)
Received: from [10.133.33.66] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8423dc9f361sm4678171b3a.24.2026.06.01.01.47.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 01:47:11 -0700 (PDT)
Message-ID: <83de83e9-ad0e-4aa0-b48a-fa922c560f78@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 16:47:07 +0800
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 4/5] media: qcom: camss: csid: Add support for CSID
 gen4
To: bod@kernel.org, sashiko@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        devicetree@vger.kernel.org
References: <20260508-kaanapali-camss-v13-4-2541d8e55651@oss.qualcomm.com>
 <20260508212213.ED319C2BCB0@smtp.kernel.org>
 <178018791720.17481.10983668954574740501.b4-reply@b4>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <178018791720.17481.10983668954574740501.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA4NyBTYWx0ZWRfXyIXeJKj7p5fz
 zZIUM4LYzP/h3vSiGzjRxzI4D5T3ZIToHTL6pJYgfIZ9jxGBFUCSBjC0F5duMUDFMjCgVso0/vq
 MJgG6tNJSr/k+EFE8rnNofc3yegNmUeWxXAQGHce+6M4y9ZGbZdI5GjpHAAYxGx0V+Z/gMhKVpq
 sHBR30aRYtwNVTxPOokV4oYYCTqSxgRZb4KC19eWs/PnFM4DLQQzNgfNpCqlKYS+/ThTstFXlCu
 6YarEUXmEiyI0b37cTADJzPv9bP2yrwhoLxupLt47QRW+Gu/us5x+DQ2p91tXaShdQVLl9oLb0X
 vfGrwmt9eRHB5oIcmjjH9Jnyb2szaavrLqWGUw72uvVFJD+qJiw9wCirtrAxcez6yPl3zq4KsKJ
 nwH6sMtAYqEDuZEJmt/15n4Spf/4/qzqcIt0Uvo9KClUySvRN6/Ij6ndLmHN0F6rURu6P9p810B
 XPvLrkRs++a2pfrWgnQ==
X-Authority-Analysis: v=2.4 cv=X8di7mTe c=1 sm=1 tr=0 ts=6a1d4710 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=Wx8SgOCzfKFlTRplcBcA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 0bI_qJ8tEhObMehGBzVnp8F4khSPBuEr
X-Proofpoint-GUID: 0bI_qJ8tEhObMehGBzVnp8F4khSPBuEr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010087

On 5/31/2026 8:38 AM, bod@kernel.org wrote:
>>
>> [ ... ]
>>
>>> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
>>> +{
>>> +	u32 val;
>>> +	u8 lane_cnt = csid->phy.lane_cnt;
>>> +
>>> +	/* Source pads matching RDI channels on hardware.
>>> +	 * E.g. Pad 1 -> RDI0, Pad 2 -> RDI1, etc.
>>> +	 */
>>> +	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
>>
>> The macro MSM_CSID_MAX_SRC_STREAMS_GEN4 evaluates to 5 for non-lite CSID
>> hardware, meaning the loop index port can reach 4.
>>
>> Since MSM_CSID_PAD_FIRST_SRC is 1, MSM_CSID_PAD_FIRST_SRC + port evaluates
>> to 5.
> 
> That's worrying.
> 
> Would appreciate some follow-up from patch authors on this one "yes we
> looked no that can't happen" "yes we looked no it can't happen"
> 
> Either is acceptable.
It cannot happens as we have limited the vfe_line number to 3 due to 
camss framework limitation.

Best regards,
Hangxiang
