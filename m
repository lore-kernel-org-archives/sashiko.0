Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7D0217648
	for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 14:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776348357; cv=none; b=p+pGs5ZN+8c81Jd9yfxtXoXinlW76zr5Owk1Kd6fBUK+e3kWo/7vqzskbHsCe9VYaoxq29MCSHX5bcS6V2cxf5Cbiqa+yT/jyRLHTp8jKmbErbc3M7cmgncjzJZXPty5y4K8j61UGzb4+VKiPYws1nEY2Y9Ym5H36iAzwgrxyK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776348357; c=relaxed/simple;
	bh=HeKWnD0CSUO7NKUJYPWw33JqDmzeAx6+sBAdoKKcpXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gH+HbuQXNz4eg0vNkyucmi7KuIuRD+ML17c9zElApAuQBz3F34aJKEvq3QxHHLMkiiG2W+UeX4LLfd7oyLVi23OUurcVRzIaoOxX2o8zZPkECZwtOwWur01Ad6Qu1NWZenwNchqXAswMAnTQQPx99vydJFSfL3FDVJnj8RVgEH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHDn7lnp; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHDn7lnp"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1273349c56bso10920284c88.0
        for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 07:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776348355; x=1776953155; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NF4XE3Dt322/CscFddSXmPNGppZ6SKAWG8JxmJRyIIY=;
        b=IHDn7lnpJlbN2aDuccNv8WC93/BVdtkug7xbYNnPCURFUB4Jjky8svvchgEptQRy6f
         PNfLQ5ViboylKJgHzw+vLTqyzJtvvZ6QgeYqOF0Lold9YALTy1xvRfJShcUoQiGP3eZB
         7UFn9vUo+tgjWeI1cSsXzK5FpzBo9XeBwip0OxoWcseXPnycIcVulhrHdJu7ETOapf0y
         LzsNyqIIQ34YwF0Uwk0//nMbT5Cqsf4PoRGLQVQWcj74cgwhFMAe8w05V5ZwgFwNbtn6
         WflbOAk4OQoVzzHjaRzVTu6m1AjG7isj5S2WSoQr/ZO0Bm5Jx0smzsSL5jmIW6pW7RbB
         MyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776348355; x=1776953155;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NF4XE3Dt322/CscFddSXmPNGppZ6SKAWG8JxmJRyIIY=;
        b=F4azcFC2dvwoeTPGLWx2G9Zjpnj0mG87xFZm9n1ihFqkcOVP9+oPvN0Vy1tZFnrA++
         6UKNoL6lInq9UjpsMXigMnlORfhSOELzqsVzhxxXZD6aL1CFIviWKuNoZazmftx8XiYt
         srqLQiJy06mTZ80qixBDZdBpAScasHx5ZjAoFHfub+IixMrE42QsWQHkVu7jpRbu29B1
         d316xc9rpgaD3W4ZrbvAqbKJwNq5tNLr3cQ3bWjjasL7W26WQLNglGsfY0x9intV65oB
         vJGtflX7OLWfQTQRTmnWi/qcHDLgEjRi6Zg6eNv6+2XXm1IJFXy/TWrchF2cHuOrAzps
         bC3A==
X-Gm-Message-State: AOJu0YwY3ql2xGTagbTKkMBUIWMsy7M2nZJw70HxotTISJaqFdHdqL2I
	u5YB8KmIdMetAdJSLqE+38KQf8MMi57Qdo7bK69PNhGSjDcRIUQxLxbW9BrnUQ==
X-Gm-Gg: AeBDievr3nat7BYJtt8CACY7m8FMJo3yoc0oLwgIjMX78PemFET6JR4UN53AcSH9MrO
	0gmV09KW5hDaeuXOJud85opDn0S3074m0MCIEaMLQ8qAQSjkqYmbcmeAlpWTXeWK7cPa3UX7fve
	f3JXk9pDtrqqgCi4S8IXmNrZF7KSeg5nPN1hdYQ9HldTgfLV2/EuzhDDpsmcrTIT1w+wTUeCBum
	4tv6ppl0BxhplyfAfsE6JQ+bNlLUudzvxExM09S8WNRIIWwgOe01IEE4LL2Z74N6rb/4mRyhZp3
	hft/iIGtIzUntHPP58yJfC8oDFSx6PVC/tDxlmIAsv5shnx28WU7PyLzLtB95ko1C66/59qSYUq
	I7DX49P8bU/XLMdz6TyYETDSSDaajwK+numUT2UaWIPx7QmFOnCX7Cv/cTgAtZQ2cCOQvmVwBWz
	Qh51Tg66OqGcvSjBuh0MNbUPLrie14hZikbMx2z89GuXWkRVA=
