Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214BD3EB11C
	for <sashiko@lists.linux.dev>; Sun,  4 Oct 2026 09:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791105449; cv=none; b=DjxKyx/Fttyq0wtd54iHh8aFRWiXent2qsS6GDWTGkoF6xIfrpW33HQc6ErbFAoihZuINDaJrveydfVeSWnmC1qkhvb/OeFr7nQ5eWA+mD+b8nqiPi4Ed5e8w1fvuoDPVsjwmvMY+doZY9VsiWxHBdHs4OglB1z/q8YMZNzWvkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791105449; c=relaxed/simple;
	bh=NAGve4tp+nVOvY0u+a92ehz9+fG9oFUcpHudNKsdeqI=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=hdTYqb+JJM8nKRH2DKNA+l8XRQyfgOEQ3fyMYOWJvjDuvNEMBolq7iqfBhancWveMhgVv1ZkAYd6kj65vPRXNjcgN7dSHH0QzgQqhEqpK1L/aCBqgOEd3NGpNyCpDO30T1WrPXwvEXA6k9jj0xd9rIv5VfFtWSvnBnZhnkbXoo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MXp3w20m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MXp3w20m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E9D1F00893;
	Sun,  4 Oct 2026 09:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791105447;
	bh=zZxDpfKNjjSQavCnjulDLzMnLpjri/IQQQ2eI28wixo=;
	h=Date:From:To:In-Reply-To:References:Subject;
	b=MXp3w20m2EdEjrzI7Vrov9TWH8LeGFIPuN2DJ/G2Rhoow4mkM9Q+liMKoQ2SfM5Fm
	 94ihyoS32y+TB9uKWr3ou1dcZeqIdBdpW/srlfQXUjgoLTkSy6T25kxUMQerGspllR
	 tjjN8ldONtb7CaXI/fZeO+KpwlISIpk8Xb1gHYWOv6nQBuCeR6CisDjzZNUqxYDawx
	 zohsICk2a7MThD2juP7bV825Nc9Z1ENixhXxwqHKWGPZnMifLSDyKQuPVvgG8il3dO
	 9531WV0ZgCx6czOMYzzR0lUavXDXGPL9OTenu/d+TFrzGpSWwEcb/eHzSDupHQMu8F
	 fUUzdcD8PA0Xw==
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfauth.stl.internal (Postfix) with ESMTP id D43ED780043;
	Sun,  4 Oct 2026 05:17:26 -0400 (EDT)
Received: from stl-imap-13 ([10.204.2.104])
  by stl-compute-04.internal (MEProxy); Sun, 04 Oct 2026 05:17:26 -0400
X-ME-Sender: <xms:phnCar3jjh8KHlr_zsIrktLkSyl_q2Isq1kFPYunEffQDFlMh6ad3g>
    <xme:phnCak6ZPYSYUXmlLWmJb9vv9Us3p3EkiqSx0u6S37PjPKCf-rWTDzGkEJ0G6cMpL
    N88tjKEbZ92xEHdzlbY-1MvsoL8o0SUpdshlw2bgxhcLCHZypXUNOLf>
X-ME-Proxy-Cause: dmFkZTFSKoeHu2ZB6oZnWB6zCvdlelMbE9YVoBFwkdv4d9JVekvvvDv1JJ5kbIix+tXrg2
    h3O7FiaM4cWSjP3KLcfiFNJN7JBC0BB4U36gfEjA9fWU3KuT/snzO+3sqihnj8K5bDojRD
    BLQ/OJBaK5SJ/zABZIh46nXBEvBqkM6b9Xk2zstt1sXc5wx6C40KDdB6xu9ByybwfPWDs1
    HDSU/IeVbbvQXM7WI4u/bqGPLkUJUNjmj/A5jVfSb8vI7BgTzXnKha9Sh5yGlrx+K9k7fb
    0FtR74Wpi8hyAAHl34vydPim4R3tDvuYpYqq7GKAGlPA06bF+mGWRSmRkTy42k2itTGBnH
    fBNPzL1yJv16o2yhLzxkMnnO0381DW087F59JAt4YYecXyZ9L+UYHWpAYcrUmKvENX7y5x
    ZmxabTU+IUhCO2hLcBStS7XqSg0fuEBYwjObCbm3V+Aaj4z+5fI5H/qISsQcahsPN8uCcj
    85u8KaaSf/9AdmKCz40bV7oHsSfmq6HIYeFeb6x94zRRsqTN+dOLqP8rgpmeJlE6QoLSps
    hFABmQXYDpQq5LDM0RXIQWmg1unUyC2U1GyMLMObLgTZpKSowMboPoeShg4pA+O5M4eFen
    BuMujCOYsUwbd786u7lhAYE9yZdmpTGUrIKbHEp04TPmuW2yTRrfyzB4Mivg
