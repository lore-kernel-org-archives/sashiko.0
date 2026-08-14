Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DD33B4E8C
	for <sashiko@lists.linux.dev>; Fri, 14 Aug 2026 11:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786706012; cv=none; b=HG0adzY1IBHbGUcQ/8nOmx0JZ2B5Uekze2tKz57v73BgBKDGFgZKpVhhcAHl5z2hOZSZU2wmZ0Ebi1+RWf5UByE/WjOoVUx7+MrC+ckEFl3/cs8PWDq2bk/yCl1724NjivrRhGapZtpSi9F7Ep56p/mQz5PLom4aFubHao0AXls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786706012; c=relaxed/simple;
	bh=YxNcS/Y058K49+BNWaa6fd//hotyS27MPc8iDif2/Qw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=O3ltR9QZR3i56QUxwo0czuJc7pyCHdrzkZPnQnjwGBdA0t7OwUhx2+cD6qunKi6qoG2NFOJD9O+9kOWTXjaQ70zGtc87pM6z4MCmbAKREUkwmQy9v4aMTXW9yhgLrRoYejPUAyl3uMQKsgF1RlxUJYpV0TtnYV2FhM3YyMGiluI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Nj63ixxE; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Nj63ixxE"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EB2eg43275346;
	Fri, 14 Aug 2026 11:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=JvG/B6
	qF7/a3ZBp/CoqaiLh1zid2LvOWLn8SOetaFrQ=; b=Nj63ixxEeHnkDoYFgx+fZ7
	bvlm5hTCsFiM6wIjc37oaP3ieCSwNZO4frZgAiwLEATCC0nmckdgpJAOxlCDARcD
	wf4SalAm3piEyFum2pBnc+vrZ6VPlnDgueLwmmXfLYy25SI8VdvAkNe/ueUoPP5Y
	ny2z2zm91YrRP0+dr2r8XS1JaiNFIZdhL6eIWwBiahrht/KOysEssoTq6LtUVGUD
	aemdBtS/3n0apOkVIAYPgFgCmzU25dDaXVCxxJCXUWLKRC+c3xscPtyJBde3q/C0
	rQEMKQMxCdTvLrJult8UMcNjeaR1tPEHkgnziTciYXAgyoTR44DF18zTPFmxRfvA
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fwvk0cepq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Aug 2026 11:13:24 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67EBBOfx007252;
	Fri, 14 Aug 2026 11:13:23 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fxfsk71au-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Aug 2026 11:13:23 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67EBDL1E48234902
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Aug 2026 11:13:21 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 64E622004E;
	Fri, 14 Aug 2026 11:13:21 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1EF5120040;
	Fri, 14 Aug 2026 11:13:21 +0000 (GMT)
Received: from [9.224.77.173] (unknown [9.224.77.173])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Aug 2026 11:13:21 +0000 (GMT)
Message-ID: <752834be-c067-4198-beb1-33327c479d38@linux.ibm.com>
Date: Fri, 14 Aug 2026 13:13:20 +0200
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] email: add Christian Borntraeger as cc for s390
From: Christian Borntraeger <borntraeger@linux.ibm.com>
To: debarbos@redhat.com
Cc: Roman Gushchin <roman.gushchin@linux.dev>, sashiko@lists.linux.dev
References: <20260730144458.286663-1-borntraeger@linux.ibm.com>
 <amyX26L0KIXR2WAu@debarbos-thinkpadt14gen5.rmtusma.csb>
 <3420caf9-1a22-4eb8-891a-0732c5cf4c14@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <3420caf9-1a22-4eb8-891a-0732c5cf4c14@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA4MyBTYWx0ZWRfX0GGag8whdLUS
 APVny4uzJszt1uoxjY45LSwvux1Tq7F3hcYYpG3PBdZyN8Q59Xunu12iYifziIsLLb0eiI42IT3
 F4CYs7QgDKFE1Lx49wZO2qg1iNyGe5syv83ZG1pWVVHQtLJ1QN9kiHmqkyUzN3qf60hIEmYOv4Y
 crZaOvUghtC0ptHLF7PG8eMgh64UJuaE7m9lgp2MnBMP1/4/CPh0yeU3tqvPcQ3mhbeuz+hF3SQ
 sdl52r7qKCoiKsoQpstuCvSwg0+qwi37THvzEiXMUs9lImwJN+Qn5sESvAicewggEL6y9TIdMoo
 YTr9LSlDEgWzWtZEablY4yyg38mm8vGnOzXjQFmhAM4iaMHN2Jy7v5xoNFFaObWgtqtOh2awwGD
 EDrQdM0Vi2IvWbNkFAga3yk9R0i8k7din2UnMZzoNxGGzYsatVGiDd0Zd1xSr4R5ATk9nXQfHCY
 02dNy3wku4rRl1DSU9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA4MyBTYWx0ZWRfX0NTZDRLx0h1Q
 wqFkmIKrpL/fZhun2E9IDjtQ4Cest6658oyqpC46F97iQx5uO1Li/xsC4kEAu705cJIsm6EOpCH
 ULnKJj4W2VfYDqGSHxzNEAAcLle3vMw=
X-Authority-Analysis: v=2.4 cv=RqD16imK c=1 sm=1 tr=0 ts=6a7ef854 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=BRcBXEtgsS1vb8zHdakA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: RKHmE9fP8aOhOXeDDdNu1o6Eq-fTwDNS
X-Proofpoint-ORIG-GUID: RKHmE9fP8aOhOXeDDdNu1o6Eq-fTwDNS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140083



Am 11.08.26 um 17:06 schrieb Christian Borntraeger:

>>> diff --git a/sashiko.dev/email_policy.toml b/sashiko.dev/email_policy.toml
>>> index 26a6665..7e32532 100644
>>> --- a/sashiko.dev/email_policy.toml
>>> +++ b/sashiko.dev/email_policy.toml
>>> @@ -236,7 +236,11 @@ cc = ["linux-target@vger.kernel.org"]
>>>   lists = ["linux-s390@vger.kernel.org"]
>>>   reply_to_author = true
>>>   send_positive_review = true
>>> -cc = ["linux-s390@vger.kernel.org", "Heiko Carstens <hca@linux.ibm.com>", "Vasily Gorbik <gor@linux.ibm.com>", "Alexander Gordeev <agordeev@linux.ibm.com>"]
>>> +cc = ["linux-s390@vger.kernel.org",
>>> +      "Heiko Carstens <hca@linux.ibm.com>",
>>> +      "Vasily Gorbik <gor@linux.ibm.com>",
>>> +      "Alexander Gordeev <agordeev@linux.ibm.com>",
>>> +      "Christian Borntraeger <borntraeger@linux.ibm.vom>"]
> looks like I messed up, ibm.vom instead of ibm.com
> 
> Can you fix that up?

Ping.
Do you want a pull request or can you just fix that up?


