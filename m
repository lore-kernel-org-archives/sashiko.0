Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBBA36DA03
	for <sashiko@lists.linux.dev>; Fri, 24 Apr 2026 15:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777045296; cv=none; b=NoLp+QdhVR4oIeY6eyhrdDH34cK4YJjjo2gJjBcPvahE/btEMm2QaA9s/7gA/vONmvevHIZBeDMqTUfONwDjGoucS3GNlphb7IN+ho1U9Ti0T1FPvL6tVN2uRZxtrlWQfAYW/vZ2d6uEEFjXocS9Zu12pWSI9KrqQ/AEBAZRiVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777045296; c=relaxed/simple;
	bh=XyyowZEhKG0U41QPGPJbu/O3ow/qW79v3btHxkT2kQs=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=OHovpt3Ymiv+C7kmlguC7eeOmP6KV+iMXnk4LRpJemZFOmrDpZkt/wjbgzAcQw6bBbQ9KcJ8qi66RaFUAlUaqujyRB7VqTJLEIg8PWFYNpNDYGYRn6y+2rmKTLdoWhnkGYe5prg1yOL+ADQ7qMJOA3vWechsOAa/bghKgYl0MZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MGIXx9S6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y736jOaP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MGIXx9S6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y736jOaP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OFY6ng518589
	for <sashiko@lists.linux.dev>; Fri, 24 Apr 2026 15:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XNduXhuSyT+pRL1sLWWBeC
	GxFgsm+BJta0iLcD9TfvE=; b=MGIXx9S6gP5gKLq6IV+TiHAU/wUsoMDHnOti74
	aZpCpsGNEnay+aYmGaM7/dEnV0yFs37VEQiusZapTzr4e8QM0hAHJkLBb9OOgyK8
	GXjt7hZ2PXsnqjpQGnL1F4Qg9VpSqVMtHeOc/dSayP1qRMm3Fn5OZDjK62a3lsaX
	0HAfRhJOtjy1dUvXfNXvAE86pDkvd4JC59FvEE7ZrCfhHNZ/+rzmTIiGjK5aBjNS
	FmuaDSHicnY2zFunqZDZM+DDk6dtK1kc4I+c0BBtpi/xovfVUSHZFnp5snkR+xWE
	3aF8IO2VXdAyayB8vevkZ5L4TNFZ5IQd8dSnyab2ypNEVTpw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr0fnjuwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko@lists.linux.dev>; Fri, 24 Apr 2026 15:41:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50df4c130dbso114308691cf.1
        for <sashiko@lists.linux.dev>; Fri, 24 Apr 2026 08:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777045284; x=1777650084; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNduXhuSyT+pRL1sLWWBeCGxFgsm+BJta0iLcD9TfvE=;
        b=Y736jOaPr2jEtGTaOyHG+s6l9J8NTp3NcUfZPh2MA0Q9Na4DkTQhmANSRQurVDUSz0
         ZOwUNijJaaKzxQdbuMn0WJPQKNT6Q7BGuupoP2rrc5Z2px2/S8x8oHrqlBg+z5fJnLsC
         YGYGQJ88C0UdxjORAwebFrFCPL5+eSbrrwNvRsnHg6aFHR7djR+nH+a/R2QiTTM5fOm4
         BzBmPG5d7YQAquGakJX/wzNqgGAHqKVNDAezmBz+CbdMeXELP2XB2fmA3oFqrqQ0VlUw
         /TiLQdp/9jr7hALTfp0/5bmNJHqLUDURa/RH3LczzmmTBNkhut5Q6A9eySKxQnCtbcgA
         4aFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777045284; x=1777650084;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XNduXhuSyT+pRL1sLWWBeCGxFgsm+BJta0iLcD9TfvE=;
        b=jQMd/18sEXvIU6hQJJ3M62iRlJxhC9rrHJKkw+rRVCRZM16IeKZQxG9+OHL/be7UHi
         KFsA72Ip8lxRJSXuL7nU8d6MJg9pH0032iiC0a2c5raQQMzUzDrPaNQbhdYeu0Hu4SAm
         N7h3Js2fKgyON8XvJc5xxrqlCDz+YmI6qNb2dNc8P0Bwd526vmVWFYX+EmQlfFtU6jAJ
         4apjHkuIl9tiKjZ+QCv6U8L+uddozPdyGh8N74sLI2VttXLLeM/Mb00YeUaUnnCP030m
         5zttTdnOiJKTZLrLyWfc5G5xMFsCelz2y4o42qbLBglYvFZiu377Qzsn5jOQSYqNXkW7
         GDOw==
