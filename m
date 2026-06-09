Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FE03FB06B
	for <sashiko@lists.linux.dev>; Tue,  9 Jun 2026 16:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781024315; cv=none; b=Z8CpyBjm7Yo5jU3YDtxf5B34tR1qHB7rjlnWKkU+e7wWQpEczN6zl2IuXiLe9ZhHvgKul1zGHKCV+ryMvkarcDAua6T83FR2TEW3ctubL9AMshuj5iq5g0NvzezfWHYAGiQ9NFLIDCPU++P9hMsWaVZgZ7eHeQaF6lf0E/c/dww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781024315; c=relaxed/simple;
	bh=K7v1UmjVoLu56tmAI6eOncVbQxglP4jAfHS0CosXfE0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ht24we05+OHInlOsn9JUR6LsxH/q5l7GL5u7m9CEtPIhZa24khjJfuECko4JSpv+XOREpE1QxhzxaqYTGSOoGPok6NuyXWMkCqEM2olOYmM82skSxGmef8OlOUAYgqzsczu0xmngLXRNTuo8XIR+iV8BK5HHrOujdWtySPUTLQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nLoUKqEn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nLoUKqEn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE45C1F00893;
	Tue,  9 Jun 2026 16:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781024314;
	bh=K7v1UmjVoLu56tmAI6eOncVbQxglP4jAfHS0CosXfE0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=nLoUKqEnRNbKpIHNcsfx8WWrFe81ravMwPkrONYddc3n8CmMn5nwYTEX7WIsdCVoe
	 p6cT82XR8P35YtWAzXjm0TRVrZPBfKLXdmkKhjpGjT6sTTZTj4IttrvPsw4dLEvJz0
	 /93fbcJTncmEU2n3+j7okrz6WXGZRJAsEcJje/kYprl6XMRoIvE4S5q4V77Tr3iuSN
	 sZtDgjNXYAEiAA+SoYs/MKq7Tb391nSVwpYFo+fZ8+PYHzmW1jJYVDjlXXiFmNLzDH
	 Tj3DSVmaU+PtsA6F5s7mTx7WLjzRTTJbYydiCVwPWuSe2HzV3hccfFhYJ2DdFcZJGf
	 r1ovEKyLVUJWg==
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 18:58:32 +0200
Message-Id: <DJ4OFDP8DDD8.2RZ96ISZ0TRJ1@kernel.org>
Subject: Re: Sashiko email policy precedence
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, <sashiko@lists.linux.dev>
To: "Roman Gushchin" <roman.gushchin@linux.dev>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <DIX8UX2TJP8E.4OAWKUUF5JG1@kernel.org>
 <CANiq72mSpur28Fz8YL7_-FJk_h008kt=sw6mLeSsRNmiy+ko1Q@mail.gmail.com>
 <DIXM8JL1CM5A.315I0YBSDJT5O@kernel.org>
 <DJ3PO5LX7TQK.3BS0W5EV7NB7C@kernel.org>
 <7ia4ecifd6i9.fsf@castle.c.googlers.com>
In-Reply-To: <7ia4ecifd6i9.fsf@castle.c.googlers.com>

On Tue Jun 9, 2026 at 6:26 PM CEST, Roman Gushchin wrote:
> "Danilo Krummrich" <dakr@kernel.org> writes:
>
>> On Mon Jun 1, 2026 at 11:46 AM CEST, Danilo Krummrich wrote:
>>> Flagging something as wide list seems rather simple [1], the tristate [=
2] would
>>> work as well, but seems a bit more complicated and potentially requires
>>> adjusting the existing policies.
>>
>> Roman, any preference on either of those or something else?
>
> Sorry for being late to the party.

No worries, and thanks for catching up.

> Yeah, the tricky balance here is that there are people who want more
> sashiko reviews and there are people who are quite vocal against it.
>
> And I don't want to over-complicate the setup, I'm afraid it will be
> just a constant source of disagreement.

I think it usually works out well as is if multiple subsystems are involved=
.

The only case where it falls apart is with wide lists potentially spanning =
all
subsystems with a certain policy, which if handled like any other list, may=
 end
up taking precedence over all subsystem lists regardless of their preferenc=
e.

Hence the proposal to just special case wide lists, so they can't take
precedence over everything.

> One option, is to switch from mailing list granularity to the
> MAINTAINERS-entry granularity. Wdyt?

As mentioned above, I think the main issue are wide lists, and switching to=
 a
MAINTAINERS-entry granularity wouldn't cover that (unless I am missing
something).

> I don't think I have a perfect model in my head which will cover all edge
> cases, tbh.

The wide list case is not an edge case.

Taking the R4L list aside, if we would set reply_to_author for the LKML, wh=
ich
does not seem entirely unreasonable, it would have the same effect, which i=
s no
one's reply_all setting would be honored anymore.

> I personally think that reply_to_author + cc the main mailing list should=
 work
> pretty much everywhere, but it looks like there are other opinions as wel=
l.

It can be quite cumbersome when people pick up a discussion based on a poin=
t
made by Sashiko and some people are excluded from the discussion because on=
ly
the mailing list and specific people are statically Cc'd.

People that were Cc'd explicitly on a patch series usually don't expect to =
have
to switch to the mailing list to capture every discussion.
