Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EB13D9DB0
	for <sashiko@lists.linux.dev>; Tue, 14 Apr 2026 14:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776178465; cv=none; b=SKKo7+W61cC2wRPjRFcJtivyhlkJN0fIzP0JauPQ8SONP4NSgmHMJi9KikBws5NPClPDCJ/l2E+aJiBFDHaDsFmVdCFxXZmHStNxUaCMA3D1fD7J99A7kY53B0IYo5lc9Xxmb7YtWVNBBFnc8TUVYHPnyW1ZTcxi5NeKMvCv2LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776178465; c=relaxed/simple;
	bh=IWuPydW50YLB92gIekVEDvvRc7tle3WFLdCSoOSNRl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tJG+eaNW/U7HaRMUWlleHYvAXVz0RBR6jQ1I16mh8OozX2APodpAdTKy+cBesnJJBNZTc1iPqwzXpX2qFR9wT/ViHiLWX1n22EQok8/XuKoY1oHy/s7KHuqLCWmmdXI95dWoeTQJ9A98VrJjjlN5m9d6rFm1qhvN4kBBcBEk+po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rnyW7s4g; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rnyW7s4g"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35da9c0c007so5026986a91.2
        for <sashiko@lists.linux.dev>; Tue, 14 Apr 2026 07:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776178463; x=1776783263; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=tp/MYIQS3vXeKNc71inygN24cXXQ1UnXH7uJ/e8WJdg=;
        b=rnyW7s4gCa8EXJg7tIm6xcWpYixSC3QLFLmMzF+lCXNJj85AZ5HxkEOjdgTrCPrItK
         baQLThHSvqdeWwrbdftmZygUfb9r1Azy21rd82+feJzqNSAaGSaw7xqbnDdbHjAGBcpZ
         O69v3UR6XGf8t7Tl/Ljeg8OYl2IE7etehElg2aeWdjH10PhqfsSEWncgGhbW6t9tx/8c
         EnNFJJikYJti6o7oJl8dAc3+2AXJrhQUIO35TzNVPOFplvhPOtyEhI7i2rekxnK47LrB
         wiAoeQ7zhVpCz5i8AtZJ6gcTteWg7haEBYYceegwLlkFvD8B5avMMCQhi+oKUwIraB8F
         9vYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776178463; x=1776783263;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tp/MYIQS3vXeKNc71inygN24cXXQ1UnXH7uJ/e8WJdg=;
        b=f6x3HXC6+QBlw09sXwqQG/A2hKj0pWHUgTsp9JZrHRaH4tIeGWHD+G9B9QbvqzqFJ6
         Hl0P6VhZOcyZW57hvniqmVCyQqtlLK6njO+Zz7SUCwx3/vGeMIgAthvFU/hfMsgWczIO
         +vzP37FWxvpbyAdKTMk7OBJe9PBFkBsYa1CYvo2g9uuzvLb4ACpUdJFC+dlIn/6VAfYx
         rIpinkjeovk862H8AzfNLQPcBRz4Gtr1t082oSqulJ7LSvmPOwzVJklz5qHQSbAgCuSG
         f9PYSGzLYBJy6U6vUpUYcR3if5Nx+qaXBY7qv6bZxBIT8iotBjvKqEr5XDR/fd9weD6M
         ZlAA==
X-Gm-Message-State: AOJu0YwOIAbMIMJA2StHxszOiO2ruPzWxLys4OtgF6nwJAcUhs8RJYa1
	soUJVocO2DPsKBUYnvveGJ4v6sq+OZmPhXGecYBgCYRdeVg4sDXXK/GXIuOe4Q==
X-Gm-Gg: AeBDievlq8WGEn1AfPIGWnQ/U0xDisxYOL+iNNAhW4NFETi3dNzA5fNBFCdsjLW0m3j
	wr9afY9+RMIq4FcXEdL5wgT9F5o2I3kd8e+Exk+KypaEoEhfMZwCR8DPFOeAurSoISywty6hzUo
	x1pV4zs9Q0qp1+XslaPwV/LNnsKCzuKvZ+8WRlVuhWTYnXANjmP7g+NBNbZu2b4d6q0KsMOr1RO
	n/CvXtmdWfcTI6l47PGwAbF8BXRs+9VFEc6aLgGuzLEe7PgsSkGtEAGVo9XeNJEx2R+t1Ca9YNS
	jFGriVBuNMTcSSBE1xCBWVKfPgjP6SpJg8Wthrx7Hk3PnQHawRWYqouaOdH1i8Qi+o4zEzGtHdS
	15nW9nfJCZpiYsPlfOm+2jCRnWbwR59CZ+0B6Da02P0OYJ39yfjE6M9aFa3XKmldinQUFnsIvMT
	pjz16o8apU148nDUI/HzNIMCndHklQplFVutkQxkiopcg2ET7im6rJuZLXZGgnnIXJum7foDIW
