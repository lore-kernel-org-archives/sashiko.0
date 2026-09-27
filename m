Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB6D242D88
	for <sashiko@lists.linux.dev>; Sun, 27 Sep 2026 18:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790532058; cv=none; b=ejZgDvgUNkn3Qik1q+VhDgBiNCRyOxHf4rTgksZFLjf7mYkCqkwamzJgvlHptGN63U8M/iqQEVcniGGjHboyjnSGLLlsLsZ9byJLR/A5lbtcZHjgIn+n7Cp3gq8uaKICamc2yePOuHJ3GEGlnsaa/UxPnG92Fo6cEif9ZGmS8O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790532058; c=relaxed/simple;
	bh=7LqcGSOgMHRUV+lbW6BfLutyQ9RXq2ijE1F132m7BBs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=OhDEDzrLdC/17EOcuoeCMbPPgOwfx/fyJBIklalpRv72RvGQGKO6vjoL+8YIdXBRkoivfLiFPMV0zP1+h+fnkI1+fFTObrNbGzPXAEF+qhryofFRj4ACDZm4WVIKOhqPNa/glueZseexUxXCrs/B1DkUeU4bmWwRLsYR1MGNn+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0xg74lZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0xg74lZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445061F00893
	for <sashiko@lists.linux.dev>; Sun, 27 Sep 2026 18:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790532056;
	bh=LoYdS04+EKwFNUQXzJ3wp0pI3cMNjeHm+JCv2hkiwPg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=S0xg74lZldUHZakYZmTcvRsUn1aq6eF4ZBb4KCLBVI84pf+CmUFuZEmtQYcIKWuyS
	 LwzDEIHdt4apTsvbn5Ys4fIt+5JLI5sX83WA59/VRwHQ7MvWhhq2gAAxC8c2NJauSI
	 f9G/4tc0Es7u4+MQHuSi7shf2Oto0MlYNUCD8NIH2iJiywqBSGfIrUQTiPlSIFYqLQ
	 xQvlMh9gzeciwo8kY8Y599L4kKq8P25VF7bzIzSQZsQ2tJ/IKFXWzqhpUFVKKlNDkk
	 y1z7WE9iuSBkLxhbH4/ae5pFGOlhoou1vK5Sig3PpuX2F0BMOMazzXhGkCmD0DsDCv
	 Nm8Jl8a79VNaA==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4AE5AF40066;
	Sun, 27 Sep 2026 14:00:55 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Sun, 27 Sep 2026 14:00:55 -0400
X-ME-Sender: <xms:11m5avVKFZitmS6IbCA9k8mtXmrfuwsPm5jcYZzEKNIFcP2IfnhWPQ>
    <xme:11m5aibc0034Fb2s1Prum9AsRSWzXwQGh7iLGMjKX30FvcuOzx4jBqsssS3cVN9S2
    1br3bed6GUGTSpmT5Rub9Mph8yCxvdF_ysadj1v3DQlKj54ScdaPwcy>
X-ME-Proxy-Cause: dmFkZTFitSrtdSd0TQiOuNjLS6l+jE+4ZQ5OmJQKXTbTTvTJkzLk4YnWhCf/2C0w1hUkix
    Cz8pONqMaFzhQKyrkBc0aIxXePVScKGCWTMXDNdu7hiZBNYWNrsitv7cMa9XVJK1L/6Jfs
    FF/id42Yf7XClgRprb8bOSaRM2gohFEmguojZdllmEMvk1sJEXg5uXKCYWw9bg2cPg5FOD
    868/nU5DS4EPP7ZFqUWLDpF6ZEZzhV3ryZggO9IVMjpvpCconLn1Bk85TiI+MXUFsA7jKL
    VZZsTOIl9ANIAUsLWUckJwMuTHl7ufjCT8qp1oIEHvL548AbQ4N66L4wZ+EjoA2bd2OGV+
    DZbNquCOakrWOkCni1JhT8JE8TftqhXp4h73gzMSpPSjgShiLofrI91yjhlo/Wh2LPntr2
    VtIfsSW16FDsT9OJWQ+f4c/KsX6Dn6CIycFbfO2EHPgmMBjTZJp3Qwi8xfSS+i2AqtnP2F
    tAgZEPOfnUTQOhyZSEpdcn2xt203kI0Dp01FI6gPk7jCjOZc+SNWKZm0o67GzU6GLCjzW/
    rWK4uN+BK6gbjF+hGzI35StRD9vkSRcVaxZWQZDoBOXv1KjnWGvSU5RuuaQrEndMLIWHsq
    Z1on8D8njHgr8iSkQtA8O++D2cDE5opsiCDU2XRtRbGJ5osqZV2wIc42tQug
