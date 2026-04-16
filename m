Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EAB33B969
	for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 04:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776314946; cv=none; b=nT4PTjM+v00wscl3AGA1fR+oGYJDucmRIrpayrJ9folzfEhMtYiMLBfke6Xeg9BZ3kkFKKxHczp3gpKNMYY8m9My86WwKXDPCGUXb7RyM11BL4aVUHkElwiu2QY0B5a+qn9jqypp9Ntmj9Kp6sG89U63s2pLxpc8MYweA3piqi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776314946; c=relaxed/simple;
	bh=58a1ou5dTzlBCcmc8gPgcsCSwZyWrOcRK+6vEMo8G5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GZEUHZdOVRrsnZfOZz8YqBaMPXoxE2veVX+lkF46pCFcWktm28e2+CaARw9zB4+vULaNfUTfDWcXC3fDYgfuor+zm0fF17bfLJrae/h6veuq0Ry/L5kZy/4hNbBOKAeuf4o9cwbqcnDr6ImDEXqNo62m4gZ1sSeUSNKGoTRaHhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FcTdKWok; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FcTdKWok"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12c1fcce8f8so1215929c88.1
        for <sashiko@lists.linux.dev>; Wed, 15 Apr 2026 21:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776314943; x=1776919743; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=l5qZNIb399Xzo4308jp71ye0p5c2WwoKVKHEs2lDIQ4=;
        b=FcTdKWokRjJ+Oy6YoHwuP+Co5a3i/cDSUsbASQug2D1RPcH8ZYy/C0AQGIH6mFRiLP
         cg/MF4WK/vAqJnTPAqnIh1sC+JSVJcbilOfB42o5RWkSIgC2xaScMekRr8A45hRGUhoy
         xx436yhu54+NJwmYg+sj/D9lf97VV2lxv2TIFC7+GBEKIkXNyJmrYNX2eVW2RIc+2I4l
         yasgTXlQ11joLZZkUJyG8DiWzphM6CvBq5E35SYAvqJJ7S17roa5xP+JLcR92ZaX+iNI
         JmloM4UFNN7lF1StMdNqIWaL/zd89AanZ59DFUPfXISeHOiLIiZayD6gF9C29lQrsmZU
         bakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776314943; x=1776919743;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5qZNIb399Xzo4308jp71ye0p5c2WwoKVKHEs2lDIQ4=;
        b=ESvacl8G1479G+6OH2Qcr6//Z18NS+w6cM6MaVXMVDmySvvX0nltRVsmvjuRZjT8tb
         DL67voQlIxmsPz+wrvbVYiZb7+oDgZ0Uf8gyo+XlkCcNbTWUxwk6TQC+smkkJz42hYzv
         Bx/9l+yjrlXn+gJA3MJtu/F+2Ie56nQf+iB0AA7nf2v7NEa9sjzPrb4VucxWrac6j1Jj
         LFh9gCbbmR5Jda8QaYpQiPrU0PweNNKVQBEk/U+6R4ojQU7mKy6r1mi0IxNwWh7OaYAM
         R2brTtOmoIsR9SLtyboSHR5EUO/7Vh9kCraK8zsD/f3gblUmkzug9vKosJnaTDunoHeH
         57EQ==
X-Forwarded-Encrypted: i=1; AFNElJ9nkjfGtLECicHlzSJNQEDKry+7m/E/fJs2JfMycjrgj3sD+T6N0gYuC5GCp2M+ja6hTgYPWnlB@lists.linux.dev
X-Gm-Message-State: AOJu0YwEF4acrAiDcTeXOLqN0AktTuppFSzhcND3oKaoHhGOXsHKAFTN
	F0fZcl1rqei+eCdT+3CqQNmQ2qZjn0ril1MW9I6xFCK+wXEwus646ys2
