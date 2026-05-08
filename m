Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FED3AEF43
	for <sashiko@lists.linux.dev>; Fri,  8 May 2026 23:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778282102; cv=none; b=s47ZlNnK/o2Fu0cCl9/OAq9u8oOWH9qsqB1SKQqPs5rrFIjsiP4ciB+R+LSNMkTw9ztpJBz3GJjzns5enThl+DSMfQNI0jDEuBVpInVpNjXkrYfDagvzpAW/b0RdDDSjIRrVEFx0kMgsaJkZAjI8Y6JcDb26ZvHHaLRVqXJW0aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778282102; c=relaxed/simple;
	bh=GslUWQjb8lXkQkGCJR/2h5EObENy9MfwkOELfgp45lI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVVxuVGLX1tP7NLU+hvwH1Lu416AcI2yD92eMil10qcN600t9g+gG/dOQ18L6chphB4nu15sJExeSBwbFikV4J1milNRNn7DNjwqTjfA36Qe+uHOOaUGF1ee6P8rUC5/G8fscHPiCPLv00vAzG4JgrN7lSycWKAlnF2w2jWjYEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ru/q5BLV; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ru/q5BLV"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2f03d6cf77bso2831487eec.0
        for <sashiko@lists.linux.dev>; Fri, 08 May 2026 16:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778282100; x=1778886900; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PNKvSvnTe54+R1mDdjWe1QaVI/I11fgI7tYYbJpAvOw=;
        b=Ru/q5BLVGxKuSAx33IxNjgD61sbprXo9YMjlDE67u+70IiQzfz6CmJDvFMqWNkdDW5
         RG/49Pch6Jr4qTp9+GfYi8y7NQtTKE/Kbr8Js9UTXSvAiH7JG2wlJbL6YcZ01iDIBOUg
         AWnavrJ/l/nOfstuZhIxyhWPrCaEbGIfmrgSReHDYp1C2WxF2WnndGMKSwAywbTOrhcF
         7XUcUNeia3S7qZoeVHEJuezAZh7XB6SgQp3KGA8H57D+nNlCfNm4oWdeoxvMUCi9xbma
         EYQLpv7sFyQ8yV2KMemFnvgswPJNZp4Ff9XsLS0ZeLkcDiGkwx/MylT92YSQCuH1q3rU
         yoRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778282100; x=1778886900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNKvSvnTe54+R1mDdjWe1QaVI/I11fgI7tYYbJpAvOw=;
        b=hWhaXj1IehQwvEW+dpKVZct62k5ERXkSa3TyfE4hdxE0M1i2O3IvxKLVI+cBwRjBWn
         KzJRVCNlAuTfpGL1Q7CtEl10h2k8J1WrIAadMUAVro+9gOYkNrhcEgwcScYrzXYply0W
         +QLIBFuydSchbGPNMQw2Bka0omFVLtB5J6YTIBALSQHSz9fSue/LI7I0hb+q/+HSH/vU
         cOFIR/mL8Z9iGlhohQWtRqsrHHHAkYC5cEzjVA4ebzarsKcDk8+hQn4Q1tmug3TzLtt5
         xeLCp0XJLXeGOAE6Gj4nBTtRDnNgJt4bur8erpO3CCcjI8xrpYEBEH8HwJ7gmGTw/B19
         pCLg==
X-Gm-Message-State: AOJu0YxSXXxGrmqfLYSG9U5Eg56jcDMbFVlx3FwrC5ToUkkdLhafHcYP
	qdOUbQrnXhZyUZ7zEg84NCgs+gs5/5g3Hneu/TU3KTkf60MFgC3kY7Pg8dksTA==
X-Gm-Gg: Acq92OGOg1yCGj77i3/oa6t3GraxnZ7Jb7VoEIsi3fhieOV7HHzOr1TewEoHnd0nZLe
	PFA14mrwc22o+NWBoIsBC26M7Da6Cza6ucxX4zG6ppc76G5OyiddCHe5cYaV86JDdCtrh72kr0V
	nYPj7N3/kteep+LXhuO7bfvpphte+XkNs/tmAhpCv+xhW1ak/oRKwLsWQ4uKRwSVUs/Xd3k9bsn
	v6waX7XKl3dIs/wVCNlaAr69fB0KlXU656FyM+OwUqjSJorrf6Iar2Yjwbn/p2ZAJ2j7qmpb678
	FBich2tijW+B4lbK2pH5TRedilrhn7CLeUiDv8xs2gzZHe6OmDclb0DmFVZHOWzK2+6eW7Z51Gz
	yxPSif09lJ1JG/2vCy2ZXORwZAli8/o02LlWGEomfPcnF/0kjcFr63/prpoizpEpnrGB+s5awjX
	SIllmkUCIB1dXCGwUityvw6+P9YGfcW2834ErGCaf7GBUbwIBd06IHaebigdryQeqS
X-Received: by 2002:a05:7301:3d1a:b0:2d9:6f2f:9f6f with SMTP id 5a478bee46e88-2f54ae73308mr6156339eec.24.1778282099627;
        Fri, 08 May 2026 16:14:59 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:852e:ebf3:8de1:32e1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d3047sm4897230eec.10.2026.05.08.16.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 16:14:58 -0700 (PDT)
Date: Fri, 8 May 2026 16:14:55 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: sashiko@lists.linux.dev
Cc: Harald Judt <h.judt@gmx.at>, linux-input@vger.kernel.org
Subject: Re: [PATCH RESEND 2] HID: Add force feedback support for Speedlink
 Cougar Vibration Flightstick
