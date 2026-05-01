Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0418136BCF0
	for <sashiko@lists.linux.dev>; Fri,  1 May 2026 21:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777670365; cv=none; b=ffAOURx4StsAN/ou6dXKqmzOMlInq3jrE/DOmL+LonNG7MVQ8CO5dBbWVj3UniaHOy6rd1RjPhTCEtPCoWSi7iJ8fBilo0E2eq4zspvuy1+6GaBQ8PiseH8NK2+WERjDhaGdhty19KSiFbXLf6VIw0OrmW5zokhWHpGOUy25YxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777670365; c=relaxed/simple;
	bh=Id6uc6ER7NqATHb7vh2ZAVqITkL3DvGRouvxvUfAxw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E1NjbZWLC8+OWvA8Jz5ggvO1iv3yaFg33Lv6kUCfrUEpKCyBQn7Gy+FINGDn1K++jv2B2FO6HUUk++YwulUKAxJZAMlmBTcx+ky4Z5Z0G56xp3Fj4BGrY3r1L05ltoS3oflI449JkuIH8YB01PEI4ieoDWg5FCe14QIPKG4bUF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sQG9AfYj; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQG9AfYj"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ef84d016d9so1015944eec.0
        for <sashiko@lists.linux.dev>; Fri, 01 May 2026 14:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777670363; x=1778275163; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=vup8+Bo6hijoO3e3q8n0i28tjzasiLGDP6IR3h4S+mI=;
        b=sQG9AfYjnnEja/dP9NTctOAcVPl3SEmCyAluOE3NsmE6gltSoMGMjbT7qW3X/6IW92
         hA2u9rh9+PIc3NSLaKErgdnXUDJKOEVXH782/IXDWth+q/pUQ9uOiGHSEBPAAzNoCQXU
         iV0r8S641DgvtzhmqhI/KcnaqAEoo35C26gQ4/JI5/wGXny0xp4BGkaWTR6X10c+r2PH
         QmnZnxazGvAwsuWKRB3zhv3dLdcGiq3g3KbJCGiNrEWVOXo4at+or52U1ogHBLn/5ZMn
         My6JICW9/N/JQo9pWXwEgTZ6KLi08D7paTPLp108nZyeEYQ+SdCXmJ6SfUTGyBlVybgb
         LjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777670363; x=1778275163;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vup8+Bo6hijoO3e3q8n0i28tjzasiLGDP6IR3h4S+mI=;
        b=VkmDlvTYUqXXizf2tfavVxgq3yK6AwfmcnOClXzraI4A6QibP8hEhnE1HTohZFnXR9
         JSdeLTSL9DdoclEEtHBNe015jcjDkBk/LnyeFfZux34DZX4yyzHRzpL89y8RJ0ialrfh
         9qhpJg7a6La3MWG4zfnI3EqsqHL45AiboViL7+u31CA/RscJvxM/iDOcveiI4eZCHiAC
         bTpWUhrC2651KeWDGcipvDYvh0Fui/rQLmnyEbNihfsJOFyBa3vb3+VUdPCETVYsogYQ
         +44RwN2Dhl1ThWS+PGgHIEtI8VyyGJ43Chi+TF2c3CM7UNzSZ5z69I+dhepzlkkAvyRp
         lUhA==
X-Forwarded-Encrypted: i=1; AFNElJ+mX6ll1J4XePBdSXSAAKjLRj7iLl7IwntrgcGl9lqUMBAwO8ERGuLrHN45OXANL6Q31OSWnCAF@lists.linux.dev
X-Gm-Message-State: AOJu0YyZD9qIYC7RuXq+a3354kWvdZopO9oRubvwAfHXM4OcD3TAnCiN
	D5z+ZGlWYu+bpGyf49h6a0eNqiBmZPFEk9dH1I0sNu0rqIh5QKS7/I1t
