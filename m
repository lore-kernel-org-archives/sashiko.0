Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCB8471CF8
	for <sashiko@lists.linux.dev>; Fri,  2 Oct 2026 11:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939188; cv=none; b=ROqJsLfOOqghbyh8O2oXqiDMPFqfE0nXtZ+kLVmx7XtIXTBEoFx0qV/ZFP2wGDLE9b92iYteG++xJZIgwHw9A9T3exNicJyucBiyNY+Ov467qrEdPXcJKAT9JW9zgvAz5znxcfPSZRAkn/HiWNUMz5kyaBQDI/EAaR0TQJvxXsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939188; c=relaxed/simple;
	bh=hyutQG4waCJLNf+2OvC9wy6+A3rMUy5yWvirkDYz+IQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qWqk10V7StKe0Mvn6EPowK0oUh72E9epLIJ3I0jira5UdJq8Kp1n2zICZe7pQy1qioUuTmE7iYZrQuGHtmY3ODaVfFbYOBWSKp1Hp0H5hqfHKrJGnc4tLDleUxjspl1SY+QH9YGUcdFyp1dooo8ggLf/2dSKKZ5quhzSN9h3A+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Onx3ftFz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Onx3ftFz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1C41F000FF;
	Fri,  2 Oct 2026 11:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790939186;
	bh=ptfAy8kdFK+8AIFJFHEzI99V8E0uQkMd7QVRLPmEIqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Onx3ftFzrVVn/7dwfIUyrPzzp/Oc0V9JCXrZVae0A6YvU5aNtYsFQNiBYsNx6inDH
	 GPkyqIuT5+qEtDYcx8F2IiocnztVzyDZCg4B0PYo3Uia+XfxfYLWRVeH//d0FNo6Za
	 ET5wGzWbO5vHO9QleY/O0Loskwpl+7UQOxlp7uCTM39YPHsYIFPzf8AYmaj9rlxog2
	 nfN/or0DQ8CaZAR1ZGDToevehlbETQbGPjs8JEhKoRIX49IxZpKsqp2QEA4trI6g8B
	 6jfH2o+17Og4ud4BFzQhajdjRkJQsLByt1MwM0iNY5pSTx6XTsTLC+cMHtYBORzp10
	 UBD1tPDPSjGjw==
Date: Fri, 2 Oct 2026 12:06:21 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: sashiko@lists.linux.dev, HyeongJun An <sammiee5311@gmail.com>
Subject: Re: addressing sashiko's false positive rate
Message-ID: <ar-Fzs6nZRjoPnkg@gremlin>
References: <arvCuOARoB9LvQqY@gremlin>
 <7ia4fqyst6b2.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ia4fqyst6b2.fsf@castle.c.googlers.com>

+cc Hyeongjun

Hi Roman,

Sorry for taking a while to get to this - I've been sick for a few days which
has slowed me down!

On Tue, Sep 29, 2026 at 03:40:01PM +0000, Roman Gushchin wrote:
> "Lorenzo Stoakes (ARM)" <ljs@kernel.org> writes:
>
> > [adding forgotten sashiko ML to cc's oops!]
> >
> > Hi Roman, Sashiko team,
>
> Hi Lorenzo!
>
> First, thank you for writing this, it's really well written and a lot of
> good stuff here. Really appreciate this.

No worries and thank you! :)

As I say elsewhere, the intent is entirely to improve sashiko and to be
collaborative, I like to take action rather than just moan, hopefully that
intent is clear throughout! :)

>
> > I gave some feedback about false positives at [0], but I thought I'd expand on
> > that and give some solid data.
> >
> > To be clear at the outset - my intent here is to be constructive, I feel that
> > sashiko's false positive rate can be improved and I hope this analysis helps in
> > that regard.
>
> Obviously, I really appreciate any ideas here. I'll think more and dig
> deeper into your data and examples, below are just my quick thoughts
> after reading your email.

Thanks! :)

