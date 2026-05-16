Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C81F405C57
	for <sashiko@lists.linux.dev>; Sat, 16 May 2026 18:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778956389; cv=none; b=MhLTu0Vin7KfGp5lZFBy4M47ZzEUImTa3VM4YWvkNZoJcMHBhoDNtLL99OvMMfbGLxVdzqlfMK25WmbuqLybCd1yqu0bqKAIryUkUFBeEVU/zegZjV8kSz3OTGo1bzfrObg7UdT5ARiCDjp6yjX8h/wMJdBj/3+3OxddbK8jbSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778956389; c=relaxed/simple;
	bh=hXHIWKI6wgxzSeQ2rxIsqxw4r79nivnOIlr62ncCho4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mrtNOmC69LRalXqYcDW/U4v5xMC6B1F75cd5YAYyd3wvTvLlBK1ljyQsYnV5GLXNrFZ2BQsiHin0dexTd8sqHWZAQHla53q0gFPXkSJ1bCap1dqgDl3EA4rTSww9mBF4zVrVBjsXbGDcl22f93Ae05hQEYw5DF5pV7kZj174Zgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5CHwRb5; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5CHwRb5"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12c1a170a50so1029842c88.0
        for <sashiko@lists.linux.dev>; Sat, 16 May 2026 11:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778956387; x=1779561187; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=XUoL8IfXmhr3FEtdbxmowuhFwjumOfiDBF5o0m3Q710=;
        b=R5CHwRb5vGNB52Z8okB8gpJC/uIegtCLY1kCa52rcmP7Tf3o0XVM3n0Ru24M3ZytEd
         J/J7e725PoYcHzP9KjxlQUQ8fueDVNZPEL/KHxHQXVc9UCt8sqw3I5r8Nk6GpHTL212e
         oYRXi4ln1vaq0+902EvtH16+t+0TXw5pYzeC8N4fO5RYEXcdehfMhwBJL9lRLOWrK0Ec
         egzXMwnlhVT+vtSIZOoh9ZeZQSvIE1zYPmP826ENEMTI3hev2EougTvnN6cCAnUCAcEy
         l9sIrq1Dk/hHHnEUw407wypdQF39/E6bcq3mxJ69Bat6v0M8hpWA5Aj3hr9mA6ihdJLT
         1VzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778956387; x=1779561187;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XUoL8IfXmhr3FEtdbxmowuhFwjumOfiDBF5o0m3Q710=;
        b=YAKRUZlThRCqdshi4CRQGc1oyQJ8M3d2tKtZvlwJnOHMy/LX3IbpzHTLcPhnB9Ld27
         iZ8VeqG8VpreNCmaGLtrP2DJL7SiVO2YK6TNbiAXEIO3QfnuOFuYuJzI3h3O/58b1me3
         IHfR+cluAdS/ss4guHDjFGfUMxN7bxIrllweg23EHmJtMJWgj7HLqF+1xXaNES1E5BDW
         Ygt5zKx7hqeDEXnflVuozsg60yeXIfsRblBzvt7ISKJGNWykB58CHGCE/kGrzH76ojd7
         1Nf87QKzGiAWjLnvJZQU2m5Rbm+W4+CwvFI2pEJJxyzVmeiNF26U9qpXI+h/qZ/voqAG
         2F5g==
X-Forwarded-Encrypted: i=1; AFNElJ+EjgMrBXJN30QBgvW0k5shL0pzGKn1/TnVSAdd0n4dr/XI6y9QiMRi5vyjdfz+kn3tIXkLTNVH@lists.linux.dev
X-Gm-Message-State: AOJu0Ywl0Ij4FL35JoQuIPH9bxLywl1VCdxRfJF0uvb5ODtIX1kBJdnz
	nzz0wpCQhirxe3oVQPRE5XRoNciTWERxxSjNaat7IXRnMV0pDNTE+VK1
X-Gm-Gg: Acq92OGX/Ba+iujNUjO+QG0ZxGUuz5qOLaVJc0Cn1LAIgS5AMtpWHvfKHQnNXF4p3w4
	TNDA6FxKKYTRJIAgu7WzKLMyG3ywAxmKukgeIu8TYyaZomnI0lkZMfJGLu+9UI2HxzA7dLd5sDL
	5udk34/5eBDpZipfxbxyCDK8TAnzr74N+CkP56tFSIUIVcln7my59+eV065An3HK8oVVYrLluLK
	cCZqEsSBewWtzZODzkpKL05rIO8DSoN6TZ24TaZD1M5MT5Ikqyu1NGLs9eHzhvmNdFPW25A1K5Z
	AiimahfA1TFem0EFd2IgF+YljYFWaxbYGBTIg0sNYd8+n1n4eLUzFhj7HHPcVSMpTNdO8wKha8A
	2X3PmM0OLaNt1zk6YJKxGqqKxF5r/fvOAvLDZSuEkHqAh0WuiCUuu4Uxc/kS7F2a+zCGfuHH2Uc
	xn+UBJPpqaMkxER5GaxgvNMH/hDhb+5NvlnBfFOaMHRid7gsBhiGN5O3BGPA7m6qWAMB7fg8VO+
	Gjm5+GNGfr6GqtaOy5jKg==
