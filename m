Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D039169AD2
	for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 13:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776345357; cv=pass; b=ui3loDngT+D/0vc2lRM+CzUZn9dzjwewuD8FcYb5MEwmVw6QouE4YYZINXOVOyp3zwJaxCpamGhLMwzsTbfIr80XTHFIpLrOSH5u3pPTHdp6e2MVyVBa8J3lHFUuPYPpUeozgnadGn99PjxI5xITfhqbWtHLyvE3lUIt3N8D7Jk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776345357; c=relaxed/simple;
	bh=RQ/nzNjGxdlPsgg0WN5PpATLVNP03uCuIwLlbSw2FgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bddloWkn93cbeICs1oyhBUMWwZUQbI2h7Eio1E+Ktlc+qKtgWl69LweUAXPqw/hwsKNqbjz7BibE4svP54u5OZqJJU7eJKrl+3eR3Dpn3lxmyW7+BWr5MEFcjkBgAswegjXkxWxWdQExD41q7IgsmzT+J0nu7MKNeqsHFB3XkA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEsG+KgZ; arc=pass smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEsG+KgZ"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-47018d341f8so5298630b6e.3
        for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 06:15:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776345355; cv=none;
        d=google.com; s=arc-20240605;
        b=eRLdx2XSRuO6K9eNphklihpPzrcV6+hOeLEhY0lxLoLguSthu9ER9RCxVpv9wzO7JI
         Ll2alCuYKwfsfiWm+dso2ZgBDT7ywhJmKTmWtxMA44NsF3wGL6FTjajZ7vopG3uWlRC6
         ZMh3kR7Vm1k4cqum4jhzWVQfF+KlyyuUrwOvo7SM02F/l51tz8KEhCx4EihGR+EJEalk
         ndK0OQAMicMZaNcT5m7evnUUE+GKGbZK1qplXIK82kwqoJyvMo6fhjbo1a6sgRWiTmUZ
         Y/GTKqODLKx2ckloiomIqxMNardWNU54HorMBNkOZM/yNxHx3h9x7BN9vAYxWHydTQBQ
         XHJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eNxy/oU7oyMIUDrrRH+z7VVC6MHx4Yy/gG9DvYfA+T0=;
        fh=LIRAVtNkvFebIJTmd3sXQRhyI56KpQNcHjhAac0CiC0=;
        b=d8r1R3b7RkdvmEowiYmFJNLtu0a+qSeLGeFmxUzdrrnzX+4rKKQ3Tmj/DxcibM/3ru
         Y3g70+kKIJLVCKBInYBCYFmWKfIKNyE6yXIk7nP39o+zCF+aiNW+HvwPpQg4nVK98vL3
         OuKdxhLJFz4D1PAEQMMHxhN5bTZsfYHiNNKahXVXB24yBItX2GCEmL1YblmaPC28VmOk
         qQUIcKXASxIH6gwtrVShFUoCgJAelxy9m9WSiWSgAtaZERKPtqWc1xdNxkBvjlVeUXqN
         nChKCNtO/Pf2YjH9aelavWOpV7q8A8rvDy8mYv3tkNt6TUXwZKTDSNr4pzOS7AXs2921
         PeVA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776345355; x=1776950155; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNxy/oU7oyMIUDrrRH+z7VVC6MHx4Yy/gG9DvYfA+T0=;
        b=SEsG+KgZse5Xht9OYXHoGkZpNn+Fb6LAH6ud0I5ItozkWzyAEy9k/wD8Ddnsl5pjMp
         Vp9kQgj3C8vLwUsQ/wkevqkMB6vqmDiHmnpL7MbSPcSKZXm6ccV4R5ugL9YVFQevbhit
         roFRVm9IoB4dS5rLEq/1WLbs0qB3mSErIrCMpgoke/kV6CdpCymAdMiZBDhMv9kW72Ju
         1sGxc7TcAhzERv/UBdGR8hZcwTZ/FCLqmvXEoZtwPfmiax26s/+E7loOmn44K2dGH/HS
         UrjrTXfEUtc4yiqyoKE053D5uUJ8onch1TeQwrz+Bpknm9UiaMiDumS4MltvUPyDcXCe
         G42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776345355; x=1776950155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eNxy/oU7oyMIUDrrRH+z7VVC6MHx4Yy/gG9DvYfA+T0=;
        b=Z30USSpAqcbsPiw0XWOSdav1c2Bi1Av/9gtvdHTa39JfeNdt6SOdgj7jt9y/WRC/1P
         V50iTMgxXm7GtTtBlAKMHEl/pGF9bd6kSppVzLg22Y4rmRSn1C0q/OUTqn3ZMbeTWYpj
         MLtUSFzxWEAYx0pm7mdw3T0ajIHNG3iMvcA0JByn3my0LPwlH8zxHBQNmYbNDGEFx+PC
         M67cwK9+Vhr2bSn1w3kme+t/1GRK9WnbiK4YErxsDG2utnWVORjcwqVqp75tBJ7piMYx
         zx9SDz+vAXdIuvLgQw3+xjWuZKFk1ezK6yYGOpRsIVd1FlPUDlB4aJzBlYTgRuqagrsO
         KoHg==
