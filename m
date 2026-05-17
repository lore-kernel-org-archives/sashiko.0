Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290442F547F
	for <sashiko@lists.linux.dev>; Sun, 17 May 2026 19:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779047627; cv=none; b=YPROZgLAZl+zLKGN/TqJNDZ9jWmTiZf/z7vV+HvR72OcFuezrkSROXPrQSAY2w+FnYcO4MCAsvaTgvMB5E6YgZ+9ZaIUVuVyyP6AfZcFkkIRoYF7GtWVqsaed+xzhjMqYpOjLtPuvhcNcyjC3OAaFlKsbk/LrOJs90r597dHpBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779047627; c=relaxed/simple;
	bh=rziN1hh0A5wT+pZjQfWI+vaKYthAU6o0Wnfyfi7LghU=;
	h=Content-Type:From:Mime-Version:Subject:Message-Id:Date:Cc:To; b=PsyKbEk1kjgQh731/OOkf5D4Cr/Z6ILh4blQcck319qxa/Toay79j8qYCIQLLdX1yHE+wQTNgqL4ag95m9kzo4fxY/zXoQ2FROIq0F28pedOyzEGIYsh0Rj+C0fJ3jKJON+Fn4ssWDY5Kj8j7OvBYiVBjqsTWM8fRTt5eiO9X0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=K6b+mF8g; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="K6b+mF8g"
Content-Type: text/plain; charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779047614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rrXf+swBl4yp9CtNuCEzzNucE6Q+vtW2TZ7N7Ibq2Gk=;
	b=K6b+mF8gJmKtADw1GEqNvYlcofJiUFGBMiRX6rw836icAeNlS551hvn+MjBEI6bbqj0efr
	iLA9NeKDJYFHvXe9konzB3cnVIY3LLCX+Lm1UJTQrklmdIGQGQhvBiBdte0esAWxVlUj4T
	9jfylDEjzThfEv7/696dY2je91bJDk4=
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Roman Gushchin <roman.gushchin@linux.dev>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: Stop false review statements
Message-Id: <2CB46AD9-BD19-4FAC-B992-C1CDBB9C36C0@linux.dev>
Date: Sun, 17 May 2026 12:53:19 -0700
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, debarbos@redhat.com,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Konstantin Ryabitsev <mricon@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, sashiko-bot@kernel.org,
 sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev,
 Linux Kernel Workflows <workflows@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org, kfree@google.com
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Migadu-Flow: FLOW_OUT


> On May 17, 2026, at 11:56=E2=80=AFAM, Mauro Carvalho Chehab <mchehab+huawe=
i@kernel.org> wrote:
> =EF=BB=BFOn Sun, 17 May 2026 11:17:06 -0700
> Roman Gushchin <roman.gushchin@linux.dev> wrote:
>=20
>>> On May 17, 2026, at 9:40=E2=80=AFAM, Mauro Carvalho Chehab <mchehab+huaw=
ei@kernel.org> wrote:
>>> =EF=BB=BFOn Sun, 17 May 2026 12:12:00 +0200
>>> Greg KH <gregkh@linuxfoundation.org> wrote:
>>>>> On Sun, May 17, 2026 at 12:05:56PM +0200, Mauro Carvalho Chehab wrote:=

>>>>> On Sat, 16 May 2026 14:59:44 -0700
>>>>> Roman Gushchin <roman.gushchin@linux.dev> wrote:
>>>>>>> On May 16, 2026, at 2:33=E2=80=AFPM, Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
>>>>>>> I find it opposite: clogging commits with useless information, becau=
se
>>>>>>> some arbitrary and completely closed-source tool did analysis means
>>>>>>> nothing to me one year later when I look at the commit in the Git hi=
story.     =20
>>>>>> This is simple not true: Sashiko is fully open-source, under Apache 2=
.0 license
>>>>>> and the code belongs to LF.    =20
>>>>>> Yes, the instance behind sashiko.dev is using
>>>>>> Gemini 3.1 Pro LLM, which is not open-source, but it=E2=80=99s not a f=
undamental limitation -
>>>>>> Sashiko is supporting various LLMs, including open models - it=E2=80=99=
s just a practical
>>>>>> choice: to my knowledge the quality of open models is not on par with=
 frontier closed
