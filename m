Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55ACA2D8393
	for <sashiko@lists.linux.dev>; Sat, 30 May 2026 02:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780106685; cv=none; b=LfqMnI7+JSGMdCY31HFHAyv4k3mksiJbXQIR1uM2ZeEHuI8Nkprql4u0+eYESMZdbOF32GVLxn+CQtAPkXw5kkiybw2TmBqSETDapZXvrRNO7gDUDmBvs30HkwAycPi7nSPMnbj4K+Q+Wwdhsf3DvNpO8++vQDTV7S+3ajgmqDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780106685; c=relaxed/simple;
	bh=Ie9s9pe/xnUe16vSDSz6R6jzeQVRDbGF/2eXGSM9moY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E4T1n11bE+gSI7RXHd0kubNoMHBip07Q5M/5SAhKct+2Vq36Ds0orF2kMn20CF3IcoBj3t+C+yXIw7UGjFVPDaxPNAMspACsUqeeBeJZ0iH5DAXPix+RXNzVlaHC/AHdkmGhBpNGLR1pgEvzSmCzuctKwwE5MXwhtkmMtry7jLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=WbY6yT3R; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="WbY6yT3R"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8acae26e564so182004026d6.2
        for <sashiko@lists.linux.dev>; Fri, 29 May 2026 19:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780106683; x=1780711483; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rChQttyFsqsEE3YOhXi7hNQOqbKBjIdVvH86ahpWNIo=;
        b=WbY6yT3Rfqza/tUnKE2mc5ToUOoXEzLKqkQ6x/cw66MRx139CO74AulsMYHgARGjim
         V6q1uQ+KVw0RH7PkI5YUe3kEgbbPvOzEZUxbV4KcvIcO44RufBp+reV/wyhAO2Y3z94P
         ur6FTZkqp7U8/m+519dqOlQ/J1KnDraMaUEZjqsJS242qy7GS1exwbWB/Nb8u8ermbgc
         QECS4o/xe6LF/Q+5qe/b/VcubdqVOeqWJrzAWtTictydfT9IaeI4Go/ANhdn7mTQeYXG
         s0iEt3VVNJSkZyNCKA8jlXC+LHbFnkp3u147isL8Y5tHIvTq6QLKhmndz2Ian9uhb7/e
         /AJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780106683; x=1780711483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rChQttyFsqsEE3YOhXi7hNQOqbKBjIdVvH86ahpWNIo=;
        b=LuDrEo4uBrzDZ1Y4t7gnVzGC0O5P4fwCb690/CvVu2KlurR+EqH+3BtrORgCvbop69
         d9wt+JrSb1AstKm1PDcr6e7OZNqYuvlnSC38N+jqBSVZNFvRtkTPT2DEpPd9ZqSHiggi
         TCe9DN9HaqiNzGSM0qnl47cdhF/lG2euHMYTiXsSy3SdW52vLyyJ6Mo04P/sgyfXBkfu
         DL+8WMU0dY0/7KtVH5Frjcync+hDGJUSZJPaK5Jw0pqsTdhT3icK5rOnOwjsCuNCELD3
         3Ys8FFX/aOP+PEDBMKHUBxI6jI0lKjAXDpi/tokntCA7xrn87ZUIlk//gAF1pMQwnyhI
         vf0Q==
X-Gm-Message-State: AOJu0Yzk5BrZDPAHnbrrIRprHQas/sQSbVtIAgllZy6fq57I3bCwZRyA
	SJ15vEEl2zHYe254g7E04iZbBhTVqAUkh/qFysbqKfxvPlcW6OpR3xumPMA0chvrPqA5ds0scIX
	LMhSey3s=
X-Gm-Gg: Acq92OEGgDDDYAR5pcMXygwAJxnQCKGDb8YmzAKCnXLx/KpdxizsACNMIY1JAlJRLFc
	fpBDd/Lw0x5KCtzYUpdiT7RyEgMzFY9SzS/te3LVuZwgVWW2iJEfLVkiOXbOIPV23B/9BmdrNDo
	9QMSyKFgHglJTt/dunMizyj4edP0zwLUIHD9NrFpl8YZiaypyasB/5IPemHLVQXOcuvW9mdb/o8
	FcbZr69juy0ne+wibYN8dY0oH2Ex1J3eHVOunL1/deoHdeOCzYm5PAD92IKhqejrrDSHvVW77B8
	/GUR3RVemePI6z3eLEFfQZ8WqvwAshnIlz6KfsKCAzYPK4dgLSB2aK751iNqkIpb4tLbh0kFOuq
	ANENjE5ObhLyROBr58x1bL58rVqfpgJ2zsOQyX5JKT3aMAVg5ev6v7ShQ0i+Hs/LhFgLJk3sunw
	Sk62wdMDfTFYL+115kpmXAK+IDGNlH0FI6zU5lJGDiXpsD
X-Received: by 2002:a05:6214:4905:b0:8ca:2413:607a with SMTP id 6a1803df08f44-8ccefb25d5emr41623066d6.5.1780106683407;
        Fri, 29 May 2026 19:04:43 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea06d4casm32658206d6.16.2026.05.29.19.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 19:04:43 -0700 (PDT)
Message-ID: <8bd1ea39-b392-4b99-a70f-1815557e48ae@riscstar.com>
Date: Fri, 29 May 2026 21:04:42 -0500
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 09/12] gpio: tc956x: add TC956x/QPS615 support
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org, Daniel Thompson <daniel@riscstar.com>
References: <20260501155421.3329862-10-elder@riscstar.com>
 <20260502155618.2E65FC19425@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260502155618.2E65FC19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/2/26 10:56 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] Function signature mismatch for `tc956x_gpio_set` causing build failures.
