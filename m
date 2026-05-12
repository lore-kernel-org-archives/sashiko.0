Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001552DE70D
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 06:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778568694; cv=none; b=eW9kkfJJnEfwOBXPTXk/prFDrzun1800k6X8nPRRAJKu/Vvi7Mlg/e9AFzGnB/uPBvLDXV2t1cuY0FqS3wdyJiwZtEYK3dRrll3ggDjbHi/7BycMh2q4m4HDbPM1FHy/ddnP7cqeUo7O616fmMKTxB35xIwObGs0FAc06uId5Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778568694; c=relaxed/simple;
	bh=lxi8xLajakE0Tg6T6kpLZptB0G8Ab6aOA9iB5uI4H74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FvV5nEE4/ikAFcj7iwgFnX1dflIvSzCSL1x+NLr/nSaKY+O0s+Byw4SSeBNcrirt9rmVdcjkSQSutdgea9zrwoYrtd65fvDgEpWZe40qBncY6UlzWOgm/sPSwSSB2BaKTv6bImUsgXP6+qpR4Ru4i78XspDTrP1uzG0hT/dkjR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pem2Luxw; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pem2Luxw"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so34159735e9.1
        for <sashiko@lists.linux.dev>; Mon, 11 May 2026 23:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778568685; x=1779173485; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YJOHNlOoAOdzligbsnHZC6gf4IGYAZ6NxFSliiwy9bU=;
        b=Pem2LuxwTNpPdkCnaM6ZVxyfjNY4N7TWTjuLBFgmdJs8IPeZ1eLRfJxuYYCJHnnxrG
         3sc5+bcVhhCx4Gutnm76m3qJcxPRYj7Hv+NjboHMGRPx3cg4ApWeR81BPuIJcblLzmUW
         f3ulNc42o++zrPGJ5WhDpRinAHm842onDOwHxK3a5DAbwkTzacopml6JRNoBshvn1aYM
         tcCrkr3UD7WMAKxKsp0Q38hgElyEwCVToRiS1W/nm2fzL6XMsXYVcphpbBzN5l4Ki39/
         /Z4Ro1zRNA5vrP8YPTo9YMP2WNn88fzc5tnQenuLbbmVnAF0mrIe+lMeIGwdvB0J7h9J
         KQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778568685; x=1779173485;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJOHNlOoAOdzligbsnHZC6gf4IGYAZ6NxFSliiwy9bU=;
        b=M/cGbGeU8rlpRV1wHF0i9o+Xc/LIM96WeQPAtwV/6qf8NfK2wrAZwZMnAcvQFlSTKD
         mApc4Vw0/N2YJwHCbuswG+3k4Xgf0iG8N9MZP6NKE/UF9Ctw/02ODiQZdxt00n9zUwXQ
         FD1ld1zIwZDhkt+r9QUFZfFKyCIK3VfrO8LlAXeEucRiniSC7lcWqpHiG85xD8GdWqoo
         klhQ2G5tIAfv9rD5w65ZoeMTgwgbBFkqm9OedywfPBmTyQgJyVPEb01lZlxD3POq7u3q
         xR3GBb6iagQilIwvD9+9RArV2ozDOMIkbVLpC4uYv5PYsJ5zOaYOL0O8jIWL9igA7nTN
         K+Eg==
X-Gm-Message-State: AOJu0YwrgGsHHLaxWD+thKgnjvwXJ5j5Ex0ZquN+upRtKU+n3OUDKNxp
	jC89qX8swZlC/A6iFL0RMUmKNpOj4Y5VVxcc/PSL/Lqc4sBLqP8mFkWrA2riIikw
X-Gm-Gg: Acq92OF/LLcvkNz37EDMn3mckLYqf3F9SHLRgq7dp16JjSymz5iehhEMKoudj97uB0s
	1k6jb06yMGw+Ky8wm3aZcrnsOElcNC2kwDuDWhowvWS4Egkbmd9HDgMElcMraAO4DfmjSeWQfMO
	ndCXQ9khOyquaYh2IQXRmCK/9L4wn4R+jv2kIzcgPTteU1n9uZrAsVC0Z8K5XszQyL0p/4RgNN7
	84Zh+52/WU3ms2rZreQFGxsVwv4CGrFyCM7x1HAVTiDZ4LGcf7/LuVydBoua9RsFHmU63126oVn
	/lgoErVo9qZF4UI9Ilq/3PcotUEfR8lM3W4CFr8UrOfE5Q+ohc7Vwd/EjaUV1CZ2Rz+k0dZCgXx
	kRXizriD962R/hoWTixVB4IRuPhR25SFyslJ+AnhCB9FubgFjceWPEftkklXzxFUQh4OaEpiOE5
	UXckLjdWusR6XcAyfkp6Y/Xafj0Uz8vJWxxzkE412nLb1m8+xoBymUOBojiISPBIY=
