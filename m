Received: from mta1.migadu.com (out-231.mta1.migadu.com [95.215.58.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E941FC0
	for <sashiko@lists.linux.dev>; Mon, 12 Oct 2026 21:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791842357; cv=none; b=MYvZMgP9/5AFLfFBHyrZwidLNXapZr83X7oE8F42HNtdTgO+//jV+3aPrNhSSiEwzSTY7PzLF3uf+Yf3Agg3sgY7aaGxgaIozjIo5P0aVb9Tvtz8DWnQybQpYpOlBJQF7oTtP1Z/Mq3t/KceETxZVyRYVyMRetMPTBKqXYHk1nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791842357; c=relaxed/simple;
	bh=cYcom8VhHPi3TeIvJD70CK3ALPUhrJGmYKzeaPU9dJo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=EeOt3eesgGK5zjv0EEsog9ANLKzGSdouNNhWD126l/HyxrynzbOOetJZ96pvATaqXpkpaKw5xhqavDeo6jK9t9B/LrpfotxAOck1J5BCGvoWkx+KpC5f1ON4TjVCMingXUxp+tvm3gkbRprainqty3dPsFBxOAZs1lt+a3jTDqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=N2WI6zhg; arc=none smtp.client-ip=95.215.58.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="N2WI6zhg"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=cYcom8VhHPi3TeIvJD70CK3ALPUhrJGmYKzeaPU9dJo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791842352; v=1; x=1792447152;
 b=N2WI6zhgbjD6RaeAhpRSpu5glj25PpFbjYDKfHjMr/vkVn8VGYfbMxDu1zEKgda1cjFON0a/
 Rr2J8a3CC75OPlXMrm2nNBwoZTcj9u41bXtI0dfC4QJhWdc6AuPw2zANM3Da6kbWTU+0A2CFIyG
 1VuFylYUzzjr/qtPijdu7Qlo=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta11.migadu.com with ESMTPS id af6d8218876e1941;
	Mon, 12 Oct 2026 21:59:12 +0000
X-Mizu-Trace-ID: af6d8218876e1941
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: email handling
From: Roman Gushchin <roman.gushchin@linux.dev>
In-Reply-To: <20261012212533.374891-1-sj@kernel.org>
Date: Mon, 12 Oct 2026 14:58:56 -0700
Cc: Andrew Morton <akpm@linux-foundation.org>, sashiko@lists.linux.dev,
 SJ Park <sj@kernel.org>
Message-Id: <6355837F-7F0E-4C49-B1D4-223296508C18@linux.dev>
References: <20261012212533.374891-1-sj@kernel.org>
To: SJ Park <sj@kernel.org>
X-Mailer: iPad Mail (23G90)



> On Oct 12, 2026, at 2:25=E2=80=AFPM, SJ Park <sj@kernel.org> wrote:
>=20
> =EF=BB=BFHi Andrew,
>=20
>> On Sat, 10 Oct 2026 15:06:29 -0700 Andrew Morton <akpm@linux-foundation.o=
rg> wrote:
>>=20
>>=20
>> Concerning this email:
>>    https://lore.kernel.org/20261009-b4-mmap-prepare-vma-flag-sanify-v5-16=
-923b70125b1e@kernel.org
>>=20
>> I discovered that some lucky duckies were receiving Sashiko emails:
>=20
> Apparently that's because the patch is Cc-ing a few mailing lists that are=

> configured [1] to receive the review mails.  For example, the patch is Cc-=
ing
> s390@ mailing list, and it is configured [2] to send the review email to t=
he
> author of the patch, the mailing list, and a few more people including Hei=
ko.
> To quote the config [2],
>=20
>    ["linux-s390@vger.kernel.org"]
>    reply_to =3D ["author", "list"]
>    positive_review =3D "all"
>    cc =3D ["Heiko Carstens <hca@linux.ibm.com>", "Vasily Gorbik <gor@linux=
.ibm.com>", "Alexander Gordeev <agordeev@linux.ibm.com>", "Christian Borntra=
eger <borntraeger@linux.ibm.com>"]
>=20
>>=20
>> Subject: Re: [PATCH v5 16/38] mm/vma: add and use
>> vma_[flags]_is_fixed_mapping
>> Reply-To: sashiko-reviews@lists.linux.dev
>> To: =3D?utf-8?b?TG9yZW56byBTdG9ha2VzIChBUk0p?=3D <ljs@kernel.org>
>> Cc: linux-trace-kernel@vger.kernel.org, kvmarm@lists.linux.dev, "Vasily
>> Gorbik" <gor@linux.ibm.com>, "Oliver Upton" <oupton@kernel.org>, "Heiko
>> Carstens" <hca@linux.ibm.com>, linux-perf-users@vger.kernel.org, "Marc
>> Zyngier" <maz@kernel.org>, "Alexander Gordeev" <agordeev@linux.ibm.com>, l=
inux-scsi@vger.kernel.org, selinux@vger.kernel.org, "Christian
>> Borntraeger" <borntraeger@linux.ibm.com>, bpf@vger.kernel.org, dri-devel@=
lists.freedesktop.org, linux-rdma@vger.kernel.org, kvm@vger.kernel.org, linu=
x-s390@vger.kernel.org, linux-usb@vger.kernel.org
>> In-Reply-To: <20261009-b4-mmap-prepare-vma-flag-sanify-v5-16-923b70125b1e=
@kernel.org>
>> References: <20261009-b4-mmap-prepare-vma-flag-sanify-v5-0-923b70125b1e@k=
ernel.org>
>> <20261009-b4-mmap-prepare-vma-flag-sanify-v5-16-923b70125b1e@kernel.org>
>>=20
>>=20
>>=20
>> But I did not.  How come?  I was on the To: line so why were certain
>> people emailed but not me?
>=20
> I think that's because you are not on the configuration.
>=20
>>=20
>> I'd prefer to receive such replies.
>=20
> Maybe you could add below change to get replies for mm patches?
>=20
>    diff --git a/projects/linux/mailing_lists.toml b/projects/linux/mailing=
_lists.toml
>    index e41f1aa..330d1d8 100644
>    --- a/projects/linux/mailing_lists.toml
>    +++ b/projects/linux/mailing_lists.toml
>    @@ -313,3 +313,6 @@ reply_to =3D ["author", "list", "recipients"]
>=20
>     ["fsverity@lists.linux.dev"]
>     reply_to =3D ["author", "list", "recipients"]
>    +
>    +["linux-mm@kvack.org"]
>    +cc =3D ["akpm@linux-foundation.org"]
>=20
> My understanding of Sashiko is quite limited, though.  Please correct me i=
f I'm
> wrong, Sashiko team.

Thanks, SJ.

I answered Andrew privately, but you=E2=80=99re right, the second option you=
 suggested will subscribe Andrew to all mm reviews.
Sorry, I did not understand, what limitation are you talking about here?
The only limitation here is the variety of preferences by various maintainer=
s: some push for reply_all lkml-wide,
some hate sashiko=E2=80=99s emails in general.

Thanks=