>
> > I've done analysis on that series [1], my build speed up series [2], and my
> > kvmarm prefault series [3].
> >
> > Series [1] is 39-40 patches over 3 postings, [2] is 20-23 patches over 4
> > postings and [3] is 8-14 patches over 4 postings.
> >
> > This should give at least a reasonable amount of data to work with.
> >
> > I had AI check through them (I find a frontier model + review-prompts is very
> > good at assessing sashiko reports), cross-referencing the changes that were
> > taken and reasoning given, and then went through the verdicts by hand.
> >
> > You state in the README:
> >
> > "The rate of false positives is harder to measure, but based on limited manual
> > reviews it's well within 20% range and the majority of it is a gray
> > zone."
> >
> > I both disagree with that number and feel that there very much are better ways
> > of determining false positives. More on that below.
>
> I think your numbers are naturally lower because you look at complex
> core mm patches which are also well written initially. If you think of

I assume you mean lower meaningful feedback rather than lower false
positives? :)

That's kind of you to say re: well-written, but honestly I do manage to
make dumb mistakes too at v1 :P though less now since I tend to put things
through AI review before sending now!

> the entire kernel, a lot of changes are really bad e.g. driver changes
> with obvious trivial bugs, which are easy to spot.

This has often been the push-back when I've raised false positives before, so I
made sure to diversify my dataset here - 2 of the 3 series are explicitly
not-core mm.

One is a KVM change set (relatively straightforward feature) and another is the
build series (a lot of which is very straightforward stuff).

But I would also play devil's advocate re: seeing more false positives on
better-written series - that's a purer data stream to examine for things
the verifier might be getting wrong, in any case!

>
> But I struggle to find a reasonable way to measure it the false positive
> rate. The numbers I presented at lsfmm were based on analyzing human
> feedback. The same approach now results in _much_ lower numbers, which
> are not realistic. The reason is simple: in many cases people do
> not respond to real findings and silently fix them in v2/v3/etc. So this
> method is not working anymore.

Yeah agreed, the silence on issues is the big issue IMO.

>
> >
> > Analysing the series:
> >
> > Summary, unique findings (duplicates removed)
> > ---------------------------------------------
> >
> >   Series    Unique  Useful  Wrong   Useful%
> >   1           36      20     16       56%   (1 v1 alone: 17 unique, 71%)
> >   2           36      17     19       47%   (2 v1 alone: 18 unique, 61%)
> >   3            3       1      2       33%
> >   Total       75      38     37       51%
> >
> > 'Useful' here means the report was correct, whether the issue was in the
> > series or pre-existing in code it touched. 'Wrong' means the claim does not
> > hold against the code, or holds only under a precondition nothing in-tree
> > meets (a driver violating a documented contract, an unsupported build host,
> > an OOM-only error path) - those were rated High or Critical as often as not,
> > so I count them as false positives.
>
> Not trying to dispute your numbers, just want to say here that the
> usefulness is somewhat subjective and people often do not agree on
> whether something is worth fixing or not.

Sure, which is why I avoided 'worth fixing' - 'wrong' means the claim
doesn't hold against the code, and the CSVs give the reason per row so
anybody can examine + re-score if they like.

Actually the genuinely grey area ones are not that many and don't move the
numbers that much.

>
> > This matches my intuition that I've expressed to you in-person and on-list that
> > the false positive rate is ~50%.
> >
> > I've heard people say this was limited to mm specifically, but now I've seen
> > this pattern across 3 subsystems (mm, kvmarm, kbuild) so I feel it's more
> > generalised.
> >
> > What concerns me here is that the rate doesn't seem to have improved over time,
> > which makes me think it's less a model issue and more sashiko needing to be
> > sharper at dismissing false positives.
>
> Hm, given that Sashiko is using the same model from the start, I'd make
> the opposite conclusion :)

Haha well that's fair. Though keeping that the same means we can observe
quite cleanly what changes to the verifier makes!

Though it does indicate that the prompt/verifier changes so far haven't
really moved that too much!

