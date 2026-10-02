Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECF535FF58
	for <sashiko@lists.linux.dev>; Fri,  2 Oct 2026 19:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790967863; cv=none; b=m96O+Sa2y3ax/VxprPZErayDBrx5o0rvyxBd8PHWEj9t5P75pbPuJdGeoskjA2YYyVXETxD5ARQ2omWYRdKooVl92Vg+qmAOUQL3L4kJSufRmmVYtjmTff71JVmqlPbjlt4TaJJXhBWqF+UrfzlmZbrxkO+PKRYDFj0NE1s7Jk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790967863; c=relaxed/simple;
	bh=Wzj2E+VWjiqz1OO5FiIrj5+U3jp4s1Yjp0jgJ/JvLJA=;
	h=MIME-Version:Date:From:To:Message-Id:Subject:Content-Type; b=O/4bCqoFHdM5wiBDp3JBfRsWxkECL8NPn3lILONzj/WXeqF3xvsqq5bymSpXv++qAYeHJQTCpFlW3FFy9GDQB9VadDlwuOGRYEhNpeb9zKBjAUlE2SGwB/pC8BXksUbE6gULURAbt2OIsF7ot0DQjSLqqBeDR1A7Y3MV4G/ftKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ljqp6EdU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ljqp6EdU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0BE91F0089D
	for <sashiko@lists.linux.dev>; Fri,  2 Oct 2026 19:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790967861;
	bh=w2wJAIZdE2xRh3WF6ZR9DKVpIFDP5wZ0WqJrG5yo8JY=;
	h=Date:From:To:Subject;
	b=Ljqp6EdUsDt472NzRRaWszmREur4+PatFQE1CRh1VX/D93FYOe3Wxj56nAGDgp0re
	 BRkGkYB+DBYLKiBtC4qoOT/C8tzjdAj8dihDJ98sf357FjBUGBOAWLStiR6cHftn6x
	 aBak8j58+D500cYvg1N2rcYDLTVf4B9AluiGHr8dDCEunOmhYk2KiTiFqtUqc6RZMc
	 +NKGjNykuKpJCsMxMKkzuYPSoTDWt8T2T0xkuVR9teYzB9hkMWzxJ2k8jQim6ARI8B
	 V0R/lV+wPFEJzSgK0pf9/PEDHjiT894ZXSvy+b7KUzMBleCNfErsr8CRCLk4RORbo2
	 4Hj6ScG+FSCSg==
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfauth.stl.internal (Postfix) with ESMTP id 05595780043;
	Fri,  2 Oct 2026 15:04:20 -0400 (EDT)
Received: from stl-imap-13 ([10.204.2.104])
  by stl-compute-04.internal (MEProxy); Fri, 02 Oct 2026 15:04:21 -0400
X-ME-Sender: <xms:NADAau1oIU7aEvJi2ddRr7feIToa39nKR5oD3VUcI5RnQZTvAhYGtw>
    <xme:NADAar5uiWTKjI32dxfGRasGAZvgI395IHsXLQhgQVt4adtN1thzwBZooqQmHkR43
    AFiuLvjswxdHK36_ClcFZIyZRWZzcKl-y1vGF-AN6tYx03t1htXFdOO>
