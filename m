Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D91E3B4EA3
	for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 13:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776344719; cv=pass; b=pRE/uZw31HN14lnsZqbbwaOLTHjdizO2zRfqrvSeZRCCgnElBEb20Tu2uItS5A5PI8yxLqhF9J6fPOeUq5S0gQAhVwfEeu7CMavzjMYO3Z4fGdG5o4r/GERWBCWjkdxDqCdUB/i7KWV6iNEJPg9sqYi85htV2YlqQ322YCFHlf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776344719; c=relaxed/simple;
	bh=SsOPNc4PG4suc15/ZkrHIELOjx8naGqvG9NY6bVyWe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PZVH62PEq0Nt/xH2/jHI0kjL7Czdrn9FEcpSD0WFTH6y1XCPSMlh2fHdeTLkFt1UjGARtGGaoDvpB/bJGAeEcb+t8nQ0q7M4MpNbVW+EIe4+faizxJ/+/QwB3y+BAGLfd6mbFJ9uLEY/elJGU4cNIi2h3S5vlA5eq1s7roPoC6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvKcW+Z2; arc=pass smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvKcW+Z2"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-47018d341f8so5288834b6e.3
        for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 06:05:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776344717; cv=none;
        d=google.com; s=arc-20240605;
        b=BGhx9zUCMDu/hC/6K3Avpqb20Hyf/UEwLUnn1P8VDF38NFB18A0kcUbz1fzLDjzz/C
         epTz7aV8/tmg1hIAFU+O/VmWcvNmIW65MN077fiC3qyxT0vCWo2mTZ9QofL4LwiBAcnp
         Yx4WQ7ZzR7aXbnK4HpHqgV71CExgbIJXps+4rbUPUMdE4voNoIfDBQILuH2YiwUc+gqh
         jC9CtHgksv1031uQYR51tRSV0Amep4eMksxAHc3rgdXStBRKotsuOnJqhyiVIdAFCUPz
         b23cA9x7lbdlZElborxi+j/Pa0olF4xjk5zwvWdpPk86xC81iOEoylyQkUsK//hRIkTf
         SnDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TxTRERAjxAXioUkoPmpUtJ4F8p4du/e5+8knu4FTJYg=;
        fh=LIRAVtNkvFebIJTmd3sXQRhyI56KpQNcHjhAac0CiC0=;
        b=Qqbgm86neQwn0QwPxlLNLEUgs8hTNS18DBk18uc6nh109w90PrQu2DWrkjW7cyhmLq
         kqfmlyy+eZUMbqMLjsm8getWP24E9UCBSCLOlWJFgbFZcucybyAqE4jfzkbOr0eD+QJ1
         AMU3Z2iMns4yMjotIS8Ey2rizTwy/1GzvxEihoyASon1OUKgvHugv7GW2IrExqjyeHPu
         kyY13lnDIJNG83bfy/rLAFK/LqFRvUzjhyeusm3TI85SlTRxzIz7j9AgllJ8fNRNlWjH
         q90tSLfjOdcqU5fmEDPkswkyf7yqJdOMu5wg22O3sPre3f3z88iiul2Y7neUuE9af/DR
         QCig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776344717; x=1776949517; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxTRERAjxAXioUkoPmpUtJ4F8p4du/e5+8knu4FTJYg=;
        b=fvKcW+Z2vFBqplcrZea2T6X4C9+EUeHfmIGc2lpdnTB7a99EuyePZWCme2Ql9HqHfB
         8pdbdmI5n98pqDpBBCXMb1mYTFKQMaFcNRBJ8KhN+VYMzf0plCppVy34XBxeX/m5j6t4
         0UIac8aZ9R2oT3SdnlJlY53Oe++uGG2ZpFNtP5/ibi8nbwKJhpgwM5Frsh4EUeo+JQGo
         XJetD9rpe+XCluK1PXfV19e3XkgG30RBSkgBj7rbRjc/aXfQSOLSpXO/5k6Morcd7Hkb
         BMcEYzIRyUzErw0e1oqevKqXYncujBxwXCRYaXROfJenNWqHDT/x3KH5yvDFJodMpGhd
         A63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776344717; x=1776949517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TxTRERAjxAXioUkoPmpUtJ4F8p4du/e5+8knu4FTJYg=;
        b=SWYSFJt2L8rz0bFtyQyADj8OO5a8gXP2HSnjqZYE8raaUt/J21tNXMsNRsh4sYdKp6
         M6hEUQQdLc4lAbnz8q2Qg2d9rkUpKfDxju4p9iYVDjMQRayFKZMVyZ36PxA9XklAu6Vj
         MX3dXir9FeqJRnD3KFWZIdHaPaTiXlZLypuiKipoyspX6wcPdcQ5PPokaANJ2HXKvyYG
         koOmdg5d1jeRl7U244M2gvIyH+VjOzLkTvD3hoPqBd3CcBtQTwtiRi8R+k5XvGctgXyK
         cYeSA3V/VPJjT70lViHpFWyiHmGVzdBpAEVOREOVodGbxP/BmP5jTSwcu4mlr5y9MdSI
         e8Eg==
