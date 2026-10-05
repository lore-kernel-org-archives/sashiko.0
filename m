Received: from mta0.migadu.com (out-109.mta0.migadu.com [91.218.175.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9043F3B0581
	for <sashiko@lists.linux.dev>; Mon,  5 Oct 2026 21:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791234865; cv=none; b=V7pm6o4fk8kcz4KdeKfdTgp8NqkdGtxLumLfCOPFOiTbM+dWpIcHSSlNbgo2AnclGmhPvqTtcC43JiIhgXw6YnJaSMqGSkILhBtp9+ImTs1A8YEFT1ov/WvFbchoPGWVj9pZy0BIKbYzOA3084YWnCc2nUVZtfXQQcUMVqBhM2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791234865; c=relaxed/simple;
	bh=By+DFqrVOprcTCkonqute9ixLonQO/8Tti9iCpQgOAM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Br13u450uTFCaXX8Q6B/mTdDeYEYubadqFPXOywBe+xzHxWWipHFNdijCnxwc+SLzQbdsjQdzzC1FwG6R65PXTszQIaaQjz/A8wnZIJDkQrjEh/IxpFDMBxfXrGUaTOv6lvjafOmIz8bmztspPfhBDZEomW6RuEz2GBzzzEXu90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NqS8I1DF; arc=none smtp.client-ip=91.218.175.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NqS8I1DF"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=By+DFqrVOprcTCkonqute9ixLonQO/8Tti9iCpQgOAM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791234860; v=1; x=1791839660;
 b=NqS8I1DF87oIec7q2GpCcHhZywy8Tmq2SjNwVGy30AjBHzIvcyi7rPbdEtbOoXMYGKBuCNtY
 E9YXmFnXMixvFf0Xlee9YiEtekF3D/dQxxTNt/29g/OQPocO4qXIH0EOerW5iaBzHekur2NlrHK
 tUjD+/hRii4rbDEd+O6u1iSc=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta11.migadu.com with ESMTPS id 3fd47a62b2d25eef;
	Mon, 05 Oct 2026 21:14:20 +0000
X-Mizu-Trace-ID: 3fd47a62b2d25eef
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "Chris Mason" <mason@kernel.org>,  sashiko@lists.linux.dev,
  ihor.solodrai@linux.dev,  ast@kernel.org
Subject: Re: [RFC] reworking the review-prompts subsystem guide
In-Reply-To: <20261005125859.3ed00b33@kernel.org> (Jakub Kicinski's message of
	"Mon, 5 Oct 2026 12:58:59 -0700")
References: <91e21331-ed6d-4ac0-b237-b01aeadca2d1@app.fastmail.com>
	<20261005125859.3ed00b33@kernel.org>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Mon, 05 Oct 2026 21:14:12 +0000
Message-ID: <7ia4y0cbsvdn.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Jakub Kicinski <kuba@kernel.org> writes:

> On Fri, 02 Oct 2026 15:04:00 -0400 Chris Mason wrote:
>> Hi everyone,
>> 
>> I've been updating the review prompts, and you can find my current work here in the subsystem-build branch:
>> 
>> https://github.com/masoncl/review-prompts.git subsystem-build
>> 
>> This is a pretty big change, and since a few projects are syncing automatically, I didn't want to just throw it in without discussion.
>> 
>> The review prompts started with a lot of framework to explain how
>> the kernel works, and the prompts have focused on documenting
>> subsystems in a way that both LLMs and people can use for reviews
>> and writing code.
>> 
>> As models have progressed, they actually need different information
>> than they used to.  Recent models already know how most of the
>> kernel works, but they have some gaps because the kernel is always
>> changing, or because they have some bad assumptions baked in.
>> 
>> My new branch builds subsystem guides by asking a long list of
>> questions, and then extensively reading the sources to find the
>> right answers.  The delta between the LLM's answers and the right
>> answers is the new guide.
>> 
>> This is both much less useful to human readers and much longer.  I'm
>> not sure what to say about the human reader part, but instead of
>> having LLMs read the whole subsystem guide, I shifted to an index
>> where they search for symbols.  This is a better fit for more
>> advanced models, which mostly need updates on how the kernel has
>> changed since they were trained.
>> 
>> The subsystem-build branch was built with both sonnet-5.5 and
>> opus-5.5.  It's the union of all the things either model got wrong,
>> and the tree is setup so we can add builds for other kernel versions
>> (ex: stable kernel series).
>> 
>> I started down this path convinced that I needed to get the
>> subsystem guides into the kernel git tree.  My idea was this was
>> documentation, and it should land somewhere in the kernel for that
>> reason.  I ended up with something that probably shouldn't be in the
>> tree...different models need different things on top of different
>> kernels, and so I'm trying out the build idea.
>> 
>> What I know for sure is the existing review prompts have drifted
>> from mainline Linus.  It's impacting the quality of the reviews, so
>> I plan on working out something in the near future.
>
> I didn't read the whole thing, but makes sense AFAIU.
>
> Closing the loop with Sashiko and/or ML would be great :(
> If the bots read the ML they could both learn false positives and false
> negatives automatically. I suspect most of us thought about this by now.
> If we're doing a redesign should the ingest of ML be part of it?

I plan to do this (and had a prototype in the past), but it's tricky if
we take security seriously. And we absolutely should!
Obviously just giving an agent an access to lore archive is opening a
can of worms in terms of possible prompt injections. So I think we
should do it really carefully. And outside of security considerations,
humans are simple wrong too. So my plan with sashiko is to force it to
try to verify the feedback against the codebase and if it's not possible
trust only maintainers or people with a long history of meaningful
contributions.
And sashiko can (and does in my prototype) generate prompts based on the
feedback and automatically verify that it helps by re-reviewing original
patches. This should mostly eliminate a need for human-generated
prompts.
This is all doable, but probably will take few more week to build and
roll out.
