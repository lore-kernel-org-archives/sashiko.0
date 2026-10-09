Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A9A136672
	for <sashiko@lists.linux.dev>; Fri,  9 Oct 2026 17:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791568696; cv=none; b=hWq4vF6k393KwJoycqFQPcRfbK0k1HPSSXfJYnehQTqjA9XBg7vjHNDy0h+8++XOLAs776KvFLs3ir8ATuh+6yG0WYi6xNltjpJAViuBKyiZlyw7KyhV/c80umWDPbOu2BKFgTv/DQ1fPlrVJOQQXgiqtJxWetEHoG9E5BEQruM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791568696; c=relaxed/simple;
	bh=SOLwCD5PKZ6OYCKLRI7b5RJdVn7hmuQtdInzkiNHQ2Q=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=lqpygNiHxPj5punIAfUazHSLCzTb3eAOAODrUQiot3bjXkLhoZUk+VnYDKwMmF6QcMwtn5jKlF/O8DYx74174/NgFdY7kLMbPMG0Xd0vLPMONnxaiBiNZmDO0eqgaW+rb0OCUK7gbBm5z16gttqICj1VemPuUkuPvMmH8GB2mk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxWYvd82; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxWYvd82"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4998E1F000FF;
	Fri,  9 Oct 2026 17:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791568694;
	bh=auF6WeMoGMQf1M68HWkrs1xjfvN4zbVGKkK34CkI9uc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=hxWYvd82GR8Tn9d3tzDK1K/Otsls/XIceQ+bItWmpJpeUrFuO3q4MUJyUJ9Ou/tIV
	 jQjCW9Qr9uH0SXD/bGdlp4wol0rSYN3gntnd8D+5YP9XYHSKTIjz6XMFPNww5iR0e4
	 RziWLLSRigq7YBu8KDD0vZA1fZMdPmo7trmxho2dMnfVRvJCcw+xIywYN7O4ZT5qEt
	 HIwqNxsn5AzQJZBr4fCDdXEluAkvXKFMKc85FikkiBaeEK3Tri9rMVbc+87FAyt6j6
	 uuPuzSBIJSv4vS6h2kDhoNSdhe9DYXtaNTOuECL9dAbL8SZCDqjoH9Yrgn+/kHJoYQ
	 VB42NvFglB2Rg==
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfauth.stl.internal (Postfix) with ESMTP id AF093780043;
	Fri,  9 Oct 2026 13:58:13 -0400 (EDT)
Received: from stl-imap-13 ([10.204.2.104])
  by stl-compute-04.internal (MEProxy); Fri, 09 Oct 2026 13:58:13 -0400
X-ME-Sender: <xms:NSvJat-Uu2P4YDu2Boe_3ysfjihjWByU26YX-7lojgupZb3x00idWA>
    <xme:NSvJasiQwXnyCFga26lyMGIxHgSp-waXiyFm6FM9hmVkXWk4zPGvZ6ndQC3V9lAnQ
    HAYy9im3l8-UjHztdeBbPX4BEG_cGNuiqWOPT39vw37773X5I-5u-FClg>
X-ME-Proxy-Cause: dmFkZTGo7S3C38qda7wGunoc2NvVPhcO9Qz6rE/MQuPaXKVcWULd/mebVkQewpi0Eh1zkQ
    eCTzmgfB6arO+wF18XO4ozcEo7TzRhEcOFktYFF53KNIRhWh9w76nfPOFyPkjNM9j4/xZY
    JnvM1neTfBrFP5I3zGjZia4n/L0MurMgixMdpsJjIKMp18VlvXGL8gIEY2y7MQPbIELBxC
    Iu7AqSp9KZf3QDaCYxu4qZeSNC4GeKw5pJyAPg/kZFRQ1TGdaG8LLMpWioBWWdQGs/1rdk
    tfQav6zOdW3shGdyADx2sW3avdSc07nXojwHQTBR+FGLMxiBjXrTHxI/ComXG9uk2cbUAI
    xxtMb4Qz9/u2Pmux405TxsNc7B58eKSstDIcykM8PBhAe3CFRQdfiV1Lt+nqPvr2N9/dyZ
    IekiB0Dk0UCowbJoHJWcZD24LZVKnlKnZ4NTWebgkO1IB1MAJr7OepUNb6TZPnCUm/797R
    bXCkF744chNzBhaOJwPQljNOpnZ6sEMEtV+MtfY5CiedLZYACgCpxTWlmW9FkKNlUcFBFe
    mGDciha7DpcbPg4Nw11nfwIGsZ30ZIaeEhfSnVpycviyBZqHUKzNRoLcPIaf+k2FnIxzS/
    zbtXeZZvmA3dPEB//NBjeU1JygePD36nCJO3UKSK5Kx8eJ2hicbkVBRqNXiA
X-ME-Proxy: <xmx:NSvJatXF98gRRBGK_QLLbxhtA8QN_dd8KP9KbAmqvsog2IpFJSrINg>
    <xmx:NSvJauQHSNIyyOMKrutpyhIqZS2SACBFHWNKM6ME4KCRiH90xH8OIA>
    <xmx:NSvJankIp4Vveii_zFdPZFzjog1Ch_V14gZACn8-PM7c_bVOS5gjcw>
    <xmx:NSvJak6xlAmrIcbD_D1jd0abPDHWnnpRaPOrgsbuQIzNViRW_PwqYA>
    <xmx:NSvJatjtXTcEwdCdmWDtBfb1Jjq8T6oopRFsbyj_spP0b3MRSFvaHqA7>
