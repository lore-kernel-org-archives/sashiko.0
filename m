Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBDD285CAE
	for <sashiko@lists.linux.dev>; Thu, 30 Jul 2026 11:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785410416; cv=pass; b=UwRd5axuLScEgUFwLFCa/DhmBvo5uRicJ9hvvdFz+8ddwbutsRqfnqj/pUSjC+Bq2fE0NrKpJPDx+5mtr9N+YNcqcak9Drh2rYPi3AXm01FzMZrfxf/WF2oyGflAYLRXU1Iqnijf7hXzoxFqxtORxocitsUF5zLOTqHLjP+P3U8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785410416; c=relaxed/simple;
	bh=bcqzEnKbX7CTGKX2Sa0x8i35p4g5YdaD8oKTD1mQAA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gngz2Sc3fd/+BoNYu9mFME1WRTdAeHxShSoGJp+YlcVE1nR0YRpMD/PY3UcpYUWcz/FJwtOLSaEr4jj9P7vZxjesyV+0lDWO8dbNpItDCQFp8MjA8P2bbI+Y/4UEgePMRQHlv56nNZniyfAITSfcEcXH2IioqoV06pPsJf3SXuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=P6KzN5ha; arc=pass smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="P6KzN5ha"
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UA2bVB1701265
	for <sashiko@lists.linux.dev>; Thu, 30 Jul 2026 04:20:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=nAeRx9daGYU81q8OrjotUR/nWNvyP/1DIu82DusdfWA=; b=P6KzN5haJlSC
	vkKNMjZscUTHuvUiKBWvQeXSvU2XEHS/Da/pu+AyG65QRkpJTfVRY9qyvlNOu7mv
	S2Ha4bsvwdxf4qB4xr9+COjQbRkeNyGKczSXnWtt7hn9MscpePn28hE8+mqrl9jR
	ggzpaBz+VeF70AseQExY0HPAy1MKaSAACEuCsUxnj9n8Men5AQAkSYT+sJ7liT4p
	cowtxL6xYKN8gk9ymdnOzII2u8CeVSnoxVXU4NiUUlxV8nkeIv9uOsp1GTSFuONl
	wqW9yneIvkuUGSz9jVroL4eM3U3LEXHM/ZilloBL35K4fOA6/0Ak9s8987CVNtDx
	qDAlgoOytQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4fqrj2ckq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko@lists.linux.dev>; Thu, 30 Jul 2026 04:20:14 -0700 (PDT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so11055935ad.1
        for <sashiko@lists.linux.dev>; Thu, 30 Jul 2026 04:20:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785410414; cv=none;
        d=google.com; s=arc-20260327;
        b=b/bFwJoeFDmGAFdxjqgmzimjYBrkkCJ7fbx4ubEfhOFNTUhzOUGfZUZFGC4jlNKDWI
         +UBcXOk10hCXDtP82KSjgW+zocjzCTDm96pFBal1PHxMQlFM2/lOF6u8oKVO5quLEPqU
         LcK4t4oHf3knaew411DparmR2nSlRN+OVObLx0o+5QbX+dMinPy/CjFy5wpAOiOFaPsT
         9vnlFEMifgD7pycL9Xv0yfif8VUXaU9VegErT4DJs/NEJEq5E7brECIbp+pv5B5cWgtI
         5HSDhx3kOgmWmElVi/dAGfEm02ZjRGvxA8uezMWdfElX1PZK0GfaiXOpt983O+ZsGLlt
         Z5yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=nAeRx9daGYU81q8OrjotUR/nWNvyP/1DIu82DusdfWA=;
        fh=IknvL3uT7dgRYlt6p0Ct8moXxZ0zZ5//wDGc6oXg10w=;
        b=KhqNeLIqGrf0dxUTEoOsASJmpCRj54uW3WSpqUWclA4D+sQcgkk00M9Ldz7DvVCmUa
         SGjFfGwHoEN1dOymTPzbShrmGArMMaHnkLDWq2LTxjxNtPHDkTrKitDVkp7iRycUSHwt
         15zTUN814GY3xfRlNosNICT1Z5MeiCd6iA2qLNkYvn0UfpCinn7UcxDBaSiSLWRnP7u+
         X162IbTsvMsYdjtOkQRI4oW5/QhrnjzlvzETJKDKTLrAdMd+29os3Yh0ylBNrV8NHs0z
         N9xnW5shIyeeZkl3OExK30B7mT1wrw6tw9U/lXNjwoF0XNb5bIkl2k1nyjgahz7ys10J
         1EXw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785410414; x=1786015214;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nAeRx9daGYU81q8OrjotUR/nWNvyP/1DIu82DusdfWA=;
        b=Vu0MN1b6bPylDf7O2C5BSgN/8GLq+BZFCh02awFIgb3mUSvxoVMQoP6MnruVcvx4sQ
         rB1eFmA6As7doAGeZkC1VGOkRb7WmrQ/zZjsbSHzcCdApOmqQkztFMDm3BDQm6L+C+iH
         aEQvRIoOctRBK7x81rWuJSBKmMYVHf6djKD7d51oWi96KuGzdTvk7/Gk41IlvmChoQxa
         5zLnF7d7y1Anxc+Q8cqs8ryWstwqSsrYChizXjgVehZNvxjd0iMg4BiZ2SvApECrLu5R
         JctH8ifSBFl3jiAa5ub3rtx9VdC8zUZh31UW7I/X5bvdvVb9/HdUVbTKQaLS3wzpQ4Hw
         2iYg==
X-Forwarded-Encrypted: i=1; AHgh+RofZvzrI601fMk5511l62fWd5+TrpUKL9Z4OulHgD66cD1PT+py0zXCY8yz1gCoVW1W9BQ4K1rC@lists.linux.dev
X-Gm-Message-State: AOJu0YxTXSsozzxrPJzlzpvAe+ChQHb4fWBjwcEQ9GSUbG2UugnPzn47
	O6kd/U8EH/Bx4xBjGM0aH7WtifFESo6lkabwt1oa7hz5FIy+lqTq/6HVgzENdB4hfmU7qyV4cFa
	kAaKDG3XHQfQPr+CaWDexXcoReiEBCYLFvLlM6rk7y9JhZv4XRF71cm+HhEn9WyBNRHBfH4kdaG
	wbqTMGJxEYWldgYnWq0EQ0PZOyLsvGAzx1
X-Gm-Gg: AR+sD10M4UA71HpVb/OaW19rwE0TJq0Rl3WLsRfBFHhinnSqKsja++S20fim0mDMbcq
	ZeDNyvSigC+CgtoqbU5oLMXzlByW50pRVTA2AmgzDN5bdWwahLxDqondeNfKYJ0LmjaR5nkB7Ck
	KvBoikioLBzQ9+oN22XbesSqmx18mfeNzhf37mFRJxy4unUFhwXpcCGRmat10=
X-Received: by 2002:a17:902:e5ca:b0:2c6:8d95:fd7e with SMTP id d9443c01a7336-2d036e65f2cmr18633025ad.6.1785410413526;
        Thu, 30 Jul 2026 04:20:13 -0700 (PDT)
X-Received: by 2002:a17:902:e5ca:b0:2c6:8d95:fd7e with SMTP id
 d9443c01a7336-2d036e65f2cmr18632815ad.6.1785410413087; Thu, 30 Jul 2026
 04:20:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJnrk1Y6twWcXfFesbLMNfMavg5RWgQ07pGJ1BM98V4o+FYcBw@mail.gmail.com>
 <amqgKj06QbSWJ9RT@debarbos-thinkpadt14gen5.rmtusma.csb>
In-Reply-To: <amqgKj06QbSWJ9RT@debarbos-thinkpadt14gen5.rmtusma.csb>
From: Chris Mason <clm@meta.com>
Date: Thu, 30 Jul 2026 07:20:01 -0400
X-Gm-Features: AUfX_myzKgM7DHwyCCpw5pxtF_uXef7wLyelGp3oqq2rGYuG8w3kL9SewWhYS8g
Message-ID: <CAMpPgXWExvdfXnbqRVH68Cw9BHYhVYd=Hm3pkdptethbiDy06w@mail.gmail.com>
Subject: Re: Full subsystem codebase scan for identifying pre-existing issues?
To: debarbos@redhat.com
Cc: Joanne Koong <joannelkoong@gmail.com>, sashiko@lists.linux.dev,
        Christoph Hellwig <hch@lst.de>, "Darrick J. Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 4NAfVVzTf9IxdUyCD_LSVO-JL7ZulHFt
X-Authority-Analysis: v=2.4 cv=QuhuG1yd c=1 sm=1 tr=0 ts=6a6b336e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=8elwO82fXORLTBIkMd32:22
 a=20KFwNOVAAAA:8 a=A_slWeXLdlBXsSQP8YYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=zY0JdQc1-4EAyPf5TuXT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA4NCBTYWx0ZWRfX4eRop8MoR78Q
 oyC9pRAh+a6QeiW/zeDwreVDEe3JmFJkG06Y/ipJ1Av81yMhU9pQj3bsV6ibxw37I6Fk+l9AUo1
 fCPCQjhRPy3aRx0SFS64zrUK/gKDnMAAvKd5rx7R/lfZpiX9/Mjs5NFLvVNnIiGLDlbzKG3WKJO
 JcoWP/9UGYBX1LGB5yG3QoPB/YWB9PYW3tnAduoNIPJjziDrRQAtmGVJNQNwFUBW6XM2D45MXtt
 5uYjCri2TuC4ZYJAFgas8kqFtSqjxv5fWfaGAGoHbntOiegzJIYJeTL8xWnWx4SfOKag5tZH4E6
 1obmp/ykNO1tuuj65j2yHSKlx1AkIej7q8ClmJyNDDo46qToSvw2HfmZNXjEtY83Cu3jtoC+weS
 7nLfrR70O8ANlaHeKa7JdgZ7SEQU18DqtIyZWodWke5nfjXpbwlPjUZOmbftEZ3H0pH709yMSfv
 +Faoe2EYrAL0KTbh4xw==
X-Proofpoint-GUID: 4NAfVVzTf9IxdUyCD_LSVO-JL7ZulHFt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA4NCBTYWx0ZWRfX3sJWxvQftoGp
 M4CAstyZ5+WSzNpTj19lTa9EmNtOqDxvWH4+uN+/rtLwiEfIk11ngO1phogNKsNKxAlBieRe+xn
 aqBiuhPjMB3n3mAb5NBrfk4Lw/XZ1GI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01

On Wed, Jul 29, 2026 at 9:43=E2=80=AFPM Derek Barbosa <debarbos@redhat.com>=
 wrote:
>
> Hi,
>
> On Wed, Jul 29, 2026 at 01:34:10PM -0700, Joanne Koong wrote:
> > Hi,
> >
> > Is there a way for Sashiko to run a full scan of a subsystem/tree to
> > identify all the pre-existing issues so that they can be fixed
> > proactively?
>
> At the moment, no. At least nothing that I am aware of :)
>
> There have been some small conversations about such functionality, but no=
thing
> has really taken shape yet. One of the concerns was trying to validate th=
e sheer
> number of potential-false-positives, and how to present such information =
in an
> actionable manner. IIRC syzbot/syzkaller's way of storing such data was u=
sed as
> a comparison point here.
>
> FWIW, Chris Mason has a repository for a tool that runs such scans on cod=
ebases
> -- paired with tools like semcode. His prompts are the same ones that we
> frequently sync back to Sashiko. It won't solve the other point you made,=
 but it
> may be worth looking into. [0][1]

Hi everyone,

Joanne was an early tester of the review prompts last output fall, and
also of the kres scans (thanks Joanne!).  Unfortunately (fortunately?)
I haven't made much progress in June/July because I was out on PTO,
but I'm ramping back up now.  I had promised Roman I'd try and
integrate with his databases, and I'm picking all of that up again
now.

As Derek mentioned, it won't really solve the question of how sashiko
should present existing issues, but hopefully we can knock off some of
the rough edges.

-chris