X-Gm-Message-State: AOJu0Yyoa666vTgug0+RrwhN9uz4P545gqcxSlWQWCeJyQG/5iez9gdR
	K9T0G/aZCdNWv8UyhNcwkzNvGPU/auNQI+2ClJ07AV2k8w50/Zj2uIF0cZETLKfwMuXVbpzgaIR
	WyB+qkjEHNWXMqovtCo0PiT5BwkozMNjV78y8KMkKthkHeu81mbbejg/IEHBNK+RpPa5Vmm4=
X-Gm-Gg: AeBDieug/1fvURWXKbKQOXusl2/H2XztW6LvTQLwMB11ulLubfvu1Ng9KK33XjCciqU
	zlVnfVvy+St9zMBzobqAKmWQcPIzFx+JgdQlisNSKs5Tcu77lNYYvLJ+FRg7mZo9zZclOCeZNND
	l1nLmWVpsOwOCYSFzhx///57/sFrwLVdF6Idba+M9gU6/Ipa4x75i9ryaw6PSl74QjK17P2gyGX
	HDmnUJb2joATHCmdBBD4Oqg/JRmc6EGb1MrgKWeSkfDYO6pvdGnYg15+aOi0Z47q1Ngix1US/ya
	qt5XGY+8ynrO7DunqvNSE87EB+h8eMsPfGhNsytfkKqS3/4A364LvTYXbJW2T7euo8NlDdi3EbU
	1TFKG/e00aRW0zckF6QIZDGg8nkLN08aapwXJlvVH0FMJb+bH2I9TPMxxRlQAdmII2B5oeysDY+
	0dsliBTGmuEyNtriC/gwY=
X-Received: by 2002:ac8:5a0f:0:b0:50d:7a0f:faef with SMTP id d75a77b69052e-50e3673792amr406127451cf.22.1777045283925;
        Fri, 24 Apr 2026 08:41:23 -0700 (PDT)
X-Received: by 2002:ac8:5a0f:0:b0:50d:7a0f:faef with SMTP id d75a77b69052e-50e3673792amr406126971cf.22.1777045283361;
        Fri, 24 Apr 2026 08:41:23 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:1ab3:98b0:9e96:47bd? ([2a05:6e02:1041:c10:1ab3:98b0:9e96:47bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc177dafsm727331105e9.4.2026.04.24.08.41.22
        for <sashiko@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 08:41:22 -0700 (PDT)
Message-ID: <ecb65bde-3d85-40fd-8c6c-782071bfd5be@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 17:41:22 +0200
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: sashiko@lists.linux.dev
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Subject: sashiko racing with maintainer for the review (duplicate work ?)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LfYMLDfi c=1 sm=1 tr=0 ts=69eb8f25 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=lnV3wAflhyng2QR73OYA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDE1MiBTYWx0ZWRfX9JnPBBqe1GjO
 0NkqdB+ebjyT3WwWWLKpdMhm0SkCr7pswcRcBNYA/rBR2hg5+x3Vla6r/1Ykuo5XnPLFZuooJ81
 RAX/TrPoQmtImA6MWEVW93Yfv1E7W9c5N28pKQZmOw6TLpRLFojxlC2ZVZgjswUm7+oqg084o4H
 ExN773QIsMJ36DjdRZfjOdw2BiFCRSWEZZDV7sYNMVlNW+7RlWQrP0erpAM87QpH+anPTIa/BL2
 HCIjiU3J0nTckFZ252XDGTyc4WhZ8moQ143EmXfbZTKFkYKpYeYfZrPEN5lxCZ/mxqIfpWvZ6F7
 wrFxmTqWY7rhUqx06r8Sz5IqJKtzRTk9oaI51nQgiee6GqqU/G5cxM+M1BN4BkY4cemjN73iHUz
 rItanalRNJP7ivKdoXv2eSMA/EfM42nUR4AvdQ1gVzjLoEDB9CDCRYeSsYyM76Sud1TWeRFfFv+
 8ydpgqZuSR7yj6APwVA==
X-Proofpoint-ORIG-GUID: 9XKephvyeEW_uJdbVX9dXhsroBpbx-8o
X-Proofpoint-GUID: 9XKephvyeEW_uJdbVX9dXhsroBpbx-8o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 clxscore=1011 spamscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240152


Hi,

as a maintainer, I don't know if I should spend time on reviewing series 
while sashiko is may be doing the same review in parallel.

Is it possible to have sashiko sending an email to the maintainer(s), 
reviewer(s) telling it began to review, cc'ing the submitter and send 
another email to the same recipients, telling the review is finished and 
is ok/nak ?

That would let me know I should wait while the submitter takes into 
accounts the sashiko reviews. When sashiko review is ok, then I can 
review the series

Does it make sense ?
