Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03241DE4F1;
	Sat, 16 May 2026 13:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778937854; cv=none; b=ipcUs91ZtR/RXdtgi1HPcZ+UAQdo0tjsvpMrmJTe5x9JU9YhntcS0MUbLdr06J2FIIABNS8vx3tmaZi8MfjBFtXXedsNyVEraRS7p0/fMeKaf7a8kad/zzHdqirqnCQ1+a9XNDWlS7cJktUqs6YQsPzl2N6QNT4YoBl2VUEOZCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778937854; c=relaxed/simple;
	bh=qRImKxOhi1KCxcLye9EI+ckv7krcacXADEXZ3SBnJfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qW/GMJCDsIgJ9bsug4qW2fIBY3QeG7HCJFNLJPzTBOb0YN8jhxurfHxkB7cNC9BaLtWQkLEx+00gn3BRFKs8+WA6OsJECeDoday1E+YOgmwvtn2qpst1mR/oKzWX0t1aZuATCEHYqEcVtQHGr5m0l4kzTLxLw2n97Gdn9e7iDsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MyrB74Yy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MyrB74Yy"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E7AD348;
	Sat, 16 May 2026 15:23:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778937838;
	bh=qRImKxOhi1KCxcLye9EI+ckv7krcacXADEXZ3SBnJfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MyrB74Yy8T5SpXSBKFPT/Hoi9eP6jSqQ1CSioM66UaXNR7KcqPZDUczDGDgcCk922
	 +13o2U2dfn+fckCNc7iaabxSXvJ0obVDx9lqYp/Y/YDzORDH8oAwtV7vCFiOSAkELL
	 7jxUqXBSROdM74wtegVoMJHyODW9IAXnvxRjC5xA=
Date: Sat, 16 May 2026 16:24:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, sashiko-bot@kernel.org,
	sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev,
	Linux Kernel Workflows <workflows@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	kfree@google.com
Subject: Re: Stop false review statements
Message-ID: <20260516132407.GA163589@killaraus.ideasonboard.com>
References: <ad139e54-a7f0-4d09-832c-6b2bf2e93e03@kernel.org>
 <fcc4b719-2696-4f31-bac4-6c07f8ddec47@roeck-us.net>
 <221cc52e-9918-43ea-b196-622a8cc6db05@kernel.org>
 <fd3b2ca7-4d64-4c4b-98a3-7d3285fa6826@roeck-us.net>
 <b5f2a21a-9530-4efe-aed5-cc96aab74e88@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b5f2a21a-9530-4efe-aed5-cc96aab74e88@kernel.org>

On Sat, May 16, 2026 at 02:29:15PM +0200, Krzysztof Kozlowski wrote:
> On 16/05/2026 14:23, Guenter Roeck wrote:
> > On 5/16/26 05:16, Krzysztof Kozlowski wrote:
> >> On 16/05/2026 14:11, Guenter Roeck wrote:
> >>> On Sat, May 16, 2026 at 10:05:02AM +0200, Krzysztof Kozlowski wrote:
> >>>> What the hell is that:
> >>>>
> >>>> https://lore.kernel.org/all/20260515190707.033BDC2BCB0@smtp.kernel.org/
> >>>>
> >>>> As a bot you CANNOT MAKE a Reviewer's statement of oversight. You are
> >>>> not a damn human do be able to make such statement. You are a bot, a tool.
> >>>>
> >>>
> >>> Where exactly do the rules say that ? I seem to miss that.
> >>>
> >>> There is a policy document about _contributions_ made by AI, but I don't
> >>> see the one that says that AI agents must not provide Reviewed-by: tags.
> >>
> >> Quotes from the existing policy:
> >>
> >> 1. "By offering my Reviewed-by: tag, I state that:"
> >>
> >> Tool cannot use first person "I". Tool cannot "state that".
> >>
> >> 2. "A Reviewed-by tag is *a statement of opinion* that the patch is an
> >>   appropriate modification of the kernel without any remaining serious"
> >>
> >> Tool cannot make a statement of opinion.
> >>
> >> 3. "Any interested reviewer (who has done the work) can offer a
> >> Reviewed-by".
> >>
> >> Tool is not a reviewer as a person, thus above does not grant the tool
> >> permission to offer a tag.
> > 
> > I'd like to see that explicitly spelled out. Until then it is your opinion.
> 
> It is not an opinion. It is written. I gave you quotes.
> 
> Do you want to spell the rules of English language? That tool is not a
> person?
> 
> Shall I send the patch like:
> 
>   Any interested reviewer (who has done the work) can offer a
>   Reviewed-by.
>  +In English "reviewer" is a person [1].
>  + [1] https://en.wiktionary.org/wiki/reviewer
> 
> Seriously, you expect to document the English language?
> 
> >>>> Stop faking tags.
> >>>>
> >>>> And really, considering how many false positives Sashiko produces, how
> >>>> poor review comments it gives, how many misleading comments, it's
> >>>> unacceptable to me to consider that a review.
> >>>>
> >>>> Amount of useless noise Sashiko produces already changed my mind how
> >>>> useful that tool is.

Note this isn't en entirely new situation. As a maintainer, you know how
much you trust each reviewer. You will consider some R-b tags as a sign
you don't even have to look at a patch, and will completely ignore some
others. There's a whole continuum in the middle. In some ways, reviews
by an LLM are similar. You will trust them or not trust them.

Except they're also very different.

The kernel needs more skilled reviewers (I don't think this is a
controversial statement). We can't expect all newcomers to start with
extensive experience from day one, so there's a learning curve. I
believe it's fine for more junior reviewers to send R-b tags even if
they miss some issue, as long as they genuinely try and improve (and, in
some unfortunate cases, decide to leave if patch review turns out not to
be for them). Those R-b tags may feel like a bit of noise in the
beginning, but that's compensated by their value increasing over time.

Bot reviews are not the same. Not only are they generated at a much
larger scale than human reviews, they also won't learn from feedback you
give them. Sure, the tools may be improved when cases of false positives
are identified, and new LLMs may be trained with more (and better ?)
data to improve the output, but they won't learn from the interactions.

How much value a maintainer sees in those reviews is up to individual
maintainers. I will personally not consider a R-b tag from an LLM to
mean that a patch is ready to be merged (and I believe you won't
either). As such, I think that a R-b from an LLM is misleading and
doesn't provide good value. At best it's free advertising for company
making closed-source tools, which I don't think we should encourage.

If some maintainers want LLM reviews and want to act on them, that's
their personal prerogative. They're free to decide on how much value
they see in those reviews, as well as on whether or not they consider
usage of those tools compatible with FOSS ethics. Those are personal
decisions. However, given that the ethical decision is personal, I am
strongly against forcing patch authors to act on automated LLM review.

> >>> We seem to have completely different experiences. Yes, it does produce
> >>> false positives, just like humans do. However, I have seen it find many
> >>> real bugs, including many in patches which already had Reviewed-by: tags
> >>> from (presumably) human reviewers.
> >>
> >> Of course it finds bugs. But it also produces - roughly - 80-90% false
> >> positives, completely useless.
> >>
> > 
> > Really ? The ones I have seen are - roughly, to use the same term - 80-90%
> > true positives. Maybe you should explicitly ask for no Sashiko reviews in
> > your scope of responsibility.
> 
> I already sent a patch to stop receiving all these emails and I stopped
> reading them completely, when fetched via b4 for review in mutt workflow.
> 
> But this is not the point.
> 
> Our docs clearly state what Reviewed-by means, regardless of the quality
> of the actual review. Poor quality is just another reason, less
> important, though.

-- 
Regards,

Laurent Pinchart
