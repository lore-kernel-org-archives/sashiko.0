Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B66288C30
	for <sashiko@lists.linux.dev>; Mon,  3 Aug 2026 07:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785742483; cv=none; b=gAttrdvmZbHOPmg5/bnrWVdzXO+8Be/9Y9DAdiCmoFDYEvo8WvS+nxgoj/VfRt0tdBmyzFcyRweA8Z+In0oh0iqykf5PCY7HLTbWb/UzV6z9kKOSZbiL2MCRiFHDOTjTH3aKYpFL9jjVunrnb2OviNRLby2OwY1Mqg0qaEvEGJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785742483; c=relaxed/simple;
	bh=qkrPHMgaTkW4HWa8CDeQ6j4QNzo4aoz/4ndn0hYhBO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hKOKWnpfvojnBd8458Pweg6VO2sg/V95cqmufEojGCgaalVGHMadVfOCEq/1/1pUxg0DXEe2MyXo0SEH5662G58YGxDuaR9EwDN5i/scUiBwAauCKz4LVa+PHRPfKBXBhEfGYNj8a3gLVzU4sTcs8ZYKceqmRCOIzpsrzsnXUMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=dw8UlZ1A; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="dw8UlZ1A"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672Llm83223089;
	Mon, 3 Aug 2026 07:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=8Gt8zF
	PSranWfZdH+IGeW2ekh3BX+EPd4ql6N0ILdW8=; b=dw8UlZ1ArW3fO7bg/l0Hw+
	b9t+fzak51Y10JxWd8ytoYTegNUd6PTaoNcQ7cCxZWO93O73KLWu2xopSRdmbN0n
	XlB90HBo16jjnCHe9l8edO/WSAKV4gH2RuphPjE6N4/YU6C4ig5DTcNt1d6FZItv
	BWx4O7FMPJ+VqM+3lVlyI1/NeLRqGqXIDvx6LeJzhYAKWMd75/Juoa/4uyfwPFcG
	eGvwIS6bE0ZK4mu1eHe+DKAUjkLsSmpSRe8F0gZDaLBgbEk6VHhqrT/TJVlfVVjT
	ChOl+/jfY+p+BsOMvLBgeajH8/jVvP0vDGCpFRTm+RrmM+GIU+QOjETqO06FlBsg
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fs8a3qf8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 07:34:41 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6737QK6L004797;
	Mon, 3 Aug 2026 07:34:40 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fsvmh47e4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 07:34:40 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6737YcJR30409156
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Aug 2026 07:34:38 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2325D2004D;
	Mon,  3 Aug 2026 07:34:38 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 07CA62004B;
	Mon,  3 Aug 2026 07:34:38 +0000 (GMT)
Received: from [9.224.77.173] (unknown [9.224.77.173])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  3 Aug 2026 07:34:37 +0000 (GMT)
Message-ID: <ed23ce9e-2cdd-472a-85e4-c0cdf81359b9@linux.ibm.com>
Date: Mon, 3 Aug 2026 09:34:37 +0200
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: cover letter not considered Fwd: [GIT PULL 0/7] KVM: s390: Fixes
 for 7.2
To: debarbos@redhat.com
Cc: sashiko@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>
References: <20260727095720.9150-1-borntraeger@linux.ibm.com>
 <dd8d55fa-a42d-4f02-89dd-7eb6c587da69@linux.ibm.com>
 <amy0kq7Dh2TzsWlj@debarbos-thinkpadt14gen5.rmtusma.csb>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <amy0kq7Dh2TzsWlj@debarbos-thinkpadt14gen5.rmtusma.csb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=E6P9Y6dl c=1 sm=1 tr=0 ts=6a704491 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=c92rfblmAAAA:8
 a=VnNF1IyMAAAA:8 a=8iKyTcytvczxdo5fTy0A:9 a=QEXdDO2ut3YA:10
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: 6yfA-4jAZWJ3kFZqG1nwnZq9PggJBLXH
X-Proofpoint-GUID: 6yfA-4jAZWJ3kFZqG1nwnZq9PggJBLXH
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA2MyBTYWx0ZWRfXzSWHJnpqfQ+s
 R0LhhzZ3GsQfl43W276Q4y3atNPjbhO+xCbUqDXaGYKAsQDcZA3zAAxvpHENgKVowGBloUIkHwc
 ZTUHztX6M5OLVZFP3+1TAVb9aXLz11E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA2MyBTYWx0ZWRfX6aySFw+vjV6l
 MmU8xiJFb13EclzzLBLP2czSEsj9v0MsPQLqBL8jOhdy11svY+gWk3/hnBtzppOxYn2jnIpZbNs
 y1hEyxmWnFetu5SUJV+L8CKS7+1a66ub/rYM14fmjGpERG2IHLmFxexl1C4SCnB6ihG8ptQw1ez
 ijlYYpV+4n71SyQP2o/CQFNjPfebFumJ51Dd+1tKvwxNFMmXRv70fMcVGblQfkynY3NGGkGzEUt
 nxgDU3VvsiAIiyR90fiWXxr1A99wBTNY9MV+VX0hZNrFOzZRY7bNJHDU3FLGZKGgF9idzPz5ho2
 p4dwFF0dySKDii/8o/yO2J87Nneog2txpw9ZKY2xoFHk9jyBcM9YMcZpwSsBymo2Kq3obJOMMyB
 HVu+OyxfuecYpLzz4Wx0WB9ANGWMv3SkEQXJlFGDVRVUQcOK4PNJKv2T69fkaA92ot9+Hh8uVv+
 /glijiPChmcGFBJLq+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030063

Am 31.07.26 um 17:02 schrieb Derek Barbosa:
> Hi Christian, sorry for the delay
> 
> On Thu, Jul 30, 2026 at 06:42:10PM +0200, Christian Borntraeger wrote:
>> Folks,
>>
>> I am a bit puzzled. Looking at https://sashiko.dev/#/?list=org.kernel.vger.linux-s390
>> I do see  1,2,3,4,5,6,7 but not 0 for the PULL request above
>>   Clicking on on of those mails then also has the 0 mail so its there
>> https://sashiko.dev/#/patchset/20260727095720.9150-2-borntraeger%40linux.ibm.com
>>
>> but during review this seems to have been lost. This is unfortunate as the cover letter might
>> help to find the right tree and with 3 failed applies several already fixed
>> things (in those 3 patches) are reported instead.
> 
> IIUC in the current code, cover letters are not considered patches in
> the DB and therfore do not get forwarded to the reviewer processes.
> 
> I have been working on improving the concept of a "patch series summary" that
> propagates a small snippet of "context" to all reviewer threads. Currently, the
> individual worker threads only get a range from base..HEAD and use git log
> --format=%s to get insight into other patches in a series.
> 
> So the cover letter never really makes it's way into the "working context" of a
> single worker in isolation.
> 
> Is your concern not being able to quickly view the '0'-indexed mail? or that it
> may help with review accuracy if it were to make it's way into the review
> process?
My concern is more that we get reports about issues that are fixed in a subsequent patch.
But maybe this is just due to random email delay that sashiko receives some mails later?
Maybe we could delay review for 5 minutes or so if this seems to be part of a series.
But I think we already detect that?
