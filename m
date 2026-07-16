Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD01037C918
	for <sashiko@lists.linux.dev>; Thu, 16 Jul 2026 16:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218756; cv=none; b=Cu2Uj+e11TljcWgH+PvlhpHyTGRxMZp3pmMqUCf1ZBwED4jvdqpGBNzZWG2OmAvmoYOOY60ibMqCra0JvJVGrtQrnZXfRDmu/4EuUXbeMVQn9bVyyu1Qxq4LX2mF7t2h+mXeGNuBTbEucuF0VxTXVuAlgkbRfVy+z0Uqri9f5G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218756; c=relaxed/simple;
	bh=45e8aTkTDNu8sAOLrvh1tlyR4AWwD0AC3SL0xtblsAU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=h0D/ByOp2rgGMAVcaFzd3DFVCC9X3VciUKj1d3S97cmQjGQehdDXyYwZdtPtQv8ZYkvdlSJZkmUMjcmu8cxpswXhrsTM2zBg1lA7MrCjy2iZiW3TMGiL7NTcI22XSHITN3RrNtLUykgLHoL9i6TECnPhBREErP3e1I4+Qd5sLzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nKwdM2ze; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nKwdM2ze"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784218745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=45e8aTkTDNu8sAOLrvh1tlyR4AWwD0AC3SL0xtblsAU=;
	b=nKwdM2zeu+YusQLOXjl91tJqG71hTNUyKA4gRydmCr9n9c7aI8bTs6smJKhwuhZHtL547z
	/e/aNsyIkicPHBSSdVz2rDHB5/9fSVGXgjkqa0DLWu3VIhOmruvn4a8xfOWNAkJqO2vmOq
	dJrKvBkoLwJpU6fLvlmoPEh0scKfyIc=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: sashiko@lists.linux.dev
Subject: Re: Execution with sanitizers, integration with syzkaller
In-Reply-To: <CACzwLxgcbUXHpLZi3fz1iyjDY_kp69X4dEnObwg7wEqKdVejXg@mail.gmail.com>
	(Sabyrzhan Tasbolatov's message of "Thu, 16 Jul 2026 16:23:49 +0500")
References: <CACzwLxgcbUXHpLZi3fz1iyjDY_kp69X4dEnObwg7wEqKdVejXg@mail.gmail.com>
Date: Thu, 16 Jul 2026 16:18:50 +0000
Message-ID: <7ia47bmusyad.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT

Sabyrzhan Tasbolatov <snovitoll@gmail.com> writes:

> Hello,
>
> Thanks for the amazing project!

Thanks!

> From https://github.com/sashiko-dev/sashiko README.md:
>
>> Stage 3: Execution flow verification. Traces C code execution flow,
>> checking for logic errors, missing return checks, unhandled error paths,
>> and off-by-one errors.
>
> I wonder if sashiko's Stage 3 can be configured or altered
> with KASAN, KMSAN etc. sanitizers. I couldn't find how the execution works.
> Perhaps, such as sanitizers could improve the PATCH review,
> as the optional flag during Stage 3.

Do you mean actually build and run the kernel?
If so, it's not what I want to build into Sashiko directly, because
it will require significant infrastructure, a lot of hardware and
corresponding support and will complicate things a lot. However there
will be a database of pre-existing kernel bugs open to other trusted
tools (e.g. syzkaller) which will be able to enrich ai findings.

> This also brings up a vague thought about sashiko + syzkaller projects,
> where sashiko could provide information about the similar bugs found
> in the PATCH, if any, among syzkaller reports. Like adding syzkaller
> mailing list
> reports as context as well.

Sorry, not sure I got your idea. Can you elaborate please?

Thanks!
