Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9034534BB
	for <sashiko@lists.linux.dev>; Fri,  2 Oct 2026 11:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790940194; cv=none; b=Wv4ox3k3B3m8JXuiVtqhZyxCjBAvCl/iqboCPvDOxaq61VSGg++XLsjZnBNS+t3f/5CbrzpGzjLfs6yZKar7egpPAALv7l1O4a08u7iFpg1/hy556h3hKnmLGex9v2opesgK7eTilu8u3Tjb7sdxWh3wts20JH6m88OCvOJMt8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790940194; c=relaxed/simple;
	bh=BhjXp4wNVZAtNE+bfyNYOcsJ7lXhjAlK/oCr0aNu2z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DScaIoL1DSzeVhUBUbQ4WFV47nqcgVuN5Bmyaeg5OvI8g7iHt68v3AHlMyQesMh0s/MfJQbAx7oJ+bTMu/lcMM2iHhmtw4KTzCikU8/iRIUKviZDXCm8Xd1PMdHjlKYaLb02cAPxHjHXG7f3NI8IWnPEZcDhhf+DWqeHlkRJh+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=njvQuPNX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="njvQuPNX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D7AD1F000FF;
	Fri,  2 Oct 2026 11:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790940192;
	bh=1/HwddHKdkG8eK5FzipaI8RCOQI2U9PGnOMfq2PmDOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=njvQuPNXDPsPwTamysBl7hcZKWGdZGaWhvU7vy74FWJrGa3dyQddL9jhxMM8HwYI9
	 XluO/TWs4V/9moD/KX4m3L3qjGKtzolWJpic3kzjEomUfl/ajwC/VSo7KWQQZC3njZ
	 zIXiZWP3fa4evDlIp1pEt9lvC0B+98KqYPDl8YY6wY/RBjTRLczC0tR/Elq3ns9UIX
	 /PV8iIpU+uQmgOVQcpRCotVPX/3aqTRObVXKTsXpEKd7xKM0Y8sYugq6EOOIr+O35/
	 5FcQUx8f++N3epWv7WU3GvNPFHiLigOQoo+bcDJu3DEg/3JDDxnvhO7sKXYXvf379V
	 msKAh6FTAR3GQ==
Date: Fri, 2 Oct 2026 12:23:08 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, sashiko@lists.linux.dev
Subject: Re: addressing sashiko's false positive rate
Message-ID: <ar-QOL_Wk6oWe_G7@gremlin>
References: <7ia4fqyst6b2.fsf@castle.c.googlers.com>
 <20261002085628.1955443-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002085628.1955443-1-sammiee5311@gmail.com>

Hi HyeongJun,

Thanks for doing this! :)

On Fri, Oct 02, 2026 at 05:56:28PM +0900, HyeongJun An wrote:
> On Tue, Sep 29, 2026, Lorenzo Stoakes (ARM) wrote:
> > 3. You could even get a weak signal from detecting whether code at the report
> >    site was altered or not, that wouldn't require voluntary input.
>
> On Tue, Sep 29, 2026, Roman Gushchin wrote:
> > Agree.
>
> I tried this on three lists to see how weak the signal is.
>
> I took Sashiko reviews from 2026-06-15 to 2026-08-31 on linux-input and
> bpf, from the review emails, and on netdev, from the sashiko.dev API.
> For each finding not marked pre-existing, I found the next version of
> the same patch on the list. If the code the finding points at changed
> there, I counted it as acted on. If it is unchanged, as ignored. Then an
> LLM checked 50 random findings per list against the next version.
>
>                                  input    bpf      netdev
>   findings judged                501      578      1899
>   acted on, LLM check            21/35    13/31    12/37
>   automatic label correct        27/35    29/31    30/37
>   LLM check undecided            15/50    19/50    13/50

So that's 30-60% hit rate which broadly matches my experience.

My data spanned 3 subsystems, so this brings that up to 6 - this is feeling
more and more like a verified measure.

Though of course it's relatively rough, that feels pretty confirmatory!

I think that does at this point pretty well rule out mm being different as
an explanation.

