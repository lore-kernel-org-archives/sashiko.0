Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3E835677A
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 12:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588301; cv=none; b=SWAp3n3CiiYpu3ryDk1rcr/xCBAgvGEp0skbCCuvlrWN82vqishUxHcl75tZz0wab3GsMclGdQggXABlQznqDa6pD+qLUYRxAiGHHKp/QGeZSAStOBlBypmpg1GA99FMqfsH25Nzb7jlQ7VAil6+Wnt0vZcMWrJotzSqCSRlPB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588301; c=relaxed/simple;
	bh=ZnPCtHUMI4pJAkFESK7iqLi0XSZcQX947eKedny7HSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CiUvkb4a6Aacj9ScKaQLVt0FC4E+14SNBND7braVDjHfcuVu5VlvVSs0wHehljDRhe9wvsikgra95ZZeDfMFLenMeAKQrlA3OzbI+WhgEmyRdmoZxtxfMw6z4c4UvdQTTIjm7VxplFEccQZ7i0gGtdfNI3GxW9J9KFMpZipgMz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvKJ3hF/; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvKJ3hF/"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43fe3e22e33so3223014f8f.0
        for <sashiko@lists.linux.dev>; Tue, 12 May 2026 05:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778588298; x=1779193098; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oLtu5I2VPxS4rnf9+Ng1zxRyZw5rRL7GPGSnHNWUIvY=;
        b=lvKJ3hF/VFPzrz8ZuB7QBpbxAzrFNwJy+LdLK35gnXhhx16RERIrkuRh63WDB38krk
         xNcf3kLqOxmgcKlF/2kgCgPees95mxpTmD8YUhzrgWjjkmoTzG/ooSUo36uAKR0JsSmx
         k9THFE1UnL8TX3SyTgysFruPxu3r/s6N7+M+UtMGfnBVGyLeYduANf6/o20xfJ+Tl7RQ
         bbC2wdkA/vxGAdavfZUscV/g+q75So9k/VYEeZ8JhTUTpu/fhyytgGaUBqW62yx/1Iuj
         yv8/+vJ0T7u2u79DVdAqv2uov4z7CYK4aPCynfNfLM1RbgH0twKJSOxgT4JMVGJ6JwAh
         BMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778588298; x=1779193098;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLtu5I2VPxS4rnf9+Ng1zxRyZw5rRL7GPGSnHNWUIvY=;
        b=YgEePBUPJX8sjHERFBiz1JQmGP1RUemkEq9vOUH+Sp7O5wzROjS+K2avOn0ODiF+qg
         Zzgy50allbdfSG5juZqhMYblGfbkLsttyA5gtN5yeIXfQe2hVXJ6B3qhFKNPVFHbIYX7
         13Una99vD088oQtgEQqB+PHL3dlL666XcdbaP+JI7fqlpfu4ISG8Wm/zd+L8lDZPchJX
         Lfm0Db1vP/CAb9i+w6sZOmw6gIkFVPIDjeSA7ngUqEkTeiCMIBASybwg0Qtqr11uaRJt
         pOiV1PazceKenHMfl3O/aCYhy3Q8cwqg5+7uXIrzYYm+sdTuQWR5FfNS0dlN1SiGdMAQ
         k8fw==
X-Gm-Message-State: AOJu0Yzc5YxEvyYPTCtdxbFt7Cy0L1DEO+4A3D8nAj1tN6TJTYGalBzX
	0zqWajqaLMdQ5h9dKQtHkCGlEssXv7scvFkFgylnzkM56uOZvn9xEQBQ
X-Gm-Gg: Acq92OHugy+2BGxe5h+UoEAs2uHvdqHGSU5nCeUdFtqd2xl7IKxuF7qMXnZ7ZtnCeu2
	JwGNR2jYAHYVQkd3jWa+inKR9f9eqyvTdgk/9Ofw5SLmN/ER3yixijPW+jJ4/l7KQp664fz7YFO
	oHAXBdt72awEfD25utjCft0bC6NVEgc/YDNrP2yubQwU+kOAA3EagLrTsb1pGnzOMSFU9QnSOUH
	Z+75WBrY4eOENQr8pZvAR/xbzX8HaoFZFpSzuZsYmTAi96f2jxiBR2BthSN7PBRbJWxkmsy5FQs
	G8dEuSUabYEe1FKa22PYE594VcgqXohPHAZ9ScfV43b4s7bYITkmb5lGy34nq2qp8ST4+Q8lzZY
	LtVqVqf9RHm44ITC3RE4xU66YOyOa2ZqBQC5KCnZBmpiT/UnCLA5a3dFL9SCphHvoW1yOMMX54V
	zlRl0iRpAtGYeVYgGN2ZlabN3fSAm6Z3hGKSZt3Oa03xUckQtUc/0ZFplI0T7oq3g=
