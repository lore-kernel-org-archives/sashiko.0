Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A0827A462
	for <sashiko@lists.linux.dev>; Sun, 17 May 2026 16:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779035372; cv=none; b=taFN+sbi1Y9YG+tKvl42nfkNzkS1hYJt5JvIX0FOHOlhw9EEZi5c/mhPp84yVPrJaUt1ArnKnGxXc31CqhbtFGut8RcBdDKgF+rQNmDsJT+Z4LjeMZUg1ysx7UMnLLLu2Yo9VptJ5RSVLcS+MzX2P/lMkpkElpRlnWBvDavMlsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779035372; c=relaxed/simple;
	bh=zi3F9jjBameBKB9vjfjoURcZxlkSiuLP1xjP/cLUT5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zde61S/6wFBJ7jKnmCRVIbDDmhsIhUYKDvGXI8Iji89brT1GzxxpqatIvYpB2Ssw97yQrvmocAWXtex8SpHtCLb9oAm90UCG1qZVzd1Ct7ZLpugIN9Ic9zgHdRQ5D6bbKy1PBY09wPXCSmOrnWh4CPyTUnC7mCEbJthkA5mXJTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=OMv5hXju; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="OMv5hXju"
Received: from macsyma.thunk.org (pool-173-48-113-30.bstnma.fios.verizon.net [173.48.113.30])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 64HGTCOa012302
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 17 May 2026 12:29:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1779035356; bh=ybqO5IyQZWG+yOAuxzWHV8Y8nXAPMHTC2dZ8p+w8Rk0=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=OMv5hXjuOTQyRnU1KmIZA3vokJVdLvr2CS4amW3t7dbr1vrgJT0r3ffUR+K2/4WEt
	 VlyY+tErhQE6NIZJYJKYuiDWeZS+rIwDbUA4R3IXhPxsXqmA4k1F5LluhhVv0LZzWE
	 H/v/ToCWzUKYkBUedcceeBqmhMPCJtEFw/IY9Rgv39eAwakSuj3PFIP39wQ870USFr
	 lpim7uWxLZ2t1tE88TorK9yLkvQx4qWT4ztAwOn1OBKFtq9SF57b2WPDQo/7NYCC2P
	 Ft5A5H+uyHx99AQlABsOk6bdjNfog3Iwg5aiju2wVUYXNpXPQxdewAvRCTaIw3dFdz
	 b+ikkRvIbReqw==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id B3F5167E8B95; Sun, 17 May 2026 12:29:12 -0400 (EDT)
Date: Sun, 17 May 2026 12:29:12 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>, debarbos@redhat.com,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Konstantin Ryabitsev <mricon@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>, sashiko-bot@kernel.org,
        sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev,
        Linux Kernel Workflows <workflows@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, kfree@google.com
Subject: Re: Stop false review statements
Message-ID: <20260517162912.GA51520@macsyma-wired.lan>
References: <4f3d7f48-5766-425b-91f6-0acdb5554584@kernel.org>
 <07602616-412B-4ED8-95D7-588C0D077EE3@linux.dev>
 <20260517120556.248852d8@foz.lan>
 <2026051758-superbowl-baritone-2705@gregkh>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026051758-superbowl-baritone-2705@gregkh>

It should also be noted that Intel's zero-day bot was (a) closed
source, and (b) was sending its test regression reports with the
linux-kernel mailing list cc'ed, and no one really complained because
it was so useful, and if Intel was willing to use very expensive
hardware in their data center to contribute reports, so long as the
reports were useful and the false-positive noise was low enough, we
decided to be grateful and not worry (too much) about the fact that
Intel's zero-day bot was closed source.  (There was indeed some
grumbling in the bar at Plumbers, of course.  :-)

In my opinion, we should be doing the same for Sashiko, and that's the
decision which the ext4 developers have made --- at least for ext4
patches, after an experiment where we only sent reviews to the patch
authors and the maintainer, people were satisifed that false positive
rate was low enough (with the caveats that I had previously mentioned,
but we were willing to live with them because at least for us, it was
useful enough), that we will be requesting that Sashiko reviews be
cc'ed to the ext4 mailing list.

I realize that there are some extra sensitivities around AI / LLM's,
but from the perspective of reviewing patches, I don't see any
difference between this and other closed source tools that we've used,
such as Coverity and the Zero-day bot.  Not everyone will agree, of
course, but at the moment, this is a decision that we are making on a
subsystem by subsystem basis, which again, has strong historical
precedence.

Cheers,

						- Ted
