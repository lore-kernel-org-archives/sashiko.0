Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E50C313E38
	for <sashiko@lists.linux.dev>; Sat, 16 May 2026 18:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778957837; cv=none; b=mQ0bPeFS6GQ0J4ukXxtuQa6sOIEp5rfEX8VWfiCCQgJlFPHScBsmoWKRWnY1JF+hSieVVI7pP90Z8BRI11+3339gCJAwpV7rlHzMM3EZx7GYF2+zU29gphbw6kvxXg59lP425bXgy0jGXvJKh8oJq2R/AqhYeYMWG0DA6cmLVek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778957837; c=relaxed/simple;
	bh=of8TX82GAchL6eHU8AfWJKqFRWVZ0hb2HwjwXfE+9xY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ObgxSMhhTp6gcSV1OJ3TRFqL1a4I8gjJVZ9qy5dE4jGFRPAaAQSDps+7U4uA/cJZQ10zLllo3Io7NMjiYbo1JEmcs5ctMUKeqildSE6u+xH4t3CZxh81w7sIhRiga/1u0bDwoBVYqwvMdKvfCXiLiL9p/NAwpeOqGFrMugI5OH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pDetYoJZ; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pDetYoJZ"
Content-Type: text/plain; charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778957824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FwKxoY0mz0ptZPDYXqLwrww/3nX4SlEEJE/N2RkvrQU=;
	b=pDetYoJZruA5D8Ps7MplFOVD3y+x45SRS/xDU+bU85E8rfWxHPGtr9wGRgjNhjAyNsYQ1o
	MYDvE+qWm5bKmANE/xIESyOHL5gMpG1XqqAcB1iTd19DAjsCuie8/AI/mNZl9+C4yeLkHy
	b4fkLbborb+M/KVwLZ+tlWZCg6k1Oj4=
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
In-Reply-To: <efc4d394-b328-4ccf-8c05-b6470ee4b88d@kernel.org>
Date: Sat, 16 May 2026 11:56:46 -0700
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Konstantin Ryabitsev <mricon@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, sashiko-bot@kernel.org,
 sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev,
 Linux Kernel Workflows <workflows@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org, kfree@google.com
Message-Id: <70C5331E-06F1-48D5-A6BA-0CD130B69A45@linux.dev>
References: <efc4d394-b328-4ccf-8c05-b6470ee4b88d@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On May 16, 2026, at 11:29=E2=80=AFAM, Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>=20
> =EF=BB=BFOn 16/05/2026 17:49, Roman Gushchin wrote:
>>>=20
>>>> I=E2=80=99m not attached to any specific form of it, I thought Reviewed=
-by is the most obvious form.
>>>> And we use Reported-by: tags with various tooling for years.
>>>=20
>>> Reported-by: shows the existance of a problem that some tool found, a
>>> subtle difference here.
>>>=20
>>>> What do you think is the best form?
>>>>=20
>>>> I=E2=80=99ll pause sending reviewed-by tags until we have a discussion a=
nd agreement here.
>>>=20
>>> Just say it in some other text form, that our tools will not pick up.
>>> Like:
>>>   Tool XXXX reports that all is good:
>>>       https://....
>>>=20
>>> or something like that?
>>=20
>> Sure, works for me.
> Roman,
> Before implementing such changes, send a RFC or just ask a few folks for
> opinions. We do use the tool, among other tools, so we will gladly
> provide a feedback.
>=20
> Sashiko should in general not send such emails when not asked for. Why?
> Because we have also other bots, like LKP, KernelCI, and imagine how
> maintainer's mailbox will look like.
>=20
> LKP allows opt-in for your own repo, which for example I am using, so I
> get confirmation of the success. But people are not receiving them. I
> cannot imagine all the people getting these LKP-successfully-built
> emails on every email.

It=E2=80=99s opt-in on per-subsystem basis, as well as all other email-relat=
ed features.
I do rely on corresponding maintainers to decide if they want it or not.
Even in the case which you was so unhappy about, I asked Guenter prior=20
to enabling it for hwmon.

If you=E2=80=99re saying that it should not send any non-personal emails in g=
eneral, I disagree here,
but happy to have a discussion, assuming it=E2=80=99s polite and constructiv=
e.

The reason why I disagree is simple: there are maintainers/subsystems who li=
ke Sashiko=E2=80=99s reviews=20
and  before introducing the email interface they had to manually send links t=
o Sashiko=E2=80=99s reviews
as replies to proposed patches. I=E2=80=99ve been explicitly asked to add an=
 ability to send out
emails with reviews.

Thanks


