Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C71A34BA5B
	for <sashiko@lists.linux.dev>; Tue,  5 May 2026 22:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778019440; cv=none; b=ojE9jE2HnjofTMi4yL0to1J4ZOHBTSaiks4stm+AAVzY5Brwk5LR4BrUlZiTtDXyieqZzO/+VK17O1eosaSjC8Z2yG5pOM+vq+i6dJyU3xUYg9XwyWNxb1dyb415sFzq0qJksbisMXCGjTJSmgXOla7B7dsUzIOsV76AYxRRZh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778019440; c=relaxed/simple;
	bh=Sri1bG02HRchZT2KWcRP5AwNDpfUaw4JGLInzHCeJds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PEXBrrKe+nlWQZcfo54AQI0jfHgQrc9LLEJrhHotRZx/4IMtiF2YAnQRyoT0SigVWeqL/IEIarBpia4U34mGzf02X2JLMp2qLPInPo5/ZwcfgEoFPOZPigVA0cguMsBBVBOw9I1n2yBBh3ujhbQuPmDPuIDn7m/pHRaKVeuSrt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhmVTrMl; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhmVTrMl"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36528851d7dso1522678a91.1
        for <sashiko@lists.linux.dev>; Tue, 05 May 2026 15:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778019438; x=1778624238; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=LWAnksG0ViVuxsEZCdautT7Rmy8XEpOcaEgE861iraU=;
        b=RhmVTrMlQuuuEIDlYd6DPNNcJzvirRuWMwIemZM5QyB2z2rWa/sMwo0L5JptGGwXC/
         ucKONF23ClMSGydNmNssr4cn2nCXWVEPfHy9/6LlA01AkzfoqzNrfInMCTdL/6HYvYbq
         EtM9p/6Pxl+aYcitJczgt9287hefNJ2QLmY2MtNeca6HyjakuBoJXZX0kVVOL2d97H0D
         YXxtptAI8ysLq9v4LKrAMKT+65+5KY8YRuFCYKOkGr5FoG9YTPt5mWK7pXHBISlWMJaS
         HwUQaWGaNTV9uTxc+b2UAyC9tvIfMcAYCkoEh0NFx87CWS8GmTOXNDMYPD3KqDmWx8dG
         vf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778019438; x=1778624238;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWAnksG0ViVuxsEZCdautT7Rmy8XEpOcaEgE861iraU=;
        b=GJZnzjh6TU5xJC6Ow4PiYXx4AhRKlaikHmNUPy4w9ue+xr4Axkn8w2TPknZWe1htO5
         zQogPnmZy3VBpF093fx5FC+pel5+RoHM7Qd4KUO30BIks3GqXxDd6dodTZ6OuuoBhzB4
         xUeT8Wu/vTl8bh7UQaBOZKoTPBs8QRM2/mbIP81bwHpXTIeTljrIvPmErwAQqoMPZX0o
         WO0P4AFAM4lXYrpsSEgJFYySu1ylR4kfHNe5YGeB4X4m/KqC6QXCzGenSZpDjrOJXeHP
         ZO2mR2vDhPccBUs9ma9wGhfACRMFJV2ykf+QhVVF1mwXIACpG23MLbDx5I+7ucTb+yLu
         L5og==
X-Forwarded-Encrypted: i=1; AFNElJ8LhUNDdhHzFRihMhHze3hcHjDrrexystm9sOVcARiym2qIFqfgkNN/3+fnZC8frrjBLYJE49oS@lists.linux.dev
X-Gm-Message-State: AOJu0Yys/mdLAi4l7jlDqFIny8szn+idpDAugdChRSyIKCBGo1dAiC+v
	KJMAJsKjky+cnIrPcNtiw1qcM0JHljfPw8Ivs1CbF/5fbeskKbYWKs8C
X-Gm-Gg: AeBDievhatbPOdyoQ5jS2Bl9XdB++nCpcagbyyLZIRT+LvhNVSrkob6/qXUx6mFABbd
	SMGv7ry9xSnB9kfFmZjNy5TeqOhobfSZrSY9MR2BNh6K7thmzo1IJYobYcCDTDfN+uFHcUglD6l
	ARubEt7Ccf0cF4PuiRuammGrOf1yc5WjCIBCfOJajNQpjWeuEE1qIDG1Jc+ykAE3xE2jq079UW8
	ToLhib4D1zCZqCIAN9wa4pVK0rwI2sqDZ5OyLXyb00HU1JqihG2eEyHyYP92SFv15uK60bIyN17
	pkdw2tqt55upvprTwcl5f5q5DOtmPMVD8k7Lstew6+FB5UGTwXM4BvF+bEkKQP7wVnmUPoQAh3t
	lXj1m91TXvn1OrdQ03hvTUOMzXJCl1IgRqkKoXKvxt7iF2enX+yEpZ01M4hgdNhIx3NvUdOpSe4
	EDXWB2b6OjejFu7eD8BXuq+lPILlBM+SyRpW4y9LtI/AqmOwY7PkKIcqs/jYjYmVzTHplnJgsx8
	KDnOeV4X3w=
X-Received: by 2002:a17:903:90e:b0:2b0:6e60:9582 with SMTP id d9443c01a7336-2ba78f764e2mr8048095ad.18.1778019438407;
        Tue, 05 May 2026 15:17:18 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba7c9e1adfsm2614615ad.51.2026.05.05.15.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 15:17:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d357a7a0-920d-4ca6-82c0-c10a4a0a6db1@roeck-us.net>
