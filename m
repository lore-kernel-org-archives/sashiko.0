Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621A73246ED;
	Sat, 16 May 2026 18:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778956131; cv=none; b=JufQX3kta47Z7WHI0sOjmvaVskobLV3mlzcAMPq00hwKdtlYw7XM3gdWi2KLVUR+cJ+9catqbAEjJalgXMGriGdhtkNY8VwrrZO57vbI3ZgcTL4PS18CQVpko7lijcYgbsFJpPcz+YmfFwhNE2z9Bgwk027IBGv3F2v/3Ob03f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778956131; c=relaxed/simple;
	bh=mXJY5235/mBb2b98kaVDFKXZ9bb0TIVibMCemRFnxRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=It6VQFShoWaphnCqWMTax/EeysalYrbGT4g8EESzapFhcWV+UrHSzcc/ha9d0BnJGhG52sFzIF1beKLcCkKcB7H5/hOmfARmu1AdCyMwwSnD3rNAfFUev8PQL//Vymm+zRisZJ+eSjzJE+RttuKwiklIsnpdSRUJg3VyLzb/v0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NeGMkcZn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NeGMkcZn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 433E8C19425;
	Sat, 16 May 2026 18:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778956130;
	bh=mXJY5235/mBb2b98kaVDFKXZ9bb0TIVibMCemRFnxRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NeGMkcZnMR6+qAtHZs0g6NSGYOLRtoQLnGOT9+I7YlaaLEKRp3O9AdDKEcqJ3pcjk
	 OKZjCGhzDcELJy+9JkXVpXfJombLgQxpE68oBMg58U+JUhyD06Q4A3uTJa0+lwlXNa
	 vS/himEEyPfPrqj9jEMMGQcXQTFn+/M6Pc9nzh3Jv/gmqNoPMcI1dzcya6ZKOf8bfT
	 +V+40u8GHE6ytQaBA73JPTsDVjaDBSHb7/8q2LFMEB0Qzq1FaZg99RychxursAVeOx
	 ZiYWYL29xbExQwepUWC+YshKi89feFFMjZFb8VjQN+0DYWAw5S5fIFDp65rk3MUcvT
	 vb7DolI1RKUNg==
Date: Sat, 16 May 2026 15:28:47 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Konstantin Ryabitsev <mricon@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk@kernel.org>, sashiko-bot@kernel.org,
	sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev,
	Linux Kernel Workflows <workflows@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	devicetree@vger.kernel.org, kfree@google.com
Subject: Re: Stop false review statements
Message-ID: <agi3X76XwcBJ-KmH@x1>
References: <2026051631-trolling-juggling-da1c@gregkh>
 <0902F8E6-C495-40A1-975D-92D3B72D44AE@linux.dev>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0902F8E6-C495-40A1-975D-92D3B72D44AE@linux.dev>

On Sat, May 16, 2026 at 08:49:39AM -0700, Roman Gushchin wrote:
> > On May 16, 2026, at 8:45 AM, Greg KH <gregkh@linuxfoundation.org> wrote:
> > ﻿On Sat, May 16, 2026 at 08:41:43AM -0700, Roman Gushchin wrote:
> >>>> On May 16, 2026, at 8:20 AM, Konstantin Ryabitsev <mricon@kernel.org> wrote:

> >>> ﻿On Sat, May 16, 2026 at 05:11:28AM -0700, Guenter Roeck wrote:
> >>>>> On Sat, May 16, 2026 at 10:05:02AM +0200, Krzysztof Kozlowski wrote:
> >>>>> What the hell is that:
> 
> >>>>> https://lore.kernel.org/all/20260515190707.033BDC2BCB0@smtp.kernel.org/
 
> >>>>> As a bot you CANNOT MAKE a Reviewer's statement of oversight. You are
> >>>>> not a damn human do be able to make such statement. You are a bot, a tool.
 
> >>>> Where exactly do the rules say that ? I seem to miss that.
 
> >>>> There is a policy document about _contributions_ made by AI, but I don't
> >>>> see the one that says that AI agents must not provide Reviewed-by: tags.
 
> >>> From my perspective, AI agents must NOT use the Reviewed-by tag for the
> >>> following reasons:

> >>> - We consider this a "person-trailer" and it implies agency
> >>> - Adding yourself to a commit via a trailer is a *binding responsibility* for
> >>> the change. A lot of tooling will cc the Reviewed-by addresses on follow-up
> >>> messages regarding code in this commit. If the address is bogus or doesn't
> >>> go to a developer, this is both wasteful and potentially frustrating.

> >> Hi Konstantin!

> >> The goal here is to inform maintainers that sashiko has successfully reviewed the patch
> >> and there were no findings, otherwise maintainers have to go to the web site and check the status.

> > That's fine.

> >> I’m not attached to any specific form of it, I thought Reviewed-by is the most obvious form.
> >> And we use Reported-by: tags with various tooling for years.

> > Reported-by: shows the existance of a problem that some tool found, a
> > subtle difference here.

> >> What do you think is the best form?

> >> I’ll pause sending reviewed-by tags until we have a discussion and agreement here.
 
> > Just say it in some other text form, that our tools will not pick up.
> > Like:
> >    Tool XXXX reports that all is good:
> >        https://....
 
> > or something like that?
 
> Sure, works for me.

Couldn't this be something like:

AI-analysed-by: bot-X

Sometimes we expect them to run and produce results, that we should
check, and in my experience act upon and sometimes ignore, as usual with
any type of comments, when I don't get those results I usually go and
look at the web interface, be it the public one or the private one I use
(while contributing to one of them, sashiko for full disclosure), to see
if it is just that it is taking longer to process that specific patch or
if it really finished.

If I go in the morning to look at my inbox and see everything there it
reduces some steps for me.

So, yeah, Reviewed-by is definetly for definetly persons, but having
some tag that states that it went thru automated reviewing^Wanalysis by
a definetly bot/thing/whatever that some people think is useful seems
useful.

And of course I think this should be all opt-in by each and every
maintainer, this definetly is not something to be uniformly agreed on,
so if some mechanism is put in place for, say, sashiko, to reply that it
didn't find any problem with a particular patch for the subsystem I'm
involved with, then I'd like for that info to be provided as a reply to
the message.

Cheers,

- Arnaldo
