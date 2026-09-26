Received: from mta0.migadu.com (out-34.mta0.migadu.com [91.218.175.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B5E39C637
	for <sashiko@lists.linux.dev>; Sat, 26 Sep 2026 20:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790455944; cv=none; b=G86GEAmab/o8XVGb8nYzObKfh6RfJBc+W6PoncgZZy7EyLmqN++ACSer+ZCVWAYCuXg8e3pupcYLoHnFx8pgz9nfKj2NQYN/XW9uqqxlhElqIfWttapT7y/JSXPx55drcxlWlEJZF3yvdaeOH3XkuvtIqWO1waN3Qjrgjic8ZL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790455944; c=relaxed/simple;
	bh=VlEPOl6hEeGWzXgCNF3IN8FanH7Mvfcxd2D46JUcDbE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WugVgNZGpiIQiGuBAjL663Pv4FGhOOI4I2ukldUyS1gQ0joqUxiPNZKuW1rWamdnJIzxNatgJiu5ElXZ5EAtn9d7Kfy5MwXvjOk9Xc0qd99QZHnMIzWjbW9qbaa+d7WpsQv+59QCZHHIuOq6gBigjovwvBlBXOn0g/F7NySkhMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VLRa0uyx; arc=none smtp.client-ip=91.218.175.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VLRa0uyx"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=VlEPOl6hEeGWzXgCNF3IN8FanH7Mvfcxd2D46JUcDbE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790455938; v=1; x=1791060738;
 b=VLRa0uyxzhfNMes4QaPMAaZxA2LIBQPx3HlyNiaAE5/OgC7o4KwIEEHVw5GJZs8eA0NV+kaI
 Po+LCvesrHaqOf6C8QpiR+MmqHtsD6cfaP12FSVrEcfymB653wmSQU9H8VeXyvzIdv/o+yhLjbz
 0g1X6BM5FSQzgEyW1RUDxW/o=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta11.migadu.com with ESMTPS id 299b0fbf63807424;
	Sat, 26 Sep 2026 20:52:18 +0000
X-Mizu-Trace-ID: 299b0fbf63807424
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: "Chuck Lever" <cel@kernel.org>
Cc: sashiko@lists.linux.dev
Subject: Re: fixes and updates for sashiko
In-Reply-To: <25bac515-89e5-4fea-abcf-c5d799f0ddcc@app.fastmail.com> (Chuck
	Lever's message of "Fri, 25 Sep 2026 11:01:43 -0400")
References: <25bac515-89e5-4fea-abcf-c5d799f0ddcc@app.fastmail.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Sat, 26 Sep 2026 20:52:13 +0000
Message-ID: <7ia4ik3rka6a.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Chuck Lever" <cel@kernel.org> writes:

Hi Chuck!

> Hi Roman -
>
> Internally at Oracle, we are required to use codex / OpenAI.
> I've set up a sashiko instance for reviewing patches that go
> into Oracle Linux kernels, and it must use OPENAI API keys.
> "sashiko review" run by developers uses the codex_cli
> provider.
>
> There are some missing bits in the OpenAI and codex_cli
> providers, which I've been attempting to fix. The commits
> are in github.com/chucklever/sashiko/ .
>
> Rather than second-guessing what you are willing to merge,
> I'd like to work with you to better prepare these. Can you
> browse the commits there, and put the changes into three
> categories:
>
> 1. crazy, never in a million years
> 2. needs work, but OK
> 3. ready now

Sure, will do. I don't have usually a strong opinion on ai-provider
specific code outside of gemini and can't even test it; but if there are
common parts, I'm usually a bit more concerned.

I can't promise a fast timeline though - lot of other stuff, I'm working
remotely from Europe next week and also LPC is coming up. Btw will you
be there?

>
> I'm happy to continue interacting with your bot to whip
> these into shape before you merge. I can share benchmark
> results comparing gemini-3.1-pro baseline with gpt-5.6
> and gpt-6 models if you or the list is interested.

I'm curious to see these numbers privately, but it's not something I'm
comfortable discussing publicly: this might become very sensitive very
easily. Obviously I can't prevent you or someone else from posting
numbers, but I will be limited in what I can say/do publicly.

My approach is that we want all frontier llms to work _together_ to give
us best results vs creating another benchmark. But so far only my
employer (Google) is sponsoring this. I think we (as a community)
need to fix this first.

> I appreciate the work and focus you've spent on building
> this tool for the community.

Thank you!
