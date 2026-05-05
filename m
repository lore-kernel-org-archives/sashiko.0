Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B2732F757
	for <sashiko@lists.linux.dev>; Tue,  5 May 2026 11:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777982204; cv=none; b=Sg3YIwuslRUGSeuZBSRzPHozLpnx1D7BQHLbwNCHPY1As+FfbU/a1yKzKXoAMmvG+6D8CBgQSAXQH9LN4P9nCtjPiqAQWpGCNaPyGxunu+7AV17EoURd9zSEKQ/oVYAGh2G7A3zouMYshgt03I59b+D3D9Jh14xKPN7MLVBiEh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777982204; c=relaxed/simple;
	bh=GSWpfEqK9UoP1C04UUdrWXVimCVojA9Wr0Ry40Awmks=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=I6XnO0iXHHueAEOFTPsqdGVH8JXP/qGjHDzYymaB7yg7YESxkr0LfpLAYGEv+elHrlulPxJ77J1dXVfGRdvfzxRbPA+Mxaqow3s4cWgH6LIC1xA0pnrYaQTKIiXjTeOgH/Zj+yZhAMSWh4esmQpKVGaQu4lfgsvwH67ZiOLJyaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=OhHzdskp; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="OhHzdskp"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6459wxve631449;
	Tue, 5 May 2026 11:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=GSWpfEqK9UoP1C04UUdrWXVimCVo
	jA9Wr0Ry40Awmks=; b=OhHzdskp0JX+fPcC7Ra3NMlBLkf0DY7x75RvprvVTRbz
	LTZkUszXmn53J+LvUWdKUkiIDVSm4bNPThNAcOosa3IttXJ0rq2twBOy2i+mYYSc
	5H9DD5C5U7dMuAoiT3puBItAaJ0ms4632BrZ2tiGZFwHRIzYubEtU9dJqJaKLqX0
	s0te6vjeVdOnELQDlYvU/TtBCs4pvvyO7cAhmr2DhmSPxLC93BESvcd6k8fKLAaY
	z/tQKMHNpBPImjpsXVazMdhp93A4nEnwIhYXySqKFWYFGbFKtl/aFLj9CtF/xYtO
	R+5xUm+VO0KzexZ+TOIvcXvK9lx8UEbCw66O9k7dfQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dw9w6b4ft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 11:56:27 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 645BsT3Z015989;
	Tue, 5 May 2026 11:56:26 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dwvkjsdap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 11:56:26 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 645BuO6o43385130
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 May 2026 11:56:24 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F11920040;
	Tue,  5 May 2026 11:56:24 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 41E592004E;
	Tue,  5 May 2026 11:56:24 +0000 (GMT)
Received: from [9.111.37.142] (unknown [9.111.37.142])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  5 May 2026 11:56:24 +0000 (GMT)
Message-ID: <6d2bebec-4bcb-46d2-b9b0-c1a83e087477@linux.ibm.com>
Date: Tue, 5 May 2026 13:56:23 +0200
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: sashiko@lists.linux.dev
Cc: Roman Gushchin <roman.gushchin@linux.dev>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: Please add linux-s390 to sashiko.dev
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=XPQAjwhE c=1 sm=1 tr=0 ts=69f9daeb cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VwQbUJbxAAAA:8
 a=i8w3aed-5sUafbzi7M0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 4Da8NiLH9dtHUvYvsM3a8AybHEFSNWYv
X-Proofpoint-GUID: 4Da8NiLH9dtHUvYvsM3a8AybHEFSNWYv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEwOSBTYWx0ZWRfX+yd7QR2xlXPH
 a7pWWM6sSHKikyJTX0uzFhg7takjAyKcrHUSweq733wqwqLmhEvhUmcmhcOVbS+y27QAKKLgN3C
 UTKEzg/LKJJLsWoPVG8/MtubBmyQPXzzgWnIMh2zHw+Qt4IZV3ZaZyLlMy8R5idoh4zMp5zxQXh
 uxdF39C546Pc0vHFbTq7fjiEg24LWM+SXZx19nA9ArWn3YBiowXbOfGl0ZpZ+xH4aXsi5zUAgOC
 MYzoNgCAYoBndJkBBFOBBBuIsRFdF9kd6WiDPFw4T9FwY2W7o4oZqZWD41ukLnaUqREa+fPyXUQ
 ovTYNlu66j8Ch/AjQ3BX50PVGwdYimez8KUwEdT2oB0SZ/Z++MITZJZFNYtoChklQ6dbBbZRR0u
 QLEWk1rNkPyutCzHsoM4khbWymzfxPjSr6tOxy+SgwTT/kABsN+f37fRF+dZtSdZhjiEenNGWIR
 q68UwfsgGEDTxtqrMWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050109

Folks,

thank you for the great work with Sashiko. We highly benefit from the results.

would it be possible to add
linux-s390 <linux-s390@vger.kernel.org>
to the sashiko patch review?
The archives are at
https://lore.kernel.org/linux-s390/

Thanks a lot

Christian Bornträger

