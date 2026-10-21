Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792599716;
	b=lXfus7QHieNP4jQlfdUFFmkU5/v/0+CrH+Gdft5OL3iZn2JpEIJh/KweM8kQM8IlUydy
	 ZSi+hZqGQ5skFoD43wipOcl78GrlIHqVjT4Gj5ti7AhxIAVKojV6Q1NGAhUOKMhctmIGC
	 p13Z5Wu0+zRHoeeKzKYBLFEBF50nSHZBNxfUzzpC7tGlj8MQq3X5RKwsxFFQk/+qpowwY
	 PuOhM39SYF3g5rjkArM4b3vgJd6ctJKuFgJmJk9npdCyMgKyRSpHd2AGTQOf2HX+TtL99
	 KlN5Z29CqzEpln+tFdtUka6f7jBJKhdgebYg1LzRW5EHNCVo5FD2Uxi4lOhlRqsgQGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792599716;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=19eLONem2iKsKZjZz3LEAn7Cpmt/i6W2rFzwxlsMPPQ=;
	b=DqXhhEmfRSjuUWz8nmDePB/jYHiQQyPHaiB9J9ywe7QSgEWcJ7LD8wuMXBDh54yzWM+h
	 reJZkKQqlAK+tDOnyJBid8rZxhkDG+onK0ZDT/WN8bw4Fo5Bl98hFgMh+EsPR7M1maPaM
	 Bg/GFzyjsdLIwKbDxE7abTecOV9DmhmHQuqYGPUvL+tCkMp3pGQR3g5Qm/rRkwrTm4Sgu
	 oQnK4Bhla1XueLbMQm87Kf67ugOmkSAcw5vl2MF3ST8ICRaUShLgrTLUoRQXOHdFQw9Ae
	 3yOKreZ860hmd4Olajs4Z3p2xoK/A7CrlQwrHBh2zuTsRcQXyAA6fa8TmAVzDq99IqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=aA1FdbBE;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E229C606A56D
	for <sashiko@lists.linux.dev>; Wed, 21 Oct 2026 16:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E229C606A56D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=aA1FdbBE
Received: from macsyma.thunk.org (pool-173-48-113-115.bstnma.fios.verizon.net [173.48.113.115])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 69LGLiSG016844
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 12:21:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1792599706; bh=19eLONem2iKsKZjZz3LEAn7Cpmt/i6W2rFzwxlsMPPQ=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=aA1FdbBE1+OWOdUY5bPt+Nzp0OTdFxdFK9EiW9tU5s3WyvTJyKeVkko7ir0HSdqQ6
	 i09FZpfjmphpNUmscNZKl8sG5jVdEuZTv8AkVThhksGFszSorelylILjUWG+M6m0H3
	 bVMrygHAZxWDszh/0wRn4Ybv22ynUxMHMlkw1GikCdrqzw79OX3o2g/7kRq9pmVCuY
	 YUkZbnr248cNhVOPp5RmoTsVh7Djfj1N0MaBVV3TrVYOJvrCUp8Von9sE17vhwBCKZ
	 wzztEoM7g+0bSB/ZEcY65rPqnyE2vP99B/9ouJYjP3pRVZSRzpZQ9aFEm6zZ6zWaNa
	 wcXZXsE9L9+eA==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id B1D4E21E2840; Wed, 21 Oct 2026 12:20:43 -0400 (EDT)
Date: Wed, 21 Oct 2026 12:20:43 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Mark Brown <broonie@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
        Bart Van Assche <bvanassche@acm.org>, johannes.goede@oss.qualcomm.com,
        Jiri Kosina <jikos@kernel.org>, ksummit@lists.linux.dev,
        sashiko@lists.linux.dev
Subject: Re: Patch pre-submission to Sashiko
Message-ID: <atjlUoEmTagZjrYI@mit.edu>
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>
 <atO3pCuUxI950ftN@mit.edu>
 <3354ebda-5158-489b-a577-5cb10e5d5fb0@oss.qualcomm.com>
 <atZ4J86j7CXF82HX@mit.edu>
 <2fef166e-088d-4ffe-8d0a-0143aebc1b26@acm.org>
 <ate8oESqneK-3sQJ@mit.edu>
 <7e473af8-2f7a-4a36-a926-e756873c9c52@linuxfoundation.org>
 <atic3bbDeyJI6MJs@sirena.co.uk>
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
In-Reply-To: <atic3bbDeyJI6MJs@sirena.co.uk>

On Wed, Oct 21, 2026 at 12:07:09PM -0500, Mark Brown wrote:
> 
> TBH having seen some LLM patches that come with LLM generated testcases
> the testcases are much worse than the patches themselves.  Open coding,
> weird structures, asserting bizzare things without explanation - just
> generally really hard to understand what the test is trying to
> accomplish and why.

I recently posted a patch[1] to add KUnit tests for
fs/ext4/extents_status.c.  It was completely AI generated, and used
these instructions which I gave to Gemini Pro[2].

[1] https://lore.kernel.org/all/20261021031231.40107-1-tytso@mit.edu/
[2] https://lore.kernel.org/all/atbZWze194QiSOTe@mit.edu/

I'm obviously biased, but it seems to me these test cases were pretty
good.  I'd appreciate criticisms and suggestions for improvements, but
if your experience is test cases written with older models, the latest
frontier models have gotten way better.

Cheers,

					- Ted