X-ME-Proxy-Cause: dmFkZTFIUpjF9oXWoF3Ff16Fi38VV21RWKYTSXXWEtYR7RsEsrIoRuq9o0bjDneDX/WZ9I
    y3eO0UaOIWj886AVTcwTL83r2WsZNhJFMRX+IxhVZCjkBl5+j4gSdYL00/X6BVZKLL+aW5
    DS/YJYniPlEfBFeN8ZLNeo+aL76nnfHV/w5v71bOfl2OvSFeJrvMV40IjdbsCk4AM7l7Je
    CM7a783fl58tz6b7D8rBbyyMComQVM3Y6V5UrVsGa9rD8a39Su3H/o4IQE5HPwfaWKJAcp
    ibXONJ4NSW3QXrLTyBtRC90WJaCOUl4Vp37lGVkjljNqySEST6O5M4EWdJm6kK8I3dJxFh
    fXMHEdAmg10ngDkVb5+/MPzqGG4Ew8YIA+UU+5OWD8u2+3uuIEP8IBhOxfsoSu9VUZOUed
    XadsqYG1izh1XwFUxcASLeIamjh9IFSS2rMu4BmuuDG310wSIL3EuyPVru2mnfrEnChBEr
    vs+i94zDDRk/OVvaH89thzrlrNBRRZvicXZSgJs1+dzDHuJrUrkE9Oy6YVPBmBpkm8bubl
    Guz74syVF38rTjl1vxLRyWTCkgRnsaEASteHJ752gjpuUnOCcME50Zp9vehgtq1ixrsX2m
    iptkZUxx37KsB00ktTzgo5nttxbwXRtWc8TrLObjY1V8apGAQZnOPHonaFkw
X-ME-Proxy: <xmx:NADAagaGpFdyfP9K_7bmJSMO9R5_moh14kuaMY4jgQvMFt6-nTm6Gg>
    <xmx:NADAas6en2gIGrv1tCqJImBSc6VE_hXCs9WUJuEgGGvVADaku3WGDQ>
    <xmx:NADAarBuoTNg8u24Ujhv5LX3n9jFAqfK1-iscXvrK6ekEviP_N5AjA>
    <xmx:NADAaqeaarNK5kgKFUqDWG1wjL23Ltf5M6dszu8V8o3rWapZX8WRtQ>
    <xmx:NADAaiIrg-UjZApqueasDNKcnyC-fepT1gsO5equh64pVAGRMk5lB9L3>
Feedback-ID: iccae4b50:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id AE1F3F6007A; Fri,  2 Oct 2026 15:04:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 02 Oct 2026 15:04:00 -0400
From: "Chris Mason" <mason@kernel.org>
To: sashiko@lists.linux.dev, "Roman Gushchin" <roman.gushchin@linux.dev>,
 ihor.solodrai@linux.dev, ast@kernel.org, kuba@kernel.org
Message-Id: <91e21331-ed6d-4ac0-b237-b01aeadca2d1@app.fastmail.com>
Subject: [RFC] reworking the review-prompts subsystem guide
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi everyone,

I've been updating the review prompts, and you can find my current work here in the subsystem-build branch:

https://github.com/masoncl/review-prompts.git subsystem-build

This is a pretty big change, and since a few projects are syncing automatically, I didn't want to just throw it in without discussion.

The review prompts started with a lot of framework to explain how the kernel works, and the prompts have focused on documenting subsystems in a way that both LLMs and people can use for reviews and writing code.

As models have progressed, they actually need different information than they used to.  Recent models already know how most of the kernel works, but they have some gaps because the kernel is always changing, or because they have some bad assumptions baked in.

My new branch builds subsystem guides by asking a long list of questions, and then extensively reading the sources to find the right answers.  The delta between the LLM's answers and the right answers is the new guide.

This is both much less useful to human readers and much longer.  I'm not sure what to say about the human reader part, but instead of having LLMs read the whole subsystem guide, I shifted to an index where they search for symbols.  This is a better fit for more advanced models, which mostly need updates on how the kernel has changed since they were trained.

The subsystem-build branch was built with both sonnet-5.5 and opus-5.5.  It's the union of all the things either model got wrong, and the tree is setup so we can add builds for other kernel versions (ex: stable kernel series).

I started down this path convinced that I needed to get the subsystem guides into the kernel git tree.  My idea was this was documentation, and it should land somewhere in the kernel for that reason.  I ended up with something that probably shouldn't be in the tree...different models need different things on top of different kernels, and so I'm trying out the build idea.

What I know for sure is the existing review prompts have drifted from mainline Linus.  It's impacting the quality of the reviews, so I plan on working out something in the near future.

-chris