X-Received: by 2002:a05:7022:438a:b0:128:cf5c:5356 with SMTP id a92af1059eb24-1350440ab6dmr3721112c88.5.1778956386620;
        Sat, 16 May 2026 11:33:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc33aac9sm11334943c88.14.2026.05.16.11.33.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 11:33:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3dfcec0e-3ce9-440b-9377-deba8fa9f2eb@roeck-us.net>
Date: Sat, 16 May 2026 11:33:05 -0700
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] watchdog: realtek-otto: Change to use regmap API
To: Sander Vanheule <sander@svanheule.net>, Rustam Adilov
 <adilov@disroot.org>, sashiko@lists.linux.dev
Cc: linux-watchdog@vger.kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20260509163101.722793-2-adilov@disroot.org>
 <20260509171602.6B74FC2BCB2@smtp.kernel.org>
 <1d8a4fa99fa1af9e41f255ec147a7571@disroot.org>
 <173f0f7d804d3b0f33b6584b8a592d2079c593e9.camel@svanheule.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <173f0f7d804d3b0f33b6584b8a592d2079c593e9.camel@svanheule.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/15/26 14:10, Sander Vanheule wrote:
> Adding back Guenter (and Wim) in Cc
> 
> On Fri, 2026-05-15 at 20:48 +0000, Rustam Adilov wrote:
>> On 2026-05-09 17:16, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 1 potential
>>> issue(s) to consider:
>>> - [High] Deadlock risk in the atomic restart handler due to regmap's
>>> internal spinlock.
>>> --
>>>
>>> commit a520c8e2203154ba331a6ae28f00daec074e62ee
>>> Author: Rustam Adilov <adilov@disroot.org>
>>>
>>> watchdog: realtek-otto: Change to use regmap API
>>>
>>> This commit converts the realtek-otto watchdog driver to use the regmap API
>>> instead of direct mmio accesses. It replaces direct read/modify/write
>>> sequences with regmap functions and selects REGMAP_MMIO.
>>>
>>>> diff --git a/drivers/watchdog/realtek_otto_wdt.c
>>>> b/drivers/watchdog/realtek_otto_wdt.c
>>>> index 2c30ddd574c59..e5e9cb480f4f9 100644
>>>> --- a/drivers/watchdog/realtek_otto_wdt.c
>>>> +++ b/drivers/watchdog/realtek_otto_wdt.c
>>> [ ... ]
>>>> @@ -199,7 +189,7 @@ static int otto_wdt_restart(struct watchdog_device
>>>> *wdev, unsigned long reboot_m
>>>>   
>>>>   	/* Configure for shortest timeout and wait for reset to occur */
>>>>   	v = FIELD_PREP(OTTO_WDT_CTRL_RST_MODE, reset_mode) |
>>>> OTTO_WDT_CTRL_ENABLE;
>>>> -	iowrite32(v, ctrl->base + OTTO_WDT_REG_CTRL);
>>>> +	regmap_write(ctrl->regmap, OTTO_WDT_REG_CTRL, v);
>>>
>>> Could this regmap_write() cause a deadlock during system restart?
>>>
>>> The restart handler is often called during system shutdown or kernel panic
>>> in an atomic context with local interrupts disabled. Since
>>> devm_regmap_init_mmio() configures the regmap to use a spinlock by default,
>>> if a panic occurs while another cpu holds the regmap lock (e.g., during
>>> a ping or timeout update) and that cpu is halted by smp_send_stop(), this
>>> regmap_write() could spin endlessly and prevent the system from rebooting.
>>>
>>> Additionally, on preempt-rt kernels, the regmap spinlock becomes a sleepable
>>> rt_mutex, which could cause a sleeping in atomic context bug when acquired
>>> with interrupts disabled.
>>>
>>>>   	mdelay(3 * otto_wdt_tick_ms(ctrl, 0));
>>>>
>>
>> Hi Sander,
>>
>> I hope it is alright if i CCd you for this as i am not an expert on watchdog
>> stuff.
>> Wonna make sure this issue applies here before i proceed with the suggested
>> solution
>> to add .disable_locking to regmap_config without understanding the
>> consequences of it.
> 
> I'm no expert either, but AFAICT using .disable_locking would essentially mean
> all accesses are only protected by the watchdog subsystem. Which is also the
> case now, so that would mean feature parity.
> 
> I'll leave it up to Guenter to decide if this refactor is worthwhile or not.
> 

I don't mind the refactor, but it must not introduce a regression.
As Sashiko points out, either regmap needs to be configured with
.disable_locking set, or regmap can not be used in the restart handler.

Guenter

