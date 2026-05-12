Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC50E3AE1BC
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 09:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778577599; cv=none; b=D3mwUDBQ2l+LkeZ7BjrRq9sScDOBAQdMTnLBP9iBpA/EOmFm2GHzkbvj6McMypra4Bm2h0/khdLvq4HzvyyyqEXehKx3ihLKy5EXVYNkuWLNYmKgh7566kV4gjYejr8A/FVENPv4W5IOVwoAkLHKEIfrOxoYpygxOwlWrIxy4ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778577599; c=relaxed/simple;
	bh=bIBeyBB5XreGYDGVKCTsOjIB1njzrXZlGmTdxaD2Qbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G02MiQxRCBaiI5fQb1WSqXXWuxu5Rs8Xj0RYq2Fa/gbIoBntCvd11zTyQfKe+h0oxNbK8YBt4C/8gwVFsPmpzUSywYa8XxanpVVepgFxIPYXuQyeDjDXzD5yd+MVAFTQgiFmnyLm+jwFdvKa3U1ODV/TS3DInqE7Xjkpl18hELw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5YbB+Nx; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5YbB+Nx"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ba3e3c4f87so48269155ad.3
        for <sashiko@lists.linux.dev>; Tue, 12 May 2026 02:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778577597; x=1779182397; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qN576tZW5G6PBMAygsJu6/dgBu99F6YVwO+6ZyIqBwk=;
        b=S5YbB+NxOzlvOj4eTJUcalZF80t++RhQnUQiy1fyNWXRKFBs9qvwNA4z6/3oR1tuFB
         5pthIxWDm1krci3EJUxKrj638Yk+kqSt0WmfQC0k9rzeQgF27gfRhJRRmHnRdq+skH6Z
         ibnT66iap0CJeo9+ByLPP3mZ20LRu3+QELVXBqBH8GZjgyIaqI4qwslOOpjThfLa20BA
         xawWkcLA/vS36wEpbH3CGNa3OnZ410qL87xFaD1IO9NAsF69o7U79ayaaBSblYU98Lcx
         EzMeT+ye+QKaCnJym5mqjfKCFK5cZBYuTpOXLq8VV5MIk8233R8OfOvjVOzPBrzBLsxU
         T8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778577597; x=1779182397;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qN576tZW5G6PBMAygsJu6/dgBu99F6YVwO+6ZyIqBwk=;
        b=Md6XrJ0bat44+4turuIEpv9z/iBDfiByTfa9RMUzaaN3GJE0y+70b1CCntQRzgo586
         eFNYvJg7YCoo7Z32jxCnZnj6v8Scc2VdOyHwwE4Kn6YVjyLW5+8Jhi5J628VbIJYt177
         3VqIJ1IAde4Mb/C6dXgb9FiAHrtxxBQHT1kICZzcWAA/2X9NYIRHUz+xXHjBj6dEMHDE
         NGIUIhpei1ZTXBKUEbOUXHNPU3Ykw+/uAQXhGtoXnX642pfqhCWsr+B4Ukmo1jKGjuib
         +O+kekOLYLCTnm1uvbOQOkWBCrRr5P37sGPIab1PUvCNXjNpinDNh/lUMkYGTHnDaD2r
         YJMQ==
X-Forwarded-Encrypted: i=1; AFNElJ9x353VbCD73zY0aVi9t8BmiX2K/eWkh9fn5uIAHCTJtW6pOg/Z7Omm3Go/duBj2OMCbXx26SOB@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2DtYx+ymivjiKbyCXa139213YJUt9Nw8kpdJoDluuAJ80XqgP
	swCk0jD2lQgayyKC4E/2RFryoeK2AMI7Dcxmg5ImjSmljq+9+GzO3x0r