>
> This measures whether the author changed the code, not whether the
> finding was right, so it does not compare directly with Lorenzo's
> useful/wrong split. It also leaves out pre-existing findings and does
> not deduplicate across versions.

Ack yeah - that's all we can hope for with this really, as you only observe
the code changing, not why or if related, or duplicated etc.

These are inaccurate in that you don't know if ignored or unrelated change
or etc. etc. and mine are inaccurate in that my judgement might be wrong
also.

But the numbers are inaccurate in different directions and both seem to be
mutually confirmatory that the false positive rate is a lot more than 20%.

What's useful here is that this can be used to improve this in the verifier
- I've found that a bounded measure like this is the best way to get an LLM
to improve things and usually fairly rapidly too!

>
> The automatic label matched the LLM check 77% to 94% of the time. It
> mostly misses fixes that only reorder lines or that change code away
> from the snippet the finding quotes, so "unchanged" over-counts ignored
> findings. As a weak signal for picking candidates it works. As a
> verdict on its own it does not.

Yeah of course as above that's all we could expect.

>
> Lorenzo's point about repeats shows up here too. A finding that Make
> drops the space in $(if $(3), $(3)) was raised on v6, v7 and v8 of the
> selftests/bpf Makefile series. Running make shows the space is kept.
> https://lore.kernel.org/all/20260921075855.2065871-4-nickolay.lysenko@gmail.com/

Yeah duplication is very much an issue.

It also means repeats inflate your 'ignored' count so de-duping would
likely move your 'acted on' number up a bit.

>
> Some authors already mark findings as rejected themselves, in their
> changelogs. A bpf v3 changelog has a "To sashiko:" section, and a quic
> changelog starts with "Sashiko, do not report any of the following
> concerns". That text could feed the "rejected" marking Lorenzo asked
> for without anyone being asked to label.
> https://lore.kernel.org/all/20260808140720.293604-2-jiayuan.chen@linux.dev/
> https://lore.kernel.org/all/375ee7fe827d9df248a27a8072c84a7c167fc50a.1789393775.git.lucien.xin@gmail.com/

This is really useful - it's a free data source that's more accurate and
helps address the cross-version stuff Roman mentioned is currently not a
signal, and it's a sign there's already data out there to use.

(I've previously even replied to private sashiko reports - though cc'd to
sashiko-reviews I think - for instance, I'm sure others do similar, as well
as general replies on-list saying whether sashiko right/not).

Consuming these and treating as higher confidence could be very useful!

>
> On pre-existing issues, my data predates the split you just landed. In
> the 907 netdev patchsets I fetched, the preexisting flag was set on 38%
> of Critical and 37% of High findings, against 4% of Medium and none of
> Low. So separating them should remove a large share of the severe
> noise.

Yeah should be interesting to compare the numbers before/after!

>
> I would like to work on this in Sashiko, in small steps:
>
> 1. A script under scripts/ that reports this signal per subsystem from
>    Sashiko's own data, run by hand and never in CI.
> 2. Collecting findings that came back unchanged on a later version, or
>    that an author rebutted in a changelog, as candidate negative cases
>    for the benchmark. A person confirms each one before it is added,
>    which is one way to answer #426.

Obviously up to Roman and the team but sounds good to me :)

For 2. I included .csv reports for sashiko's 112 findings in my original
mail which could be used as seed data?

>
> Would that be welcome, or would you rather fold it into the continuous
> analysis you mentioned? Either way the scripts and the verdicts, each
> with a one-line reason, are ready to share. I used an LLM to help write
> the scripts.

I also think it could be helpful to have an LLM consume the retrieved data
and see how it can use it to improve the verifier.

Maybe have it do some A/B stuff too and churn away at it modifying the
verifier until it gets better results?

It's important to avoid overfitting to the data though - so you'd want to
use different subsets of scored data in each candidate dataset to avoid
that.

I was thinking of trying something like that myself but I have negative
available time for new stuff.

But could play with it on a weekend here or there or something... :)

>
> Thanks,
> HyeongJun

--
Cheers, Lorenzo
