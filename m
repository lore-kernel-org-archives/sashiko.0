Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453E0401A18
	for <sashiko@lists.linux.dev>; Fri, 31 Jul 2026 12:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785500996; cv=none; b=SgInvWiEu4MM6DUBx1tkEYSata5cjA6CtPHuUWuNSzZJ3APqOTOPV5t07/RyKSluPLaQ/2TbXhADJKIspUw/65kKrQ0Yr6CQ6utXmTBXCb1qsJHWJk4Q3qarvLF8xiQisduhAWRstnqA/YrIuSxd6KeiBYbK2fhC7UExXSMLuZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785500996; c=relaxed/simple;
	bh=PIEwn4ud33wCRSo2LfXTg3UEM23JgSRQKVsEsUZfwDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=PQ9vtKDIposf+ZZAWP9AktstHlfI+kdUmN722dGyfes6vAz9b34M544zvlgfyEhlYYu8PIXdFOMwZ7ZD9/FzhRYgga9tE450IheaMLpwaSTDamcnEoDnRAffR3tNDwzIbMnlItLLjSLjT/8pAdGS/0SDYbuVjqc72mGjggGC5pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c/j58Y+b; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c/j58Y+b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785500994;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l1zKGEp0EzGNdTQxReUYXj2XD+bpcIkx2OlhwWB5+IM=;
	b=c/j58Y+bLBheg/6lhgDPiilKOEMiFRZ+F4f0Q6Zd8zxg8Jk3P+vpLLgToTiXjNDfeZcyaU
	+PKlp3iNwZKQK/WtWlRemvPMYg9Pj3gOyazhOs/vUkcPx6ALL1U0d30p9O7yq4btjTj9Rk
	bv/GStVT55iUJI7DZAYj5MIbGDbHa+o=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-695-zIspbvYZMkKPzFCUfW39bg-1; Fri,
 31 Jul 2026 08:29:49 -0400
X-MC-Unique: zIspbvYZMkKPzFCUfW39bg-1
X-Mimecast-MFC-AGG-ID: zIspbvYZMkKPzFCUfW39bg_1785500987
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6E2401956041;
	Fri, 31 Jul 2026 12:29:47 +0000 (UTC)
Received: from localhost (unknown [10.22.64.143])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D0CF318004AD;
	Fri, 31 Jul 2026 12:29:46 +0000 (UTC)
Date: Fri, 31 Jul 2026 08:29:44 -0400
From: Derek Barbosa <debarbos@redhat.com>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: sashiko@lists.linux.dev, Christoph Hellwig <hch@lst.de>, 
	"Darrick J. Wong" <djwong@kernel.org>, clm@meta.com
Subject: Re: Full subsystem codebase scan for identifying pre-existing issues?
Message-ID: <amyMoBR0WHLSl9Fs@debarbos-thinkpadt14gen5.rmtusma.csb>
Reply-To: debarbos@redhat.com
References: <CAJnrk1Y6twWcXfFesbLMNfMavg5RWgQ07pGJ1BM98V4o+FYcBw@mail.gmail.com>
 <amqgKj06QbSWJ9RT@debarbos-thinkpadt14gen5.rmtusma.csb>
 <CAJnrk1ZBtv4-t=Z-oKBybW+ZUuTn-d2spnZnb5DCH9R0=QLp9g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAJnrk1ZBtv4-t=Z-oKBybW+ZUuTn-d2spnZnb5DCH9R0=QLp9g@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4TFUijYhYr45CUyBKgyQdqZ0JgHZSxJHQKrgM55DFmg_1785500987
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Joanne,

On Thu, Jul 30, 2026 at 05:34:10PM -0700, Joanne Koong wrote:
> Hi Derek,
> 
> On Wed, Jul 29, 2026 at 6:43 PM Derek Barbosa <debarbos@redhat.com> wrote:
> >
> > Hi,
> >
> > On Wed, Jul 29, 2026 at 01:34:10PM -0700, Joanne Koong wrote:
> > > Hi,
> > >
> > > Is there a way for Sashiko to run a full scan of a subsystem/tree to
> > > identify all the pre-existing issues so that they can be fixed
> > > proactively?
> >
> > At the moment, no. At least nothing that I am aware of :)
> >
> > There have been some small conversations about such functionality, but nothing
> > has really taken shape yet. One of the concerns was trying to validate the sheer
> > number of potential-false-positives, and how to present such information in an
> 
> Gotcha, thanks for the context :) That makes sense, that sounds tough
> balancing potential false positives.

