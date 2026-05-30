Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D98F2D978A
	for <sashiko@lists.linux.dev>; Sat, 30 May 2026 02:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780106681; cv=none; b=YYmoF4xMmyYUG6DT9OSKwYKohHb4Jd7r1hw7/GBYaSHN4rMbCW6vg5Qixes5Tl0WYjbC2iuo7o7lp+aZffNJt64stN8kHk76D6BGShjoFe7HYlaGap45TPM/uy+fgyY3y2/i/6wBhbyMBNA3w+LS8z32NcYkr3NmC2WJSPofMhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780106681; c=relaxed/simple;
	bh=7x3g2yKZzahEp9eVu9h6doQtC5pNf0FT1K9qUyLtQIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gAMOCyrsZ8++xudoY46QaVzWeFShW7f5KaEvaboyVEnAdNZDZOE8FgKm96p8Q+XjP7z2URmxJghuvrm7IN6b9rmUwBkW1xuP0wxgjl08m0VxZ2AslvsHfP7r4OC3/TmgBzhORUQ0IzAAoh7Ro7kfTtoMvopacY4BfpgYlxkeGWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=tdk78pNr; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="tdk78pNr"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8ccf18ef922so4639526d6.3
        for <sashiko@lists.linux.dev>; Fri, 29 May 2026 19:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780106679; x=1780711479; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jAfLH0/JyU6jSxnsmUzgYT+Ykc2SX6vKy6PcvKQo0OU=;
        b=tdk78pNrZtl66gO3Nh9tE5EmQ6qQ278vPUu4g9XhjUpf+vhdBLKHiXReGe9F60RGK4
         P1vYTX8/OTSth7x9yldFYZT58pk0b5yej9sblc6zDywLeo5k9sbtcNER0N83mS14dShc
         eDgo7EdjtE5YBlaFNMVzqtJpJkOTDwknq9fPk8INUIyDLBsBZP3pzfIV7WmGHQOTNNGN
         S9Fi+L85bhz7tpeTW7HachQNqw3z8GvH4s3D2xjA7khvXV0NGROKnVuDamUe4UCbOlJw
         TXpm7HZBvIlU4u6rOp+HjiHPbUxs7CguFoamBmZIDk8+OjVLumA312YQW9cYu8bQxXYY
         RKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780106679; x=1780711479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAfLH0/JyU6jSxnsmUzgYT+Ykc2SX6vKy6PcvKQo0OU=;
        b=Hz2aooSA87JX23tCoinLWEtzu+jn8lwNWpKxo6+2oZuSiBTCMMAY3d96vXaP80lz+J
         N4xKYzo41YjbbyvUihzU7kJJiSy3o0K9eZ5nht7KQN6pAvD/hCj9tn0S1CISAaCFs8dj
         db/1nTiPBWTmuHrKxJLbYW47onCuJA0AolXDQtsSK4CD/qv7hXfeKgm1RCyZU6tcGUHa
         xfFxBDheL9QY6sMsWXqvJa1/WeZe2MV99kY9DP9VVe5ja3xmcZTw+CemlA/F3k6ttEkw
         IUvDwUnA/rARDdXOriKyuIXXy3Vy0dnxgohoCxuL37am91hki7TtppxSvSaRaALdKUG6
         RnNA==
X-Gm-Message-State: AOJu0Yx/yKFTvQ2Af4C70dhnfO7PPazh2epqsxaYdDrqMiVRp2q6rrX6
	6vaV/WhQNcb/nBPFXVelOtyoyjrE+WH6z3EGIEpZ9qlAsyK+ecfl3wBYMoKCltArOAa4Clo9TS1
	DOcOYp9g=
X-Gm-Gg: Acq92OFgiuQCO+CbwBFnQcsNF15XSyMc/MqSqYnqdONIinQYeNxfcBUoV6TyrBXnkrt
	5DODGnhF2FEpqjzFl6yPoi7mI/noQL/aT/qwS+BPYj6a1xw0NiVVXf2Bxb8VqsFFKV1GLpEWAsV
	C9i1JNjOMZF+aH7+KQWAT2QtN+skp4230YoJU1IMqOHiFymQAXRXAUlXyKQmKZkIXZPCAgWpruB
	ch+VvhsGhWyzGK8r5XosnYV+0gBa77FLSJEKRy3mCEfLQ1Mo7H6tOXgvCov0adj3pGmvsc4nSn0
	YXR+hKp/SRU+S//+FQkdJZ9dtJKbnLAwT19BOMFaQXNgjs9aCyt6N6O5wnpzMggVVel3Us1YY5l
	rfDQ82IDBVXi+YVJzG/G/eYzhwRXkFmcOZWbnuH2i1cLNxKH3jzPAbCEl8ZKaOy/E1DHybxDWIj
	SiRy7ZtZUZPxxwPsxmVQLYE0l4jFxsH+fNSg==
