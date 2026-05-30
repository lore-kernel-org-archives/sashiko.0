Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3562D73BD
	for <sashiko@lists.linux.dev>; Sat, 30 May 2026 02:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780106677; cv=none; b=MjftkF482Ovb3KLXvKh3RU+n+cXTr8dXLVte+hgN1a5ZKIyVGwocERhpjFpweAdaCKDKt3j+ouvHL9jeqycVyR3d0F1UuRXvHBA3WDpMv3B/qaQArjCYWe5S1lQGXfl7Y0KLwCM4LHSfbSZ8QuNJ4nmnAeuZoKcFLNz0vEpQ2s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780106677; c=relaxed/simple;
	bh=Y/uAtYU0hGHBj2ZxgA+qT2r6bUkE3/pceK4oBwgGrCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OrXSHhdbwLiglMfd+72MFbM8zJMxAsiZZIs4e8qHHZ2kGqIbfdoGwZ1NRf7bIi9Gdn2VDRDLgi4jP/0oS1UkYjt9WQHpDvgpJqEK8vAPUbx6xALgZP97EFGrjR6c4laZhM2HBb06ZRj3M6byH40BJX3lOMTbU8Y0OYoScSo2SOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=C7Eu4EwO; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="C7Eu4EwO"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8ccd1f57b32so29587486d6.2
        for <sashiko@lists.linux.dev>; Fri, 29 May 2026 19:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780106675; x=1780711475; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eg7o6FQ/jNrjMIrB2Cy8BBpIF+AjjaCmovvjHcE87cQ=;
        b=C7Eu4EwO0n8xvSAmysK7Zdh9WoJ6PdjQwErO06Hspsd08yUKVLDJrV5Kst3MF7FzhW
         6585s5vl+dncFhSoLEK5QyqRndKJ762Yw5+hVZi+kCU5/GiFh7UayQJ1YzPJVAkW6hh2
         TcIFeSSwj3XIbYEl/ydK+NUylcHgcmnSrilSLUBOWDWEfF3HZkYQ3UpzoDPd45v5jl2M
         XaivwJr/ywmJsHdcpw8gDwRHjxBRWU/DiF/qwSwM5ezextxSqHXhV8jpuU58Z+wIXGVH
         42qmycOQnodjsW3N2ehIupUjntj+I+JwcBh+iXqkpcms57f2A/TEgWZPLjlZbUxSGfEW
         PS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780106675; x=1780711475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eg7o6FQ/jNrjMIrB2Cy8BBpIF+AjjaCmovvjHcE87cQ=;
        b=fdlk5EAg0OC8RV6lbojgZw/axm4H3TmHK1THpqSW7nARLe3yNyCV4YmyL+v8B8dg2x
         kmFIhivtYa7AjNGMHrR342xtPvb4Mxx63PKMLJPBigHEl4t2oAw/u96xoCBV5hrmgt65
         Oq2e/M/dzhE3/dbWWaXnleqT87eSB/cjx3Sv2dZi8ed+sTr0LtYZIah8m/8GtG+dVJ3O
         vIHWS3h94PdVQZs3YWcLDCuoCDgQu3r/dXfsYRN95WxA9Z2eWEK+6QGwn9Xl9KDBcgz9
         YqJwjNivOhMw33OSlSM/doHdK9+53TVUUzEBTcGWVBZzDn8kZy3j4WanuTipymUA8ZXQ
         Hz5w==
X-Gm-Message-State: AOJu0YzT4mFo+FA9pR7QLdXuwePaWzMsmx9mFUyUn2yfKTvgNMXmzyrj
	XxnruCgbsS8t3XdNbBVr57vCawdHeWGXDfiV612RKndr4RoH5Lt3WDfqUdJ/cVCz7KmKpE//G+7
	M0sN273I=
X-Gm-Gg: Acq92OEwT3hG78qPRnB++fvUBzMvNDnlKu7H1ZQ+itdDie74wUVFA1dQYPle8WefDq+
	EH2hnwswJKwmPkTosqAgQaMHBvFf+G7N0PlXRljUoaNgn3MLULnu8d324043GXOJm6FxnI6e8BE
	U+jAvtNhnO9OFPE6mAyOV5mziwjElbm0QZXmg2ckeh7ej412QRHyeb3xkjZJIDMvHA0yLZYYVOP
	FsA7VZPKSTdrDxospIkVq+ZdMzl5YUqYgc323JbOEzD+W2N06eLnbRELeuuxHVsIzIYevNkySts
	oZ2jjKmDIRzKlRC7sbTpz/EQ8Id79gduaEesfdwpTKUpAjbb1Q3iM93zoaapqhDKrmsetfJqptA
	djRtYeKQXUlN2uy0FzS5ynZqCv4mXNDL2zInNnhgdbZnPf1Wmc4B/LfoTrSV25W2cIMAhuAndBS
	98UYx0wkn3r0zxm73eHae3Xc9qrg3bIuXbKg==
X-Received: by 2002:a05:6214:540f:b0:8cc:d744:3251 with SMTP id 6a1803df08f44-8ccefb35c5dmr43536076d6.7.1780106675215;
        Fri, 29 May 2026 19:04:35 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea06d4casm32658206d6.16.2026.05.29.19.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 19:04:34 -0700 (PDT)
Message-ID: <1606fde8-7b42-4e43-a1c4-20fbe23956e6@riscstar.com>
Date: Fri, 29 May 2026 21:04:34 -0500
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 07/12] net: stmmac: dwxgmac2: export symbols for
 XGMAC 3.01a DMA
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org, Daniel Thompson <daniel@riscstar.com>
References: <20260501155421.3329862-8-elder@riscstar.com>
 <20260502155614.E4E41C2BCC4@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260502155614.E4E41C2BCC4@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/2/26 10:56 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Bypassing standard DMA address translation via custom op-table overrides.
> --
> 
> commit 6c8a6ba67e29de7e71f5090bcca63c458ee9639d
> Author: Daniel Thompson <daniel@riscstar.com>
> 
> net: stmmac: dwxgmac2: export symbols for XGMAC 3.01a DMA
> 
> This patch exports several DMA operations and descriptor tables from the
> dwxgmac2 core to allow platform-specific code to override them. This
> override allows the platform code to perform manual DMA address translations
> required by the chip's internal AXI bus mappings.
> 
>> One consequence of the SoC-like design is that the internal AXI bus
>> (used by the XGMAC for DMA) maps the PCI DMA space with a non-zero base
>> address. This requires a translation step (happily just simple addition)
>> to convert the PCI DMA address to the hardware DMA address.
>>
>> This is pretty funky so rather than push that translation logic into
>> the core driver we intend to keep that logic inside the TC956x
>> platform code. In order to do that we need to export a few symbols
>> to allow us to override some of the DMA and descriptor op tables.
> 
> This isn't a bug, but does this approach bypass the standard Linux DMA API?
> 
> The standard DMA API natively handles device-specific address offsets, such
> as through dma_range_map on the struct device.
> 
> Could this address translation be handled using the standard DMA abstractions
> instead of open-coding it via op-table overrides and exporting these internal
> symbols?

I'm answering this on Daniel's behalf.  He tried setting up
the DMA range mapping but it did not have the desired effect.
He suspects that the involvement of an IOMMU affects what the
range map can do for peripherals.

Guidance on how to do this better is welcome.

					-Alex
