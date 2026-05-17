Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6F0223708;
	Sun, 17 May 2026 16:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779036006; cv=none; b=R9PSf9wSs8jsbcpQd4POmVAN7/P4x91uEQ4fjyapPk+sois7tUxgUiAVK5nfHegrxlgCqvlbsUTLrq3yTRjw9ZOTGzDlLtCLTLfKA+AW89OvFTqTne1oENnJvE6sSIimYe84TYGQVjEPdVLACvda0P7M1F693LmhnJJdq/0WBIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779036006; c=relaxed/simple;
	bh=u8TPZDJlwQ/Azd8YDqYjH0B+QcojCtUpyxuZcWPXSRw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UET8JR4+1wwBwSQqb7WdbOKLQTi5xPTayHMu9Im41JaomQAo084H5SbFGgAV52ZC3DKIytckiT/1TI8m1sqsGDeprLNd3Ido4C0mnuUxjkC6MmkYo8DweLmRvDQvKA3crTZt3v8EKtIM+xLR3bQGK5bxh5ek5JKzH/eX3ZZOTuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FV7Dn8rt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FV7Dn8rt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8614C2BCB0;
	Sun, 17 May 2026 16:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779036005;
	bh=u8TPZDJlwQ/Azd8YDqYjH0B+QcojCtUpyxuZcWPXSRw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FV7Dn8rtWUn4nJyOA/8f4MV8YwdnaewwEf+NqZXrdeoMBRhp7NOZT/aQiXa6r94ub
	 hyhvdUxL2Ac9edB2BiDImUFnbJnt19hCZIVc7NkUan19oY/79dxZDX2CPadRenIXft
	 gWOkM04BTIdzKlNk/WCkt5M5Hscnop/8qo95DPBwR+sk4h41crA5lhUEXJaCknAxat
	 sMlEJ1hzixEuOc1Wqg+xloPCoAEQ8dYlqQ0F6BFpkjzcR3bu8t+dMrsdUdQAIhBwKS
	 oSR8VOMN0nY828tf9tU8gWdgHEIzQZZtonSWpFeFt/CzsHaSgpEN4px0HICmxJxO3y
	 h41y92MjLMhOw==
Date: Sun, 17 May 2026 18:39:59 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Krzysztof Kozlowski
 <krzk@kernel.org>, debarbos@redhat.com, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Konstantin Ryabitsev <mricon@kernel.org>, Guenter Roeck
 <linux@roeck-us.net>, sashiko-bot@kernel.org,
 sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev, Linux Kernel
 Workflows <workflows@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
 kfree@google.com
Subject: Re: Stop false review statements
Message-ID: <20260517183959.37441984@foz.lan>
In-Reply-To: <2026051758-superbowl-baritone-2705@gregkh>
References: <4f3d7f48-5766-425b-91f6-0acdb5554584@kernel.org>
	<07602616-412B-4ED8-95D7-588C0D077EE3@linux.dev>
	<20260517120556.248852d8@foz.lan>
	<2026051758-superbowl-baritone-2705@gregkh>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 17 May 2026 12:12:00 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Sun, May 17, 2026 at 12:05:56PM +0200, Mauro Carvalho Chehab wrote:
> > On Sat, 16 May 2026 14:59:44 -0700
> > Roman Gushchin <roman.gushchin@linux.dev> wrote:
> >  =20
> > > > On May 16, 2026, at 2:33=E2=80=AFPM, Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> > > >=20
> > > > I find it opposite: clogging commits with useless information, beca=
use
> > > > some arbitrary and completely closed-source tool did analysis means
> > > > nothing to me one year later when I look at the commit in the Git h=
istory.   =20
> > >=20
> > > This is simple not true: Sashiko is fully open-source, under Apache 2=
.0 license
> > > and the code belongs to LF.  =20
> >  =20
> > > Yes, the instance behind sashiko.dev is using
> > > Gemini 3.1 Pro LLM, which is not open-source, but it=E2=80=99s not a =
fundamental limitation -=20
> > > Sashiko is supporting various LLMs, including open models - it=E2=80=
=99s just a practical
> > > choice: to my knowledge the quality of open models is not on par with=
 frontier closed
> > > models  =20
> >=20
> > I would very much prefer using an open source LLM, even if not in pair=
=20
> > with latest paid models.
> >  =20
> > > and it would require a non-trivial amount of hardware and infrastruct=
ure to run
> > > an open model at the required scale. =20
> >=20
> > IMHO the best would be to have them running on some infra that would ac=
cept
> > open source models (*). If there aren't enough resources to have our own
> > infra, there are offers out there which allows running open source mode=
ls
> > like https://ollama.com/pricing (I never used myself).
> >=20
> > (*) For instance, Qwen3.6 is brand new and licensed under apache-2.0.
> >     Not bad on my tests running it locally. =20
>=20
> You can run the tool locally, with whatever model you want, if you want
> to.
>=20
> But for now, let's just take the free credits that Google is willing to
> throw at this thing and let it give us reviews IF the maintainer of the
> subsystem feels it is something they want to do.  No one is forcing
> maintainers to do this.

If Google and/or others are willing to give free credits on their cloud,
they could instead or in addition give free credits to run ollama
there, allowing us to use different models.

=46rom my side, while I won't personally object getting reviews from
Sashiko/Gemini, this is something I can't reproduce locally. I would
very much want something where I can select my LLM preferred model
and run on my ollama docker container on my own GPU, in a way that
I could run it locally before even sending a patch series.

> The netdev, bpf, and drm developers have been doing much the same for a
> while now, with who-knows-what model behind the thing.  The model
> doesn't matter, we aren't advertising for them, we just want the results
> that they can provide us.

It is not about the model itself. It is about being able to easily
install a sashiko locally on a container and easily make it use my
ollma server with the model(s) of my choice. Right now, at least at=20
from its README.md, it sounds that only closed source services
are supported.

Thanks,
Mauro
