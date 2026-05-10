Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7783164BA
	for <sashiko@lists.linux.dev>; Sun, 10 May 2026 19:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778440314; cv=none; b=jowQy2NTH6rebkefqKRdmD7jcobxkv1w/F87/6BkdCGpWR6nrilM2WdvyhdICqiRYDzJHyeJjFSPp06if9ZDllSWVMtpXXogCA0VOlwJAVDu0TbFHqUqJBx2ppZLdqv3W7Aohls6k4AxP+KRgWKWdluvgmHBfjgu+Gab3SIePbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778440314; c=relaxed/simple;
	bh=AyGz9so4c6OwRNB0n9cDDWEbXteFpW8uza+zO1Fw3XE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bWCT8REDdQ02VrCX+r0Wr+KwuDw18wYrI1hWua44+wSp3jrxOtEE5H/3YmmxdP2BQDgdOiWzA9awNHRjYrD+vRsGTv/W5iLYOYUiJThjpkMS9WDQCzKiLSBhtBkolzrb3v0PdaoJr3T4PWo/kyvnolifsnkS0iT/T6f49F/Vqm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L5mTmqN9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5mTmqN9"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488ba840146so31493785e9.1
        for <sashiko@lists.linux.dev>; Sun, 10 May 2026 12:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778440312; x=1779045112; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqXXwGhWAIu7FOeb/7si1xrgwWH1dKQB5oTnVjCGc+c=;
        b=L5mTmqN9aApqRwh8Ukiyce/K2RG38RBM6QYab7q35iK7sjxB9mN3+UvGVpkiJmfluI
         ajUAHd5Dr/eTQoGhiBhBhW63XNukmM4bKpH48W/3PZz+xMVYItRTIAKgMsi85uo0Y+EZ
         lSq4Dnbm+KrL9E+r7NtzadlTRz5gJOHGmKp8m15tXsbRjyr4fVRvdXMbD7e/vf470K+Q
         2X+dnQgu9sPP400xeQ7dcVU1wbU3vDyyJKwSszeCxI7KFSb6yES9QoLFhwrfBXTHXAYA
         KyLdQgt3yElNVYO8HMid7UNxFyrpa+o+DYLlNw1ECUlaL2n1Oc2mkoPcUVJtxcUa0b0i
         vBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778440312; x=1779045112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iqXXwGhWAIu7FOeb/7si1xrgwWH1dKQB5oTnVjCGc+c=;
        b=SVeq94tQ8ywd1tKyMVEy5VOeSV15l4KxdpcTHotJ7EzZVrW145zJvXb6Y/pd1VarIo
         dRSKYnTSC9tbUV1VTP0Sx67Zcm2TyLWG9hxzNweLJMr0gjWU85HIioQcT+4V6iEpAFqC
         9+RKaPgGwgS6VPv2UrF8d6Tj8rh93uiItjuxDMIpzUeyeqwhWmIp2fNWfDfVWmQBk6uc
         d3KFbr7EHZlO0k2bUjPa/LCgeMlttlbF4cKtk8VzngdwLmq4WKQxm2+gGA2G6WlGqS72
         rg5q4meTxCz8E5tKQMyEEnN4u2zPuxRcDRwheH2etIW+2YtCjlOpUnvS9ojdL4LpV9Mo
         LkuQ==
X-Gm-Message-State: AOJu0Yy8gZaHNirNXHpos5Jn6XeH82KxyASZnQvDEIXVcZqpSOAV4TS8
	VqNCePCG9UrezoxPYNPwGkcIJiU096MWDFmSpyH0RkD/6SMuYoITkO+V86s8aw==
X-Gm-Gg: Acq92OHS+pX76SaPvFi3IbFlBrCXkwRqdvyDzpvHbyOdm39grxJ3TuKjhGgZQ71FC5c
	1qAngfyTj3KZ2xoUxrxjYZ5dkYLXeAHeikabtcWWHWM1eFa0P3aUG3FwpQAd0OOqmWymtvMY5yc
	SdPnolguqcnqTbVl9/uTPZw7GGggmuAs5x9Kpi0Ar3WuEh48WLA2GpUUG+L2qZ2kYpBddfS/UvL
	q4PKk73WEWAxnoCVhNcyZcaS+/qRVkYSALvD/s2sdKHKSIG9eKvnz3R/jE7jfDGz7m+yww2w6j+
	+8cR9Rs6TYAIhcI4Js5DeKj4CK/Am1tbwkTdB6asyAa366iCsPyxJo06PxB+q7eislOM0lPvhEK
	LruhwWpjoqoloj6uTKSahwM8TqGzYKTqu067BQOFBOsUTePw2mEtO9YQgdGpWC60hJ0dfEXu2Va
	pUM+bWv4stBglbW726Bxrwd3WXdgIbG1Ft6F+3b6y9kUTkZGhxJsGhsSfm241B1uHR04/NFfmM3
	5OgSnKqIRDURkX12g==
