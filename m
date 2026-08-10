Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EA5242D70
	for <sashiko@lists.linux.dev>; Mon, 10 Aug 2026 12:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786365063; cv=none; b=QMwnJxoag4tK3TQtGxbPS9qWgQGbs63lebXRXPo6qSOOQQDlVGYnBmXfuJzyWScYn6YsIKwPaZYJzu88lJJBrf6Zo6QgptjRUG1X7uQsXxTQmdex2rET/3JwxZ+hGMvvAf9ooWOVI8Mi+cskicpqccWj3bf7OZ2gtst4EOxdB/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786365063; c=relaxed/simple;
	bh=zYxxPvZNlLbAO749/mkmZBrzxZDDZnukR1G8Sy4dwSE=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=k8YhwAnFRsw74mdPgV+LU46GGDgq7IcXFgutDzBuAhKqDlk8pu1mQH2ZMdhzkrZaanR2YRkBNGLW3ba5Wi+sHMS2Q2ppLWRtMuSYmJj53S+Ap5a3pteHAg2c4mTCwBcjI6ePKJfjFp7WbZayg8a0g8q8Vwzv4JOhsTLZtJzWgew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=HNvfPPb4; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="HNvfPPb4"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9VT6O3584017;
	Mon, 10 Aug 2026 12:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=XZpGW9
	Fxao3XLMctaWt+kvviXw0PESsu9j0NSLOR0Mo=; b=HNvfPPb4Z0Ez2Zc0FzFzV3
	rju7yJ8TyugnHxBUjN+wIf4h3JxbQDYcYivBZ+mJjBFQLJfUjjeFnc1oZ1Q1Oys4
	EvbmiwBhEyfkqJMfw+9kuuAsqfIw1aoQ/OuUfRFWA93vGiX3WDX9Hsn84UAkwT5S
	IPXpjkKZu4KWLy7Xofx6keq1yvE2440q8VEGk9ur4dHEcI+XxmCiWk6H8X7pKqxg
	kXnpRtw5n+7QeQSxwn+pAmxvnd9jY0gvUaZq56IsSw3NhZJAvUP4y023/u8eUmEr
	tDsxoxSIROdtBgZpObzIglI21Iwyoc/LUdL8dlVK2Lc1cxojmGB3zBAU5+5OLE0g
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fwvjyqve1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 12:30:28 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67ACQEKv019756;
	Mon, 10 Aug 2026 12:30:27 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fxh0g4k3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 12:30:27 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67ACUQpP18219744
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Aug 2026 12:30:27 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D3E1B5805D;
	Mon, 10 Aug 2026 12:30:26 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 71BB058052;
	Mon, 10 Aug 2026 12:30:26 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown [9.61.84.32])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 10 Aug 2026 12:30:26 +0000 (GMT)
Message-ID: <cdc5a433d5d4bda333e21120d0a809e0f0446e9d.camel@linux.ibm.com>
Subject: Re: linux-integrity@vger.kernel.org
From: Mimi Zohar <zohar@linux.ibm.com>
To: debarbos@redhat.com
Cc: Jarkko Sakkinen <jarkko@kernel.org>, sashiko@lists.linux.dev,
        Roman
 Gushchin <roman.gushchin@linux.dev>,
        Roberto Sassu
 <roberto.sassu@huaweicloud.com>
