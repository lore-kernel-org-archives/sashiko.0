Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D13E399003;
	Sun, 18 Oct 2026 11:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792324023; cv=none; b=lDmPKXxrPVLoOgMsUPRQM8JItBUFlGHGcSsGCVDGmFR6N7Vg39NCaQTVBy/HwnexmOGJ8LCMfv5vL7tbNrcR4eM3xSdBVEjfPO1AC69nFE75uK7fpM/vriIuCOw3y9Syl0wCGNOzXbeWlEAhiEeMEf5AD2pPNipd/NcLiPkDzWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792324023; c=relaxed/simple;
	bh=HhGaz2DA1c7Zw4ML0+jpgxu1sJUYRFt9I0HLC5IzF78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QaNKwY/6Dy9s3Pf6sMoKN+kYbZyY5+LC8G/IP57wXLP9vU8rQz3SGyWLssU88631th1zu6GoVWGgCTXiY6j0Ox0c1vaFbpmWfHdEfQoj8XAUzi+WH+3+V7FkXJtG3JgFn7v9AwRkvylIaPIfDqq3QYoROuTRMw2eZsFOF2oSNRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WLsL7zgZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WLsL7zgZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB05A1F000C4;
	Sun, 18 Oct 2026 11:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792324022;
	bh=02P0Qfkgr7iO52R5gdGJOFDDLsYNq+/QELLUiVu/g/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WLsL7zgZzvniYFD4sPxXSB2k4pE163w6HorwKa4kED6bSJcW/8ItNSsE5KrTWvw09
	 T/j4gP2Y7kcTOwJT58RjNFwIvbxIYLRNEtguaYjNRyAoqvYvoDmXBKkkH73fvmUe+O
	 nW3EWUph9iL3lzuxHACrjrfpmhE3t5UBGbd5a5lfEPxnmL7OahoowIaYh3+mfRrTMA
	 Pa9dK+F3PA9obE7Lp5G/7EN5l6lZ8rtCUsDeMdXpaabIk9AcvlJ00WGsBP+yCJuZzv
	 oQXHzw4//huKsMjLteXE7cuQax840ZIAieg6NciLHs9LnYqHntjytc15VYQD+HBYhV
	 xo/QclFZu9xeQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id BF4361C286E6; Sun, 18 Oct 2026 12:46:47 +0100 (BST)
Date: Sun, 18 Oct 2026 12:46:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, ksummit@lists.linux.dev,
	sashiko@lists.linux.dev
Subject: Re: Patch pre-submission to Sashiko
Message-ID: <atSxp7OhWVTKE7Ny@sirena.org.uk>
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>
 <DM7BL6J0WCXU.1I38BKL4RJLFI@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kKplnKzNgOh2UpZt"
Content-Disposition: inline
In-Reply-To: <DM7BL6J0WCXU.1I38BKL4RJLFI@gmail.com>
X-Cookie: Whoever dies with the most toys wins.


--kKplnKzNgOh2UpZt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 06:20:47PM +0000, Alexei Starovoitov wrote:
> On Sat Oct 17, 2026 at 5:28 PM UTC, Jiri Kosina wrote:

> > Neither myself nor anyone else did comment with any review feedback,=20
> > except for Sashiko. Which I believe is what triggered all the immediate=
=20
> > resubmissions.

> > I don't think this is sustanable.

> I think it's just fine. I encourage developers to keep the spam going.

> You can simulate github style squah of v1->v2->v3 in your inbox.
> Ask your agent to monitor inbox, archive vN when vN+1 arrives
> and summarize v1->vN discussion. Then you'll always have the latest
> patch set to look at and a summary of what happened when you were away.
> Then sit on it for a day or a week to see whether respin
> cycle has ended (and bots stopped talking to each other) and then
> do a human part of maintainership.

It's not just LLM users getting caught by this, I've seen people I know
going multiple rounds in what appears to be a very human fashion trying
to shut the warnings up.  Given that some maintainers won't look at
anything until all Sashiko is happy it's a totally reasonable thing to
do but I can't imagine it's an inspiring experience.  A lot of that has
been with valid but not interesting or useful issues (the stereotypical
example is something like missing return value checks on a MMIO regmap).
Even with people who appear to be LLM users I've seen people going all
weekend with no human review only to find that the first human review is
that the approach is completely wrong and they were wasting their time
fixing the detail issues that were being flagged which I can't imagine
is especially pleasant.

--kKplnKzNgOh2UpZt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatSxogAKCRAv73Ows9A4
iRscAP4koBG0A/J/5sQvGlR5XfiXNu/xeVJkdMyWWAGhcBbKfAEAlK+g9nMjKI8o
WCPmP/TT6jHSRWbmgKoK2z/0m0eYcAs=
=uLum
-----END PGP SIGNATURE-----

--kKplnKzNgOh2UpZt--
