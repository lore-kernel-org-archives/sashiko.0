Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4080D3E51D8
	for <sashiko@lists.linux.dev>; Sat, 16 May 2026 15:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778946124; cv=none; b=a+Cct0cEXNpuRxz2odRF01M5Rrov9kV2Vc3EJ1QGlHz8yE94dbMT9Yta0yMk/xFy11xPgh2khv8nkTwu+/xCsWdI8eVksHkrSzwGCbfsQPpnheULc4bjkRlhh2Q/pnHTiWWwTQ/htKKFGQYTDPcU8qCqCt2MHZ+T9vvX8oGiw8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778946124; c=relaxed/simple;
	bh=v3RftEOEQ0Z0EimNsUKTIGiDBZhBWYSoHc1wI9KQV2U=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=MrWJh9mo0C94QMDcJsmkuGJUH8iIik8bRevkv28BUpIDJY+JQDL0zH6DlJEWzT5iQLwPkckN+c5/DXHR0Hl6vOlhGVzW9whG+U/BQNnuvmZfPBdBykrNhYGr0TYadYxMJU00Hgci6QBihGx7ByIwD6m+tCmez3cgYlAcZpB6QhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hFc6SKnI; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hFc6SKnI"
Content-Type: text/plain; charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778946117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XH9syRm46i8Qb1VP/1p0ztBqeIBZ8qFG0WVI2+gyvqE=;
	b=hFc6SKnIuKX1IkGyCyjU/HNL1sZuQDkq20+Cs89Je5w5nQATrOYLuzSCv6zdMIV98Gm9Z3
	KIidC2mIwuo4id0sVfEbb/1acAdl868YOqMOFvxe1oFkje2sB6VXpLT0nmnNuewiUSBlGt
	boJkuO/z2u8jkJRGskJ5g42s132wah8=
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
In-Reply-To: <20260516-upbeat-tody-of-feminism-4ab00a@lemur>
Date: Sat, 16 May 2026 08:41:43 -0700
Cc: Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzk@kernel.org>, sashiko-bot@kernel.org,
 sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev,
 Linux Kernel Workflows <workflows@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org, kfree@google.com
Message-Id: <D659E814-069C-439A-B816-1BC383F38E1F@linux.dev>
References: <20260516-upbeat-tody-of-feminism-4ab00a@lemur>
To: Konstantin Ryabitsev <mricon@kernel.org>
X-Migadu-Flow: FLOW_OUT


> On May 16, 2026, at 8:20=E2=80=AFAM, Konstantin Ryabitsev <mricon@kernel.o=
rg> wrote:
>=20
> =EF=BB=BFOn Sat, May 16, 2026 at 05:11:28AM -0700, Guenter Roeck wrote:
>>> On Sat, May 16, 2026 at 10:05:02AM +0200, Krzysztof Kozlowski wrote:
>>> What the hell is that:
>>>=20
>>> https://lore.kernel.org/all/20260515190707.033BDC2BCB0@smtp.kernel.org/
>>>=20
>>> As a bot you CANNOT MAKE a Reviewer's statement of oversight. You are
>>> not a damn human do be able to make such statement. You are a bot, a too=
l.
>>>=20
>>=20
>> Where exactly do the rules say that ? I seem to miss that.
>>=20
>> There is a policy document about _contributions_ made by AI, but I don't
>> see the one that says that AI agents must not provide Reviewed-by: tags.
>=20
> =46rom my perspective, AI agents must NOT use the Reviewed-by tag for the
> following reasons:
>=20
> - We consider this a "person-trailer" and it implies agency
> - Adding yourself to a commit via a trailer is a *binding responsibility* f=
or
>  the change. A lot of tooling will cc the Reviewed-by addresses on follow-=
up
>  messages regarding code in this commit. If the address is bogus or doesn'=
t
>  go to a developer, this is both wasteful and potentially frustrating.

Hi Konstantin!

The goal here is to inform maintainers that sashiko has successfully reviewe=
d the patch
and there were no findings, otherwise maintainers have to go to the web site=
 and check the status.

I=E2=80=99m not attached to any specific form of it, I thought Reviewed-by i=
s the most obvious form.=20
And we use Reported-by: tags with various tooling for years.

What do you think is the best form?

I=E2=80=99ll pause sending reviewed-by tags until we have a discussion and a=
greement here.

Thanks=
