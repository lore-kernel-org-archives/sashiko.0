Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3399B2C236B
	for <sashiko@lists.linux.dev>; Thu, 30 Apr 2026 18:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777572131; cv=none; b=eXLaoz7Yvz6FuVDco1i4lCjY2SGTiAaHf7azD9WPvd5fNlyEsxHFzp4DD4uMCGrHP3r1Ou1spD7biYBiQ69WeWE6wAINVoYbuwP5W33zO0BMIKUBu4XgpnRk2vQmHZvFdFjy9hs28i54m3a9sC8iLYM4AzXN/NQbBrdBlX2VPQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777572131; c=relaxed/simple;
	bh=TjQVyiNW0d/QpKdXaOOwNOt3wWdEoZxGqrOPCXfVMDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D2AqNZR+O/fsvqkveB/jqGqYVV5NdxrcNKJH3qniPexsMnP8QKnBT81dZubKYUVvAK3dIDQaq6MVpjFKrI6x4keSY0n/JNrDFkJ86GQuWu54VVBHYbeosSNFpvF9DQlJ7XT/RI8rgFMzV4eOZQRCWeTlxbV/vwqOpC3gw9ts/uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DIUGcB2C; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIUGcB2C"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35da2d35eccso878861a91.0
        for <sashiko@lists.linux.dev>; Thu, 30 Apr 2026 11:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777572129; x=1778176929; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OlLiEMiCGBJhof3S74oNd1EFniImkuyGLR51eTHqnLU=;
        b=DIUGcB2CxdUOJpPeCkTwsWtKi+kBc6vutHmkfYEygzSeUgKKyzePeO1HxG2+1auafI
         95SwFtW97r0cER/nn69w7JpPrlZGpw85JaAvIqgw59TjwaGSbqZouxmDFATE8xpeAv3p
         /msVRvKdWNH9q0ig05rMf0AGN0Sa0nHQO7Mu0PXShyH98GzfGbPkqItlNk/0dwYM+WOd
         B+6cVg0Iz8rRr4EtwDMYiVlg5+R3B9EgK/KuFjBfYNbpNVcWriJnfavZ2ZDWgZIqTyrW
         Dkkrzx+4SUgD3TrKMM8Pge30w9KS6Wm5jog+jLJDk6H+OjAngMx796WDk0viIZSL8j6b
         YOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777572129; x=1778176929;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OlLiEMiCGBJhof3S74oNd1EFniImkuyGLR51eTHqnLU=;
        b=ppc6wOgegEBbtm3HtAM89zAlpZDNhreFzXqGcl266dSCspPBCFVdm/7vaT8rK0eVg3
         qH+/imlnn8p/q43+501ASUTUG264MlIdQwzgHHvaQu5marboOTt8nhrOiMGT9iYteqUC
         ZSuiuxynvEk+9yW0TKV/69fX+seekqciWaD9cfvvW5PGely1BYU5q7wGTmp2SUJdfLJ5
         b2c5YSNTri14ss4ag2JliN0GFCK3bkKuXAqW3JBDWxmBheSDU8/W6nSQtumJlwlszxaT
         xhvbOGOkMaUYMbmSrKrgJxVrnchtrowHKB5Uvb/6/ZqSjWdtBDhfLXXCA2uf6l/lmKsc
         pjrw==
X-Gm-Message-State: AOJu0YxOUqNTzbCGQ+r0UGQLScOWZt7ggEaarXkjRj34lE9XI5Nk+BRA
	rZZb+FBFSDy+IqjLAqdvUtlzHnFEB8HUxANcOSanYgGCw9qeP+35JBk6WjzN6g==
