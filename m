Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D171F2F0C74
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 08:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778574859; cv=none; b=cg2JvkfejXb2pTeDM/QnOJfDVVLBWZsVnaD2xXey0wZ2rj14OPwDDXbAffvElLYYjaBhJ5lwY8GdTd4i2YOkohDOK7pRRqrBpXWKKF24zMlHuNzh3847eGlhXs1JHaUo0lLkfVogvfYrLGLFbGn4KPEmHhImae9fQNX1q7BeBbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778574859; c=relaxed/simple;
	bh=hlKgQBYPJErWMN4WsJktuJRGbS9W6kWbE2xCMtQGw0c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=IUI0ycE68M67mAJVNv6lRqY0G6a0FNDLooxoRYDQ/UA5Xzfo1LaIiYGJ8E/ZMKpJICFtSbgv6U2HggQjjAr2JN/GYQuDUK+8Uyt1b2X/5Oo7GSBjXHiDv2I92edSviD/sT01eHORCwQZKYILuvShFpfPXKWlJ/ddfCZLjzBm3oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=coPS7Ztz; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="coPS7Ztz"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1334825de43so498167c88.0
        for <sashiko@lists.linux.dev>; Tue, 12 May 2026 01:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778574857; x=1779179657; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSkxtKATHOt5lKJR5tZag8mNdNkA7wEcZE9Z1iwG/uw=;
        b=coPS7ZtzkLvJYs6lb+InEnmP9RF9v5GSoQD4h8W6SwttJc36zw9IsMDjhK/i7HB6cy
         jewZbobkCovuTIfkq988gN83Bx6PoUnw9rM5bvBTzvBZ7f75kBmIZ2n6SdwfjIRRpF3T
         qVow6xP0GBQYg9q4mrxXtY709eXKlM1d+C/sLqQ/s8h1R3VE9MNT8q4/mWX1uMBW3td0
         OvKCOYT/Tr5sFeIkHo1HYeq6K+pb5KavkiQ7SciiFzV/dE7XLmipNqtXsw8EZs7UY070
         P4hg9sM+Gao+7LVYF/qzlQhjjlG8iRvfodmsZtIpVA1uGbq1p0Nw7HbX8vtuPjPAhIWk
         Cv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778574857; x=1779179657;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TSkxtKATHOt5lKJR5tZag8mNdNkA7wEcZE9Z1iwG/uw=;
        b=c7kKB1qjIyvw/mAiXfB30bDkBfJvSZO5axHdQk6tWfsHrZRR3Q0Cyosx2BB+K3RVyS
         CfMpVp5DEf4B0hyV/+0DbQLR1EYze74TQDXT8CBm5+siynQNnZ/2Gik7t2gQKDGdarMh
         FOrf1eW2Mpgv7LMKDyiLqvYdG92BSHTOrSE04NSoc/nMYSfqgZlSWVf+1T+hv+ch6+/7
         EJJvrI0/cC5/bD+pM+NWVb0dNkEHjNAgzcfJsbjNPDvWYZh6Z3Pou5AtYoZqofdXPVAd
         0jTxqhRTlVmnGc/+ZvYzpWzApFDKuGvbtTwfEOZdJI7t/r6X55eB+yYtis4v1k1Kwn8a
         p90A==
X-Gm-Message-State: AOJu0Yz2MXsmF9KaAB+CD8cPIbJFWSG5T3gpbQOqMu2KZ7Z159HcZIgq
	DIRmE852a5ZfrKP5+iJiWXPu+7+a2rWo30xv+I1dCflxB8TcSDrm4v/U3onclFFmu4bL/04wQlz
	96Sectq8=
X-Gm-Gg: Acq92OH0RaDyLFfKUhPO67mgc+Ccm70oz7s7Hke4SQSGWv0lxTxoD9NQrvoSgWf2UpJ
	32dYpfEjGnc26dX0Cd34aXwTP1BEDLNU5+JD1nb8ah5RnkE7WeGAEmWJP+gB7wkG1RwYkpOqPSw
	yEoyIcTnXaawzNlD3i6BTeri7vMOXhPChL8ClVJ018+e4lUpEzg8PHwxzuIWqOIgiWiTTUwRIPA
	n0ffsppZfb6b/NKwe+8adPZCRtnDiis4qksd1MtC/z46MVgya9e8owaV395ZdjLwCKHcU7Qb2nj
	48jcGmDGJ53siEC+RQTV1iVhRMcZUg/utL1NioHXi5fteEs69CUBetNv55BFEhLEZ3l/yodPNVb
	FL7p+9vW6ZfsZW2lcQeEBPPusshiWwaDg7WXK2rOCo1KtKlETRxeuppkgb2VpilbODfkvIaCjfZ
	Po514+Q7JC1cE7EMwhAeoM1XU=
X-Received: by 2002:a05:7022:390:b0:12d:b2e9:b20f with SMTP id a92af1059eb24-132a83f775cmr6843540c88.21.1778574856454;
        Tue, 12 May 2026 01:34:16 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-132781103e7sm21968628c88.1.2026.05.12.01.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 01:34:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 May 2026 01:34:15 -0700
