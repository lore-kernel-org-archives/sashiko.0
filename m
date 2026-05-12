Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCBB395ACC
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 10:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778581249; cv=none; b=CMMv4duOQPcez+8F5KEi3PtrIjtVj1M4eTrez9V/wJPtS2MZtBvaDoK6amg19fiXDbmaYI5yu+/ZwICUPK6rr8MmAzfLIwE+rkKy7UwDY2UdNMUDaBS1zilXo33Shj3RdpmC7LvxfKDIjUY0Nh2pKvG0G4sDDAWbn7lOr8hjLPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778581249; c=relaxed/simple;
	bh=SfMR8ph/aPqhGNyEYBNhukujwK6NQ6K/VhGWQkkPA+s=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=a3KchSj8Y+RYlz0irFcAWKsyjfwlCagLXGzaGx6ftqy2Sks2rDWe2k6J6YZAlMoMqbwe4pdkRPWwmaJlItXa3T2YSgy+XCPTX8VKg9onqA3cfPujytCHDfurMOmt/HQW+GmfVNgBYSwZaQBupF38gwwNKAtIk8whbidfcETIZ4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=F5Z4fKfm; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="F5Z4fKfm"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2ecf9e398f4so493739eec.1
        for <sashiko@lists.linux.dev>; Tue, 12 May 2026 03:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778581247; x=1779186047; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqUnbh/8mkmgbpEJCpiA7aFzpeOAsnV9e0B1Z7F32dw=;
        b=F5Z4fKfm2wVYL/jhZ8WXGv7CgISrMGTDWUez0Vr5KiwgJpM3r3IporEcpTotGmJgoY
         uNOGRt/S8+giHv5NNdpT2wc4KEx5bKAHizwmRcSj/6inySjg1xwF9/B8JZH8QG+LApMb
         /rQj7xIAOa3Z6oGSxPkC1fKydEWxcoyxjDJTTnsstaGKysQjWPrn8cLMkgEcqZEUCVeU
         7TdBErC5OnbQ72p+a3kYbMvGFQjeMbEWTBcMmaS9B1JIztMNVXFg1PRLSyT60yz37IhC
         peVWMJ+BIU0hbwrtbJKE4jtaiF7KoRrK0LRgVZHHTLoD6lFeMlfET8uCvPk2b4+7X3S9
         5PjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778581247; x=1779186047;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hqUnbh/8mkmgbpEJCpiA7aFzpeOAsnV9e0B1Z7F32dw=;
        b=QqCG0sUV6gUSCXYudDgr8Al424cGGnzQt3BVpwbHjIdT5d7Jf698jO53zpg8v1Vn4k
         bWt0QalFi3h0kJf/lMVvZAbCtlp4ox8Wf+IH3r807xwH4ZRxOO0CWLYq/Aug+1/UdxqQ
         MlKc3nJNe50UST6j6k3IBJTDWFf7ldEeWn3LoIoARD5PFWJWgxo57hTfKpVMDPBS+qBQ
         3jj8H9WJNvnGBKUdA3VA1pjZdky5fg2sdsEBthO/WGDdQkjdZFx7VPvCzrzTmsJMWcuZ
         gHZ9f2V9YVWPvLBjxH63IMgB+5z005vWpti787BBofPobm5GhMG357K+UkXZGZpDGiui
         YFoA==
X-Forwarded-Encrypted: i=1; AFNElJ9MmnJKvTIEqLnlbIJQ+e41p9XGF0wXSfVbvbwjsrYZYwuDK4Z2Z8l4Snfp9VChcgntXr/0mc8H@lists.linux.dev
X-Gm-Message-State: AOJu0YzqspW8yVcHDhwtrRBeAxvpR1cOdEsQpGuTvZ9NSpTCqvmcnn0g
	MK9KXCx7Y0NcErraBijH+xR6+RtqVwSSP7fqkpZ/5vDqTEM2uLa4d/HH8gN+WVYUSVI=
X-Gm-Gg: Acq92OHBmNepNHbRSzl7Jbrd9sZjytoIq3b/YKng3IVUqKOBHQutCmONqXJGWwf+VMm
	TimTSeMqlwOfgcg5LHM7dw/T3QQMoBp8WTS7Zcg8JleYohwACJ6WQ1y0JQZj+v+xcayx25lSR5O
	gkqln/imWvPpc2G0x3e9mC7gljICz9k4hm1AMyFZpQUH41hLpEkRvgXcw+kVynku0zUSZfQYVmu
	KJaP7r7xBYbrR1D0jR4ft6eNZpt+jLBqtSEVwk+kZL3fADoWanufriuXntJzkg8gXYZGedpsP8T
	KYydC9S3V4yTBR+dYFBnTO5sQjCRoG8tdb9CSYPQxO86qo6lEkH0I60dvu+g0UfERpdQxjE2WGX
	Sxr60soFYa8POLcNUVQP6ymiNwpFtkbMZprJQRct6xnSNcFJTHMss9jF+sFjUXC9NcT5TGF/4pB
	LGqtlQAIr4tBepbGSph428/5k=