We're actively working on trying to get more data (such as semcode) to act as
some sort of backing "evidence" of a finding. That, in theory, should at least
filter out the totally bogus claims. But it is still all a WIP.

> 
> Just thinking out loud here... if those false positives are currently
> getting reported/flagged by Sashiko on contributor submissions
> anyways, maybe it'd still be helpful for them to show up in the
> subsystem codebase scan so maintainers can course-correct the rules
> for them in Sashiko (and hopefully save contributors not as familiar
> with the subsystem some confusion :)).

I see what you mean. I think there may be a way to reach a "good enough"
solution in the interim: https://github.com/sashiko-dev/sashiko/issues/385

> 
> > actionable manner. IIRC syzbot/syzkaller's way of storing such data was used as
> > a comparison point here.
> >
> > FWIW, Chris Mason has a repository for a tool that runs such scans on codebases
> > -- paired with tools like semcode. His prompts are the same ones that we
> > frequently sync back to Sashiko. It won't solve the other point you made, but it
> 
> Awesome! I'm a huge fan of Chris's work. I wasn't sure if there were
> differences in the analysis between Sashiko and Chris's tools, but
> it's useful to know that the prompts are synced from Chris's repo.
> Anecdotally, when I ran a couple of my series through Chris's AI
> systems a couple months ago, there were some things it pointed out
> that Sashiko didn't and vice versa, but I think that's probably more
> due to the underlying LLM being used (eg claude vs gemini).

Right. From what I've seen, different harnesses (claude code, opencode,
gemini-cli, etc) have their own set of underlying prompts and housekeeping logic
that result in an interesting set of permutations when you throw custom prompts
and tool calls in the mix. Sashiko would be an example of a harness (one
tailored to work in a more "distributed" fashion) that calls out to Gemini in
the current "prod" instance).

FWIW I have also seen considerable differences in said prompts across different
harnesses, etc.

> 
> > may be worth looking into. [0][1]
> >
> > > Currently, they're flagged on patch reviews, which can be
> > > a bit frustrating for contributors who didn't introduce the problem,
> > > and adds a bit of noise for maintainers/reviewers looking at the
> > > Sashiko report.
> >
> > Unfortunately, you aren't the first to report a problem with these.
> >
> > Currently, in the 11th stage instruction in the code, pre-existing issues are
> > propagated in the report like so:
> >
> > <snip>
> >
> > CRITICAL RULE: If a finding is flagged as pre-existing (`\"preexisting\":
> > true`), you MUST explicitly state in your inline comment that this issue is
> > pre-existing and was not introduced by the patch under review. Use phrasing like
> > \"This isn't a bug introduced by this patch, but...\" or \"This is a
> > pre-existing issue, but...\" to start the comment.
> >
> > </snip>
> >
> > Instead of them replying inline with "This isn't a bug introduced by this patch,
> > but by..." or "This is a pre-existing issue, but does..." how would you like to
> > see this information presented/conveyed?
> 
> I (like Andrew) also find the pre-existing issue reporting really
> useful and definitely wouldn't want to lose them. Maybe something that
> could help is if they were marked even more obviously as pre-existing
> issues? (eg prefaced with a bold "PRE-EXISTING ISSUE - " or displayed
> in a different font color or enclosed within parentheses). I usually
> look at the web ui and sometimes when glancing at a series (eg [1]),
> it would be faster to differentiate between bugs I caused vs
> pre-existing ones if they were visually marked differently. This is
> not a big deal at all though. Thanks for your work on Sashiko!

I'll take note of that and try to run an experiment or two with your
suggestions. Changing prompts can feel like alchemy at times! :)

> 
> Thanks,
> Joanne
> 
> [1] https://sashiko.dev/#/patchset/20260715174305.336261-1-joannelkoong%40gmail.com
> 

Thanks for the suggestions,

-- 
Derek <debarbos@redhat.com>