In-Reply-To: <anm65Q01HoJCv9d8@debarbos-thinkpadt14gen5.rmtusma.csb>
References: <a517e05580a5f2c0d1db874aa2e9e4fd41bdc564.camel@linux.ibm.com>
	 <amNlJJELzzT8tPkG@debarbos-thinkpadt14gen5.rmtusma.csb>
	 <amQXY9PhaZGIQVow@kernel.org>
	 <8748b85855de93d307e1a6715336de860cbbfeda.camel@linux.ibm.com>
	 <anm65Q01HoJCv9d8@debarbos-thinkpadt14gen5.rmtusma.csb>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 08:30:26 -0400
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMyBTYWx0ZWRfXwFC+L0zhW9TR
 Q2FwkdJ2wormOirnmTv7G4y3SY5orbHPLFZufxGbhoA32qsNSGbEvN5/aYox4L/CG/KCcJ4AgjH
 WlBgw/xWD5Fishkra0jl7WFdamI12msgYHck4AcBRUL6tJAikjUBt0+vrnb1jcXElSUC6PWzx8I
 sB89LTh0WXWcRDyfl0p48AY16ZYxsG0yhmBRt0YRPB3aLyddRqnDZZnYhe42EL2lQsgjSN0zvTW
 djyMBgkXSBpKkO0RQJbmMNEh+LrBxCAFnvreN6+tgC2Et0rRqah1lCCuebuvBwybqskU0mcbVUa
 owT13NJwtCbKgxoPEc3bGwAJMD9Zq2B4v51Doa5SvtqhP8hj/NdLVjC/mfOncjlBSxUUXrZGuo3
 K3HPqp4P2yKWNwDWw1JVLDgLzkn4r7dixxcxE0ABgrYqka0GDV1uhkKgEQ2WYCmsjXqNpD9mONa
 46Kb+X+g3aqu/cWJmMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMyBTYWx0ZWRfXxZPnCo2/RdvN
 8GZTiTE6MI4CTSc0gymv+Q46mo85PGBZxQ2QMfFLpHXOxlZ+RWdOBHUAn9JVnstnL5lF9VKOXiA
 P+Fkao4oQZlAZZGQPhtDcH6APMMgJDI=
X-Authority-Analysis: v=2.4 cv=RqD16imK c=1 sm=1 tr=0 ts=6a79c464 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=VwQbUJbxAAAA:8
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=NEAV23lmAAAA:8
 a=c92rfblmAAAA:8 a=20KFwNOVAAAA:8 a=H6q07ilCUHDv9UbX70QA:9 a=QEXdDO2ut3YA:10
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: UDpvyT8JpZeIST2ZDATtObzdGr8qFVBU
X-Proofpoint-ORIG-GUID: UDpvyT8JpZeIST2ZDATtObzdGr8qFVBU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100103

On Mon, 2026-08-10 at 07:50 -0400, Derek Barbosa wrote:
> Hi,
>=20
> On Mon, Aug 03, 2026 at 08:41:10AM -0400, Mimi Zohar wrote:
> > On Sat, 2026-07-25 at 04:54 +0300, Jarkko Sakkinen wrote:
> > > On Fri, Jul 24, 2026 at 09:16:53AM -0400, Derek Barbosa wrote:
> > > > Hi,
> > > >=20
> > > > On Fri, Jul 24, 2026 at 06:44:56AM -0400, Mimi Zohar wrote:
> > > > > Hi Roman,
> > > > >=20
> > > > > Please add the linux-integrity@vger.kernel.org mailing list.
> > > > >=20
> > > > > Mimi
> > > > >=20
> > > >=20
> > > > See [0] -- Roman is out, so it may be a while until it is enabled.
> > > >=20
> > > >=20
> > > > Cheers,
> > > >=20
> > > > [0] https://github.com/sashiko-dev/sashiko/pull/371
> > > >=20
> > > > --=20
> > > > Derek <debarbos@redhat.com>
> > > >=20
> > >=20
> > > In the meanwhile, what does it mean in practice, when it is enabled?
> > >=20
> > > Just catching up with the topic...
> >=20
> > For now, we're just requesting that Sashiko be enabled for the linux-in=
tegrity
> > mailing.  Sashiko's review results will be published on https://sashiko=
.dev/.
> >=20
> > Mimi
> >=20
>=20
> I forgot to ask -- would you like for the Sashiko bot to reply to patch a=
uthors
> on the mailing list?

Probably later, once I become more familiar/comfortable with it.  For now,
please just have it got to the https://sashiko.dev/.

thanks,

Mimi
