Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FEC2D1F40
	for <sashiko@lists.linux.dev>; Sat, 30 May 2026 02:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780106670; cv=none; b=cbVguaXE/SfirVDmCmO3GNksTk07SLd126GVJX6qmLFS5KVv5xXRUqaKkl16ZWXCXRq2QXRkISN887G1ukbE1Trvpsidfi+1WL+UQKfR2ozkfcRrPSs+erLM3AVRtkceTpSomX4x2ocgUg7hbCscqip4asb1LYfF2rLMYoBrV6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780106670; c=relaxed/simple;
	bh=72dSbvgXmThG29Wy9DC9W2hWdmDc/JhxBLXeNZoXfbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S0kjjX95rnUiaJJ9tqwiwiegqcYoZT5aaRRRcIgIEonhcp29cncYm5g63SUIDBgCRUJ1/aUCpVy5PCRhiGYyqdKS6ArV7x3gdHbrzdLsVRSTHKMmB0gMEtGIioo4nMsPGTEYH4dEFUfHZJOn7hwHCOa0xzK2PEkZJXlAfgABU20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=qytgWS/c; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="qytgWS/c"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8cceaacd07bso10916226d6.3
        for <sashiko@lists.linux.dev>; Fri, 29 May 2026 19:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780106668; x=1780711468; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UoipIVTXqr3vqIuBxViPLpH3VtK6s1uF7OWKVaQToZ4=;
        b=qytgWS/cauWf7saV0WhMCnu4kdddQWwfZR2KIm0YOI2Y54hlHAPJ0hdmCCuhA61Yaj
         OF0pFSLZgFD+eaNEDWCgusWQcOAc80Wsqk7lBplKEgaEPXXQo+uR6kzvdCafzCHb3/wp
         mAgyHsN4qqBoA49Ow/am1B0g92LEvMfxqKqhSrQn53U3ofqD5owZZVWNzC3jH4UaXIJ+
         IHnBagW42zQLQn0OAdWJj6UYs37Eebax21v92rdYYdsjk8xX991qzUcWi7X3QCEE6C3o
         Cnnqf/dLvwLHEiGkIykLVd/on4leZM7Xj9VEem4n6io3HyMmlRP5RwLyfrYgwvssXhGT
         0jSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780106668; x=1780711468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UoipIVTXqr3vqIuBxViPLpH3VtK6s1uF7OWKVaQToZ4=;
        b=IVDe2Jdov9+pnsNCHoZ7k6L1GE+libmEF1V+04ciklnB9KDP9vPr4ihffDdmiCYAzS
         vF9cKXQ5SGPtENTViWwu/cp1m8KA8iAnJImcMmR/huXnb9xnLKu+TTTOB/08JslI/KCX
         G08qdjNIWqmsSFIMi1+47QLf5hkKFJY+cS0ORxQpVkn96z+O1JBqEidfxTrytttyiRoq
         VtxZ4E1fSCydiKqZEtsxNwq0/KUfOdtB8CfoT6/gx1pneR7LZXfmWlp1m1F9UhKUxvKT
         28mglybXADCkFhRyB80uN7Hw5bKca332Mzmg1ZCDaPDbJa0imLy1duzoaBoFFluV76Z+
         qIdg==
X-Gm-Message-State: AOJu0YwN1J/Yaoj3D8ssJPTFGCvVMD5pLw6ywKiZNoEuL/XmG13FVm+b
	4d/Rzh/o6pszerDUcN7LXaXh6+ND0uQWbOqFIys4Fm79cIYYI2P28l5L/riMqz7EH4N23hwyemo
	/gpSJtUU=
