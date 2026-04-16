Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90561DBB3A
	for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 14:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776349974; cv=pass; b=HDYdlTgcCctiNY6CK0orPBDpuKpdJHRn2luDlFDwzpnI6DJOnh8YC0P9/FephnKShirNvrfjjwIbkuvNenRjwqZqFzeIfcH+7+Ks7PAaekl2igstFVhbx9EpalVjDf4MyVIhw67YWc1Crbv8Ffo1xkS6XTDybVTHvEWwN2pHqh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776349974; c=relaxed/simple;
	bh=54nY/T3OJvGmk4vpg9uL+b60fvRutLVfEfpTplkPi1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j6xPGGtIbwh6tza7gn75TrUs1c8q3etGQUWKJTfRRwFyYFiWF6fRa0872xrBlfPGUYt0xrrzcwwW9RXXVR5b59ogSJAM/18zVZkgD7B1xBzlzvEJJtn7otLNNX44BOOG4va8OsrlDBc1DVnfayRXt+FYBy+/qBe5oAKyb7EkP1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOZSs/ni; arc=pass smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOZSs/ni"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7d7ebe11bffso6702961a34.0
        for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 07:32:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776349971; cv=none;
        d=google.com; s=arc-20240605;
        b=LHZR4f9b6hC7id3H9ib99mYLb0AvqThMac22iEwnZTGkD5I4RMHvO+AYNheuPb9kSW
         6QP4rznCdCHFAqpnLtZyX5umoPQM0u3AVRCP1KPHz9YiaB8TejhrFo2uMCqCnjjbxrus
         c/ftctIUpkj29qQ7zQJDyMMqX6BYLRe78JgB8LwadYEppdd/F4XQMQny6NFwFEEMGlyA
         jvM60Fx2QcHBNCmuFFS2yBHJ8Ol9IDohYr7Xo8YC/8NM2JFamegfl3AMvmmSY/ky48Cq
         kkOOS+cOCud2i7lV16OZ8MjqJ1kpka+bNNIvj+VnVteXR+95dFu3eLAsQO7SyrWGr1Bu
         1jvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i0ztQZ6dxvg2w7yWD7M7B9Qv4AHUbexyfoq42YT+dZI=;
        fh=z8Mhzfp7cwpv0T3pZfHQJ+k1A4NlLfyLRTNztMqk6j0=;
        b=G3siNEgUrVW73fK0Hvn820lPkA/SqdH7/jIGRrRtfEvpvYnVraAhN9FITaKIvgf1E9
         mLS2zEMG00SHR+MZsj/fMKuLh33eu5CcgTdnS3y1MYuaYUgvw7p3r87yrBQvvIVaJWwx
         0U8PYE48pKnmRboneBxxHOgw774l7Z8GWbB24P4aHGTiJIeeDpC0Cy+uR2BOrmO108J6
         0Z87VLL/fT8/cd9AGiyO2d3sKH1gvkUTAytAqTXYiUmyooUD0ZzE2s/dRoiSaWaAyc/5
         wl1looBqm3DIBClgoA5Odxjasam0cPEessm6MKIymICCZl5gySLDKba7UBpQ5irZ5t7+
         6dFg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776349971; x=1776954771; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i0ztQZ6dxvg2w7yWD7M7B9Qv4AHUbexyfoq42YT+dZI=;
        b=HOZSs/niRNC2tcmx910RCYZwwnJA+YsvU5l7mB02om27Wozr5Q0vsmsjAo5i/PA5hr
         4lnGoFtREtg5yqMbtw7IiV5Zy4IRE3/St3TIJM89FCkEzz7/beDdWGHOyP6BMQu2rQ6W
         yY4jztDcmbktohEiYbYpXCovjZM4fmTlqPbxkJ2F1+fGhNcjvoWWFEemohIskj1UX762
         DdaS50mcIaKi9GbJ92M9jugQdRJQGOUPYfvF5z5XM7MxUPjgVXJoAX6QETbTtANm7C/+
         yHkdv5jLkXrfbNbyT6RG2U/MA1qBAxjNZ7hohmWjGEJjH9MMJUpHqbmTSlTA1EKbcAdc
         Y9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776349971; x=1776954771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i0ztQZ6dxvg2w7yWD7M7B9Qv4AHUbexyfoq42YT+dZI=;
        b=iZ0+NwA2IIeSyE2VuFnHfgwtOUeGDpRK2tXgX3C3Sz8Rrik0LG/sh028AaaaW3Rle0
         7fAFXmCM8D/pRpW385p1wT4tzGcI5rCxvys2KJuwgSWQddIF0Ct0EnAK5MfuA3mEDk69
         L/fmhV3I6sk+YpR/FJzIEAz/LkLIVKy6xivihjzza7JbRZcQtCX4PZsw8M0Q+EjUKK1f
         6ggfHW8wR6tDvWwSx1KsqTAeR4W14IdyxarHkhtXG7GIkWfuTzPEgi6MGzASaWRFP5mc
         +P+xyqIBKew0+bWroRK6oYaTLqcL4LWh9K1FppK1zB1iVLA3NsmmWRZEH2XwOFHj84ay
         65sg==
