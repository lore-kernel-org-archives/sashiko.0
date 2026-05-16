Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70778405C5A;
	Sat, 16 May 2026 12:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778934559; cv=none; b=ZjiyjJZoPrE1aeoQwX11pEMjxX3AwMbB8qARIp3OnoHP54QGLt/YCK1n43YSdfy3+TaRyz5OZW4o10aus9vIv+7sB+uabltKw2bLpRY0UZLECa3BAoWqSODm1+fCXcekISZzHKVH0F0nOJAdlVrhK6pdQ71xIBgBqMEAYhV9u4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778934559; c=relaxed/simple;
	bh=Lbp5oUIRM/Mc5rIExQYk1XGR6tzLA4ZDVN/RucFG268=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BhL7UY+PViQP/2sMHhDeee7stVgRDHnECHLxDj/4i/JuXW+UcoG24uQxTsPugtEpvl/o2KvzLJpCYK5p/pXmRcT/AVDDzGknAM+ggOb96yjC/AcDczjHwwbdEU/AuEea7F+PSKXni1pX8UBpAeBmez745u8xXh9SwWOordfsyNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rRJUIoHO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rRJUIoHO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA5A4C19425;
	Sat, 16 May 2026 12:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778934559;
	bh=Lbp5oUIRM/Mc5rIExQYk1XGR6tzLA4ZDVN/RucFG268=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rRJUIoHOEHWutR0CIyrwZ9LOE0CJ8SyPSU+3JdwYX7fDtU2Q83ywS99rsetJh+vgE
	 zcm7OBPOVttsYCF5Qr3PN5Kq6sFo+gvjRf39g7PhReTN/hgOcpjF2riWwJwfUgujr0
	 J9ZXGPcqKv1o+rGG8PkwVWq5wCr9F4xOqaYWurcNVwFdo+2pHpJfhskdDvn8lOp72v
	 FzxyzhUKgAsMDfr+253PuUP+rDZ5rjQYjogzh392gJZ9rDKltEOu4Ll28rVdT89+Dt
	 6L6m2cDZq68b4ZEUlYDNtoxCrn1u8YlVC5y7SWCfob48U8vKCsw5Bhccgv0YI5hXik
	 SqP59284JuKqQ==
Message-ID: <b5f2a21a-9530-4efe-aed5-cc96aab74e88@kernel.org>
Date: Sat, 16 May 2026 14:29:15 +0200
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Stop false review statements
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
 sashiko@lists.linux.dev, Linux Kernel Workflows <workflows@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, kfree@google.com
References: <ad139e54-a7f0-4d09-832c-6b2bf2e93e03@kernel.org>
 <fcc4b719-2696-4f31-bac4-6c07f8ddec47@roeck-us.net>
 <221cc52e-9918-43ea-b196-622a8cc6db05@kernel.org>
 <fd3b2ca7-4d64-4c4b-98a3-7d3285fa6826@roeck-us.net>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <fd3b2ca7-4d64-4c4b-98a3-7d3285fa6826@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/05/2026 14:23, Guenter Roeck wrote:
> On 5/16/26 05:16, Krzysztof Kozlowski wrote:
>> On 16/05/2026 14:11, Guenter Roeck wrote:
>>> On Sat, May 16, 2026 at 10:05:02AM +0200, Krzysztof Kozlowski wrote:
>>>> What the hell is that:
>>>>
>>>> https://lore.kernel.org/all/20260515190707.033BDC2BCB0@smtp.kernel.org/
>>>>
>>>> As a bot you CANNOT MAKE a Reviewer's statement of oversight. You are
>>>> not a damn human do be able to make such statement. You are a bot, a tool.
>>>>
>>>
>>> Where exactly do the rules say that ? I seem to miss that.
>>>
>>> There is a policy document about _contributions_ made by AI, but I don't
>>> see the one that says that AI agents must not provide Reviewed-by: tags.
>>
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
>>
> 
> I'd like to see that explicitly spelled out. Until then it is your opinion.

It is not an opinion. It is written. I gave you quotes.

Do you want to spell the rules of English language? That tool is not a
person?

Shall I send the patch like:

  Any interested reviewer (who has done the work) can offer a
  Reviewed-by.
 +In English "reviewer" is a person [1].
 + [1] https://en.wiktionary.org/wiki/reviewer

Seriously, you expect to document the English language?

> 
>>>
>>>> Stop faking tags.
>>>>
>>>> And really, considering how many false positives Sashiko produces, how
>>>> poor review comments it gives, how many misleading comments, it's
>>>> unacceptable to me to consider that a review.
>>>>
>>>> Amount of useless noise Sashiko produces already changed my mind how
>>>> useful that tool is.
>>>
>>> We seem to have completely different experiences. Yes, it does produce
>>> false positives, just like humans do. However, I have seen it find many
>>> real bugs, including many in patches which already had Reviewed-by: tags
>>> from (presumably) human reviewers.
>>
>> Of course it finds bugs. But it also produces - roughly - 80-90% false
>> positives, completely useless.
>>
> 
> Really ? The ones I have seen are - roughly, to use the same term - 80-90%
> true positives. Maybe you should explicitly ask for no Sashiko reviews in
> your scope of responsibility.

I already sent a patch to stop receiving all these emails and I stopped
reading them completely, when fetched via b4 for review in mutt workflow.

But this is not the point.

Our docs clearly state what Reviewed-by means, regardless of the quality
of the actual review. Poor quality is just another reason, less
important, though.

Best regards,
Krzysztof
