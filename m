Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055A935E950
	for <sashiko@lists.linux.dev>; Thu, 30 Jul 2026 16:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429738; cv=none; b=sbwYcnPO8P1psuMswcrA4wKHpdJHV7o8x0Bg9n71DT3qX2r//qq6omPludnQyM9qWe1HGklkqL+dUKkV5Mxm08prUGJhqdBDivi+QJtqo0UXJ0hchp8jBDeyF2b4vdsZk66SECGeRLiuO5WXqRbvzrlJvbz04I1XPbTA7AZR/T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429738; c=relaxed/simple;
	bh=qGyV6b6gDdDa5q1UzVto1hUtCtAvdgaryQaWlPZ/u80=;
	h=Message-ID:Date:MIME-Version:Subject:References:To:Cc:From:
	 In-Reply-To:Content-Type; b=sZ81gZgTJmVF8Q/UIF+tSLhrxqtAfnOBdGtpMgl79f+f0ObTt/NV87yEzTRt+QbZwIIX5UZ2ECO2F0hbQhq2V4xjabkuHeLUd9h9lkQa7a3LTAiZriG23er//hu5r9YpY5otgfEOZWH7jrkgn4YVE/wsFT2F6JuSqaav8eAR6tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=dNJqFZpw; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="dNJqFZpw"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFltpM3353648;
	Thu, 30 Jul 2026 16:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=T2hfGU
	OAE4mL5juY+kcdC5S6C+jENeWDpk/oaoI3w/I=; b=dNJqFZpwoJfRXOmqPvDSJS
	/U2TA6ynolw+D8jQt6XAtcyL8SJFTVenbFnk84+2hEGXVYRt3djm9z1hV/u/FE/c
	AYcFd4udGpbornU8Up/5SF6owMkGsRTbhG2cGfEdLFAPq5zCco4lFvXE6J3rzTTC
	q5mNj/SvqGKHxcr5Trh8E8t5eEoKifORxyoXP9ZMkmliHM9rbtjUfvJFGluzusNs
	scLfPk9vdFGZXvk1niMiV4kh7U03r+X/l9UuHa1SPKGXOoA8SvwBU+E/nqkJgiWv
	pYtK4frbMFuo0cYUgdIXdrdoQX3HeKGyYJrtklLfneZhVw562Ai50EY8R8QzfuZw
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fmuyjfxk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jul 2026 16:42:15 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66UGfkh6020283;
	Thu, 30 Jul 2026 16:42:15 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fn8fkc6yc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jul 2026 16:42:15 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66UGgBcW35127696
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jul 2026 16:42:11 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF03920043;
	Thu, 30 Jul 2026 16:42:10 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C10FF20040;
	Thu, 30 Jul 2026 16:42:10 +0000 (GMT)
Received: from [9.87.130.253] (unknown [9.87.130.253])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Jul 2026 16:42:10 +0000 (GMT)
Message-ID: <dd8d55fa-a42d-4f02-89dd-7eb6c587da69@linux.ibm.com>
Date: Thu, 30 Jul 2026 18:42:10 +0200
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: cover letter not considered Fwd: [GIT PULL 0/7] KVM: s390: Fixes for
 7.2
References: <20260727095720.9150-1-borntraeger@linux.ibm.com>
To: sashiko@lists.linux.dev
Cc: Paolo Bonzini <pbonzini@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <20260727095720.9150-1-borntraeger@linux.ibm.com>
X-Forwarded-Message-Id: <20260727095720.9150-1-borntraeger@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMyBTYWx0ZWRfXxP4vbhz8KKnU
 TYvreUAaOMordOUSjRU1mZU94JpQVuPkeyahQaX9LL2xdNDJdxkRJLeYd+PYsJ7+5au8DN7Cma9
 Xs84uq6d/CmyWU3yqfw0sDYLPicE/CM=
X-Proofpoint-GUID: lEIOssuQDLBIzNQzzgmqFvEr9tCrPhhw
X-Proofpoint-ORIG-GUID: lEIOssuQDLBIzNQzzgmqFvEr9tCrPhhw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMyBTYWx0ZWRfXxAk3T1jAHWDD
 IfVgdhU0Tk11vuOv9ZbACJ7xK2KKDsv075YI4Y+U5lSYcSGvRly1dTTEVElALuvONBRQ78QzxOS
 3IzU7768dlmi08ENqiTF8bz16XusadifT47GlAD0EBdntEGD1Jev4j7I7oN39H9E9x1unKAu42h
 Uwy8DnV9XVr4kd34sBSFaOd5acLLrnk+FpGXGKJoT3HdeCzF6NNj/DNWRghk6SdYOB90jvbyGbn
 VUZErmdq1pOXZ0cmuFlMIIBdfr2x3d8EjyUpSBQDWmkki0BJs1ciiWJPVSlW22brMbxuAhjvbjY
 kI2uY4fe6zd48lcZ/cOqc5U99/4Wud9fbIlX+oWiZbnHdvmZzACHBj1Ydp9MGoR1ytkQXyjIF8H
 vRbs/tVVOzagSguzmym/lCYhNJyI4cZGhp/h/0JZ0nf60tlw0qqZdPKmAjHTiEPGUEKDT0L/NME
 zSiXFCl4eiWECH6HyEw==
