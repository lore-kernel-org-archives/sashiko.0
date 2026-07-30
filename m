Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD4222A7F0
	for <sashiko@lists.linux.dev>; Thu, 30 Jul 2026 02:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785376921; cv=none; b=hFKA5WwsFdm1ZZuGE+hZbOxXKWQLDzvTLhKr4YnQBcckw/1ZMmAQsru8GoLRuXIslY7d6XSPUy+ioonlrkHHxzrTmbOMUlvZ5cxXWK7Hskt6n/J9N4RqmsZ4eZ7dxSzacUxZR/RHvdM2AIrPrcqAazHfqEELx+ysyY/2cMUzHck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785376921; c=relaxed/simple;
	bh=F310HNL/l/43LOsvhQB1g1LgTojgr6Iogn4Qff4H698=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=JXV0X1ZjDGYuIkkzcb1l5kyFwfoBDC+cKxeQDNEzC94JmVyqYPUscxFuayS1C2KQzp1+eAFKh7p2UPEyKbf82shTtUYOgLaQvFENqfkb4pj0ltodTmSw+MzX5ty42ECzMIJ9Bq/fqglMLQ2T2wGdx3BCcyVAI8wPxzMz1QQL9bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hfK3ydvj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hfK3ydvj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20EF21F000E9;
	Thu, 30 Jul 2026 02:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1785376919;
	bh=QDoCV7jbVIMYHOff1sV9a0yaowvdQ8PZ3VPn+MgNESM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=hfK3ydvjdlxKzhqjHCkLNNkjX2ee/QDhUx6thtjGd/RQk4GlEz6qcpfzMlAF78cdo
	 HN0F5Z8UTKttqD+CMLDhiZ9Oglym3L0gIHlJ3hCry6GqA3Gg7aMCsqwttpu+sEvCmP
	 xenNrFgTJYGJXYkN21CsgcNTBqgCHjcWWDLStqQU=
Date: Wed, 29 Jul 2026 19:01:58 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: debarbos@redhat.com
Cc: Joanne Koong <joannelkoong@gmail.com>, sashiko@lists.linux.dev,
 Christoph Hellwig <hch@lst.de>, "Darrick J. Wong" <djwong@kernel.org>,
 clm@meta.com
Subject: Re: Full subsystem codebase scan for identifying pre-existing
 issues?
Message-Id: <20260729190158.fa32a6fd1f06d5103add0533@linux-foundation.org>
In-Reply-To: <amqgKj06QbSWJ9RT@debarbos-thinkpadt14gen5.rmtusma.csb>
References: <CAJnrk1Y6twWcXfFesbLMNfMavg5RWgQ07pGJ1BM98V4o+FYcBw@mail.gmail.com>
	<amqgKj06QbSWJ9RT@debarbos-thinkpadt14gen5.rmtusma.csb>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 29 Jul 2026 21:43:26 -0400 Derek Barbosa <debarbos@redhat.com> wrote:

> Hi,
> 
> > Currently, they're flagged on patch reviews, which can be
> > a bit frustrating for contributors who didn't introduce the problem,
> > and adds a bit of noise for maintainers/reviewers looking at the
> > Sashiko report.
> 
> Unfortunately, you aren't the first to report a problem with these.
> 
> Currently, in the 11th stage instruction in the code, pre-existing issues are
> propagated in the report like so:
> 
> <snip>
> 
> CRITICAL RULE: If a finding is flagged as pre-existing (`\"preexisting\":
> true`), you MUST explicitly state in your inline comment that this issue is
> pre-existing and was not introduced by the patch under review. Use phrasing like
> \"This isn't a bug introduced by this patch, but...\" or \"This is a
> pre-existing issue, but...\" to start the comment.
> 
> </snip>
> 
> Instead of them replying inline with "This isn't a bug introduced by this patch,
> but by..." or "This is a pre-existing issue, but does..." how would you like to
> see this information presented/conveyed?
> 
> I created an issue here [2]
>
> [2] https://github.com/sashiko-dev/sashiko/issues/381

"To a separate section" is OK.

I wouldn't want to lose the pre-existing issue reporting.  I don't see
that an author is obligated to address these things (although they
often do).  But I like to see that the pre-existing things are brought
to the official maintainer's attention.


And yes, it's all very disorganized and error-prone.  How nice would it
be for Maintainer to think "hm, I have a few hours to spare - what bug
reports are there against my stuff".  Then click on a link.
