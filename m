Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3F24B8DDF
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 08:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778575364; cv=none; b=jTZbOlyJgBLDmXzOjSAXpEhosJeTSqyxAgVuiHdIfcx9jJfdb4NVrPFOKZQ34gWxBxrFb832lrSlbwNrFpzb1FSVHWY1jPXIVkrUaC620uFsfTHK3bUpCYEw77phSM3SbxptnvOk7JDkTIxz+orYhr3VlfOL+rfEDRvnbTSV0VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778575364; c=relaxed/simple;
	bh=lq+/2jh4vsMC5QGD+Xb1leAx79zaNi8OYDy5lVugXcI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=kwiAG0Vp1dJXh+giAzVMz21xUoyeoRMUoTiIU2F6LpOkzYgy0M23NTFTN9a3/yV5ME+7o9uT5AIhO+Ie1YlLTQkMlHx1sU83i9JE9B78Sx8ubJOrybz9msda3sSDgKxrOd/gPOSPaNkmOiL5iIS2dnJtleCuJHahInt9ymJD9XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=hVoD9tlt; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="hVoD9tlt"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso3817151eec.0
        for <sashiko@lists.linux.dev>; Tue, 12 May 2026 01:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778575349; x=1779180149; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nV86GhwDOWsGDhN/ru26Dzx9121SYap+YK8888DQW0=;
        b=hVoD9tltekXDWANYwt8TIQafl6w1xQCIN6tHpybW4ZCIXi7lFZ224elkmlqk9mUOjF
         dJH5W2gFXhVxx+0YO7f30PNvZIGm/oQwDOdVf2ehJiSdzxD2ZmpYEVg/rKLnKQ63KCJK
         EUnPi21x+1JBN5InN9bhuCbYjOtR6Zg8OR8BbRQOogGzl3KGUYtt/6zJNCZnAOQH7BlA
         8eabUyTMlsoO4HAdydQai+JGLt+Hdp+evAjXIWCqCcJ8MtoTEHsOCxGKpnL5f6nhDsCX
         2pD8uyPbZHfalVI3IFqQq6IKKmJN5YfwyhJRTpyLltMGRY14ey3+mdDNGVipp+dE4eX2
         tVCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778575349; x=1779180149;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8nV86GhwDOWsGDhN/ru26Dzx9121SYap+YK8888DQW0=;
        b=h14pFzpiWrF16K1Kl+uaCn/QPGn17LDufj3nG2HgbsEvakctg5l+ByUqNumG6SH3B3
         9e3+TdyMIheR9yPII/zVJTnqJ7KAv0VRDpucnF7LN1qq3R57avE8wbEqxSXx4E9f2Gxv
         8jJxi7AA5R5WwK0hdMq5i2UKOkcHdgQVog0u3sFK1Y1PdP1vPYkV6YuRHNIniaeZpX7x
         Nt7DHTIpNCsnG6hfhW0eYCcX229oAqLCWX8MgGR9PBoP2y4KCwIHTAKbuMGJVxaG+u5T
         Jyn8gQ5RLU1YeaAXKem4630SJcuNnYIpfaF7yCDMagYWNhbMCyKq5F17NzznurjqmRM6
         EmEA==
X-Gm-Message-State: AOJu0Yzb00wtdUubyH/4wZ2QcqdZE3DvCdx+bgwUjDQ9d8lFgaXGlkIi
	d6lXh2CaoiLWcGj9+LJ2obA8ObqvLJxeWggHzeRX9hUNSY/4Lqj6F5/QUJWF7nBufrlZAe5ZDLt
	632WyX0Q=
X-Gm-Gg: Acq92OFFdN/iRoD+GaHgkDkp2Ke7QsZPyA677TS8WahULBORzTfan32tsavPovUmh1S
	2ioIpoVUFh8jJp1t+gjGUON75OHIBO38Xs9ONPrZ7s5rgyUtqDSQVUOVYBE0fWFpUk+TGinEfJ8
	lc+zF7q6PLxdbGt16YN0G50I3+jrvepidoOPwJ1dzBGs3xnAivnpPTPBEYTZZEQZtdxlw/3d4ZN
	yHVKfv/YyPAUVCqwXNQmp6Q7OpbPPiQmWtmfXd0vquVspz+S3QLdSd5hIcmIVrpZE8Vh7kwFjpq
	FpxtkZwEdfg+dxk9oIZS+0/0yUFQ5xsuerfSFq0AW6S0rcYTFoZceoQwJTCj+YJGStXQ9tcAtaH
	Zc2Hf5m1TXqNoaILoi2BMIg35GmHdoH4F1rqb+nddWcoJZU2wubLN+MuqlAb0n8UgFhlptPBOkn
	UDstOB7TwV5BTeCNG4B9fu1kM=
X-Received: by 2002:a05:7300:324b:b0:2f3:5d44:eeba with SMTP id 5a478bee46e88-2ff93d089efmr1476347eec.6.1778575348498;
        Tue, 12 May 2026 01:42:28 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8864c37basm16695078eec.13.2026.05.12.01.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 01:42:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 May 2026 01:42:27 -0700
