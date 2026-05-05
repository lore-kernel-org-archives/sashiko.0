Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBA2480978
	for <sashiko@lists.linux.dev>; Tue,  5 May 2026 14:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777993178; cv=none; b=Mg52Hz27m3C/4WfrpkChqVibRSQZF07PhZ2/lYAWS2bptqjDzaQMSqfmMLXrLVHyowu+3I9eHbjyqAIFFnJzImnBFai+0pnHvV2qQD4GEjOX76oqjcAvUkclVe5K5KTRb0STNxvcyPVKUwkm4UDdndt4LPPtMcwT0q/A2P4Tn2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777993178; c=relaxed/simple;
	bh=u+voGSj8yqh+JFoLDVp1jZt3shCQEEnAmUlmgkgfFoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DKLnYquFCTuGEr/jeXjS//Fq+Y0HVrK3kWZYowbQIOpdBHmaf2B/uUgT20GF7Fp1+CNP4Rwq+m0gCAyePZ85RhrXReVPhdHDaxd9h1pqdR0NkBRiop7/gqh/EjfIn+xbQUpg44Vfl9jTSfk2RkXjVqouvWYfUsz1iL3yOTls1Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qoqRxzcB; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qoqRxzcB"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b9705613ddso32077595ad.1
        for <sashiko@lists.linux.dev>; Tue, 05 May 2026 07:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777993176; x=1778597976; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=pnR17kdhZZrN/6sLvLR9JYNmj9z0or+jlqSDjl9ST5k=;
        b=qoqRxzcB9nI09ajSyr5MNNzM+lwZMoF9S4RdUkWZiwBH+izqGSBmAI3fCdDRQ2P2b2
         Uma8HIUsxl9A+eQ8EGPcSDmGBkR6kXFncXub3OdTMBkgTWwwwfoK+0luKlmtJYgj4S0W
         tiEHQTKpF4hZ0OKpkaXKQWmYDGqqPb3CkGQri+B2HIXUUqvtkCyHUZ57GvgnQ46GOC/M
         aDFo1m46MAdoMQAQIpk9s0QbLnvUuvBM5AMnEAa5Emv40b/DfrdhQeNdfWG+M/KrrPQc
         MAFoyF1J9fVVVFtgoDWaFKBDXipUkIwVeFto2LLFkkLPJsJswEV5prsB6tkdyb+YYac0
         KujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777993176; x=1778597976;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnR17kdhZZrN/6sLvLR9JYNmj9z0or+jlqSDjl9ST5k=;
        b=iAvAP2IQmJlRlQS3xK0Nxtw75OZduFvjVICu/BqW6J/trvpYqg4OARAQyeZ5D6CUYG
         Ft2qw+TT2J+lQd9TtzijZDCytiNygEq+1zcv3e3X7YimFZ3RdeZOIRbTkATlw3LnHZyy
         AfmO58f6EIJdzzxsR47wp3VdSVcDc5c4sOWw+0RIWSOhGRNk6RCZYnduA+XBpPJWVH9N
         hLKwqETtFye2lFMrHxHR6HUm6zN2a7QNeVnTDR4zgHAsPch3KWeT8xsA9vzioe7bF9bH
         En67S0VapZiDOmCrOVrvOJpPV+83KnIvSC1ZjzX9tJYXGwRzXX45JzkbjdMQLx4XpAgB
         P/GQ==
X-Forwarded-Encrypted: i=1; AFNElJ/pBbrWs0urSMM0Wx0Nh9fdNhQkP/XUQQjihXftzuE/0LZOTSjugmNeEURjQPF6ur03/P5siX3v@lists.linux.dev
X-Gm-Message-State: AOJu0Yxcqdl1cDKyoxsWIEVIrbYXNfJmKBDVnhwk9y++w/ZS4fUKAByM
	B5bHN9F04rNtGgYg0f3SG73A6ntQEhdI1e39T8QMkVrGc71YMu5YZG+m
X-Gm-Gg: AeBDies/9ZLO8ZPLMAJq0oK2jB0AJ4HSOrD+w3YMqtZXONpoAxbIUkSFOlt/fjTxu6F
	9q+ScneWKLonuo2B+fDgxYl8oZ9SDdq+G2vMJIJNalfd6GeLNJOhOKGxNYyuE5O9bOm+/RfyPiS
	kWUOifBZ2EgLzspMRK9eLvjTITLvf8h/q7Ph5RVHTWv4xRlZhofkT9Co/cqvJ5I2OSt5jAGP/iB
	iCa/SDr3C/j49ncuAzQv8UEWxTBMap/HN76PNiWFCTktlpLmB9Tq28ipAWB1EEpttsE8tItD1qx
	UyhBSi5oLFHChKSCgTfSZyzywHaRBKxHMGnWo4zL5AsrHuZE/Jggqlwtp2eT+uGF6koNNRhw62R
	4TFCe+ufsnyEsDo9JmHikmiuKmtCIrkDvgu93KmqxqV/rs15vPz7ULFkYGtL1GTUSv1BO+OGXFi
	xN/jUJQ0LlGPqp2lKe2yqBW1pv4R4Guf/JUxGRjFdGfpHWgYMpoxPgNvg02yFCDo3FUmu9PGK90
	xsCbh1Ij8I=
