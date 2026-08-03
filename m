Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B9D41DDFA
	for <sashiko@lists.linux.dev>; Mon,  3 Aug 2026 12:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785760884; cv=none; b=G0Z0dWVciPLNFAbkNeT8ejLoZuECleMBpAmshrK9tGlqOJm7EPbw2zTdQ/V9i5HdMIzw+RkL6T4QLa/zi7wQTGTt3LV9/7xqdnXguvl234EU40bkyfJDnvmYkVMJ3O2ad6jqUISdFGcf/KeJckWpoIWapD4KPtBKvvxD1KK4WDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785760884; c=relaxed/simple;
	bh=esMAJzVildlDyIyV1PntXcZHNXaRz4LG7OrfIz7q56M=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=spkkp5N8gjMgNyhSZJ3Hxwy+sbBMiWOpukCrB1M+wRxIRyq6xG+HB7fFDI30TkQJIAVRSx52Oa6wPPaGe1fsMuNEWtkHR82w6VadSUiX4RSUzb1oAvWW6ekFOo1IfvlQn5Xx2jjkurkE1rJqgEfU3YL9kJNyD4DriWH82IrqSVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Gly2dzop; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Gly2dzop"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673CI6Be1938556;
	Mon, 3 Aug 2026 12:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ZBc9S0
	QAAXKoBsGjReAmT4KTWhooIfBpIuwSD+pNWEU=; b=Gly2dzopZgIj5H2aKuOmvS
	jvKyillV8rbiazH4/uCSbWDpB7CicAoHqs8G1ECRfx8R7Go+0tHeZ3B8BW3t4TT2
	CutXOQ0tq3FB0NYampyXFhkdUh1qB2dUjjyy+URZthUHNXgVP8jwOS58Bmdqo2+X
	7cI1WrwNOi5mjVhQ3s+EAoWhADxqQHgXJ9BtjFaslpew00ENsWoOYyIJ7Q/znpLB
	G7MLJeNU5mtZerCQ1HcPk0rySQJD+ZMgvbP0zSjODkolZoptBXSyXIR3Z4xpgHQz
	Wv24kD3LkGNDaDOXVuLbgXjKbogjs3ef5wgouBPF2jNjCov+QOBc9044niOMTyFw
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fs67hgqev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 12:41:12 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 673CQEQ1025903;
	Mon, 3 Aug 2026 12:41:12 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fswtyd3kg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 12:41:12 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 673CfBdB13435510
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Aug 2026 12:41:11 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B1B95803F;
	Mon,  3 Aug 2026 12:41:11 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AEFF458054;
	Mon,  3 Aug 2026 12:41:10 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown [9.61.40.229])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  3 Aug 2026 12:41:10 +0000 (GMT)
Message-ID: <8748b85855de93d307e1a6715336de860cbbfeda.camel@linux.ibm.com>
Subject: Re: linux-integrity@vger.kernel.org
From: Mimi Zohar <zohar@linux.ibm.com>
To: Jarkko Sakkinen <jarkko@kernel.org>, Derek Barbosa <debarbos@redhat.com>
Cc: sashiko@lists.linux.dev, Roman Gushchin <roman.gushchin@linux.dev>,
        Roberto Sassu <roberto.sassu@huaweicloud.com>
In-Reply-To: <amQXY9PhaZGIQVow@kernel.org>
References: <a517e05580a5f2c0d1db874aa2e9e4fd41bdc564.camel@linux.ibm.com>
	 <amNlJJELzzT8tPkG@debarbos-thinkpadt14gen5.rmtusma.csb>
	 <amQXY9PhaZGIQVow@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 08:41:10 -0400
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDExMCBTYWx0ZWRfX+UTOfIxQI95i
 jGVgsBjcBzHteH5JLRFqyPiNbsTZxvlCMmJAtdxnJNGylfggnMhDPFaaX9TJ6/HuVS2LtSwwzWt
 2fxdFv0NFywd/pf+Ut6MNhyNhdkMEiw=
X-Authority-Analysis: v=2.4 cv=I7VVgtgg c=1 sm=1 tr=0 ts=6a708c68 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=VwQbUJbxAAAA:8
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=NEAV23lmAAAA:8
 a=c92rfblmAAAA:8 a=20KFwNOVAAAA:8 a=ggXO5RtCtp72pukzlo8A:9 a=QEXdDO2ut3YA:10
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDExMCBTYWx0ZWRfXx6IQfhZkHyLV
 UGPEewi6Eco59hvEsg7CWQVGZVY8l5tu6whUKeqRISJaiz7pA5txw15XdOMiJTE3kX9wD1LwlzQ
 BEvGXE69kkOseFHOczQIogF91ZKTMUEr1qt0xfU4VS+X86fXoD5l78ILXZQ3CeaYMBtzbs6yzQb
 KAJqzgjDhdLjJinnx8Fid/W4fmNYWbUo6wT5gk/p1T6H35cP8ZuXT1I2TPbUJPpKYfAYTWyLNhv
 AALZVAv8lflS0bGOWm8HA6Q5qJEEo3MvdVrQ9B+2MlOToJCv4wJWA9m2nCRxjndfYITwf/gCyOK
 v0+EjnUrYJkXEIIx+3dYb34+vj+cdas/fBTteeJ0pit9iDM0tlRS+iDcy+2wz4UUSBuFClvTzOY
 ioAT8RVT1RQygwU86ZQqD6wASD3MIXhrWhIQnw8e+Npbplr95k9h3XCpjV2zQPUW5UBMxhex7uK
 20c8C6Sg07w18x1jK5Q==
X-Proofpoint-ORIG-GUID: M7NeiDyKVMweXuWN0FIla2lazPbkeU5Z
X-Proofpoint-GUID: M7NeiDyKVMweXuWN0FIla2lazPbkeU5Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030110

On Sat, 2026-07-25 at 04:54 +0300, Jarkko Sakkinen wrote:
> On Fri, Jul 24, 2026 at 09:16:53AM -0400, Derek Barbosa wrote:
> > Hi,
> >=20
> > On Fri, Jul 24, 2026 at 06:44:56AM -0400, Mimi Zohar wrote:
> > > Hi Roman,
> > >=20
> > > Please add the linux-integrity@vger.kernel.org mailing list.
> > >=20
> > > Mimi
> > >=20
> >=20
> > See [0] -- Roman is out, so it may be a while until it is enabled.
> >=20
> >=20
> > Cheers,
> >=20
> > [0] https://github.com/sashiko-dev/sashiko/pull/371
> >=20
> > --=20
> > Derek <debarbos@redhat.com>
> >=20
>=20
> In the meanwhile, what does it mean in practice, when it is enabled?
>=20
> Just catching up with the topic...

For now, we're just requesting that Sashiko be enabled for the linux-integr=
ity
mailing.  Sashiko's review results will be published on https://sashiko.dev=
/.

Mimi