X-Received: by 2002:a05:7300:dc88:b0:2d8:c484:6b6c with SMTP id 5a478bee46e88-2d8c4846f3cmr8619234eec.25.1776348354057;
        Thu, 16 Apr 2026 07:05:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8c10a688sm10085882eec.4.2026.04.16.07.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 07:05:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 16 Apr 2026 07:05:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: sashiko@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: (adm1031) Serialize update rate changes
Message-ID: <5dc159b7-326b-43ff-a2fa-4bc50a03ebde@roeck-us.net>
References: <20260416091754.310-3-hanguidong02@gmail.com>
 <20260416122131.A220FC2BCAF@smtp.kernel.org>
 <CALbr=LY+pid1TGvMydd-K8CnTzX7EB25+z_BBYyBpOn3EEu62w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALbr=LY+pid1TGvMydd-K8CnTzX7EB25+z_BBYyBpOn3EEu62w@mail.gmail.com>

On Thu, Apr 16, 2026 at 09:05:05PM +0800, Gui-Dong Han wrote:
> On Thu, Apr 16, 2026 at 8:21 PM <sashiko-bot@kernel.org> wrote:
> >
> > Sashiko AI review found 1 potential issue(s):
> > - [High] Missing I2C error handling leads to hardware register corruption and state desynchronization.
> 
> Thanks for the review.
> 
> I will look into the I2C error handling, but I cannot confirm the
> exact fix just yet. If there is an issue, I will send a new patch to
> resolve it.
> 
> Again, this is a pre-existing issue with the current codebase, not
> something introduced by this patch.
> 

FWIW, that happens a lot. The AI is surprisingly good at finding all
those old problems. Personally I'd prefer to convert all the old drivers
to the with_info hwmon API - that alone solves most of the locking
problems. Unfortunately I don't have enough time to do that.
The latest Claude/Gemini models actually do it quite well with the
appropriate prompts, but it still needs mnaual verification.

Either case, for me it only makes sense to touch those old drivers if
all their problems are fixed. This driver is a good example: Ignoring
I2C errors is much worse than its locking issues.

Also, please note that you can often use guard() or scoped_guard()
to add lock-protection to a function.

Thanks,
Guenter

> > --
> >
> > commit ffbce3cc3043a4bfb1c8f7ba4a9010b9c8a23c2c
> > Author: Gui-Dong Han <hanguidong02@gmail.com>
> >
> > hwmon: (adm1031) Serialize update rate changes
> >
> > This commit expands the locked section in update_interval_store() to cover
> > the hardware register read-modify-write sequence and the software state
> > update. This ensures the hardware updates and cached state updates occur
> > together.
> >
> > > diff --git a/drivers/hwmon/adm1031.c b/drivers/hwmon/adm1031.c
> > > index 887fba9ea149f..a46db83471f2c 100644
> > > --- a/drivers/hwmon/adm1031.c
> > > +++ b/drivers/hwmon/adm1031.c
> > [ ... ]
> > > @@ -897,13 +897,14 @@ static ssize_t update_interval_store(struct device *dev,
> > >       }
> > >       /* if not found, we point to the last entry (lowest update interval) */
> > >
> > > +     mutex_lock(&data->update_lock);
> > > +
> > >       /* set the new update rate while preserving other settings */
> > >       reg = adm1031_read_value(client, ADM1031_REG_FAN_FILTER);
> >
> > Could the truncation of the error code lead to register corruption?
> >
> > Looking at adm1031_read_value(), it returns a u8:
> >
> > static inline u8 adm1031_read_value(struct i2c_client *client, u8 reg)
> > {
> >         return i2c_smbus_read_byte_data(client, reg);
> > }
> >
> > If i2c_smbus_read_byte_data() returns a negative error code like -EIO, it gets
> > silently truncated to an 8-bit value (like 0xFB). This garbage value is then
> > masked, modified, and written back to the register.
> >
> > >       reg &= ~ADM1031_UPDATE_RATE_MASK;
> > >       reg |= i << ADM1031_UPDATE_RATE_SHIFT;
> > >       adm1031_write_value(client, ADM1031_REG_FAN_FILTER, reg);
> >
> > Does ignoring the return value of adm1031_write_value() leave the software
> > and hardware states desynchronized?
> >
> > If the I2C write fails, data->update_interval is updated anyway, meaning
> > the cached software state no longer matches the actual hardware state
> > despite the expanded lock.
> >
> > > -     mutex_lock(&data->update_lock);
> > >       data->update_interval = update_intervals[i];
> > >       mutex_unlock(&data->update_lock);
> > >
> >
> > --
> > Sashiko AI review · https://sashiko.dev/#/patchset/20260416091754.310-1-hanguidong02@gmail.com?part=3
> 
