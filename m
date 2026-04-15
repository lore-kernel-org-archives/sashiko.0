Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6CE2DF152
	for <sashiko@lists.linux.dev>; Wed, 15 Apr 2026 01:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776217100; cv=none; b=MUyqJqOJre4ILEXX7kAF3TeV8aDE6ZCTKMwM9YfWI03yCot7Wi0eD08uFConc6yTszJiO6amvj4YqTTJ3AY3rCjLskBtNeAnlPDv27cqFkzL1sLnNK4obFnnaB/iHOc/eN739HAOi6sXFdZ6/m9G5xKjNuqsxLg9ViLseHuYFNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776217100; c=relaxed/simple;
	bh=8236b9mbN+2E7PpE7lzSMx2BibEd6OQQ55iPLnplgaw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rY9gV0iFL53GDC3ZVf0gD0AYh/g/rjNcXSgTq2O6UHij+W4k+jteLLa2QczS3ziZ9UeHyXNsySO4QFY+1fbQbg+FzQTgSTkdGdeMFSY05sfd63uMLwfvAQFO1iD9qPc+n9D65js1ob9aCSSVvI0ZRUNc6EXvqfPkhUKzy88lfoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=o/9C1NNU; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="o/9C1NNU"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776217095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dBf6d8TFpxAPcK0BIqc8Qp+lBwa1cqZCk/3M/inu0nM=;
	b=o/9C1NNUnKVCTYBxMmpDSj2WdukabWgFuCgq7Ou1U6siL3rqFCY9u7n3NyrYV3YaDl3Dp/
	RMQOOAcH/PzkD+aU0iJHmwMyh9uEICpzw/nnc8QIZl+EOGHS6fiAsdv2xn2Najbuihofbd
	NwbctpDZIp/Lwbhf9bztvLXozgMoyNI=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: SeongJae Park <sj@kernel.org>
Cc: sashiko@lists.linux.dev
Subject: Re: [feature suggestion] fixup patch review
In-Reply-To: <20260415013032.76585-1-sj@kernel.org> (SeongJae Park's message
	of "Tue, 14 Apr 2026 18:30:31 -0700")
References: <20260415013032.76585-1-sj@kernel.org>
Date: Wed, 15 Apr 2026 01:37:51 +0000
Message-ID: <7ia4se8xvw9c.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT

SeongJae Park <sj@kernel.org> writes:

> On Wed, 15 Apr 2026 01:11:11 +0000 Roman Gushchin <roman.gushchin@linux.dev> wrote:
>
>> SeongJae Park <sj@kernel.org> writes:
>> 
>> > Hello,
>> >
>> >
>> > When a large patch series is posted and an issue on a single patch is found, it
>> > is useful to post a fixup patch as a reply to the review, instead of posting
>> > the entire new version of the series.  It is useful for doing quick reviews
>> > without polluting mailing list and reviewer's inbox.  But it seems sashiko is
>> > not reviewing such fixup.  Would it be possible to make sashiko understand and
>> > review such fixup patches?
>> 
>> Hi SJ,
>> 
>> sorry for the late reply!
>
> No worries, it is never urgent!
>
>> 
>> I like the idea but realistically I'm not sure I'll have time to work on
>> it short-term. These follow-up fixes are often too context-heavy, e.g.
>> are raw untested ideas or are drop-in replacements for some patch in the
>> series, so accurately handling all edge-cases might be not exactly trivial.
>
> Thank you for kindly explaining the challenges, I totally agree that.  Having a
> sort of command-like reply rule for giving the context in easier and explicit
> way, like syzkaller [1], might make it easier, though?

Yeah, something like this might work.

Currently I'm not trying too hard to find a baseline for a patch to
apply, simple because I want to avoid a situation when Sashiko is saying
that the patch is fine [against *some* baseline], but it's not against
the tree where it goes. I guess once Sashiko will start review
linux-next and Linus's tree, we can make it more flexible.

Thanks for the idea!

R
