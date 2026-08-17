Received: from mta0.migadu.com (out-112.mta0.migadu.com [91.218.175.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7036E47044E
	for <sashiko@lists.linux.dev>; Mon, 17 Aug 2026 20:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786997557; cv=none; b=VUUmpXI1mt3XxucjTQV6VLT7AGZYERZau9sUWHLHgChFmXE4xIdtMReD5i7BeB55f7ozFncrMe+fpOJgF2XgPjS8JSnLI/V5nD/u7QhGkq1Wr7nNgkWnSfndcUuz8FsWeyGrGd03uXgFZ/oCEXasdUZEDCJZPvSCyXwvBDqZd8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786997557; c=relaxed/simple;
	bh=L6SRbNZMiE2tE4jdv5RCJE+PIwl0CHKTclMgIgHfmE4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RTIX8SlOpduoOCbwmyug0fm8Meao+0Ve3GfZ0puATP0MMRzxiKkGv1trhqXNuthmOIrZKOLk/lxbGCueBlVb4dTC1UHI3f5uqWhnX/INUsiflkXJ3mqbYEuJuEWVZG4XcIF0zVUkXRPeU1wdR8EiTsNfzbqN5DKrksXOENyz5Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OEKl4hr5; arc=none smtp.client-ip=91.218.175.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OEKl4hr5"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=L6SRbNZMiE2tE4jdv5RCJE+PIwl0CHKTclMgIgHfmE4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786997552; v=1; x=1787602352;
 b=OEKl4hr5a3br4HKmMysEkS3u4aHvvLc3vl30ohiQ3o4RXBX68Eb+ASmqfKCx6C02zgaFwElH
 pj0rvJeowWOIpbwo7OSyZRwYx4vf4GjHQ0Domg/IXVlcXHMNL3vNoM29evIsDrscuYNmdSbMHrp
 rNkR3J38VtyWi1tg8L/3WM1g=
X-Envelope-To: sashiko@lists.linux.dev
Received: from castle.c.googlers.com (35.227.148.244)
	by mta10.migadu.com with ESMTPS id fe909d0a4d99544b;
	Mon, 17 Aug 2026 20:12:32 +0000
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: debarbos@redhat.com,  Joanne Koong <joannelkoong@gmail.com>,
  sashiko@lists.linux.dev,  Christoph Hellwig <hch@lst.de>,  "Darrick J.
 Wong" <djwong@kernel.org>,  clm@meta.com
Subject: Re: Full subsystem codebase scan for identifying pre-existing issues?
In-Reply-To: <20260729190158.fa32a6fd1f06d5103add0533@linux-foundation.org>
	(Andrew Morton's message of "Wed, 29 Jul 2026 19:01:58 -0700")
References: <CAJnrk1Y6twWcXfFesbLMNfMavg5RWgQ07pGJ1BM98V4o+FYcBw@mail.gmail.com>
	<amqgKj06QbSWJ9RT@debarbos-thinkpadt14gen5.rmtusma.csb>
	<20260729190158.fa32a6fd1f06d5103add0533@linux-foundation.org>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Mon, 17 Aug 2026 20:12:29 +0000
Message-ID: <7ia4a4qkfqvm.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Andrew Morton <akpm@linux-foundation.org> writes:

> On Wed, 29 Jul 2026 21:43:26 -0400 Derek Barbosa <debarbos@redhat.com> wrote:
>
>> Hi,
>> 
>> > Currently, they're flagged on patch reviews, which can be
>> > a bit frustrating for contributors who didn't introduce the problem,
>> > and adds a bit of noise for maintainers/reviewers looking at the
>> > Sashiko report.
>> 
>> Unfortunately, you aren't the first to report a problem with these.
>> 
>> Currently, in the 11th stage instruction in the code, pre-existing issues are
>> propagated in the report like so:
>> 
>> <snip>
>> 
>> CRITICAL RULE: If a finding is flagged as pre-existing (`\"preexisting\":
>> true`), you MUST explicitly state in your inline comment that this issue is
>> pre-existing and was not introduced by the patch under review. Use phrasing like
>> \"This isn't a bug introduced by this patch, but...\" or \"This is a
>> pre-existing issue, but...\" to start the comment.
>> 
>> </snip>
>> 
>> Instead of them replying inline with "This isn't a bug introduced by this patch,
>> but by..." or "This is a pre-existing issue, but does..." how would you like to
>> see this information presented/conveyed?
>> 
>> I created an issue here [2]
>>
>> [2] https://github.com/sashiko-dev/sashiko/issues/381
>
> "To a separate section" is OK.
>
> I wouldn't want to lose the pre-existing issue reporting.  I don't see
> that an author is obligated to address these things (although they
> often do).  But I like to see that the pre-existing things are brought
> to the official maintainer's attention.
>
>
> And yes, it's all very disorganized and error-prone.  How nice would it
> be for Maintainer to think "hm, I have a few hours to spare - what bug
> reports are there against my stuff".  Then click on a link.

As Chris mentioned in the thread, we're working on it: a dashboard
of corresponding issues available to all maintainers.

Thanks
