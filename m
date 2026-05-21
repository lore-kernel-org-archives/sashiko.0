Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BD9399CE4
	for <sashiko@lists.linux.dev>; Thu, 21 May 2026 07:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779348377; cv=pass; b=r2ve/Lx/YpjuUpRSD8OBEDi9pUBUftJuE5qZLVCjD/YDU97PaTx26FT1OJCbn4ew2LYXLup4r4UTZbTt9vVZRDnw8wk3jZDBokmv9TP8raiJmgEWi1BEIcN9BZVMn2NeZkb1iUzrveNkJfwpH2w0Y78nKD035Be8wYKjDRrYClw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779348377; c=relaxed/simple;
	bh=YDcx1Y0+zlRN1nWyttwEdWnkWzDunYKkzU5UZ8ogEHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nxl353C1hzk1Sb9ntZLvA2DSEOYk0miPWB+yl8jr02uHtPLTnhaCBgtJDAvB9e2He/y3ebqT+9rJ55ZiOl+5bAEWgTnVpehz9sIGbdsxpCJhhlI/rIt2drEM+/0tw5kYkMA54gtaeSiEpwEl1ECKB1ee/vtC1P1aISDWhequzKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UdfpXvzX; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UdfpXvzX"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2baef9f5ecdso46374945ad.1
        for <sashiko@lists.linux.dev>; Thu, 21 May 2026 00:26:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779348373; cv=none;
        d=google.com; s=arc-20240605;
        b=ZQxaM6Kn4pZe/kbeGv1aSPHTuPClAI+zBRCEUh5fe4hg+t+FDvr5RM8EmJlci9CdRy
         3kZlUFl6VwjBerrwAOBeoAJ3/jpPkTVyNY9hiCQf5qkzHykV9QAv5CGGRASyB0K3tT1o
         nHOmHTZF5uWwIxN13TNtjjZXoNj3Np+LC3YgumFQ9UhZ95cVzzvw5heJOQPVP/lEdWcA
         GCDRmu9D1CDKD5OZeLK3bbstTMamEy1LW6iZNhKTDeMfmSSYfbcNlXll4bynmS+vp/nq
         x/OKy7QvuHzNacsVcDSCOGN4+01HPmXGvhiJa6w37JJ8zmVrrdSIYf+EON7gHC3Urxgl
         dW8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lXbPb+/1MyUml7SUP3O01YVktPIbQ8L41vVAOmxyw2c=;
        fh=nL05CvD4dqbtPDgAq575KSl3hy3ym3HhUTyLkXAo3yU=;
        b=MQ46/kgqTuyOeA/FYazIUswV5LupnrGGrSGtuJvkeGj3Dvc72OmBxlHjpq0zQJ+31m
         l0PvrnUnWyg/x5CLzVzxx/+HvRcLAKSdQgZfrdoiCLbRPOCyRVSDc59xHrl/e/Z3hofT
         6o0zf4TCeTDnpZjf2MEa7s7lyQ4NZ2j2E3EteNSMTpAu5yfqZ9VHkaq9J2O/kDKRl4d7
         2hz8X1yZTb80Sb0tVDMIehwXAgM+jNJIReXgvxGJ+NwIrfzEaEkMBYTyF3M6/nV2W6KH
         yf0u4iXxFZIE4HhA+0yE5SA2CcbCIDC5drwwseomPwJ8dge7sffjmdWYqFLpR4WwLgCP
         xSfA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779348373; x=1779953173; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXbPb+/1MyUml7SUP3O01YVktPIbQ8L41vVAOmxyw2c=;
        b=UdfpXvzXRhjGDmywvVPVfzTFTe24M69zMk/U8GI97eY/nISKaR1/QsZqZX0Vd0jheh
         YelTjtf8wg2olhn/l2hehCXuu/QiJT0/GzbMmZLKGHbTImWrHaRYzb7FgmAiJf+0S7qd
         PAccsnDcwzHmmqoUb/sbUYloaRlg1ytyQY5ugQryDGKZotwWQ3WA0Rx/qIZ5jJbxhvgW
         JIgNqkrzHdBZsk1Usj8dlOjVDtP7wKMXiCFPuKhZHtxCYOW9FkYrV08IwPzc30Y6PfVN
         jYM9uyDftnkbeYBI78mey98QTOh25pvmVN4Bt+yxjnxmjum5Iy4mvtLILCp7AANNdH+/
         aOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779348373; x=1779953173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lXbPb+/1MyUml7SUP3O01YVktPIbQ8L41vVAOmxyw2c=;
        b=p5t4xqfPniiG4O/zkwtT59j9hSrOZTy1KBYck2fwIpK+AbkHYwHcizA+YPqskGorHT
         zVribJ2UdvGgb5y5yowwQDBver98gjahHCv0mYRpDxU4r6f9vD6/87I2jTg7fdPVT1qG
         UrFCqBfgSYBsuEpV/8ZRQQymhBSaRpA+LuKuPAu9QOECzCLSIYVa0TviZuc+guijtGWR
         3I9HbfB8Bt7m2bLUu0v54lvdhNgIU+szfWDq8hs+UwyKQ28qxJJLn3gwFb3vxVaLbIo9
         ZN+rRN32CLXx59SvqkmJEfgFuqG8gctFKFeV6Lhd3AzvWw6/vIdH5Tro+30K9CFWMS7Y
         XOlQ==
