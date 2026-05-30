Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2253438A8
	for <sashiko@lists.linux.dev>; Sat, 30 May 2026 16:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780158158; cv=none; b=qmLvTr1pBlppSH3AuldA0EPtBdb81ERgOgadxIvrSuDJ868pgPh5IGkDY6jbSxZN7wRaQnzsof7tUmKZpYbeT93+y1ixsnQuxAd+77cg4xdLXRw/AnrOMJe1ngXVhh6EdqvC0/tPnad2VFp9Tj1C1H4TgUljhntWRAB9F3Jl6L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780158158; c=relaxed/simple;
	bh=g9JxJ/L/uuvgHaq+xkLfHK5Gh6MGUpU6tlVLhcHNWKc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hNt95BuAFdKUV9M+vUALv6lM4acVn01x7LQ49u1otk8v2tA8t0bw0lPqShmK3pgnTKcBwr6pdx/M0Q9BwKJmifdBruI1CsG98bTR9PyTtwkFMr1iZVHqIPQzGtqU5G1rkQcUZowUThX92aS0WQJ+DUceWfcqh0Q6GYRc8PuTKzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VtWkRLj4; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VtWkRLj4"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780158153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=g9JxJ/L/uuvgHaq+xkLfHK5Gh6MGUpU6tlVLhcHNWKc=;
	b=VtWkRLj4GbeNFbzPCKi4NWWX9HqwUKAaQhCdgv2/oQ7dcBlqTgRUVe5wyoHoDxK7OV0PWl
	QuwwIELSjAdudAdLL8EMqaWmTqkNXfXNGh4PJjtbqpt5J+5sSrYrHsyKnweYsOhHqSGGEy
	EpCl2RMyOLnVhJgOOWu1Jim5EvE/zRU=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: "sashiko@lists.linux.dev" <sashiko@lists.linux.dev>
Cc: Sasha Levin <sashal@kernel.org>, Chris Mason <clm@meta.com>, Tamir
 Duberstein <tamird@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, Sean Christopherson
 <seanjc@google.com>, Muchun Song <muchun.song@linux.dev>, Derek Barbosa
 <debarbos@redhat.com>
Subject: Sashiko v.0.2.0 release
Date: Sat, 30 May 2026 16:22:08 +0000
Message-ID: <7ia45x443m1b.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT

Hello,

Sashiko v.0.2.0 has been released and deployed.

Most notably, reviews got on average ~2.5x faster: from ~35 min to <15min.
This should affect local setups as well, assuming you're not throttled
by your LLM provider.

To achieve this I had to completely rework the LLM toolbox to allow
running stages 1-7 in parallel. As a bonus, it's overall better and more
consistent now and I saw a small bump in the findings rate, which
balanced recent changes by Muchun Song which forced stages 1-7 to record
dismissed concerns and added a new stage to evaluate consolidated raised
concerns vs dismissed concerns. These changes should reduce the false
positive rate, but it's harder to measure directly. The new toolbox is
also fixing a rare issue when an earlier stage was checking out some
earlier commit, which was confusing later stages (thanks to Tamir
Duberstein for reporting it!).

The web site is also much more responsive now, it was a bit sluggish
recently.

Token usage is slightly up (10-15%); mostly because of an additional
review stage.

Also pulled latest subsystem prompts changes from the review-prompts
repository.

Thanks,
Roman
