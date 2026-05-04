Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D6A3B7742
	for <sashiko@lists.linux.dev>; Mon,  4 May 2026 13:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777902277; cv=none; b=q8NI8flPWtZSF2VJaQ8hs+2AV9RGK7P9uyImvwfKnC7CauzyUw/pvBS56BNOEej13A8RUwlZHK6ErrCCrTUBsFlp4MhuKFyQ0m6hjagZRoclfuRJNsBrdMt50tHAUg9hJuKT+qOOiAhvbQjtKMQK8V/ZasiVUwecz88XTNCB8k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777902277; c=relaxed/simple;
	bh=SUWab+NO56yZc018FgKhlh+Age/SbMHtL2ESWxwSYpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D8hOidWCFDkhoej5jr0mS1lqFGla8qDUNXPfKZTWu44v5ykLz6KOWtho26YilFa/9vURpLTYDR6NSIgwx/NGdFQhoBJoKx4AsUncFEhKeCBMSI5u/0QU12gMhp1CWUO1Cmgml6MblNlCKX0vSKDt3QgR9MvmZzMB1WS0zpb94fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6vb7DlC; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6vb7DlC"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c156c4a9efso6825864eec.1
        for <sashiko@lists.linux.dev>; Mon, 04 May 2026 06:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777902275; x=1778507075; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lec/HBRFhNgtqkowgM6Ks1l+vLDAMplL7Wo1YC7WXGg=;
        b=S6vb7DlC19yq2K6zZUnykyWVrESPC031RaPR/KMNUCDEnL6hJeI/G9s3fHFLD4g4mn
         OKWbTbeTltpXwRsLFN0aujMWTfxZtFJMj//P1ora2ldC0HcDycIxTbPKYNTHpvbl1X/D
         x3e7RJauOy0EA3Qj9wfSbn9zpyIYPT8dpYI+bnvXGhRv37mu58U3704T2JEpuuNpanpt
         7AjEpjMKyYl1AApRU3U7P9Rr247RfgFGUe+V9l5RvpQDgHMJCaeE4KNb03hhC3Up7szi
         TJnNhskm91zu+8sMi12WfochJHO4O/LtxZ/VeWdLlpjXFLH6VQtLwT6+s7xhEroKyV71
         n4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777902275; x=1778507075;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lec/HBRFhNgtqkowgM6Ks1l+vLDAMplL7Wo1YC7WXGg=;
        b=K4ruAK5tfxmn0Qa9udFLhaHoK8acnz0XTu4gvAVKaUv4K3QL+7g5K2/xI6FEhl2VIv
         QL1Q4vfcZn/XWy6k/Jab4Cg0eozfi+W+bQD3fh8Lgz8GqURKvc3Q4uENTcvdYpyKoJCZ
         7q2Xq/fEXoO7GFdLx+y9MVTVmWRoOlepMOoZ9EaIRh8w+wnRzY+hjH8RYNIIpK0PjwOF
         8s/s+i1zp8+LbgdwoPSgShlqhhLeYq/zSaSRhCOk0sh3H7drAy19mPDUDYP44U4lSVUS
         k7uOm/rnaTSAu8adLnw4poAjm/bZHjsoGs+Miv7YNhpPTycA3y4F7rqVRRJQqfhLGGB7
         l6Ag==
X-Gm-Message-State: AOJu0Yyg/l1Aueg/gXb9rnQTB/F4yrfKVvj9i+gqjXLIFI3SuCoo/E3C
	FsZaI6d1oTV4IhWA4u7WIH/bJ2Js/P75W82vSAT9h/iMdlOjGeMcONcllGV3XA==
X-Gm-Gg: AeBDievs4Ji+72kFuEUECzux4z1wbOzl10uzt25XIheLYylPGk6QHmXTYmy0SRJNqZl
	cOkjeVF957oorexChOo7ostqXtTth1UJt1w++Y5aSnoUAA3I3ewTb98fMJY2d0EvbAMZbeFDNII
	3DHjYUwMcHQD7vKrt58mOVWJbWhBbHFRwRzJRd2nyP5T33GMNsGFs+86iHeLbXzvajNKa6jdvcW
	jeyp/ipF6SIP/V8/xXhW40ri57L9c5I97Ps2aY7iQlO6ZazReh0sn7yl3o3k2W/tVR0PQ6RRg2K
	y4U0+rPByPpFEeWYTRth9Ddfz/6Vwji5ifWNe1dw1Md8goU/TVPGj0NWltEKo9Sr1q2W0GOodJF
	1G3RUUytOaMUPYY6umQYy0ejvNzDmmRDbxaZkTxteOE+3U9hJFiX2uPTEbakBM0c5gzyC6lI2qT
	+nzGnbasXELxSry2pgX5XevuRb/JRtv2tMgIIefdJ68IRmKI5aO7kCA75y/rQFA8QUlOtTAg6eQ
	L13lg8ETvY=
X-Received: by 2002:a05:7022:ebcc:b0:12d:b396:eaed with SMTP id a92af1059eb24-12dfd7d1a3cmr3566772c88.9.1777902274310;
        Mon, 04 May 2026 06:44:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df8424ef1sm20213769c88.9.2026.05.04.06.44.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 06:44:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <232833f9-5542-4f4c-9bdd-92f72b0597d3@roeck-us.net>
Date: Mon, 4 May 2026 06:44:32 -0700
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] watchdog: Fix wrong SPDX license identifier
To: sashiko@lists.linux.dev, Philipp Hahn <p.hahn@avm.de>
Cc: linux-watchdog@vger.kernel.org
References: <5557c8ab4a62750c95631f6f78be7d2b11e091fc.1777892508.git.phahn-oss@avm.de>
 <20260504111735.3D387C2BCB8@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260504111735.3D387C2BCB8@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/4/26 04:17, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The commit claims to fix a checkpatch warning by replacing `GPL-2.0` with `GPL-2.0-only`, but the kernel's checkpatch does not warn about `GPL-2.0` in this context, making the change unnecessary churn based on a false premise.
> --
> 
> commit b8d17764218e572db22388434473471ed009998c
> Author: Philipp Hahn <phahn-oss@avm.de>
> 
> watchdog: Fix wrong SPDX license identifier
> 
> This commit updates the SPDX license identifier in the watchdog
> documentation from GPL-2.0 to GPL-2.0-only.
> 
>> The identifier GPL-2.0 has been deprecated in favor of GPL-2.0-only.
>> Change it to silence checkpatch.
> 
> Is this description accurate regarding checkpatch?
> 
> Looking at scripts/checkpatch.pl, it only enforces GPL-2.0-only for files
> under Documentation/devicetree/bindings/ and include/dt-bindings/.
> 
> Additionally, LICENSES/preferred/GPL-2.0 explicitly defines GPL-2.0 as a
> valid identifier in the Linux kernel.
> 
> Since checkpatch does not emit warnings for GPL-2.0 in generic subsystem
> documentation like Documentation/watchdog/index.rst, does this change
> introduce unnecessary churn?
> 
linux-next$ scripts/checkpatch.pl --strict -f Documentation/watchdog/index.rst
total: 0 errors, 0 warnings, 0 checks, 18 lines checked

Documentation/watchdog/index.rst has no obvious style problems and is ready for submission.

Please refrain from unnecessary churn, and from making false statements
("to silence checkpatch").

Guenter

