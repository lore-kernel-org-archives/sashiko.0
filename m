Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F603CC300
	for <sashiko@lists.linux.dev>; Sun, 17 May 2026 18:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779041854; cv=none; b=lddKgCw8pNcOyPn8NN8Qf/L+hq9MfxbWIFeUWM4m1eaTKpZHQBUa2XFJTR6gGN68AtKdNE5VRLs69tMuCbBVH3vRprKBR7uWl7UtPWzwUinNOW5hfpDWkBQjNOnADe1s2PlvOPc49W9nqNS+q5CCPbpSCQwcwGy+w7yaAnQBoJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779041854; c=relaxed/simple;
	bh=Jc0oI27BJRqxTgiwmeXb1Pw6NYMKJm8lZhAG6r+k05o=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=t5taeH+XWszNNVJnX2+qv44EUIaPJ7ozNHx1pGUhaH+yZudJAi1YwfofDZFUUTnkOPT7/chjwO2y0bCUh2XPJxiG90+wL+PtoeodMRUfAN9sz78+qGRZl+9u9iprL2+VnkyRycL8LyFunk///gZJf/+70t1mpbhgtwAkaDA2bbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qxO9T+OK; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qxO9T+OK"
Content-Type: text/plain; charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779041840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WwyP5R5wq5SGP6g/sgNJXlA2/rET4gV/1lwvi9uooIY=;
	b=qxO9T+OKwZSHYsiMIJMY+9YcZ4PnZ8XfFsSpOTjtlnmw8EP0ADiMS272sGHzbEHiJfMslJ
	+WXdTWchz4NHJNMh0DkL/Ya14D6kpKdc31FHo2cxCNQRROog6GBF29RLkeWsqCmA4MOPrA
	Ung/rGMie4NpRak6b7zyb5LMY3Q7nK4=
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
In-Reply-To: <20260517183959.37441984@foz.lan>
Date: Sun, 17 May 2026 11:17:06 -0700
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, debarbos@redhat.com,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Konstantin Ryabitsev <mricon@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, sashiko-bot@kernel.org,
 sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev,
 Linux Kernel Workflows <workflows@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org, kfree@google.com
Message-Id: <F2FBD939-179D-467B-9FA8-BAA44F6C7524@linux.dev>
References: <20260517183959.37441984@foz.lan>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On May 17, 2026, at 9:40=E2=80=AFAM, Mauro Carvalho Chehab <mchehab+huawei=
@kernel.org> wrote:
>=20
> =EF=BB=BFOn Sun, 17 May 2026 12:12:00 +0200
> Greg KH <gregkh@linuxfoundation.org> wrote:
>=20
>>> On Sun, May 17, 2026 at 12:05:56PM +0200, Mauro Carvalho Chehab wrote:
>>> On Sat, 16 May 2026 14:59:44 -0700
>>> Roman Gushchin <roman.gushchin@linux.dev> wrote:
>>>=20
>>>>> On May 16, 2026, at 2:33=E2=80=AFPM, Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
>>>>>=20
>>>>> I find it opposite: clogging commits with useless information, because=

>>>>> some arbitrary and completely closed-source tool did analysis means
>>>>> nothing to me one year later when I look at the commit in the Git hist=
ory.   =20
>>>>=20
>>>> This is simple not true: Sashiko is fully open-source, under Apache 2.0=
 license
>>>> and the code belongs to LF.  =20
>>>=20
>>>> Yes, the instance behind sashiko.dev is using
>>>> Gemini 3.1 Pro LLM, which is not open-source, but it=E2=80=99s not a fu=
ndamental limitation -
>>>> Sashiko is supporting various LLMs, including open models - it=E2=80=99=
s just a practical
>>>> choice: to my knowledge the quality of open models is not on par with f=
rontier closed
>>>> models  =20
>>>=20
>>> I would very much prefer using an open source LLM, even if not in pair
>>> with latest paid models.
>>>=20
>>>> and it would require a non-trivial amount of hardware and infrastructur=
e to run
>>>> an open model at the required scale. =20
>>>=20
>>> IMHO the best would be to have them running on some infra that would acc=
ept
>>> open source models (*). If there aren't enough resources to have our own=

>>> infra, there are offers out there which allows running open source model=
s
>>> like https://ollama.com/pricing (I never used myself).
>>>=20
>>> (*) For instance, Qwen3.6 is brand new and licensed under apache-2.0.
>>>    Not bad on my tests running it locally. =20
>>=20
>> You can run the tool locally, with whatever model you want, if you want
>> to.
>>=20
>> But for now, let's just take the free credits that Google is willing to
>> throw at this thing and let it give us reviews IF the maintainer of the
>> subsystem feels it is something they want to do.  No one is forcing
>> maintainers to do this.
>=20
> If Google and/or others are willing to give free credits on their cloud,
> they could instead or in addition give free credits to run ollama
> there, allowing us to use different models.
>=20
> =46rom my side, while I won't personally object getting reviews from
> Sashiko/Gemini, this is something I can't reproduce locally. I would
> very much want something where I can select my LLM preferred model
> and run on my ollama docker container on my own GPU, in a way that
> I could run it locally before even sending a patch series.

2 thoughts here:
1) I actually tried to run it with ollama on my personal framework 13. Addin=
g nominal support is trivial,
but the whole thing is not really useful: I can get maybe few hundreds token=
s per second using
a quantified model with reduced quality; an average sashiko review is consum=
ing 3.5 millions tokens
(with Gemini 3.1 pro, it=E2=80=99s also model-dependent).
I=E2=80=99m personally all in on having the entire thing as open as possible=
 and I believe Sashiko is what=20
is realistically the best at this moment - a fully open-source harness and s=
et of prompts which=20
can work with a variety of models.
I=E2=80=99m happy to merge a support for any LLM model which can produce dec=
ent review results.

2) Due to probabilistic nature of LLMs, nothing is reproducible in a strict s=
ense of the word.
Even with exactly the same model/harness/prompts you=E2=80=99ll get differen=
t results every time you run it.
It=E2=80=99s unfortunate, but it is what it is at the moment.

