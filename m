Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6204248A9
	for <sashiko@lists.linux.dev>; Fri, 24 Jul 2026 10:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889911; cv=none; b=NXoUdzLORJ33+O/J1rx/kTnMHgx7s+xyAhxtVqRS88HHYG+HmAcwITAdx8txYKEP51GRaKppxt1UAQIv1C0tADFHTTdFtilMgL8VVx0fXHu78VeoU0s0oF1B6zlj+NSgZgvkERMR+ZS75LtXVXKP/Yurwhk/ssAojIyFPACg8/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889911; c=relaxed/simple;
	bh=JygWzPkgnzIlkuSqdGJ3/55rnrfLq3ygFffb/IHO0Ow=;
	h=Message-ID:Subject:From:To:Cc:Content-Type:Date:MIME-Version; b=D6pGj17ONgbn+eDRv8IFceYSsISD0j6qjY16k8zuFVUPweqT8JlKcYAoCT8NUN3frhQ65eAqITNDGMIqZ8OHR4ffFetWaSlxpRdGTKJQXqZxBcmMa4lluxXsoYHKYH2dND77TiFrTQ6KBYcXcn6H8w5T5PwXZBmYsxgg2IdzV+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=DCOJx4QP; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="DCOJx4QP"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADMX61456039;
	Fri, 24 Jul 2026 10:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=JygWzPkgnzIlkuSqdGJ3/55rnrfL
	q3ygFffb/IHO0Ow=; b=DCOJx4QPwXBA6C7ImHIjKcvHShyxiFise0GxmTARs2ap
	xcQqRkZ1RTIadPqTaoFbnSGf57gfHRBTNW1858C0WAl/pZi3tqq/vxzeDFM1FzsY
	cwri7rxTGTq+2m4SFXSd+HpPgFdoxIgJA/oMZNrsvMwl1akoiqvifVztxZtwDNXT
	TQgLOiQWT4FidesdEs5Eu2IYZED9VkFdsNvU+FL7xCqkfY+GSrSKfbhPkZtAb3rV
	QgUjOtQhrzPPQlrhO/98TUpj4Kb3RPUFTwW7MCmgETNhpLaVOSSNLD8uPFcSgrVP
	vkTbGIwhpuoTJQdyutY3YJ+rFJfpogsyx+qbz3vRSQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fg77kkmra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 10:44:58 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66OAYnVH006255;
	Fri, 24 Jul 2026 10:44:57 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fgp1graxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 10:44:57 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66OAiuG913238836
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jul 2026 10:44:56 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CC4245805D;
	Fri, 24 Jul 2026 10:44:56 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7940058052;
	Fri, 24 Jul 2026 10:44:56 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown [9.61.33.223])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 24 Jul 2026 10:44:56 +0000 (GMT)
Message-ID: <a517e05580a5f2c0d1db874aa2e9e4fd41bdc564.camel@linux.ibm.com>
Subject: linux-integrity@vger.kernel.org
From: Mimi Zohar <zohar@linux.ibm.com>
To: sashiko@lists.linux.dev
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
        Jarkko Sakkinen
	 <jarkko@kernel.org>,
        Roberto Sassu <roberto.sassu@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 06:44:56 -0400
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=HJXz0Itv c=1 sm=1 tr=0 ts=6a63422a cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=VwQbUJbxAAAA:8
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=Q5z5TdnTAcvZ-ON6d_8A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NyBTYWx0ZWRfXwhYIPpu0O4Dl
 5cnrxSD4k3PPbr9heT94nLFLENTN2ca8IF0fa1MKA4kLddL5B1trAN4gd10XzygXwi4LpvLQfYC
 BiGd/ef+I8cCWzBTqSID+OmvZquTtfHDEo13a058mhNPyYZS/Avuz77bmFmvE+euVxDV7hkZ72W
 YfEisA7RO1ueH0eaKeiGgfOH8NrBCCi1YqYmaGhHoRyArabCL7eUjRjvFmiKzdT3+7Os1cj4P+P
 EU7R9OyyLW2uMdtIg+LGdOpllO/xG9fbKIOe6ccfFelnESrF04Pju788cLOG49rjHqhLPSi3e3d
 E7giCu2FVU38+8/Wheyr3rWz7JVrLRyGh0YgBrn6qWLyiDug2suFHcpH1NMVlh/FfwoIDMlC8KP
 /hqOuGeVnsGDl56BIWQ5E24eHkZ5mJJl6rsrb4rxh74RO1BBv4ma14L8ixH3Vh4wd0h/pbS9k4b
 039fXsYudRU7aDYu4PQ==
X-Proofpoint-ORIG-GUID: pNq8jjILCz9iClowKAmDCrxvGx6Y4Uc-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NyBTYWx0ZWRfXzrxFrqx1eRXk
 wRwYhJVosRh1yAu7ynXJqtxzVBufkwHYPNyxqa1diIbW49NgsQ5vUDfV9Do+YyX2PB7NhWQIRX8
 7DuFhsR+i10ft+1iRO6i590kflPjiqk=
X-Proofpoint-GUID: pNq8jjILCz9iClowKAmDCrxvGx6Y4Uc-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1011 phishscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240097

Hi Roman,

Please add the linux-integrity@vger.kernel.org mailing list.

Mimi