Date: Tue, 5 May 2026 15:17:16 -0700
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/13] dt-bindings: i3c: Add mipi-i3c-static-method to
 support SETAASA
To: Rob Herring <robh@kernel.org>, sashiko@lists.linux.dev
Cc: Akhil R <akhilrajeev@nvidia.com>, linux-hwmon@vger.kernel.org
References: <20260423085718.70762-2-akhilrajeev@nvidia.com>
 <20260423112311.E2902C2BCAF@smtp.kernel.org>
 <20260505213248.GA4000045-robh@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260505213248.GA4000045-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/5/26 14:32, Rob Herring wrote:
> On Thu, Apr 23, 2026 at 11:23:11AM +0000, sashiko-bot@kernel.org wrote:
>> Sashiko AI review found 3 potential issue(s):
> 
> Does anyone read replies to the bot? If so, why was everyone hwmon list
> dropped?
> 

It appears that people either complain about getting AI feedback, or
they complain that they don't. That is pretty much a lose-lose situation.
For patches sent to linux-hwmon, Sashiko is configured to respond only
to the mailing list and to the submitter in the hope to minimize the
"I do not want to see this" feedback. That matches the configuration
for several subsystems.

As far as I can see it is not currently possible to limit AI review to
patches actually associated with the given subsystem if sent to that
subsystem's mailing list. I'll discuss with Roman to see if patches
like this one can be filtered out when reviewing patches sent to
hwmon mailing list.

>> - [Medium] The `mipi-i3c-static-method` schema incorrectly enforces `minimum: 0x1`, preventing devices from declaring no static address assignment support.
>> - [Low] The `assigned-address` property description is now inaccurate and contradicts the new capabilities.
>> - [Low] Missing macro definition for Bit 2 ('Other CCC') in `include/dt-bindings/i3c/i3c.h`.
>> --
> 
> This should go below the quoted commit msg.
> 

Others (like me) want to see it at the very top to see a quick summary.
Another lose-lose situation.

Again, I'll discuss with Roman if responses can be limited to patches
actually affecting the hwmon subsystem. This should hopefully reduce
unwanted feedback.

Thanks,
Guenter

>>
>> commit dbfc3abafb12042fa0c42239f7ff49c55d30eb3d
>> Author: Akhil R <akhilrajeev@nvidia.com>
>>
>> dt-bindings: i3c: Add mipi-i3c-static-method to support SETAASA
>>
>> This commit adds the 'mipi-i3c-static-method' property to specify which
>> discovery method an I3C device supports during bus initialization. The
>> property serves as a bitmap where each bit indicates support for methods
>> like SETDASA or SETAASA.
>>
>> [1] https://www.mipi.org/mipi-disco-for-i3c-download
>>
>>> diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
>>> index e25fa72fd7857..225844abdd1fd 100644
>>> --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
>>> +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
>> [ ... ]
>>> @@ -147,6 +149,27 @@ patternProperties:
>>>             through SETDASA. If static address is not present, this address is assigned
>>>             through SETNEWDA after assigning a temporary address via ENTDAA.
>>
>> Does the description for assigned-address need an update here? It currently
>> states that if a static address is present, the address is assigned through
>> SETDASA. This seems to contradict the new capabilities allowing SETAASA.
> 
> Yes.
> 
>>
>>>   
>>> +      mipi-i3c-static-method:
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +        minimum: 0x1
>>
>> The description below states that "0 indicates lack of support", but this
>> minimum validation prevents setting the bitmap to 0. If an I3C target has a
>> static address but relies purely on ENTDAA, how can a developer override the
>> default value of 1 to specify that no static methods are supported?
> 
> 0 is referring to the bit values, not the overall value. However,
> whether 0 should be allowed is a valid point.
> 
>>> +        maximum: 0x7
>>> +        default: 1
>>> +        description: |
>>> +          Bitmap describing which methods of Dynamic Address Assignment from a
>>> +          static address are supported by this I3C Target. A bit value of 1
>>> +          indicates support for that method, and 0 indicates lack of support.
>>> +
>>> +            Bit 0: SETDASA CCC (Direct)
>>> +            Bit 1: SETAASA CCC (Broadcast)
>>> +            Bit 2: Other CCC (vendor / standards extension)
>>> +            All other bits are reserved.
>> [ ... ]
>>> diff --git a/include/dt-bindings/i3c/i3c.h b/include/dt-bindings/i3c/i3c.h
>>> index 373439218bba6..8409addff0115 100644
>>> --- a/include/dt-bindings/i3c/i3c.h
>>> +++ b/include/dt-bindings/i3c/i3c.h
>>> @@ -13,4 +13,7 @@
>>>   #define I2C_NO_FILTER_HIGH_FREQUENCY    (1 << 5)
>>>   #define I2C_NO_FILTER_LOW_FREQUENCY     (2 << 5)
>>>   
>>> +#define I3C_ADDR_METHOD_SETDASA     (1 << 0)
>>> +#define I3C_ADDR_METHOD_SETAASA     (1 << 1)
>>
>> Since Bit 2 is documented as "Other CCC" in the binding and the maximum value
>> allows combinations up to 0x7, should there be a macro defined for Bit 2?
>> Adding one could prevent device tree authors from needing to use magic
>> numbers to represent this capability.
> 
> Yes.
> 
> Rob
> 

