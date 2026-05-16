Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB4137A4AB;
	Sat, 16 May 2026 21:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778965838; cv=none; b=Omko+Sl0+YBMabus6YHVWqQP1LHhJXCRTOi8h1SEoqIzCWVPGC3Y7Zc7bkrlF7ZXDPMNmavLMj9ylXBKKWAkjMuC2tCt0WnjlAC6WRr1W4IBGiLZ7oSHA5SAdREJr+w0CnSx35IFCc7oFGxN0L+WmORZnwB0tTukV++i2sw6vME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778965838; c=relaxed/simple;
	bh=pg5pULEWTpk/pz15kttxyq2Ri+vMVUCfNspVLzhR9ag=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f4dNUpyowyEoAD0No3WU36nfr6KiO8a05fvg5OxNecDDq41fukQQW5Vc1vzXUvLjAIjjHtLwHNM+LjneTQmx5LCzDbD2GSO0KfobUuf3x7B23kz22Pe30L96IV8KHervSLfsumNZzWheNXRkrbqsgfjEXatp72OBgnNevIYRvTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BS5Emhju; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BS5Emhju"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0968DC19425;
	Sat, 16 May 2026 21:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778965838;
	bh=pg5pULEWTpk/pz15kttxyq2Ri+vMVUCfNspVLzhR9ag=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BS5EmhjuscDNtvdMX7f+NLclKgGOQaLejJYTIARymdQ+xrm4jOaCNJGbXEf+hFy8b
	 pohNL2Vl893PZ6yhKYZ48eFqeyAFurdWgsoR4jN94n/Crs2Y6wKQq9a9cGTglf32vf
	 WRHrc77H0EJn8SrnZSIiS9hTd/wjbucT5lKtbBV2eRX4pSJT6A+ayhHMUyGrQ1xmTc
	 TA1J2fSmGFnuOsm3PxOL59+v5t/3z3VpLvPF4LxV/KytfEwL0vG19Chmj4aWSzXzfg
	 ez628foH+On88RSjN0qJRWIn8WnlWxtt+JTy7muAioruorHdOBc+oRs++2QU4Rgzfi
	 KJYm6wMfnQFig==
Date: Sat, 16 May 2026 23:10:32 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Guenter Roeck
 <linux@roeck-us.net>, sashiko-bot@kernel.org,
 sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev, Linux Kernel
 Workflows <workflows@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, kfree@google.com
Subject: Re: Stop false review statements
Message-ID: <20260516231032.1fe57306@foz.lan>
In-Reply-To: <20260516132407.GA163589@killaraus.ideasonboard.com>
References: <ad139e54-a7f0-4d09-832c-6b2bf2e93e03@kernel.org>
	<fcc4b719-2696-4f31-bac4-6c07f8ddec47@roeck-us.net>
	<221cc52e-9918-43ea-b196-622a8cc6db05@kernel.org>
	<fd3b2ca7-4d64-4c4b-98a3-7d3285fa6826@roeck-us.net>
	<b5f2a21a-9530-4efe-aed5-cc96aab74e88@kernel.org>
	<20260516132407.GA163589@killaraus.ideasonboard.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 16 May 2026 16:24:07 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> On Sat, May 16, 2026 at 02:29:15PM +0200, Krzysztof Kozlowski wrote:
> > On 16/05/2026 14:23, Guenter Roeck wrote:  
> > > On 5/16/26 05:16, Krzysztof Kozlowski wrote:  
> > >> On 16/05/2026 14:11, Guenter Roeck wrote:  
> > >>> On Sat, May 16, 2026 at 10:05:02AM +0200, Krzysztof Kozlowski wrote:  
> > >>>> What the hell is that:
> > >>>>
> > >>>> https://lore.kernel.org/all/20260515190707.033BDC2BCB0@smtp.kernel.org/
> > >>>>
> > >>>> As a bot you CANNOT MAKE a Reviewer's statement of oversight. You are
> > >>>> not a damn human do be able to make such statement. You are a bot, a tool.
> > >>>>  
> > >>>
> > >>> Where exactly do the rules say that ? I seem to miss that.
> > >>>
> > >>> There is a policy document about _contributions_ made by AI, but I don't
> > >>> see the one that says that AI agents must not provide Reviewed-by: tags.  
> > >>
> > >> Quotes from the existing policy:
> > >>
> > >> 1. "By offering my Reviewed-by: tag, I state that:"
> > >>
> > >> Tool cannot use first person "I". Tool cannot "state that".
> > >>
> > >> 2. "A Reviewed-by tag is *a statement of opinion* that the patch is an
> > >>   appropriate modification of the kernel without any remaining serious"
> > >>
> > >> Tool cannot make a statement of opinion.
> > >>
> > >> 3. "Any interested reviewer (who has done the work) can offer a
> > >> Reviewed-by".
> > >>
> > >> Tool is not a reviewer as a person, thus above does not grant the tool
> > >> permission to offer a tag.  
> > > 
> > > I'd like to see that explicitly spelled out. Until then it is your opinion.  
> > 
> > It is not an opinion. It is written. I gave you quotes.
> > 
> > Do you want to spell the rules of English language? That tool is not a
> > person?
> > 
> > Shall I send the patch like:
> > 
> >   Any interested reviewer (who has done the work) can offer a
> >   Reviewed-by.
> >  +In English "reviewer" is a person [1].
> >  + [1] https://en.wiktionary.org/wiki/reviewer

Agreed. Reviewed-by doesn't apply.

> > 
> > Seriously, you expect to document the English language?
> >   
> > >>>> Stop faking tags.
> > >>>>
> > >>>> And really, considering how many false positives Sashiko produces, how
> > >>>> poor review comments it gives, how many misleading comments, it's
> > >>>> unacceptable to me to consider that a review.
> > >>>>
> > >>>> Amount of useless noise Sashiko produces already changed my mind how
> > >>>> useful that tool is.  
> 
> Note this isn't en entirely new situation. As a maintainer, you know how
> much you trust each reviewer. You will consider some R-b tags as a sign
> you don't even have to look at a patch, and will completely ignore some
> others. There's a whole continuum in the middle. In some ways, reviews
> by an LLM are similar. You will trust them or not trust them.
> 
> Except they're also very different.

This is not different than Coverity, Smatch, syzbot or any other robots (*).

(*) except for the ones that report actual build failures after trying
    to compile the Kernel.

So far, I got just one report from sashiko-bot on a patch series
I wrote for linux-doc. It did get some issues, but it also had false 
positives and it was too verbose for my taste, trying to explain
me why I wrote patches or why I did some changes, and writing 9
patch replies to a 13-patch series.

Even as a developer, I would expect a much cleaner output - and
with my maintainer's hat, just a single e-mail briefly giving
a summary of issues detected at the patch series as a hole
(e.g. just one short e-mail).

>  As such, I think that a R-b from an LLM is misleading and
> doesn't provide good value. At best it's free advertising for company
> making closed-source tools, which I don't think we should encourage.

I disagree. The earliest an issue is reported/fixed, the better.

As a maintainer, I do want that patch developers take reports from 
any bots into account, no matter what technology they use or if
the bot is sponsored by someone or not. Sure, open-source tools
are preferred, but we should not close our eyes to issues,
specially if they can end adding vulnerabilities at the Kernel if
the patches end being applied.

With that in mind, even if LLMs are giving just 20-30% accuracy
of a reviewer, but it has high accuracy picking security issues
that would otherwise be exploited by some LLM tool, I'd say it is
valuable enough.

That said, for LLM tools, I'd say that the report to maintainers/ML
need to be very short:

- What problems a patch series may have in terms of security
  (OOM? privilege escalation? ...);
- What major issues a patch series may have;
- Other medium issues(*).

(*) Issues that are already reported by bots like LKP shall not
    be reported from LLMs to maintainers, as we want to minimize
    duplicated information sent to maintainers as much as possible,
    and LLMs don't replace code compilers nor tools like checkpatch,
    which are more specialized.


Thanks,
Mauro