Message-Id: <DIGK60W195YF.11EIRC3QZABA2@nexthop.ai>
Subject: Re: [PATCH RESEND v2 3/5] hwmon: (pmbus/adm1266) add
 powerup_counter debugfs entry
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: <sashiko@lists.linux.dev>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
Cc: <linux-hwmon@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260511-adm1266-v2-3-7a6d34f0de5d@nexthop.ai>
 <20260512012940.BCF82C2BCB0@smtp.kernel.org>
In-Reply-To: <20260512012940.BCF82C2BCB0@smtp.kernel.org>

On Mon May 11, 2026 at 6:29 PM PDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Missing lock in debugfs read function violating hwmon subsystem =
guidelines.
> --
>
> commit 59d29098021812d7f7bd1712ee63ceafd8397c54
> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>
>     hwmon: (pmbus/adm1266) add powerup_counter debugfs entry
>    =20
>     The ADM1266 maintains a 16-bit non-volatile POWERUP_COUNTER register
>     (0xE4, datasheet Rev. D, Table 93) that increments on every power
>     cycle and cannot be reset by the host. Each blackbox record already
>     embeds the counter at record time, so the standalone live value is
>     primarily useful for matching a captured record back to the boot it
>     came from when correlating logs.
>
>> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266=
.c
>> index 31aefa8fc75f5..99e92a8365fb7 100644
>> --- a/drivers/hwmon/pmbus/adm1266.c
>> +++ b/drivers/hwmon/pmbus/adm1266.c
> [ ... ]
>> @@ -356,6 +357,31 @@ static int adm1266_firmware_revision_read(struct se=
q_file *s, void *pdata)
>>  	return 0;
>>  }
>> =20
>> +/*
>> + * POWERUP_COUNTER (0xE4) is a 2-byte little-endian non-volatile counte=
r
>> + * that increments on every device power cycle (datasheet Rev. D, Table
>> + * 93). It saturates at 65535 and cannot be reset by the host. Each
>> + * blackbox record embeds the counter value at record time, so this liv=
e
>> + * read is mainly useful for matching a record back to its boot.
>> + */
>> +static int adm1266_powerup_counter_read(struct seq_file *s, void *pdata=
)
>> +{
>> +	struct device *dev =3D s->private;
>> +	struct i2c_client *client =3D to_i2c_client(dev);
>> +	u8 buf[I2C_SMBUS_BLOCK_MAX];
>> +	int ret;
>> +
>> +	ret =3D i2c_smbus_read_block_data(client, ADM1266_POWERUP_COUNTER, buf=
);
>
> Does this debugfs read need to be protected by hwmon_lock()?
>
> According to the hwmon subsystem guidelines:
>
> "The hardware monitoring subsystem core serializes sysfs operations
> for attributes registered with the info parameter of
> hwmon_device_register_with_info() and
> devm_hwmon_device_register_with_info().
> Drivers must implement locking required for interrupt handling and for
> attributes registered by any other means. Drivers should use hwmon_lock()
> and hwmon_unlock() for this purpose."
>
> Since this attribute is registered via debugfs rather than the info
> parameter, concurrent I2C operations here could potentially interleave
> with multi-part transactions from the hwmon core (like PMBus page switchi=
ng),
> which could disrupt the device's state machine or cause cross-page data
> corruption.
>
>> +	if (ret < 0)
>> +		return ret;
>> +	if (ret !=3D 2)
>> +		return -EIO;
>> +
>> +	seq_printf(s, "%u\n", buf[0] | (buf[1] << 8));
>> +
>> +	return 0;
>> +}

POWERUP_COUNTER (0xE4) is a global, non-paged register. The read here
is a single i2c_smbus_read_block_data() call, which the i2c core
already serialises at the bus level for that transfer. There is no
driver-side multi-step sequence to interleave with, and PMBus PAGE
state has no bearing on the value returned, so an extra lock around
this read would not be protecting anything.

(For what it's worth, hwmon_lock()/hwmon_unlock() aren't exported as
a generic kernel API. The relevant primitive for a PMBus driver is
pmbus_lock() / pmbus_unlock() from drivers/hwmon/pmbus/pmbus.h, which
fences against the PMBus core's own PAGE+register sequences.)

I have added pmbus_lock_interruptible() coverage in v3 for the paths
where it is justified:

- clear_blackbox (patch 2/5) shares command 0xDE with
  adm1266_nvmem_read_blackbox(), and the read path walks records
  one at a time; a concurrent clear could land between records, so
  both paths now hold the lock across the full sequence.
- The RTC read_time/set_time callbacks (patch 4/5) can fire while
  the PMBus core has a PAGE write outstanding, so the I2C transfer
  is wrapped in pmbus_lock_interruptible() to avoid interleaving.

I would prefer to keep the powerup_counter read lock-free unless
there is a specific scenario I am missing.

Best regards,
Abdurrahman
