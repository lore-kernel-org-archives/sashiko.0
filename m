Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B558D313543
	for <sashiko@lists.linux.dev>; Sat, 16 May 2026 19:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778959532; cv=none; b=drWuKmBolGZDdjghEZZVuJB36Qe305pJ6alDkjWwSJ8FHVpTAD3UfoI2mL2Vea1BYuTkVNczZvWGxNQcRrYw61gbjE32TS2ku6wGJFGwSwRx7I8mkZK8uQGyH3kfm/5FATKoS2mMHd/x/s4WtrbOaI9keQ1fmxE5A8ojWZ9Hd1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778959532; c=relaxed/simple;
	bh=egB9c96iQ8I2rADNx2KgerAOYNhDFlCBqRnjnpDJJts=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=GRgaVD4qqKEiWsdKMkV++HaXQeinlfLuFNQEyFH0bn4u932wN6o4xaw3XqHkklOXZkpfpuRFfT7ze15YFyHOKq+vGfUfsoXiflBXnTfuqkNCx0td5SaeWX+9cHicKRZigrx+HMTz4mB5UiZX/ayfiVi9cC6Y3IyPE9F61Ve1+Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ec5ujnhu; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ec5ujnhu"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82f8b60e485so435168b3a.0
        for <sashiko@lists.linux.dev>; Sat, 16 May 2026 12:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778959530; x=1779564330; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qDDCo4VLFxe+GYF4Abu/TOXNjEfOWoKqyK6dTWXD39E=;
        b=ec5ujnhu8VTnyTrKwVb/+pUhXE6uFhWZFZtf/mrDXysGxzGL7MYH+lIYZ29mvCz1Xf
         /P1DzI4QpIXaQZGP5wiJC98KsHC8bgXaFOuMI3lbuJNrfwVIC/jueSDd2ThF+ilEhkmv
         LQhx29dC5qXjlpC5B6+hD29r4Jp+h9SSZRqM9a0XEHi+Xfvv86ObG2kyUMYpdyHYufso
         3uFB8jQVN49Zp7NI/xqjQemz06qbwPSXAH/qHXq7phiJrbsY1fnp4T7Iw92NzjpPY63t
         vJtTBacMbAz1FSpBpBJXHUTOfuKKLogoo/6lzGbIVzzhB0cJqtj0fHGlSTPUkad5Sv6C
         niTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778959530; x=1779564330;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qDDCo4VLFxe+GYF4Abu/TOXNjEfOWoKqyK6dTWXD39E=;
        b=JbDM3nCentPRBZ944IdMgaZKFhVljs7K/y6FHHVqkqRoKw+Bk9EBj2ApG7RUhI73Wb
         /h4WEgPWRNZ1NbF8s8D3obYm3TqZkXZ7Qs33SMoBqllyx85klT4RvxhJSDbyEHRCOnWh
         ClJmdwauphyLDkAzrjVN4wQ0jVF664pUtv+lj9FOwafdzYES8hfyv6FY5Qu3YxWJN8kY
         +Q1uuNpaPPQq/EXiFpm5iHzLAhSG+e5FfepCyf40Kbpk3vo6lH+bHNWEl1UHaPk+YYjl
         /NC2vl09GdcpvMDVZeDkCRXj4cNUL/Ck7mLdNPnz6uHcGCwstEndwBwz4xh30PEJHG/W
         893A==
X-Forwarded-Encrypted: i=1; AFNElJ+lmnJF2fsYQaRS5pzf97iwanboGdrMWQRboWWTjvrIMuCClYuHAmULX9YLzFB8hXeKaGSUjREQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzVYcV32UmBIQujl8bAuFW6lHbomSx91m5y39igL1pXeRU3bpSQ
	n4qeHQQ+xhaB3IB4o0kr7UFE+Y5RoalvLBXKslmEMAP7n3zQYE+ewtF/
X-Gm-Gg: Acq92OF56TKlFdllGup0eSvngGb/HXQT8HLccENuQoFYr1sjUGEsIhCwrZioRILmwmJ
	7v1BoiKrEqu7CE6eSR7hOr3s9BmrK3ZzKKYdrfWXjPHNljf9Yx3rlENAbVSvufM/VchmOYhStwA
	9rxQSqCOG8s5sHuY5kzL7jKmY3xvWNAP+WbfhE9PY72GBm3QQqDBOt8XpuGtHLDOE1aqpWyDHNI
	kFrWltfNBdDIi73DS/vaKwweOEdo6tgjoEylwSWCgd4r4M+27DJV7vKCLMIlDgiiJjhUfAvJv5O
	V3Rbk1fAIkPu4moqJH3PKKRaNmoeuTDpAWUInxv8VqZXDjoujLb7A/Y+R2usrAOpx89oYEEhsB/
	HW9NuUE/dJq/fEr+640u4ipP1XI8sQw3GoVTT9v3MyWRG4ZP+Pv7o5rEcW9fUShgMX0futU4ymf
	BVLBadHv5oxeYUErd7uWVcCbPM90ozTiGN1jPcFySzpvtGj3v38HQF0jMH9rKaU86kkVA5N4BZ1
	oFXYNekSOI=
X-Received: by 2002:a05:6a00:17a9:b0:835:4291:6975 with SMTP id d2e1a72fcca58-83f33d82ffcmr9836058b3a.39.1778959529890;
        Sat, 16 May 2026 12:25:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664712sm9872455b3a.12.2026.05.16.12.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 12:25:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <35412149-282f-4272-ba47-136caeeb5c1b@roeck-us.net>
Date: Sat, 16 May 2026 12:25:28 -0700
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Stop false review statements
From: Guenter Roeck <linux@roeck-us.net>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Konstantin Ryabitsev <mricon@kernel.org>, sashiko-bot@kernel.org,
 sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev,
 Linux Kernel Workflows <workflows@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org, kfree@google.com
References: <efc4d394-b328-4ccf-8c05-b6470ee4b88d@kernel.org>
 <70C5331E-06F1-48D5-A6BA-0CD130B69A45@linux.dev>
 <b5989c0f-90da-42cc-a623-3b60df077848@kernel.org>
 <dd37929b-ff90-4567-930a-26db01d85950@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <dd37929b-ff90-4567-930a-26db01d85950@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/16/26 12:13, Guenter Roeck wrote:
> On 5/16/26 12:00, Krzysztof Kozlowski wrote:
> ...
> 
>>> It’s opt-in on per-subsystem basis, as well as all other email-related features.
>>> I do rely on corresponding maintainers to decide if they want it or not.
>>
>> The trouble is that subsystem is mailing list, thus I still got all of
>> them via b4, which is used to get the discussion.
>>
>> Send them only to the maintainer, for example. Or maintainer + authors.
>>
> 
> For hwmon and watchdog I most definitely want the response sent to the
> mailing list and to the patch author. That was the original configuration
> for hwmon. Roman took it out because people who were copied on the
> original patch complained that they did _not_ get Sashiko's reply.

Actually, turns out he didn't, he just moved it.

However, it turns out that Rob added krzk+dt@kernel.org as explicit
Cc: target for the devicetree subsystem. I would suggest to drop that.

Thanks,
Guenter

