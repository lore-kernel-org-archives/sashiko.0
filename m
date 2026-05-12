Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B208A49250A
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 08:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778574461; cv=none; b=fx5WOUKgqBQ++0xp4BV19nkotvgIjSYKNwijEKQ/BK4q0xMY7NRn3uvGr96PlnTnXMD8G7FIeSLQGdTdwWBfCTA39payBTGWAuKwYyE9EVfFHOK/As+pI3fxLy1ZRwBn32epjKXnby5HvlotTTJC69sGh4CM1dRExd/d6XmSX6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778574461; c=relaxed/simple;
	bh=ZTEA2HdnjfCI9FQGyKiUf4vkUNGZFMRD1SeoOJUqdNA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=R+RkP4dnqskIJDPvr/86ZMmni9xCl6hCgaM4Y1xFyF503dJ4TPrUrsPJzZsFRJh0K/JApe33QNSe67nwuN638D1pm0aIkBfIPdshtSu7TBKHj+I2/5KgBxm34TT9NqMAT5t+n9/NNzqHPqqU5DFD0UFguOj4yyxBC3u9QZd37lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Q+b/HyV9; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Q+b/HyV9"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12c8f9846c8so7627210c88.0
        for <sashiko@lists.linux.dev>; Tue, 12 May 2026 01:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778574458; x=1779179258; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45jcoL8Jg+P3cfU+/0k5pK8BmuLH8yz4uxFezEXSjvU=;
        b=Q+b/HyV9uoq4XvSyp+ANdjGuv8CvwXbbmrlGXkTfrVryiAzLNb+YCTyYgV1sTLU4P6
         rJsl9DGrgbIsALfVcDuur5RWerV7iscOp8e1H+oKuThUp8GKgaf7uO6MQFZ6R/SyOXZK
         lj1n1qcmKCrq2IixzHzf1LIiU5SBiplhLflfQGvtHnn5ZGdGMx+audQ5otpiVnik+FqI
         ZUE/MjGd9tGhii9p/mHN2AAG8lqneAk3CFhbI0JKRXW9/P40sk3lIDJn1y/SXvqfgHKo
         EZKS0eOtj4M8oeZNCk//OWYit4nybPnxofoEFytWeL7eBY01bI7LAhDZA+FMwe/J+349
         UCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778574458; x=1779179258;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=45jcoL8Jg+P3cfU+/0k5pK8BmuLH8yz4uxFezEXSjvU=;
        b=pQ4TKr/ZRMQ1EyD+r0Do+cTvAiaMznNm97YzppbFUxyU9XS5DyCwmjQLHznWbcSJOr
         sw4a7iXPTdLIRzCWlFkmSGhUgLtg/F3xqTw7Brc/4ocFdJGwMlwLyq2pwQn5Xe3gfU4X
         cM3JfRzQ7F+Krug+OXV67b1gbZJzS5qk8AgpIUFrY7HXUxKXz+u5+0gKrw328BfRltoZ
         mn0KJvPMBf7cEmxpTfGEWWEhUujzSLfY8DZCc9sjZuGbmDG2FweNKxUaCeMojB53Aw3m
         4fb/Q+Y3vvc9U9DMIO/ReE62o48Bu9gOMhNsrKSyu3d5vjoQr0VcVz1/1UmLqjJknUQt
         v2SA==
X-Gm-Message-State: AOJu0YxYXrwJWwMGJ+SgpSf5TvTZBFJ6++N1rVsFBMl0oLDG6w00zxqe
	5Z7MwTijikTkM67BPJIyZHgBgHibUyDEj7FQbPVbcjqBWQltT9VrPLmwduEx3MqAggQotOw+hfi
	hmkIUaKM=
X-Gm-Gg: Acq92OFfg9uUpEYEfrSdGGiHZj31np999QfJPUL8ccaT4VC0eZsiTyTh6L5btrmmLKe
	ibqUzN7jacl7S2YmK2+3wM+Y5yvW17TTO0WXIxyu5mo6pcRwLfJOaIpl8hjr4jFAbBC33iL3C6M
	Aeg+JbIAz4Mz+dIcrPVxGNQ7KrzvQ5+x6m9/qJQY+U+eDa2k+UFmWmw6TDxvXa2jsmnp16/D39I
	ipMgNucWx7FFM2vaMqpNFP8T896FKbIzoHz4puucZ+mzOzD5fp8WT/jWCDRAwTUE5KIQaW3I3nA
	YncBs69Y+pPGQ8jaOyL1Q0JwIoKG78uuX+WASUacTvylSUifqpMBiwoo2mGRP8i5PRYRvmoYfFi
	7XpMGSAoAWLW98W29u6fMkVpKaQpEJfgZxjGUrjkJu4IttNL5Ld1PS7iobfexYZOpjvNiclB+YA
	lp46/Mx6862vjjIU8jQHd6BaY=
X-Received: by 2002:a05:7022:260a:b0:12c:34b9:61bc with SMTP id a92af1059eb24-13344b2f7femr1272482c88.5.1778574457372;
        Tue, 12 May 2026 01:27:37 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13278210ff2sm18280950c88.6.2026.05.12.01.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 01:27:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 May 2026 01:27:35 -0700
Message-Id: <DIGK0X9I3A0U.2A2QP1GD1983O@nexthop.ai>
Cc: <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH RESEND v2 2/5] hwmon: (pmbus/adm1266) add clear_blackbox
 debugfs entry
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: <sashiko@lists.linux.dev>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.21.0
References: <20260511-adm1266-v2-2-7a6d34f0de5d@nexthop.ai>
 <20260512005252.763EAC2BCB0@smtp.kernel.org>
In-Reply-To: <20260512005252.763EAC2BCB0@smtp.kernel.org>

On Mon May 11, 2026 at 5:52 PM PDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The debugfs write handler `adm1266_clear_blackbox_write` perform=
s an I2C transaction without acquiring the required hardware monitoring loc=
ks, violating hwmon subsystem guidelines.
> --
>
> commit ab9c19373562d58415e28511b037545cfd278c2a
> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> Subject: hwmon: (pmbus/adm1266) add clear_blackbox debugfs entry
>
> This commit adds a debugfs entry to clear the ADM1266 blackbox buffer by
> issuing a block-write command to the device. This is needed when the
> device operates in single-recording mode to preserve fault history.
>
>> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266=
.c
>> index 7b8433226176f..31aefa8fc75f5 100644
>> --- a/drivers/hwmon/pmbus/adm1266.c
>> +++ b/drivers/hwmon/pmbus/adm1266.c
>
> [ ... ]
>
>> +static ssize_t adm1266_clear_blackbox_write(struct file *file, const ch=
ar __user *ubuf,
>> +					    size_t count, loff_t *ppos)
>> +{
>> +	struct i2c_client *client =3D file->private_data;
>> +	u8 payload[2] =3D { 0xFE, 0x00 };
>> +	int ret;
>> +
>> +	ret =3D i2c_smbus_write_block_data(client, ADM1266_READ_BLACKBOX,
>> +					 sizeof(payload), payload);
>
> Does this I2C block write need to be protected by hwmon_lock() and
> hwmon_unlock()?
>
> The hardware monitoring subsystem guidelines require drivers to implement
> locking for attributes registered outside of the core registration functi=
ons,
> such as debugfs entries.
>
> Without these locks, could this write operation race with other multi-rec=
ord
> transactions? For example, if this clear command is interleaved while
> adm1266_nvmem_read_blackbox() is iterating through multiple records, migh=
t
> it corrupt the read sequence?
>
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return count;
>> +}

Good catch!

Will use pmbus_lock_interruptible() in v3.