X-Received: by 2002:a17:903:286:b0:2b4:5f67:5914 with SMTP id d9443c01a7336-2b9f283212cmr140334545ad.33.1777993176111;
        Tue, 05 May 2026 07:59:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae59f62sm137450905ad.70.2026.05.05.07.59.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 07:59:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6fdf5a6b-730c-4c33-95a8-35078785f73c@roeck-us.net>
Date: Tue, 5 May 2026 07:59:33 -0700
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] thermal: hwmon: Register a hwmon device for each
 thermal zone
To: "Rafael J. Wysocki" <rafael@kernel.org>, sashiko@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
References: <3070412.e9J7NaK4W3@rafael.j.wysocki>
 <20260505124114.87E85C2BCB9@smtp.kernel.org>
 <CAJZ5v0hcJFk-M27AEkHugqPZ-rH4td8HZnMc209kgpDFnmbs9g@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAJZ5v0hcJFk-M27AEkHugqPZ-rH4td8HZnMc209kgpDFnmbs9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/5/26 07:40, Rafael J. Wysocki wrote:
> On Tue, May 5, 2026 at 2:41 PM <sashiko-bot@kernel.org> wrote:
>>
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Critical] Changing the hwmon device name and splitting aggregate devices breaks userspace hwmon tools and configurations.
>> --
>>
>> commit ef04f4845b76df7ab7442699654ee8214cc3a4ea
>> Author: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>>
>> thermal: hwmon: Register a hwmon device for each thermal zone
>>
>> The current code creates one hwmon device per thermal zone type and registers
>> it under the first thermal zone of that type. This commit addresses removal
>> issues by registering one hwmon device for each thermal zone individually,
>> appending the zone ID to the hwmon name, and giving each its own temp1_input.
>>
>> Link: https://lore.kernel.org/linux-pm/20260402021828.16556-1-liujia6264@gmail.com/
>>
>>> diff --git a/drivers/thermal/thermal_hwmon.c b/drivers/thermal/thermal_hwmon.c
>>> index 597c33c8a5550..223ae1571655b 100644
>>> --- a/drivers/thermal/thermal_hwmon.c
>>> +++ b/drivers/thermal/thermal_hwmon.c
>>
>> [ ... ]
>>
>>> @@ -137,54 +101,39 @@ int thermal_add_hwmon_sysfs(struct thermal_zone_device *tz)
>>>   {
>>>        struct thermal_hwmon_device *hwmon;
>>>        struct thermal_hwmon_temp *temp;
>>> -     int new_hwmon_device = 1;
>>>        int result;
>>>
>>> -     hwmon = thermal_hwmon_lookup_by_type(tz);
>>> -     if (hwmon) {
>>> -             new_hwmon_device = 0;
>>> -             goto register_sys_interface;
>>> -     }
>>> -
>>>        hwmon = kzalloc_obj(*hwmon);
>>>        if (!hwmon)
>>>                return -ENOMEM;
>>>
>>> -     INIT_LIST_HEAD(&hwmon->tz_list);
>>> -     strscpy(hwmon->type, tz->type, THERMAL_NAME_LENGTH);
>>> -     strreplace(hwmon->type, '-', '_');
>>> +     /*
>>> +      * Append the thermal zone ID preceded by an underline character to the
>>> +      * type to disambiguate the sensors command output.
>>> +      */
>>> +     scnprintf(hwmon->name, THERMAL_HWMON_NAME_LENGTH, "%s_%d", tz->type, tz->id);
>>> +     strreplace(hwmon->name, '-', '_');
>>
>> Could this change to the hwmon name attribute cause a regression for userspace
>> tools?
>>
>> Tools and configuration files, such as sensors.conf, typically use the name
>> attribute for matching devices (for example, matching acpitz-*). Appending an
>> instance-specific ID to the name might prevent these configurations from
>> applying correctly.
> 
> Or not.
> 
>>>        hwmon->device = hwmon_device_register_for_thermal(&tz->device,
>>> -                                                       hwmon->type, hwmon);
>>> +                                                       hwmon->name, hwmon);
>>>        if (IS_ERR(hwmon->device)) {
>>>                result = PTR_ERR(hwmon->device);
>>>                goto free_mem;
>>>        }
>>>
>>> - register_sys_interface:
>>> -     temp = kzalloc_obj(*temp);
>>> -     if (!temp) {
>>> -             result = -ENOMEM;
>>> -             goto unregister_name;
>>> -     }
>>> +     temp = &hwmon->tz_temp;
>>>
>>>        temp->tz = tz;
>>> -     hwmon->count++;
>>>
>>> -     snprintf(temp->temp_input.name, sizeof(temp->temp_input.name),
>>> -              "temp%d_input", hwmon->count);
>>> -     temp->temp_input.attr.attr.name = temp->temp_input.name;
>>> +     temp->temp_input.attr.attr.name = "temp1_input";
>>
>> Does splitting aggregate devices break existing sysfs access patterns?
>>
>> Previously, a single hwmon device might have contained multiple temperature
>> inputs, like temp1_input and temp2_input. Since each zone now gets its own
>> hwmon device with only a temp1_input, scripts or tools that explicitly read
>> temp2_input from the old aggregate device path will likely fail with a missing
>> file error.
> 
> Does this happen in practice though?
> 
I guess we'll see.

Guenter