X-Gm-Gg: Acq92OG+Hk9Dpj79yOeXxgOHNPSjtHG7MrTk0W0g7viu4x2UCY3ZSqMxUd2lMHP0sEM
	ZSuWsF2+N+z4vyN1N+buYp3/p06a30pJn6JUDoUXsdO1DcG203TNrn8NLq0M2QLa9VX/V1tJoEf
	vPaGpFZWl0SBuH6T2duD/92xoIkkhZKTCzKckxK/h5MNEMz0U12kOe1bCihLTcXxmKZ4hC9KJ+P
	WOeGhEenjwPlcq9pIDxgFtbJzJ/XshILVg0rGwfAP83EftmzITc+kHiHjqF+tsaSbL0vGIGCUCy
	YRtUPv4P2Y2QkX8ES6Tw2hCvN98aA6dL6gFH15Q3WNlWAo9R91E2g/piO39EcaS7VFjxFm+h/C0
	zyp2rml4seGv0KXEw/bZzeiUhoEz4OSz50O6Jiyd94qGzVHEICgmtwq+ZlDGfvrQGFGGYkEWph9
	QGRJ9o/r+YYbW236UEgPkxOl5XMv7PbGXoTzSOPkIuxthA
X-Received: by 2002:a05:6214:2f88:b0:8cc:60dc:a249 with SMTP id 6a1803df08f44-8ccefde0a77mr36709336d6.42.1780106667909;
        Fri, 29 May 2026 19:04:27 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea06d4casm32658206d6.16.2026.05.29.19.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 19:04:27 -0700 (PDT)
Message-ID: <07412401-d19e-48a3-98f7-a3342d264b35@riscstar.com>
Date: Fri, 29 May 2026 21:04:26 -0500
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 03/12] net: pcs: pcs-xpcs: Preserve BMCR_ANENBLE
 during link up
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org, Daniel Thompson <daniel@riscstar.com>
References: <20260501155421.3329862-4-elder@riscstar.com>
 <20260502155617.51FDCC19425@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260502155617.51FDCC19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/2/26 10:56 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Unconditionally forcing BMCR_ANENABLE for SGMII interfaces during out-of-band link configuration breaks forced and fixed links.
> --
> 
> commit 3fde24f4d6c6c8c6b563418e32cec40953863f8a
> Author: Daniel Thompson <daniel@riscstar.com>
> 
> net: pcs: pcs-xpcs: Preserve BMCR_ANENBLE during link up
> 
> This commit unconditionally sets the BMCR_ANENABLE bit for SGMII interfaces
> during link up. This change was introduced to resolve an issue on a specific
> hardware platform where the MAC fails to transmit packets despite negotiating
> the speed correctly.
> 
>> diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
>> index b2c84b7e1e11..1d62d5b31c61 100644
>> --- a/drivers/net/pcs/pcs-xpcs.c
>> +++ b/drivers/net/pcs/pcs-xpcs.c
>> @@ -1263,11 +1263,14 @@ static void xpcs_link_up_sgmii_1000basex(struct dw_xpcs *xpcs,
>>   					 phy_interface_t interface,
>>   					 int speed, int duplex)
>>   {
>> +	u16 an_enable;
>>   	int ret;
>>   
>>   	if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
>>   		return;
>>   
>> +	an_enable = (interface == PHY_INTERFACE_MODE_SGMII ? BMCR_ANENABLE : 0);
>> +
> 
> Will this break forced and fixed links by enabling auto-negotiation?

The next version of this code will handle this differently,
setting the plat_stmmacenet_data->default_an_inband flag to
true instead.

					-Alex

> 
> This function handles forcing the link state when in-band auto-negotiation
> is explicitly disabled, as indicated by the early return for
> PHYLINK_PCS_NEG_INBAND_ENABLED. When this function continues, phylink is
> requesting out-of-band negotiation or a fixed link.
> 
> By unconditionally setting BMCR_ANENABLE here, the hardware might ignore
> the fixed speed and duplex bits, instead waiting for auto-negotiation to
> complete. If the system uses a fixed link (e.g., MAC-to-MAC) or connects
> to a PHY with in-band signaling disabled, SGMII AN base pages will never
> arrive.
> 
> Could this cause the MAC PCS to wait indefinitely, failing to establish a
> link and dropping all traffic?
> 
> [ ... ]
> 
>>   	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, MII_BMCR,
>> -			 mii_bmcr_encode_fixed(speed, duplex));
>> +			 mii_bmcr_encode_fixed(speed, duplex) | an_enable);
> 