X-Gm-Gg: AeBDieuHq6TQP+8VU4BGzlsHULGMX0Vg6IlABCwzmlvyp/0cxh6WHjEY+dbG4qnQocQ
	l0uTj3CYUj/4kS4Lie7SQkCzGoHRiPBSEO3Wf6C+BvqwMezYTce17k+xx+PbXwNIa2dDCtyby0S
	i4LiG1H2sLeZlCm9bmbYrzyc34U5EUJaNQAxRWGkjEclAGxgPeOipmvCW/ckZWrfRF6u2upkXU9
	EE+parm9F9FDiIDApg7n8LwesxljDypn1/A0ZD+K19N7/ALTsYP8JUe0Sk0jNmr9BDKf4e2FtNE
	Jj1a5taoqeFLZncM71yu4gfShnD3rYxrcekE5c9emeQuJ++haHUIPIcWhm5essY+K+Dt1B/W3Tm
	A3aale9bP4QbmHCV53hQJzNOBgIKV8+OpgsYysersXoNpP4lz/6Qmv1Yy7ja3dAgcjpktIVwPUb
	yVmO5ylPafSX9QO97j+eZeg8CxjI2eH/HmQz4PF309RA7n/eth3XALy1cBi3H2FYWOo2RjMgRmt
	w4b28ISL+g=
X-Received: by 2002:a05:7301:22af:b0:2dd:405f:89b3 with SMTP id 5a478bee46e88-2efb4c3e615mr510507eec.0.1777670362971;
        Fri, 01 May 2026 14:19:22 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b29b2e0sm5906031eec.16.2026.05.01.14.19.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 14:19:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b325afeb-e7db-49fb-9e38-93404e075b86@roeck-us.net>
Date: Fri, 1 May 2026 14:19:20 -0700
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AW: AW: [PATCH 2/2] hwmon: (lm75) Support active-high alert
 polarity
To: markus.stockhausen@gmx.de, sashiko@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
References: <20260501120518.3085501-3-markus.stockhausen@gmx.de>
 <20260501124540.0C11CC2BCB4@smtp.kernel.org>
 <039601dcd973$bf191230$3d4b3690$@gmx.de>
 <8776fc88-364e-4ac5-b30c-8a706716d8ff@roeck-us.net>
 <b9e2db74-d2c7-4ca6-911d-0b59c68cd187@roeck-us.net>
 <022201dcd9ab$0aba9fb0$202fdf10$@gmx.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <022201dcd9ab$0aba9fb0$202fdf10$@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/1/26 13:42, markus.stockhausen@gmx.de wrote:
>> Von: Guenter Roeck <groeck7@gmail.com> Im Auftrag von Guenter Roeck
>> Gesendet: Freitag, 1. Mai 2026 22:14
>> Betreff: Re: AW: [PATCH 2/2] hwmon: (lm75) Support active-high alert polarity
>>   
>>> So this will need separate patches:
>>> 1) Fix set_mask and alert handling for AS6200 to be low active
>>>      and to report the alarm correctly even if it is high active
>>>      (xor config register bit 5 and 10 (translated to 2 and 13)
>>>      when reporting the alarm).
>>> 2) Fix lm75_write_config() to add set_mask to clr_mask to ensure
>>>      that the bits which are supposed to be set are actually set.
>>>
>>
>> Turns out the default value for AS6200 has more problems. It is set to
>> 0x94c0 which claims to be "8 sample/s, 4 CF, positive polarity".
>>
>> 0xc0 reflects the samples/s. So far so good. However, 0x94 is wrong.
>> It sets the single shot bit, effectively disabling the sensor, and
>> it does not set the CF bits as advertised. Please change the default
>> to 0x10c0 which reflects the intent more closely, except for the
>> negative polarity.
> 
> Understood. I still need advise about xor during alarm report.
> Do you talk about this code?
> 
>    case as6200:
>    case tmp112:
> -  *val = (regval >> 13) & 0x1;
> +  *val = ((regval >> 13) & 0x1) ^ 0x1;
> 
No, you'll need to xor bit 2 (the polarity bit) and 13 (the alert bit).

Something like
	alarm = !!(regval & BIT(13)) ^ !!(regval & BIT(2))

> Mabye totally stupid but this bug and the deep dive follow up
> hits my brain a little bit too hard.
> 
:-)

Cheers,
Guenter

