Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615592;
	b=ceAK8TfdW09PGJymWSNt6stUC1HxZCj3HQ7Kk17kJuhpN9RxvsOkXtwYL56LFV+QeWSR
	 h5jWbx26ZFtdClG+paAvGcKOEa+YoaLX4dFcwOQLQTpGkKjPExzHfmdDoaunLdPtLqOUr
	 5fS4344u4hblQF7NBGTxIlMHitYudhJCry9dmEhJE4uootMnilcCIutO8gEqj6wYiCHvY
	 Ng/SNDneCPid8H1U63aih3kms1ftsdKRBNuvL9LUFjOjqu76CospZhlNtolr+rLg/36we
	 6W1KSICA7vpqxFA3L/tdvQ9fZu4dKL6L1Lgn+jOrhTyBTSYCWjHR0Uzh4b59S4MCCyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615592;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=f9ZOgCD+p4GgKdkUM96yk4OYKzb1CXikxrPNb6zLVgI=;
	b=W09rwi0ZATPhOdhrHyYwz7d+2K9snk6AFE4Lq/KpCHTt92ZYcm+13ryoU+9WchDuWU4m
	 P+YNAsJoIAIh7DHvsa+E7X+0b3cDEyUdUtTFqLJ06vRNtgDE+2GeWQ28cXeaPAEWLULWM
	 VroIdKTOfwYbWjuM/S1XT6ivM0GWSYYsrBTRxF14UveOYrDYEGkImv3I5mX9O7uJSX+fv
	 OdB+xpEZ4O7Sg43wJOswaJt/CdNHnl9VjEnPgayAn6Z19svHt2//oXOEvuArWKLJ3bD+d
	 /W1VMCoLgLzpSNb8BIuKy01gVcnUOa21zFQJQJ59f5UWs/Hy+9gxZtCOSYJgR5zKW/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BzWHGEzP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E546606A31B;
	Wed, 21 Oct 2026 20:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BzWHGEzP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 187721F000C1;
	Wed, 21 Oct 2026 20:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792615592;
	bh=f9ZOgCD+p4GgKdkUM96yk4OYKzb1CXikxrPNb6zLVgI=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=BzWHGEzPaklxg6NJjp7fd1ekqE7WBz191XF55Ypf6kItwVTTsBWODA1EvJdBSIG8N
	 4rfs1ReiGYSlt162u/1oHo9Vg4TnctmzLDwsDP1s3AolozZ/c1hMb8AfEXm6sR7msg
	 alHQLfff/V/vzOZYQiB3Uu1sJrtDHwry8YSk0YLXB30cQbmCGFZJu9dkJdW9VIFw/j
	 TKmQ0+V3G/2trpvEb5SZQT7f1bAXa+1mHkPNPppVnAT/FLazg/TDpUDcV+yR4ody9Q
	 JvTe+nHMvTudn0Sc5r5YHeXpYEL57IO9Qt8EfRAvktKHFmwHgBZelJsAW9Z1wRVxmf
	 IhKfFMcDQUJ/Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id CADF3CE0A73; Wed, 21 Oct 2026 13:46:31 -0700 (PDT)
Date: Wed, 21 Oct 2026 13:46:31 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Theodore Tso <tytso@mit.edu>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Bart Van Assche <bvanassche@acm.org>,
	johannes.goede@oss.qualcomm.com, Jiri Kosina <jikos@kernel.org>,
	ksummit@lists.linux.dev, sashiko@lists.linux.dev
Subject: Re: Patch pre-submission to Sashiko
Message-ID: <163b068c-c5ba-4307-9012-ac8ff6f18683@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <atO3pCuUxI950ftN@mit.edu>
 <3354ebda-5158-489b-a577-5cb10e5d5fb0@oss.qualcomm.com>
 <atZ4J86j7CXF82HX@mit.edu>
 <2fef166e-088d-4ffe-8d0a-0143aebc1b26@acm.org>
 <ate8oESqneK-3sQJ@mit.edu>
 <7e473af8-2f7a-4a36-a926-e756873c9c52@linuxfoundation.org>
 <atic3bbDeyJI6MJs@sirena.co.uk>
 <atjlUoEmTagZjrYI@mit.edu>
 <atjpS__OwjZ-Q_Fh@sirena.org.uk>
 <20261021114524.4c2ea2a31a9d527b78e78768@linux-foundation.org>
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021114524.4c2ea2a31a9d527b78e78768@linux-foundation.org>

On Wed, Oct 21, 2026 at 11:45:24AM -0700, Andrew Morton wrote:
> On Wed, 21 Oct 2026 17:33:15 +0100 Mark Brown <broonie@kernel.org> wrote:
> 
> > On Wed, Oct 21, 2026 at 12:20:43PM -0400, Theodore Tso wrote:
> > > On Wed, Oct 21, 2026 at 12:07:09PM -0500, Mark Brown wrote:
> > 
> > > > TBH having seen some LLM patches that come with LLM generated testcases
> > > > the testcases are much worse than the patches themselves.  Open coding,
> > > > weird structures, asserting bizzare things without explanation - just
> > > > generally really hard to understand what the test is trying to
> > > > accomplish and why.
> > 
> > > I recently posted a patch[1] to add KUnit tests for
> > > fs/ext4/extents_status.c.  It was completely AI generated, and used
> > > these instructions which I gave to Gemini Pro[2].
> > 
> > > [1] https://lore.kernel.org/all/20261021031231.40107-1-tytso@mit.edu/
> > > [2] https://lore.kernel.org/all/atbZWze194QiSOTe@mit.edu/
> > 
> > > I'm obviously biased, but it seems to me these test cases were pretty
> > > good.  I'd appreciate criticisms and suggestions for improvements, but
> > > if your experience is test cases written with older models, the latest
> > > frontier models have gotten way better.
> > 
> > Yeah, it's not that you can't do it but rather that I'm nervous of how
> > much of a useful gate it is to require tests - my general feel is that
> > if the commits have problems then any associated tests tend to have more
> > problems.  One example I reviewed earlier today is here:
> > 
> >    https://lore.kernel.org/r/ed22ebf64ed00a56d5e1eff31ac639fef00dcae6.1792179433.git.ivanrwcm25@gmail.com
> > 
> > which will get the issue it was looking for but isn't something I'd want
> > to maintain long term.
> 
> If someone's fixing something I don't see much value in
> retaining/maintaining a test case for something we've already fixed. 
> This is considered good engineering practice but why bother - we fixed
> it!  Move on.
> 
> It is good to see testcases during the fixing process though.  In these
> cases I prefer that the test code be included below the --- with a
> brief mention in the main changelog.  So interested people can later
> chase down the Link: and find the test code.

The "right" thing to do is to work the new testing needs into existing
tests.  Of course, this is often a bit harder than it looks.  But when
this can be made to work, you get increased coverage for the same
testing resources.

Pity about the added development costs.  ;-)

							Thanx, Paul