X-Received: by 2002:a05:600c:8888:b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-48e8e200421mr24540905e9.6.1778568685238;
        Mon, 11 May 2026 23:51:25 -0700 (PDT)
Received: from [192.168.0.40] (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8e634362sm12208715e9.10.2026.05.11.23.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 23:51:24 -0700 (PDT)
Message-ID: <4ac5bd1a-ac7a-420b-b0ce-acdcee4b20e2@gmail.com>
Date: Tue, 12 May 2026 08:51:23 +0200
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] riscv: dts: spacemit: k1-musepi-pro: enable QSPI
 and add SPI NOR
To: sashiko@lists.linux.dev
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 robh@kernel.org
References: <20260511111116.1109643-4-a.heider@gmail.com>
 <20260512022817.879A3C2BCB0@smtp.kernel.org>
From: Andre Heider <a.heider@gmail.com>
Content-Language: de-DE
In-Reply-To: <20260512022817.879A3C2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.05.26 4:28 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Potential overvoltage risk for the W25Q64FW SPI NOR flash via the 'buck4_3v3' supply.
> - [Low] The unit-address in the 'uboot' partition node name does not match the base address in its 'reg' property.
> --
> 
> commit 470f9c74bd3cfec41ed69dd8c4e22535a7e8164f
> Author: Andre Heider <a.heider@gmail.com>
> 
> riscv: dts: spacemit: k1-musepi-pro: enable QSPI and add SPI NOR
> 
> This commit adds the QSPI controller node and describes the attached
> SPI NOR flash. It also provides a corresponding vendor flash partition
> layout.
> 
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
>> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
>> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> 
> [ ... ]
> 
>> @@ -166,7 +166,7 @@ buck3_1v8: buck3 {
>>   				regulator-always-on;
>>   			};
>>   
>> -			buck4 {
>> +			buck4_3v3: buck4 {
>>   				regulator-min-microvolt = <500000>;
>>   				regulator-max-microvolt = <3300000>;
>>   				regulator-ramp-delay = <5000>;
> 
> [ ... ]
> 
>> @@ -249,6 +249,47 @@ dldo7 {
>>   	};
>>   };
>>   
>> +&qspi {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&qspi_cfg>;
>> +	status = "okay";
>> +
>> +	flash@0 {
>> +		compatible = "jedec,spi-nor";
>> +		reg = <0>;
>> +		spi-max-frequency = <26500000>;
>> +		spi-rx-bus-width = <4>;
>> +		spi-tx-bus-width = <4>;
>> +		vcc-supply = <&buck4_3v3>; /* QSPI_VCC1833 */
> 
> The commit message notes this flash is a Winbond W25Q64FWSSAQ, which is a
> strict 1.8V part. Could this vcc-supply assignment cause hardware damage?
> 
> The buck4 regulator has a maximum voltage of 3.3V. If the regulator defaults
> to 3.3V or is configured to 3.3V dynamically, it exceeds the absolute maximum
> ratings for the 1.8V W25Q series flash.

As per the comment, there's a the non controllable regulator QSPI_VCC1833 in between.
k1-milkv-jupiter.dts matches in this regard.
I'll keep it unchanged unless someone has an idea how to express that in a better way.

> 
> Is the board actually using the 3V equivalent (W25Q64JV), or does the
> regulator need stricter constraints if it exclusively powers this flash?
> 
>> +		m25p,fast-read;
>> +
>> +		partitions {
>> +			compatible = "fixed-partitions";
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
> 
> [ ... ]
> 
>> +			opensbi@70000 {
>> +				reg = <0x70000 0x30000>;
>> +			};
>> +			uboot@a00000 {
>> +				reg = <0xa0000 0x760000>;
> 
> This isn't a regression, but there is a mismatch between the unit-address in
> the node name and the base address in the reg property.
> 
> Should the node be named uboot@a0000 to match the 0xa0000 address and prevent
> a compiler warning?
> 
>> +			};
>> +		};
>> +	};
>> +};
> 

