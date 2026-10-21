Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792600400;
	b=RVrv+0P1ROtXHldX/H73gnwyHxMFsM3M0qwylBUkJWY1EDu0/VC3lyY6/uObXYVjWrQl
	 AnwjktMdXo523uRKl1Oyv7n+VKblsWgG2+dFMLPqy/IBBZcFHXdiralNXWbZ5RYHzTK0t
	 GrPMLm/6JSY2w2ibWCoe0Sh/ywQmR14y5MsgL8qfzydNLSDHcdv3WUc+dzrQ+VrVvXREf
	 ENhJqMPTzXuFNlqHmrSPYfxW0Lz3g/KSBnsxS4O+PEq2cg/ZJqYZ9moMPEsLDPpZWips+
	 050F+UokP9II4GFBMDkEGfxSbOWiFfR94m06yTKExgGLygDcD/zWHipDjbVEKndnF/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792600400;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=4WHHaSkEewSecRbxVAfo10M/+uB8Btnti55H25BU+gU=;
	b=iL/O/QxICqXgXNXOSlf+sNExycvqK8w12vcT+YYKXq8KpPCEDSsQLqZecflV1G7I9ch8
	 S7aVSUznpTEFLyzXx+/eVK/aBBRj45bhdL9FgLzf80GHxrddzgHveptQ4K/CbIzttQGxY
	 w0bgZRUCKUE4QD8e+EsD4JmnQnaw4SHwgulax4mRnAJw5fnRcnbuwYsG4httw/tBV5A4a
	 UToqKoY6DBfR5sXghJUj/aXpvCzHL0I57cdZ0eAhyq51J7y1JKyAB74Fb7WlLQjAD7eZd
	 vJJ5is7xLjNMHuH8I+vgR3+8Lhcgvpmu/QNihEbQg1QtE4oYWTbRbP9L4QJ/ooh2nMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bou9TWQ1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814F6606A31A;
	Wed, 21 Oct 2026 16:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bou9TWQ1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0097C1F000C1;
	Wed, 21 Oct 2026 16:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792600400;
	bh=4WHHaSkEewSecRbxVAfo10M/+uB8Btnti55H25BU+gU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bou9TWQ1HoZUKoTwWlLM1zHndD7CWVyQuA4Z36eg47OCRCN4+LFPjkd9apccwjdE5
	 Mz5f33UM1+v6W8ekEs9NkJNBDF2tTGYRx3cNlIynpKc/uArnU0LeIIcl65KF4I7Cwx
	 3K6SaKa22G8GnBpdbPVidoi1KSaJh/6Q3796p49ptFU5OqdAgPCmv/jTqp5R8G1A+V
	 2fVWV73rOR6LHy6xrrA1puQRqyBKcCWvZvnNd64vuCu6XNVeO3XqDoevk8aD7UufZj
	 Rl+Y8RNXM25dmDJPvptD7Ho113vOPWTBGNiyPLiZD5RHIslTXO5hcXkxdgl7QTCmJE
	 Cpa89W0v7kOtw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id C00AF1CEDEC3; Wed, 21 Oct 2026 17:33:15 +0100 (BST)
Date: Wed, 21 Oct 2026 17:33:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Theodore Tso <tytso@mit.edu>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Bart Van Assche <bvanassche@acm.org>,
	johannes.goede@oss.qualcomm.com, Jiri Kosina <jikos@kernel.org>,
	ksummit@lists.linux.dev, sashiko@lists.linux.dev
Subject: Re: Patch pre-submission to Sashiko
Message-ID: <atjpS__OwjZ-Q_Fh@sirena.org.uk>
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>
 <atO3pCuUxI950ftN@mit.edu>
 <3354ebda-5158-489b-a577-5cb10e5d5fb0@oss.qualcomm.com>
 <atZ4J86j7CXF82HX@mit.edu>
 <2fef166e-088d-4ffe-8d0a-0143aebc1b26@acm.org>
 <ate8oESqneK-3sQJ@mit.edu>
 <7e473af8-2f7a-4a36-a926-e756873c9c52@linuxfoundation.org>
 <atic3bbDeyJI6MJs@sirena.co.uk>
 <atjlUoEmTagZjrYI@mit.edu>
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
	protocol="application/pgp-signature"; boundary="04ak8/ecJbB34FrJ"
Content-Disposition: inline
In-Reply-To: <atjlUoEmTagZjrYI@mit.edu>
X-Cookie: Whoever dies with the most toys wins.


--04ak8/ecJbB34FrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 21, 2026 at 12:20:43PM -0400, Theodore Tso wrote:
> On Wed, Oct 21, 2026 at 12:07:09PM -0500, Mark Brown wrote:

> > TBH having seen some LLM patches that come with LLM generated testcases
> > the testcases are much worse than the patches themselves.  Open coding,
> > weird structures, asserting bizzare things without explanation - just
> > generally really hard to understand what the test is trying to
> > accomplish and why.

> I recently posted a patch[1] to add KUnit tests for
> fs/ext4/extents_status.c.  It was completely AI generated, and used
> these instructions which I gave to Gemini Pro[2].

> [1] https://lore.kernel.org/all/20261021031231.40107-1-tytso@mit.edu/
> [2] https://lore.kernel.org/all/atbZWze194QiSOTe@mit.edu/

> I'm obviously biased, but it seems to me these test cases were pretty
> good.  I'd appreciate criticisms and suggestions for improvements, but
> if your experience is test cases written with older models, the latest
> frontier models have gotten way better.

Yeah, it's not that you can't do it but rather that I'm nervous of how
much of a useful gate it is to require tests - my general feel is that
if the commits have problems then any associated tests tend to have more
problems.  One example I reviewed earlier today is here:

   https://lore.kernel.org/r/ed22ebf64ed00a56d5e1eff31ac639fef00dcae6.1792179433.git.ivanrwcm25@gmail.com

which will get the issue it was looking for but isn't something I'd want
to maintain long term.

--04ak8/ecJbB34FrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatjpRwAKCRAv73Ows9A4
iftYAP4gfyZPldtPYrBqI8zp3YrR70PZ4PHB3jn19HWhQqWamQEAxHv4DnKHQm0P
gS0pZPigU98aVZ9K5prpMl1oDvZiPgc=
=vGU3
-----END PGP SIGNATURE-----

--04ak8/ecJbB34FrJ--
