Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDAD22083;
	Sat, 16 May 2026 19:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778958050; cv=none; b=qsKEr4ehxyiYdM+jAwAJsFiTVcwdGWbN5coz41Uf0IB2t0aBPacUcCQm59+1jvS2yEJZEcIyBi0o6ZFW4FewfbpbeyAqkNNqju11RNeWb8U4cusj4Duie8UVKLfhs2EuBINbzsxpkx2+705B1NIPw52HsFbjSkUxY76RRskYv34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778958050; c=relaxed/simple;
	bh=PQiHVAQABbwNOu2cnfizSRlkE9o7BRpuOWpC7poHhDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QTDFe2nPdoJroZxOcz+nz6ip+CkspCA9Bc+zWyo57qW21o7Y6fi0WHzE/RXkxAkhAWfpT5CHwqypcCnMNeCNjvWI/T6mnX4ed3ZLnnujE24qeIJ4lSDqH0EdngFT1dp/gles3qobR7OUsEZEfsJlcERH2tYDSXQtQptCQpHndlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bnCq8GuW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bnCq8GuW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C65C19425;
	Sat, 16 May 2026 19:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778958050;
	bh=PQiHVAQABbwNOu2cnfizSRlkE9o7BRpuOWpC7poHhDs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bnCq8GuWzNDogSNskJq4jjB6UivskvwGhDQmuudUP1Hyb2NZLYv6Sn+0PGJ87KyTe
	 +s+AtOau6kN/TvMOVwLUonaWZWsT9tfCBEmIuQKVdyossL5kBBwEBU1wQMh2VgdGw5
	 TDNmYDHJkFAZrlSMSuRUa0h0G33i+GjGvmdvodYwP/Jki+IpADCjTEhZkEflymyI14
	 8OSxCDPtgtX+iGqEzqg13SDksw4HGxzcD6Ko/b/kCrZky0+N5EB83wUY1LeA1SsZiM
	 v9JCffm4fx//CFiB4q9SF+hwdiCoXfxdRRinui2EPXmjOGlRGRj8H3ItLrajQekPza
	 EQ7LNP1nP4Lxg==
Message-ID: <b5989c0f-90da-42cc-a623-3b60df077848@kernel.org>
Date: Sat, 16 May 2026 21:00:46 +0200
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Stop false review statements
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Konstantin Ryabitsev <mricon@kernel.org>, Guenter Roeck
 <linux@roeck-us.net>, sashiko-bot@kernel.org,
 sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev,
 Linux Kernel Workflows <workflows@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org, kfree@google.com
References: <efc4d394-b328-4ccf-8c05-b6470ee4b88d@kernel.org>
 <70C5331E-06F1-48D5-A6BA-0CD130B69A45@linux.dev>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <70C5331E-06F1-48D5-A6BA-0CD130B69A45@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/05/2026 20:56, Roman Gushchin wrote:
> 
> 
>> On May 16, 2026, at 11:29 AM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> ﻿On 16/05/2026 17:49, Roman Gushchin wrote:
>>>>
>>>>> I’m not attached to any specific form of it, I thought Reviewed-by is the most obvious form.
>>>>> And we use Reported-by: tags with various tooling for years.
>>>>
>>>> Reported-by: shows the existance of a problem that some tool found, a
>>>> subtle difference here.
>>>>
>>>>> What do you think is the best form?
>>>>>
>>>>> I’ll pause sending reviewed-by tags until we have a discussion and agreement here.
>>>>
>>>> Just say it in some other text form, that our tools will not pick up.
>>>> Like:
>>>>   Tool XXXX reports that all is good:
>>>>       https://....
>>>>
>>>> or something like that?
>>>
>>> Sure, works for me.
>> Roman,
>> Before implementing such changes, send a RFC or just ask a few folks for
>> opinions. We do use the tool, among other tools, so we will gladly
>> provide a feedback.
>>
>> Sashiko should in general not send such emails when not asked for. Why?
>> Because we have also other bots, like LKP, KernelCI, and imagine how
>> maintainer's mailbox will look like.
>>
>> LKP allows opt-in for your own repo, which for example I am using, so I
>> get confirmation of the success. But people are not receiving them. I
>> cannot imagine all the people getting these LKP-successfully-built
>> emails on every email.
> 
> It’s opt-in on per-subsystem basis, as well as all other email-related features.
> I do rely on corresponding maintainers to decide if they want it or not.

The trouble is that subsystem is mailing list, thus I still got all of
them via b4, which is used to get the discussion.

Send them only to the maintainer, for example. Or maintainer + authors.

Basically the same as LKP is doing.

> If you’re saying that it should not send any non-personal emails in general, I disagree here,
> but happy to have a discussion, assuming it’s polite and constructive.

I meant it should not be send to people who did not request that. Opt-in
should be explicit and no mailing lists must be Cced (because then it is
sending to everyone).

> 
> The reason why I disagree is simple: there are maintainers/subsystems who like Sashiko’s reviews 
> and  before introducing the email interface they had to manually send links to Sashiko’s reviews
> as replies to proposed patches. I’ve been explicitly asked to add an ability to send out
> emails with reviews.

Sure, I agree with the need for use-case.

Best regards,
Krzysztof