X-Gm-Message-State: AOJu0Yxj36AYvBXu9xJrttc6tyR3bSZJYB1hiBhwbnoQL1fSWQeBEZh0
	bHzSyVF008NVmnFuWSIYjpbJHPIfNKzo/AbvkdrRvvlP5UHzfaYojUp/pzziSad9GuABuVpxmnH
	gf6B/qUmt0kNwdOEc5W8lBK15w0IyPui/OCdE
X-Gm-Gg: AeBDieufUJ2brW96pRLI5bEfGngUtQzVOQt9htTGfxrX69jszXyVPeeNH6k/u5VW/5U
	3RqbMIYu/fPqJk1jqrUAVh2/Hjzawmk03xv8K19aLxm0OBEQM1okJ8fJSUUpe9TJWL/+jrQ393b
	DCy8/KgSI8MpftBWpKASbsGxHOw3Tw+eyI2tAYH4ao6xEBQLwqQi7P0ojHvU9ZJTUv0jmyK6Kr8
	qQ0JnT+llIMGeiTfLiemfkF1MaDFe8z6G5wXPBIpSXWn52jqrEnQLyOAoT3l/e7UsDJOhSaITY9
	09KWHBF4IWihoCzYaNNWwHVq8qnSjzqO3Wvq0ufEtxF5NXYz6T6DO1dIKGnFpFEQAds3XDgM6jO
	wPXhHLvZaLdvCYukMxvfl068jjih/Iq7l87pGbmE=
X-Received: by 2002:a05:6808:c168:b0:467:1f38:bc1a with SMTP id
 5614622812f47-4789d95209bmr12935100b6e.7.1776345355123; Thu, 16 Apr 2026
 06:15:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260416090752.97392-1-hanguidong02@gmail.com> <20260416104136.63F14C2BCB0@smtp.kernel.org>
