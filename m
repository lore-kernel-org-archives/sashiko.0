Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9435377039;
	Sat, 16 May 2026 13:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778939125; cv=none; b=L/DJqfhooRpJvlxZMwAIURl8RZRnhIUxA8OduZ03Aediqdy5ksSZ9TYgEEAwDXgLIAph/MLhyq+AnerzudmaoBiL4tK08fJo04UhsglJYV9SO6bjVjXP/mdyfyE0yx4d6x45RvM8U0SnL63ksswbnZPZql4UCgAqgYONgqa/kEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778939125; c=relaxed/simple;
	bh=OswlLe1KSclxaV0S5vblbPI4rDXsx9FDUOK7BzOD/yE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HQHBCt52J7co2pG8Rw5bdvhTRSFI/+7voCCz2MERy+5fA3q1KDZB6YnakiQ8nJPtpmY0PvKo2nOClbbWhmHYqjmKQJ/IG9EPQLzLy4Q7IlNZ2nDqr/s6yav3iap7VPJcsXSxzk1uGvaXkx35h2r3OsgYTu7/c6wKZ3tiAoZPj8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YreJNu01; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YreJNu01"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62236C19425;
	Sat, 16 May 2026 13:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778939125;
	bh=OswlLe1KSclxaV0S5vblbPI4rDXsx9FDUOK7BzOD/yE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YreJNu01OKSeELR7+5TgG7OPVIcrWErAx3vh2hoLilWqbcgZrV1mTJc8ya7/wJB1y
	 3LY3jNzeXc0NlYFPuiYeppBb0U8PtPjH0yq4xcf+YHFhkNUtTtOxOc/romtdQ9ZClQ
	 t7UoCobNFLiangxY3Rp0/hrB09zQcMYzrTAwx/8ITHGHfamwx7tfMkOOsEzfXbbhIc
	 Ef5ymoQzKCCgEVp/Gvv1If5utssqtecr2afnJ1mFLa1STsHNmZ+ZV3QgE1Fn+gaZKN
	 EpcWOLOkUQDscsJIPB1OrzcoPHNlUmkuAtTZ8Uvzl8H/kh/pB5KMBGdl/reGFIuiOZ
	 yUMfhzGi7WFyw==
Message-ID: <2fe010ea-1c73-429f-8baa-0158a4afade1@kernel.org>
Date: Sat, 16 May 2026 15:45:21 +0200
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Stop false review statements
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Guenter Roeck <linux@roeck-us.net>, sashiko-bot@kernel.org,
 sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev,
 Linux Kernel Workflows <workflows@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, kfree@google.com
References: <ad139e54-a7f0-4d09-832c-6b2bf2e93e03@kernel.org>
 <fcc4b719-2696-4f31-bac4-6c07f8ddec47@roeck-us.net>
 <221cc52e-9918-43ea-b196-622a8cc6db05@kernel.org>
 <fd3b2ca7-4d64-4c4b-98a3-7d3285fa6826@roeck-us.net>
 <b5f2a21a-9530-4efe-aed5-cc96aab74e88@kernel.org>
 <20260516132407.GA163589@killaraus.ideasonboard.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260516132407.GA163589@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/05/2026 15:24, Laurent Pinchart wrote:
