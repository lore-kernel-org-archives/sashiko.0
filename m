Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988152FFF99
	for <sashiko@lists.linux.dev>; Sat, 16 May 2026 20:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778964201; cv=none; b=nIVRRETN1Iyu7yhwCf9w5YvasIM7mQZJh47rTOb0r2ZKNW7oKki79SDLIfpVNWs+ifQQcIAyI4ZaMcX2tREYI29UiNQG7MlFMRNG0Yd2jYbKyx8Fi6Hisq5bCchxdcqgvwJG/Rp2+bOOIw5QsSQeuwpaTfrXn7BkNC+TxFVB7KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778964201; c=relaxed/simple;
	bh=ReSwDcGHWQFy1+lU5PBN0QNbtOQMHyercsti3xWJuPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jo2hJBDy29DXOa69cUKvdkqF7JWbAHxOcVhmz60B/QRw8q+8fvY1O0Xa1bjvzukI0yd/BMk27tYYF8Ul1qBZa2mdv1qunpHw3tbsGT8wRNsUouaIYFyI5JKQSzN09JhtLdZLrC/lpzfCrq/QX84XBSQoX9xLmGQbYeoKoXEh1vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=TV6DhmDS; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="TV6DhmDS"
Received: from macsyma.thunk.org (pool-173-48-113-30.bstnma.fios.verizon.net [173.48.113.30])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 64GKgiev016919
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 May 2026 16:42:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1778964168; bh=LDjwP+FHtN1YWbjYi6pGEKO+3iGJDBZLmVB3CN7sjuI=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=TV6DhmDSfs1dfT6qouaV42RhTILX8l7Ejmh1WibkRzlRTqkxe6LNzvC3UsVB06Bq2
	 zqFYSxU6SVyVgfpVF53Ewi0xi2X1lwJLFNJPzx5r5DNq8ymXqUrKz9YnumjDBeGthd
	 rQFy4F43FRLq7kIVnXn+79a3dIt0gs4tt+ZQLC4AYj8XeOJvdgQiofa4rdVLiFjAjZ
	 HLqpHQ7BR2CoW0WlkF6SfiiZyj8gfJZfDg7QEOTJURykApRn5ae5A7S7JtoCPIj6AW
	 HZK1IpXxCbl8q+gc9z3biKZTDQTjijHhu1uBMzY8E9vP9m9+GHBB6KJCTgIVJT8zpv
	 dXTN7e48rpnMA==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id ED8DA67C196B; Sat, 16 May 2026 16:41:43 -0400 (EDT)
Date: Sat, 16 May 2026 16:41:43 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Konstantin Ryabitsev <mricon@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>, sashiko-bot@kernel.org,
        sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev,
        Linux Kernel Workflows <workflows@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, kfree@google.com
Subject: Re: Stop false review statements
Message-ID: <20260516204143.GB26730@macsyma-wired.lan>
References: <b5989c0f-90da-42cc-a623-3b60df077848@kernel.org>
 <FA45D2AD-1135-4480-8423-63C0D37FE78D@linux.dev>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <FA45D2AD-1135-4480-8423-63C0D37FE78D@linux.dev>

On Sat, May 16, 2026 at 12:15:12PM -0700, Roman Gushchin wrote:
> > The trouble is that subsystem is mailing list, thus I still got all of
> > them via b4, which is used to get the discussion.
> > 
> > Send them only to the maintainer, for example. Or maintainer + authors.
> > 
> > Basically the same as LKP is doing.
> 
> There are subsystems which want email reviews to be sent to the subsystem
> mailing list. In fact, all currently configured email policies came from maintainers,
> I don’t push anything based on my own preferences.

In the case of ext4, we have a weekly video conference of the core
developers, and last week I asked the ext4 core developers whether we
should start cc'ing the linux-ext4 list.  When I first asked Roman to
send the reviews to the me as the reviewer and the patch author, I
didn't want to cc the list in the case people would find annoying.

The discussion in our video chat was that the quality of the reviews
was quite good, and the only feedback from the ext4 developers was (a)
pre-existing problems that were unrelated the patch series, (b)
sometimes the problems that was pointed out are ones that we don't
care about (for example, there was a recent comment about readahead
detection being racy, and that was not ext4-specific, and readahead is
a hint and if two processes are reading the file at the same
time.... oh cares how the system handles the hueristic of something
which is a hint anyway), and (c) while Shashiko is good at pointing
out problems, its suggestted solutions aren't as good.

But that's OK, on the whole, the Sashiko is finding problems that
humans very familiar with code base had missed.  And so it's certainly
better than most human reviewers.

Based on that, the consensus of the ext4 core developers that it would
be better to make sure that the linux-ext4 list should be cc'ed.  So
that's a decision that didn't come from me as the ext4 maintainer, but
after consulting with core ext4 developers and reviewers.

> I agree, it’s sometimes gets tricky when a patchset is sent to
> multiple mailing lists, which policy to apply.

What I would suggest is that if we have a patch which is cc'ed to say,
linux-xfs, linux-ext4, and linux-fsdevel, as well as a dozen
developers suggested by get_maintainer.pl, and only the ext4 list has
requested the reviews, then only send it to the ext4 maintainer, the
ext4 mailing list, and the patch author.  The Sashiko review doesn't
need to be cc'ed to the other lists, or the dozen or so other
maintainers.

Cheers,

					- Ted