X-Received: by 2002:a05:7300:e60c:b0:2dd:6937:79bc with SMTP id 5a478bee46e88-2f54ad72f58mr14257224eec.6.1778581247146;
        Tue, 12 May 2026 03:20:47 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d3047sm20468431eec.10.2026.05.12.03.20.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 03:20:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 May 2026 03:20:46 -0700
Message-Id: <DIGMFKP4POUI.2ZTJ4UM3GJW02@nexthop.ai>
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Guenter Roeck" <linux@roeck-us.net>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>, <sashiko@lists.linux.dev>
Cc: <linux-hwmon@vger.kernel.org>, "Guenter Roeck" <groeck7@gmail.com>
Subject: Re: [PATCH RESEND v2 2/5] hwmon: (pmbus/adm1266) add clear_blackbox
 debugfs entry
X-Mailer: aerc 0.21.0
References: <20260511-adm1266-v2-2-7a6d34f0de5d@nexthop.ai>
 <20260512005252.763EAC2BCB0@smtp.kernel.org>
 <DIGK0X9I3A0U.2A2QP1GD1983O@nexthop.ai>
 <eaf93149-a7cf-4a11-8ccc-8aa1b1e83b7e@roeck-us.net>
In-Reply-To: <eaf93149-a7cf-4a11-8ccc-8aa1b1e83b7e@roeck-us.net>

On Tue May 12, 2026 at 2:19 AM PDT, Guenter Roeck wrote:
> On 5/12/26 01:27, Abdurrahman Hussain wrote:
>> On Mon May 11, 2026 at 5:52 PM PDT, sashiko-bot wrote:
>>> Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
>>> - [High] The debugfs write handler `adm1266_clear_blackbox_write` perfo=
rms an I2C transaction without acquiring the required hardware monitoring l=
ocks, violating hwmon subsystem guidelines.
>>> --
>>>
>>> commit ab9c19373562d58415e28511b037545cfd278c2a
>>> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>>> Subject: hwmon: (pmbus/adm1266) add clear_blackbox debugfs entry
>>>
>>> This commit adds a debugfs entry to clear the ADM1266 blackbox buffer b=
y
>>> issuing a block-write command to the device. This is needed when the
>>> device operates in single-recording mode to preserve fault history.
>>>
>>>> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm12=
66.c
>>>> index 7b8433226176f..31aefa8fc75f5 100644
>>>> --- a/drivers/hwmon/pmbus/adm1266.c
>>>> +++ b/drivers/hwmon/pmbus/adm1266.c
>>>
>>> [ ... ]
>>>
>>>> +static ssize_t adm1266_clear_blackbox_write(struct file *file, const =
char __user *ubuf,
>>>> +					    size_t count, loff_t *ppos)
>>>> +{
>>>> +	struct i2c_client *client =3D file->private_data;
>>>> +	u8 payload[2] =3D { 0xFE, 0x00 };
>>>> +	int ret;
>>>> +
>>>> +	ret =3D i2c_smbus_write_block_data(client, ADM1266_READ_BLACKBOX,
>>>> +					 sizeof(payload), payload);
>>>
>>> Does this I2C block write need to be protected by hwmon_lock() and
>>> hwmon_unlock()?
>>>
>>> The hardware monitoring subsystem guidelines require drivers to impleme=
nt
>>> locking for attributes registered outside of the core registration func=
tions,
>>> such as debugfs entries.
>>>
>>> Without these locks, could this write operation race with other multi-r=
ecord
>>> transactions? For example, if this clear command is interleaved while
>>> adm1266_nvmem_read_blackbox() is iterating through multiple records, mi=
ght
>>> it corrupt the read sequence?
>>>
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	return count;
>>>> +}
>>=20
>> Good catch!
>>=20
>> Will use pmbus_lock_interruptible() in v3.
>>=20
>
> There is also "guard(pmbus_lock)(client);" or "scoped_guard(pmbus_lock, c=
lient) { ... }".
> Guenter

Thanks for the tip! Does that mean you're ok with losing the
interruptibility, since there's no DEFINE_GUARD_COND for interruptible
variant?

Abdurrahman