Message-Id: <DIGKCAWMW65P.1GSNT49V8KH98@nexthop.ai>
Subject: Re: [PATCH RESEND v2 4/5] hwmon: (pmbus/adm1266) replace probe-time
 RTC seed with rtc_class device
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: <sashiko@lists.linux.dev>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
Cc: <linux-hwmon@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260511-adm1266-v2-4-7a6d34f0de5d@nexthop.ai>
 <20260512033233.6868FC2BCB0@smtp.kernel.org>
In-Reply-To: <20260512033233.6868FC2BCB0@smtp.kernel.org>

On Mon May 11, 2026 at 8:32 PM PDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Missing locking in RTC callbacks causes race condition with PMBu=
s transactions.
> - [Medium] Premature exposure of the RTC device before hardware initializ=
ation is complete.
> --
>
> commit 20e4a34f4a236495f598a1957552fb4fea44b3d3
> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>
>     hwmon: (pmbus/adm1266) replace probe-time RTC seed with rtc_class dev=
ice
>
> This commit replaces the probe-time RTC seeding with an rtc_class device
> backed by SET_RTC. This allows userspace tooling to drive the re-sync aga=
inst
> /dev/rtcN once it trusts the system clock.
>
>> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266=
.c
>> index 99e92a8365fb7..0dfb02db86837 100644
>> --- a/drivers/hwmon/pmbus/adm1266.c
>> +++ b/drivers/hwmon/pmbus/adm1266.c
> [ ... ]
>> +static int adm1266_rtc_read_time(struct device *dev, struct rtc_time *t=
m)
>> +{
>> +	struct i2c_client *client =3D to_i2c_client(dev);
>> +	u8 buf[I2C_SMBUS_BLOCK_MAX];
>> +	u32 secs;
>> +	int ret;
>> +	int i;
>> =20
>> -	memset(write_buf, 0, sizeof(write_buf));
>> +	ret =3D i2c_smbus_read_block_data(client, ADM1266_SET_RTC, buf);
>
> Since this RTC device is exposed to userspace, can this callback be invok=
ed
> concurrently with hwmon sysfs attributes managed by the PMBus core?
>
> The PMBus core uses pmbus_lock to serialize multi-step sequences. If an R=
TC
> I2C transaction interleaves in the middle of a PMBus sequence, can it dis=
rupt
> the device's internal state machine or cause unpredictable behavior?
>
> Should this callback acquire pmbus_lock(client) (or its interruptible
> variant) around the I2C transfer to prevent a race condition?
>
>> +	if (ret < 0)
>> +		return ret;
> [ ... ]
>> +static int adm1266_rtc_set_time(struct device *dev, struct rtc_time *tm=
)
>> +{
>> +	struct i2c_client *client =3D to_i2c_client(dev);
>> +
>> +	return adm1266_write_rtc(client, rtc_tm_to_time64(tm));
>> +}
>
> Does this callback also need to acquire pmbus_lock(client) around the I2C
> transfer to prevent concurrent access with PMBus transactions?
>
> [ ... ]

Agreed. In v3 both callbacks wrap their I2C transfer in
pmbus_lock_interruptible() / pmbus_unlock(). adm1266_write_rtc() is
no longer reachable from probe (the probe-time SET_RTC seed is what
this patch removes), so the new lock acquisition is purely on the
userspace path and a signal can interrupt a contended wait cleanly.

>> @@ -553,7 +603,7 @@ static int adm1266_probe(struct i2c_client *client)
>>  	if (ret < 0)
>>  		return ret;
>> =20
>> -	ret =3D adm1266_set_rtc(data);
>> +	ret =3D adm1266_register_rtc(data);
>>  	if (ret < 0)
>>  		return ret;
>
> By registering the RTC device here, is the /dev/rtcX interface exposed to
> userspace before pmbus_do_probe() completes the hardware discovery and
> initialization sequence?
>
> If a userspace process immediately opens the RTC device and issues read/w=
rite
> commands, can the resulting I2C traffic interleave with the driver's
> initial setup?
>
> Should adm1266_register_rtc() be called at the end of the probe function,
> after pmbus_do_probe() succeeds, to ensure the device is fully initialize=
d
> before it is accessed externally?

The ordering follows the existing pattern for the GPIO and nvmem
registrations in this driver. None of the three registration helpers
performs I2C at registration time =E2=80=94 devm_{gpiochip,nvmem,rtc}_*()
only install callbacks that fire later when userspace touches the
interface. With the v3 locking in place, any userspace RTC access
that lands during pmbus_do_probe() will serialise on
pmbus_lock_interruptible() against the core's PAGE+register
sequences rather than interleave with them, so the
window-without-protection that the original concern describes is
closed by the locking change.

I would prefer to leave the registration ordering as-is for
consistency with the GPIO and nvmem paths, but I am happy to move
all three after pmbus_do_probe() if you would rather have a stricter
"nothing visible to userspace until probe is done" invariant across
the driver. Happy to do that in a follow-up if so.

Best regards,
Abdurrahman