X-Gm-Message-State: AOJu0YxBUA55EQd5+d+47s9CuCOKjo327P8MCUy2ML20Vvw1pxvJgAOy
	4hKMHdyJdQCBaedQK4lnV9JTvN7wXsFMpmzorz0ejOWFrSW9lYx3roxpgpOj8C6D9bBhFEt1u+V
	F0Ds3CADitleW/A6QdAZdZYJsojwl2Gp7A+pD
X-Gm-Gg: AeBDiev84rTU+mQPuNHRYWKdQJI4Z0kU5ZnUJwNFJDayNlIVduS1s1Gv704EAVmcbM7
	H7JeBVpjuaurIov+Xdhb6ek0J07VxEk2ybckc0L4w5PGczFb8u5J3cX4VilZrd/ZgDcHf0HhCQF
	WtwkErAx2QipeETMu8Gvp+o4FgZvTh9KZIE+tOiOr3+7LdBcue/RUj3aBXIbg7tUE/oGTlCZll3
	KydNAAwbBMQoAjuw579ABnFXeJ3Jm7kA/LVWo48ZJTKJm0ABiGUDEL1Rp0VRc1kj1duOjao40+v
	YXjlpG4wsFKqHXLTFDyIPQWBZptvztdAVJkbQX4InusQzI/bYJeLqkXkEpDebLHYW8pCT2zDOVJ
	5AHzbLsJLULymQP51Wi8c3TOk1oa9
X-Received: by 2002:a05:6808:5293:b0:468:776:1e9e with SMTP id
 5614622812f47-4789e4298d6mr13014056b6e.16.1776344716721; Thu, 16 Apr 2026
 06:05:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260416091754.310-3-hanguidong02@gmail.com> <20260416122131.A220FC2BCAF@smtp.kernel.org>
In-Reply-To: <20260416122131.A220FC2BCAF@smtp.kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Thu, 16 Apr 2026 21:05:05 +0800
X-Gm-Features: AQROBzDFKGM1KrvS_5SNFUMSqLNhAf_XLT5a0wHFM6sFxCbpM9gxR5yAp3YRFUg
Message-ID: <CALbr=LY+pid1TGvMydd-K8CnTzX7EB25+z_BBYyBpOn3EEu62w@mail.gmail.com>
Subject: Re: [PATCH 3/3] hwmon: (adm1031) Serialize update rate changes
To: sashiko@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 8:21=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 1 potential issue(s):
> - [High] Missing I2C error handling leads to hardware register corruption=
 and state desynchronization.

Thanks for the review.

I will look into the I2C error handling, but I cannot confirm the
exact fix just yet. If there is an issue, I will send a new patch to
resolve it.

Again, this is a pre-existing issue with the current codebase, not
something introduced by this patch.

> --
>
> commit ffbce3cc3043a4bfb1c8f7ba4a9010b9c8a23c2c
> Author: Gui-Dong Han <hanguidong02@gmail.com>
>
> hwmon: (adm1031) Serialize update rate changes
>
> This commit expands the locked section in update_interval_store() to cove=
r
> the hardware register read-modify-write sequence and the software state
> update. This ensures the hardware updates and cached state updates occur
> together.
>
> > diff --git a/drivers/hwmon/adm1031.c b/drivers/hwmon/adm1031.c
> > index 887fba9ea149f..a46db83471f2c 100644
> > --- a/drivers/hwmon/adm1031.c
> > +++ b/drivers/hwmon/adm1031.c
> [ ... ]
> > @@ -897,13 +897,14 @@ static ssize_t update_interval_store(struct devic=
e *dev,
> >       }
> >       /* if not found, we point to the last entry (lowest update interv=
al) */
> >
> > +     mutex_lock(&data->update_lock);
> > +
> >       /* set the new update rate while preserving other settings */
> >       reg =3D adm1031_read_value(client, ADM1031_REG_FAN_FILTER);
>
> Could the truncation of the error code lead to register corruption?
>
> Looking at adm1031_read_value(), it returns a u8:
>
> static inline u8 adm1031_read_value(struct i2c_client *client, u8 reg)
> {
>         return i2c_smbus_read_byte_data(client, reg);
> }
>
> If i2c_smbus_read_byte_data() returns a negative error code like -EIO, it=
 gets
> silently truncated to an 8-bit value (like 0xFB). This garbage value is t=
hen
> masked, modified, and written back to the register.
>
> >       reg &=3D ~ADM1031_UPDATE_RATE_MASK;
> >       reg |=3D i << ADM1031_UPDATE_RATE_SHIFT;
> >       adm1031_write_value(client, ADM1031_REG_FAN_FILTER, reg);
>
> Does ignoring the return value of adm1031_write_value() leave the softwar=
e
> and hardware states desynchronized?
>
> If the I2C write fails, data->update_interval is updated anyway, meaning
> the cached software state no longer matches the actual hardware state
> despite the expanded lock.
>
> > -     mutex_lock(&data->update_lock);
> >       data->update_interval =3D update_intervals[i];
> >       mutex_unlock(&data->update_lock);
> >
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260416091754.31=
0-1-hanguidong02@gmail.com?part=3D3
