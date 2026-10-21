Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580833;
	b=Nj1GEcNnAC78sURbrzFHbPMn5a/P1fpKyPDYCQrSgPqNXjFbCpGCjHpjhFPzcxsSSW15
	 11KYH8vMX82VF6NbsU8Oq328+JtnR98K/bDhFd+d1ktHsPyHDT4033e3DGvhTw50q947s
	 T2pqcRnq4WOYFeELqFi5jQNzopegQFVYI7cyBeBueLGTTeFss8cWZgF8wvhv1GUnm9XPj
	 x8O6upfaKpXNvq0H22yml8+YdQXAIr6u8Ladf3glVNL0tWM6iaAJUStzXi+JmBDCijdO2
	 QKBta6HAbcmR8beqErudeo+Hf+0zFpGUzhq6MYt6vKVgP67rndEZ4b3EpHSfau8EceA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580833;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=gAf0Dg+KuB/mpjLPFq0BKt/el80eTSSfEJz3oB8HdRA=;
	b=JWe8lvOp11PCxqJIHuCIHOqC8e1UGfOa+AjhV9AOh903hzTPzibTCis1jVTguXRaox/l
	 8aEyqlHP14T7UsTaZFc+XvJnUd1q8rwK8YqFhcP75BKBQDwHSS1E8B5qfFlirwZszbv24
	 Rv6y/SWhXuiz2z4YBssFddUxEhDi7pOdnfimS83PE+MQrGeVdmkpNSg93A6KnhhAIBdja
	 RB/vKgnwcDH2jAwzYpI7uSIo0+m6K9cElOhuDxp7GizD1a9PIN3TiIPjzWDXX3cJ5r6PH
	 xAeHhtaSPCisz9kQtcpI/xthcvBkryHk2GYxjA9fONT9t4l96RU/z9srZJT+JZfXAgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z2oErRDA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0A1606A323;
	Wed, 21 Oct 2026 11:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z2oErRDA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 447E41F000CF;
	Wed, 21 Oct 2026 11:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792580832;
	bh=gAf0Dg+KuB/mpjLPFq0BKt/el80eTSSfEJz3oB8HdRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z2oErRDAVSKOreso8AH9IyHaEXpylrc3+uXYvhujBhzL7wVV60D5dZYFsTIbl8hwS
	 RJ1hNkiDfLZerzXNZoAurjCl3HV2oIVKXHT5dy2x5RPAyDCC3KNjBwaLgS+0TAI9aF
	 4i/PnJM11O9/dPZFMaxEnK5+OK1nUVCVFncDsk0ZxEznlVv46wVPhVxbP/4Oru/0l1
	 5xXhJewfTXg5X3Bmf/zN5Gqs6z/Za1h3gDsOKg52kTmx1kVvHSgHnshOvP8U5l64I9
	 d0qy8bOkKKu6gPalLmvtq0F3ggqwoGmm9GFk0R9yzQopcIoKdHoU676HJKrTdn0Po4
	 p/iMxi3vZ37qA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 50C2A1AC5994; Wed, 21 Oct 2026 12:07:09 +0100 (BST)
Date: Wed, 21 Oct 2026 12:07:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Theodore Tso <tytso@mit.edu>, Bart Van Assche <bvanassche@acm.org>,
	johannes.goede@oss.qualcomm.com, Jiri Kosina <jikos@kernel.org>,
	ksummit@lists.linux.dev, sashiko@lists.linux.dev
Subject: Re: Patch pre-submission to Sashiko
Message-ID: <atic3bbDeyJI6MJs@sirena.co.uk>
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>
 <atO3pCuUxI950ftN@mit.edu>
 <3354ebda-5158-489b-a577-5cb10e5d5fb0@oss.qualcomm.com>
 <atZ4J86j7CXF82HX@mit.edu>
 <2fef166e-088d-4ffe-8d0a-0143aebc1b26@acm.org>
 <ate8oESqneK-3sQJ@mit.edu>
 <7e473af8-2f7a-4a36-a926-e756873c9c52@linuxfoundation.org>
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WYr3eNcDcuS2J27v"
Content-Disposition: inline
In-Reply-To: <7e473af8-2f7a-4a36-a926-e756873c9c52@linuxfoundation.org>
X-Cookie: You buttered your bread, now lie in it.


--WYr3eNcDcuS2J27v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 20, 2026 at 02:43:27PM -0600, Shuah Khan wrote:
> On 10/20/26 13:21, Theodore Tso wrote:

> > and maybe even:

> >     * Add a kunit test covering any changes made by the agentically
> >       generated code.

> kunit or kselftest covering any changes made by the agentically
> generated code

TBH having seen some LLM patches that come with LLM generated testcases
the testcases are much worse than the patches themselves.  Open coding,
weird structures, asserting bizzare things without explanation - just
generally really hard to understand what the test is trying to
accomplish and why.  Sometimes for a one and done test, especially one
you're not going to keep around, it doesn't matter so much but stuff
like that can really impact the maintainability of the testuite.  Some
of this is probably submitters paying comparatively less attention to
the tests and just throwing anything over the wall without review.

--WYr3eNcDcuS2J27v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatic2gAKCRAv73Ows9A4
icJIAQDCOfY+cfIygb0Lhp/uoFq2Oz3i1JxMT26l0NeNzWK90wD9GovDa3Wd5Gfe
5Vi0ThgsJvqpY/CVMUCDMjVwFy46lQM=
=P0cp
-----END PGP SIGNATURE-----

--WYr3eNcDcuS2J27v--