Feedback-ID: iccae4b50:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 551B5F6007C; Fri,  9 Oct 2026 13:58:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: A_YYAiGKKP7V
Date: Fri, 09 Oct 2026 13:57:53 -0400
From: "Chris Mason" <mason@kernel.org>
To: "Fuad Tabba" <fuad.tabba@linux.dev>
Cc: sashiko@lists.linux.dev, "Roman Gushchin" <roman.gushchin@linux.dev>,
 "Ihor Solodrai" <ihor.solodrai@linux.dev>, ast@kernel.org,
 "Jakub Kicinski" <kuba@kernel.org>, "Fuad Tabba" <tabba@google.com>
Message-Id: <c007a163-91a6-4e2a-b8de-057b61d369aa@app.fastmail.com>
In-Reply-To: <20261009141710.1871697-1-fuad.tabba@linux.dev>
References: <91e21331-ed6d-4ac0-b237-b01aeadca2d1@app.fastmail.com>
 <20261009141710.1871697-1-fuad.tabba@linux.dev>
Subject: Re: [RFC] reworking the review-prompts subsystem guide
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Oct 9, 2026, at 10:17 AM, Fuad Tabba wrote:
> Hi Chris,
>
> On Fri, 02 Oct 2026 20:04:00 +0100, "Chris Mason" <mason@kernel.org> wrote:
> [...]
>> My new branch builds subsystem guides by asking a long list of
>> questions, and then extensively reading the sources to find the
>> right answers.  The delta between the LLM's answers and the right
>> answers is the new guide.
>
> I went through the KVM/arm64 and protected KVM (pKVM) guides on the
> branch, and checked a sample of their claims against the tree. They're
> much more accurate and detailed than the hand-written ones, and the
> checking against the source is what makes the difference.

Great, I only did limited verification in that area, so its good to hear.

>
> Some of what a reviewer needs isn't in the code, though: which bugs
> matter and how much, and which reports are false alarms. The old pKVM
> guide said that a hypervisor crash only the host kernel can trigger is a
> hardening item, while one a guest can trigger is a real bug. The design
> deliberately keeps that kind of instruction out of the guides, so it's
> gone from the built one. Where should it live instead? The "Conventions
> for new code" files look closest: they already hold what maintainers ask
> for and no code states, and a review finds them by the directory a patch
> touches. Something like that for KVM/arm64 would work, and I can write
> it.

There's already a way to pass specific parts verbatim, which feels more
correct than under a "new code" label.  We can play around with a few
ideas though.

>
> Leaving out what the tested models already knew also tunes the guide to
> those models, and the model doing the review may not be one of them.

Yes.  I generated the current built prompts using both sonnet and opus
with the assumption that other models would get roughly the same
things wrong as one of the two of them.  This is obviously flawed, but
the prompts have a way to pick the best build directory based on kernel
version, so we could extend that to the model doing the
review (more below).

> Hand-written guides have the same problem, and I don't see an easy fix.
> Your mail points at builds per model, so one option is for each project
> to build for the model it runs. Another is for the build to keep the
> full checked answer rather than only the difference, now that the index
> makes length matter less. Which way are you leaning?

My original plan was to get the built guides small enough to be included
whole, in the same way the original guides were.  Adding the keyword
index was basically me admitting defeat, and it just didn't occur to me
that we might be able to index our way to victory on the full output.
IOW, great idea, I didn't think of that at all ;)

I'll do another run and put the full build up.  We can see if it's too big
to be useful or if we can make the index strong enough to get around
needing the per-model analysis.

>
>> This is both much less useful to human readers and much longer.  I'm
>> not sure what to say about the human reader part, but instead of
>> having LLMs read the whole subsystem guide, I shifted to an index
>> where they search for symbols.  This is a better fit for more
>> advanced models, which mostly need updates on how the kernel has
>> changed since they were trained.
>
> A common KVM patch adds a new hypercall. A symbol search finds the
> answers about the existing calls the patch uses, but not the rule for
> where a new one goes in the list: that answer is filed under a marker
> the diff never touches, and the header the diff edits isn't the source
> file of any index line. Could some answers be keyed to the directory as
> well, like the short table you kept for a few guides?
>

Absolutely.  The index is pretty dumb, we can do a lot better.

> [...]
>> What I know for sure is the existing review prompts have drifted
>> from mainline Linus.  It's impacting the quality of the reviews, so
>> I plan on working out something in the near future.
>
> Built guides drift too, just in a different way. These were built at
> 7.3-rc5, and one fix in rc6 made four of the KVM/arm64 claims wrong
> without renaming anything, so looking names up in the tree doesn't catch
> it. Most index lines already record a source file, so a review on a
> newer tree could check whether that file changed since the build, and
> re-check or flag the answer if it did.

A related question is how often do I need to rebuild in order for
the guides to be useful?  I'd assume the absolute minimum is every
final release, but every RC is also reasonable.

>
> Related: when a maintainer finds a wrong answer, the only fix is to
> change the question and rebuild, which needs model access and can come
> out differently each time. Who looks after the question files, and could
> there be a small override that a maintainer edits between rebuilds?
> Feedback from the list, as Jakub and Roman discussed, could take the
> same route: suggested questions that go through the same checks against
> the tree, rather than guide text.

The build script can rebuild a single guide, or people can just have
their agents hand edit the build?  It's a good point, we should have
AGENTS.md record some best practices.

>
> Separately, some pKVM questions were dropped for size, including the one
> on protected guest system registers, and the measurement notes say
> they're the first to bring back if the size limit is raised. There's no
> length limit now, so I could send a patch to bring them back.

Great, please do.

-chris
