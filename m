Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27563019D6
	for <sashiko@lists.linux.dev>; Thu, 30 Apr 2026 16:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777567762; cv=none; b=MeIVu6MF/cdxX3YXkwdrGIJIIlRwf/dSapTUq3NjyQOXBm56cx9S0Hp7NKVF/uGKrpYODKOznu2ye6uqBvp6cgUfbmGPiyi0FXncBerNLuLQPW4Pon7OtUxKbdi+nthmTqnMhXZFhUmi3t9ZRiPNC86KTOd3nvSR3krxIjOa9wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777567762; c=relaxed/simple;
	bh=xlI1YYt+C5AukoPM6VJT+UNXPmiaBxUqPwpPIhZ6bAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZE1vCyzkC/6u0XYMMEImAR3wKaPVn/iioM8uH5JVj+cQHClS5Denh2IlAMvhOkCBJzJf1NJncYOx4S3lyXnUrZXFaZ0i2fYTZ5TFuhWQYjmIB/nN/Mz3FqxrGFqyOFD0DvAFDbLxBOkYIWaG5aLUwvmN2jq47hTByAnZQNfJ9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFt6fIza; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFt6fIza"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso8627425e9.0
        for <sashiko@lists.linux.dev>; Thu, 30 Apr 2026 09:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777567759; x=1778172559; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mJpcF6FDTN511t1R8pQD5mX83qkS5gNN+CK8VqgZ8eg=;
        b=GFt6fIzaCjacDNpnK1Jp5/XbEa17cXnU682s7JJNNm2sNu/iiVO97MVGs0T5JzQAwO
         qF/5NRQ3gBJAQcnhchJMquWaaEYPyXPjMvS6eUZQpxlxKKdqjbbQ4QhNMNg45j47PSEc
         T+Dcc9XzHqaYOffB9sCDaDwDsWRBH89St+zgbFLUbDSm0abomBfAtdcPzRSWI6f24RCU
         +8/pc+sXzTUjEKAUCO/wR7+7SapUPLF5ITh2qqPmxnUAW4kGK29QHyFo58y2agt6TETB
         yARl2byEK/lgNNP/54wP373imKTUvCfsuWUpR84KW7hu4EM7AHaT1L9/jdX5B8rlnj2f
         crbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777567759; x=1778172559;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJpcF6FDTN511t1R8pQD5mX83qkS5gNN+CK8VqgZ8eg=;
        b=ArfGf62nUrgwStUw+Beh29BN8dHvz/nMylzA30KdCEW5I7JS38N6VNM5LMxyhIs+mk
         vfS/FWRhGQb7M2YeLdLST7LgOvTlnOt9eraCTGd1N+HNwx9lZiF1pA44Jc04x8X1Zzfw
         0SaqNfJJ5hi+sImfmQsftWjGIa7Hyy53p+sb87mD5Qz0TgFY82Ht54KOSXZRC53+iIiu
         Sn4IaCPM8MgV3pQRHuEL9oaDtH4iqtT1xOtCyDQyp3ObNajwLiY6IjsGQaILV9MXoH36
         Ui4EfdKkSHPjRT21ZALWtDDY7dHHJARa/nEj+7lSMp3cIv77tgpCFqhkjPu3FTG08H2l
         LwEA==
X-Gm-Message-State: AOJu0YxsihadyArTK4FpAfJLXcfcCcSI0xG13sROdnsTx7VeVJT9/sJq
	JEwcOJJTvNdFhWqiwhe1n3pB8ac7HRpWBmHVcBWFz9T7we3a2FlUJP7A
X-Gm-Gg: AeBDiesz4a8A3V8kWaJ2Q05ByqHcq8GDM5BAhkfyP8v2erOSssz8VWFeoQMdjO8W+97
	Q5d7Aurh6EV8iQWdBhxzDOsj88vPQHVGpgZ3JA2wOBahEb48mvh+zJBfWSza9rJYKEqN8hJR+CK
	MRtJdyzs3n2+CwWOdiQBK4AhdtEafRNaxEjCp/P3a43fWBm+w0BwA41SeVW74K+z9puSMo0Yw7N
	mTPfB/vDcsDvuPSPQ9zp2vhhisv/9OU3XrIeiA7lTCnu+BWF6IXP9crAgy13rpatoqPSPHtwsSm
	e/nXIZ4LUSZ8x+3YEAvefUinMMXzy3Joz0FyLM64FB0qTE6FMnCiV1GXEGR63KjhMe4t9HrwwEM
	ZYYbEbe/OqB1lKQgZTfcS2XLQAYwtKuHQqeFsajCNaBQArmHRKM1TU920hFyumvHJfplYPeV7zG
	Z55/cZhIwl8JQOiR0bxCPrk0KePYFziXOzQFiC
X-Received: by 2002:a05:600c:4f81:b0:489:1c2d:211e with SMTP id 5b1f17b1804b1-48a83d62fc3mr54251775e9.5.1777567759058;
        Thu, 30 Apr 2026 09:49:19 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822c85a0sm73422565e9.12.2026.04.30.09.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 09:49:18 -0700 (PDT)
Date: Thu, 30 Apr 2026 17:50:11 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko@lists.linux.dev, 
	Nuno =?utf-8?B?U8Oh?= via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v12 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
Message-ID: <afOH5xx29LGJ9yKH@nsa>
References: <20260430-ltc4283-support-v12-2-5dc9901f2567@analog.com>
 <20260430100343.45D31C2BCB3@smtp.kernel.org>
 <e2d14b68-7f3f-4bcb-8687-857e9335deb8@roeck-us.net>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e2d14b68-7f3f-4bcb-8687-857e9335deb8@roeck-us.net>

On Thu, Apr 30, 2026 at 07:52:55AM -0700, Guenter Roeck wrote:
> On 4/30/26 03:03, sashiko-bot@kernel.org wrote:
> ...
> > > +	id = (client->adapter->nr << 10) | client->addr;
> > > +	adev = __devm_auxiliary_device_create(dev, KBUILD_MODNAME, "gpio",
> > > +					      &st->gpio_mask, id);
> > > +	if (!adev)
> > > +		return dev_err_probe(dev, -ENODEV, "Failed to add GPIO device\n");
> > 
> > Can this error path lead to a use-after-free?
> > 
> > According to the I2C subsystem rules, debugfs entries attached to the
> > client debugfs directory are only cleaned up during the client device
> > removal function on driver unbind.
> > 
> > If __devm_auxiliary_device_create() fails, the probe function aborts and
> > the devres subsystem frees the st pointer. However, the debugfs files
> > persist and retain operations that operate on the freed st pointer.
> > 
> 
> AI taking everything literally :-(. I'll have to reword that guidance again
> to include the probe error path.
> 

Yeah and it is annoying it always comes up with something that could
have been said before. Even more annoying some of are legit issues :)

- Nuno Sá

> Guenter
> 
