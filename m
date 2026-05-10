Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC7735E943
	for <sashiko@lists.linux.dev>; Sun, 10 May 2026 07:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778397091; cv=none; b=COiE6IaJmCuMmukSCIAkqaQYjj5YECFYjlAPTI1+i+ggaBP6l6++uJbFsHxoNYCKKsI5kDyNjS2+SA24DklTbznz63ef+tlnye2xTFTd0Abb8pS7hhT85JoRg4Pz7LUn2W47KLlBVm4H+ES+mOBiP7W7hMaEErtiT3Lszt8j4CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778397091; c=relaxed/simple;
	bh=EleGY3vgTfeFTin94EwbWKxMKGx9dC00TvNm+PCjBFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f/h/GN6weEqx9cE4C4TDy9ItT7o9NWb0EV1yBgyu9zaqO2CATxci+ffJNAKY+DFnD9xvXKrShPBzjOGAm0niPUonffcoUGkHu52bn9WXQfY9rrUS7/U+RBgG/nmgD9o3k6x9omjaWKmQl4DuNc2DlGNv3JeSszn7S3uNWpwimCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FgoQ3Hxa; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FgoQ3Hxa"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-365eecc5885so3215241a91.0
        for <sashiko@lists.linux.dev>; Sun, 10 May 2026 00:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778397089; x=1779001889; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NBksUd3TRhC53VHUdaPee5fHFL6bRQ8cdTbc+yWXtmA=;
        b=FgoQ3HxaqdGzff4LkILNdnaDUx2bOtK13crQ4wvj9jXGrAPkHND7PubEHZyi2YhODg
         w5kZN8jmW+duSBZjouYLJrTNDqEFdKSsMtRKh85L3mOEv4/gj06tj1i6q0w4CGc4EIRb
         XmtIs0JLzJ3DZnss9xRDK1n4Miq30KxGGISW/kaDp7r0jvnbLxEarGVC2zeFNN/BCogV
         8AHeOzkPzScTdqkaLz+eWpkpwx8QUDs+LpZgGC1KGlve8IAUBYeilDjkyUUu0/20A4zV
         cHLx9CFe4dISNgyF/N712X7tHTneKdgCYHe6sa0ZMD5jGfAGQmJ9X7QZrtB8UQBm1sBp
         xDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778397089; x=1779001889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NBksUd3TRhC53VHUdaPee5fHFL6bRQ8cdTbc+yWXtmA=;
        b=CpTGmYtrEAJ1tQSJyZNiFMYKu5/dP/KWNxoHwA9WvakdZKksKHSqDe/BeZdgPHNdSE
         56tZ2Onu7VzjauWf0rbepnaIQK1KDcrPih6+40k7Q8dFUav4C/IYJVIQ71O40nsEfQBG
         Tdbw/KQWS6bV6lkvJSd6WAKWPEHQ/LYa3R9C0WjAH0YOHw+oHAGtiaaG315vzbbwhn15
         c34Sn/ZhqNyFdfybmay2Fd/NurIHGQBqS3p/CxHLJ/63NYzth20CsyhKyATlJ5gE0fkd
         NOqO2qEKGzRP0czjbCDt6d2LVPDWC4B/4DnLCXpaQKyTzDeswXT7XuQRNdJKRffxg3Zz
         7cEw==
X-Gm-Message-State: AOJu0YypFIY+M80s/OGrBjTTa27P3/TkgS5NrdN+F8J61vs+EqhBzBqO
	KuKGvZdb8mUBRCEHuyezsR6WpMeT8Swo77Uv7z5WggEaey6OyyRC+CP3rw5IJw==
X-Gm-Gg: Acq92OGktTBlK+1Q/5MQDFTJc16EsXUQOtBCJscYHSawoO9xtk+cS5GZFBZJEr1lbTA
	31WgFyxMvXoYL7zFpJqM9sZz6z+r6wnooDAYZR3Ew0aOWMI+piA314zCBaRUfrNDnsuAdFmnIXm
	27RX7u2JEPWBBHeUUeDm1dJrLRdrqEnQ4iNe2xRTbi3yFVRlMkJboRDOhCDM8lZtMqIq4otF6WY
	BvxfH3IuZmD5L04mtMGimYEKr5+ufldbaMsZH/eArpjAjwdGc8H3MAJke2J9RE0xaxx7+/RciZq
	WnVCJwbDrPuEM15RNqhE0t9qJRa38rmNAlXyq8wYXp+426ocAEUjXK1tCdtrYe0cmEn7vv2CR93
	sHoTL+9hyoqoTQroNjs+/U28J31Fm1QPKE1EZzdVEYzIfFYlarJDPOkzPeb1XK8HhCgHOP8ox9E
	BJ04iJhqz4mul6Zf4ffwZU9X4Q/I2PmJ038EclsP2P19yxxQ==
