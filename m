Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212F130568C
	for <sashiko@lists.linux.dev>; Sat, 16 May 2026 19:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778958942; cv=none; b=B2o+J7nWrm/I8KQTobML3+QuQs+KNrXzYpeoUZGAShERrxkB6SImeJz4eJw/ejUWl8iT8pYD1w0IjvWYQUCHHN3KR8zJpv9iFwQPbNLG4bu/bCuhNUoj+YbKTA2VvMxigL8vcJjifTt1nWN3VE+9XLTP7i4bQtdPcG9z6FiLnWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778958942; c=relaxed/simple;
	bh=sWG3JHqA91US5JXXh5l8VZS5q01pBdVjPuti8mnAf1Y=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Aa6Uxi0zcuq9OfBU54Ch18ENCUH+u9k7QiZlAizeRAZW3tkpofjZ4jMsNZtenM5Bd+ZN0adA9j8nxNOd9MBabdfj6hbbl7kRc7SMLuu2p4jhUbUjuSqhWGVEKrtsgW5kFdpUDXHFrBBL3OTdXan3UaHLeoJyDOleUseQCeduiYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bEMxEbXB; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bEMxEbXB"
Content-Type: text/plain; charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778958929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E21WzfW/ySA7ReG7QT8gdPtetis/rOP/c2Skg3RzTgc=;
	b=bEMxEbXBz4rpbm5bKAyijGN6uQ8X1eiXnEKE5Phs1UOHX9LQ03ANhxfi7irZlUgW/4GTq3
	KchTiP0aEArP1cMMVia+6ahKz+bjdBA+3tG2dIZ+aAuouVgcgQJjgE7gk0BkQZtqy9xvht
	PUXw3ZhIPz9IkOy3tcHCKavKW8+1zfE=
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: Stop false review statements
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Roman Gushchin <roman.gushchin@linux.dev>
In-Reply-To: <b5989c0f-90da-42cc-a623-3b60df077848@kernel.org>
Date: Sat, 16 May 2026 12:15:12 -0700
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Konstantin Ryabitsev <mricon@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, sashiko-bot@kernel.org,
 sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev,
 Linux Kernel Workflows <workflows@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org, kfree@google.com
Message-Id: <FA45D2AD-1135-4480-8423-63C0D37FE78D@linux.dev>
References: <b5989c0f-90da-42cc-a623-3b60df077848@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On May 16, 2026, at 12:00=E2=80=AFPM, Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>=20
> =EF=BB=BFOn 16/05/2026 20:56, Roman Gushchin wrote:
>>=20
>>=20
>>>> On May 16, 2026, at 11:29=E2=80=AFAM, Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
>>>=20
>>> =EF=BB=BFOn 16/05/2026 17:49, Roman Gushchin wrote:
>>>>>=20
>>>>>> I=E2=80=99m not attached to any specific form of it, I thought Review=
ed-by is the most obvious form.
>>>>>> And we use Reported-by: tags with various tooling for years.
>>>>>=20
>>>>> Reported-by: shows the existance of a problem that some tool found, a
>>>>> subtle difference here.
>>>>>=20
>>>>>> What do you think is the best form?
>>>>>>=20
>>>>>> I=E2=80=99ll pause sending reviewed-by tags until we have a discussio=
n and agreement here.
>>>>>=20
>>>>> Just say it in some other text form, that our tools will not pick up.
>>>>> Like:
>>>>>  Tool XXXX reports that all is good:
>>>>>      https://....
>>>>>=20
>>>>> or something like that?
>>>>=20
>>>> Sure, works for me.
>>> Roman,
>>> Before implementing such changes, send a RFC or just ask a few folks for=

>>> opinions. We do use the tool, among other tools, so we will gladly
>>> provide a feedback.
>>>=20
>>> Sashiko should in general not send such emails when not asked for. Why?
>>> Because we have also other bots, like LKP, KernelCI, and imagine how
>>> maintainer's mailbox will look like.
>>>=20
>>> LKP allows opt-in for your own repo, which for example I am using, so I
>>> get confirmation of the success. But people are not receiving them. I
>>> cannot imagine all the people getting these LKP-successfully-built
>>> emails on every email.
>>=20
>> It=E2=80=99s opt-in on per-subsystem basis, as well as all other email-re=
lated features.
>> I do rely on corresponding maintainers to decide if they want it or not.
>=20
> The trouble is that subsystem is mailing list, thus I still got all of
> them via b4, which is used to get the discussion.
>=20
> Send them only to the maintainer, for example. Or maintainer + authors.
>=20
> Basically the same as LKP is doing.

There are subsystems which want email reviews to be sent to the subsystem
mailing list. In fact, all currently configured email policies came from mai=
ntainers,
I don=E2=80=99t push anything based on my own preferences.=20

Sashiko can be configured the way you describe it or in any other way, it=E2=
=80=99s up to corresponding=20
maintainers.

I agree, it=E2=80=99s sometimes gets tricky when a patchset is sent to multi=
ple mailing lists,
which policy to apply. I have some improvements in my plans, but it=E2=80=99=
s not always possible
to say how it should be handled. It=E2=80=99s not fundamentally new: landing=
 changes touching=20
multiple subsystems is always harder exactly because maintainers might have d=
ifferent
and sometimes conflicting views.

>=20
>> If you=E2=80=99re saying that it should not send any non-personal emails i=
n general, I disagree here,
>> but happy to have a discussion, assuming it=E2=80=99s polite and construc=
tive.
>=20
> I meant it should not be send to people who did not request that. Opt-in
> should be explicit and no mailing lists must be Cced (because then it is
> sending to everyone).

>>=20
>> The reason why I disagree is simple: there are maintainers/subsystems who=
 like Sashiko=E2=80=99s reviews
>> and  before introducing the email interface they had to manually send lin=
ks to Sashiko=E2=80=99s reviews
>> as replies to proposed patches. I=E2=80=99ve been explicitly asked to add=
 an ability to send out
>> emails with reviews.
>=20
> Sure, I agree with the need for use-case.
>=20
> Best regards,
> Krzysztof
