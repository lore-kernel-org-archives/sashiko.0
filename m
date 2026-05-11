Received: from out198-30.us.a.mail.aliyun.com (out198-30.us.a.mail.aliyun.com [47.90.198.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D26F3A0B1C
	for <sashiko@lists.linux.dev>; Mon, 11 May 2026 10:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496364; cv=none; b=I0hd4seMCakfNpjkQJVucZvZi7YHr6R3est9k5HJeE9YciHjlujK/6jmaDH+YQzWO9EwxNKCw0vf+qsl2vVYW91duKRQcHz8kTD1fMyGQADKmmnTC85/HORFDiWz5B2TWC5i6kL5xNuxjRsu0uFhU/eQxNanLGvwnY9ora1fEFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496364; c=relaxed/simple;
	bh=+FzMvQb4MdBLg2poLLmYZLCBXT7YYR/myliiZpEl2IE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oaBi+3x6VjsLTNqYkMKKwoBCZTnSTqtzUy4AFpu/qPoEOHQeLASwnRLE11eJQSLMogXcClxpfiwLTI7jTqln1d74gqxm//pHuTXhG0GegiDcdlJY55NP80IQjd3zfzy7Tits9D9dleItOUrQOIOknvzFEbRDFqdMvwUKehaNRbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=ZtdLqlxi; arc=none smtp.client-ip=47.90.198.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="ZtdLqlxi"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1778496344; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=pmL+lVNpCGss+MJnaEWZqXv6SfG2d1Q1lYhntlEGSwU=;
	b=ZtdLqlxiUHBFhSY59s3L7P9Hx7tuoYmEvM8PZMfd9xawmWs4hKNtp9rhjER4vWe/9U3uqqZuoRHndj7998gM2Wahz0NflB0qbP2/vSP7xZKaiHo9MEsK0BYXkMkAN4K32moAJHQm+J1RflKGAO3M7te4nv5/BVCjYS3fylXuoOpDbzrAL39CadvxCYkfy8xK2rdD3Sa8nL29wqL8H7c/IY+1xFuP1LVjaNgtXiRBT4z5IqjFYvBI+EOkRTx6ZLOIoijrsUVgwOlVH9xRw3LMGPz7PkFJobt6GYslaHooC/IGnR6mwutlIdVd20dAo8ut/HKZZZa9fN+uf8DDgTDBrg==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07442881|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0446486-0.00264091-0.952711;FP=12617529493597837242|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033032053168;MF=syyang@lontium.com;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.hUZo5c7_1778496343;
Received: from 192.168.51.146(mailfrom:syyang@lontium.com fp:SMTPD_---.hUZo5c7_1778496343 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 11 May 2026 18:45:44 +0800
Message-ID: <f9781fbb-ea5c-4697-92df-34faa1889e1c@lontium.com>
Date: Mon, 11 May 2026 18:45:42 +0800
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] drm/bridge: Add Lontium LT7911EXC eDP to MIPI DSI
 bridge
To: sashiko@lists.linux.dev
Cc: robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org
References: <20260508134702.4713-3-syyang@lontium.com>
 <20260508211343.C6CB8C2BCB0@smtp.kernel.org>
Content-Language: en-US
From: Sunyun Yang <syyang@lontium.com>
Organization: Lontium
In-Reply-To: <20260508211343.C6CB8C2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

在 2026/5/9 5:13, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] Regulators enabled in `probe()` are never disabled on the success path, causing a permanent power leak.
    it will be fixed in next version.> - [High] Reset GPIO is driven 
high after cutting off power, violating power sequencing and risking 
hardware backpowering.
> - [High] Synchronous `request_firmware` in `probe` can cause permanent probe failure if the driver is built-in.
> - [Medium] Missing `depends on I2C` and `select REGMAP_I2C` in Kconfig.
> - [Medium] The return value of `devm_drm_bridge_add()` is ignored in `probe()`.
> - [Low] Missing header includes for core kernel APIs.
> --
> 
> commit d9cebea8e10096b0200ef8f220724550dd554963
> Author: Sunyun Yang <syyang@lontium.com>
> drm/bridge: Add Lontium LT7911EXC eDP to MIPI DSI bridge
> 
> This commit adds support for the Lontium LT7911EXC eDP to MIPI DSI
> bridge. It implements I2C-based setup, display configuration, and
> provides a firmware update mechanism.
> 
>> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
>> index c3209b0f46786..fe45a9052aa0d 100644
>> --- a/drivers/gpu/drm/bridge/Kconfig
>> +++ b/drivers/gpu/drm/bridge/Kconfig
>> @@ -132,6 +132,19 @@ config DRM_ITE_IT6505
>>   	help
>>   	  ITE IT6505 DisplayPort bridge chip driver.
>>   
>> +config DRM_LONTIUM_LT7911EXC
>> +	tristate "Lontium eDP/MIPI DSI bridge"
>> +	depends on OF
> 
> Should this config also depend on I2C and select REGMAP_I2C?
> 
> The driver explicitly registers an I2C driver and utilizes
> devm_regmap_init_i2c(). Building without I2C enabled might cause
> compilation or linker errors.
> 
> [ ... ]
>> diff --git a/drivers/gpu/drm/bridge/lontium-lt7911exc.c b/drivers/gpu/drm/bridge/lontium-lt7911exc.c
>> new file mode 100644
>> index 0000000000000..d50fc979ebd4b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/bridge/lontium-lt7911exc.c
>> @@ -0,0 +1,493 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2026 Lontium Semiconductor, Inc.
>> + */
>> +
>> +#include <linux/crc32.h>
>> +#include <linux/firmware.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/i2c.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of_graph.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
> 
> This isn't a bug, but it looks like some core headers are missing.
> 
> The driver uses kzalloc() and kfree(), msleep() and usleep_range(), as well
> as regulator_bulk_enable(). Could linux/slab.h, linux/delay.h, and
> linux/regulator/consumer.h be included directly to avoid relying on
> transitive includes?
> 
it will be fixed in next version.

> [ ... ]
>> +static int lt7911exc_firmware_upgrade(struct lt7911exc *lt7911exc)
>> +{
>> +	struct device *dev = lt7911exc->dev;
>> +	const struct firmware *fw;
>> +	u8 *buffer;
>> +	size_t total_size = FW_SIZE - 4;
>> +	u32 crc32;
>> +	int ret;
>> +
>> +	/*1. load firmware*/
>> +	ret = request_firmware(&fw, FW_FILE, dev);
> 
> Can this synchronous request_firmware() call cause a permanent probe failure
> if the driver is built-in?
> 
> When built into the kernel, probe executes before the root filesystem is
> mounted, which would cause this to fail with -ENOENT. Because the error
> is propagated without returning -EPROBE_DEFER, the subsystem might not
> retry the probe later.
> 
it will be fixed in next version.> [ ... ]
>> +static void lt7911exc_atomic_post_disable(struct drm_bridge *bridge, struct drm_atomic_state *state)
>> +{
>> +	struct lt7911exc *lt7911exc = bridge_to_lt7911exc(bridge);
>> +	int ret;
>> +
>> +	ret = regulator_bulk_disable(ARRAY_SIZE(lt7911exc->supplies), lt7911exc->supplies);
>> +	if (ret)
>> +		return;
>> +
>> +	gpiod_set_value_cansleep(lt7911exc->reset_gpio, 1);
>> +}
> 
> Does driving the reset GPIO high after cutting off the regulator power
> violate power sequencing?
> 
> Driving a logic high signal into an unpowered IC can sometimes backpower
> the device through its internal ESD protection diodes.
> 
it will be fixed in next version.

> [ ... ]
>> +static int lt7911exc_probe(struct i2c_client *client)
>> +{
>> +	struct device *dev = &client->dev;
>> +	struct lt7911exc *lt7911exc;
>> +	bool fw_updated = false;
>> +	int ret;
> [ ... ]
>> +	ret = regulator_bulk_enable(ARRAY_SIZE(lt7911exc->supplies), lt7911exc->supplies);
>> +	if (ret)
>> +		return ret;
>> +
>> +	lt7911exc_reset(lt7911exc);
>> +	lt7911exc_lock(lt7911exc);
> [ ... ]
>> +	lt7911exc_unlock(lt7911exc);
>> +
>> +	lt7911exc->bridge.of_node = dev->of_node;
>> +	devm_drm_bridge_add(dev, &lt7911exc->bridge);
>> +
>> +	return 0;
> 
> Is there a resource leak for the regulators here?
> 
> The regulator_bulk_enable() call at the beginning of probe increments the
> use count to power the device, but it appears the success path returns 0
> without calling regulator_bulk_disable().
> 
> If lt7911exc_atomic_post_disable() later decrements the count, it seems
> the count might still remain elevated by 1, leaving the hardware permanently
> powered on.
> 
> Additionally, should the return value of devm_drm_bridge_add() be checked?
> 
> If it fails, the bridge is internally removed, but returning 0 here would
> lead the driver to successfully bind to the I2C device without exposing
> a functional DRM bridge.
it will be fixed in next version.
> 

