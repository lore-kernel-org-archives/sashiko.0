Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792608326;
	b=dnXVvgQLw37Av3EIIE4LsI2H1x6vRzHsI1PiKPDaQlTAHKBdpk8btPt8MS92vbtL1OvA
	 4fG/t/J9yxxz9us5Ra+44UtAHUGdoZoefDqi/MA7aMjVY+F4k3N2tywy4q2VIbs4u7x4c
	 6Cw4AXB5lHHTf0Ew7/RRJcQZUEiLSkdx3znWl7Of3WXxYK/fbgDpTunyI0QnEN8p/G7No
	 sdprA1XNSFlXwimK20OTYqxT6NheeYeBUaf9Be2clBg3htVRQqSaPEppKqZQ6V9EaBpVy
	 thqsty8Rr/vpm8qDA5JZmifYSuf5aDvyaBdPRZt6mexWNkSyBXtpI5+16GY+f3KQyXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792608326;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=0wscnkHGsVJT1+1Lr38sg3oOi8zj1wdEYXoEjKzbdts=;
	b=lqtUlGBqoka9ZrbwLxZaNCpHWVtQzY44NnUuxWVcLzjIfr+9oINWY+tQAWsCSSTXNO1f
	 XyGfYEymDIIhsF/+YA1eLmbX67PJL6XbNVhxS/CzNLCrX1QW9Flmhu0gqFSaCGmBrtAzk
	 OojzxQ1AgB1+IGyYl8PoB2DBGK5gLHoiua5+bUMSFp+7F8o0dS40mVfp9vXQyyozRA54D
	 3ajjKj0XlCfFuaHC/p/RuwvNXO10JWkmG0pMxGZmGLS9frwxjE7YVeRjSCZD1zSnoE8fA
	 YNr7bvj4aJr/KObIM65V2ViFiRUvS16gity/HfpBAuSB6P6QjRpvzZtKQgyPoPss2vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=JMCo5E64;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E938E606A31A;
	Wed, 21 Oct 2026 18:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=JMCo5E64
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ACAB1F000C1;
	Wed, 21 Oct 2026 18:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792608325;
	bh=0wscnkHGsVJT1+1Lr38sg3oOi8zj1wdEYXoEjKzbdts=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=JMCo5E64+830z6CLhy3qq7vU7+iGKwScRvFi3A9jN2o9lsUzR9BivXLDVBGulUSMf
	 2r+z135K4zoh7K7ZLjAPm7W4ElY2nmZZ5NROyBExs04aDsF/DoS32X7109lVhmRU89
	 t5aj+KUaKmkBx/9MSofSOlQB15ehDPn+8lAWbJ8o=
Date: Wed, 21 Oct 2026 11:45:24 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Theodore Tso <tytso@mit.edu>, Shuah Khan <skhan@linuxfoundation.org>,
 Bart Van Assche <bvanassche@acm.org>, johannes.goede@oss.qualcomm.com, Jiri
 Kosina <jikos@kernel.org>, ksummit@lists.linux.dev, sashiko@lists.linux.dev
Subject: Re: Patch pre-submission to Sashiko
Message-Id: <20261021114524.4c2ea2a31a9d527b78e78768@linux-foundation.org>
In-Reply-To: <atjpS__OwjZ-Q_Fh@sirena.org.uk>
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>
	<atO3pCuUxI950ftN@mit.edu>
	<3354ebda-5158-489b-a577-5cb10e5d5fb0@oss.qualcomm.com>
	<atZ4J86j7CXF82HX@mit.edu>
	<2fef166e-088d-4ffe-8d0a-0143aebc1b26@acm.org>
	<ate8oESqneK-3sQJ@mit.edu>
	<7e473af8-2f7a-4a36-a926-e756873c9c52@linuxfoundation.org>
	<atic3bbDeyJI6MJs@sirena.co.uk>
	<atjlUoEmTagZjrYI@mit.edu>
	<atjpS__OwjZ-Q_Fh@sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 Oct 2026 17:33:15 +0100 Mark Brown <broonie@kernel.org> wrote:

> On Wed, Oct 21, 2026 at 12:20:43PM -0400, Theodore Tso wrote:
> > On Wed, Oct 21, 2026 at 12:07:09PM -0500, Mark Brown wrote:
> 
> > > TBH having seen some LLM patches that come with LLM generated testcases
> > > the testcases are much worse than the patches themselves.  Open coding,
> > > weird structures, asserting bizzare things without explanation - just
> > > generally really hard to understand what the test is trying to
> > > accomplish and why.
> 
> > I recently posted a patch[1] to add KUnit tests for
> > fs/ext4/extents_status.c.  It was completely AI generated, and used
> > these instructions which I gave to Gemini Pro[2].
> 
> > [1] https://lore.kernel.org/all/20261021031231.40107-1-tytso@mit.edu/
> > [2] https://lore.kernel.org/all/atbZWze194QiSOTe@mit.edu/
> 
> > I'm obviously biased, but it seems to me these test cases were pretty
> > good.  I'd appreciate criticisms and suggestions for improvements, but
> > if your experience is test cases written with older models, the latest
> > frontier models have gotten way better.
> 
> Yeah, it's not that you can't do it but rather that I'm nervous of how
> much of a useful gate it is to require tests - my general feel is that
> if the commits have problems then any associated tests tend to have more
> problems.  One example I reviewed earlier today is here:
> 
>    https://lore.kernel.org/r/ed22ebf64ed00a56d5e1eff31ac639fef00dcae6.1792179433.git.ivanrwcm25@gmail.com
> 
> which will get the issue it was looking for but isn't something I'd want
> to maintain long term.

If someone's fixing something I don't see much value in
retaining/maintaining a test case for something we've already fixed. 
This is considered good engineering practice but why bother - we fixed
it!  Move on.

It is good to see testcases during the fixing process though.  In these
cases I prefer that the test code be included below the --- with a
brief mention in the main changelog.  So interested people can later
chase down the Link: and find the test code.

