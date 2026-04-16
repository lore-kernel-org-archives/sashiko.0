Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FABA396B68
	for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 13:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776344559; cv=pass; b=PKqi1IEZTEzbcGOSHJpQ0I+V37/RnO1bb2v1sBItrf2styGrOCtwN6fFovwS84LwF7EEEHA+8V7n/X30BmTI3mqhd9RP9EJjedj56IHIeTeDQqhpQnP/0W6yIeE2QuCEX5LeP+aLEukpUlCobS+KkP98sqcbNGHMeRSvMB32C8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776344559; c=relaxed/simple;
	bh=BfQXFZ/HjdcyaSH/dFi13ajZQYKDRhVss+JCyz3jJu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RAbojWt2545Z8pD0fhIm0fVZwxoo2pXIj6TtfkSBe76dF9RAlt8WXA54MiqCYEUsdmQRibXKsm3QAyN1ysD2OMswCqd+2R7QWlesEqxb0tRihFghy+fNqBkJYbdLSY0PcDaIPvppKNeJhCe50Lt6Ocg9IKLwvx4fWEhniCcQsi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ff9UmEv3; arc=pass smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ff9UmEv3"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4233e152457so5805619fac.1
        for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 06:02:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776344557; cv=none;
        d=google.com; s=arc-20240605;
        b=CCdTYIm3pymAiowiAARnwpBqfr1F091rMmCLKi4vA5Ob+5/zyip73YLNLLixwJWIqz
         HXRUex+0jpz/UQN5Lh7i/SZ0oVIA6su7Y/uq+uSfUiWcQWdjuyPUL5jzyUYjLlk1GcSy
         Q10DV31EwEarl6SfchLbX5WnWE2rIUrJ1lD6mlQ8/HG2p6xq56WDQBqWTnRJSMGv7OCh
         zU/a8IJsKwrFv3PlUPKFEsKTZ5fsZvNHgJpFx1byQOx6jqZZwerSFMH4HCPFKOdKcIT4
         CPdGBRBhAfWS2U4Y+1J50vQnERIyCEBhuk434sy1nqsGtq6Xj67a743VH07ugzCupENN
         zSQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W9FpxBxwQfLvLwFkmMeMjlLjY4/9LE5fqelrbsenVAA=;
        fh=LIRAVtNkvFebIJTmd3sXQRhyI56KpQNcHjhAac0CiC0=;
        b=M+GOL7kJjWK/9ZYA9bH/j5f1QAyrOhzMRiFfONGJ5wp5iiiVUx1QqkCyJWfgRSkLGo
         s2MwaB3QfGQz26+VG5sY5sQ6tD8AwdcljnlDAd6CfBvE6HZM7ur8Slvrp+uLNmeWLBJE
         ZVPyOYMQwBa1+QJd7xDL0xMQwdLivMUVNwUgo8dM8qSO+qZUjwfG1saqh3ibXjqBRbWe
         CHR4QcfqUtgjo+YxwTNs65rs/kttlyveWa7ld3JJRvrN3JMaUGxdzLcmzpZ+SIIKndiH
         44wXYibNTZ5FPaVvozqRWUZgWLIi46fHOQ2bLX5Pc0TjApyVjzzcEAamf4lnsEntp6Xf
         o8xw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776344557; x=1776949357; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9FpxBxwQfLvLwFkmMeMjlLjY4/9LE5fqelrbsenVAA=;
        b=ff9UmEv3XWUBR5VrL9T0n53M/EqD70ufMh/80XhlX5meHzXbv0ksLeixdOya4rrRM+
         QNftNJLLoP1uARHnSCd83DMEB/HeSSKJUGpogev3AvXqJ5TH8bGid9FxTremP2Dl0ChU
         sUpw3jQwVuLGeMqn44XSluBFTz0ABLf3HQ6EacJgiUWmvnPsmLPX/VuEBeYnvFtWirC8
         epuY8vPQWa77GiMuvIv8tmxvRpdfFcXcQKUwOU8SPlzUCtAKrEzEPrXH1ligvVrFwHNj
         Vne9iSjBqTkLzRwpHu9gH+tFOZW1E5Hroy9lY34umA5KQI8ONhcH57rwJ0C6nENJAZTf
         yysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776344557; x=1776949357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W9FpxBxwQfLvLwFkmMeMjlLjY4/9LE5fqelrbsenVAA=;
        b=Tb6pBEdNM9Ek+q/v34+I+SaNudKlaH7CnkobgIPi3HEaHF08jGf/H0rFybUxrUKOAD
         opwyQQ8kvI2lQ9X6L87FlVAvY/AoAcfiqfIexuRSh0gti+fOwAf7JXdD0cobb1gV1Xwu
         VmJc3q7I9vrl4yfRm8mYuVHe3DXAlWa1q45M9oRwqS+Dc1aPfQxXqEr3CkS54pet9u0E
         cyxiz1yB4Z4/cPYka02wIiz+8Xj+KiMYDTLpP0dsVs5+d92XswpNB744r8OzX38HlNYs
         Uu+7f2GlrFA5+NCMbgNlaj7hJFymGz0hnD/QI2T1/rb3pLH0UH9dPN2+RQL1fGNVd0AL
         ljiQ==
X-Gm-Message-State: AOJu0Yzkl1q/Y1kfEykkjJOnAzSdQpIf10ftilMhrA00QE8rnNvjvbxy
	YZQhANH7Jb6wW/9czY9RrsXvcGfng2QzZpxD6nGeBCmlKnDFnLzBUnEMZVQG3xazE1ji/7GyEPR
	uKV1wjZZJixo755YfJvPdCe74tpqLRrvybnUx