X-Gm-Gg: AeBDiet2XY3rfhXtGc62Wj40s2Td4Hf86NlsgGuRLm0fgTlep5phcEQgu9bC3oUZXAa
	NSansYMGPDr+Ga0O4Z8aRknwT3SMY5OjZE0Z7lmhhh8zv1o+QA6noyYuH0kKVcp89SLHlAYvbl8
	af4/kt5ongvEndPg9Oc2Bta0VhxZ105qKEwkM7i/Gjon0uEp1dzdg/C9tODQQFQCCxmHz7pkx3r
	hKSDSt3LkzLOZtlFSPDpMQSOcJdhLwdZS8Z45jhU7k84PsUQHOkfh1ESCdQSZqEtkgmBpGQTrtx
	ikcyeED+n8Zqd0uKzQ+bU2HzcVGamnGB6FIOf/NxqKZf6KeZtUqmz3mYrevSm1BaMpXpx2V2Zok
	X6Xbg2T9RKEtsYfGTyDfWMWQdIo02bsgH/ERYo8wK48VwAFxKbgTaZlL8zX8qeQWET02wcHN8vk
	1yGqNA3PZJuu/31mIm7nFmc9GkktsirJ50SgqnrvzIQM8jns5kQ9klQSjElftptHoCZMDh2ZxEk
	to+dxWXzFTjGhozm+plIg==
X-Received: by 2002:a17:902:7c18:b0:2b2:5503:1b8c with SMTP id d9443c01a7336-2b9a23161dbmr30073765ad.11.1777572129269;
        Thu, 30 Apr 2026 11:02:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae68476sm2256685ad.80.2026.04.30.11.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 11:02:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ec8d207e-3fa7-40c6-81c1-62de974043ec@roeck-us.net>
Date: Thu, 30 Apr 2026 11:02:07 -0700
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] hwmon: (ads7871) Fix endianness bug in 16-bit
 register reads
To: sashiko@lists.linux.dev, Tabrez Ahmed <tabreztalks@gmail.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260418034601.90226-2-tabreztalks@gmail.com>
 <20260418041150.93415C19424@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260418041150.93415C19424@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/17/26 21:11, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 1 potential issue(s):
> - [High] Passing a pointer to an `int` variable (`&reg`) to `spi_write_then_read()` for a 1-byte transmission causes the wrong byte to be sent on Big-Endian architectures.
> --
> 
> commit 4f7407427267b9ca42b213449235bc095cff57b3
> Author: Tabrez Ahmed <tabreztalks@gmail.com>
> 
> hwmon: (ads7871) Fix endianness bug in 16-bit register reads
> 
> This commit replaces spi_w8r16() with a manual spi_write_then_read() into
> a byte array to correctly handle 16-bit sensor reads. It then reconstructs
> the integer using get_unaligned_le16() to ensure correct behavior across
> all architectures.
> 
> Closes: https://sashiko.dev/#/patchset/20260329073352.270451-1-tabreztalks%40gmail.com
> 
>> diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
>> index 9bfdf9e6bcd77..9b52aa496d522 100644
>> --- a/drivers/hwmon/ads7871.c
>> +++ b/drivers/hwmon/ads7871.c
> 
> [ ... ]
> 
>> @@ -77,9 +78,14 @@ static int ads7871_read_reg8(struct spi_device *spi, int reg)
>>   static int ads7871_read_reg16(struct spi_device *spi, int reg)
>>   {
>>   	int ret;
>> +	u8 buf[2];
>> +
>>   	reg = reg | INST_READ_BM | INST_16BIT_BM;
>> -	ret = spi_w8r16(spi, reg);
>> -	return ret;
>> +	ret = spi_write_then_read(spi, &reg, 1, buf, 2);
> 
> Will this transmit the wrong instruction byte on Big-Endian architectures?
> 
> The variable reg is a 32-bit int, and spi_write_then_read() reads
> sequentially from the memory address provided. On Little-Endian
> architectures, the lowest memory address correctly contains the least
> significant byte, which is the intended 8-bit command.
> 
> However, on Big-Endian architectures, the lowest memory address holds the
> most significant byte of the int, which is 0x00. Does this result in 0x00
> being transmitted over the SPI bus instead of the correct register
> instruction?
> 

This is a real problem. Please fix.

Guenter

>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return get_unaligned_le16(buf);
>>   }
> 