X-Authority-Analysis: v=2.4 cv=X5Vi7mTe c=1 sm=1 tr=0 ts=6a6b7ee7 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=c92rfblmAAAA:8
 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=SozyvIu0vtazU5hHRPUA:9
 a=QEXdDO2ut3YA:10 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300123

Folks,

I am a bit puzzled. Looking at https://sashiko.dev/#/?list=org.kernel.vger.linux-s390
I do see  1,2,3,4,5,6,7 but not 0 for the PULL request above
  Clicking on on of those mails then also has the 0 mail so its there
https://sashiko.dev/#/patchset/20260727095720.9150-2-borntraeger%40linux.ibm.com

but during review this seems to have been lost. This is unfortunate as the cover letter might
help to find the right tree and with 3 failed applies several already fixed
things (in those 3 patches) are reported instead.


For other pull requests I DO see GIT PULL 0/x. Just search for PULL
on https://sashiko.dev/#/?list=org.kernel.vger.linux-s390
to see bad examples (my pull) and good examples from Claudio.
As we both used git send-email I am puzzled what I did wrong.

any quick idea?

Christian

PS: in addition to that, those patches DID apply to torvalds/master at the point of submission.



-------- Weitergeleitete Nachricht --------
Betreff: [GIT PULL 0/7] KVM: s390: Fixes for 7.2
Datum: Mon, 27 Jul 2026 11:57:13 +0200
Von: Christian Borntraeger <borntraeger@linux.ibm.com>
An: Paolo Bonzini <pbonzini@redhat.com>
Kopie (CC): KVM <kvm@vger.kernel.org>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, linux-s390 <linux-s390@vger.kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, Jaehoon Kim <jhkim@linux.ibm.com>, Douglas Freimuth <freimuth@linux.ibm.com>, Farhan Ali <alifm@linux.ibm.com>

Paolo,

some more fixes triggered by AI bug reports or testing.
Mostly for PCI support.
This also has a regression fix that we introduced in 7.2-rc1

The following changes since commit 3e3aa6da87d30a0064a17b836685cd43c90a3572:

   KVM: s390: pci: Fix handling of AIF enable without AISB (2026-07-09 16:23:10 +0200)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git  tags/kvm-s390-master-7.2-2

for you to fetch changes up to 9972befc3e34ff8b6847198c84f11bfc312dde40:

   KVM: s390: Fall back to short-term pinning in MAP ioctl (2026-07-27 09:23:53 +0200)


All fixes had no new sashiko findings, just pre-existing issues or
finding that are being fixed by other patches of the series.

We have some more fixes pending for gmap and vfio-ccw that still need
testing or sashiko fixups, but we should process these fixes now.


----------------------------------------------------------------
KVM: s390: Fixes for 7.2

- several fixes for PCI passthru in s390 kvm
- fix a 7.2-rc regression in the adapter interrupt mapping code

----------------------------------------------------------------
Farhan Ali (6):
       KVM: s390: pci: Reject adapter interrupt forwarding if already enabled
       KVM: s390: pci: Fix memory accounting for pinned/unpinned pages
       KVM: s390: pci: Fix missing error codes and memory unaccounting
       KVM: s390: pci: Fix NULL dereference on AIBV allocation failure
       KVM: s390: pci: Fix resource leak on IRQ registration failure
       KVM: s390: pci: Validate AIBV and AISB before pinning guest pages

Jaehoon Kim (1):
       KVM: s390: Fall back to short-term pinning in MAP ioctl

  Documentation/virt/kvm/devices/s390_flic.rst |  15 +++-
  arch/s390/include/asm/kvm_host.h             |   5 ++
  arch/s390/kvm/interrupt.c                    |  56 ++++++++++----
  arch/s390/kvm/pci.c                          | 107 +++++++++++++++++++++------
  arch/s390/kvm/pci.h                          |   2 +
  5 files changed, 148 insertions(+), 37 deletions(-)

