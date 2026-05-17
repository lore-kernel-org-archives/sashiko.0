Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D6E3D16F5;
	Sun, 17 May 2026 22:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779056541; cv=none; b=Xjb09SFCwVX4QSb4qcVCsmOKJisAwwZirCve/tSihEapSTs4Csun1S7yB5DHaomMPz+fJki4EK+/YoM7o+KPRfDC47yA9iBmUMu8BfkuGDklWLTzvCgXZiLW64WFpI16tHAXPd6AgKIh2UjiCDFQAdpD5u43uJ3saknUAsWrcvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779056541; c=relaxed/simple;
	bh=FoRmOfvN97ZLKgyYGjA01K9uLbg5xwboy5j5u2hKvDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=it7mgGZYqNFoJHN6aA2q/Yrh91ug0gRQAdhtNvofvQ1JJApoyKn1HCAQdLhHjqri9VW0o+2zgqPiIrlzOdpWcRhmPrXGHNbxGO2l/7QI8a5LIWeIMbkV/qAOogCYylB7OOs167AtoA1KE2+ywH1mJf3BmzrkKf+5vjl0tZk1pV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=W1o1XvxK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="W1o1XvxK"
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a01:cb1d:8ee:8600:346a:417a:479f:f6a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 605C9296;
	Mon, 18 May 2026 00:21:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779056518;
	bh=FoRmOfvN97ZLKgyYGjA01K9uLbg5xwboy5j5u2hKvDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W1o1XvxKK64lYOXX+FNNoIoxPh4tnu89Kb+TSlZb/FElB5SBtuYUAy/w6RQoUG+CE
	 PGR6JaJva5VHnCigXlYJLYO3xV0mWRebWnagfDV76Cy4nepnTzyjQ4Ph0YiiSNNccH
	 SAyIQmemUhMZYTyM2inLGaJShfOqLnganLQHCDco=
Date: Mon, 18 May 2026 00:22:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Theodore Tso <tytso@mit.edu>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
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
Message-ID: <20260517222206.GA17272@killaraus.ideasonboard.com>
References: <4f3d7f48-5766-425b-91f6-0acdb5554584@kernel.org>
 <07602616-412B-4ED8-95D7-588C0D077EE3@linux.dev>
 <20260517120556.248852d8@foz.lan>
 <2026051758-superbowl-baritone-2705@gregkh>
 <20260517162912.GA51520@macsyma-wired.lan>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260517162912.GA51520@macsyma-wired.lan>

On Sun, May 17, 2026 at 12:29:12PM -0400, Theodore Tso wrote:
> It should also be noted that Intel's zero-day bot was (a) closed
> source, and (b) was sending its test regression reports with the
> linux-kernel mailing list cc'ed, and no one really complained because
> it was so useful, and if Intel was willing to use very expensive
> hardware in their data center to contribute reports, so long as the
> reports were useful and the false-positive noise was low enough, we
> decided to be grateful and not worry (too much) about the fact that
> Intel's zero-day bot was closed source.  (There was indeed some
> grumbling in the bar at Plumbers, of course.  :-)

The 0-day but was a closed-source front-end to orchestrate analysis
tools that are open-source (compilers, static analyzers, ...). Sashiko
is an open-source front-end to orchestrate analysis tools that are
closed-source. That's the complete opposite, so I'm not sure how
relevant the comparison is. Comparing with Coverity may be more
relevant.

> In my opinion, we should be doing the same for Sashiko, and that's the
> decision which the ext4 developers have made --- at least for ext4
> patches, after an experiment where we only sent reviews to the patch
> authors and the maintainer, people were satisifed that false positive
> rate was low enough (with the caveats that I had previously mentioned,
> but we were willing to live with them because at least for us, it was
> useful enough), that we will be requesting that Sashiko reviews be
> cc'ed to the ext4 mailing list.
> 
> I realize that there are some extra sensitivities around AI / LLM's,
> but from the perspective of reviewing patches, I don't see any
> difference between this and other closed source tools that we've used,
> such as Coverity and the Zero-day bot.  Not everyone will agree, of
> course, but at the moment, this is a decision that we are making on a
> subsystem by subsystem basis, which again, has strong historical
> precedence.

-- 
Regards,

Laurent Pinchart
