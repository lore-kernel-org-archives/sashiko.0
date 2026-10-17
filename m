Received: from mta0.migadu.com (out-117.mta0.migadu.com [91.218.175.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5854CF49A
	for <sashiko@lists.linux.dev>; Sat, 17 Oct 2026 20:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792267857; cv=none; b=C0raQpOEsCtp2EShUL7RKngOZte8cgHkTIcn5JIM4QuboA/9U0V5QnT2bFVa7Sc6qVL3Etuu3OadXoeuDFXYkDAgxfpSlkcO7nz13acvsrXMRxR9vMd4ns3YWQ4z85+JSs4PwjYVZabt18fArturDjNjhM/XkeFcWhYOe+clfUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792267857; c=relaxed/simple;
	bh=/o9PutE7ve2BLWpYxLXubQLr9ACtnYXON+sMLCZeTfE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=U6YbLJTB8UtOPwjgbaOCB6HRWSfrKwdJWkUEB3G5dgXvh8Xdp9helYnWYrrrYB+0m4pFxNovJi1TFM0RgVTek1kE4+ZhfwlrsDkvRWc5R+qUQXesnNjI75q+Rl7Nb7mtTWPycRLwljC6lEgPV5GB+6VdaLHy38EZPzMidZaDsEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qBLurYCt; arc=none smtp.client-ip=91.218.175.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qBLurYCt"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=/o9PutE7ve2BLWpYxLXubQLr9ACtnYXON+sMLCZeTfE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792267852; v=1; x=1792872652;
 b=qBLurYCtVSUX6FMWJDLmHYg3W13NZOuJ0kOEXVYi6hJo+UTXv3e+coSA51w79Ab8+fw3GfkO
 HkPp4q6S3o+ATIDzg1oTQ8pAScExlftSmXhgXXrRAd9ilSijyCVZbTjR6n7yz/M/KwI8oTK+14o
 TkTrcCJ0AmgECaeenF4U6fB8=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta11.migadu.com with ESMTPS id f2a9929c60f8496e;
	Sat, 17 Oct 2026 20:10:52 +0000
X-Mizu-Trace-ID: f2a9929c60f8496e
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jiri Kosina <jikos@kernel.org>,  ksummit@lists.linux.dev,
  sashiko@lists.linux.dev
Subject: Re: Patch pre-submission to Sashiko
In-Reply-To: <CAHk-=wj24dSSRDQjvkmcw9LMC=K86d-Xys9=qX=gKoXgrQN1UQ@mail.gmail.com>
	(Linus Torvalds's message of "Sat, 17 Oct 2026 08:20:49 -1000")
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>
	<CAHk-=wj24dSSRDQjvkmcw9LMC=K86d-Xys9=qX=gKoXgrQN1UQ@mail.gmail.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Sat, 17 Oct 2026 20:10:44 +0000
Message-ID: <7ia47bjg141n.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Sat, 17 Oct 2026 at 07:39, Jiri Kosina <jikos@kernel.org> wrote:
>>
>> Another option I'd like to propose would be to introduce a way for
>> submitters to run patches through back-and-forth with Sashiko even before
>> properly submitting the Sashiko-polished v1 to maintainers and
>> mailinglists.
>
> I think maybe we should make it really easy for people to run their
> some kind of sashiko setup on their own, rather than rely on sashiko
> itself. After all, these are all people who use an LLM to begin with.

It is really easy now:
$ cargo install sashiko
$ sashiko init
set the LLM key
$ cd linux && sashiko review HEAD^5..HEAD

> And assuming they sre starting out, they are probably are *not*
> building their own local LLM for this either, so presumably /
> hopefully they have a fairly capable LLM setup, and the problem is
> primarily lack of kernel knowledge (and possibly LLM background too -
> that side was certainly a learnign experience for me).
>
> So maybe at least one piece of the puzzle is us pointing to existing
> sashiko (or sashiko-like) rules so that people who use LLM's get the
> "basic rules" almost by default, rather than burdening sashiko more.

If we're adding AGENTS.md and/or skills into the kernel tree,
we can add an instruction on how to install and run local sashiko
and instruct agents to do it as the part of the process.
I actually use this for developing sashiko itself, works well.

Also I'm going to add a simple way for maintainers to add subjective
instructions (e.g. "don't send me typo fixes" or "X is frozen, don't add
new features", or "if you touch Y, run Z tests and include results"),
so hopefully it can stop some number of really bad patches before
the mailing list.

> .. and I do still think that we should have some kind of "sashiko
> doesn't answer for 18 hours" kind of limiter. Possibly with some
> back-off per submitter (and by patch series size) so that repeated
> submissions get spread out even more.

It sounds like maintainers have drastically different preferences here,
so I guess a per-mailing list configuration is the only reasonable
setup? I'm trying to be on a conservative side, so e.g. if there is no
consensus between maintainers, I do not enable emails.

Jiri, is it about some specific mailing list? We can enable e.g. 24h
embargo there.

Thanks
