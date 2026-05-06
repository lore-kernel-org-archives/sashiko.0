Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507EE3DE425
	for <sashiko@lists.linux.dev>; Wed,  6 May 2026 08:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778056759; cv=none; b=OvEoq+FklAjrhwhj28KB7HXZEIadg+2RTe3pIWXyOw6xUJB4RC1i30ep2BiN8Hw4ytV0U8jr0v/46ZSBXAp/0kf+VTbHhEgXIRb32SQB1X+/TRQXS9CojFjtEcQeISaqWcsZ+cfhU9rpWFSf+XCYuJEuJndivJosXnmHd/xPl64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778056759; c=relaxed/simple;
	bh=jPnn5eOshVnTAE0HzHPeyZi1RtOw8h/dICMJs4ir8VU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=slHQjWLg+6kFF8acr3nUXRWNZbnqd3Gp3lycWEcF8ft9WpSuvuuCGm9hy53Yh2xfLiwL8mKK766mMUYFe2kXqHGtTqUjXjB+uH+J25YnumwTapEBbuaFAA7NnzTFomeNjGd2aYNQZbBkMLzADFzLeZ20kAcRK4jUntvEmpxNb68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c1TNRldq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c1TNRldq"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so77637905e9.0
        for <sashiko@lists.linux.dev>; Wed, 06 May 2026 01:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778056757; x=1778661557; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r56h6iHeav2WDOnQRjlv49afSUKkQLIIRf5+ICv8rrc=;
        b=c1TNRldq4Dcuw6MJbMGiUXCd5UUyCxYN/yiK6jBUFBd/SbXpM7eoHUaR72vKbMS1ND
         +7UFW8ytthzE1yhwlFFv+pwzcBLQS3uweelvfm3uJNIx/enC5ITUo/jRKrCvKGR4UXwC
         q1pO9iStv0S+XmMlXHsKtQzR5kekM8XvU9mhgBD3Aj23il91zh+Oju25a1C5pkJsynwn
         I7dnwLk04aOOBwiUuPY43ASpUKsc4n0Y7PIuWjtWMfwqzgKFoqf/ENN9VZPR2KhIgloQ
         /d+FFTfTUGqNGlZnor0GXbsBg0AnpPXjx19znN/7H6FDu+ecfXUfQV9rS293+E3uTN4h
         KNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778056757; x=1778661557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r56h6iHeav2WDOnQRjlv49afSUKkQLIIRf5+ICv8rrc=;
        b=KfBTQVq6/HtTJx1d9VEtF0c9dCIHEFJkJo4umjAAYfmp8RUwHV79fazLQJf+kvs9bB
         Dyb8E9lzbI+Goc7McoIN4fLXKDk34cAxPn9YPJxOxT8j6b8AQcvsJk51lYUfyL17W8to
         y5S/w4L0mMPMTnv4F3Jua9XZ4t0GNhYlvQQgaKexiBdEoBK8voRMVntv0eQrlk4tMdlU
         2CMgik63xYuAMqU98Tc4DJUHPeRNBwqK8LjJRYXLfdvPbe9YiLz3RWh/4MP7WxqTKsgy
         ucLJs+fp9lpq0kpqx5LA+fHILZ55LSTxYS6rVq1kQKmEHeQWo83eSZaBEe1XxkK1gDXD
         AlBA==
X-Forwarded-Encrypted: i=1; AFNElJ/12Q7wyTipvSHkbESk0sXdIJ1kAely8mXp2HDrAUEVgy7jC1/WOLus/672fIoBh6skjU2pFeDy@lists.linux.dev
X-Gm-Message-State: AOJu0YztAi5+BK/5TFJ3FYYnu068FjvGbosqThjOukXQTeuMuxrmkWDp
	qYbRt1kPVvERwkFxH1WcbWL8C/V0gniv6i3vUKhxWG6pn8dp0nj1Rq4I52oqoSrcONs=
X-Gm-Gg: AeBDieuAaqyLJa6ZCNWuPsiAJ2nWsq20YAVfHWIF+FBf6a+Vl01eaxn/T+IexZOShKR
	4BpIy6Q+P7WUXGyLu3a9eSDiltT9LOy7YbElLbtpCYa1F3k65xQLz8tX9fu2+NmzjvK67NVz7ty
	WBl2/odiG9j/sYoTDtiplVJkDXZzxtc92E6etm7FpIzsqExwD4b245oERgMRAFoGCRNM9uujl1W
	4yV5wUVtipJ2TP71V8Pt+gjti1jEdGDdr9diyvLoWKRVyh480dxB9X8bUyRAozWfzacq4HD6MTJ
	jTTiPDZw9wmtICjAcWQlssu2/ZbHIvjg7VupJ7Aar6gb+6zdrLYKbQZUdZK/Lg3N1+UYPWaIGAx
	9yc2X6sMgVQYPXJbB2y/NPkrCRc7m9F9NlAxEK22J91VHvHIuWm8hbrjBZuBSigVT6m3HsiP+kX
	DddH/5u1NuCbzMMVH5QvaSRLiA5AUV3irLx+cthv0=