>
> From my experiments it looks like there is a non-trivial amount of
> issues (~20%) where the current model can't reliably say if the issue is
> real or not. It's easy to bias it to the desired direction, but it's
> hard (or at least Idk how) to improve the false positive rate without
> damaging the recall.

In the infamous words of claude, I'd like to gently push back on that :P

The verifier is already filtering out ~95% of stuff, and if what you say is
right then you're already throwing out a lot of those?

And half of what it passes through is wrong.

So this is less a precision thing and more that the verifier is
discriminating poorly and possibly losing in both directions?

An experiment that could help settle it - run the verifier over the 112
scored findings from the .CSV files (though note 37 or the 112 are
duplicates) - and see how often its pass/dismiss agrees with the human
verdict.

That should give a direct measure of discrimination, independent of where
the threshold for reporting is at.


>
> That said there were some changes aimed at improving the false positive
> rate, but it sounds like the effect was limited (which I can easily believe).

Yeah, it doesn't seem to have made much difference, based on my data.

>
> > The per-posting numbers are also interesting:
> >
> > Unique findings by posting (duplicates within and across postings removed)
> > --------------------------------------------------------------------------
> >
> >   Series  Posting   Raw  Dup  Unique  Useful  Wrong   Useful%  Wrong%
> >   ------  -------   ---  ---  ------  ------  -----   -------  ------
> >   1 mm    v1         24    7      17      12      5       71%     29%
> >   1 mm    v2         17    2      15       8      7       53%     47%
> >   1 mm    v3          9    5       4       0      4        0%    100%
> >   ------  -------   ---  ---  ------  ------  -----   -------  ------
> >   2 kbld  v1         20    2      18      11      7       61%     39%
> >   2 kbld  v2         11    5       6       3      3       50%     50%
> >   2 kbld  v3         15    9       6       3      3       50%     50%
> >   2 kbld  v4         12    6       6       0      6        0%    100%
> >   ------  -------   ---  ---  ------  ------  -----   -------  ------
> >   3 kvma  v1          0    0       0       -      -         -       -
> >   3 kvma  v2          3    1       2       0      2        0%    100%
> >   3 kvma  v3          1    0       1       1      0      100%      0%
> >   3 kvma  v4          0    0       0       -      -         -       -
> >   ------  -------   ---  ---  ------  ------  -----   -------  ------
> >   Total             112   37      75      38     37       51%     49%
> >
> > As you'd expect, the real issues are fixed on respin.
> >
> > However, what's interesting is the continued false positive rate that
> > remains: the number of wrong reports per posting stays roughly constant
> > (5, 7, 4 for mm and 7, 3, 3, 6 for kbuild) while the real issues run out,
> > so on the final posting of each series everything emitted was wrong.
>
> > This is good evidence for there being a problem with sashiko's verifier -
> > these numbers are de-duplicated across revisions - so it is allowing
> > arbitrary new invalid reports through on each occasion.
>
> Well, sashiko in the current form has absolutely no cross-version
> context. And your numbers are somewhat understandable from the LLM
> "character" standpoint: when asked to find bugs LLMs tend to find
> something and if there are real issues (as in earlier version) it finds
> them and if there are none, it starts nit-picking.

Right and I think that's where we can really improve things here - with
thread and previous-version context, that's more evidence that it can weigh
things on.

>
> I'm not trying to protect it, just saying that it's not surprising to me.

Sure, of course, and it's interesting as above - it's a lever we can pull
here to improve things potentially!

>
> > Severity is an interesting breakdown also:
> >
> > By severity, raw, all series combined
> > -------------------------------------
> >
> >   Severity  Findings  Useful  Wrong  Duplicate  Useful%  Useful% unique
> >   Critical      4        3      0       1        75%       100%
>
> I'm glad this works well.

Yeah :) that's some really nice data here actually. Though sadly low N, I
can try to keep digging stuff out on things I work on here too.

>
> >   High         53       18     18      17        34%        50%
>
> And sad that this doesn't. This is what I want to improve.

