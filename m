Received: from mta0.migadu.com (out-167.mta0.migadu.com [91.218.175.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AA978F4A
	for <sashiko@lists.linux.dev>; Mon, 17 Aug 2026 20:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786997909; cv=none; b=kIBZgq3Rgi7aS7dj2ZEXWXQBLsW/CeiuBYU4MVb4MXYz9oY9wNZdfI0Nt6dEIGQAC7d4vBsb9KiCmpVpcYIVjIxUZoprd09kOfVq2JnB9MPKEQN8vQxzJefrzRkTwf/YBw44jaotuOmzzw/QPphmJXUi5vXUPJiH9fz5Sv2jh2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786997909; c=relaxed/simple;
	bh=xRK7niIrVXypIfNxAokaMymZAiUkg3jA+aSbYB+vpKo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CrKmVP+APSzIuAjR8DvUJcnsfq+z4mmgdC2h4bnXAaIdZJ194y9synT0zKpE6vC4/kG09bXhzUiiuYe+m8VhbgBWmD5h2r+U3myQx2fzxgVS/+W2zxQnkAtuT0fOfbyVzuXsjBxmLyBUBswPou6TGzAURFW8hY+myPFp/JOVY3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RzCIqKN1; arc=none smtp.client-ip=91.218.175.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RzCIqKN1"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=xRK7niIrVXypIfNxAokaMymZAiUkg3jA+aSbYB+vpKo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786997906; v=1; x=1787602706;
 b=RzCIqKN1gV277YYG/bkGyrZB2SSMwR2Y2WXk2K7oNKYWL5pd0cvR3Nl8YJj/RV+0LS5Aueug
 oOJEkkY4z2zU26x9dY0IOfzVtc5EAom6GOns3nlfj9MwgcNQNj7mnC+0XQTYEc2yJYP9n43yVjv
 bHBQk5AE2bhRZvX4GOab+pAE=
X-Envelope-To: sashiko@lists.linux.dev
Received: from castle.c.googlers.com (35.227.148.244)
	by mta10.migadu.com with ESMTPS id c3bc6179d9873be0;
	Mon, 17 Aug 2026 20:18:26 +0000
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: debarbos@redhat.com,  sashiko@lists.linux.dev,  Christoph Hellwig
 <hch@lst.de>,  "Darrick J. Wong" <djwong@kernel.org>,  clm@meta.com
Subject: Re: Full subsystem codebase scan for identifying pre-existing issues?
In-Reply-To: <CAJnrk1ZBtv4-t=Z-oKBybW+ZUuTn-d2spnZnb5DCH9R0=QLp9g@mail.gmail.com>
	(Joanne Koong's message of "Thu, 30 Jul 2026 17:34:10 -0700")
References: <CAJnrk1Y6twWcXfFesbLMNfMavg5RWgQ07pGJ1BM98V4o+FYcBw@mail.gmail.com>
	<amqgKj06QbSWJ9RT@debarbos-thinkpadt14gen5.rmtusma.csb>
	<CAJnrk1ZBtv4-t=Z-oKBybW+ZUuTn-d2spnZnb5DCH9R0=QLp9g@mail.gmail.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Mon, 17 Aug 2026 20:18:23 +0000
Message-ID: <7ia4pkzgec1c.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Joanne Koong <joannelkoong@gmail.com> writes:

> Hi Derek,
>
> On Wed, Jul 29, 2026 at 6:43=E2=80=AFPM Derek Barbosa <debarbos@redhat.co=
m> wrote:
>>
>> Hi,
>>
>> On Wed, Jul 29, 2026 at 01:34:10PM -0700, Joanne Koong wrote:
>> > Hi,
>> >
>> > Is there a way for Sashiko to run a full scan of a subsystem/tree to
>> > identify all the pre-existing issues so that they can be fixed
>> > proactively?
>>
>> At the moment, no. At least nothing that I am aware of :)
>>
>> There have been some small conversations about such functionality, but n=
othing
>> has really taken shape yet. One of the concerns was trying to validate t=
he sheer
>> number of potential-false-positives, and how to present such information=
 in an
>
> Gotcha, thanks for the context :) That makes sense, that sounds tough
> balancing potential false positives.
>
> Just thinking out loud here... if those false positives are currently
> getting reported/flagged by Sashiko on contributor submissions
> anyways, maybe it'd still be helpful for them to show up in the
> subsystem codebase scan so maintainers can course-correct the rules
> for them in Sashiko (and hopefully save contributors not as familiar
> with the subsystem some confusion :)).

This is in work too and I'm even somewhat optimistic that in many cases
Sashiko can generate these prompts automatically based on human
feedback. The tricky part is that human are often wrong too, so Sashiko
can't blindly trust human feedback either.
