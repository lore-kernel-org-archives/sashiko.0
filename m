Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792524200;
	b=iQXs07z1W3rmkYW4PWFGmRXiSrMxbI4P3I0zWMGeNLCxabDB85sL0RLpViZpLH9LN2ZB
	 hOGIoUmfGKI9A60gzRtB164WYktb2PLLRA+jBEYUc9lRhZDsG8I3vev16UReAZ+hrQViR
	 CZmcjUoRVQY02DXmlW8l88uQGe4WxJsx2hrTtBrCNFTJL9TxqO4SL3g+EQcWphBgBVtOe
	 41nNiTwG/IqkZQUFD+QlzNjmGI6voc/lOMYZ7BH4SgDVCRDAfOzQi4RKImU3XAMCrFcfC
	 /vf3fTY9k8QJAQFDdY4lw+Tltt8p72rDw0qDH/Ixprp7DvlQa0trUHn2WOECOzJ/lLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792524200;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ecJRnmsGDrswKKbM9tgD0g5icgr2nRYdzA8EYWFt8/w=;
	b=zB+mZIf451aCh8/XiRdkExlhrnz8ttBg8XNypvV2qQqfxj4aWLjGIaQsYNKVbDiaygmn
	 kKftHKR15fsTBSW388kNt5Sinol7wCSM5p5QTWVuKZvcR+gUR7XdDLpzGoJj7dgIwRvoR
	 zKfIBsmmQ1VtlVtizppWxolZEQhmDxcLgnzmWafToClfDkoqyBsB+UBIYrjmFskTqoU9j
	 mJSYa06JwUXQVZMS/T4iwJGKQ7Wr1dVUSWu5zWZIdfCrncLG7NgXKEn0CUAnYMMY2xj+O
	 XquOozzHlZN7svRbSNAmoiZNCg426IvG6Oxcy3PtZU54xU9nRzfrPmpM57pqSxmV6Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=Cn6SQiDu;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08AC606A327
	for <sashiko@lists.linux.dev>; Tue, 20 Oct 2026 19:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B08AC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=Cn6SQiDu
Received: from macsyma.thunk.org (pool-173-48-113-115.bstnma.fios.verizon.net [173.48.113.115])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 69KJMx2Z010428
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 15:23:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1792524183; bh=ecJRnmsGDrswKKbM9tgD0g5icgr2nRYdzA8EYWFt8/w=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=Cn6SQiDuMOpqDp/CKc46vYNbtAUxhTewiR9fhncF4UC0TT88puQo+iHtQkof4w1eH
	 4PTR5ePt0IOMdEiZTCh7WczB+GLuUhQAo6GA0T488KGB+B1eSu9UE/T0onv0amMmjm
	 DhrYrD2HAeqaCAbt4CjrjAUwkT5KMBpzGumM/AXBGhVPTXG0SXk9I8mItjiB3mOT5H
	 CQYovQZYSrBn59uhCENogQvK/Ho6HkFnkQB5KFBQF6p1ieho8S7dDpGNjtXPEDcCN8
	 8/I/fr9Z3l1Tusl0sxSJbkzAJgxtaPXbkzWSiKG4Znnl+kKo2jLO4iLk8T8XnjEuAB
	 pgd96o+iD0s0w==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 7B1CC21C5058; Tue, 20 Oct 2026 15:21:59 -0400 (EDT)
Date: Tue, 20 Oct 2026 15:21:59 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Bart Van Assche <bvanassche@acm.org>
Cc: johannes.goede@oss.qualcomm.com, Jiri Kosina <jikos@kernel.org>,
        ksummit@lists.linux.dev, sashiko@lists.linux.dev
Subject: Re: Patch pre-submission to Sashiko
Message-ID: <ate8oESqneK-3sQJ@mit.edu>
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>
 <atO3pCuUxI950ftN@mit.edu>
 <3354ebda-5158-489b-a577-5cb10e5d5fb0@oss.qualcomm.com>
 <atZ4J86j7CXF82HX@mit.edu>
 <2fef166e-088d-4ffe-8d0a-0143aebc1b26@acm.org>
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
In-Reply-To: <2fef166e-088d-4ffe-8d0a-0143aebc1b26@acm.org>

On Tue, Oct 20, 2026 at 07:20:53AM -0500, Bart Van Assche wrote:
> 
> Does the requirement to run a local LLM raise the barrier to start with
> kernel coding?

What I was proposing was an expectation that *if* you are using an LLM
to do kernel coding, best practices would include requiring the LLM
performing the agentic coding loop to do the following:

   * Validate the commit using checkpatch
   * Do a test compile
   * Run any relevant kunit or kselftests
   * Run the commit via an Agentic review system

and maybe even:

   * Add a kunit test covering any changes made by the agentically
     generated code.

If someone wants to send a 100% human-crafted code, today we strongly
suggest (but don't absolutely require) that people at least run
checkpatch, and to read, mark, learn, and inwardly digest (with
apologies to Thomas Cranmer) the rules in SubmittingPatches.  I've in
the past requested that people at *least* run "kvm-xfstests smoke",
but that hasn't been particularly successful.  Should we ask that
human code contributors do more, such as running kunit tests?
Perhaps.

Given that code contributors vastly outnumber maintainers and
reviewerrs, it seems that anything we can do to request that people
generating load on the maintainers and reviewers take at least some
steps to make our lives easier.

						- Ted

P.S.  Ideally I'd love it if we could ask people to run either
"kvm-xfstests -c ext4/4k -g auto" for all ext4 patches, but that would
take 1-2 hours on their development machine, or run "gce-xfstests -c
ext4/4k -g auto", but that would require that they have a Google
Compute Engine account and be willing to spend $0.25 USD.  That's
probably unreasonable, but a maintainer can dream.  :-)
