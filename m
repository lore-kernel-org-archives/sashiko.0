Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1161DFFD
	for <sashiko@lists.linux.dev>; Wed, 15 Apr 2026 03:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776222158; cv=none; b=jzU+WMwIW7ooERy1ZEsAYWZPcsAmtP+nJwxWIEA2JLAUYuKmeMC0qg3RbWVFvrTvvVbuSi0Jz3zix2ACuoAb08eTzY0npwU4MQx4nnp1BRn+rI77lts1MVJC57Qv3z9sMZCRdfbX6hdnqPu+UjP73T9I6wnKKT1KObxLwKZAGJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776222158; c=relaxed/simple;
	bh=qvsvocrwYP7obnSWlVDqIfK0kuAb31d8029Q0JD+G9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lG9tFKHTLIKHy+ZNhKuuQCDJ/uCLc+8fwEq8edrA2lQaNgneLAatnRgLHrIYqo3T5VnskjzKo9XFECQ7VOitiPdhz3oV1fDqmfosr9joRMIvLEuSkOSF3XZfdv2UJAVm/GdQN0KFaU/A1U1NZc2koc2PhnM4WDEa3tpb0qtB1oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QfTRTzEb; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QfTRTzEb"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12c287eb77fso9777100c88.1
        for <sashiko@lists.linux.dev>; Tue, 14 Apr 2026 20:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776222156; x=1776826956; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=R5jzqrjb4zSz7V1cJlccZPVs8cxCzuXrhxbLGUEone8=;
        b=QfTRTzEbrmOSVYVddcflyA94FJueaJ7Xu2Q06WxrMRiWO7zI4J2qGV07o005PRKp/6
         FQ/wZIK8Rt9MmbuaR4G+rhdRFhtyXJYFdGqLhac8a4npdBpu27iDOWWfLpVABsXt7/oj
         LoA+CvckBO6C9i2jbU+I/JzrZ5zeAFWY3r8aWVlVm2WYMXmV30BOnltc4B+4B14ugxY2
         e0/PXyoTEeyR4ySEQDuy2S20HCjAsxL5t0FJjv1MNXzOmLvkrhsCPzqPVL1fgRbT+hv4
         sPy8EPtwUu5V2hbYCplsR1SGUh5Ce+8JMZSFwjcDLYruwquPhl+TpnNorsgfwsgvBbkk
         75yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776222156; x=1776826956;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5jzqrjb4zSz7V1cJlccZPVs8cxCzuXrhxbLGUEone8=;
        b=OZIN9fbfgvzVIXIQhgm3Ium2+p+ONbL2YBBIYBhjXkQZWL5SY8HXDRVRfLdk6B5S5j
         pYfovmBrocrCCjpd0VyVk9iKGxHMAW6NXJblxIWXukdGPb3z0kFcHb+JAevnpim99WTw
         VZ8YCCFA5epqhDHgaR9EB8+lrvu++5R+/OcfhFEdvNEh6xpm1D/aW+RDWnnLvk9H3ojS
         cGVIiIoe2fcH5t6f72yztt4WMHTc8MYqeEJLyHlDjoR6vlMwTOffAPeHw6zqQ1W+YVZm
         nYZ04JZrdEH7ncqK15l3HSjbP5qx6EDK8+oevRkYyMFY9/E2p1rlU0bMquuImbNQyEzA
         K8hQ==
X-Forwarded-Encrypted: i=1; AFNElJ85MTvDSOCq/PUfJ7umQr6xln4cTfCY/G0CYOlk+h82nHeDNTUoOxdROGuuJsIMHp3ZUvVbjrxw@lists.linux.dev
X-Gm-Message-State: AOJu0Yyrf9thoxRn0L1OUzZCF9VTn0OAa35HeUfxjlm2/KRbiNgSW2Mi
	sR0OdQtUc1glR6cfBQQnA3Z9OvAUPgpgHiEJu7HDTseT21U2I+2Am+Vz
X-Gm-Gg: AeBDietzWpV/vCvmEFZcpM3hQJZuE0GZfLQDLCsdJn0EoHDbs+uhKoZawzumYsLHzEt
	vwRoQQkwMs/PJv0A7vyG/VMJCu/mr3iCTDHhs22VQz7sbfbsBbUDMPs/Z9ivQ1QKS/sdbG+IcLG
	dooLt5zl9rn+OO60ydv1XlnrB9V/NNM0AZY1i1iEqm5l1UgtYDn3XBPju5BmfbfLdAX9CVzsRTc
	sCJkfOiAiupbkGTeCa897a63+ElcESl8G3Tmnf00x3xpvDC8rsT+k77vfbu1qKPU84m0BwQuKix
	ZNNDWUdcKA6JdKZf1ZqSrmMumb9DeUzgGiQaVmCWVR5XXwFNhGjxNiugv5kMvgl4QENq6S6oOxz
	uTsfICOxMcogruYdBrHmwJhnuPepaZc4DsDw/dJPnDA0lp8A+ntfcQ6SvHFGAk8h87YNRvpcqbb
	itkW9O7Ig4F5ovAOCoNV9EoG2SrZRvIk+0TeXb6vke2xddvQ8vVnTTtpWtXzTb8JRaiRB+HClO+
	2qGlMjzwgEjdG5SgCnhUA==
X-Received: by 2002:a05:7022:3d12:b0:12a:949b:b9b with SMTP id a92af1059eb24-12c34eedbd5mr12073512c88.23.1776222156071;
        Tue, 14 Apr 2026 20:02:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e63f61csm366604c88.8.2026.04.14.20.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 20:02:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e4a4c2a6-e757-49f8-8fbc-215a74c7a9b5@roeck-us.net>
Date: Tue, 14 Apr 2026 20:02:34 -0700
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (pmbus/max20830) add driver for max20830
To: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>,
 "sashiko@lists.linux.dev" <sashiko@lists.linux.dev>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <20260414-dev_max20830-v1-2-210d3f82c571@analog.com>
 <20260414045647.4AACCC19425@smtp.kernel.org>
 <69f893bd-bb38-439c-b7e3-30d17c6b8cd3@roeck-us.net>
 <PH0PR03MB635179B8E59E60DB994415A7F1222@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <PH0PR03MB635179B8E59E60DB994415A7F1222@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 4/14/26 19:21, Torreno, Alexis Czezar wrote:
>> On 4/13/26 21:56, sashiko-bot@kernel.org wrote:
>>> Sashiko AI review found 3 potential issue(s):
>>> - [Medium] The driver incorrectly uses `i2c_smbus_read_i2c_block_data`
>> instead of `i2c_smbus_read_block_data`, violating the protocol and logging an
>> untrusted binary buffer.
>>> - [Low] The MODULE_IMPORT_NS macro uses an unquoted identifier,
>> resulting in a build failure.
>>> - [Low] The sysfs attribute `in2_alarm` is created but not documented.
>>> --
>>>
>>
>> The reported issues seem real. Please address.
>>
> 
> Will fix the missing in2_alarm and lacking quotes in MODULE_IMPORT_NS macro
> 
> I may need to keep i2c_smbus_read_i2c_block_data. I'm testing this on an rpi4 and
> it seems i2c_smbus_read_block_data isn't supported by the adapter.
> 

Odd. I can see that the bcm2835 controller driver sets I2C_FUNC_SMBUS_EMUL
but not I2C_FUNC_SMBUS_BLOCK_DATA. That makes me wonder if the controller
really does not support block reads. Any chance you can try setting that
flag in ./drivers/i2c/busses/i2c-bcm2835.c and see what happens ?

Thanks,
Guenter

