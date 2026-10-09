Received: from mta1.migadu.com (out-78.mta1.migadu.com [95.215.58.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D6D3D3CE0
	for <sashiko@lists.linux.dev>; Fri,  9 Oct 2026 14:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791555436; cv=none; b=QxmeaKgImMv4mu4nXeZbmIuJBeyxZYxI23ZCZllvbRB3Jsit/L+l2arpQfECDXGZvVd7wgfNK/WFIg95U6Oqk7QYgEJ87WeEHKl4mMeoe0+DlDmfswueD62SzUsH+5ZZRnyn5n6dK5YpsM57Ll2FjUCr1BoY1TstPDwoxdr+Ydg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791555436; c=relaxed/simple;
	bh=/EnfCglIntOS5vVcTYPxlOlk9euOljXmNePDRNYTiOc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pf6K9ZxbNVoxXdolEfhO3F7zgAD2USH+Df7fjufA9bK6tFopO7T/VGIKODpuMEE7Ya7Mv1QVSCuf7TG16Srpkqy+GK6dq99nxeKrHnkjQouDvdINQtyGk6u7/rCo3H+nZJXpLHbMU0aCnLyjmEGUgBRaM7xxrY48jy+yR6xchTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ieMXIb6E; arc=none smtp.client-ip=95.215.58.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ieMXIb6E"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=/EnfCglIntOS5vVcTYPxlOlk9euOljXmNePDRNYTiOc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791555431; v=1; x=1792160231;
 b=ieMXIb6EYsVfbO/a8laeLcugdsQVY/PDPW/0MqVG2Vj3z/BI8KC0TkayB8dRBUpqV9uawXUG
 C//bfvJluaAtAlPCikRujfkNk7/6tOV/rXSLrFjH7SQhS4xyNvozc5UVeT6eawy+WQEt39cxf0T
 AZ4sESXu4KEF8bxwG0eJQrdQ=
X-Envelope-To: sashiko@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id cd370a24a0c009ad;
	Fri, 09 Oct 2026 14:17:11 +0000
X-Mizu-Trace-ID: cd370a24a0c009ad
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
Date: Fri,  9 Oct 2026 15:17:10 +0100
Message-Id: <20261009141710.1871697-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <91e21331-ed6d-4ac0-b237-b01aeadca2d1@app.fastmail.com>
References: <91e21331-ed6d-4ac0-b237-b01aeadca2d1@app.fastmail.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Chris,

On Fri, 02 Oct 2026 20:04:00 +0100, "Chris Mason" <mason@kernel.org> wrote:
[...]
> My new branch builds subsystem guides by asking a long list of
> questions, and then extensively reading the sources to find the
> right answers.  The delta between the LLM's answers and the right
> answers is the new guide.

I went through the KVM/arm64 and protected KVM (pKVM) guides on the
branch, and checked a sample of their claims against the tree. They're
much more accurate and detailed than the hand-written ones, and the
checking against the source is what makes the difference.

Some of what a reviewer needs isn't in the code, though: which bugs
matter and how much, and which reports are false alarms. The old pKVM
guide said that a hypervisor crash only the host kernel can trigger is a
hardening item, while one a guest can trigger is a real bug. The design
deliberately keeps that kind of instruction out of the guides, so it's
gone from the built one. Where should it live instead? The "Conventions
for new code" files look closest: they already hold what maintainers ask
for and no code states, and a review finds them by the directory a patch
touches. Something like that for KVM/arm64 would work, and I can write
it.

Leaving out what the tested models already knew also tunes the guide to
those models, and the model doing the review may not be one of them.
Hand-written guides have the same problem, and I don't see an easy fix.
Your mail points at builds per model, so one option is for each project
to build for the model it runs. Another is for the build to keep the
full checked answer rather than only the difference, now that the index
makes length matter less. Which way are you leaning?

> This is both much less useful to human readers and much longer.  I'm
> not sure what to say about the human reader part, but instead of
> having LLMs read the whole subsystem guide, I shifted to an index
> where they search for symbols.  This is a better fit for more
> advanced models, which mostly need updates on how the kernel has
> changed since they were trained.

A common KVM patch adds a new hypercall. A symbol search finds the
answers about the existing calls the patch uses, but not the rule for
where a new one goes in the list: that answer is filed under a marker
the diff never touches, and the header the diff edits isn't the source
file of any index line. Could some answers be keyed to the directory as
well, like the short table you kept for a few guides?

[...]
> What I know for sure is the existing review prompts have drifted
> from mainline Linus.  It's impacting the quality of the reviews, so
> I plan on working out something in the near future.

Built guides drift too, just in a different way. These were built at
7.3-rc5, and one fix in rc6 made four of the KVM/arm64 claims wrong
without renaming anything, so looking names up in the tree doesn't catch
it. Most index lines already record a source file, so a review on a
newer tree could check whether that file changed since the build, and
re-check or flag the answer if it did.

Related: when a maintainer finds a wrong answer, the only fix is to
change the question and rebuild, which needs model access and can come
out differently each time. Who looks after the question files, and could
there be a small override that a maintainer edits between rebuilds?
Feedback from the list, as Jakub and Roman discussed, could take the
same route: suggested questions that go through the same checks against
the tree, rather than guide text.

Separately, some pKVM questions were dropped for size, including the one
on protected guest system registers, and the measurement notes say
they're the first to bring back if the size limit is raised. There's no
length limit now, so I could send a patch to bring them back.

Cheers,
/fuad