X-Gm-Message-State: AOJu0Yxxnf/7D3Nhs6vhvsSjDU2N0iXVlqXx0QTsVIzOf8IZ4viv/LzZ
	qmHqf1RzFbuEu6u9vFo1anX83oomxVUWsRztRTv9MW62mdkxdEDCmGbExVZSFTx734+31XASZZt
	ABatb3JUY6i7J1/tUjqVxN9e+eKtCqTg=
X-Gm-Gg: AeBDieu5H7CjFI83CohOsP6WtQWIiDXcniZJpm/R1cfXRuuTcO6KCetdZ9Pk8n+e9CX
	sFx/9S/ceukP0SHfU2xTU76H4EfRyXH71P9MTF39MDrB98dMSVtaPWpKa9exIpXlMk21OcLL9xh
	q91kx4SnfKDkGfvfSyWF2rOwf/DTipbXLXB/7dTF0JZ7yJ13O+sXlTzAMPyw2gtrLutDq2WKf0G
	bgGWqjGnc8rz2y8cy4gGsNRwsZEODBo/BlTGlCY29TBagGMkgxhKVx1cihvXYYShALlDa3qPk83
	Ozjscm8Y9Oll/vgKKa8znXkiTci2aLL0BocDietQd5Aqi0hdrblKxih79OmJTGoZQNWe7XbRqH0
	EJwva4LSgijq3J0+CBYb1WVAlYwyt
X-Received: by 2002:a05:6808:6787:b0:467:272e:886 with SMTP id
 5614622812f47-4789e91dc16mr13297083b6e.26.1776349971370; Thu, 16 Apr 2026
 07:32:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260416091754.310-3-hanguidong02@gmail.com> <20260416122131.A220FC2BCAF@smtp.kernel.org>
 <CALbr=LY+pid1TGvMydd-K8CnTzX7EB25+z_BBYyBpOn3EEu62w@mail.gmail.com> <5dc159b7-326b-43ff-a2fa-4bc50a03ebde@roeck-us.net>
In-Reply-To: <5dc159b7-326b-43ff-a2fa-4bc50a03ebde@roeck-us.net>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Thu, 16 Apr 2026 22:32:40 +0800
X-Gm-Features: AQROBzDmu0jR-UwnLvlp4Z6cnzslZ3snx9jHgqJMPwQWXXd2XDD_GDiJAIszyGw
Message-ID: <CALbr=LaRYkY2MrPtfw0YatfnOokhPiwRpQ9cO9VCtAb7vSvKGw@mail.gmail.com>
Subject: Re: [PATCH 3/3] hwmon: (adm1031) Serialize update rate changes
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko@lists.linux.dev, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 10:05=E2=80=AFPM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On Thu, Apr 16, 2026 at 09:05:05PM +0800, Gui-Dong Han wrote:
> > On Thu, Apr 16, 2026 at 8:21=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> > >
> > > Sashiko AI review found 1 potential issue(s):
> > > - [High] Missing I2C error handling leads to hardware register corrup=
tion and state desynchronization.
> >
> > Thanks for the review.
> >
> > I will look into the I2C error handling, but I cannot confirm the
> > exact fix just yet. If there is an issue, I will send a new patch to
> > resolve it.
> >
> > Again, this is a pre-existing issue with the current codebase, not
> > something introduced by this patch.
> >
>
> FWIW, that happens a lot. The AI is surprisingly good at finding all
> those old problems. Personally I'd prefer to convert all the old drivers
> to the with_info hwmon API - that alone solves most of the locking
> problems. Unfortunately I don't have enough time to do that.
> The latest Claude/Gemini models actually do it quite well with the
> appropriate prompts, but it still needs mnaual verification.