X-Received: by 2002:a17:90b:1651:b0:366:3d97:74a9 with SMTP id 98e67ed59e1d1-367d3c7153amr5332804a91.0.1778397089420;
        Sun, 10 May 2026 00:11:29 -0700 (PDT)
Received: from [192.168.1.5] ([60.243.224.75])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d629c17esm3678111a91.6.2026.05.10.00.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 00:11:28 -0700 (PDT)
Message-ID: <6235faf8-fbdd-468a-ae2d-a4a3f7ee50fa@gmail.com>
Date: Sun, 10 May 2026 12:41:25 +0530
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] dt-bindings: mmc: st,sdhci: convert to DT schema
To: sashiko@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
References: <20260508-st-mmc-v3-2-81c329ed28e8@gmail.com>
 <20260508222225.1E854C2BCB4@smtp.kernel.org>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20260508222225.1E854C2BCB4@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 09-05-2026 03:52, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Missing `minItems: 1` for `clock-names` and `reg-names` restricts them to exactly two items, breaking schema validation for existing device trees.
> --
> 
> commit 66ec88f9e00b102af921864d0e0bf8b1b9e7f38d
> Author: Charan Pedumuru <charan.pedumuru@gmail.com>
> dt-bindings: mmc: st,sdhci: convert to DT schema
> 
> This commit converts the STMicroelectronics sdhci-st MMC/SD controller
> binding to DT schema. It updates the clock and register properties to
> support backward compatibility for single-item entries.
> 
>>     - In the legacy text binding, 'icn' was optional. Keep the clock list
>>       flexible to preserve compatibility, although all existing in-tree DTS
>>       files already provide both clocks.
>>     - Document the optional "top-mmc-delay" register region and corresponding
>>       reg-name in the YAML binding, as existing in-tree DTS files already use
>>       both "mmc" and "top-mmc-delay" entries.
> 
> Are these descriptions accurate regarding all existing in-tree DTS files?

Yes

> 
> In arch/arm/boot/dts/st/stih407-family.dtsi, the mmc1 node defines only a
> single register name (reg-names = "mmc"). Other device trees such as
> arch/powerpc/boot/dts/fsp2.dts also define a single clock and register.
> 
>> diff --git a/Documentation/devicetree/bindings/mmc/st,sdhci.yaml b/Documentation/devicetree/bindings/mmc/st,sdhci.yaml
>> new file mode 100644
>> index 0000000000000..10e0e1ee6d5cd
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mmc/st,sdhci.yaml
> 
> [ ... ]
> 
>> +  reg:
>> +    minItems: 1
>> +    items:
>> +      - description: MMC controller registers
>> +      - description: MMC delay/auxiliary registers
>> +
>> +  reg-names:
>> +    items:
>> +      - const: mmc
>> +      - const: top-mmc-delay
> 
> Because items lists without an explicit minItems default to the length of
> the list, does this strictly require two items for reg-names?

Yes, but I can add minItems as 1 to accept the nodes that define only 1 reg-names. but the existing DTS uses both.

> 
> Will this cause make dtbs_check to fail for existing nodes like mmc1 that
> only provide "mmc"? Should minItems: 1 be added here to allow single entries?

Yes, I will add minItmes to allow singe entries.

> 
> [ ... ]
> 
>> +  clocks:
>> +    minItems: 1
>> +    items:
>> +      - description: Clock for the MMC controller
>> +      - description: Interconnect (ICN) clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: mmc
>> +      - const: icn
> 
> Similarly, does clock-names require minItems: 1 to match the flexibility
> added to the clocks property and prevent schema validation errors on
> single-clock configurations?

I can add minItmes as 1 if the node only requires 1 clock, but the current DTS uses both of them.

> 

-- 
Best Regards,
Charan.

