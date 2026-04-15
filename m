Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7666529827E
	for <sashiko@lists.linux.dev>; Wed, 15 Apr 2026 01:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776215513; cv=none; b=YZS+Jw4JCnq3+bgbF6DDH+7yGNN9olWon0U/TDT24XpU9OBZqeYqx6VLUCW4+pUzZz5tT8OvtpfHR9a1XlufL/lrh0SAO2u5BsJskfBdM3J3INNrgUcSheNeVoZ2DCAQyJ6f/r/atDhD+CRLucBuyLktx66nvs5fNgOdzpXifQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776215513; c=relaxed/simple;
	bh=MRPMQrjK12soIcyQAJQVjv5Ez1PkEPBGsy5qdbnexcc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=n59zcBEUEHAJGEHX8JeMOyU8h2UHIlMom4hDELRuIWRVBgnQNFKmZB8njvXlXMm+SAf74HuAtuMJqeOWcDUV3I1+77+ipWVAIXLbPdpz3KUekA3y01BEyik3EWoQjiO3OfGrtMLNvNvUpXT9fc7tRUt7P6PPCPALxDd+X38/0Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GQ4o5y3b; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GQ4o5y3b"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776215509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TTlarwyeiN7cHVurBVp0Yy/YI+OyPgaNCo/2eUZ6EaU=;
	b=GQ4o5y3blWGDTIc8v/mXq9L9+WuK4CzF490c0kiFO+3ULzhEyR2cSY0fpuVNEitRkoEbow
	Vy+ilcaEdNW8VNbSQJUh3+/wvuAqNFYU1MABBY7/esr+vNxNyj72GkjkeyXwPR372m56Dl
	cpzxk/wLWQUL1M1t47hkuvIcN2xmB8k=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: SeongJae Park <sj@kernel.org>
Cc: sashiko@lists.linux.dev
Subject: Re: [feature suggestion] fixup patch review
In-Reply-To: <20260411182251.80335-1-sj@kernel.org> (SeongJae Park's message
	of "Sat, 11 Apr 2026 11:22:50 -0700")
References: <20260411182251.80335-1-sj@kernel.org>
Date: Wed, 15 Apr 2026 01:11:11 +0000
Message-ID: <7ia4wly9t4cw.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT

SeongJae Park <sj@kernel.org> writes:

> Hello,
>
>
> When a large patch series is posted and an issue on a single patch is found, it
> is useful to post a fixup patch as a reply to the review, instead of posting
> the entire new version of the series.  It is useful for doing quick reviews
> without polluting mailing list and reviewer's inbox.  But it seems sashiko is
> not reviewing such fixup.  Would it be possible to make sashiko understand and
> review such fixup patches?

Hi SJ,

sorry for the late reply!

I like the idea but realistically I'm not sure I'll have time to work on
it short-term. These follow-up fixes are often too context-heavy, e.g.
are raw untested ideas or are drop-in replacements for some patch in the
series, so accurately handling all edge-cases might be not exactly trivial.

Thanks
