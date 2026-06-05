Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E587368269
	for <sashiko@lists.linux.dev>; Fri,  5 Jun 2026 12:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662423; cv=pass; b=Ou+cRhzGRUSIo34G2AWughjYJVr4lgdcU9tUzVRtcGFMdq2Cr6LRhNfIpyJtrj+8UtGmF/sMbuabCLFwusq6rOU/OWGZN3Ojrr6Gbyf5NZDImaGKavtnV6gRDTAiP7pEsrmYVHET1djSCPmOtKf3u1VDIKd5D0c7XKS2jh3ebOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662423; c=relaxed/simple;
	bh=xRyIoJkiWmYFBusBGMqgFvQtAqkYAb4bTRPHKxP1J5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D2NSOVSRzRvB06gxEyt+pDX0cndgg+nhO+IVHC8ntAV4oBBlY1BjNTJPufvDlkVhH3u4AgV4zUCtu/aoY3MirWE8ewQBp8uV2xsYsX+h1+jEJn4ldStW1TGcEzg1G1/m2DPC+op7HMUZmtymRQQwzJvpHyqnA4xquMG5CBRqIa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T057w4qe; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T057w4qe"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bf22d29dabso12995675ad.2
        for <sashiko@lists.linux.dev>; Fri, 05 Jun 2026 05:26:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780662418; cv=none;
        d=google.com; s=arc-20240605;
        b=O9M9v3dw6b1Btd38bBy7Z1CR/dyPzhJaE5foOC8A6qX9lygbAUAOHKzaMqlc3OLnXt
         ojzuN6H4ouj9QI+IMEqxpfAd+MV2Lm7y3r1uXxuHijH30daX1ndpew2XcfXX/Bu2hdqH
         vFOZC6izh7ZFmgyLcQHegp7BPZzleXKdd22VpEu+ChVltNAbFazUR+23Xhoa8KdvXYXh
         PmE/ZWhPd32tk72HE0y8/aTcy/dRR9Twe5zi1EGcAY9YFtgsd5nD2aGjGUGVVrQGutR+
         7Mz6RpBOF9yCbu9GHNePQwJ3kr/Ia0dhSxFI+byDQ1Q0qcsV9+iQPL32Q6BvBsOpJJV6
         5Kew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ssGNGVnOiVxBL6C23hP126AB3gXcNT/8fTpeLJ+MunY=;
        fh=yD2ZaL5OBpL+BkQis63NNUOyI+PgnDdZf0yA+VDwVfo=;
        b=FRj9V2V4HBg4fut7I6p1mbRLA1zVXaCN5hXxYZuE39BImBur9FhfPCLWJHZrQ0vnRv
         024FyF5ggj26ZFQva0i0W2qPTHTrhtbu1gTsk4bYx5nu0L69Wjc9jmfRgv0ieM8aPSt0
         g7wHq9ePILUHU6OKkYjz8qOsz89ycsyruVSvQbUmS2fK9wN3Wq5pK9e/BZluw5kI3kbc
         LRaKI8JFIJFGQqUMau8GsRK5SzB53GUnjaD5ycGtc9U/kkOBMrZCmJH9D/2li7vKzb8J
         CNsHbUBkjvsbALGsa/R8syWhLO5xFZmA+Xy5wlg4ZxOmAvYAOR9rxdmTe6c5aIkE73xg
         Xd8w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780662418; x=1781267218; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssGNGVnOiVxBL6C23hP126AB3gXcNT/8fTpeLJ+MunY=;
        b=T057w4qe6I8gnZUm6rz21K+Sl4tk0AiiPIHvJa+M+6f+qjaTNYcPy47TRbd/l8xZAd
         l1s5mNV9rFn8Tlz9VuDmKrjjIePoG7lAioxowq3miK+hqIOaNCx+T4STWYz6ha/DUP7Y
         W1Z10q4W0NFmzR1nOIssPg72YJfyGQ/VKAZgG9lYqjFGPLPkxidz0rCB/1J59Rs0oMu4
         ojifPN2N/KpaR86u2+3CPnUr1UmOe/owknyyNEN21NjAdv7gFNwK9uTq5F013xI4dFvX
         F3XKsoFBRSJ85N4rjYepxpfjxnQ83s08E7oqG6rzEPV0bUl0co0mWjbvdsgv5OEaygYd
         Y6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662418; x=1781267218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ssGNGVnOiVxBL6C23hP126AB3gXcNT/8fTpeLJ+MunY=;
        b=hlZoj7Yh1fkK4nryS9fEXy4VmfisYpV249tGpnbmWqRl95P8Fxn4Bn+zmLU0j0QgG2
         Bvy/g/b2ifU/1oD4fnSUNQ8GaKfEER6UR1FO2hySOP9QCk14bBEU3QMTDK8uW/xtoITm
         DU0nLBJIXo6BM+w8+IcKi2bZoXPUYYBVL8rxuXnRIlsqezHv67BJ2SBD6ScTFodbrNiO
         KqyUz7ilLkntUItQPDjJ29H9qPeIWc7zsMuxHeIoJ112xmfHKHM708bUf4H9AaSbnS60
         nJ2sUjQ8/sdIYp3j+WxyQmnCpHrzcuFXoa9g0PU1CT1k9wexZTHdakk2EdWDbXllnpi6
         XuLQ==
