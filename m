Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9ACA233723
	for <sashiko@lists.linux.dev>; Sat,  4 Apr 2026 00:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775264165; cv=none; b=MtE7BWavzzhtNgZ3PSZROt4vZTc+fnwU/zoefxe7bdtzm5/2AwsDr6B9yA80sCrLXEugVACMh05JWlDVg/awzgSr5Vttd5a+NeyKDJ42CoyOkjx1LNj3kkTiQ7hCzlZAdWFlNqDqIh+WO/+JB8srwzvEaTzdN2ou+zS6t13jzNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775264165; c=relaxed/simple;
	bh=reX6Ccn0iEVbYn4v2Y8qdkiOQWESCNMHUJUX4OyqdZc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tvoC+bqnbQvJItxNMFBlOU62AgbAcnJHMZiJRvRGN7gg8ULln2865XVYr3CZc/YI/XzlN9t4UoBgwuGjaSj5Jv7ko9hS3NWY/bthntQL6IQLNSEJ4gg9PRE7591ve5JbNGWUuAv/i1IfE/0rrzrSLRczySFVP/zH/9gopTUCnew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mKFcpm4C; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mKFcpm4C"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775264161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=reX6Ccn0iEVbYn4v2Y8qdkiOQWESCNMHUJUX4OyqdZc=;
	b=mKFcpm4CslmuBc9Q0Q8AzEvAiJD4zmyWF9Lm3DS9Vf075CaaI1Ra+QS0iz9B+2HuSV+fwD
	Xr2tl3xriqXUfeodIJbs2sv0dSt553tY4ejCRvj+w/f7jta9F3x4CfgLj2pJy0u7WE6rqR
	FAojPIIBzh7bYGWo7mpw0hjvqsos+Pc=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Xin Long <lucien.xin@gmail.com>
Cc: sashiko@lists.linux.dev
Subject: Re: [QUESTION] how to submit multiple reviews on the same patchset
In-Reply-To: <CADvbK_cmh_9rRnbADVm04JWVtjEoQVReR1m1ZP7djPwQxA=feg@mail.gmail.com>
	(Xin Long's message of "Wed, 1 Apr 2026 23:39:53 -0400")
References: <CADvbK_cmh_9rRnbADVm04JWVtjEoQVReR1m1ZP7djPwQxA=feg@mail.gmail.com>
Date: Fri, 03 Apr 2026 17:55:48 -0700
Message-ID: <878qb3lf1n.fsf@linux.dev>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT

Xin Long <lucien.xin@gmail.com> writes:

> After running the server locally by `cargo run`, I submitted a review by:
>
> `cargo run --bin sashiko-cli -- submit HEAD~15..HEAD`
>
> I could see one item on the list of the webpage in review.
>
> While it was in review, I wanted to submit a new review on the same
> patches by the same command:
>
> `cargo run --bin sashiko-cli -- submit HEAD~15..HEAD`
>
> However, after doing that, I didn't see a second item on the list of
> the webpage, and it seemed the server just ignored the submission.
>
> So is there any way that I can submit multiple reviews on the same
> patchset? with something like ID or subject?

No, there is no such option now. And if adding, I'd say let's add an
option to run multiple reviews for each patch within the same patchset,
let's not create multiple patchsets for the same git range.

Thanks!
