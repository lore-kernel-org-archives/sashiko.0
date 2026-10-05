Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8454CC28B
	for <sashiko@lists.linux.dev>; Mon,  5 Oct 2026 19:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791230342; cv=none; b=YF39Uo8JsA0YcncceIFoYgroQU2e4qoOje3u7lUFPp/NM9jdQFimdho31l7m+aGu11rKvWBu11CTH391A9yZz0hOlhnxkKwr1SNqhjJrugPoSpODJpArORyBAXxjSSM77a4Fure6JZqltb4Q9WO86EmwRQsPqU3IP5yIRwQ218k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791230342; c=relaxed/simple;
	bh=ZeMl7LmQ0i4zzWXwFpS4fXkP2we8vr2JDm855uwPNNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=THR1x4Q9X1KKnbFu0tjOgFngePoFDMHZBRkl0iy+vyV8etbmcBtCv0IMmmifn547m6WGF3oeCMoTL2kzpTMY+MxUm2lJgybAzKvAyXNZ/EMg3Ij8QwBq5p2FX8xP6LAXopQADbbGeXIJB736OL3zIAliozYA8KETVXaAni8auto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nzeHDdJ+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nzeHDdJ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 828341F00893;
	Mon,  5 Oct 2026 19:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791230340;
	bh=8DoZ44lSNw7YIzLfHhKp0CV4jE6baQjysgctXn9DiFM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=nzeHDdJ+IegU4f0xA9i6xUyGgp/L4Xjg8L711h9MQuSvUMcYIQBvPzlIwewClEV1z
	 6S6/NytzJ2V6PQJUVjAOnvGR9cK9avdgK2dlOmE1NjC/jn8IV9WIFvXdFFCqXnRevX
	 96HWjDpu7VmkXpbsTwKBulX/qMkL3yNB/FtY5GKPvPX2GtTHndCJ1BOTaAxZTcAZ1L
	 NWgaiSRQSshDSw4TKxXh30wHj940ltDvHpmGLz1/JMgbIaPhPDJ1MU4zeRSgjyY/ER
	 yycSuW5Z+786FaLoQR1kKRIV9zEL7C8Bn/G2B/9eH7qkyS4a+qFy4o9BPiPQkqHU86
	 U54DkCUaGGiLA==
Date: Mon, 5 Oct 2026 12:58:59 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Chris Mason" <mason@kernel.org>
Cc: sashiko@lists.linux.dev, "Roman Gushchin" <roman.gushchin@linux.dev>,
 ihor.solodrai@linux.dev, ast@kernel.org
Subject: Re: [RFC] reworking the review-prompts subsystem guide
Message-ID: <20261005125859.3ed00b33@kernel.org>
In-Reply-To: <91e21331-ed6d-4ac0-b237-b01aeadca2d1@app.fastmail.com>
References: <91e21331-ed6d-4ac0-b237-b01aeadca2d1@app.fastmail.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 02 Oct 2026 15:04:00 -0400 Chris Mason wrote:
> Hi everyone,
> 
> I've been updating the review prompts, and you can find my current work here in the subsystem-build branch:
> 
> https://github.com/masoncl/review-prompts.git subsystem-build
> 
> This is a pretty big change, and since a few projects are syncing automatically, I didn't want to just throw it in without discussion.
> 
> The review prompts started with a lot of framework to explain how the kernel works, and the prompts have focused on documenting subsystems in a way that both LLMs and people can use for reviews and writing code.
> 
> As models have progressed, they actually need different information than they used to.  Recent models already know how most of the kernel works, but they have some gaps because the kernel is always changing, or because they have some bad assumptions baked in.
> 
> My new branch builds subsystem guides by asking a long list of questions, and then extensively reading the sources to find the right answers.  The delta between the LLM's answers and the right answers is the new guide.
> 
> This is both much less useful to human readers and much longer.  I'm not sure what to say about the human reader part, but instead of having LLMs read the whole subsystem guide, I shifted to an index where they search for symbols.  This is a better fit for more advanced models, which mostly need updates on how the kernel has changed since they were trained.
> 
> The subsystem-build branch was built with both sonnet-5.5 and opus-5.5.  It's the union of all the things either model got wrong, and the tree is setup so we can add builds for other kernel versions (ex: stable kernel series).
> 
> I started down this path convinced that I needed to get the subsystem guides into the kernel git tree.  My idea was this was documentation, and it should land somewhere in the kernel for that reason.  I ended up with something that probably shouldn't be in the tree...different models need different things on top of different kernels, and so I'm trying out the build idea.
> 
> What I know for sure is the existing review prompts have drifted from mainline Linus.  It's impacting the quality of the reviews, so I plan on working out something in the near future.

I didn't read the whole thing, but makes sense AFAIU.

Closing the loop with Sashiko and/or ML would be great :(
If the bots read the ML they could both learn false positives and false
negatives automatically. I suspect most of us thought about this by now.
If we're doing a redesign should the ingest of ML be part of it?