X-Gm-Gg: AeBDiev98nLFPzkWrcXNwfT7HPqWIIFid+OgopJCJQLcNOKmE7ABEBsGA0pHzeADKV6
	glLwbrLwGLaONncr17/plx3D9mvwX4BUf0KgXPzN9ONw6BfRIPltdfNuPmXdazw1M0+kUfSlAKw
	hpvg4H14Bddouu3JUKb15jjZZLAu1paVUKIv2d0RPCfOQ621Ba22aCk1FmWSQ2w4k2XWI3WIUY1
	d4bcitolbuRQksRBY5Pwdja6Uj0zcz9G5h99fqxEhhz/3RJB8BtYbMT2IqigSao7J2ggGeg9+qc
	ThvsAS6Z4hM5U/9WqvCiawlcJF7deHkUjb0BLVE8ktOZy4fVU/6hFo0OTuPotjurYqwa69pf8yW
	GUksRWZXzjfxgRw1/Jt5Ub5qwzduZ
X-Received: by 2002:a05:6870:2b1a:b0:40a:605b:518a with SMTP id
 586e51a60fabf-423e108440amr14891269fac.27.1776344536584; Thu, 16 Apr 2026
 06:02:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260416091754.310-2-hanguidong02@gmail.com> <20260416115716.CBDAFC2BCAF@smtp.kernel.org>
In-Reply-To: <20260416115716.CBDAFC2BCAF@smtp.kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Thu, 16 Apr 2026 21:02:05 +0800
X-Gm-Features: AQROBzDhU4y7kpl2Cd-6gRhXM378oMdGfa9xdqKEsjcelqHCo_AnbsiZOd4Gmmc
Message-ID: <CALbr=LZjZ4t-FCafzSg-JDApz6F31EFXpXtwPXV3adBqM5SbSg@mail.gmail.com>
Subject: Re: [PATCH 2/3] hwmon: (adm1031) Hold lock while reading cached data
To: sashiko@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 7:57=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 2 potential issue(s):
> - [High] Store functions like fan_auto_channel_store() read uninitialized=
 cached values, which can silently disable hardware monitoring.
> - [High] auto_temp_max_store() corrupts the temp_max cache and causes reg=
ister desynchronization.

Thanks for the review.

The existing code here does look a bit weird, but I need to study the
driver more carefully to be certain. If there are indeed bugs, I will
address them in a new, separate patch.

Please note that these are pre-existing issues and were not introduced
by this patch.

> --
>
> commit 8f551aed0a746551e7fda3272d5c7e3fcaa2b090
> Author: Gui-Dong Han <hanguidong02@gmail.com>
>
> hwmon: (adm1031) Hold lock while reading cached data
>
> The patch addresses TOCTOU races by holding data->update_lock while
> accessing cached values in sysfs show and store functions.
>
> Link: https://lore.kernel.org/linux-hwmon/CALbr=3DLYJ_ehtp53HXEVkSpYoub+X=
YSTU8Rg=3Do1xxMJ8=3D5z8B-g@mail.gmail.com/
>
> > diff --git a/drivers/hwmon/adm1031.c b/drivers/hwmon/adm1031.c
> > index 0551f815233d9..887fba9ea149f 100644
> > --- a/drivers/hwmon/adm1031.c
> > +++ b/drivers/hwmon/adm1031.c
> > @@ -350,9 +350,8 @@ fan_auto_channel_store(struct device *dev, struct d=
evice_attribute *attr,
> >       if (ret)
> >               return ret;
> >
> > -     old_fan_mode =3D data->conf1;
> > -
> >       mutex_lock(&data->update_lock);
> > +     old_fan_mode =3D data->conf1;
>
> This is not a regression from this patch, but does this store function re=
ad
> uninitialized cached values if it is called before adm1031_update_device(=
)
> has populated them?
>
> The driver allocates its data structure with devm_kzalloc() during probe,
> initializing the cache variables (like data->conf1) to zero, but
> adm1031_update_device() is not called during probe to populate them.
>
> If a user writes to this sysfs attribute before any reads, the store
> function performs a read-modify-write using the zeroed data->conf1. When =
it
> writes data->conf1 back to the ADM1031_REG_CONF1 register, it clears the
> ADM1031_CONF1_MONITOR_ENABLE bit (0x01).
>
> Could this silently disable the chip's hardware monitoring and thermal
> protection?
>
> [ ... ]
>
> Additionally, there appears to be a separate pre-existing regression in
> auto_temp_max_store():
>
> drivers/hwmon/adm1031.c:auto_temp_max_store() {
>     ...
>         val =3D clamp_val(val, 0, 127000);
>         mutex_lock(&data->update_lock);
>         data->temp_max[nr] =3D AUTO_TEMP_MAX_TO_REG(val, data->auto_temp[=
nr],
>                                                   data->pwm[nr]);
>         adm1031_write_value(client, ADM1031_REG_AUTO_TEMP(nr),
>                             data->temp_max[nr]);
>         mutex_unlock(&data->update_lock);
>     ...
> }
>
> Does this corrupt the temp_max cache and cause register desynchronization=
?
>
> The calculated new automatic temperature limit is assigned to
> data->temp_max[nr] instead of data->auto_temp[nr], corrupting the cache
> used by temp_max_show().
>
> Because data->auto_temp[nr] is left stale, if auto_temp_min_store() is
> called before the cache expires, it will read the old data->auto_temp[nr]
> value and write it back to ADM1031_REG_AUTO_TEMP.
>
> Could this cause the hardware to silently revert the max temperature limi=
t
> just set by the user?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260416091754.31=
0-1-hanguidong02@gmail.com?part=3D2