X-Gm-Message-State: AOJu0YyWlrEcJCA1FPMHZfkVA1sCYcFCInhcppZ5x33+d68J2Dm0rf4p
	F6zOpFkOWYcJk3O4FINnUfqityhWFPju4h18yO6C5mc+vlRVSjJm4mMBIWsZoNXllc6xm4Ayxa/
	f3pDUo7fjxoSHYZJuk8H6Pie2PH2Ud+UdlnFB
X-Gm-Gg: Acq92OGYDKaopdDbKW7Y7FKc96E6D6Q13MJ7fj8q+7rFZju+mtyW+VLkG7lV5D13sFY
	IdvIVnfVJD5EgAvCAB/4v62pwbZIsIjU5Ez9u6+6Xp3HHPpOM1AGIIE8NICXcZPpquOsGZxEpVm
	oqoTY7AB5PsEwS8qz3Fbyq88egE1UJVdFqHQjmS8oDoQObExUAT4mD9qlurwQjMXXqQ88a9/dXT
	cYFJzlaQ1JGyZaXxUvrkEHZNyamZnqfZdnt/4ZKk3xN3PAjMcvpnEw6clynCKB+1b2UaoiXol4e
	/nEnVUT5EJvxShACK/AHqb7VcPFWPDX6wJZl8gmREd2G7fVJ
X-Received: by 2002:a17:902:ce92:b0:2bc:eea4:83c3 with SMTP id
 d9443c01a7336-2bea337dcb9mr16838125ad.25.1779348373000; Thu, 21 May 2026
 00:26:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260510084303.122426-8-phucduc.bui@gmail.com> <20260511234758.6C022C2BCB0@smtp.kernel.org>
In-Reply-To: <20260511234758.6C022C2BCB0@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 21 May 2026 14:26:00 +0700
X-Gm-Features: AVHnY4JVOeDnjezg1KYm702bCERj-oBsD-Y1fM4Qrg16PXkHjwRlY3W_TbeGcO8
Message-ID: <CAABR9nHH2D-StaU8hMEnPmtZGoSbk0tO4H5YU+qL-TVmsEov_g@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] ASoC: renesas: fsi: refactor clock initialization
To: sashiko@lists.linux.dev
Cc: wsa+renesas@sang-engineering.com, krzk+dt@kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	Mark Brown <broonie@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

First of all, I appreciate receiving review comments from the AI bot.
I think it is quite helpful for learning and improving patches.

However, I have a few questions regarding the expected workflow:

1. I noticed that the bot reply only CCs a subset of the original recipient=
s.
    Is there a specific reason or convention behind that behavior?
2. When receiving review comments from the bot, is it generally
    expected that contributors reply to those comments?
3. If replying is recommended, should I keep the same CC list as the
    original patch submission, or only reply to the bot thread participants=
?

Sorry if these are basic questions. I just want to better understand the
usual mailing list workflow.

Best Regards,
Phuc

On Tue, May 12, 2026 at 6:47=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] The return value of `fsi_clk_init()` is ignored in `fsi_prob=
e()`, which breaks probe deferral and leads to a kernel panic from derefere=
ncing error pointers.
> --
>
> commit 055b3b167e655ece1592450b8baaea9abe771d10
> Author: bui duc phuc <phucduc.bui@gmail.com>
>
> ASoC: renesas: fsi: refactor clock initialization
>
> This commit moves fsi_clk_init() to probe and uses devm_clk_get_optional(=
)
> for optional clocks. It allows probe to succeed when optional clocks are
> missing, while set_rate() validates clock availability.
>
> > diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> > index 55a11f1fe8aa1..8c46d68069581 100644
> > --- a/sound/soc/renesas/fsi.c
> > +++ b/sound/soc/renesas/fsi.c
> [ ... ]
> > @@ -973,35 +983,42 @@ static int fsi_clk_set_rate_cpg(struct device *de=
v,
> >       return ret;
> >  }
> >
> > -static int fsi_clk_init(struct device *dev,
> > -                     struct fsi_priv *fsi,
> > -                     int xck,
> > -                     int ick,
> > -                     int div,
> > -                     int (*set_rate)(struct device *dev,
> > -                                     struct fsi_priv *fsi))
> > +static int fsi_clk_init(struct device *dev, struct fsi_priv *fsi)
> >  {
> [ ... ]
> >       clock->own =3D devm_clk_get(dev, NULL);
> >       if (IS_ERR(clock->own))
> >               return -EINVAL;
>
> Does returning -EINVAL here mask probe deferral? If devm_clk_get() return=
s
> -EPROBE_DEFER, returning -EINVAL will permanently fail the driver probe
> rather than deferring it.
>
> [ ... ]
> > @@ -1997,6 +2001,7 @@ static int fsi_probe(struct platform_device *pdev=
)
> >       fsi->running_streams =3D 0;
> >       fsi_port_info_init(fsi, &info.port_a);
> >       fsi_handler_init(fsi, &info.port_a);
> > +     fsi_clk_init(&pdev->dev, fsi);
>
> Is it safe to ignore the return value of fsi_clk_init() here?
>
> If devm_clk_get_optional() fails and returns an error pointer like
> -EPROBE_DEFER, those error pointers will be stored in the clock fields
> instead of NULL.
>
> Later, when fsi_clk_set_rate_external() checks if the clocks are missing:
>
>     if (!xck || !ick) {
>
> This check will pass because the error pointers are not NULL. The error
> pointers will then be passed to common clock framework APIs like
> clk_get_rate(), which will dereference them and cause a crash.
>
> Should the return value of fsi_clk_init() be checked and propagated?
>
> >       ret =3D fsi_stream_probe(fsi, &pdev->dev);
> >       if (ret < 0) {
> >               dev_err(&pdev->dev, "FSIA stream probe failed\n");
> > @@ -2011,6 +2016,7 @@ static int fsi_probe(struct platform_device *pdev=
)
> >       fsi->running_streams =3D 0;
> >       fsi_port_info_init(fsi, &info.port_b);
> >       fsi_handler_init(fsi, &info.port_b);
> > +     fsi_clk_init(&pdev->dev, fsi);
>
> Would the same return value check be needed here as well?
>
> >       ret =3D fsi_stream_probe(fsi, &pdev->dev);
> >       if (ret < 0) {
> >               dev_err(&pdev->dev, "FSIB stream probe failed\n");
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510084303.12=
2426-1-phucduc.bui@gmail.com?part=3D7
