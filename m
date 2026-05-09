Received: from out198-15.us.a.mail.aliyun.com (out198-15.us.a.mail.aliyun.com [47.90.198.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C902773CC
	for <sashiko@lists.linux.dev>; Sat,  9 May 2026 03:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778298021; cv=none; b=hZIgI1DGsEGsZHaAMFdr4dz0OfjMUItYowmdwVwpeWXhdaaTb1lNbzBgrob6cNyJL83pLpo08jElb3gY7hG85pjrPHWpn1le+2jgygcRBHgxi/4Ly6YQbU1AE4QGEURWdGlTtN1bJBiwMtYX8T/VU/0Sk4fZtDXvTL6EruZQMt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778298021; c=relaxed/simple;
	bh=c/fbMdv4pfgVPj1blvwpVs1G+FVYcIzsDmOAEGMazFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hOWmoxC2tkkG95sc6ecadKYU0n9TVOZrg0ogwlMP/C+W7gF19D6YMSKZz+XV27AHDCC5mvLzgPGtRP9C3OGg4lXWlOEppojCWw0chNiak9r2ePTnwuFKJi3JXyypXvdlFY7/Y8we3FwN3DLOf6KgNnbVxg57Sp94MeKjtRhr9C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=Xf3TfXoH; arc=none smtp.client-ip=47.90.198.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="Xf3TfXoH"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1778298007; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=qGK9XfT0UNwOZBrWMMgeIb99xBMNK/YMA7jv7NcYbNg=;
	b=Xf3TfXoHM+mOzOlM0eC9dv+CUtlgDxrY/UpoJhyquhpVsUk5OviNpBOOT25EQ4/EexUKoRHA2hV6mIAz7eb+AaOT3TH5QaetM6lG6w+RJTK+PFjmMne+r3fI/vPqv9IExup2hhpt3xugORKAorCHwdmm9bblwD1rOCjJI/ApP00JGFH9KPJdE+mFeI8bCf4prSqCBzoxMeJpBqPGR/KPdr5Y4a/qZpyZCT7E1N/CPGOJTtGYOLRPusdhCTgzD8yaGoCPzTBX1xHllezIH6Et5iNjTEdSmq1d4Nep2OHUSZCMaeaoN1rSE3VYUG7xhTd4kjMoOKk0DR4GpSjmjt7GbQ==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.4450526|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0434244-0.00788896-0.948687;FP=10254890737992427316|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033040074035;MF=syyang@lontium.com;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.hT38w2D_1778298006;
Received: from 192.168.51.146(mailfrom:syyang@lontium.com fp:SMTPD_---.hT38w2D_1778298006 cluster:ay29)
          by smtp.aliyun-inc.com;
          Sat, 09 May 2026 11:40:06 +0800
Message-ID: <07b51d33-52ac-49d7-a596-b7ca70d68a58@lontium.com>
Date: Sat, 9 May 2026 11:39:54 +0800
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: bridge: Add Lontium LT7911EXC eDP to
 MIPI DSI bridge
To: sashiko@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 devicetree@vger.kernel.org
References: <20260508134702.4713-2-syyang@lontium.com>
 <20260508205007.655C6C2BCB0@smtp.kernel.org>
Content-Language: en-US
From: Sunyun Yang <syyang@lontium.com>
Organization: Lontium
In-Reply-To: <20260508205007.655C6C2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

在 2026/5/9 4:50, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The binding lacks support for the dual-port MIPI DSI output claimed in the commit message.

1. When using single-port mode:
   (a). Only either Port A or Port B can be output at a time.
   (b). Port A and Port B are combined into a single port to output 
8-lane DSI.

2. When using dual-port mode:
Port A outputs the signal, and Port B copy the same signal from Port 
A.Both ports output the same image, and configuration for Port A alone 
is sufficient.

I need to look into how to modify it.

> - [Low] Typographical errors in the commit message alter the meaning and reduce clarity.
      it will be fixed.> --
> 
> commit d7e3500f4741bb0ae26a44a80c52b86455bf1c05
> Author: Sunyun Yang <syyang@lontium.com>
> 
> dt-bindings: bridge: Add Lontium LT7911EXC eDP to MIPI DSI bridge
> 
> This commit adds the device tree binding schema for the Lontium LT7911EXC.
> This device is an I2C-controlled bridge that converts eDP 1.4 input to MIPI
> DSI output.
> 
>> The LT7911EXC is an I2C-controlled bridge that Receiver eDP1.4
>> and output signal/dual port mipi dsi.
> 
> This isn't a bug, but there appear to be a few typos in the commit message
> description. The word Receiver reads like it should be receives, and the
> word signal looks like a typo for single.
> 
it will be fixed in next version.

>> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt7911exc.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt7911exc.yaml
>> new file mode 100644
>> index 0000000000000..3290b10ce8835
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt7911exc.yaml
> 
> [ ... ]
> 
>>    ports:
>>      $ref: /schemas/graph.yaml#/properties/ports
>>
>>      properties:
>>        port@0:
>>          $ref: /schemas/graph.yaml#/properties/port
>>          description: Video port for eDP input.
>>
>>        port@1:
>>          $ref: /schemas/graph.yaml#/properties/port
>>          description: Video port for MIPI DSI output.
> 
> Since the commit message indicates the hardware supports dual port MIPI DSI
> output, should the schema define a secondary DSI interface here?
> 
> Without a second endpoint or an additional port defined, it seems device
> tree authors would be unable to properly model a dual-port display panel
> connection.
> 

