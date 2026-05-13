Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970BF2FE04E;
	Wed, 13 May 2026 18:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778695798; cv=none; b=GGvNAejDoUYuGS95wuCv8mcjpZSugK1vIX4rqcp978YuN6RsoqAKSWpZh8G0gwfLX1PZbYaaqsgKjnJZAkHL/14ufBk2iqBcDW73RPI/VP6FvHxC0vfH4IH3It55O5I0l1fAbI3yzNQEHsyMGIV5vXNR8bL0LFYyeUW9re2GTLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778695798; c=relaxed/simple;
	bh=0Wy1DOrnjlNt73Ah07uGmpZAFJfl0exx2xgzosEcj6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BCGiqjwArn3S2sZduFpObGkwnC362mVK97E1Jyzu9OIDz/dz8sNJUPjfVd3ceAfvt/5kb6TT/QuewsfhmCagVzl/Ay5kWHVTVJiC0ValMYTw1YQSm2Vkf6WVWMScZ6MragcXcb6V+iGrCIHMjP0UwXJz0tZWK+uMHLdo5BLU+rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=du/argYL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="du/argYL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05E20C19425;
	Wed, 13 May 2026 18:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778695798;
	bh=0Wy1DOrnjlNt73Ah07uGmpZAFJfl0exx2xgzosEcj6Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=du/argYLsn5KOaratQHAXRK7ZWdXjIKD1wm9CPrQAd/kTYUAr6rNB2wsn1cCvClRf
	 6lWybcq/VGujU+GurWuQtG//gAAVx7EX7EVoaQzJVWK1LfjiZcrPGpaIr3I5udcR4Z
	 unvvLmVpxehWgpdE4Wpk2V32Q8FbqUpC6IAneLriRC0GkiMW4RawEiTiylg0511pKU
	 MhNksGnwKVEi1ZSR387T7ZjQZLz/cs4UBc0TYDPCVcY737i9gysSc1mxGMi81Mr/sA
	 OX/t8ipRpWUA+xxjsIynN4bJncXCvAiNj5991ZswElvyAK6bGZqo+ioAnnUwK189HA
	 WiCsNM61PNS1Q==
Message-ID: <bcdfd465-b830-4ca1-9e4a-4776ae11fd28@kernel.org>
Date: Wed, 13 May 2026 20:09:55 +0200
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: agilex5: add support for debug daughter
 card
To: sashiko@lists.linux.dev, Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <a42751b4c7eb9b4d58f2ef1db3591ff68385a562.1778237639.git.adrian.ho.yin.ng@altera.com>
 <20260508204237.ADF26C2BCB0@smtp.kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260508204237.ADF26C2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/05/2026 22:42, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] Abuse of the 'rohm,dh2228fv' compatible string to force the 'spidev' driver to bind.
> - [Low] Including a '.dts' file directly instead of using a '.dtsi' include file.
> --
> 
> commit 3916af69e58bdb9bf4d736172238dd0b03e9465b
> Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> 
> arm64: dts: agilex5: add support for debug daughter card
> 
> This commit adds a new device tree for the Agilex 5 SoCDK when fitted with
> the debug daughter card. It disables several peripherals such as gpio0 and
> gmac2 while enabling gmac0 and spi0 for debugging purposes.
> 
>> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dts
>> new file mode 100644
>> index 0000000000000..3981a9e876b0a
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dts
>> @@ -0,0 +1,50 @@
>> +// SPDX-License-Identifier:     GPL-2.0
>> +/*
>> + * Copyright (C) 2026, Altera Corporation
>> + */
>> +#include "socfpga_agilex5_socdk.dts"
> 
> This isn't a bug, but does this include a final board .dts file instead of a
> shared .dtsi include?
> 
> Standard Device Tree conventions typically involve refactoring shared
> configurations into a common .dtsi file, as .dts files are meant to be the
> final top-level compilation unit for a board.
> 
> [ ... ]
> 
>> +&spi0 {
>> +	status = "okay";
>> +	spidev@0 {
>> +		compatible = "rohm,dh2228fv";
> 
> Is there actually a Rohm DH2228FV hardware device present on this debug
> daughter card?
> 
> The commit message indicates this exposes the SPI interface for debugging.
> Does this code use the 'rohm,dh2228fv' compatible string solely to force the
> Linux spidev driver to bind?

Why did you completely ignore the review?

Best regards,
Krzysztof
