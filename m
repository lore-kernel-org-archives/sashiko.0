Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4713135AC18
	for <sashiko@lists.linux.dev>; Fri,  1 May 2026 19:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777663460; cv=none; b=P2GfZNxDJrM/sIAhEtJeUI+7HdcPSf1gUY6Z1euccBOpp6vCP/bzSg/ZR3ENWBxgRY8OHpC7tsZKeQYCTBtd6qeU1CnC4q80R+VmB5Nuh6H6kDO6qe7UK1HLx4boUzVhdwa4ENI3CmbLUuc/5fuxZOc23VjCfSKJ7vAtmn+AZJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777663460; c=relaxed/simple;
	bh=cEcG3VQBM8nbo9bJ8p/ewg7U5K1ZTe8NS7he9BrVrKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rZZA0LNQfSbSX5Vbv6q1Z8GuKzipHS3mFY5kzKnZgxZRc2mTTC0FsHyqFiq0xvbslAbCCyBDvqphLakMMSjvbY0pK6/46h79GivZ8JM5BKcqTqQwSstSrLWejFNkuI9UrJzEjTYsstXmFN9qURtxVHfXez2Zh6DvNz1O81U7p9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p2OMcqd9; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p2OMcqd9"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ecf9e398f4so3921451eec.1
        for <sashiko@lists.linux.dev>; Fri, 01 May 2026 12:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777663458; x=1778268258; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ofuvEJ00U/5aMZ2kxFF2KYD6htgNhM1ok9BsCcMpiVc=;
        b=p2OMcqd9i70NIncFpa/ysM5tIF2Mj8D3zIs51vYiMjS5HteJQWzdCcj7llnrSor59w
         i7OcevvjTf03/py3X+ndYmiyRpIBXm0OFbf0RivwtWH94IaWnlM5v1NyhF2m72YAn5wO
         y7IAJ4JNSIgb9Grf+/lWPyrOqIMtdzAA+xcYhXQmNurRoenLV8JZRm/QQ8xikzSOPwmM
         4RoquSMTKkTAmld/ECtCx6lFMuGIGeFGnKmBSDO+PI4Ppthr6IDTFtFK0rdhLzznchCQ
         /DdYtq0FQga7ohJb+OoZ5fIb4+avPX4TzxWApyj7M27djvGbyS1XFz2/CK3UTbIQiuRJ
         Ljzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777663458; x=1778268258;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ofuvEJ00U/5aMZ2kxFF2KYD6htgNhM1ok9BsCcMpiVc=;
        b=tAmk5m7IfYy7JmPPhHOes99Ij0I0VOqvhC/siEs+4kDUJuJBWxOsWruj1W7WHUa2Kt
         VFrpe0RkFgUUvkbhUmYqja3gaFUt/+F2l/ByCacBE/fupldVDib5OollAVquoJ/YTADk
         Rry2UaPKsRL/6Yt4psegEpdjToM4rxq5vYBj3uHx1zYlchiN5PH47s2IyMxJp1Tj3mu+
         m+9RAICvI8klkE6/rvo9KRmme92K8daSVI/nHV2l9MwjZ59gPpaoO+v86hkw8W6x06pU
         VwW/7p1YIFK2RsELSEfqpz7J68fK5XiSM+bHDUzmValz/oypP6JJxkE/34+IyYAIPThN
         Is3Q==
X-Forwarded-Encrypted: i=1; AFNElJ8xEoVi1KlEVbZeo5c4yhsjAjKW+WjC98RQXaX3BHZCHau1SSz7Disw845bXxwdZPBwPDF8zXDr@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6zs2DFdJJvS/iQk3CbJ79+fBYZT3ewkQ3nj+8ttWPk3aZ6LMQ
	7Ct3y8jDnTX4hXwJiGIFMUBMALwa14iFWuWMqxDQfSz1lFUGg+irjR5v
