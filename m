Received: from mta0.migadu.com (out-235.mta0.migadu.com [91.218.175.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F733D3008
	for <sashiko@lists.linux.dev>; Tue, 29 Sep 2026 15:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790696410; cv=none; b=uKxd18r9SPifyZcZ4jB2L5wuNiaKl3bI8fv2B/zdX6Hx55FHo+60IPd0g+Scg0peGBjcbvgTOSDtlRswvoUfFl8B0q1QSRqwwhVHX7yb5Aq8aB2xLNGzm+gSLsvTvBlnigtFk+0YQhu2O4tXey//3oNVZtceDYWbBOYV2uwf35o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790696410; c=relaxed/simple;
	bh=ZlTClWTPa0BA31a8u4nfkFDbjd1k8rOz+nQ0OjZ4wvg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WYXKZlluCKlFEZNrmO6TGp4ETTDM+rdbjTqYtNOEVQi2oAtl5cJVZVQbz8uBqi/YFVBkwIF1tDLLASDDDxN6L5AusKNuBnxWUgPH2ik3G11UQ5B6KJMFzewDm5m2yZv32QyrcZqvYnHiW5ox2Db6wa7QmrYWmvWPzwEJR5W6BY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hdiFd/o6; arc=none smtp.client-ip=91.218.175.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hdiFd/o6"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=ZlTClWTPa0BA31a8u4nfkFDbjd1k8rOz+nQ0OjZ4wvg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790696404; v=1; x=1791301204;
 b=hdiFd/o6PIF67xUsklZZkqWaWASLC1Mu7utqdAPp6TOnkq6/7ahxPMr3QGs5tt9ZL/BuMUPj
 nl2TbXPojMpDZ1Mk/jQCuxZ1SeYfawZrJA5rcAGrB07c/npfKJNxVWC/YB+pG5PqoeHR09hnz1g
 LD6pDCvFN53g0g0k25Wfz9Jg=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id 480b47c6160ab326;
	Tue, 29 Sep 2026 15:40:04 +0000
X-Mizu-Trace-ID: 480b47c6160ab326
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: sashiko@lists.linux.dev
Subject: Re: addressing sashiko's false positive rate
In-Reply-To: <arvCuOARoB9LvQqY@gremlin> (Lorenzo Stoakes's message of "Tue, 29
	Sep 2026 14:53:32 +0100")
References: <arvCuOARoB9LvQqY@gremlin>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Tue, 29 Sep 2026 15:40:01 +0000
Message-ID: <7ia4fqyst6b2.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Lorenzo Stoakes (ARM)" <ljs@kernel.org> writes:

> [adding forgotten sashiko ML to cc's oops!]
>
> Hi Roman, Sashiko team,

Hi Lorenzo!

First, thank you for writing this, it's really well written and a lot of
good stuff here. Really appreciate this.

> I gave some feedback about false positives at [0], but I thought I'd expand on
> that and give some solid data.
>
> To be clear at the outset - my intent here is to be constructive, I feel that
> sashiko's false positive rate can be improved and I hope this analysis helps in
> that regard.

Obviously, I really appreciate any ideas here. I'll think more and dig
deeper into your data and examples, below are just my quick thoughts
after reading your email.

> I've done analysis on that series [1], my build speed up series [2], and my
> kvmarm prefault series [3].
>
> Series [1] is 39-40 patches over 3 postings, [2] is 20-23 patches over 4
> postings and [3] is 8-14 patches over 4 postings.
>
> This should give at least a reasonable amount of data to work with.
>
> I had AI check through them (I find a frontier model + review-prompts is very
> good at assessing sashiko reports), cross-referencing the changes that were
> taken and reasoning given, and then went through the verdicts by hand.
>
> You state in the README:
>
> "The rate of false positives is harder to measure, but based on limited manual
> reviews it's well within 20% range and the majority of it is a gray
> zone."
>
> I both disagree with that number and feel that there very much are better ways
> of determining false positives. More on that below.

I think your numbers are naturally lower because you look at complex
core mm patches which are also well written initially. If you think of
the entire kernel, a lot of changes are really bad e.g. driver changes
with obvious trivial bugs, which are easy to spot.

But I struggle to find a reasonable way to measure it the false positive
rate. The numbers I presented at lsfmm were based on analyzing human
feedback. The same approach now results in _much_ lower numbers, which
are not realistic. The reason is simple: in many cases people do
not respond to real findings and silently fix them in v2/v3/etc. So this
method is not working anymore.

>
> Analysing the series:
>
> Summary, unique findings (duplicates removed)
> ---------------------------------------------
>
>   Series    Unique  Useful  Wrong   Useful%
>   1           36      20     16       56%   (1 v1 alone: 17 unique, 71%)
>   2           36      17     19       47%   (2 v1 alone: 18 unique, 61%)
>   3            3       1      2       33%
>   Total       75      38     37       51%
>
> 'Useful' here means the report was correct, whether the issue was in the
> series or pre-existing in code it touched. 'Wrong' means the claim does not
> hold against the code, or holds only under a precondition nothing in-tree
> meets (a driver violating a documented contract, an unsupported build host,
> an OOM-only error path) - those were rated High or Critical as often as not,
> so I count them as false positives.

Not trying to dispute your numbers, just want to say here that the
usefulness is somewhat subjective and people often do not agree on
whether something is worth fixing or not.

> This matches my intuition that I've expressed to you in-person and on-list that
> the false positive rate is ~50%.
>
> I've heard people say this was limited to mm specifically, but now I've seen
> this pattern across 3 subsystems (mm, kvmarm, kbuild) so I feel it's more
> generalised.
>
> What concerns me here is that the rate doesn't seem to have improved over time,
> which makes me think it's less a model issue and more sashiko needing to be
> sharper at dismissing false positives.

Hm, given that Sashiko is using the same model from the start, I'd make
the opposite conclusion :)

From my experiments it looks like there is a non-trivial amount of
issues (~20%) where the current model can't reliably say if the issue is
real or not. It's easy to bias it to the desired direction, but it's
hard (or at least Idk how) to improve the false positive rate without
damaging the recall.

That said there were some changes aimed at improving the false positive
rate, but it sounds like the effect was limited (which I can easily believe).

> The per-posting numbers are also interesting:
>
> Unique findings by posting (duplicates within and across postings removed)
> --------------------------------------------------------------------------
>
>   Series  Posting   Raw  Dup  Unique  Useful  Wrong   Useful%  Wrong%
>   ------  -------   ---  ---  ------  ------  -----   -------  ------
>   1 mm    v1         24    7      17      12      5       71%     29%
>   1 mm    v2         17    2      15       8      7       53%     47%
>   1 mm    v3          9    5       4       0      4        0%    100%
>   ------  -------   ---  ---  ------  ------  -----   -------  ------
>   2 kbld  v1         20    2      18      11      7       61%     39%
>   2 kbld  v2         11    5       6       3      3       50%     50%
>   2 kbld  v3         15    9       6       3      3       50%     50%
>   2 kbld  v4         12    6       6       0      6        0%    100%
>   ------  -------   ---  ---  ------  ------  -----   -------  ------
>   3 kvma  v1          0    0       0       -      -         -       -
>   3 kvma  v2          3    1       2       0      2        0%    100%
>   3 kvma  v3          1    0       1       1      0      100%      0%
>   3 kvma  v4          0    0       0       -      -         -       -
>   ------  -------   ---  ---  ------  ------  -----   -------  ------
>   Total             112   37      75      38     37       51%     49%
>
> As you'd expect, the real issues are fixed on respin.
>
> However, what's interesting is the continued false positive rate that
> remains: the number of wrong reports per posting stays roughly constant
> (5, 7, 4 for mm and 7, 3, 3, 6 for kbuild) while the real issues run out,
> so on the final posting of each series everything emitted was wrong.

> This is good evidence for there being a problem with sashiko's verifier -
> these numbers are de-duplicated across revisions - so it is allowing
> arbitrary new invalid reports through on each occasion.

Well, sashiko in the current form has absolutely no cross-version
context. And your numbers are somewhat understandable from the LLM
"character" standpoint: when asked to find bugs LLMs tend to find
something and if there are real issues (as in earlier version) it finds
them and if there are none, it starts nit-picking.

I'm not trying to protect it, just saying that it's not surprising to me.

> Severity is an interesting breakdown also:
>
> By severity, raw, all series combined
> -------------------------------------
>
>   Severity  Findings  Useful  Wrong  Duplicate  Useful%  Useful% unique
>   Critical      4        3      0       1        75%       100%

I'm glad this works well.

>   High         53       18     18      17        34%        50%

And sad that this doesn't. This is what I want to improve.

>   Medium       27       11     11       5        41%        50%
>   Low          28        6      8      14        21%        43%
>
> Every 'critical' was a real bug (barring the duplicate). Below that it's
> a coin flip regardless of severity, so the severity label isn't currently
> usable as a confidence signal.

And it's by design. Severity is orthogonal to confidence. A
I-am-not-100%-sure memory corruption is still worth taking seriously.

> What helps bring this together is that the API exposes the candidate
> concerns the verifier dismissed for each posting, alongside what it emitted:
>
> Candidates generated vs. emitted vs. useful
> -------------------------------------------
>
>   Posting   Candidates dismissed   Emitted   Useful   Useful / all candidates
>   1 v1            287                24        12          4.0%
>   1 v2            275                17         8          2.8%
>   1 v3            276                 9         0          0%
>   2 v1            162                20        11          6.0%
>   2 v2            158                11         3          1.8%
>   2 v3            138                15         3          2.0%
>   2 v4            151                12         0          0%
>   3 v1             89                 0         0          0%   (not sent)
>   3 v2            123                 3         0          0%
>   3 v3            116                 1         1          0.9%
>   3 v4            138                 0         0          0%
>   ------------------------------------------------------------------------
>   Total          1913               112        38          1.9%
>
> So the emailed reports are already the ~5% of candidates that survived
> internal verification, and roughly half of those survivors are still
> wrong. This helps back up the idea that the verifier is not quite doing its
> job properly, in line with the per-posting numbers above.
>
> The model doesn't seem to be the issue: I raised a ~50% hit rate just over
> 6 months ago ([4]), and the API shows that series was reviewed by the same
> model, gemini-3.1-pro-preview, as every posting analysed here.
>
> Also on that - I gathered from previous discussions that model improvement
> was being leaned upon for accuracy improvements moving forwards. Has the
> model behind that version string actually changed over the six months, or
> has it been identical throughout?

As I said, it's exactly the same model. I'm not sure I understand your
logic on why model is not the issue here. I believe some lift can be
achieved by better prompting and/or burning more tokens on the
verification, but I also feel the model plays a big role here.

> If the latter, is there any intention to upgrade it over time? If the
> former, the data above suggests it hasn't moved the false positive
> rate.

As soon as a better pro model will be publicly available, I'll switch.

> Also it seems the newer prompt versions didn't do much to address the issue
> as below:
>
> Prompt versions
> ---------------
>
>   Posting     Date     Model                    Prompts
>   ----------  -------  -----------------------  -------
>   kvmarm v1   25 Aug   gemini-3.1-pro-preview   0.3.3
>   mm v1        8 Sep   gemini-3.1-pro-preview   0.3.3
>   kbuild v1    8 Sep   gemini-3.1-pro-preview   0.3.4
>   mm v2       14 Sep   gemini-3.1-pro-preview   0.4.0
>   kbuild v2   14 Sep   gemini-3.1-pro-preview   0.3.4
>   kvmarm v2   14 Sep   gemini-3.1-pro-preview   0.3.4
>   mm v3       17 Sep   gemini-3.1-pro-preview   0.4.0
>   kbuild v3   17 Sep   gemini-3.1-pro-preview   0.4.0
>   kvmarm v3   22 Sep   gemini-3.1-pro-preview   0.4.0
>   kbuild v4   23 Sep   gemini-3.1-pro-preview   0.4.0
>   kvmarm v4   23 Sep   gemini-3.1-pro-preview   0.4.0
>
> So all this I think has a positive edge to it - by improving the verifier
> we can probably improve the false positive rate.
>
> Some suggestions:
>
> 1. Sample a random subset of series authors to assess which of the reports
>    sent were considered accurate. This is a good methodology for actual false
>    positive rate.

I do this and plan to implement a continuous analysis of human feedback
by sashiko.

>
> 2. Do the same, only for a random set of _dismissed_ candidates - check to
>    see if anything good is being thrown out. Only you can do this one, as
>    the dismissed candidates and the verifier's reasoning are in your records
>    but never sent to anybody.

I do this on the benchmark set and yes a lot of good stuff is being thrown
out. Just landed a series of fixes to improve this.

> 3. You could even get a weak signal from detecting whether code at the report
>    site was altered or not, that wouldn't require voluntary input.

Agree.

>
> It feels like step 1 could be really useful for honing/training the verifier to
> be more accurate.
>
> A couple of requests:
>
> 1. An ability to mark something as a false positive so this data can proactively
>    be provided to you to help improve things.
>
> 2. An ability to mark reports as 'rejected' so they are not re-emitted in each
>    respin, it's a real issue at the moment: a third of everything emitted
>    across these 11 postings was a repeat, and on later postings the repeats
>    plus new false positives are all there is.

I implemented it already for preexisting issues which are now handled
separately and not reported together with new issues (which might also
slightly improve the false positive rate - we simple will have more
tokens per new issue in the verification stage). They are now put into
the database accessible to corresponding maintainers ("bugs" button on
the frontend).

Re an ability to reject new bugs in posted series it's more complicated. Humans
are sometimes wrong too (even without talking malicious actors). So at
least Sashiko should verify claims if possible.

> It'd be nice to update that section in the README about the false positive
> rate, though if so it's important to define what counts as a false positive
> and which denominator is being used (unique reports, total reports,
> etc.).

Yeah, it's complicated. Maybe I should drop it altogether.

Idk if we ever can get a nice stable number we agree on because people rely
more and more on ai to generate patches (or at least assist) and run
some sort of ai review (e.g. sashiko, but not only) locally, so I expect
the quality of patches rise and it might lead to a higher false positive
rate.

But I'm totally open for a discussion here.

Thanks

PS I look deeper into your examples and comment later, also I expect a
lot of related discussions at LPC next week
