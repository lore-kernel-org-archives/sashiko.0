Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053CF2E2852
	for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 13:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776345757; cv=pass; b=n8bTcIQ3Jm4VOuVO0RL5Pm4vjhgYujTe65BQhA4VGtvm33aQKWDMmBmDGziokvaZ1FueKadE3cFYriTSFdJ2dEu+c+QJxI8yene7GwvuWxe71OU9hB7WDmG5yBOBmF/voFVPmLAE124Q2ywRTQ03C9rrL4XTX8BOqYf4a5qhltM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776345757; c=relaxed/simple;
	bh=f3Z+4BHqD6MeOvKeK8Q6R3+N7O5qpXneON+iSIaOqzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f3y5Nsdz1hQM/nIgdXyaF2roDD5EfenQSB9KEgUlM3tVokyRmc9nkIdYxKQ8wBCPiH4s0elsy+TlxdKh+gBK1OIZ0hp5jOTxPXzI1+Gtume8OajlMaUEfPdFsr7TnKRFo6OGu3ghlNtNsbrxFot5YCbiMrPWuqNUmvP5nGzlPNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jLGpgjAj; arc=pass smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLGpgjAj"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-471618e20a5so4114467b6e.1
        for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 06:22:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776345755; cv=none;
        d=google.com; s=arc-20240605;
        b=hspeLrBXB2WAisRFJWDt4PiifUj9mqC5+3WhFj+xtZ2Zc6laiw/q1HeOjlbu6s2+/R
         tugvz/njfvsnIAIXR357n7rB5mGXbAMZ5lY8ud9UCpaO8a5FbYNgiGpICUm+D4d6IrPw
         6hSNmUIUjM2rN8K+3N5AvWJrvH70AWvdeqpZLl2AcPOdcJMP0lpNJ7OeHSxNFXnC0Jt+
         VfydONz3WrRQWpMXNFodFM1B6gpcQ9FN2BT3+WTNTJTTbO5rF9tHzlf4B2LpYJnYSBAd
         89P7y83b0C2OU09TK79tNh/rdYp0fR7b4WqHd6cUXz0KtfxdprEu9lmP5Yhi7XXCpcZC
         V5yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f3Z+4BHqD6MeOvKeK8Q6R3+N7O5qpXneON+iSIaOqzo=;
        fh=LIRAVtNkvFebIJTmd3sXQRhyI56KpQNcHjhAac0CiC0=;
        b=Ze8KJQL710ed8fY9sSz7zWtm3qvccVD1L4ChW+7WCppYctL2EBVHwdNaOYpcqRNQzJ
         E7lEiV6EfyBEIyW+KYavZn8Cttx9o/IcELktAz5MyjS+UizPeFI2Q7eKh9Q2wBrdHhnz
         EuHh9IEYWK69nvf1K8HZzn6AXcNQ9utyyC37Yt11hHqcJh5B2rxsI8byK4GHFGFicxzx
         P+WAczTQpkCZfI779n2l3Kwelmgbm0lK21NqKvdxifk5AAKcEV4ezFglyfgj1KmblFOj
         rPjKadCiXLhWrlui7Xjl+V+LypLrY4oNR6nEcwEoN7B/rdx/yrV489MUllq/vSATUmST
         qGSA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776345755; x=1776950555; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3Z+4BHqD6MeOvKeK8Q6R3+N7O5qpXneON+iSIaOqzo=;
        b=jLGpgjAjbZKf9gc0RmNRa4n4rvscVokMUBeZnpO3d0ypFY4xE+Yv5t+paR7s731TTk
         qKziKKckj+LfUgx4chGrM5Ix+1WlpWt5cahtuuwNsibQqVtPKZatQSxD+v7HRqA7nNVq
         mxWhSM0WzYgM/n4z2NT1NdcFulXhcqLGrSVvhQK5ubzCMJ4TE5gBup+EGcg4QPDF+WxM
         3dkF0Tps/fhfOjEMCTNsMBRs8vjTCpOxJFNaOqoIefo1TatBB98U8QbHTasQUA8KRwEa
         Zcizck2yEaI2U1yzVTSDBgT7y+z9BLfPLsd/MliJVYQ5jvYpEitwv/0AY1+ehEb0vVWd
         HSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776345755; x=1776950555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f3Z+4BHqD6MeOvKeK8Q6R3+N7O5qpXneON+iSIaOqzo=;
        b=grPfrcM1l2GK38HAwIjYLh4TMTj5HFe0BOgeVnrmQ2P0v/e7gx4GMIfOBYHoj2MZDB
         QSPYpVp84CSP2OBFIL6EPnnBtycd5hNFERyTNPtvImCgnM8yjhG/GVHUyMfcZNIIUBQS
         2wlE624hFoG3aCAq9HrE1IZnPXlMyDOP7Uws2xgFAsTd0AACnn5/lS1Fit5zUqnv7v8B
         5u1ONqaabB9RVTqsYsXdKzq5v0aY2GWdySI5XHzLo372CLqkMnS5uALmD9iexkuIu3hM
         /LG6VY99f7lh8TMGtuaZV6C9q3+6VOKb+6r4N4NgY+BKelB2gFr2ILorOF7CXYjCnKJ9
         fE+A==
