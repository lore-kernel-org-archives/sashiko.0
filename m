Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0710E3FDBF8;
	Sun, 18 Oct 2026 18:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792348910; cv=none; b=h2LOFLSXXbcTpcwDPU9kwTk46aR9cfx4Ns0CiiTRug0uS7+JG56tZUpZzrP0Uccykkf90LFZ9HWaUnthrkSDV+qb+rlzwfnJtoD435eou/kaRo0jjrDpwKgrnt1NcKgRTmLw175SAOMKmo5Cmynkg1ASlhuVUHDjymbb0U+ZMAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792348910; c=relaxed/simple;
	bh=o0SUA/x9RaiAJF/9hpQp8Plny9lRz5gFkhoLTwuopAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E7CN4FfBgIaZuWqvPqgc+8VAfUMb164DI7a1rwUX+cRym1AH3cLU/ru2RC7Vf8a37xKqZwso6FTPvE8ZOVG/U1NQvz1ldP+AWFXIkatqn8+/VjUFS6W0VRsftXW2VIkPp/6Mqfwnn4ck4/f270oBmZerHly0gQ8M69fYVSOp8p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=StpjF/sy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="StpjF/sy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A31C1F000C4;
	Sun, 18 Oct 2026 18:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792348909;
	bh=Wlq3hjEMy59nG0gLjHFuR+V+NzOeFE+X+6KBywNzOSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=StpjF/syBfcv6H3XjPE6UfoIx6YZciNpkHS+hy9NBVUT2DBaahY1lZikWSGnb/Pd6
	 Nc4pHsveCLvgFPt9+MRa92Kwyr67iZDd1PV4Uk1dMQ5W5XzxokLAFkoO2R9/gRJrnp
	 l0Z3LhWAybgVdb+qRslBsc3YiNaNg/oIxCCPoupBUY83Joj026LIIWN5WZPL5twDuW
	 T+U9k1Rgla4HHTdUQkdaODaOW70YtGEVS+BKTsHLjhf04UQQ6OYK3xAhLBx9x0aauL
	 RSO4j02Z2Cl/2l/jhAmtduGlVbX02DlgUi0iRWIadY1SWcQjaHNKoZ3DwpNhcrPuGu
	 whM2zx9iRlwrA==
Date: Sun, 18 Oct 2026 11:41:49 -0700
From: Kees Cook <kees@kernel.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Jiri Kosina <jikos@kernel.org>, ksummit@lists.linux.dev,
	sashiko@lists.linux.dev
Subject: Re: Patch pre-submission to Sashiko
Message-ID: <202610181138.E3AC979EF@keescook>
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>
 <CAHk-=wj24dSSRDQjvkmcw9LMC=K86d-Xys9=qX=gKoXgrQN1UQ@mail.gmail.com>
 <7ia47bjg141n.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ia47bjg141n.fsf@castle.c.googlers.com>

On Sat, Oct 17, 2026 at 08:10:44PM +0000, Roman Gushchin wrote:
> Linus Torvalds <torvalds@linux-foundation.org> writes:
> > On Sat, 17 Oct 2026 at 07:39, Jiri Kosina <jikos@kernel.org> wrote:
> >>
> >> Another option I'd like to propose would be to introduce a way for
> >> submitters to run patches through back-and-forth with Sashiko even before
> >> properly submitting the Sashiko-polished v1 to maintainers and
> >> mailinglists.
> >
> > I think maybe we should make it really easy for people to run their
> > some kind of sashiko setup on their own, rather than rely on sashiko
> > itself. After all, these are all people who use an LLM to begin with.
> 
> It is really easy now:
> $ cargo install sashiko
> $ sashiko init
> set the LLM key
> $ cd linux && sashiko review HEAD^5..HEAD

FWIW, I have been using this for a while now (and making this "local
review" mode more ergonomic). With Anthropic's recent "API credit" stuff,
this works very well with the Haiku model (Opus is outrageous over-kill
and charges you 40x more than haiku).

-- 
Kees Cook