> - [High] Sleeping in atomic context bug on PREEMPT_RT due to `can_sleep = false`.
> - [Medium] Uninitialized stack variable used if `regmap_read()` fails.
> - [Medium] Ignored `regmap_update_bits()` return value can cause incorrect hardware state.
> - [Low] Kconfig depends on a non-existent symbol.
> --
> 
> commit ff81a192de0fcb35d3c4b8a32cad777cd0bff29e
> Author: Alex Elder <elder@riscstar.com>
> 
> gpio: tc956x: add TC956x/QPS615 support
> 
> This commit adds support for the GPIO controller embedded in the Toshiba
> TC956x Ethernet-AVB/TSN bridge. It implements an auxiliary device driver
> for the GPIO block using regmap.
> 
>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>> --- a/drivers/gpio/Kconfig
>> +++ b/drivers/gpio/Kconfig
> [ ... ]
>> +config GPIO_TC956X
>> +	tristate "Toshiba TC956X GPIO support"
>> +	depends on TOSHIBA_TC956X_PCI
> 
> Does TOSHIBA_TC956X_PCI exist in the tree at this point? Reference to a
> non-existent config symbol causes silent build failures. If it is added
> later in the patch series, this temporarily leaves the driver unselectable
> and breaks bisectability.

In version 2 of the series, the patch that defines TOSHIBA_TC956X_PCI
will come earlier than this one in the series.

> 
> [ ... ]
>> diff --git a/drivers/gpio/gpio-tc956x.c b/drivers/gpio/gpio-tc956x.c
>> --- /dev/null
>> +++ b/drivers/gpio/gpio-tc956x.c
> [ ... ]
>> +static int tc956x_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
>> +{
>> +	struct tc956x_gpio *gpio = gpiochip_get_data(gc);
>> +	u32 reg;
>> +	u32 val;
>> +
>> +	if (test_bit(offset, gpio->input_only))
>> +		return GPIO_LINE_DIRECTION_IN;
>> +
>> +	reg = offset < 32 ? GPIO_EN0_OFFSET : GPIO_EN1_OFFSET;
>> +
>> +	regmap_read(gpio->regmap, reg, &val);
> 
> If regmap_read() fails, does it leave the stack variable val uninitialized?
> Should the return value be checked before evaluating val in the next line?

In this case, we know we are using an MMIO-based regmap, and
since we have no clock, regmap_mmio_read() always returns 0.

>> +	if (val & BIT(offset % 32))
>> +		return GPIO_LINE_DIRECTION_IN;
>> +
>> +	return GPIO_LINE_DIRECTION_OUT;
>> +}
> [ ... ]
>> +static int tc956x_gpio_direction_output(struct gpio_chip *gc,
>> +					unsigned int offset, int value)
>> +{
>> +	struct tc956x_gpio *gpio = gpiochip_get_data(gc);
>> +	u32 vreg;
>> +	u32 dreg;
>> +	u32 mask;
> [ ... ]
>> +	/* Set output value first, then direction */
>> +	regmap_update_bits(gpio->regmap, vreg, mask, value ? mask : 0);
> 
> If this first regmap_update_bits() fails, should the function bail out
> early? Ignoring the error and proceeding to change the direction to output
> anyway could actively drive an unintended logic level onto the pin.

Again, we do not expect regmap_update_bits() to return an error
for an MMIO-based regmap.

>> +
>> +	return regmap_update_bits(gpio->regmap, dreg, mask, 0);
>> +}
>> +
>> +static int tc956x_gpio_get(struct gpio_chip *gc, unsigned int offset)
>> +{
>> +	u32 reg = offset < 32 ? GPIO_IN0_OFFSET : GPIO_IN1_OFFSET;
>> +	struct tc956x_gpio *gpio = gpiochip_get_data(gc);
>> +	u32 val;
>> +
>> +	regmap_read(gpio->regmap, reg, &val);
> 
> Similar to tc956x_gpio_get_direction(), does this leave val uninitialized
> and return unpredictable states if regmap_read() fails?

This should not fail, so we expect val will be initialized.

> 
>> +
>> +	return val & BIT(offset % 32) ? 1 : 0;
>> +}
>> +
>> +static int tc956x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
> 
> Does the set function pointer in struct gpio_chip expect a void return
> type? Assigning a function returning int could trigger an incompatible
> pointer type compiler error or cause Control Flow Integrity panics at
> runtime.

I might be missing something but I don't understand this comment.
In any case, the next version of the code implements the GPIO
controller using the gpio-regmap framework.

> 
>> +{
>> +	u32 reg = offset < 32 ? GPIO_OUT0_OFFSET : GPIO_OUT1_OFFSET;
>> +	struct tc956x_gpio *gpio = gpiochip_get_data(gc);
>> +	u32 mask = BIT(offset % 32);
>> +
>> +	return regmap_update_bits(gpio->regmap, reg, mask, value ? mask : 0);
>> +}
> [ ... ]
>> +static int tc956x_gpio_probe(struct auxiliary_device *adev,
>> +			     const struct auxiliary_device_id *id)
>> +{
> [ ... ]
>> +	gc->base = -1;
>> +	gc->ngpio = TC956X_GPIO_COUNT;
>> +	gc->can_sleep = false;
> 
> Is it safe to set can_sleep to false while using a regmap? By default,
> MMIO regmaps use spinlock_t for synchronization, which becomes a sleepable
> rt_mutex on PREEMPT_RT kernels. Calling these GPIO methods from an atomic
> context on PREEMPT_RT could cause a panic.

Here too, even if this were an issue, the issue will move into
the gpio-regmap code with the new version of the code.

					-Alex

> 
>> +
>> +	dev_set_drvdata(dev, gpio);
>> +
>> +	return devm_gpiochip_add_data(dev, gc, gpio);
>> +}
> 

