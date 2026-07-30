Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3E6331EA5
	for <sashiko@lists.linux.dev>; Thu, 30 Jul 2026 01:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785375814; cv=none; b=l50HBUQbzBCmMnYWBRCTlybCciqJa8KJcqKsIgWtv7/N5rywO0tcC2B2L1FRcmtD8BpEbRqrRECH84uGA0OCAo1TeShbklao7yv9l9dqX6lLiTUIVzYwtts0Bp+ltAEQGgez4+pVBDfX3OEbGVt5HYNKOVWAPYm3bV50FNPHEwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785375814; c=relaxed/simple;
	bh=eZjU+wrScFj214IPf1z8JOw+1kKFlIgUzXtDRyZZC5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=YDIeZTrv2ChMVcQB042Zr7LqxuGvEE7ylD7Fo4S7kUU+FCdzN1yhP37MZ3YxQA5q9ZD3a4/tHpscOYv5XLfvF71N9tEyqScjC6Ki6dYOPHp09MwHTv+ktCIYb5RLV43EAQ9hbC9fOreZE9aPOwiJ5AViQMiKDud8/FM9wE30RjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MUCsdU95; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MUCsdU95"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785375811;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=eBXR4+GqH78/uRdFCB+1/EBhd1JrYMinGz0xNBa3Erg=;
	b=MUCsdU95bldNLvsANiGR//ja7zbFol0JylZkIvTYV7fhNWHO11SyPQe6IemqB2VHjVFHwP
	yR4V6ksTQwGbUny0HyK81YvGfpwLvOYOOEdMSnXJSDYqWAwZ5n3Xhh992sgEVTgqTgdZBW
	NACpuNXsVb9OLmU9B5+IU4sUQD+m1H0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-390-tsd72BpdORiLtwLuoXXGVA-1; Wed,
 29 Jul 2026 21:43:30 -0400
X-MC-Unique: tsd72BpdORiLtwLuoXXGVA-1
X-Mimecast-MFC-AGG-ID: tsd72BpdORiLtwLuoXXGVA_1785375808
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 67F841800350;
	Thu, 30 Jul 2026 01:43:28 +0000 (UTC)
Received: from localhost (unknown [10.22.65.148])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BDFB9195608E;
	Thu, 30 Jul 2026 01:43:27 +0000 (UTC)
Date: Wed, 29 Jul 2026 21:43:26 -0400
From: Derek Barbosa <debarbos@redhat.com>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: sashiko@lists.linux.dev, Christoph Hellwig <hch@lst.de>, 
	"Darrick J. Wong" <djwong@kernel.org>, clm@meta.com
Subject: Re: Full subsystem codebase scan for identifying pre-existing issues?
Message-ID: <amqgKj06QbSWJ9RT@debarbos-thinkpadt14gen5.rmtusma.csb>
Reply-To: debarbos@redhat.com
References: <CAJnrk1Y6twWcXfFesbLMNfMavg5RWgQ07pGJ1BM98V4o+FYcBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAJnrk1Y6twWcXfFesbLMNfMavg5RWgQ07pGJ1BM98V4o+FYcBw@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2VF-nnmULTacKKzTZ-_TK1A7myAXWh3ZqUz9wYkIbAo_1785375808
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Jul 29, 2026 at 01:34:10PM -0700, Joanne Koong wrote:
> Hi,
> 
> Is there a way for Sashiko to run a full scan of a subsystem/tree to
> identify all the pre-existing issues so that they can be fixed
> proactively?

At the moment, no. At least nothing that I am aware of :)

There have been some small conversations about such functionality, but nothing
has really taken shape yet. One of the concerns was trying to validate the sheer
number of potential-false-positives, and how to present such information in an
actionable manner. IIRC syzbot/syzkaller's way of storing such data was used as
a comparison point here.

FWIW, Chris Mason has a repository for a tool that runs such scans on codebases
-- paired with tools like semcode. His prompts are the same ones that we
frequently sync back to Sashiko. It won't solve the other point you made, but it
may be worth looking into. [0][1]

> Currently, they're flagged on patch reviews, which can be
> a bit frustrating for contributors who didn't introduce the problem,
> and adds a bit of noise for maintainers/reviewers looking at the
> Sashiko report.

Unfortunately, you aren't the first to report a problem with these.

Currently, in the 11th stage instruction in the code, pre-existing issues are
propagated in the report like so:

<snip>

CRITICAL RULE: If a finding is flagged as pre-existing (`\"preexisting\":
true`), you MUST explicitly state in your inline comment that this issue is
pre-existing and was not introduced by the patch under review. Use phrasing like
\"This isn't a bug introduced by this patch, but...\" or \"This is a
pre-existing issue, but...\" to start the comment.

</snip>

Instead of them replying inline with "This isn't a bug introduced by this patch,
but by..." or "This is a pre-existing issue, but does..." how would you like to
see this information presented/conveyed?

I created an issue here [2]

> 
> Thanks,
> Joanne
> 

[0] https://github.com/masoncl/kres
[1] https://github.com/masoncl/review-prompts
[2] https://github.com/sashiko-dev/sashiko/issues/381

Thanks,

-- 
Derek <debarbos@redhat.com>