>>>>>> models    =20
>>>>> I would very much prefer using an open source LLM, even if not in pair=

>>>>> with latest paid models.
>>>>>> and it would require a non-trivial amount of hardware and infrastruct=
ure to run
>>>>>> an open model at the required scale.   =20
>>>>> IMHO the best would be to have them running on some infra that would a=
ccept
>>>>> open source models (*). If there aren't enough resources to have our o=
wn
>>>>> infra, there are offers out there which allows running open source mod=
els
>>>>> like https://ollama.com/pricing (I never used myself).
>>>>> (*) For instance, Qwen3.6 is brand new and licensed under apache-2.0.
>>>>>   Not bad on my tests running it locally.   =20
>>>> You can run the tool locally, with whatever model you want, if you want=

>>>> to.
>>>> But for now, let's just take the free credits that Google is willing to=

>>>> throw at this thing and let it give us reviews IF the maintainer of the=

>>>> subsystem feels it is something they want to do.  No one is forcing
>>>> maintainers to do this. =20
>>> If Google and/or others are willing to give free credits on their cloud,=

>>> they could instead or in addition give free credits to run ollama
>>> there, allowing us to use different models.
>>> =46rom my side, while I won't personally object getting reviews from
>>> Sashiko/Gemini, this is something I can't reproduce locally. I would
>>> very much want something where I can select my LLM preferred model
>>> and run on my ollama docker container on my own GPU, in a way that
>>> I could run it locally before even sending a patch series. =20
>>=20
>> 2 thoughts here:
>> 1) I actually tried to run it with ollama on my personal framework 13. Ad=
ding nominal support is trivial,
>> but the whole thing is not really useful: I can get maybe few hundreds to=
kens per second using
>> a quantified model with reduced quality; an average sashiko review is con=
suming 3.5 millions tokens
>> (with Gemini 3.1 pro, it=E2=80=99s also model-dependent).
>=20
> Do you mean 3.5 millions tokens per patch series? If so, that
> sounds a lot! Why does it require too many tokens?

It=E2=80=99s an average per patch, not a series. Some are much cheaper, some=
 are much more expensive.
Sashiko posts token cost nearby each review.

Why it uses many tokens? Because in many cases it has to dig deep into the c=
ode.
Long sessions with multiple tool calls are expensive. Also Sashiko has a mul=
ti-stage
architecture, effectively it reviews every patch multiple times from differe=
nt angles.
It has a measurable influence on the quality of reviews. The current generat=
ion of LLMs
is not good at spotting various types of issues at once: once it sees a memo=
ry leak
it can=E2=80=99t think anymore on e.g. locking issues. Also just by running t=
he same thing multiple times
and combining the result you can meaningfully improve the quality.

>> I=E2=80=99m personally all in on having the entire thing as open as possi=
ble and I believe Sashiko is what
>> is realistically the best at this moment - a fully open-source harness an=
d set of prompts which
>> can work with a variety of models.
>> I=E2=80=99m happy to merge a support for any LLM model which can produce d=
ecent review results.
>>=20
>> 2) Due to probabilistic nature of LLMs, nothing is reproducible in a stri=
ct sense of the word.
>> Even with exactly the same model/harness/prompts you=E2=80=99ll get diffe=
rent results every time you run it.
>> It=E2=80=99s unfortunate, but it is what it is at the moment.
>=20
> By "reproduce locally", I didn't mean in strict sense. Sure, LLM answers
> won't be identical, but I suspect that at least most of the major issues
> on a patch series would be reported by any decent model.

I believe we=E2=80=99re not quite there yet. Models do differ in their abili=
ties to spot
various types of bugs and also producing false positives. Some types of issu=
es
(e.g. complex locking issues) are really hard for best of the current models=
.

> So, if we have something that one can locally run using its GPU, being
> able to get an answer in the range of a couple of minutes per patch
> should be enough to catch most of the issues.

I=E2=80=99m happy to be wrong here, but my understanding is that it=E2=80=99=
s not realistic now.
Sashiko reviews taking longer with production grade hardware.=