In-Reply-To: <20260416104136.63F14C2BCB0@smtp.kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Thu, 16 Apr 2026 21:15:42 +0800
X-Gm-Features: AQROBzD_hzeE2Uyez9rAZ-m57cvFs7xG0KJvMe0ElfA13adQFTx8Hf3KB28IHg8
Message-ID: <CALbr=LZimkhj_R889nV5UxSjwNraB2reNgWF67_9j=r+g=2Rfw@mail.gmail.com>
Subject: Re: [PATCH 1/2] hwmon: (lm63) Convert macro to function to avoid TOCTOU
To: sashiko@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 6:41=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 2 potential issue(s):
> - [High] Incomplete TOCTOU fix allows compiler-induced divide-by-zero cra=
sh in `show_fan()`.
> - [Medium] Lockless sysfs read in `show_fan()` causes torn reads and viol=
ates hwmon subsystem locking guidelines.
> --
>
> commit ebc10731137639981842ea19f80f0b969db71842
> Author: Gui-Dong Han <hanguidong02@gmail.com>
>
> hwmon: (lm63) Convert macro to function to avoid TOCTOU
>
> The patch converts the FAN_FROM_REG macro to a static function
> fan_from_reg() to evaluate its argument only once, avoiding a TOCTOU
> race and potential divide-by-zero error.
>
> Link: https://lore.kernel.org/linux-hwmon/CALbr=3DLYJ_ehtp53HXEVkSpYoub+X=
YSTU8Rg=3Do1xxMJ8=3D5z8B-g@mail.gmail.com/
>
> > diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
> > index 035176a98ce9c..da132b267c584 100644
> > --- a/drivers/hwmon/lm63.c
> > +++ b/drivers/hwmon/lm63.c
> > @@ -109,8 +109,14 @@ static const unsigned short normal_i2c[] =3D { 0x1=
8, 0x4c, 0x4e, I2C_CLIENT_END };
> >   * adapted accordingly.
> >   */
> >
> > -#define FAN_FROM_REG(reg)    ((reg) =3D=3D 0xFFFC || (reg) =3D=3D 0 ? =
0 : \
> > -                              5400000 / (reg))
> > +static int fan_from_reg(int reg)
> > +{
> > +     if (reg =3D=3D 0xFFFC || reg =3D=3D 0)
> > +             return 0;
> > +
> > +     return 5400000 / reg;
> > +}
> > +
>
> [ ... ]
>
> > @@ -333,7 +339,7 @@ static ssize_t show_fan(struct device *dev, struct =
device_attribute *devattr,
> >  {
> >       struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devat=
tr);
> >       struct lm63_data *data =3D lm63_update_device(dev);
> > -     return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[attr->index]))=
;
> > +     return sprintf(buf, "%d\n", fan_from_reg(data->fan[attr->index]))=
;
>
> Since fan_from_reg() is a small static function, won't the compiler likel=
y
> inline it?
>
> If it gets inlined, couldn't the compiler optimize the code by reloading
> data->fan[attr->index] from memory multiple times (once for the 0 check, =
and
> again for the division)?

I am not an expert on compiler optimization. I consulted a few
different models and got mixed answers. Unlike a macro with a side
effect (like ++), an inlined function doesn't strictly force multiple
memory fetches, so it's a bit ambiguous.

>
> If lm63_update_device() concurrently writes to data->fan[0] in two non-at=
omic
> steps (where the first step can momentarily set the value to 0), and a re=
load
> happens exactly when the value is 0, could this still cause a divide-by-z=
ero
> panic?
>
> Note that the subsequent patch in the series ('hwmon: (lm63) Add locking
> to avoid TOCTOU') explicitly skips show_fan(), leaving this unfixed.
>
> Additionally, is it safe to read data->fan locklessly here?
>
> According to the hwmon subsystem guidelines, drivers must implement locki=
ng
> for attributes registered outside the core-serialized info API. Because t=
his
> driver registers its attributes using devm_hwmon_device_register_with_gro=
ups(),
> it should lock its attribute accesses.
>
> Since lm63_update_device() releases the update_lock before returning, and
> data->fan[0] is updated non-atomically in two steps, couldn't a concurren=
t
> sysfs read observe a partially updated 16-bit state?

Your point about data->fan[0] being updated non-atomically in two
steps is a very nice finding. This gives me a solid reason to just add
locking to show_fan() and fix the torn read properly.

>
> Could this torn read result in wildly inaccurate fan speed values being
> reported? The subsequent patch ('hwmon: (lm63) Add locking to avoid TOCTO=
U')
> fixes similar locking issues but explicitly omits show_fan().
>
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260416090752.97=
392-1-hanguidong02@gmail.com?part=3D1
