Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6BE336EC5
	for <sashiko@lists.linux.dev>; Sat, 16 May 2026 15:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778946609; cv=none; b=DUo7LJmIl6qQbW6g9sf+TE6YH9TMlVG4xVmqt4fuAQ61RXhKoWo1U7G9peLs1Tv97xYYYZebBn8LHKnRfJcKnmjgIrp647GBCrgqmAxz/VIfmWasQXQv2EyPpLLVrtH4QVyHo6eOW9SDx62pYwA7W1oAh+akdMTLsvCrdeZyLv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778946609; c=relaxed/simple;
	bh=FeuUX8oMZRiDE1D/l77ftV+FFZbaTVPV4PkPXVXrARU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=VRVqTs2geS/qJx9fpHtC6bGsrHtF1YPpLA3fUP+1jKO4CZliukOTwrbo2q/ICb7ZBVFOL9ri68ePCfCRjBCpmDzUL1CwUpR+KdD+mVoKZIAiunHbk0/MHYfdb6CNpotV0GneB+WLLsLVR/IpZklhKoS0jf0tK/0eWKNagDM94Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZgNn/JIj; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZgNn/JIj"
Content-Type: text/plain; charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778946595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GZ3+QXNs1Ruk6C/JUmWvrB0kpJwdp6UGI2mwrNsZMhs=;
	b=ZgNn/JIj5mBrXnmCCm4JECClo95jWnAfgvxaeUogSLftOTtVOzEu4LwImaPcNL4LtHqDNj
	iHjoJngmIBDXMTVlkTV1dUk2ZIgbdt35RP8vhnAxzoi9SmadjToGVPn56XnocUuz+cH0kb
	uKtkVu326TWUBz5b4aaQr0MG7ebI3YU=
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
In-Reply-To: <2026051631-trolling-juggling-da1c@gregkh>
Date: Sat, 16 May 2026 08:49:39 -0700
Cc: Konstantin Ryabitsev <mricon@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski <krzk@kernel.org>,
 sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
 sashiko@lists.linux.dev,
 Linux Kernel Workflows <workflows@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org, kfree@google.com
Message-Id: <0902F8E6-C495-40A1-975D-92D3B72D44AE@linux.dev>
References: <2026051631-trolling-juggling-da1c@gregkh>
To: Greg KH <gregkh@linuxfoundation.org>
X-Migadu-Flow: FLOW_OUT


> On May 16, 2026, at 8:45=E2=80=AFAM, Greg KH <gregkh@linuxfoundation.org> w=
rote:
>=20
> =EF=BB=BFOn Sat, May 16, 2026 at 08:41:43AM -0700, Roman Gushchin wrote:
>>=20
>>>> On May 16, 2026, at 8:20=E2=80=AFAM, Konstantin Ryabitsev <mricon@kerne=
l.org> wrote:
>>>=20
>>> =EF=BB=BFOn Sat, May 16, 2026 at 05:11:28AM -0700, Guenter Roeck wrote:
>>>>> On Sat, May 16, 2026 at 10:05:02AM +0200, Krzysztof Kozlowski wrote:
>>>>> What the hell is that:
>>>>>=20
>>>>> https://lore.kernel.org/all/20260515190707.033BDC2BCB0@smtp.kernel.org=
/
>>>>>=20
>>>>> As a bot you CANNOT MAKE a Reviewer's statement of oversight. You are
>>>>> not a damn human do be able to make such statement. You are a bot, a t=
ool.
>>>>>=20
>>>>=20
>>>> Where exactly do the rules say that ? I seem to miss that.
>>>>=20
>>>> There is a policy document about _contributions_ made by AI, but I don'=
t
>>>> see the one that says that AI agents must not provide Reviewed-by: tags=
.
>>>=20
>>> =46rom my perspective, AI agents must NOT use the Reviewed-by tag for th=
e
>>> following reasons:
>>>=20
>>> - We consider this a "person-trailer" and it implies agency
>>> - Adding yourself to a commit via a trailer is a *binding responsibility=
* for
>>> the change. A lot of tooling will cc the Reviewed-by addresses on follow=
-up
>>> messages regarding code in this commit. If the address is bogus or doesn=
't
>>> go to a developer, this is both wasteful and potentially frustrating.
>>=20
>> Hi Konstantin!
>>=20
>> The goal here is to inform maintainers that sashiko has successfully revi=
ewed the patch
>> and there were no findings, otherwise maintainers have to go to the web s=
ite and check the status.
>=20
> That's fine.
>=20
>> I=E2=80=99m not attached to any specific form of it, I thought Reviewed-b=
y is the most obvious form.
>> And we use Reported-by: tags with various tooling for years.
>=20
> Reported-by: shows the existance of a problem that some tool found, a
> subtle difference here.
>=20
>> What do you think is the best form?
>>=20
>> I=E2=80=99ll pause sending reviewed-by tags until we have a discussion an=
d agreement here.
>=20
> Just say it in some other text form, that our tools will not pick up.
> Like:
>    Tool XXXX reports that all is good:
>        https://....
>=20
> or something like that?

Sure, works for me.

Thanks,
Roman=
