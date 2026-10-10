Received: from mta1.migadu.com (out-72.mta1.migadu.com [95.215.58.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBA119DF6A
	for <sashiko@lists.linux.dev>; Sat, 10 Oct 2026 15:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791647611; cv=none; b=JJ/AteRrD0UpRJ1YXPT/ekQhlUEf64R4wy/8oOexOB2moIPcJzEVGXCOdai4vH9U7X6tQ57xuVGyOOKmwZlwu6obQ4iS1OZUIqoZSz1zVjO+LuY7EYKEKIQiJ4hhoyXCjzt6GMPm7IhYjjh0zGzIWTWKRzruobWx6XeuP30zApM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791647611; c=relaxed/simple;
	bh=3PX+YnzIrGeVbz9/pR6TfUzzrA1lJ6qWkvVwp6u1jvE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cHJCahElkVpB9859KCpUC4I9Rm769y7vn6sc/sBEpPcUMEZXgCp4UvzSGmqZdlrNYbZDeeb1LRzBBAgWJww3NGFNuspPlieNxQBdShproxDJ0PRF+1D5bV8m187DWyLJxGqpYM8CRVlQGN3COPHdnG3t4gXLcyWmd6nGVAHUkwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Wl14UCuV; arc=none smtp.client-ip=95.215.58.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Wl14UCuV"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=3PX+YnzIrGeVbz9/pR6TfUzzrA1lJ6qWkvVwp6u1jvE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791647605; v=1; x=1792252405;
 b=Wl14UCuVn63vFjD2/ZZzT9pVNYOni6wSmP0POqW/WsHJyc65DWE0/J0mmU+khOFGZgUxoItb
 19F8vguDExeOtmmspHHk4ywVOb2aHGTJrrjzoF5Qfx3bryLl3x8gqlgirbneD+rqEPvoxOeAtcL
 f6WQI4+sjra052T088O19j70=
X-Envelope-To: sashiko@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 9bf5cdb562dee6dc;
	Sat, 10 Oct 2026 15:53:25 +0000
X-Mizu-Trace-ID: 9bf5cdb562dee6dc
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Chris Mason <mason@kernel.org>
Cc: sashiko@lists.linux.dev,
	Roman Gushchin <roman.gushchin@linux.dev>,
	ihor.solodrai@linux.dev,
	ast@kernel.org,
	kuba@kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: Re: [RFC] reworking the review-prompts subsystem guide
Date: Sat, 10 Oct 2026 16:53:21 +0100
Message-Id: <20261010155321.2539213-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <c007a163-91a6-4e2a-b8de-057b61d369aa@app.fastmail.com>
References: <91e21331-ed6d-4ac0-b237-b01aeadca2d1@app.fastmail.com> <20261009141710.1871697-1-fuad.tabba@linux.dev> <c007a163-91a6-4e2a-b8de-057b61d369aa@app.fastmail.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Chris,

On Fri, 09 Oct 2026 18:57:53 +0100, "Chris Mason" <mason@kernel.org> wrote:
[...]
> There's already a way to pass specific parts verbatim, which feels more
> correct than under a "new code" label.  We can play around with a few
> ideas though.

A verbatim file works. I'll send a KVM/arm64 one, policy only, with the
patch that brings back the dropped questions.

[...]
> I'll do another run and put the full build up.  We can see if it's too big
> to be useful or if we can make the index strong enough to get around
> needing the per-model analysis.

When it's up I can put numbers on it: I have a test set of 115 buggy
KVM/arm64 commits, fixed since January, each paired with what fixed it,
plus the Sashiko findings on KVM/arm64 patches since July that a human
answered. The hand guides are running on the bugs now; the current build
and the full one are next.

[...]
> Absolutely.  The index is pretty dumb, we can do a lot better.

Most index lines already name the source file of their answer, so one
cheap step is to search for the files the patch touches as well as its
symbols. A directory table is still the place for the rest: the
placement rule for a new hypercall was answered from
arch/arm64/kvm/pkvm.c, which such a patch doesn't have to touch.

[...]
> A related question is how often do I need to rebuild in order for
> the guides to be useful?  I'd assume the absolute minimum is every
> final release, but every RC is also reasonable.

I think every rc is enough for mainline. What it can't reach is a fix
that lands between rcs, or a review against -next, and the source file
on the index line could catch part of that: re-check an answer whose
file changed since the build's commit before relying on it.

[...]
> The build script can rebuild a single guide, or people can just have
> their agents hand edit the build?  It's a good point, we should have
> AGENTS.md record some best practices.

A hand edit to the guide fails check-built-guide.py, and a rebuild from
the unchanged question can bring the wrong answer back. For AGENTS.md,
how about: edit the answer file (an exception to the never-edit-build
rule, but the check still passes), re-render and re-index with no model,
and sharpen the question in the same change so the fix isn't only in
the output.

Cheers,
/fuad