X-Received: by 2002:a05:600c:c166:b0:48e:6f39:f7be with SMTP id 5b1f17b1804b1-48e6f39f7d2mr125053585e9.10.1778440311754;
        Sun, 10 May 2026 12:11:51 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491da03a7sm20304842f8f.33.2026.05.10.12.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 12:11:51 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: sashiko@lists.linux.dev
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 conor+dt@kernel.org
Subject:
 Re: [PATCH v2 1/8] clk: sunxi-ng: de2: Fix Display Engine 3.3 definitions
Date: Sun, 10 May 2026 21:11:50 +0200
Message-ID: <2WzKBHuPSreDENZ3eIUvdg@gmail.com>
In-Reply-To: <20260509194402.EB552C2BCB2@smtp.kernel.org>
References:
 <20260509190015.79086-2-jernej.skrabec@siol.net>
 <20260509194402.EB552C2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 9. maj 2026 ob 21:44:02 Srednjeevropski poletni =C4=8Das je sas=
hiko-bot@kernel.org napisal(a):
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The new DE33 clock definitions omit the bus clocks for MIXER1 an=
d WB, leaving their bus interfaces unclocked and breaking hardware support.
> --
>=20
> commit 7e5df4616faf2d32c9447b44291572215aac8a17
> Author: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> clk: sunxi-ng: de2: Fix Display Engine 3.3 definitions
>=20
> This commit fixes the Display Engine 3.3 resets and clocks to match
> the vendor driver, as the positions of clocks and resets changed in
> version 3.3.
>=20
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-n=
g/ccu-sun8i-de2.c
> > index a6cd0f988859d..6ec6c0dc4c261 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
>=20
> [ ... ]
>=20
> > @@ -54,6 +61,9 @@ static SUNXI_CCU_M(wb_div_a83_clk, "wb-div", "pll-de"=
, 0x0c, 8, 4,
> >  static SUNXI_CCU_M(rot_div_a83_clk, "rot-div", "pll-de", 0x0c, 0x0c, 4,
> >  		   CLK_SET_RATE_PARENT);
> > =20
> > +static SUNXI_CCU_GATE(bus_mixer0_h616_clk, "bus-mixer0", "bus-de",
> > +		      0x08, BIT(0), 0);
> > +
>=20
> Will this omission cause a regression for mixer1 and wb?

No, I should explain in commit message that there is only one bus clock,
shared among mixer0, mixer1 and wb. CLK_BUS_MIXER0 is used for all
cores.

>=20
> It looks like the bus clocks for mixer1 (BIT(1)) and wb (BIT(4)) at regis=
ter
> offset 0x08 are missing here.
>=20
> Since RST_MIXER1 was previously mapped to 0x08 BIT(1), the DRM driver
> deasserting that reset was inadvertently enabling the DE33 bus clock for
> mixer1.
>=20
> Now that RST_MIXER1 is correctly moved to 0x00, will accessing the
> unclocked MIXER1 or WB hardware blocks cause a hard system hang due to MM=
IO
> access failures?

There are no such issues, as hardware testing showed. Old code worked by lu=
ck.

Best regards,
Jernej

>=20
> [ ... ]
>=20
> > @@ -147,6 +163,17 @@ static struct clk_hw_onecell_data sun50i_a64_de2_h=
w_clks =3D {
> >  	.num	=3D CLK_NUMBER_WITH_ROT,
> >  };
> > =20
> > +static struct clk_hw_onecell_data sun50i_h616_de33_hw_clks =3D {
> > +	.hws	=3D {
> > +		[CLK_MIXER0]		=3D &mixer0_h616_clk.common.hw,
> > +		[CLK_MIXER1]		=3D &mixer1_h616_clk.common.hw,
> > +		[CLK_WB]		=3D &wb_h616_clk.common.hw,
> > +
> > +		[CLK_BUS_MIXER0]	=3D &bus_mixer0_h616_clk.common.hw,
>=20
> Similarly, should the bus clocks for mixer1 and wb be populated in this
> array so the DRM driver can properly request and enable them?
>=20
> > +	},
> > +	.num	=3D CLK_NUMBER_WITHOUT_ROT,
> > +};
>=20
>=20