X-Received: by 2002:a05:622a:406:b0:517:383d:11f with SMTP id d75a77b69052e-5173a6dc42fmr31153931cf.24.1780106679593;
        Fri, 29 May 2026 19:04:39 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea06d4casm32658206d6.16.2026.05.29.19.04.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 19:04:38 -0700 (PDT)
Message-ID: <1ec59b99-318b-4403-8b8e-fbcf3eb393d1@riscstar.com>
Date: Fri, 29 May 2026 21:04:38 -0500
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 08/12] dt-bindings: net: toshiba,tc965x-dwmac:
 add TC956x Ethernet bridge
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org, Daniel Thompson <daniel@riscstar.com>
References: <20260501155421.3329862-9-elder@riscstar.com>
 <20260502155615.AF378C19425@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260502155615.AF378C19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/2/26 10:56 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The binding adds GPIO provider capabilities but omits `gpio-controller` and `#gpio-cells` from the `required` list.
> - [Medium] The Ethernet endpoint is incorrectly modeled as a PCI bridge, applying bus properties to an endpoint.
> --
> 
> commit c5a5d0d7a89f5ad66c878c805902efc5e0bd117a
> Author: Daniel Thompson <daniel@riscstar.com>
> 
> dt-bindings: net: toshiba,tc965x-dwmac: add TC956x Ethernet bridge
> 
> This commit adds devicetree bindings for the Toshiba TC956x family of
> Ethernet-AVB/TSN bridges.
> 
>> diff --git a/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
>> new file mode 100644
>> index 000000000000..d95d22a3761d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
>> @@ -0,0 +1,111 @@
> 
> [ ... ]
> 
>> +allOf:
>> +  - $ref: /schemas/pci/pci-bus-common.yaml#
> 
> Is it correct to reference pci-bus-common.yaml# here? Since the tc956x_emac0
> node is a PCI endpoint (an Ethernet controller attached to an internal PCIe
> switch) rather than a PCI bus or bridge, applying bridge-specific properties
> could be semantically invalid.

As Rob pointed reinforced, this is not correct.  It will not be
present in the next version of this patch.

> 
>> +  - $ref: /schemas/pci/pci-device.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - pci1179,0220 # Toshiba TC9564 (a.k.a. Qualcomm QPS615)
>> +
>> +  "#gpio-cells":
>> +    const: 2
>> +
>> +  gpio-controller: true
> 
> [ ... ]
> 
>> +required:
>> +  - compatible
>> +  - reg
> 
> Should gpio-controller and #gpio-cells be explicitly included in this
> required list?
> 
> The binding defines gpio-controller and #gpio-cells above, indicating the
> hardware acts as a GPIO provider. Omitting them from the required list could
> allow incomplete device tree nodes to silently pass schema validation.

The GPIO controller was meant to be implemented only by PCIe
function 0 (only--not function 1).  It was furthermore intended
to be optional (depending on whether the platform used these
GPIOs for something, like reset control).

However we plan to change how the GPIO controller is modeled
after version 2 of the series, and I don't want to try to
explain how things will look until that work is done.

>> +examples:
>> +  - |
>> +    pcie {
>> +      #address-cells = <3>;
>> +      #size-cells = <2>;
>> +
>> +      tc956x_emac0: pci@0,0 {
>> +        compatible = "pci1179,0220";
>> +        reg = <0x50000 0x0 0x0 0x0 0x0>;
>> +        #address-cells = <3>;
>> +        #size-cells = <2>;
>> +        device_type = "pci";
>> +        ranges;
> 
> Does this endpoint node need bridge properties like device_type = "pci",
> #address-cells = <3>, #size-cells = <2>, and ranges?

No, it doesn't.  Using the PCI bridge binding definitions was
a mistake.  We'll try to improve this in version 2 of the series
but again, revising how we model the chip will have an affect on
how the binding looks.

					-Alex

> The child of this node is an mdio bus, which does not use PCI addresses and
> does not require PCI bridge translation. Using device_type = "pci" on an
> endpoint might confuse OS PCI enumeration logic, which expects nodes with
> this device_type to be actual PCI-to-PCI bridges.
> 
> [ ... ]
> 

