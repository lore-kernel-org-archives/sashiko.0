Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792441747;
	b=hkltFGMvgYyoZP1emcUdLp8EVOQxwkxRr5lUYx5Yl+1LSqTaURjyPmoEhdzuKm2J+sJx
	 7bJT1/Jj9az27W125/nh8/Cf7ss/hca06Vn05QulY+IGFTT3DmIpYygrc86LtYhEYwAn/
	 XMHqhaw8kylzpalf/lOgnPLvPIa1M9wQJt/JU42aJ2J8usRyhxJNP5ksxUDIh4oGzwlTd
	 hF0lGMVyvzFLl97JrqKz8/B14JBgk8/t1ENKAEwUgX2zvga/c8KxkdrClQ9TitkvYhLDE
	 e6h6kciUUmeR1RWErI2T5xhXvrfuUBXtIMjF8FuAt+Q8AW1zU7gu1XX21bT8biyNKQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441747;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=lBQQJXPS0c8nHhzRDXav8WgcwPtIGLyWbDIiDbZx1iU=;
	b=rPYbrW7+PMW3NzZIlQSVEhZtLS+SfonxPPLBiHEDX0PxKM+QZKguzCyeP8vexZDrqq7d
	 k5scLJTZIVeyULL7MgsmPW/2Qsu8P5S7bfroqPHkxfubGM1sBdlDSEw/l2Ek0RkZ2udtf
	 OZot200UJ9rCpBAYGt6298FCUvnwJg7wGAFBgkY7d6BhmqpL9XM1CYi8AlXXzrDxjtynO
	 L/84wN5iSv01NeYwg4GzENfx7IaQ1LAIUxRP3mlxk380yxHnkRekJRshmEAuv6Ofm7hqs
	 qT8yMMBujDrxL8fGOgcKknQG4PZz74vkv5dR/6yW20POAIlRW5dIMvMpvRMGqKHhq6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=HOqg0L9O;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BB5606A31D
	for <sashiko@lists.linux.dev>; Mon, 19 Oct 2026 20:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07BB5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=HOqg0L9O
Received: from macsyma.thunk.org (pool-173-48-113-115.bstnma.fios.verizon.net [173.48.113.115])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 69JKSmvT025159
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 16:28:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1792441731; bh=lBQQJXPS0c8nHhzRDXav8WgcwPtIGLyWbDIiDbZx1iU=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=HOqg0L9Oq9gewSxZCo8lVd6NFqEfVSQXMXMb8m5GIC8r0zOh8dpKRwi4YlTB7FpLb
	 XCMnY+9nRA9fDqrhNfIlKY/owa4Ig9mPc7ak5LdlAcM+8TxucR2p11y+0xFAOsiv3y
	 3zUFdKs4CD3vIkH9s6OFO1ogD0hZ4RbkasziuvQB7ZYLd4If0YYibVTs9H/w7GKgpy
	 9fmqb0VaSf9FAYxNHPh5g6iNhacB5s1X8d4LxCaADK/QA7rPcTST72Wr1gxrX5vybT
	 N/1XuPEDmh03mDJWC2pPTivgXVHyWKOZnuYB7zfVdN8f8sEn7Z1EXpg+dZlqNpbZkw
	 E4WgsWL8+P89w==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 0CBD7219E5BF; Mon, 19 Oct 2026 16:27:48 -0400 (EDT)
Date: Mon, 19 Oct 2026 16:27:47 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: johannes.goede@oss.qualcomm.com
Cc: Jiri Kosina <jikos@kernel.org>, ksummit@lists.linux.dev,
        sashiko@lists.linux.dev
Subject: Re: Patch pre-submission to Sashiko
Message-ID: <atZ4J86j7CXF82HX@mit.edu>
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>
 <atO3pCuUxI950ftN@mit.edu>
 <3354ebda-5158-489b-a577-5cb10e5d5fb0@oss.qualcomm.com>
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3354ebda-5158-489b-a577-5cb10e5d5fb0@oss.qualcomm.com>

On Mon, Oct 19, 2026 at 01:02:55PM -0500, johannes.goede@oss.qualcomm.com wrote:
> > It's not that hard for people to set up a local Sashiko. and then use
> > either an local LLM, or their own cloud-hosted AI tokens.  Perhaps
> > that's something we can encourage.
> 
> Actually it is that hard. Even if you spend the 2000 - 3000usd
> necessary to run somewhat large-ish models locally the results are
> still quite slow (which by itself would be ok) and they catch
> a lot less then the actual Shashiko service.

I was thinking about difficulty in setting up, but it's fair to point
out that not everyone will have access to a high-end GPU or a M5 Max
or RTX/DGX Spark setup.  On the other hand, not everyone is going to
big development/build machine. either.

So we might need to consider what a hobbyist or student might have
access to, versus a corproate-sponsored emplyoee/contractor at
different companies, etc.  The former might only have a personal "Pro"
level subscription, but some other folks might have company sponsored
token budgets which even in the post-token-maxxing era, might be a bit
more generous than a subscription plan.

As someone else has pointed out, students / hobbyists just use
OpenCode with the review prompts with one of their free models, such
as "Big Pickle".  That or a local quen3-coder-next (my current local
LLM, when I'm not using my employer's cloud hosted models) might not
be as good as Sashiko, but you can find a lot of the obvious issues
first, before you send it to the public list.

	       	      	       	     	 - Ted