Sounds good. I might give the with_info conversion a try. Since it
would be my first time, I expect to hit a few roadblocks, so it
probably won't be a quick process.

>
> Either case, for me it only makes sense to touch those old drivers if
> all their problems are fixed. This driver is a good example: Ignoring
> I2C errors is much worse than its locking issues.

Understood. If you prefer to drop this series and wait for a complete
rewrite, that's completely fine. Otherwise, if you think these simple
fixes are still useful in the meantime, feel free to apply them.

>
> Also, please note that you can often use guard() or scoped_guard()
> to add lock-protection to a function.

Thanks for the tip. I will use them in future patches.

Thanks.

>
> Thanks,
> Guenter
>
> > > --
> > >
> > > commit ffbce3cc3043a4bfb1c8f7ba4a9010b9c8a23c2c
> > > Author: Gui-Dong Han <hanguidong02@gmail.com>
> > >
> > > hwmon: (adm1031) Serialize update rate changes
> > >
> > > This commit expands the locked section in update_interval_store() to =
cover
> > > the hardware register read-modify-write sequence and the software sta=
te
> > > update. This ensures the hardware updates and cached state updates oc=
cur
> > > together.
> > >
> > > > diff --git a/drivers/hwmon/adm1031.c b/drivers/hwmon/adm1031.c
> > > > index 887fba9ea149f..a46db83471f2c 100644
> > > > --- a/drivers/hwmon/adm1031.c
> > > > +++ b/drivers/hwmon/adm1031.c
> > > [ ... ]
> > > > @@ -897,13 +897,14 @@ static ssize_t update_interval_store(struct d=
evice *dev,
> > > >       }
> > > >       /* if not found, we point to the last entry (lowest update in=
terval) */
> > > >
> > > > +     mutex_lock(&data->update_lock);
> > > > +
> > > >       /* set the new update rate while preserving other settings */
> > > >       reg =3D adm1031_read_value(client, ADM1031_REG_FAN_FILTER);
> > >
> > > Could the truncation of the error code lead to register corruption?
> > >
> > > Looking at adm1031_read_value(), it returns a u8:
> > >
> > > static inline u8 adm1031_read_value(struct i2c_client *client, u8 reg=
)
> > > {
> > >         return i2c_smbus_read_byte_data(client, reg);
> > > }
> > >
> > > If i2c_smbus_read_byte_data() returns a negative error code like -EIO=
, it gets
> > > silently truncated to an 8-bit value (like 0xFB). This garbage value =
is then
> > > masked, modified, and written back to the register.
> > >
> > > >       reg &=3D ~ADM1031_UPDATE_RATE_MASK;
> > > >       reg |=3D i << ADM1031_UPDATE_RATE_SHIFT;
> > > >       adm1031_write_value(client, ADM1031_REG_FAN_FILTER, reg);
> > >
> > > Does ignoring the return value of adm1031_write_value() leave the sof=
tware
> > > and hardware states desynchronized?
> > >
> > > If the I2C write fails, data->update_interval is updated anyway, mean=
ing
> > > the cached software state no longer matches the actual hardware state
> > > despite the expanded lock.
> > >
> > > > -     mutex_lock(&data->update_lock);
> > > >       data->update_interval =3D update_intervals[i];
> > > >       mutex_unlock(&data->update_lock);
> > > >
> > >
> > > --
> > > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2026041609175=
4.310-1-hanguidong02@gmail.com?part=3D3
> >