X-Gm-Message-State: AOJu0YxcMYdjPmrc+KjgkVED980G0cz/Q7cI/Lzcy2bYQ7pIf9M7fjxr
	hbHZwcc4YXShJI7nYtWu8+/haw6lSmSSLe5XjwZSgBadYVnW45vsS/JLyk6lsGcoV+y/K4AbN9f
	qagu234oqdaomn6YtOydm2xeJ8FZVmX6yLNV+
X-Gm-Gg: Acq92OFQmVDJIbmTJ77g6meaf5NMYwtEyu7Wl19nGFEMDSKiJPowtE7ilfYwvWzxTkE
	qhsg/td3MUKkEbxihJUTy5INaYPrVsWx8Hf4/79VJ/KFxmWX/YztzQFSUUXaRZMPev9WiQT8y3R
	uIX5PlAB0qNGMhwB1NqoQ3p2fU4w0THQlISF9gEJKJffaxvuhhTajqb2sTnRJpU46nEcWudhik2
	STa03Vvgv6dpZfdtBVcOOQ1SHBAhziTkKBmYMAoXopaFTqhjGkrLQGkjJGTX+R/hIDxudtDGpAB
	ShN1xDMPNur9FGxHxiGgwEPf5T5m7flglkFab5FIu+uMORLU
X-Received: by 2002:a17:902:f711:b0:2c0:f807:9bf3 with SMTP id
 d9443c01a7336-2c1e7e619afmr36032955ad.10.1780662418276; Fri, 05 Jun 2026
 05:26:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260510084303.122426-4-phucduc.bui@gmail.com> <20260511224436.A0B19C2BCB0@smtp.kernel.org>
In-Reply-To: <20260511224436.A0B19C2BCB0@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 5 Jun 2026 19:26:46 +0700
X-Gm-Features: AVHnY4KlForSbJj-T4sYhoMos5-qD93OAeW7Ky_lKkfAhDdxYrZzSVLpgVzlQsQ
Message-ID: <CAABR9nHfTtnUxLoq6rHJVmkjWjrAqqU1tawvAKQi-06_XXsKAw@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] ASoC: renesas: fsi: Fix trigger stop ordering
To: sashiko@lists.linux.dev
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The points raised may be valid.
However, this patch series is currently focused on fixing the system hang i=
ssue.
The other concerns will be addressed in a separate follow-up series.

On Tue, May 12, 2026 at 5:44=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] TOCTOU race and lack of synchronization in stream stopping leads=
 to NULL pointer dereference.