Yeah :(

Though all this feels like the verifier layer more than anything.

>
> >   Medium       27       11     11       5        41%        50%
> >   Low          28        6      8      14        21%        43%
> >
> > Every 'critical' was a real bug (barring the duplicate). Below that it's
> > a coin flip regardless of severity, so the severity label isn't currently
> > usable as a confidence signal.
>
> And it's by design. Severity is orthogonal to confidence. A
> I-am-not-100%-sure memory corruption is still worth taking seriously.

That's reasonable, but could this be brought out more clearly? 'High, low
confidence' reads quite differently from 'High, high confidence'.

Not sure if it could be numerical, but even a sliding scale of confidence
could be helpful there!

>
> > What helps bring this together is that the API exposes the candidate
> > concerns the verifier dismissed for each posting, alongside what it emitted:
> >
> > Candidates generated vs. emitted vs. useful
> > -------------------------------------------
> >
> >   Posting   Candidates dismissed   Emitted   Useful   Useful / all candidates
> >   1 v1            287                24        12          4.0%
> >   1 v2            275                17         8          2.8%
> >   1 v3            276                 9         0          0%
> >   2 v1            162                20        11          6.0%
> >   2 v2            158                11         3          1.8%
> >   2 v3            138                15         3          2.0%
> >   2 v4            151                12         0          0%
> >   3 v1             89                 0         0          0%   (not sent)
> >   3 v2            123                 3         0          0%
> >   3 v3            116                 1         1          0.9%
> >   3 v4            138                 0         0          0%
> >   ------------------------------------------------------------------------
> >   Total          1913               112        38          1.9%
> >
> > So the emailed reports are already the ~5% of candidates that survived
> > internal verification, and roughly half of those survivors are still
> > wrong. This helps back up the idea that the verifier is not quite doing its
> > job properly, in line with the per-posting numbers above.
> >
> > The model doesn't seem to be the issue: I raised a ~50% hit rate just over
> > 6 months ago ([4]), and the API shows that series was reviewed by the same
> > model, gemini-3.1-pro-preview, as every posting analysed here.
> >
> > Also on that - I gathered from previous discussions that model improvement
> > was being leaned upon for accuracy improvements moving forwards. Has the
> > model behind that version string actually changed over the six months, or
> > has it been identical throughout?
>
> As I said, it's exactly the same model. I'm not sure I understand your
> logic on why model is not the issue here. I believe some lift can be
> achieved by better prompting and/or burning more tokens on the
> verification, but I also feel the model plays a big role here.
>
> > If the latter, is there any intention to upgrade it over time? If the
> > former, the data above suggests it hasn't moved the false positive
> > rate.
>
> As soon as a better pro model will be publicly available, I'll switch.
>
> > Also it seems the newer prompt versions didn't do much to address the issue
> > as below:
> >
> > Prompt versions
> > ---------------
> >
> >   Posting     Date     Model                    Prompts
> >   ----------  -------  -----------------------  -------
> >   kvmarm v1   25 Aug   gemini-3.1-pro-preview   0.3.3
> >   mm v1        8 Sep   gemini-3.1-pro-preview   0.3.3
> >   kbuild v1    8 Sep   gemini-3.1-pro-preview   0.3.4
> >   mm v2       14 Sep   gemini-3.1-pro-preview   0.4.0
> >   kbuild v2   14 Sep   gemini-3.1-pro-preview   0.3.4
> >   kvmarm v2   14 Sep   gemini-3.1-pro-preview   0.3.4
> >   mm v3       17 Sep   gemini-3.1-pro-preview   0.4.0
> >   kbuild v3   17 Sep   gemini-3.1-pro-preview   0.4.0
> >   kvmarm v3   22 Sep   gemini-3.1-pro-preview   0.4.0
> >   kbuild v4   23 Sep   gemini-3.1-pro-preview   0.4.0
> >   kvmarm v4   23 Sep   gemini-3.1-pro-preview   0.4.0
> >
> > So all this I think has a positive edge to it - by improving the verifier
> > we can probably improve the false positive rate.
> >
> > Some suggestions:
> >
> > 1. Sample a random subset of series authors to assess which of the reports
> >    sent were considered accurate. This is a good methodology for actual false
> >    positive rate.
>
> I do this and plan to implement a continuous analysis of human feedback
> by sashiko.

Ah that's great then!

Not such a crazy new insightful idea then after all :P

>
> >
> > 2. Do the same, only for a random set of _dismissed_ candidates - check to
> >    see if anything good is being thrown out. Only you can do this one, as
> >    the dismissed candidates and the verifier's reasoning are in your records
> >    but never sent to anybody.
>
> I do this on the benchmark set and yes a lot of good stuff is being thrown
> out. Just landed a series of fixes to improve this.

Awesome!

>
> > 3. You could even get a weak signal from detecting whether code at the report
> >    site was altered or not, that wouldn't require voluntary input.
>
> Agree.

Thanks yeah this might be the single biggest lever here, Hyeongjun has
already tried this on three only lists (see his reply) with interesting
data, so there's definitely something to build on with that!

>
> >
> > It feels like step 1 could be really useful for honing/training the verifier to
> > be more accurate.
> >
> > A couple of requests:
> >
> > 1. An ability to mark something as a false positive so this data can proactively
> >    be provided to you to help improve things.
> >
> > 2. An ability to mark reports as 'rejected' so they are not re-emitted in each
> >    respin, it's a real issue at the moment: a third of everything emitted
> >    across these 11 postings was a repeat, and on later postings the repeats
> >    plus new false positives are all there is.
>
> I implemented it already for preexisting issues which are now handled
> separately and not reported together with new issues (which might also
> slightly improve the false positive rate - we simple will have more
> tokens per new issue in the verification stage). They are now put into
> the database accessible to corresponding maintainers ("bugs" button on
> the frontend).

OK that's nice for pre-existing issues, which should help also.

(I guess for mm maintainers is less clear of a thing atm as Andrew is
technically the maintainer right now as he sends to Linus, but we have a
bunch of sub-maintainers and that's changing - David temporarily - then
later a committee for -> Linus likely but yeah always complications in the
kernel :)

>
> Re an ability to reject new bugs in posted series it's more complicated. Humans
> are sometimes wrong too (even without talking malicious actors). So at
> least Sashiko should verify claims if possible.

Agree it shouldn't be blind, but a maintainer saying no on-list is already
how things work for how things actually get rejected upstream, so it should
at least be a strong signal I think?

'The author said X in reply to this report on vN, is X valid?' could work
maybe?

>
> > It'd be nice to update that section in the README about the false positive
> > rate, though if so it's important to define what counts as a false positive
> > and which denominator is being used (unique reports, total reports,
> > etc.).
>
> Yeah, it's complicated. Maybe I should drop it altogether.

Yeah I think dropping it is the easiest route as people will debate the
numbers forever.

The alternative is to give very clear definitions about stuff but that
feels like something which doesn't belong in a README.

But once we have better data on that could do that and maybe link to some
document with methodology etc. etc.

Anyway yeah we're all busy af so dropping easiest, or saying (accurately!)
that we're looking at that data but it's uncertain.

>
> Idk if we ever can get a nice stable number we agree on because people rely
> more and more on ai to generate patches (or at least assist) and run
> some sort of ai review (e.g. sashiko, but not only) locally, so I expect
> the quality of patches rise and it might lead to a higher false positive
> rate.
>
> But I'm totally open for a discussion here.

Great! :)

I keep giving myself extra work to do (build series, this, etc.) for some
reason :P

What's useful here is all the data can be kept in-thread etc.

>
> Thanks
>
> PS I look deeper into your examples and comment later, also I expect a
> lot of related discussions at LPC next week

Ack happy to chat there too! Not sure on what microconf's etc. I'm going to
there or my schedule other than the mm microconf (co-running it with David).

No worries if we don't get a chance to get into any detail, LPC is always
insanely busy, but be good to say hi at least :) or have a pint ;)

--
Cheers, Lorenzo