X-Received: by 2002:a17:90a:118f:b0:35e:5aa5:ae38 with SMTP id 98e67ed59e1d1-35e5aa5b2ecmr6721531a91.9.1776178462954;
        Tue, 14 Apr 2026 07:54:22 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fcdda7096sm10418a91.0.2026.04.14.07.54.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 07:54:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <69f893bd-bb38-439c-b7e3-30d17c6b8cd3@roeck-us.net>
Date: Tue, 14 Apr 2026 07:54:19 -0700
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (pmbus/max20830) add driver for max20830
To: sashiko@lists.linux.dev,
 Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260414-dev_max20830-v1-2-210d3f82c571@analog.com>
 <20260414045647.4AACCC19425@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260414045647.4AACCC19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/13/26 21:56, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 3 potential issue(s):
> - [Medium] The driver incorrectly uses `i2c_smbus_read_i2c_block_data` instead of `i2c_smbus_read_block_data`, violating the protocol and logging an untrusted binary buffer.
> - [Low] The MODULE_IMPORT_NS macro uses an unquoted identifier, resulting in a build failure.
> - [Low] The sysfs attribute `in2_alarm` is created but not documented.
> --
> 

The reported issues seem real. Please address.

Thanks,
Guenter

> commit 62ed9b8ac37c74adac303a0ebaea8df41fde6a85
> Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> 
> hwmon: (pmbus/max20830) add driver for max20830
> 
> This commit adds support for the Analog Devices MAX20830 step-down DC-DC
> switching regulator. It provides a PMBus client driver to monitor input and
> output voltages, output current, and temperature.
> 
>> diff --git a/Documentation/hwmon/max20830.rst b/Documentation/hwmon/max20830.rst
>> new file mode 100644
>> index 0000000000000..b9dffb7605978
>> --- /dev/null
>> +++ b/Documentation/hwmon/max20830.rst
> [ ... ]
>> +================= ========================================
>> +in1_label         "vin"
>> +in1_input         Measured input voltage
>> +in1_alarm         Input voltage alarm
>> +in2_label         "vout1"
>> +in2_input         Measured output voltage
> 
> This isn't a bug, but since the driver configuration enables
> PMBUS_HAVE_STATUS_VOUT, it will expose the in2_alarm attribute. Should
> in2_alarm be documented here alongside the other alarms?
> 
>> +curr1_label       "iout1"
>> +curr1_input       Measured output current
>> +curr1_alarm       Output current alarm
>> +temp1_input       Measured temperature
>> +temp1_alarm       Chip temperature alarm
>> +================= ========================================
> 
>> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max20830.c
>> new file mode 100644
>> index 0000000000000..bcf60fd948e34
>> --- /dev/null
>> +++ b/drivers/hwmon/pmbus/max20830.c
> [ ... ]
>> +static int max20830_probe(struct i2c_client *client)
>> +{
>> +	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
>> +	int ret;
>> +
>> +	if (!i2c_check_functionality(client->adapter,
>> +				     I2C_FUNC_SMBUS_READ_I2C_BLOCK))
>> +		return -ENODEV;
>> +
>> +	ret = i2c_smbus_read_i2c_block_data(client, PMBUS_IC_DEVICE_ID,
>> +					    I2C_SMBUS_BLOCK_MAX, buf);
> 
> Should this use i2c_smbus_read_block_data() instead?
> 
> PMBus IC_DEVICE_ID is an SMBus Block Read command, which natively returns a
> length byte followed by the data. Using the I2C block read API with a
> hardcoded length of 32 forces an over-read and captures the raw SMBus length
> byte in buf[0].
> 
>> +	if (ret < 0)
>> +		return dev_err_probe(&client->dev, ret,
>> +				     "Failed to read IC_DEVICE_ID\n");
>> +
>> +	buf[ret] = '\0';
>> +	if (ret < 9 || strncmp(buf + 1, "MAX20830", 8))
>> +		return dev_err_probe(&client->dev, -ENODEV,
>> +				     "Unsupported device: '%s'\n", buf);
> 
> If the device is unsupported, will logging the buffer via %s print unprintable
> characters?
> 
> Since buf[0] contains the raw length byte from the block read, this could
> inject control characters and trailing binary padding into the kernel log.
> 
> [ ... ]
>> +MODULE_AUTHOR("Alexis Czezar Torreno <alexisczezar.torreno@analog.com>");
>> +MODULE_DESCRIPTION("PMBus driver for Analog Devices MAX20830");
>> +MODULE_LICENSE("GPL");
>> +MODULE_IMPORT_NS(PMBUS);
> 
> Will this cause a build failure?
> 
> The MODULE_IMPORT_NS macro expects a string literal. Should PMBUS be enclosed
> in quotes, like MODULE_IMPORT_NS("PMBUS")?
> 