X-Gm-Gg: Acq92OHGDC6+c7+WfZZoiFoDMpMCKnnjloePdlg1vYPUSU4nNxdInb2SEYzZqwcRQfT
	gTurKn9oGBMPiRfXCreY+ktRcxiX1G5LtAM5aOGNOnF7vZTGdKbteDHEzesIikaTC/4IT15WBg0
	/y4ZJCrbpxOfFEWHXlEmW90toMxp53z4JtP4Qc2E+3PnoaB1GfhDpMMrQfv1Z4CaiOim3Z6A5GT
	6jHoYDNtAna2hANseKiUyxkFztaTISPuRY/HH2BSyivNxoasL+UHimmc++7l/8miAlop0U1TYk3
	V3Petmp4CVV2xc1mL8XabrD+0dXscYEmA78jEDWPQquC3bFh9QsabuxyKUMFarLiuvAjCVfFfcA
	U459PTcbQlas6HNHksB82RdzHCN3oS4rHhYLT36cRh75PxMP92mbaBjIqzPnOiOCZl6Orwf5L+W
	1c0uBFVL6068zMUgdFqA/C7RldqEiR+/KFLG1CNDSIL5k6FYV7HgoGdpQbDwBm6wacBI96L2rS
X-Received: by 2002:a17:903:2484:b0:2ba:3e2f:6883 with SMTP id d9443c01a7336-2bd012d5b69mr17089845ad.19.1778577596904;
        Tue, 12 May 2026 02:19:56 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35bb9sm141319395ad.52.2026.05.12.02.19.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 02:19:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <eaf93149-a7cf-4a11-8ccc-8aa1b1e83b7e@roeck-us.net>
Date: Tue, 12 May 2026 02:19:55 -0700
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 2/5] hwmon: (pmbus/adm1266) add clear_blackbox
 debugfs entry
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>, sashiko@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
References: <20260511-adm1266-v2-2-7a6d34f0de5d@nexthop.ai>
 <20260512005252.763EAC2BCB0@smtp.kernel.org>
 <DIGK0X9I3A0U.2A2QP1GD1983O@nexthop.ai>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <DIGK0X9I3A0U.2A2QP1GD1983O@nexthop.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/12/26 01:27, Abdurrahman Hussain wrote:
> On Mon May 11, 2026 at 5:52 PM PDT, sashiko-bot wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [High] The debugfs write handler `adm1266_clear_blackbox_write` performs an I2C transaction without acquiring the required hardware monitoring locks, violating hwmon subsystem guidelines.
>> --
>>
>> commit ab9c19373562d58415e28511b037545cfd278c2a
>> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>> Subject: hwmon: (pmbus/adm1266) add clear_blackbox debugfs entry
>>
>> This commit adds a debugfs entry to clear the ADM1266 blackbox buffer by
>> issuing a block-write command to the device. This is needed when the
>> device operates in single-recording mode to preserve fault history.
>>
>>> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
>>> index 7b8433226176f..31aefa8fc75f5 100644
>>> --- a/drivers/hwmon/pmbus/adm1266.c
>>> +++ b/drivers/hwmon/pmbus/adm1266.c
>>
>> [ ... ]
>>
>>> +static ssize_t adm1266_clear_blackbox_write(struct file *file, const char __user *ubuf,
>>> +					    size_t count, loff_t *ppos)
>>> +{
>>> +	struct i2c_client *client = file->private_data;
>>> +	u8 payload[2] = { 0xFE, 0x00 };
>>> +	int ret;
>>> +
>>> +	ret = i2c_smbus_write_block_data(client, ADM1266_READ_BLACKBOX,
>>> +					 sizeof(payload), payload);
>>
>> Does this I2C block write need to be protected by hwmon_lock() and
>> hwmon_unlock()?
>>
>> The hardware monitoring subsystem guidelines require drivers to implement
>> locking for attributes registered outside of the core registration functions,
>> such as debugfs entries.
>>
>> Without these locks, could this write operation race with other multi-record
>> transactions? For example, if this clear command is interleaved while
>> adm1266_nvmem_read_blackbox() is iterating through multiple records, might
>> it corrupt the read sequence?
>>
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	return count;
>>> +}
> 
> Good catch!
> 
> Will use pmbus_lock_interruptible() in v3.
> 

There is also "guard(pmbus_lock)(client);" or "scoped_guard(pmbus_lock, client) { ... }".
Guenter

