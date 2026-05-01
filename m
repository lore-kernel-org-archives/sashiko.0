Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10DF34EF0F
	for <sashiko@lists.linux.dev>; Fri,  1 May 2026 06:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777615813; cv=none; b=snsA5pbotgPya/f/vD7gqI8irkETmAre/b9eBl0/AxmJgVSxZWY0U382xyFTx3znTcIXiwG0V4dxZiNAr8HfXtHG99XE7+gkq8fJIEfzPRRdlc2e03QPkgiwy3B1Ne0sTDPsIgWL40Xmmte05oSQxQTogfW92+fNK9QzmV90Jqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777615813; c=relaxed/simple;
	bh=0IEGdnMyXloVDYwY7JeZH7JaeWxKh5toccHc/9uu6n4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zr9d9OgHRlo+Ft5X0NAbAc0OWpQK/LNlv52J44JC+43fE/9VXTN/CYOCRaWS/p9UC0o89WXVCBsMzeSxDnme2kF47KzFOhFbhfQoddYvPxe+K70/GNE3ciTNOk9baCZ+W4pg+ZG1CKV4pc3wUYhrU+020I/Sbnh2uaEe+j15TkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6tIy5ON; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6tIy5ON"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12c726f46baso2741949c88.1
        for <sashiko@lists.linux.dev>; Thu, 30 Apr 2026 23:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777615812; x=1778220612; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2796HLH4hTEiV4bO0wRpxpNZp2wuKSRdSVogoyw9+qA=;
        b=L6tIy5ONfK55YmKKa6HxRw4XU4DGwU4ONcnK5H3/geHT03EaNpQ/vPdN4OCxto30vZ
         n6e8jgs7r+mbkgGfu3RCQkEIXmjM2GAvJqbzyemDKROPx7Ij09cPGAzY1MCC6iwxfU1R
         /bze4SVQPt2hjo+37l3u4u3EJGJt+yoK+ODiRduHUTbcGhO8nNziw8f+O0pZJdHj2ED/
         edPdSLrGYHs2h5auP4aIMvdSFGFfL48bgyoNu8RYJQGRkLxw+Jgdr/IlDKAXqDAry2kR
         lGFn9qvb92I3FbiI8w9I54doCW3sS1vacOYOQIgcsRJWxIH6ZG70Pvrtwj74vNQwKQBy
         pujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777615812; x=1778220612;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2796HLH4hTEiV4bO0wRpxpNZp2wuKSRdSVogoyw9+qA=;
        b=dS3qBKkc7GWGvgjEfTXII3pSfmLxaeZBYez/u8dboMyfCqeTdrOudqxy6mqV1Xbaa5
         iyDjhoA3sSL3TMfutfTt8brA5CSUaEjsuDXCaPrTFD5b7ApRZvemJi01V+reZoCxHwhf
         p8XnL1dhFZ0FmJei1XDskNeHHJGd56X0vlCSCzrR5DE936Js5JlVubz6mdlIzgUDxP1I
         wD8nQSB6kuAr8jVrsTswzVaq3Iad+bBoGGdf4qS6PFvZjurcYKrXsFRGCjwnh5+wB/0i
         j50uGxlQFSCMMntg0vVfSzm65Ucxb6ltZJu/Sanhc0fzEHdsB8GOfCepug+rBFfZoCZI
         48Iw==
X-Gm-Message-State: AOJu0YycWUOd0tKuQwPHHJzYc3BwrIdBIJogiFJfG2AboFex4eYcrAf1
	UZ770oa5Fr/rQAwgeYXesqCsDmtYIEIBUp1RQoPYRqqqCAXMGnDORJcE
X-Gm-Gg: AeBDievFp8GzZN3RbIbfpQs+yp7ceI2Lc/e3SCuLF8OBGqS8S3OYuHsvbTuxk/ON8OG
	W4tDkYpVE5r5XY2igpuN+6JNNnGLQDKWwrtpyw6US0ZadTk4yqh1ZJf4EbJivqWOUAjR74Zsctw
	yAkxN6P3GlUsecsWRfc9ObOY5j05CJJRlcEjMepLqkrjhUG0Nh7Qabxf65gRIo9xGQCGi/si7rg
	KAf4Vt8dflur67tJgOl3s1eMGPfCnY1f+nJLv94xGSOLNtcgMCmQcnVKxkJq/b66lJXd2MOKeZg
	KjwLPYCEQXCW8ybSg7hXfAVsaaM4S3zPjlWdi+LcxGmdvuyncWdDZK1u2MDA8VF3sneD+IkAIUD
	lPEqse/OPqPgoTEHf+Wo1Dqt3+Y65+lFrgBy26/E+6WwuQN2k/nWf9x8206P7UALEx0sz+pBGoN
	HiSfqdCTUBu8o63YIV8GNZoOrpMPWZuEHU67x7J01YGsautZgHyiZe58SYLq0nnO2HQMUZVZ/LW
	PwC5UApxTE=
X-Received: by 2002:a05:7022:f103:b0:12a:7181:2f1a with SMTP id a92af1059eb24-12df820966emr693688c88.5.1777615811721;
        Thu, 30 Apr 2026 23:10:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df81ec067sm2169548c88.0.2026.04.30.23.10.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 23:10:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <190bf39b-172d-4852-be86-1d7379d7d4aa@roeck-us.net>
Date: Thu, 30 Apr 2026 23:10:09 -0700
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>
Cc: sashiko@lists.linux.dev,
 =?UTF-8?Q?Nuno_S=C3=A1_via_B4_Relay?=
 <devnull+nuno.sa.analog.com@kernel.org>, linux-hwmon@vger.kernel.org
References: <20260430-ltc4283-support-v12-2-5dc9901f2567@analog.com>
 <20260430100343.45D31C2BCB3@smtp.kernel.org>
 <e2d14b68-7f3f-4bcb-8687-857e9335deb8@roeck-us.net> <afOH5xx29LGJ9yKH@nsa>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <afOH5xx29LGJ9yKH@nsa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/30/26 09:50, Nuno Sá wrote:
> On Thu, Apr 30, 2026 at 07:52:55AM -0700, Guenter Roeck wrote:
>> On 4/30/26 03:03, sashiko-bot@kernel.org wrote:
>> ...
>>>> +	id = (client->adapter->nr << 10) | client->addr;
>>>> +	adev = __devm_auxiliary_device_create(dev, KBUILD_MODNAME, "gpio",
>>>> +					      &st->gpio_mask, id);
>>>> +	if (!adev)
>>>> +		return dev_err_probe(dev, -ENODEV, "Failed to add GPIO device\n");
>>>
>>> Can this error path lead to a use-after-free?
>>>
>>> According to the I2C subsystem rules, debugfs entries attached to the
>>> client debugfs directory are only cleaned up during the client device
>>> removal function on driver unbind.
>>>
>>> If __devm_auxiliary_device_create() fails, the probe function aborts and
>>> the devres subsystem frees the st pointer. However, the debugfs files
>>> persist and retain operations that operate on the freed st pointer.
>>>
>>
>> AI taking everything literally :-(. I'll have to reword that guidance again
>> to include the probe error path.
>>
> 
> Yeah and it is annoying it always comes up with something that could
> have been said before. Even more annoying some of are legit issues :)
> 

Agreed, but I think it it is better that it finds the issues in multiple
rounds than not finding them at all. And I have to say it is very human -
the same happens to me as well when I do code reviews of complex patches.
A major difference is that, unlike me, AI doesn't get tired.

Guenter