X-ME-Proxy: <xmx:11m5amBZTJrjQL3U0c1_eva1CyxUFBF4H2JxAtvml3FPirkaGqkEdg>
    <xmx:11m5aueWKBeVY3xL1RDc0qSt2loB75RUSDsRv5FofwpYlevfihOKHQ>
    <xmx:11m5ahJIlqwKmSmyd-_CPwv5EoVcR9U7aI9DX_Oq_yBeTgA9tcZnhg>
    <xmx:11m5ahfH7CpoWKukFcN00K2EOy3kNiTdZHhKU4T70qwbAgSUkvOgQg>
    <xmx:11m5ao0heFgJYYa-kda2o2ZSQVIfN4fJuzQb_6ig8JEETn0OKVPsC8v7>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2D3A1780070; Sun, 27 Sep 2026 14:00:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AuO68pr4zndw
Date: Sun, 27 Sep 2026 14:00:34 -0400
From: "Chuck Lever" <cel@kernel.org>
To: "Roman Gushchin" <roman.gushchin@linux.dev>
Cc: sashiko@lists.linux.dev
Message-Id: <81b3ef52-c3f0-4cd3-888e-33764321ad32@app.fastmail.com>
In-Reply-To: <7ia4ik3rka6a.fsf@castle.c.googlers.com>
References: <25bac515-89e5-4fea-abcf-c5d799f0ddcc@app.fastmail.com>
 <7ia4ik3rka6a.fsf@castle.c.googlers.com>
Subject: Re: fixes and updates for sashiko
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Sat, Sep 26, 2026, at 4:52 PM, Roman Gushchin wrote:
> "Chuck Lever" <cel@kernel.org> writes:
>
> Hi Chuck!
>
>> Hi Roman -
>>
>> Internally at Oracle, we are required to use codex / OpenAI.
>> I've set up a sashiko instance for reviewing patches that go
>> into Oracle Linux kernels, and it must use OPENAI API keys.
>> "sashiko review" run by developers uses the codex_cli
>> provider.
>>
>> There are some missing bits in the OpenAI and codex_cli
>> providers, which I've been attempting to fix. The commits
>> are in github.com/chucklever/sashiko/ .
>>
>> Rather than second-guessing what you are willing to merge,
>> I'd like to work with you to better prepare these. Can you
>> browse the commits there, and put the changes into three
>> categories:
>>
>> 1. crazy, never in a million years
>> 2. needs work, but OK
>> 3. ready now
>
> Sure, will do. I don't have usually a strong opinion on ai-provider
> specific code outside of gemini and can't even test it; but if there are
> common parts, I'm usually a bit more concerned.

Makes sense.

Some of the OpenAI work of course touches on support for the compatible
models as well. Some of the codex_cli work touches the claude_cli code
paths.


> I can't promise a fast timeline though - lot of other stuff, I'm working
> remotely from Europe next week and also LPC is coming up.

I'm not in a hurry; likewise I don't want to waste anyone's time.
My hope is to send each pull request when it interferes least with
whatever you are focused on.


> Btw will you be there?

I'm attending a storage industry conference in Santa Clara this week.
Last week of September is a popular time for conferences this year.


>> I'm happy to continue interacting with your bot to whip
>> these into shape before you merge. I can share benchmark
>> results comparing gemini-3.1-pro baseline with gpt-5.6
>> and gpt-6 models if you or the list is interested.
>
> I'm curious to see these numbers privately, but it's not something I'm
> comfortable discussing publicly: this might become very sensitive very
> easily. Obviously I can't prevent you or someone else from posting
> numbers, but I will be limited in what I can say/do publicly.

Thanks for letting me know. That is sensible. I'll put something
together for you when I get back from CA.


> My approach is that we want all frontier llms to work _together_ to give
> us best results vs creating another benchmark. But so far only my
> employer (Google) is sponsoring this. I think we (as a community)
> need to fix this first.

One of the missing parts of support for OpenAI API providers is
that the OpenAI reasoning models need some adjustment to how
sashiko presents its requests. gpt-5.6-* and newer can't even
play in the direct API space until that is addressed. I have
patches to make that work.


-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
