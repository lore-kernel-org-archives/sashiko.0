Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F36A3905EC
	for <sashiko@lists.linux.dev>; Tue, 11 Aug 2026 15:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786460796; cv=none; b=gYQjfecMDoO052z1j2sn/f2qO3o79KCN9Ve3K7fOApvXhu1uTDSJuffghAlnMngMrc4DSx31hrtqbTMIQqc9TdFnKplJUXvIE8zHyZzFeLjThARvYMkaO1iT836TlDZ0d+5bXbPUBRh5SUkuNzpdOV2rij4hNWhlH5F8Lr4JR1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786460796; c=relaxed/simple;
	bh=OSrIJ7qHDvS0haIef7PZNG2UFPfYTPF/sEGslemMy+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cpilq4rWJHeZyBMqKI+qzv9B/1IDmDOFfRHqkaUDirs95UK9NIYsI/LUriO2QrYYGqlie1e/akesG69FEGF7Q17Ge8sYMAlOEIGmkVRQ8pLMwdQDR66Ej+RC3j6OarJvnBBe+NlHYqOWzwApYJSzUQ7U4/YaGojll/BhbmYW+oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=saFUuZYa; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="saFUuZYa"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDXJM9570120;
	Tue, 11 Aug 2026 15:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=AhItKn
	mSahi+osjNXA5HPIkRANfYYKfpXG4iTd9rrx4=; b=saFUuZYa5+jC/lZtw3rxD0
	WrViGjDh3kuZFSRQ12zm8BstlX5zuGHqXeTbUXE/BB9PEGABboByTv/h+K0j/OYI
	e4B8qiboM2CkJoSyyoakNIwj7sfRreeJmemCQkhBw61cU5kBgazN5/FIiYu3tsMg
	LPqkcRpUr85zpa89Tuv+gCQnkRjE4avrzknqKgU4ci9Yxzy4h+RbUrsqwnTSTBP6
	kshdY82qlvcvumaXlzQeh/N83K/YoBVymibkyJb5Hd6Y7DLCBHYmJd+f5e5YfFzF
	9LNy46RyP3VAZ5zN0zu+u6FloZJDoaQOuhRskO1/lMerA4+Z0zkRZhLDjxaeuamg
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fwvnw4w7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 15:06:31 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67BEuJcW004748;
	Tue, 11 Aug 2026 15:06:31 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fxf5w1hvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 15:06:30 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67BF6SsX38338826
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Aug 2026 15:06:29 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA8A220043;
	Tue, 11 Aug 2026 15:06:28 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A0C6C20040;
	Tue, 11 Aug 2026 15:06:28 +0000 (GMT)
Received: from [9.111.66.26] (unknown [9.111.66.26])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Aug 2026 15:06:28 +0000 (GMT)
Message-ID: <3420caf9-1a22-4eb8-891a-0732c5cf4c14@linux.ibm.com>
Date: Tue, 11 Aug 2026 17:06:28 +0200
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] email: add Christian Borntraeger as cc for s390
To: debarbos@redhat.com
Cc: Roman Gushchin <roman.gushchin@linux.dev>, sashiko@lists.linux.dev
References: <20260730144458.286663-1-borntraeger@linux.ibm.com>
 <amyX26L0KIXR2WAu@debarbos-thinkpadt14gen5.rmtusma.csb>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <amyX26L0KIXR2WAu@debarbos-thinkpadt14gen5.rmtusma.csb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=RsP16imK c=1 sm=1 tr=0 ts=6a7b3a77 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8
 a=VwQbUJbxAAAA:8 a=3gwnnm5LOX8L08km7TsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: DyvkvHNt2DA1Ft-CnaTljCdfge9PHqgM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEyNSBTYWx0ZWRfX8nb4C7XrKD90
 1ys48IDnMR9r8u1kCacZ5/yFoDxHtjI0PqnkHFJB1YhNqtomjrywkwscWftwaCpLZY2GoILfQF8
 w5YoFVvv9ibyPDS8B/Ld96YBkdAUbr1UitHafQQ5FF4MzmbtJnjqJ054mMjV4XWc5wmxIj7Hn8y
 MQs0qoE5ZlHNRnFnyjPZDOst02aPdy8ed9k2Hhg6cQqinh61jx3nQMZ8/gXsGRk57VBtZLZurT7
 6YVmH+odTzPWuE6efl9bLi3N/GLOcT2mWLDK1J4R0yZCW9iuKkgT6kK04iRHyz6s4C1KSImISCh
 PJVEaXGt5hF/rhnGjE1BevjVof7JLSMjy+eElZfSqXk/aKcpU3Q6T47A04i7Z3xCBkLu18qexz0
 9B7MWgmEhYPlTbdVOTbm23AVnzrkMsTlJMmckMWaDDtuaza6I4I+p4lCD2uB4Iqqb8flW78HAUP
 GG+bpSvUyiK/fmlMURA==
X-Proofpoint-ORIG-GUID: DyvkvHNt2DA1Ft-CnaTljCdfge9PHqgM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEyNSBTYWx0ZWRfX5T3O0yX0aab4
 Sj+UqYbKwnrdmcHiK1saMf88HZ1Y88Wi6N7aufkz+JQAOcjB8Qrmf60QqRDCcYEybxIAFpJehr9
 BBeKp9RIrnNo6EpGZRRWCGfohGvj/r8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110125


Am 31.07.26 um 14:42 schrieb Derek Barbosa:
> Hi,
> 
> On Thu, Jul 30, 2026 at 04:44:58PM +0200, Christian Borntraeger wrote:
>> I am a reviewer for s390 and want to see sashiko review.
>>
>> Signed-off-by: Christian Borntraeger <borntraeger@linux.ibm.com>
>> ---
>>   sashiko.dev/email_policy.toml | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>


We no longer get emails for the linux-s390 list and it

>> diff --git a/sashiko.dev/email_policy.toml b/sashiko.dev/email_policy.toml
>> index 26a6665..7e32532 100644
>> --- a/sashiko.dev/email_policy.toml
>> +++ b/sashiko.dev/email_policy.toml
>> @@ -236,7 +236,11 @@ cc = ["linux-target@vger.kernel.org"]
>>   lists = ["linux-s390@vger.kernel.org"]
>>   reply_to_author = true
>>   send_positive_review = true
>> -cc = ["linux-s390@vger.kernel.org", "Heiko Carstens <hca@linux.ibm.com>", "Vasily Gorbik <gor@linux.ibm.com>", "Alexander Gordeev <agordeev@linux.ibm.com>"]
>> +cc = ["linux-s390@vger.kernel.org",
>> +      "Heiko Carstens <hca@linux.ibm.com>",
>> +      "Vasily Gorbik <gor@linux.ibm.com>",
>> +      "Alexander Gordeev <agordeev@linux.ibm.com>",
>> +      "Christian Borntraeger <borntraeger@linux.ibm.vom>"]
looks like I messed up, ibm.vom instead of ibm.com

Can you fix that up? Would that explain the missing mails on the mailing list itself?
