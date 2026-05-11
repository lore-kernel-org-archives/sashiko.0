Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E8137F8D7
	for <sashiko@lists.linux.dev>; Mon, 11 May 2026 22:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778537237; cv=none; b=Cax/Vu3H306XOPyLdrTiHTvaR/l4lQ+CJsYVEX6sTk5zXWto+ueEglzNjnpaklmxMUqlL8KQmx1R1TM/0ZgebjvAm8AIstaQ2K+kSKaV68ful4+0bBV++phVHCgwdrY+mnlTWo7q7V+Cyihp08MqCS0Yb/aTkWp9zsQ7ii8fN0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778537237; c=relaxed/simple;
	bh=QFs7nqmR7JrzXgxD6Zs6LaHqdsxyrpd3DgLmBmmARGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=foxQf1wC9sCsIrz4kb4tKXMxWLM2115c8fx+QQ8M15FxphUxFPXQ34DbZJzbmJd/mXFcHkGNVAFSD83sK1Ke8Zxuk6PHGT0QmWFd3bU4OH328y3FQDHSKvVpBsi6ru1a2+GuqIBy7BgFNm9ipFIEmhoI6LYs66HCfatyBeiSWXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fAFDpLQQ; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAFDpLQQ"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2ef8d6ba48bso2858687eec.1
        for <sashiko@lists.linux.dev>; Mon, 11 May 2026 15:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778537235; x=1779142035; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=CAvhfSv90Ak/uTTdL6mDlstvJH9p4n8pmJ+MU06fBxo=;
        b=fAFDpLQQewX8LyxySpkWK7K0C/scGZnYJ4jX8wNzzoiRxG5Klz7yKuhjZ9TBfVsur+
         MyZlpJFhnpGPPc58rereQhx0CKOaGwE8JIpaBRXwE6OBZGarbPRMAcykDXEtLk1VsBwf
         ce1NKzA2phbC5QcS858uyY8VJyqZxLreyB3g8TjO2f6TkIntjdkkQ58V91o2c0fXCzCh
         UAauTfi+6bM5sGptQzY+yB9hvmfe2oDwumt15BYLLkrHKD056ZieCRQDyue9Nlx4tljb
         aLTY2gkMEVM70mfxFTN0Wswzy/BzTAl9abU9tjJ6X2g2yM87s2t6gp87qaRWeRsqo5MM
         WG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778537235; x=1779142035;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAvhfSv90Ak/uTTdL6mDlstvJH9p4n8pmJ+MU06fBxo=;
        b=I6/N3RadlgwvGJPGKTA4GOVacpmRMFRqOhC0j11kBbDV9h1f44TmQ/L5sdwgOUVQs0
         yKj1FWSk22/V4/llszng4igO6TxFJpWHRJumx1ABrCj8NpTJRcT8aEDm/tBidA/ByS/s
         8mHVzrE83U0fznYuJ3hlbPDwbHrw/sCJuk1EpbzKs3sRLW9V5wVsTfXBiLBzjb/n9dA6
         KuEq9Y+0/kQHtUy15KArl+HYSu0hXQuY32glnqC0MgC1DLVihVKjT6OPmjNp5JkIs9Aq
         kvaEyIRtxJ0NrqJts3e3h431ZqiRRVrVHGToZSgUgDYLT0eMIxvrn7MUfJ15xmJsMJC6
         TfFQ==
X-Gm-Message-State: AOJu0YxdUrMm1rUgLOQXiHPy7gE22DQ2HoYBIcFKCwXPo8eT+Ca9yDkL
	/8jRQhWbIv9xT31iMV7MkWbX7QofDJ+2eiQ9ZrR3cYA1SS0wnqgN89LZO+AIfA==
X-Gm-Gg: Acq92OFo66SsUjaDuZa6B52rnfMtHoX0YdedSQiqDblhBRlpCrIliE+0gLYfEHRTUlJ
	jj/w00ZWm5XQmug1S+yrN/UVU97zr/hNkLTqaXFwKEJDj5tRYUoUFETsJQ+UymX8sqj+Qb8jQfu
	B7mtjw3ZYFcKxZjK7R6w6AL+npDQUvT9ewFdAlFj3C/Zi9YsS/lJH6oiHEZr7RBTxp/Uk4U1UNg
	Sk0ctWAD/w5CSxiynzEgqdcNHSCsc8LVOBMjVnhbhUrkgOEnEI6YA7yi6wIn6ovMr4vWCQ8LuTv
	ImOPduG7BxFgph3oiLCv8Z14oOZqot3LMgb970fJ6Bne2xejrmdLdiwZf4tR2ovJD87lL5tEH3z
	atCL6zDEr1o2k7Jfz3UJk6AMJoFoHanfPkGGX3nypRIvLKaDIMzcxG34q2gLjzF58AGckUQSzDT
	0qDcd9ceHGU1IHbdanGMmGdr7XyEkdTzba70Drm+b6piBlwZMh5ybqw5E+guQhKXXDWxgkQjs2n
	85O18G5pew=
X-Received: by 2002:a05:7300:5353:b0:2be:9c19:b34b with SMTP id 5a478bee46e88-2ff9352aa93mr922471eec.4.1778537234947;
        Mon, 11 May 2026 15:07:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88914523csm15057986eec.29.2026.05.11.15.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 15:07:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7eac96a6-b538-4519-b239-2e193939ccc0@roeck-us.net>
Date: Mon, 11 May 2026 15:07:12 -0700
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: sb_wdog: add missing SPDX license identifier
To: sashiko@lists.linux.dev, Mayur Kumar <kmayur809@gmail.com>
Cc: linux-watchdog@vger.kernel.org
References: <20260510191847.50499-1-kmayur809@gmail.com>
 <20260511214422.1FDEFC2BCB0@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260511214422.1FDEFC2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/11/26 14:44, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The applied SPDX-License-Identifier (GPL-2.0-only) contradicts the explicit license boilerplate already present in the file.
> --
> 
> commit 64e66089a6e522c77284fd01a8849e12869d23c7
> Author: Mayur Kumar <kmayur809@gmail.com>
> 
> watchdog: sb_wdog: add missing SPDX license identifier
> 
> This patch resolves a checkpatch warning by adding an SPDX license
> identifier to the driver source file. It defaults the license to
> GPL-2.0-only.
> 
>> diff --git a/drivers/watchdog/sb_wdog.c b/drivers/watchdog/sb_wdog.c
>> index eaa68b54cf567..03db71a43d6fe 100644
>> --- a/drivers/watchdog/sb_wdog.c
>> +++ b/drivers/watchdog/sb_wdog.c
>> @@ -1,3 +1,4 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>>   /*
>>    * Watchdog driver for SiByte SB1 SoCs
>>    *
> 
> Does the GPL-2.0-only SPDX identifier contradict the explicit license
> boilerplate already present in this file?
> 
> Looking at the existing header comment block:
> 
> drivers/watchdog/sb_wdog.c:
>   *	This program is free software; you can redistribute it and/or
>   *	modify it under the terms of the GNU General Public License
>   *	version 1 or 2 as published by the Free Software Foundation.
> 
> Applying GPL-2.0-only restricts the file to GPLv2 only, which strips the
> explicitly granted GPLv1 permission and creates a licensing ambiguity for
> downstream users.
> 
> Should the SPDX identifier be updated to match the existing boilerplate text?
> 

Sashiko has a point here. I don't know how to handle this without effectively
changing the license. I'll drop this patch.

Guenter

