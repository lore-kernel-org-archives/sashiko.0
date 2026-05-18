Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD41F31714B
	for <sashiko@lists.linux.dev>; Mon, 18 May 2026 12:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779106668; cv=none; b=ER63OswKtJN8IO+kLKaMPqlzWl+WsXDRNjttsxVzUN/8G4ef+Jbh9gTP/dUOptf7qB71dXw2Ctg+z5rHdqLqRcO5KX+w4i7tjiHcCs0ysXlUiiK0Hk8lIC3POpTCzNdR6tMF6GuOgFWxv/RYvd+K6aFpLsphDcatLxO/TwLKZ/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779106668; c=relaxed/simple;
	bh=qBTFH3dyHCIfh4nEjJIzIjWBS1XDlCf4mzh2+niSAbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RUpUGLu6cjxm+sVvyQfld6cdW7OL7M79Q+ttH+fcsFSGlY4blgpe2vQ7eOflSbcxB7BJ3vmNfTlldaHmKj49NKI1ldYCo4vZoE8jVoWi+mMvp68s9aLO32EsxhzhzDLuw9RpG6HinhWb+mwEA2FT3oHyjbE6MVpBLaitPC+jGVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=g8AkuScs; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="g8AkuScs"
Received: from macsyma.thunk.org (pool-173-48-113-30.bstnma.fios.verizon.net [173.48.113.30])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 64ICH1s7015840
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 08:17:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1779106626; bh=Q7EAU14Ys+Ue6sfrOPOXvnTHEKS36ofxGlqV0U56nvw=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=g8AkuScsGzuB9Si53wWolNuQqxijXTw7LdWxMpac9QHTtiPvtv63traLOiGP6y7G+
	 tjpIpL23U8lDd/BqlMawpMUFS4yDirPRQmfjeWkpYR2yYyH/5rfFfIYBYZAtJZMCpA
	 j7Rp/diYgjf8zBAOAVvrQaqSR4+4ToNFpYneel8nVk+XoESYR8tag3fDRHsyVvSSf5
	 G/JCcWWAQw4QlMZrPnHekLxJz1usWzWMSt/gqpaX4JTfPyQU8yy5ySGZFJExyfFOKW
	 akGzmEa5WA3oStwtdhZBcN3jM38ssMeMLG4x4La61MkOOXsWtWaF1nhXn9zPwJ6gPi
	 2iT7cKbZMv6uA==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 5FB3A68029BD; Mon, 18 May 2026 08:16:01 -0400 (EDT)
Date: Mon, 18 May 2026 08:16:01 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>, debarbos@redhat.com,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Konstantin Ryabitsev <mricon@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>, sashiko-bot@kernel.org,
        sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev,
        Linux Kernel Workflows <workflows@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, kfree@google.com
Subject: Re: Stop false review statements
Message-ID: <20260518121601.GA87957@macsyma-wired.lan>
References: <4f3d7f48-5766-425b-91f6-0acdb5554584@kernel.org>
 <07602616-412B-4ED8-95D7-588C0D077EE3@linux.dev>
 <2e20badf27b6910d619329841e37d2961556056f@intel.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e20badf27b6910d619329841e37d2961556056f@intel.com>

On Mon, May 18, 2026 at 11:04:29AM +0300, Jani Nikula wrote:
> > Sashiko is supporting various LLMs, including open models - it’s just a practical
> > choice: to my knowledge the quality of open models is not on par with frontier closed
> > models and it would require a non-trivial amount of hardware and infrastructure to run
> > an open model at the required scale.
> 
> In the context of the "Reviewed-by: Sashiko" discussion, this actually
> makes it really hard to assess the quality of those reviews.

Agreed.  There's a reason why the coding-assistants.rst specifies the
model which is used:

  Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]

The problem is that (as Jon has pointed out) coding-assistants.rst was
intended for use when the tool was beging used to help create the code
--- that is, "Coding Assistants".  What we're doing here is more of a
reviewer assistance.  Something like:

  Scanned-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]

Would be more interesting, but it doesn't actually tell us anything
about what the results were of the scan.

One of the problems here is that there is a distinction between the
infrastructure and review prompts in the Sashiko github repository,
and the reviews that are being published by Sashiko the web service
being run by Google that is being lost by some folks.  So I wonder if
for now, we should just do something like:

Link: https://sashiko.dev/#/patchset/20260515091829.194810-1-me%40linux.beauty

Or just have a link to lore where the review has responded to the
Sashiko review stating where the Sashiko review reported a
pre-existing condition (perhaps one that we don't care about because
races in readahead logic is really Not A Big Deal, etc.)  We go for
this strategy, it would actually be better for the Shashiko.dev review
to get cc'ed to the mailing list.

Personally, I think that's probably be best way to go.  We already
don't insert into the git commit an explanation of why some bullsh*t
review by some wannabe human reviewer should be ignored, or why a
discussion of some problem discovered by a human review in the source
of the review would be handled in a future patch set.  That's what the
discussion on lore.kernel.org is for.  And we shouldn't treat AI
reviews any different from how we deal with human reviews.  So if we
want to give credit to an AI review, then let's go with the
Scanned-by.  Or we can just let people look at the mailing list, and
if people want to have statistics, we can ask people to use a script
running against public inbox to figure things out.

						- Ted