X-Gm-Message-State: AOJu0Yzo1OU4hsZhdiErNjLnAo1qwptgfWUW/oHDD9LRxilGzQmm592v
	m/uVhFvChbyqjcAQg0BAqxyI+QHIwnOBd2HRuEPlbu+6OMvt3at2dOPdyo3gA3ZN41cnaKPqh4y
	LucEsktCpcyodSyiNP8wZZQAImHfgXXIQfU5z
X-Gm-Gg: AeBDies6pBEJ5IfCh1+UpGktWbt6yoNBeDQIY9t+A82/+kCS2ajXPtfDdsCFSXoJhiR
	Kkgy6ecYOgYNLIiaDw1qXRs+Eed9qHmifZJk77EmDBK9TN3g3ucMGFBR9T3JNuQ56kbW/iTgum/
	WVo+mQ5ZF8XUjfua+2JoUYxUygVAjJms+iSWJ74nOwdlZ79wh1wZvTY9KYhcUXfK6qPR8Odjmuu
	a2JCeKPxAZCU/kCScoCb/i514I47D0Vq5vu3z+UFW9vrzelj9bjAiLnm98avMpDOCiWqx8Qn6cV
	Uqu2YMCd5bBdT3rLEcyTIbG1YYwpwIUtMqbm9EvTM+3gbwjy78s0qTEO4m062IM/ZkP47YzdVDg
	BsDjcAdufyhDz6PRERQoBP57/8w8F
X-Received: by 2002:a05:6808:6a83:b0:45e:f443:dc3d with SMTP id
 5614622812f47-4789d04388emr13732748b6e.13.1776345754673; Thu, 16 Apr 2026
 06:22:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260416090752.97392-2-hanguidong02@gmail.com> <20260416114435.061DFC2BCB3@smtp.kernel.org>
In-Reply-To: <20260416114435.061DFC2BCB3@smtp.kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Thu, 16 Apr 2026 21:22:23 +0800
X-Gm-Features: AQROBzBoCcOhtuZ9hh_NvsyGiEh5G0MEM9h_zh9A6jMJHAtvEfEyHyfBlqaWoDM
Message-ID: <CALbr=Lb4v-eEh82eG-_BqESAWn6uaydzV5QEGeUpLwB6a=dg-g@mail.gmail.com>
Subject: Re: [PATCH 2/2] hwmon: (lm63) Add locking to avoid TOCTOU
To: sashiko@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 7:44=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 3 potential issue(s):
> - [High] Pre-existing Torn Read Race Condition in show_fan() causes massi=
ve fan speed spikes
> - [High] Pre-existing Uninitialized Cache Read in temp2_crit_hyst_store()=
 corrupts hardware thermal limits
> - [Medium] Incomplete Fix: Unaddressed TOCTOU Races in temp2_crit_hyst_sh=
ow() and show_lut_temp_hyst()

Thanks for the detailed review.

I will add the missing locks for show_fan() and the hysteresis show
functions in v2.

The potential uninitialized cache read in temp2_crit_hyst_store()
needs further investigation. If it is a bug, I will address it in a
separate patch, as it is a pre-existing issue unrelated to this
series.

> --
>
> commit 1233dd514546736dfbbf09561bf360360c5933ca
> Author: Gui-Dong Han <hanguidong02@gmail.com>
>
> hwmon: (lm63) Add locking to avoid TOCTOU
>
> This commit adds locking to show_pwm1() and show_temp11() to prevent
> TOCTOU races when reading multiple cached values. It also states that
> other functions in the driver were checked for similar issues.
>
> Link: https://lore.kernel.org/linux-hwmon/CALbr=3DLYJ_ehtp53HXEVkSpYoub+X=
YSTU8Rg=3Do1xxMJ8=3D5z8B-g@mail.gmail.com/
>
> > Check the other functions in the driver as well. Keep them unchanged
> > because they either do not access shared cached values multiple times
> > or already do so under lock.
>
> Is this description accurate?
>
> Looking at temp2_crit_hyst_show(), it calculates its value by reading
> both data->temp8[2] and data->temp2_crit_hyst. Similarly,
> show_lut_temp_hyst() reads data->temp8[attr->index] and
> data->lut_temp_hyst. Because neither function holds data->update_lock,
> can a concurrent cache update cause them to fetch a mixed snapshot (e.g.,=
 a
> newly updated base temperature but a stale hysteresis offset), resulting =
in
> corrupted absolute hysteresis values returned to userspace?
>
> Also, looking at show_fan(), it accesses data->fan[attr->index] without
> holding data->update_lock. In lm63_update_device(), data->fan[0] is
> populated via two separate non-atomic assignments. Can show_fan() read th=
e
> intermediate torn state where the MSB is still 0, causing the calculation
> (5400000 / reg) to report massive, incorrect fan speed spikes?
>
> Finally, in temp2_crit_hyst_store(), data is retrieved via
> dev_get_drvdata(dev) without calling lm63_update_device() to populate the
> cache. If a user writes to the sysfs node before any sensor read operatio=
n
> has occurred, data->temp8[2] will be 0. Does this cause the driver to
> calculate the relative hysteresis based on a critical temperature of 0
> degrees instead of the real thermal limit, corrupting the chip's thermal
> protection configuration when written to the hardware register?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260416090752.97=
392-1-hanguidong02@gmail.com?part=3D2
