Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2083803D3
	for <sashiko@lists.linux.dev>; Fri, 25 Sep 2026 15:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790348538; cv=none; b=foEUh5uWPvbE8uq5M0uUjK/B/0ckMOJUwoCAuHG75GvXfxWVwDNaPUHYxRXDh1tyH7R19FPsQXhXRqaqGdq2YXYrYJTioLftkbmzWJh3XZudIkzXWrQZxkE5GvSlx6/NYOvSbCRdt8PKRsjI6Gf49AKS9eHauxDV3nXQAogtM58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790348538; c=relaxed/simple;
	bh=JPXRbf8gazm9Fe/mqeTEmaN3oXPjiq1czMB8j69BhlU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=gopW1GOkJINjJtZ2u7a+Ix6F1DyXrsmpJJibLHPrB179YSemTOjYkEAACAEwcJdyL3IpbTBJwslqtsCPVMgVmf9IGa+IYYIe/L5K/EutE+I91+WSzhIn/1HAwOq54qu+PPL8kE+y333kiJO+J7RmmBvTsIHGzch20RIRtKx2nX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LO1BBnwm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LO1BBnwm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7BF1F00893
	for <sashiko@lists.linux.dev>; Fri, 25 Sep 2026 15:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790348525;
	bh=D4zvwC8t2pEWyxcvZ8QXjkm+z9e0fTcS2Wzr+mZ6iVU=;
	h=Date:From:To:Cc:Subject;
	b=LO1BBnwmIUV4EE/ZQDzbOSeXKYAxhI6sIXSONp/IG0kU9NEPNNxi1GxzWGT07YRD5
	 +waOsH77scRaxpFjzPxxw5CuYw8IMylmB7Cd3kIcpnJRp1+TaiiwVSiltW519cBx08
	 pfiGl0f2DwQPchlH+VS52e0i/ycom3w64FG6dYWq5Lc73mvhvAvmCl+2Z/jR9kUyvh
	 SHlPccUkwwfUhMn8os+8KujqWj+goe4pozYjVFvkO/UJjaVl4PaDJpe8jeaBOGDwQo
	 mMJU8GDDOeHI6Up3Qy+bJQ4FElT5a9J3sZq6/BPv6eUswAm7UPo9kGG0JIWy21EjFZ
	 7ZwojzCpTwc4w==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id D622FF40066;
	Fri, 25 Sep 2026 11:02:03 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Fri, 25 Sep 2026 11:02:03 -0400
X-ME-Sender: <xms:64y2ap91u-8rXtMHq1PeAmYlFqFvkN-0-QifHGIztKHcxcit0w2VlQ>
    <xme:64y2aojCoKp1IxB5zttVXqeGDL6hCxCKfuTu4EwEKN2bMYt0hhjOkdpfpFYhEFzP9
    JKv9QcJuCko_nGmZTpol-q1Z9sGooDroKnC-vo-st1kexFqNvYk4dVU>
X-ME-Proxy-Cause: dmFkZTF2cZbneRLnFRFGutZqBIbNFW1+BbVrnlnr6ivVeHj0ApdAYV484szLik037jFvO9
    9XmUMGEJHC9uxpz5LqM0vt12t4DqZL0NnIe7r3/BMZ5mb8HagkKpQwIbUqsKch7LeaV/T7
    4okPtIaF1lfvU5coODkxZ9CPCyhltbHIZhF4V8C+W/pBaN/J77yDRI/h85M9a9xigxZTwy
    MQGhRTsZcqu860bS6L5f6N5Fgvx45u1h0wb1L2c5Pt4aFZASupWAuPpNBo69bVe5cVwNqs
    HpPYsfiKxYK5/3Im1o4mP70mv4bG0ffF8IGMV3PmoptEud/SfgcmoMFOp/HEihN+WNFyaS
    aAiC8//WDg/vPbPI/GLfR9FgNqps2orU2NB8t6NMsQxBEj5C+pSW1XCsjVTr8cCfs1KjHL
    w2R8xWcrqRJO0bSGcFyuyIRWGyM4Qk9d9Mmc9G59uZ5bVZTEKWksaw0h1dwHSWVl8c/RjX
    wmqxMXNU6EWm2UqVO5vx/6S+YsL+m4d4tidHf7G79CBXkD735hghf98i4dUGgDqhMhJH1L
    NimUP5OISg/mD0NqMxVbqHAMK6z8OfMSduS7YA+sifhsVqfY9sth/4NpZcB6AV/idFcP6v
    N6/nx7sdWZ/mq9PoLJVca1RjAYrwfzo5WKXRNDp/GvnEUpOcQIG+vQTAZNug
X-ME-Proxy: <xmx:64y2aoqC2jzz6Q8qE1a442yMXtIjY_eY2rFAeClXdQmX_-6Zjcfmxw>
    <xmx:64y2asnZY2Xjd9YYDf5k40K6uB6_neA6BBdbXAmsEP8cM0XkoKdU4A>
    <xmx:64y2akzOQN53ppAe5H1m3xvi8d9Xzsp6jXVmQ5V8QphGsx7LG6UizQ>
    <xmx:64y2askJmI6Pkh9m3tSkPhU08gIPrji96NdUWNBBMk6uYrB6xT_q5A>
    <xmx:64y2aldzZ36TEsGSDswyfzlw1SJ3Ql1jXfdx0WRtOkTld7Iw73ORH928>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AC34A780070; Fri, 25 Sep 2026 11:02:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 25 Sep 2026 11:01:43 -0400
From: "Chuck Lever" <cel@kernel.org>
To: "Roman Gushchin" <roman.gushchin@linux.dev>
Cc: sashiko@lists.linux.dev
Message-Id: <25bac515-89e5-4fea-abcf-c5d799f0ddcc@app.fastmail.com>
Subject: fixes and updates for sashiko
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Roman -

Internally at Oracle, we are required to use codex / OpenAI.
I've set up a sashiko instance for reviewing patches that go
into Oracle Linux kernels, and it must use OPENAI API keys.
"sashiko review" run by developers uses the codex_cli
provider.

There are some missing bits in the OpenAI and codex_cli
providers, which I've been attempting to fix. The commits
are in github.com/chucklever/sashiko/ .

Rather than second-guessing what you are willing to merge,
I'd like to work with you to better prepare these. Can you
browse the commits there, and put the changes into three
categories:

1. crazy, never in a million years
2. needs work, but OK
3. ready now

I'm happy to continue interacting with your bot to whip
these into shape before you merge. I can share benchmark
results comparing gemini-3.1-pro baseline with gpt-5.6
and gpt-6 models if you or the list is interested.

I appreciate the work and focus you've spent on building
this tool for the community.


-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
