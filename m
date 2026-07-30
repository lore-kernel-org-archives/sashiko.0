Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550EC36493F
	for <sashiko@lists.linux.dev>; Thu, 30 Jul 2026 14:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785422708; cv=none; b=NNiotSjEHAWEdf3n+s/v341vrm78HGcBbWimxrC5wV1FajH45pSvN/QcmvZqZB8ubxDN4p01VFExXa+ykm+0xa2H69pd9aHSd+VXOuBUFu8tNYzq1ujvZucT2xTudjAzKd/WeGfdYPlIsxNiO1zspeDWqxkyW04pithXYG/Kz+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785422708; c=relaxed/simple;
	bh=4m6WEmQMyC0YEoQOpMT5FBxG2mihhrlj54mSlKJ615g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QukmSS3fNwijLaawXbYBoHOpa+e7QV2zk6Hw+FadFExA/Rb9/2+UB95O0jBW6J/incJsLyWuqGJMowW29PfFYvIvqRbJ2L5QNKy76R4a3romNNLhdrf/wp/muO1s2jOKZ5ZD9hnKqYktS+33LEqgB2hMby/cynTCCWjSAzRnjgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=BR7mug28; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="BR7mug28"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDHd1E3091378;
	Thu, 30 Jul 2026 14:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=XvHva8U/YIVcy3RloVrKsUxQK5a666s/2jY79BCta
	fE=; b=BR7mug28pmux7VrmIuFJpL4N8btF4a0zBQptGtEvyuo8pNLokfz5X8Unm
	oCJpmdIM19E+ljbFuY8T1e0uUilnKbpLSeDKCF7kFX6FC/B+eEKMSk59HufzoOF/
	ZoC/I+V6eXbDEm228KMVJgabHL+fjesRXU/DTazPebZEOUwagr4CbGiPTluLyECb
	PLQsMINI3GQFmMcd83bAxGtfj/+lICDIYTqM8LQ62WL8rMEwAjyUM/j+N3F1QYiu
	BPFQlz2zLdaBJJSiv9IROmD48t85f9vJ7FYCW4O1ZeSahJRdt+3qJurClBpLNUe6
	grglFJyeWUkjL6pXLoZi8CpqKNAxw==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fmuw7r9kb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jul 2026 14:45:03 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66UEfIDH015615;
	Thu, 30 Jul 2026 14:45:02 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fn8yhkpj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jul 2026 14:45:02 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66UEj1F927263528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jul 2026 14:45:01 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E732658061;
	Thu, 30 Jul 2026 14:45:00 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 32F0F58059;
	Thu, 30 Jul 2026 14:45:00 +0000 (GMT)
Received: from li-d98989cc-2c66-11b2-a85c-93ab83b7dd53.ehn-de.ibm.com (unknown [9.224.77.173])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Jul 2026 14:45:00 +0000 (GMT)
From: Christian Borntraeger <borntraeger@linux.ibm.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: sashiko@lists.linux.dev, Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: [PATCH] email: add Christian Borntraeger as cc for s390
Date: Thu, 30 Jul 2026 16:44:58 +0200
Message-ID: <20260730144458.286663-1-borntraeger@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VyGze3XE6qm582EAI5e1u2yHz1u8cslZ
X-Proofpoint-ORIG-GUID: VyGze3XE6qm582EAI5e1u2yHz1u8cslZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwOSBTYWx0ZWRfX/bOkBKjra/od
 3r+ZR4+ZJJIIcjH0sZYIomz0q1ZgGSx98kiB9gqhHFyB+svqQoXWDVLU1EqDlhESGH3nh9OqBw6
 6DzfoYn906a5ieCSvdyw6lZn0o55Na8RDocc+Ehk3gIU4QQfW8039K3miiA7Tm/UuhQ5CM77rDt
 uK0H+b/xDys1dBeOBVT1CvAfhD1ocinbYgTQ7a7DnwTKBC1ORN8B4ntEZCrfbW6MSO+T6lGF8/q
 i+2M96Vam8CvHnNxrka+kdoEb/4g5hIZ/Hrs7yI58alwTVl8gR4sUEVk/r1y5kSsh+ij7Au/d0t
 Cs17k9EKWSCd3Ryn4ykkAmxrXfH2TBrnAka95sWPF72UOzPMvavnbTkoSOscG3ovnT4UFHB/Mbl
 yqvR+lW965AAwIhRgrusDL1+7Dz3yKDfH4WAvSsx/UO6aQGIyv2yFP2I3wl4HYF8B1MIrdkqfoF
 iWxIHzeNqje9hR7MMkA==
X-Authority-Analysis: v=2.4 cv=SKFykuvH c=1 sm=1 tr=0 ts=6a6b636f cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8
 a=wnUyv-aQqVoBEQ3DoAIA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwOSBTYWx0ZWRfX/VW+uR4gpHkM
 MngEqGVJdqLbS+kPbYmWbBJ65eleZ9kW/bX/7RWpsBkjUx9ZUBTrq98jkItRTNIp4R/6Rcrb4L1
 AWLmGQG5b4p1tNb/gH33d8FtBJIhA3U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300109

I am a reviewer for s390 and want to see sashiko review.

Signed-off-by: Christian Borntraeger <borntraeger@linux.ibm.com>
---
 sashiko.dev/email_policy.toml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sashiko.dev/email_policy.toml b/sashiko.dev/email_policy.toml
index 26a6665..7e32532 100644
--- a/sashiko.dev/email_policy.toml
+++ b/sashiko.dev/email_policy.toml
@@ -236,7 +236,11 @@ cc = ["linux-target@vger.kernel.org"]
 lists = ["linux-s390@vger.kernel.org"]
 reply_to_author = true
 send_positive_review = true
-cc = ["linux-s390@vger.kernel.org", "Heiko Carstens <hca@linux.ibm.com>", "Vasily Gorbik <gor@linux.ibm.com>", "Alexander Gordeev <agordeev@linux.ibm.com>"]
+cc = ["linux-s390@vger.kernel.org",
+      "Heiko Carstens <hca@linux.ibm.com>",
+      "Vasily Gorbik <gor@linux.ibm.com>",
+      "Alexander Gordeev <agordeev@linux.ibm.com>",
+      "Christian Borntraeger <borntraeger@linux.ibm.vom>"]
 
 [subsystems.kvmarm]
 lists = ["kvmarm@lists.linux.dev"]
-- 
2.55.0

