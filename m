Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F26286430;
	Sun, 17 May 2026 15:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779031314; cv=none; b=ifIQ7xi4tJDGFORFXTYNL7daDs4F5zrGmVP36WOI0VOUHOX6IcH6wvSnmoGcTYgMztbrmQAve2mhs4doOJhuoedo0Ys96D0tgcL2RrfF4oXkJITgZC/vQ6yBXry3z19lHkds3rwOoafKEeFq7TJ8oWQHu4V1b3YEXlPq5p/cFgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779031314; c=relaxed/simple;
	bh=t9y0GTdIMNxbDvtPXVJ2Wbg9KnL36rFZbM7XjzwMxiY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iU7bHzeyW4pYi5FbGOY7ZabWOfwwgNOBlKepz5x6s3ruA6r7PKs9TWyOlbp71OCDGBEvRNfkCYJm4rQH/DkXZMUjK2rKds8Dd+Q8+oXr8DHjSmb0vMwxwM7BVcIXTn8q5in7TUkbCAiXrlw/PeP6aeijHMo5esrCDnfAFTHim00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=XNFn06y8; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="XNFn06y8"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6EF8140C79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1779031306; bh=sr9iSe4M/xfVvPcj6Q8cSaRqEc29Xtd0DjCI8Frt+58=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XNFn06y8oRe/pI9RuBJ//uKP8K79mY26JT63CbMuAdkFCViameJoyh1SToaKe0GrG
	 3iO853p7n0xAPHzV5w8nu0wNTm5LsVQqzoiSzqz3waLOnRNWoytyav1GCcpw5RHOil
	 bkt95/Uylr8sX6VgYyopqjw/ppbXIBugvdL0z4ZJV44vaD6I98kKzNWMNk/2MYNbwP
	 ZdwYG3vFZpw7maDU1ryaXryFVeJB/hNA+/nPTz2RakVTUrC42tBAJ7ZFdYm686/6rh
	 zmg7XBdxAI4lFZtDpf+q1vXjiYGcAolmr1xHzZHt0+Q5wuhHrRbohkaDh0/VQtf4yF
	 /Ja++u4T7Pn1A==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6EF8140C79;
	Sun, 17 May 2026 15:21:46 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
 sashiko@lists.linux.dev, Linux Kernel Workflows
 <workflows@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, kfree@google.com
Subject: Re: Stop false review statements
In-Reply-To: <fd3b2ca7-4d64-4c4b-98a3-7d3285fa6826@roeck-us.net>
References: <ad139e54-a7f0-4d09-832c-6b2bf2e93e03@kernel.org>
 <fcc4b719-2696-4f31-bac4-6c07f8ddec47@roeck-us.net>
 <221cc52e-9918-43ea-b196-622a8cc6db05@kernel.org>
 <fd3b2ca7-4d64-4c4b-98a3-7d3285fa6826@roeck-us.net>
Date: Sun, 17 May 2026 09:21:45 -0600
Message-ID: <877bp2m586.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Guenter Roeck <linux@roeck-us.net> writes:

> On 5/16/26 05:16, Krzysztof Kozlowski wrote:
>> Quotes from the existing policy:
>> 
>> 1. "By offering my Reviewed-by: tag, I state that:"
>> 
>> Tool cannot use first person "I". Tool cannot "state that".
>> 
>> 2. "A Reviewed-by tag is *a statement of opinion* that the patch is an
>>   appropriate modification of the kernel without any remaining serious"
>> 
>> Tool cannot make a statement of opinion.
>> 
>> 3. "Any interested reviewer (who has done the work) can offer a
>> Reviewed-by".
>> 
>> Tool is not a reviewer as a person, thus above does not grant the tool
>> permission to offer a tag.
>
> I'd like to see that explicitly spelled out. Until then it is your opinion.

So I'm the person who wrote that text.  Automated review tools weren't
really on the radar at that time, so I can't argue that it expresses an
opinion either way as to whether an LLM could make such assertions.

That said, I was certainly considering *human* reviewers at the time,
and all of the people who agreed with the suggested policy were too.
Adding bots seems like a stretch to me.

I can't speak for subsystems that require Reviewed-by tags on their
commits, but I'm not sure that their maintainers would accept an
automated review as satisfying that requirement.

If we want to record this sort of processing, perhaps a tag like
"Scanned-by" would be appropriate?

jon
