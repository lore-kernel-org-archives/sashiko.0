Received: from mta0.migadu.com (out-56.mta0.migadu.com [91.218.175.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF1C61FCE
	for <sashiko@lists.linux.dev>; Fri, 14 Aug 2026 13:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786713478; cv=none; b=Ybd49bibGSxc9pvW8vLHZNY68aAjn/NL3fOsl0spyAoYvByW9du/2FvAbiT7uMmTjCdzWpY6jcla5M2hsdUgYamwmBhx8cwBAwQjnYSuaq0QQhxsHP3otHQw+R94CoU6XEKzKx7Hm1LKrdlOxr7PJ/aSUjtOJF9FzLpMw98tjMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786713478; c=relaxed/simple;
	bh=Jzogw+X+1Tk+q8rQhhRM8kMMVezVWenuScefdMO1N5M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AEZNzRJ8IAIxjC7DymsBFErG2LYVipJjmP9k4rP1cCFiuRextVU4SaoM3nWWzV46YlK2q/0j1Do67cf2eEt1t4g6Z27qeO/kfm4t/xz+/j72O/7Zh8uHSiP9L/MVxqmOvhrvhYH/gwcw67yrhMyfxq293GXtk0IhgbVM/Yr3a8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IWQ89l1z; arc=none smtp.client-ip=91.218.175.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IWQ89l1z"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=Jzogw+X+1Tk+q8rQhhRM8kMMVezVWenuScefdMO1N5M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786713472; v=1; x=1787318272;
 b=IWQ89l1zrtqZSBWasSWkzlnligEYEljLr61NLZlc2frZJOAI6K0zK83PLG+2Ly2GJdyRPoL5
 PI1R4yUyhHVDg6ZWXgFQpEuJK4+VmHRHccfHHe/M9n4RjoycON7J9tThVdC7la2/omHGo7jKE+t
 16O4Slm5k/00mfEKzuu1YeqQ=
X-Envelope-To: sashiko@lists.linux.dev
Received: from castle.c.googlers.com (35.227.148.244)
	by mta10.migadu.com with ESMTPS id 3acc85b545148adf;
	Fri, 14 Aug 2026 13:17:52 +0000
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: debarbos@redhat.com,  sashiko@lists.linux.dev
Subject: Re: [PATCH] email: add Christian Borntraeger as cc for s390
In-Reply-To: <752834be-c067-4198-beb1-33327c479d38@linux.ibm.com> (Christian
	Borntraeger's message of "Fri, 14 Aug 2026 13:13:20 +0200")
References: <20260730144458.286663-1-borntraeger@linux.ibm.com>
	<amyX26L0KIXR2WAu@debarbos-thinkpadt14gen5.rmtusma.csb>
	<3420caf9-1a22-4eb8-891a-0732c5cf4c14@linux.ibm.com>
	<752834be-c067-4198-beb1-33327c479d38@linux.ibm.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Fri, 14 Aug 2026 13:17:36 +0000
Message-ID: <7ia4tsowvo27.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Christian Borntraeger <borntraeger@linux.ibm.com> writes:

> Am 11.08.26 um 17:06 schrieb Christian Borntraeger:
>
>>>> diff --git a/sashiko.dev/email_policy.toml b/sashiko.dev/email_policy.=
toml
>>>> index 26a6665..7e32532 100644
>>>> --- a/sashiko.dev/email_policy.toml
>>>> +++ b/sashiko.dev/email_policy.toml
>>>> @@ -236,7 +236,11 @@ cc =3D ["linux-target@vger.kernel.org"]
>>>> =C2=A0 lists =3D ["linux-s390@vger.kernel.org"]
>>>> =C2=A0 reply_to_author =3D true
>>>> =C2=A0 send_positive_review =3D true
>>>> -cc =3D ["linux-s390@vger.kernel.org", "Heiko Carstens
>>>> <hca@linux.ibm.com>", "Vasily Gorbik <gor@linux.ibm.com>",
>>>> "Alexander Gordeev <agordeev@linux.ibm.com>"]
>>>> +cc =3D ["linux-s390@vger.kernel.org",
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Heiko Carstens <hca@linux.ibm.com>",
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Vasily Gorbik <gor@linux.ibm.com>",
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Alexander Gordeev <agordeev@linux.ibm=
.com>",
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Christian Borntraeger <borntraeger@li=
nux.ibm.vom>"]
>> looks like I messed up, ibm.vom instead of ibm.com
>> Can you fix that up?
>
> Ping.
> Do you want a pull request or can you just fix that up?

Fixed by 61eb5cb037b8 ("email_policy: fix typo in s390 cc list for
Christian Borntraeger"). I'll deploy it later today.

Please, let me know if you still don't see emails tomorrow.

Thanks!