> On Sat, May 16, 2026 at 02:29:15PM +0200, Krzysztof Kozlowski wrote:
>> On 16/05/2026 14:23, Guenter Roeck wrote:
>>> On 5/16/26 05:16, Krzysztof Kozlowski wrote:
>>>> On 16/05/2026 14:11, Guenter Roeck wrote:
>>>>> On Sat, May 16, 2026 at 10:05:02AM +0200, Krzysztof Kozlowski wrote:
>>>>>> What the hell is that:
>>>>>>
>>>>>> https://lore.kernel.org/all/20260515190707.033BDC2BCB0@smtp.kernel.org/
>>>>>>
>>>>>> As a bot you CANNOT MAKE a Reviewer's statement of oversight. You are
>>>>>> not a damn human do be able to make such statement. You are a bot, a tool.
>>>>>>
>>>>>
>>>>> Where exactly do the rules say that ? I seem to miss that.
>>>>>
>>>>> There is a policy document about _contributions_ made by AI, but I don't
>>>>> see the one that says that AI agents must not provide Reviewed-by: tags.
>>>>
>>>> Quotes from the existing policy:
>>>>
>>>> 1. "By offering my Reviewed-by: tag, I state that:"
>>>>
>>>> Tool cannot use first person "I". Tool cannot "state that".
>>>>
>>>> 2. "A Reviewed-by tag is *a statement of opinion* that the patch is an
>>>>   appropriate modification of the kernel without any remaining serious"
>>>>
>>>> Tool cannot make a statement of opinion.
>>>>
>>>> 3. "Any interested reviewer (who has done the work) can offer a
>>>> Reviewed-by".
>>>>
>>>> Tool is not a reviewer as a person, thus above does not grant the tool
>>>> permission to offer a tag.
>>>
>>> I'd like to see that explicitly spelled out. Until then it is your opinion.
>>
>> It is not an opinion. It is written. I gave you quotes.
>>
>> Do you want to spell the rules of English language? That tool is not a
>> person?
>>
>> Shall I send the patch like:
>>
>>   Any interested reviewer (who has done the work) can offer a
>>   Reviewed-by.
>>  +In English "reviewer" is a person [1].
>>  + [1] https://en.wiktionary.org/wiki/reviewer
>>
>> Seriously, you expect to document the English language?
>>
>>>>>> Stop faking tags.
>>>>>>
>>>>>> And really, considering how many false positives Sashiko produces, how
>>>>>> poor review comments it gives, how many misleading comments, it's
>>>>>> unacceptable to me to consider that a review.
>>>>>>
>>>>>> Amount of useless noise Sashiko produces already changed my mind how
>>>>>> useful that tool is.
> 
> Note this isn't en entirely new situation. As a maintainer, you know how
> much you trust each reviewer. You will consider some R-b tags as a sign
> you don't even have to look at a patch, and will completely ignore some
> others. There's a whole continuum in the middle. In some ways, reviews
> by an LLM are similar. You will trust them or not trust them.
> 
> Except they're also very different.
> 
> The kernel needs more skilled reviewers (I don't think this is a
> controversial statement). We can't expect all newcomers to start with
> extensive experience from day one, so there's a learning curve. I
> believe it's fine for more junior reviewers to send R-b tags even if
> they miss some issue, as long as they genuinely try and improve (and, in
> some unfortunate cases, decide to leave if patch review turns out not to
> be for them). Those R-b tags may feel like a bit of noise in the
> beginning, but that's compensated by their value increasing over time.

Yes, I agree. Reviews from inexperienced people are sometimes fruitless
or pointless per actual value they bring, but they allow a person
(again: person) to grow in the community with a credits being the reward.

> 
> Bot reviews are not the same. Not only are they generated at a much
> larger scale than human reviews, they also won't learn from feedback you
> give them. Sure, the tools may be improved when cases of false positives
> are identified, and new LLMs may be trained with more (and better ?)
> data to improve the output, but they won't learn from the interactions.
> 
> How much value a maintainer sees in those reviews is up to individual
> maintainers. I will personally not consider a R-b tag from an LLM to
> mean that a patch is ready to be merged (and I believe you won't
> either). As such, I think that a R-b from an LLM is misleading and
> doesn't provide good value. At best it's free advertising for company
> making closed-source tools, which I don't think we should encourage.

That's different aspect than I raised. I agree with above approach but
it is more subjective.

What I brought is object: our docs clearly state that reviewer can offer
reviewed-by tag. They do not allow non-reviewers to offer a tag and
English is clear on that - only a person is a reviewer.

Dog is not a reviewer.

Hammer is not a reviewer.

Tool is not a reviewer.

Guenter did not bring any counter arguments that our docs ALLOW
non-person to provide a reviewed-by tag. I brought that arguments as
excerpt from our documented policy.

Best regards,
Krzysztof