> - [High] Teardown asymmetry in `fsi_remove` leads to use-after-free and N=
ULL pointer dereference.
> - [High] Lockless read-modify-write on shared FSI port registers causes h=
ardware corruption.
> - [High] Lockless modifications to shared `clock->count` cause reference =
count corruption.
> --
>
> commit 7ce4e3deeaefe8e811044e7b0472a2e9a2ae1d64
> Author: bui duc phuc <phucduc.bui@gmail.com>
>
> ASoC: renesas: fsi: Fix trigger stop ordering
>
> This commit reorders calls in the stop trigger to execute fsi_stream_stop=
()
> before fsi_hw_shutdown(). It ensures register accesses complete before th=
e
> clock is disabled to prevent a system hang.
>
> > diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> > index 8cbd7acc26f49..94ab2e4908108 100644
> > --- a/sound/soc/renesas/fsi.c
> > +++ b/sound/soc/renesas/fsi.c
> > @@ -1586,9 +1586,9 @@ static int fsi_dai_trigger(struct snd_pcm_substre=
am *substream, int cmd,
> >                       ret =3D fsi_stream_transfer(io);
> >               break;
> >       case SNDRV_PCM_TRIGGER_STOP:
>
> Playback and capture substreams on the same FSI port share port-level
> configuration registers like CKG1, CKG2, and OUT_SEL.
>
> Since the ALSA core serializes triggers at the substream level using
> the self_group.lock, playback and capture triggers for the same DAI
> can execute concurrently on different CPUs.
>
> Does fsi_hw_startup() perform lockless read-modify-write operations on th=
ese
> shared registers, and can this lack of exclusion lead to lost writes and
> corrupted hardware state?
>
> > +             fsi_stream_stop(fsi, io);
>
> During a stream stop, fsi_stream_stop() disables DMA via
> dmaengine_terminate_all() and masks device interrupts, but it does not ap=
pear
> to wait for in-flight DMA callbacks or IRQ handlers to finish.
>
> Concurrently, an executing IRQ handler calling fsi_pio_transfer() will
> temporarily take master->lock in fsi_stream_is_working(), drop it, and th=
en
> locklessly access io->substream->runtime inside fsi_pio_get_area().
>
> Similarly, an asynchronous fsi_dma_complete() callback unconditionally
> dereferences io->substream in fsi_pointer_update().
>
> Since there is no dmaengine_terminate_sync() or synchronize_irq(), could
> fsi_stream_quit() race with these callbacks and clear io->substream,
> resulting in a NULL pointer dereference?
>
> The driver uses managed resources during fsi_probe(), meaning the IRQ han=
dler
> and ALSA component are unregistered after fsi_remove() returns. However,
> fsi_remove() explicitly tears down the DMA streams via fsi_stream_remove(=
),
> which calls dma_release_channel(io->chan) and sets io->chan to NULL.
>
> Because the ALSA component is still fully registered and active while
> fsi_remove() completes, userspace can still trigger ALSA operations.
>
> If a STOP trigger occurs during this window, would calling
> dmaengine_terminate_all(io->chan) here cause a NULL pointer dereference?
>
> >               if (!ret)
> >                       ret =3D fsi_hw_shutdown(fsi, dai->dev);
>
> The shared clock state for an FSI port is tracked using clock->count insi=
de
> fsi_priv.
>
> Since playback and capture triggers for the same port can execute
> concurrently on different CPUs, do fsi_clk_enable() and fsi_clk_disable()
> manually modify this counter without holding any lock?
>
> Could concurrent updates to clock->count corrupt the counter, potentially
> leaving the peripheral clocks enabled permanently or disabling them while=
 a
> stream is still active?
>
> > -             fsi_stream_stop(fsi, io);
> >               fsi_stream_quit(fsi, io);
> >               break;
> >       }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510084303.12=
2426-1-phucduc.bui@gmail.com?part=3D3