X-Received: by 2002:a05:600c:4592:b0:488:7ff6:1f75 with SMTP id 5b1f17b1804b1-48e51f3c4e5mr42056335e9.21.1778056756748;
        Wed, 06 May 2026 01:39:16 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538acbfcsm28776935e9.8.2026.05.06.01.39.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 01:39:16 -0700 (PDT)
Message-ID: <1ab49484-b307-4568-a2af-60b015556e9a@linaro.org>
Date: Wed, 6 May 2026 09:39:15 +0100
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] perf arm_spe: Decode Arm N1 IMPDEF events
To: Arnaldo Carvalho de Melo <acme@kernel.org>, sashiko@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
References: <20260414-james-spe-impdef-decode-v4-5-1dd30783a33b@linaro.org>
 <20260414155203.0B24CC19425@smtp.kernel.org> <afqTBBXcPmobSCu1@x1>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <afqTBBXcPmobSCu1@x1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/05/2026 2:01 am, Arnaldo Carvalho de Melo wrote:
> On Tue, Apr 14, 2026 at 03:52:02PM +0000, sashiko-bot@kernel.org wrote:
>> Sashiko AI review found 1 potential issue(s):
>> - [Low] The relative include path `#include "../../arm64/include/asm/cputype.h"` is invalid and relies on accidental directory traversal through a compiler `-I` flag.
>> --
>>
>> commit 7fc153524fe60dc6d6f08fd73b7ea3f46e904e39
>> Author: James Clark <james.clark@linaro.org>
>>
>> perf arm_spe: Decode Arm N1 IMPDEF events
>>
>> This commit adds a framework to decode the N1 IMPDEF event for Arm SPE,
>> which isn't covered by the common list. It also increases the packet
>> description buffer size to accommodate more strings without falling back
>> to a hex dump.
>>
>> Link: https://developer.arm.com/documentation/100616/0401/Statistical-Profiling-Extension/implementation-defined-features-of-SPE
>>
>>> diff --git a/tools/perf/util/arm-spe-decoder/Build b/tools/perf/util/arm-spe-decoder/Build
>>> index ab500e0efe244..97a298d1e2791 100644
>>> --- a/tools/perf/util/arm-spe-decoder/Build
>>> +++ b/tools/perf/util/arm-spe-decoder/Build
>>> @@ -1 +1,3 @@
>>>   perf-util-y += arm-spe-pkt-decoder.o arm-spe-decoder.o
>>> +
>>> +CFLAGS_arm-spe-pkt-decoder.o += -I$(srctree)/tools/arch/arm64/include/ -I$(OUTPUT)arch/arm64/include/generated/
>>
>> [ ... ]
>>
>>> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
>>> index 67ca356100e53..b74f887a48f2a 100644
>>> --- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
>>> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
>>> @@ -15,6 +15,8 @@
>>>   
>>>   #include "arm-spe-pkt-decoder.h"
>>>   
>>> +#include "../../arm64/include/asm/cputype.h"
>>
>> Is this relative include path correct?
>>
>> It looks like this file is located in tools/perf/util/arm-spe-decoder/, so
>> the relative path resolves to tools/perf/arm64/include/asm/cputype.h,
>> which doesn't exist.
>>
>> It seems this only compiles because the newly added -I flag in the Build
>> file causes the preprocessor to resolve the include relative to
>> tools/arch/arm64/include/. The path then inadvertently evaluates back to the
>> correct file by traversing backwards out of the include directory and diving
>> back in.
>>
>> Could this be made less brittle by relying directly on the include flag,
>> using #include <asm/cputype.h> instead?
> 
> This is just a possible improvement and not strictly a problem as the -I
> is structured today, so lets not postpone processing this patchset
> because of this, this can be considered some other time.
> 
> - Arnaldo

Yeah, we also discussed it before here: 
https://lore.kernel.org/all/adiB0V6Unmo0-AkC@google.com/#t

I thought sashiko pulled previous patch versions and other context, it 
would be nice if it read the discussion threads too. Maybe one day it will.