X-Gm-Gg: AeBDieviZuJxlZyGprYScxB4beOQllgQ5fCIfSo9e5h2FZ9eBGrX01xvxDbxxOujGpv
	zU7ebR09Uv1Etog4ffwYzLKr9GzsghCRADFhOWzrhuZMSQqXVgAu40txaBqsojkLhzfmhlQ1/db
	AwpJLG9w0dM8i9Jvs+GV7aRQ60u0chYd71d4PsyVgy6o8f7GzhI1Ilc3IGfNQmJwXS5+1Rd6J+q
	oMTvYLZYwAUi0oUshEtHnOvhy6enUjM/Hdye4H9xCawzRam+8prRBJmAphZD0SyqdCUrbElPWVD
	ptaP2WYHWHB7w9Ctp5ikjfHSEWuZq6sg7v48k6lT87MN6JBBKp5KuwinLitz4j2+BSmNUV9GUPi
	nTxdf4x4sraiT7yq0XyJ3qDhYapoSZQbRRQUWQCdfIJHvEC8kPB7kOAhOO/edsNEByrRDT/Ja1m
	VbpfDW2z7UJqIt9WvvFAhhvM1+W9ztr6kSsuFC5fTsRye9EqrcX6yI31xuKuFbY9yvL2ktE2SKF
	Xb4jbao7sBdZEgO/8vueA==
X-Received: by 2002:a05:693c:2c92:b0:2df:7b88:a1b0 with SMTP id 5a478bee46e88-2df7b88a90cmr1341945eec.27.1776314943264;
        Wed, 15 Apr 2026 21:49:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8eb84673sm5905125eec.19.2026.04.15.21.49.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 21:49:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <49e4ae2a-85a0-44c9-99e6-dc38d5cd60cf@roeck-us.net>
Date: Wed, 15 Apr 2026 21:49:01 -0700
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (pmbus/max20830) add driver for max20830
To: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>,
 "sashiko@lists.linux.dev" <sashiko@lists.linux.dev>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <20260414-dev_max20830-v1-2-210d3f82c571@analog.com>
 <20260414045647.4AACCC19425@smtp.kernel.org>
 <69f893bd-bb38-439c-b7e3-30d17c6b8cd3@roeck-us.net>
 <PH0PR03MB635179B8E59E60DB994415A7F1222@PH0PR03MB6351.namprd03.prod.outlook.com>
 <e4a4c2a6-e757-49f8-8fbc-215a74c7a9b5@roeck-us.net>
 <PH0PR03MB6351026955AFF2D037BF0266F1232@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <PH0PR03MB6351026955AFF2D037BF0266F1232@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/26 20:04, Torreno, Alexis Czezar wrote:
>>>
>>> I may need to keep i2c_smbus_read_i2c_block_data. I'm testing this on
>>> an rpi4 and it seems i2c_smbus_read_block_data isn't supported by the
>> adapter.
>>>
>>
>> Odd. I can see that the bcm2835 controller driver sets
>> I2C_FUNC_SMBUS_EMUL but not I2C_FUNC_SMBUS_BLOCK_DATA. That
>> makes me wonder if the controller really does not support block reads. Any
>> chance you can try setting that flag in ./drivers/i2c/busses/i2c-bcm2835.c and
>> see what happens ?
>>
> 
> I tried using i2c_smbus_read_block_data, and here's some log messages
> 
> [ 6857.261998] max20830: adapter does NOT support I2C_FUNC_SMBUS_BLOCK_DATA
> [ 6857.262006] max20830: adapter supports I2C_FUNC_SMBUS_READ_I2C_BLOCK
> [ 6857.265228] max20830: i2c_block_data read 32 bytes: '        MAX20830'
> [ 6857.265648] max20830: smbus_block_data read 9 bytes: ''
> 
> i2c_smbus_read_i2c_block_data returns 32 for 32 bytes read
> and the buffer content is expected "MAX20830"
> 
> i2c_smbus_read_block_data returned 9 so I think it read the payload length of 1byte
> but no data beyond it, hence buffer = ''
> 

Ok, worth a try. The "correct" fix would be to implement support for the command
in the I2C controller driver, but that would be too much to ask for.

Ok to use i2c_smbus_read_i2c_block_data, but please add a comment describing
the reason, i.e., that this is to support drivers/controllers which don't support
i2c_smbus_read_block_data(). Also, please implement code to address the
differences: The first returned byte is the real length, so please check that.
Also, please fix the "Unsupported device" log to not print the first byte.

Thanks,
Guenter