X-Gm-Gg: AeBDietTT0N4dmvc3Gdx1UFtRImW2ra8/F7c6aNXFkvPTstzaNSZQNBgRQwgD8r47nG
	OtEo2vkBS99xwm1o9bl4kNU/StsSL3Ya14Dn+qF58zjR0chpoqCeMIrPj9qmoLik4eJn4QElSoM
	QzmzxnnMz8/aCboJht+NsJ9Byl3pixNvXoHXVFu/yxC6OOPqf+jhzhiRf9BsQxWERT3ggiyaSku
	A/4ex9Qk8GbgG78y2qJ3TZESbJwrHDrB2fpOT08omN9c/KwnZ0bO/jXYtI3DnrrYDKxhzUWhpSd
	8vbVM0ehVrx/oPKwDw6i8dfAM+NU4Q+B3Jm/tiZamSH6Vjd/tEn+izQwrv7d9lhr48do0k4xEh5
	F5pfLSiqIaZTI9mOk8L9iawQEUJ2WGK9KrpXSwfvIJUxnbaNU66KBXY/v9y58UaPEG0wHYCLZcC
	Ft4go9D9D7R3j+Y7X5lPjLjVnh5x1FBj5R/W0c6KKBTJRZHpzs37CFqvQ/SsGyt+TkNyxGLEN4j
	mGOkoko98kes7XS04xoxg==
X-Received: by 2002:a05:7300:5b9e:b0:2e5:5bf4:8869 with SMTP id 5a478bee46e88-2efb9a97fbdmr337172eec.21.1777663458124;
        Fri, 01 May 2026 12:24:18 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38e71cedsm6786676eec.9.2026.05.01.12.24.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 12:24:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1cea4944-4433-4762-9072-1e595ca3f452@roeck-us.net>
Date: Fri, 1 May 2026 12:24:07 -0700
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AW: AW: [PATCH 2/2] hwmon: (lm75) Support active-high alert
 polarity
To: markus.stockhausen@gmx.de, sashiko@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
References: <20260501120518.3085501-3-markus.stockhausen@gmx.de>
 <20260501124540.0C11CC2BCB4@smtp.kernel.org>
 <039601dcd973$bf191230$3d4b3690$@gmx.de>
 <8776fc88-364e-4ac5-b30c-8a706716d8ff@roeck-us.net>
 <004101dcd99c$c0ade660$4209b320$@gmx.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <004101dcd99c$c0ade660$4209b320$@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/1/26 12:00, markus.stockhausen@gmx.de wrote:
>> Von: Guenter Roeck <groeck7@gmail.com> Im Auftrag von Guenter Roeck
>> Gesendet: Freitag, 1. Mai 2026 19:38
>> Betreff: Re: AW: [PATCH 2/2] hwmon: (lm75) Support active-high alert polarity
>> ...
>>>> - [High] The active-high alert polarity configuration is completely ignored by the hardware because it is not added to the register update mask.
>>>> - [High] LM75_ALERT_POLARITY_HIGH_16_BIT targets the wrong byte of the configuration register.
>>>> - [High] Changing the AS6200 default from active-high to active-low breaks devicetree backward compatibility.
>>>
>>> unsure if answering to you helps both of us further. So my 2 cents only shortly:
>>>
>>> - Issue 1: Existing definitions for tmp1XX devices do not not obey "clr_mask is superset of set_mask".
>>
>> I think you are saying that this is a pre-existing bug and that set_mask is effectively
>> ignored. Is that a reason not to fix the problem ?
>> ...
>> 2) Fix lm75_write_config() to add set_mask to clr_mask to ensure
>>      that the bits which are supposed to be set are actually set.
> 
> I did not expect a bug in the current driver and was baffled by the bots
> response. From your feedback that qualifies a "Fixes" tag. Am I right to
> assume that 6da24a2 ("hwmon: (lm75) Hide register size differences in
> regmap access functions") is the commit to blame?
> 

Correct.

Thanks,
Guenter

