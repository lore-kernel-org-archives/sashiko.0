Received: from mta0.migadu.com (out-36.mta0.migadu.com [91.218.175.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B606B363C6A
	for <sashiko@lists.linux.dev>; Mon, 14 Sep 2026 19:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789413100; cv=none; b=gQsB+alvH//V52bz3U4dBsjLWNZoltgfmkM8LgINgpPrDP5tzS9w6ZMuVw7DevLuNh8Yhogz8Dl5A0DDl3rEoJxMbsIECZNUgWzsFx9Z14RTgjtlXIUetmy0UPdNiwO+vKNiej2SE2EVjTSRyh9aOlYYhhnnODHI+9XEvy62hCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789413100; c=relaxed/simple;
	bh=TueKcxQbQqKQVDyV/A+cP76Zu9qWDH83ptdhpyZJm+I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YeJxCdgAIJD5hii+HQImjVpNTdwHQbkzQezj70iJHctT/W7aYvY0DFQsm+QU3ol7729sLAbtditZ1KLwvVZPdTe2obnhW1cWPk4fbskSeA/OF+P3i7EumLKdX4e5bOyQ6tO22foqFntt0dR4Sry1tE8wKkzjRVorpkH+RPqovKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Dymj1j/S; arc=none smtp.client-ip=91.218.175.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Dymj1j/S"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=TueKcxQbQqKQVDyV/A+cP76Zu9qWDH83ptdhpyZJm+I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789413090; v=1; x=1790017890;
 b=Dymj1j/SFG3yypIPNbpC0m+NYYnuaIAFK4o6S5EGLReQlTfUZbBw4abg3CqM3WEHZH+dbuhl
 pSSXbIF5EfZAAeMCRbczbiwQbUJ9XhoqwnEVsqur1f8qQjOt/RwAS8nT25uRviya+79WzJN6aaL
 CoI3nfhiJtwUZs5wqQox9dPI=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta10.migadu.com with ESMTPS id 24356bb99e8fbb2e;
	Mon, 14 Sep 2026 19:11:30 +0000
X-Mizu-Trace-ID: 24356bb99e8fbb2e
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: sashiko@lists.linux.dev
Subject: Re: how to interpret footers
In-Reply-To: <20260913203235.d4965963fc37b11b1dcf6dce@linux-foundation.org>
	(Andrew Morton's message of "Sun, 13 Sep 2026 20:32:35 -0700")
References: <20260913203235.d4965963fc37b11b1dcf6dce@linux-foundation.org>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Mon, 14 Sep 2026 19:11:24 +0000
Message-ID: <7ia4qzivabs3.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Andrew Morton <akpm@linux-foundation.org> writes:

> https://sashiko.dev/#/patchset/20260913-remove-pg_private-v4-0-848550f7574e@nvidia.com
>
> The third-from-final line there implies that a large number of people
> received an email from Sashiko about this patchset.
>
> But I received no such email.  How should I interpret that info?


For sashiko I only see:
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: yukuai@fygo.io, linux-raid@vger.kernel.org

which comes from the linux-raid@-specific policy.

The long list of recipients is from the patchwork bot, which is not
related to Sashiko.

> Also, Sashiko seems to have become more assertive lately.  It used to
> always be "is there a bug?" but now it's "there is a bug".  What
> explains this?

Hm, I don't think there were any changes recently. It seems like it
looks this way when the explanation is long and includes code snippets,
so the question at the end is less noticeable.
But maybe I'm missing something...
