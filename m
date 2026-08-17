Received: from mta0.migadu.com (out-139.mta0.migadu.com [91.218.175.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7721B233944
	for <sashiko@lists.linux.dev>; Mon, 17 Aug 2026 20:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786997738; cv=none; b=nzaQvN+sxmKKNqn2GNbeypMtSYp2CAdIqFHP7FDS9eFsCRPXE8FKAZam4+MOqpUgEKpK/Al5VU8kh9P/W2y31Jke3BvhuhOzmKD9A/Sb/i0X3Mfk5tSQg1z1b23H7sfWIvk0/t8BBFMgZPrCrjT4YSeKLYZMroPxWZkTS7oGZxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786997738; c=relaxed/simple;
	bh=IKi9NACzgf880F1AiBfPS90kwpwnvNSygrHZvr+Qi1w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HzWHJqgAj5Vh6nf+wqEF7BuRQw5YghacTBx+FQvdSlxm8SwBMewPKkoe/891FEZpwr9/3gNhx+aWuzbZwmHCh7ryEpC9G+iSE6+nN/a0W8jiywkljXILf7rzPWcwUuyEohkLXJezSA4k0ACtT5nZUYryo7HrnZQB12JGzGXfdqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gZGdCEZ5; arc=none smtp.client-ip=91.218.175.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gZGdCEZ5"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=IKi9NACzgf880F1AiBfPS90kwpwnvNSygrHZvr+Qi1w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786997734; v=1; x=1787602534;
 b=gZGdCEZ5Sz/utA/rIDfS+rWa0pWpqBIcT9G4eZHZs+BtkuZReDsS+0bp7O4BD/j8dFRGzpD8
 ay81QAzlrF+MwAYUhkgMxokowdoXmXZountoQi4SoegeGtiTu7N4e/irS4r2DSDbOdALnmRMmyJ
 mEWsPmmqQbU2I2Zpc40LDwhk=
X-Envelope-To: sashiko@lists.linux.dev
Received: from castle.c.googlers.com (35.227.148.244)
	by mta11.migadu.com with ESMTPS id 72b4a5bc7027801c;
	Mon, 17 Aug 2026 20:15:34 +0000
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: sashiko@lists.linux.dev,  Christoph Hellwig <hch@lst.de>,  "Darrick J.
 Wong" <djwong@kernel.org>
Subject: Re: Full subsystem codebase scan for identifying pre-existing issues?
In-Reply-To: <CAJnrk1Y6twWcXfFesbLMNfMavg5RWgQ07pGJ1BM98V4o+FYcBw@mail.gmail.com>
	(Joanne Koong's message of "Wed, 29 Jul 2026 13:34:10 -0700")
References: <CAJnrk1Y6twWcXfFesbLMNfMavg5RWgQ07pGJ1BM98V4o+FYcBw@mail.gmail.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Mon, 17 Aug 2026 20:15:27 +0000
Message-ID: <7ia4y0e4ec68.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Joanne Koong <joannelkoong@gmail.com> writes:

> Hi,

Hi Joanne!

> Is there a way for Sashiko to run a full scan of a subsystem/tree to
> identify all the pre-existing issues so that they can be fixed
> proactively? Currently, they're flagged on patch reviews, which can be
> a bit frustrating for contributors who didn't introduce the problem,
> and adds a bit of noise for maintainers/reviewers looking at the
> Sashiko report.

Well, I doubt there is a completely non-frustrating path here and the
current way of doing things is clearly working in a sense that there are
over 1000 upstream fixes now mentioning Sashiko. Somebody needs to spend
time on these findings and nobody obviously has this time freely
available.

That said, as Chris said, we're working on a more systematic way to
handle these findings, I hope to roll it out relatively soon.

Thanks