Message-ID: <af5tJlRJr_GFTjVH@google.com>
References: <b3bfa73b-0547-45f9-b6ae-f28815e6c632@gmx.at>
 <20260508225130.C6D33C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508225130.C6D33C2BCB0@smtp.kernel.org>

On Fri, May 08, 2026 at 10:51:30PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] Race condition in force feedback initialization leading to a NULL pointer dereference.
> - [High] Ignoring the return value of `gembird_joy_init()` causes a NULL pointer dereference when user-space interacts with the event device after an initialization failure.
> - [High] Non-monotonic magnitude scaling logic severely breaks force feedback functionality.
> - [Medium] Memory leak of the `gembird_joy_device` state structure upon device disconnect.
> --
> 
> commit f9141496ab06cd22000d2487bbb234d7e91931b5
> Author: Harald Judt <h.judt@gmx.at>
> 
> HID: Add force feedback support for Gembird based joystick
> 
> This commit adds force feedback (rumble) support for the SpeedLink Cougar
> Vibration Flightstick (SL-6630) joystick, which uses a Gembird controller.
> 
> > diff --git a/drivers/hid/hid-gembird-joy.c b/drivers/hid/hid-gembird-joy.c
> > new file mode 100644
> > index 0000000000000..5a5afa02f8407
> > --- /dev/null
> > +++ b/drivers/hid/hid-gembird-joy.c
> 
> [ ... ]
> 
> > +static int hid_gembird_joy_play(struct input_dev *dev, void *data,
> > +				struct ff_effect *effect)
> > +{
> > +	struct hid_device *hid = input_get_drvdata(dev);
> > +	struct gembird_joy_device *joy = data;
> > +	int strong, weak;
> > +
> > +	strong = effect->u.rumble.strong_magnitude;
> > +	weak = effect->u.rumble.weak_magnitude;
> 
> [ ... ]
> 
> > +	strong = (strong / 0xff) * 0x1f / 0xff;
> > +	weak = (weak / 0xff) * 0x1f / 0xff;
> > +
> > +	/* ... and to support the notions of strong vs weak rumble effects,
> > +	 * increase the magnitude for the strong rumble effect if it is below the
> > +	 * half of the maximum value, as the strong motor has the same strength as
> > +	 * the weak one. Likewise, decrease the magnitude for the weak effect.
> > +	 */
> > +	if (strong < 0x10 && !weak)         /* fftest effect 4 strong rumble */
> > +		strong *= 2;
> > +	else if (!strong && weak >= 0x10)   /* fftest effect 5 weak rumble */
> > +		weak /= 2;
> 
> Will this cause issues with non-monotonic force feedback behavior and
> unintended truncation?
> 
> Since the math uses integer division, any input value below 255 for strong
> or weak will evaluate to zero during the first division by 0xff.
> 
> Additionally, could the conditional scaling cause abrupt changes in rumble
> strength? For instance, if a game requests a strong magnitude that scales
> down to 15, it gets doubled to 30 because of the strong < 0x10 check.
> However, a slightly stronger requested magnitude that scales to 16 will
> remain 16, meaning an increase in requested strength results in a drop in
> physical rumble.
> 
> [ ... ]
> 
> > +static int gembird_joy_init(struct hid_device *hid)
> > +{
> 
> [ ... ]
> 
> > +		joy = kzalloc(sizeof(struct gembird_joy_device), GFP_KERNEL);
> > +		if (!joy)
> > +			return -ENOMEM;
> 
> Does this memory leak when the device is disconnected or the driver is
> unbound? The allocation doesn't use devm_kzalloc, and there isn't a
> remove callback to free it. The input_ff_create_memless teardown
> handles its own structures but not the user-provided private data.

Sashiko is wrong here.

> 
> > +
> > +		dev = hidinput->input;
> > +
> > +		set_bit(FF_RUMBLE, dev->ffbit);
> > +
> > +		error = input_ff_create_memless(dev, joy, hid_gembird_joy_play);
> > +		if (error) {
> > +			kfree(joy);
> > +			return error;
> > +		}
> > +
> > +		joy->report = report;
> 
> Is there a window here where an ioctl could trigger a NULL pointer
> dereference?
> 
> The device was already started earlier in gembird_joy_probe via
> hid_hw_start, so userspace can issue an EVIOCSFF ioctl as soon as
> input_ff_create_memless succeeds. If the ioctl triggers
> hid_gembird_joy_play before joy->report is assigned on the next line,
> the callback will try to access joy->report->field and dereference NULL.

Sashiko is wrong here as well. The device is not accessible from
userspace until it is registered.

> 
> [ ... ]
> 
> > +static int gembird_joy_probe(struct hid_device *hdev, const struct hid_device_id *id)
> > +{
> > +	int ret;
> > +
> > +	ret = hid_parse(hdev);
> > +	if (ret) {
> > +		hid_err(hdev, "parse failed\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT & ~HID_CONNECT_FF);
> > +	if (ret) {
> > +		hid_err(hdev, "hw start failed\n");
> > +		return ret;
> > +	}
> > +
> > +	gembird_joy_init(hdev);
> > +
> > +	return 0;
> > +}
> 
> What happens if gembird_joy_init fails?
> 
> If input_ff_create_memless returns an error, gembird_joy_init
> propagates it, but the return value is ignored here and probe succeeds.
> 
> Because set_bit(FF_RUMBLE, dev->ffbit) was already called, the device
> remains registered and advertises rumble support. If userspace then issues
> an EVIOCSFF ioctl, the kernel will allow it, which could lead to a panic
> when it tries to dereference the missing force feedback structures.
> 

Need to have error handling.

Thanks.

-- 
Dmitry
