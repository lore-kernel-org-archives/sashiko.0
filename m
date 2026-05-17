Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099153CF686;
	Sun, 17 May 2026 18:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779044173; cv=none; b=iaQ4G3S47xrEOUWJ4tZpFgYeEp5XaG+pujghaO0AR6kb5NXdCwg3Qr/I7B0+zlXHaf5lfmNXuIr2Cg+ysFWWxliNOe3RW2vZQdTkItdjoAknQgoPd8OPwtmyl9+nYzOuo62/3rMj8qDgqswFjD3sVX40h316kfd4QPIwDDnsSLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779044173; c=relaxed/simple;
	bh=FWoKyNMCrmjV1FFuRToBYVAQrWOiVtX+OqAxzsJ7vgU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dhvA02lAQuDvDgQaHxMjXRlsPr+ODqfVCunvv6TeocJsR+IovFRy/znixOfy+t9+80kahuQuRRzyTM79hfBU04YGApeV0Mi2+AowTVdj+YDbhfl1RYMaMNtFi0j2tqB301TmXPi5JXiArrJ49yNFsLB0XvveygxPqqJTNg2OtTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m4pXsoer; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m4pXsoer"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB446C2BCB0;
	Sun, 17 May 2026 18:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779044172;
	bh=FWoKyNMCrmjV1FFuRToBYVAQrWOiVtX+OqAxzsJ7vgU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=m4pXsoerDt7rwcZxxS+cWs8zyJhQl85NIX6XLsr5MTGO+oxFMdupDZHUpL3why6fa
	 SbzRz77w3YuTNlqxp5lXJX4JL3KGZLBHdpllpKhZP9RYcKDWHYr9NYu1NYu2MkOnyL
	 +lAmadBEruGPGMOOxlaUyrvVdxPA6tEM3NTknJlYGoyfH1URKg261G8Fv/hKd9hcFg
	 Rw8hSDbp/KjdUNqMVZoQx86e95WbVt4ONw/PGNRfNSvDa1sCla8CAZb/4WuLbUw89j
	 8rR4NCVhknP0KiZ/MfK3g32i2C7oOBnfBUTpWLOayGXFA6Fcc+KcJKAdTw/3FcDAdD
	 PFOuYk1XA9yjw==
Date: Sun, 17 May 2026 20:56:06 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Greg KH <gregkh@linuxfoundation.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, debarbos@redhat.com, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Konstantin Ryabitsev <mricon@kernel.org>, Guenter Roeck
 <linux@roeck-us.net>, sashiko-bot@kernel.org,
 sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev, Linux Kernel
 Workflows <workflows@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
 kfree@google.com
Subject: Re: Stop false review statements
Message-ID: <20260517205606.3b035316@foz.lan>
In-Reply-To: <F2FBD939-179D-467B-9FA8-BAA44F6C7524@linux.dev>
References: <20260517183959.37441984@foz.lan>
	<F2FBD939-179D-467B-9FA8-BAA44F6C7524@linux.dev>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 17 May 2026 11:17:06 -0700
Roman Gushchin <roman.gushchin@linux.dev> wrote:

> > On May 17, 2026, at 9:40=E2=80=AFAM, Mauro Carvalho Chehab <mchehab+hua=
wei@kernel.org> wrote:
> >=20
> > =EF=BB=BFOn Sun, 17 May 2026 12:12:00 +0200
> > Greg KH <gregkh@linuxfoundation.org> wrote:
> >  =20
> >>> On Sun, May 17, 2026 at 12:05:56PM +0200, Mauro Carvalho Chehab wrote:
> >>> On Sat, 16 May 2026 14:59:44 -0700
> >>> Roman Gushchin <roman.gushchin@linux.dev> wrote:
> >>>  =20
> >>>>> On May 16, 2026, at 2:33=E2=80=AFPM, Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>>>>=20
> >>>>> I find it opposite: clogging commits with useless information, beca=
use
> >>>>> some arbitrary and completely closed-source tool did analysis means
> >>>>> nothing to me one year later when I look at the commit in the Git h=
istory.     =20
> >>>>=20
> >>>> This is simple not true: Sashiko is fully open-source, under Apache =
2.0 license
> >>>> and the code belongs to LF.    =20
> >>>  =20
> >>>> Yes, the instance behind sashiko.dev is using
> >>>> Gemini 3.1 Pro LLM, which is not open-source, but it=E2=80=99s not a=
 fundamental limitation -
> >>>> Sashiko is supporting various LLMs, including open models - it=E2=80=
=99s just a practical
> >>>> choice: to my knowledge the quality of open models is not on par wit=
h frontier closed
> >>>> models    =20
> >>>=20
> >>> I would very much prefer using an open source LLM, even if not in pair
> >>> with latest paid models.
> >>>  =20
> >>>> and it would require a non-trivial amount of hardware and infrastruc=
ture to run
> >>>> an open model at the required scale.   =20
> >>>=20
> >>> IMHO the best would be to have them running on some infra that would =
accept
> >>> open source models (*). If there aren't enough resources to have our =
own
> >>> infra, there are offers out there which allows running open source mo=
dels
> >>> like https://ollama.com/pricing (I never used myself).
> >>>=20
> >>> (*) For instance, Qwen3.6 is brand new and licensed under apache-2.0.
> >>>    Not bad on my tests running it locally.   =20
> >>=20
> >> You can run the tool locally, with whatever model you want, if you want
> >> to.
> >>=20
> >> But for now, let's just take the free credits that Google is willing to
> >> throw at this thing and let it give us reviews IF the maintainer of the
> >> subsystem feels it is something they want to do.  No one is forcing
> >> maintainers to do this. =20
> >=20
> > If Google and/or others are willing to give free credits on their cloud,
> > they could instead or in addition give free credits to run ollama
> > there, allowing us to use different models.
> >=20
> > From my side, while I won't personally object getting reviews from
> > Sashiko/Gemini, this is something I can't reproduce locally. I would
> > very much want something where I can select my LLM preferred model
> > and run on my ollama docker container on my own GPU, in a way that
> > I could run it locally before even sending a patch series. =20
>=20
> 2 thoughts here:
> 1) I actually tried to run it with ollama on my personal framework 13. Ad=
ding nominal support is trivial,
> but the whole thing is not really useful: I can get maybe few hundreds to=
kens per second using
> a quantified model with reduced quality; an average sashiko review is con=
suming 3.5 millions tokens=20
> (with Gemini 3.1 pro, it=E2=80=99s also model-dependent).

Do you mean 3.5 millions tokens per patch series? If so, that
sounds a lot! Why does it require too many tokens?

> I=E2=80=99m personally all in on having the entire thing as open as possi=
ble and I believe Sashiko is what=20
> is realistically the best at this moment - a fully open-source harness an=
d set of prompts which=20
> can work with a variety of models.
> I=E2=80=99m happy to merge a support for any LLM model which can produce =
decent review results.
>=20
> 2) Due to probabilistic nature of LLMs, nothing is reproducible in a stri=
ct sense of the word.
> Even with exactly the same model/harness/prompts you=E2=80=99ll get diffe=
rent results every time you run it.
> It=E2=80=99s unfortunate, but it is what it is at the moment.

By "reproduce locally", I didn't mean in strict sense. Sure, LLM answers
won't be identical, but I suspect that at least most of the major issues=20
on a patch series would be reported by any decent model.

So, if we have something that one can locally run using its GPU, being
able to get an answer in the range of a couple of minutes per patch
should be enough to catch most of the issues.

Thanks,
Mauro