X-ME-Proxy: <xmx:phnCapjVoaoop-X74wwyrkhCmjiFImS_DQEdfTZuEIzpMNw3YDnV4Q>
    <xmx:phnCanXx26hotGDpVYMtFLrqCYhNEXSora7-9yRlCslXQUQoUKXD9Q>
    <xmx:phnCagW85vT2qZrPV3EE-DYIbTjjFpK6kWTB8kpp7YLq4XQwUwTpEA>
    <xmx:phnCaviq9szUx0uLqAgbwaA8mbq8x4_KFN0ftudx5lID16db43RtOA>
    <xmx:phnCajYSSp0Ca8STQZPMN2B8kvUDml_8zDbvy-eQpGpBNjnTkvNJWQP6>
Feedback-ID: iccae4b50:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 6D6FBF6007A; Sun,  4 Oct 2026 05:17:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: A_YYAiGKKP7V
Date: Sun, 04 Oct 2026 11:17:04 +0200
From: "Chris Mason" <mason@kernel.org>
To: "Chuck Lever" <cel@kernel.org>, sashiko@lists.linux.dev,
 "Roman Gushchin" <roman.gushchin@linux.dev>, ihor.solodrai@linux.dev,
 ast@kernel.org, "Jakub Kicinski" <kuba@kernel.org>
Message-Id: <c17f0526-1c12-4405-9088-f38b1bb3b36c@app.fastmail.com>
In-Reply-To: <314d038f-4f81-447b-a3e6-0fdfc37d130c@app.fastmail.com>
References: <91e21331-ed6d-4ac0-b237-b01aeadca2d1@app.fastmail.com>
 <314d038f-4f81-447b-a3e6-0fdfc37d130c@app.fastmail.com>
Subject: Re: [RFC] reworking the review-prompts subsystem guide
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Oct 2, 2026, at 11:18 PM, Chuck Lever wrote:
> On Fri, Oct 2, 2026, at 12:04 PM, Chris Mason wrote:
>> The subsystem-build branch was built with both sonnet-5.5 and opus-5.5. 
>>  It's the union of all the things either model got wrong, and the tree 
>> is setup so we can add builds for other kernel versions (ex: stable 
>> kernel series).
>>
>> I started down this path convinced that I needed to get the subsystem 
>> guides into the kernel git tree.  My idea was this was documentation, 
>> and it should land somewhere in the kernel for that reason.  I ended up 
>> with something that probably shouldn't be in the tree...different 
>> models need different things on top of different kernels, and so I'm 
>> trying out the build idea.
>
> One thing that has been wiggling around in the back of my brain is
> the review findings delta between the different models. Different
> issues are found, different issues are skipped, different false
> positives.
>
> I'm sure some of that is unavoidable, but even in the simpler cases,
> some models are simply blind to certain types of correctness issues.
>
> Is there any way to compare the benchmark results between the models
> (say, between gemini-3.1-pro, gpt-5.6-luna, and claude-sonnet-5) and
> prompt one of the more advanced models (eg, gpt-6-astra) to figure out
> why the review prompts should have guided these models to disparate
> review findings? The goal being to achieve better consistency between
> sashiko results for each model.

The short answer is yes, but it's kind of tricky to build it with existing kernel bugs.  You have to pick recent bugs that no model has ever seen, or invent entirely new bugs.

When the reason for the failure is a lack of context, you can absolutely build better systems to pull in the right context.  But when the model just can't wrap its head around finding a particular kind of bug, it's better to wait for the next model.  You can see it with the early results from the review prompts, which were mostly error handling failures with smaller surprises mixed in.    Newer models give much better results.

I'd love to try and build a benchmark that shows this clearly, but I don't think we can guide the earlier models into understanding bugs beyond their reasoning skills.  Or at least I consistently fail to do so, I'd love to be wrong.

-chris
