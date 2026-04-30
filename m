Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547C7382367
	for <sashiko@lists.linux.dev>; Thu, 30 Apr 2026 20:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777580405; cv=none; b=ozfCEnaw1qLtlSDU1eksIE0onWEkFz7RU6r0v4A7MO+py9cD8sztM4mOAw2qxru9LDDiT9jKTAkncJ5kEMKCmghhvMKmsJOX43gO2ZzsJDBarLmaY8N6tOcSdPg/kmisBlwIcfVVl9qjp58e0tLc22ySyfuJ4ribTf+na4GeG7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777580405; c=relaxed/simple;
	bh=5xDdPHwOPg1/+xEc48LhJjGaJZxT2Wy/Kj8wbOXVP5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jSl3aTHOCDK5f3K5RWSLj4defxWLcm6NRJx/T746nWyeIYtXAaUvQuARJBEj2jtP+Iw+icwgBJMARY7xFDw2kXzWpEfZye+Bp7kNlyLPfMgLQ3XYDoIQ0JGInZpftMgsTZctgenZaEoY7wMeOB7Vx9ZbWf5eYvTWzp7TRqK24i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EyM3H5Y9; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EyM3H5Y9"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82fbf5d4dc2so984235b3a.1
        for <sashiko@lists.linux.dev>; Thu, 30 Apr 2026 13:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777580403; x=1778185203; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=vftSRvAvRX8nlWWNeiHY+Q4q7N388epoMGmpzJDaRr0=;
        b=EyM3H5Y95519QqR35fK2Jl/CC8BNf1uB+pIGMsusYYyD2adpDAYhC6LveKSaFeRJl3
         F+0VxdWMYmY8Gt0grybrj/kLDrnwQVqPuC1QCAyInIz/BlZvAustZlf5BuCID2hUAzF0
         MDQnfEDCaOHjJEnA29woXhni6BBZlbn0C8VO5R2/p/Ao48CUwusBxTaD/m44A/xbTol2
         wr6HPuw1azWo8Py64mmPZM4sQSd/yvCDnP+IFDQx8tKhpXA0Hegp07atRD3VyjNcCHJn
         1Xy/aN2ujSGwYKJtt5PPztlZSCKBxE6HpAZq1z0tSxr3QfiO/fHKdEyZsrR9OG5HZKR5
         rZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777580403; x=1778185203;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vftSRvAvRX8nlWWNeiHY+Q4q7N388epoMGmpzJDaRr0=;
        b=M9ZS6skPaXcL66DCTPMq+qYVxHWqUXjpvbDJNI0O4fcpq0S+WhrdvCmh7HFpw7mGsl
         XqwWJMp+W+5/y2tO57yI0E8UWfN5lHvYYDrEEkJEs72yppy7DJX4mhWm8ZlS9SjtSN7G
         m66PcXIT1yaBK/mtcixUa+bZxQJn5s2AQ+Dhny4aGnnZnxSxfNjSlnsKMUBPOCCE4A1X
         ah7N6sZhk1jG4RoqPknTMJMprzgKiLGLXwHplIInfDsSeeiy0RxM3MuB9pC7njiK6VEG
         XGVKgxWq7mMYZPwIDXJ7pNyyxbAqZMBR+StzEKVgHapwH8zkVBLh5wSuYFxpFOzJmcQn
         uynA==
X-Gm-Message-State: AOJu0YylKD4Eh9vMGhZd/e+R5MXRs4x2sbRYCQ19CVX2QDEK5cUUK/oD
	Tioq/NFZOZhTAFgJRhmwsrQ87UOcAkhLFaQTCvqKm9jiUOmOyG/MW1mc1qkZ0Q==
X-Gm-Gg: AeBDietTAuDPht71xL1r8EMncBUrOTr3Fut2dtzhXAuuCmAoX97Sn0o+r1VU9AfsXcJ
	CGEqBMFb71FGRxh0J8P8onNmSVkfRpcHjjAq37UDiB59gsobt0dGfAK40sNIdi7Rp4kFbk3aH6L
	qaceQm8YDfoPoQ6IdnRmc3bB4Uxlwsuz+lxRfWzvqrEFhOFQ8Ef9B2ejlr6Ps2+F60Gof5YqpJf
	tzvGLoGmGb0n/jaG322/gW/m5masFl35zhfrZ737VoaiQPMapqi3q//o9kyRLjiERk3h3nRcEGp
	/Qqhb7T6vUBTgRh4WqMG7PZseSrcVK75gYkTF0HKs+UOJ66XCWGZtNgLR5F/j4of5z3oRSkW7Ft
	i/ua8Ea1j+6airhaLw9l2djBSAt8SKQP8I+mAWf+esEdUeMU6j4LL4WhLEzuaffTCkW6piyT9EU
	yYWqnm4UHjPKVUxBItkV8+tfJuIQf96mWd1gfDf6GNFkKOBft80pa9IvR7eAdALOxDGNus53JZQ
	cC2mEPiL1s=
X-Received: by 2002:a05:6a00:a586:b0:82f:4628:4198 with SMTP id d2e1a72fcca58-834fdbd3e88mr5451384b3a.31.1777580403523;
        Thu, 30 Apr 2026 13:20:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b8500dsm521749b3a.58.2026.04.30.13.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 13:20:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3ca6fa91-e338-48bf-9262-e5dc9e22d228@roeck-us.net>
Date: Thu, 30 Apr 2026 13:20:02 -0700
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: hwmon: pmbus: add Delta E50SN12051
 binding
To: sashiko@lists.linux.dev,
 Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
References: <20260430-add-e50sn12051-v3-1-f6d4e043ec7c@gmail.com>
 <20260430065909.981EAC4AF09@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260430065909.981EAC4AF09@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/26 23:59, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] The binding description violates Devicetree principles by describing software instead of hardware. It explicitly states 'The driver supports...', which is an OS-specific software description.
> - [Low] The Devicetree example uses the Linux-specific subsystem name 'hwmon@40' for the node name instead of a generic functional name.
> --
> 
> commit 8f686eaa80cf8986d09fe9ea7dca7debf1c51cb1
> Author: Colin Huang <u8813345@gmail.com>
> 
> dt-bindings: hwmon: pmbus: add Delta E50SN12051 binding
> 
> This commit introduces the devicetree binding schema for the Delta E50SN12051
> PMBus-compliant sensor.
> 
>> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn12051.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn12051.yaml
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn12051.yaml
> [ ... ]
>> +description: |
>> +  This binding describes the Delta E50SN12051 PMBus sensor.
>> +  The driver supports reading voltage, current, and temperature
>> +  using the PMBus interface.
> 
> This isn't a bug, but should the description focus purely on the hardware
> rather than mentioning what the driver supports? Devicetree bindings are
> generally expected to be OS-agnostic hardware descriptions.

I am not a devicetree maintainer, but I agree.

Guenter

> 
> [ ... ]
>> +examples:
>> +  - |
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        hwmon@40 {
> 
> Is hwmon@40 the most appropriate node name here? The devicetree specification
> usually recommends using generic names that reflect the function of the
> hardware, such as sensor@40, rather than OS-specific subsystem names like
> hwmon.
> 
>> +            compatible = "delta,e50sn12051";
>> +            reg = <0x40>;
>> +        };
>> +    };
> 