X-Received: by 2002:a05:6000:2406:b0:452:65d:e108 with SMTP id ffacd0b85a97d-45b12a0d3femr4266473f8f.3.1778588298121;
        Tue, 12 May 2026 05:18:18 -0700 (PDT)
Received: from [192.168.0.40] (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491e94c0fsm33427369f8f.32.2026.05.12.05.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 05:18:17 -0700 (PDT)
Message-ID: <2fb2b317-5d73-4529-817b-86890d9fb3ee@gmail.com>
Date: Tue, 12 May 2026 14:18:16 +0200
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] riscv: dts: spacemit: k1-musepi-pro: enable QSPI
 and add SPI NOR
To: Rob Herring <robh@kernel.org>
Cc: sashiko@lists.linux.dev, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org
References: <20260511111116.1109643-4-a.heider@gmail.com>
 <20260512022817.879A3C2BCB0@smtp.kernel.org>
 <4ac5bd1a-ac7a-420b-b0ce-acdcee4b20e2@gmail.com>
 <CAL_JsqLx6uwsjTHgcmqRKu32Mh4vJPu=u=N7DjVeGAaK04mOWg@mail.gmail.com>
From: Andre Heider <a.heider@gmail.com>
Content-Language: en-US
In-Reply-To: <CAL_JsqLx6uwsjTHgcmqRKu32Mh4vJPu=u=N7DjVeGAaK04mOWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12.05.26 1:55 PM, Rob Herring wrote:
> On Tue, May 12, 2026 at 1:51 AM Andre Heider <a.heider@gmail.com> wrote:
>>
>> On 12.05.26 4:28 AM, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>>> - [High] Potential overvoltage risk for the W25Q64FW SPI NOR flash via the 'buck4_3v3' supply.
>>> - [Low] The unit-address in the 'uboot' partition node name does not match the base address in its 'reg' property.
>>> --
>>>
>>> commit 470f9c74bd3cfec41ed69dd8c4e22535a7e8164f
>>> Author: Andre Heider <a.heider@gmail.com>
>>>
>>> riscv: dts: spacemit: k1-musepi-pro: enable QSPI and add SPI NOR
>>>
>>> This commit adds the QSPI controller node and describes the attached
>>> SPI NOR flash. It also provides a corresponding vendor flash partition
>>> layout.
>>>
>>>> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
>>>> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
>>>> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
>>>
>>> [ ... ]
>>>
>>>> @@ -166,7 +166,7 @@ buck3_1v8: buck3 {
>>>>                               regulator-always-on;
>>>>                       };
>>>>
>>>> -                    buck4 {
>>>> +                    buck4_3v3: buck4 {
>>>>                               regulator-min-microvolt = <500000>;
>>>>                               regulator-max-microvolt = <3300000>;
>>>>                               regulator-ramp-delay = <5000>;
>>>
>>> [ ... ]
>>>
>>>> @@ -249,6 +249,47 @@ dldo7 {
>>>>       };
>>>>    };
>>>>
>>>> +&qspi {
>>>> +    pinctrl-names = "default";
>>>> +    pinctrl-0 = <&qspi_cfg>;
>>>> +    status = "okay";
>>>> +
>>>> +    flash@0 {
>>>> +            compatible = "jedec,spi-nor";
>>>> +            reg = <0>;
>>>> +            spi-max-frequency = <26500000>;
>>>> +            spi-rx-bus-width = <4>;
>>>> +            spi-tx-bus-width = <4>;
>>>> +            vcc-supply = <&buck4_3v3>; /* QSPI_VCC1833 */
>>>
>>> The commit message notes this flash is a Winbond W25Q64FWSSAQ, which is a
>>> strict 1.8V part. Could this vcc-supply assignment cause hardware damage?
>>>
>>> The buck4 regulator has a maximum voltage of 3.3V. If the regulator defaults
>>> to 3.3V or is configured to 3.3V dynamically, it exceeds the absolute maximum
>>> ratings for the 1.8V W25Q series flash.
>>
>> As per the comment, there's a the non controllable regulator QSPI_VCC1833 in between.
>> k1-milkv-jupiter.dts matches in this regard.
>> I'll keep it unchanged unless someone has an idea how to express that in a better way.
> 
> That's what we have fixed-regulator binding for. It can take an input supply.

Yeah, I was just trying to avoid the "non controllable" comment with a request to get rid of it ;)
But I guess if I have a consumer that's fine.

Note that dtbs_check passes, AFAICT sashiko is the only instance noticing it.

Thanks,
Andre
