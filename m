Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0499330D29;
	Tue, 19 May 2026 12:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779193399; cv=none; b=UvMdVQtZIdhkNTYr5RokmNwl5LSFv3lah0+rIvfqrckuDo7AUkSvA2X6VC8D316vrzv43tNV9d/vQlZSVaX0kcN0NFcM87n9s1M/vQKmnqUtoy1rw3++3Y0Wf7EP4775P6pdozfwTEslsKPYFxm6Z0d+z6DVekIH54jFT673K74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779193399; c=relaxed/simple;
	bh=Y3WpbjUWGiEnR7/mFPX4dVUgHp+sMiZO0AZi+Y6FSJM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=uTxNC56nPP2BCXeb698OePZJLr+iXKndMTxBUxmPkNxbIfYM3nXaFQD0q/qmG/d5PHHayYAyF97reLCpgzTYoxRPmblsnlDASOc81zkGwl8krTBBTYina9JYKabQrKBEaxlFX0AGq6XsogwjTrmfzD1ZkWwPg2NFq8Flu2+z7Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWnFPdoG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWnFPdoG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD25CC2BCB3;
	Tue, 19 May 2026 12:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779193399;
	bh=Y3WpbjUWGiEnR7/mFPX4dVUgHp+sMiZO0AZi+Y6FSJM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=MWnFPdoGVQcWDb0jUZu1nelxpRgXI6CR8Rah3yBMIth/g4ZUN8TJeEJDcq7KeQCj+
	 2YGaXleO1KJH/oO9J30DALxDWCYS7Xx/X8+h0esA27QwWmlq2BmgoUv6mMgWs2DSa1
	 y9bbflngm29GbMQiNI5hg0o95S+GLaeLeKpJxxZlDHOlnlOwc5JeKb1q7+Eae+00QX
	 GhEUC8Rv9JWxGkRQopFaW9ZuExeVcU1eItD0FEvvYWrDPqLcY+qbUBWXctYRAoHwbE
	 JdAheXZtUyZfPH4a2kKSSVTmke94PNfj4Yfw4oNkHrPmoyu9bV8w7ndPP8OdcnAUUR
	 rg5FlxVTSAgxw==
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 May 2026 14:23:15 +0200
Message-Id: <DIMNF65K9U66.1Q89HNYSQ0ZXB@kernel.org>
Subject: Re: Stop false review statements
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Greg KH"
 <gregkh@linuxfoundation.org>, "Konstantin Ryabitsev" <mricon@kernel.org>,
 "Guenter Roeck" <linux@roeck-us.net>, "Miguel Ojeda" <ojeda@kernel.org>,
 <sashiko-bot@kernel.org>, <sashiko-reviews@lists.linux.dev>,
 <sashiko@lists.linux.dev>, "Linux Kernel Workflows"
 <workflows@vger.kernel.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <kfree@google.com>
To: "Roman Gushchin" <roman.gushchin@linux.dev>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <DIL2P8CHKVZD.2WVQQRN0FM28N@kernel.org>
 <C16C14F1-4D2F-4701-88CC-114F5233980D@linux.dev>
In-Reply-To: <C16C14F1-4D2F-4701-88CC-114F5233980D@linux.dev>

On Mon May 18, 2026 at 7:19 PM CEST, Roman Gushchin wrote:
>
>> On May 17, 2026, at 8:56=E2=80=AFAM, Danilo Krummrich <dakr@kernel.org> =
wrote:
>> That said, I personally don't mind too much, I really like sashiko, whic=
h is
>> also why I asked for adding the driver-core list. My experience has been=
 that it
>> does a very decent job in providing feedback for C code; my feeling is t=
hat
>> feedback for Rust code is not quite on par yet, but of course it also hi=
ghly
>> depends on the complexity and scope of the corresponding changes.
>
> This is super interesting. An obvious idea is that the training set is
> relatively limited, if we=E2=80=99re talking rust for kernel code. Did yo=
u notice any
> common topics or patterns?

My experience is - and that's probably not surprising as it may tie back to=
 the
relatively limited training set you mention above - that it sometimes loses
context at the FFI boundary, where it has to consider the semantics of the =
C and
the Rust APIs.

I think the difficult part is not necessarily that there is a language boun=
dary
by itself, but rather that it can be difficult for LLMs to capture the sema=
ntic
layer that a Rust API puts on top of a C API in order to derive a safe API.

This also has been my experience in other LLM contexts; the most significan=
t
improvements I saw in output quality have been by providing more semantic
context for the abstraction design.

Probably easy to look up, but does Sashiko consider cover letters already?

> Does it produce more false positives or worse in finding actual bugs in
> comparison to the c code?

I'd say both, and I think the reason is probably the same for both. But to =
be
fair, this is probably also biased by the class of changes I deal with on t=
he C
and on the Rust side too.

It is also fair to say that in Rust we (almost) don't have whole classes of=
 bugs
that we have on the C side; and the class of memory safety issues makes a h=
uge
proportion of bugs on the C side.

If the model is particularly good at finding memory safety issues (and I th=
ink
it is), it of course also messes with the statistics of false positives
comparing C with Rust.

> I personally think that it=E2=80=99s always better to cc some mailing lis=
t and/or
> maintainers, so there is a second pair of eyes. I totally agree that repl=
ying
> just to the author is less effective.  Of course, we can add the text you=
=E2=80=99re
> proposing, but why not simply configure sashiko to cc the mailing list?

I'm not sure it addresses much of this concern, as I prefer to keep everyon=
e the
patch (series) has been sent to explicitly in the loop.

Of course everyone has a different workflow, but I think it is fair to assu=
me
that most people who are addressed directly follow along through their inbo=
x and
not through the mailing list.

So, I think the real alternative is "reply all", which for multiple reasons=
 I'm
not convinced is the right general call to make yet.

(I do consider it for one of the components I maintain though.)

Thanks,
Danilo
