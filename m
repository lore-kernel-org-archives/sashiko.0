Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC8B2F8EAD
	for <sashiko@lists.linux.dev>; Mon, 11 May 2026 06:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778481918; cv=pass; b=RKhkdAEpt8xvACUMprZegyq8oHl6q39Xn39QN174/RAeD5jm1hS7opDJhdUPvK7Uw39xpXq+Ni9mScxyxsBeoomzkspzGMwFxxXEdj6I3dOXGyxAowvCquK/w9FB+pr0muNnQAMpUIRTxaflv1+FNO6O001BFm4ECSJ4aB1Rtz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778481918; c=relaxed/simple;
	bh=97cJOwK3KCzHfauaYQfhuSYb6J7hf4uXsLX2UHCLHkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DuKOsUc79owLqs1m5V3sGqBNo8VUbGkPpsm1tQ2rUQGgg91NqIYyQ44rLhh2BuQ2NlxCaUP3qnmGY32b6WArE1sgRXYevkWCzAVm59uPK++0pe3Ev9SzEFoiUy1gITLJk4OMrOVvr/B7b+EnjCH9XlOjF12ODz5T0NcpXYtoQ00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=S4LDL5nx; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S4LDL5nx"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a88de2b52eso5067751e87.2
        for <sashiko@lists.linux.dev>; Sun, 10 May 2026 23:45:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778481915; cv=none;
        d=google.com; s=arc-20240605;
        b=MFptfW4FOI5idLXOxlxqlHJxrBMGiWdqK/CNw1/ud0zqOERH1qvazXODgOzG17INsN
         bdBIIkhPYGCwvakjqJljWiuhecchS0Mb4NTY5C35liOv41i6nfE4fQt01i4Uzrs6KmM3
         LtH30xg1KOXygAGPSphvIqM6m+YNj3yfWtOcIgCzTV7Pwcvph4tdskV7jzDNXEhLsV/q
         VxrtAKiybmBZHB8sMmo4GzLCKlpUiBNUkBWMbA7G2S0O7rrP0YodXpNdBKZdBQxCWhmM
         Z/5I/XpGX7oVnkTp/70O0zEQqNy/e2kSMG8nKamEUP776UYUTdwIEInpbwQiifW/Zahg
         Sf3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VMPlEPi9zf9RVpC6UEP+/+vrS9JgpaFFDnRGG82wjDA=;
        fh=QdhIDWiwxlcL1884ITP/mcjlzeo+qogBsKxF+LZAApQ=;
        b=BwSdtDp3Wnkx7enh15JYitF0O8uZkORnsUvd3PQrjiiTfV+ttrEcy0KpLg6ImQ31bI
         A6ijEaH77UEj3BQqvKxrNZwSWR+7rBuQ62h0Bp0hMZMpBsUfeAvaUhUQHx3HmgU1V3PY
         HRTJDU9xrWPbZeaLbiSOwWSJrQX6c5Cq+uFBcVExKuynBvGVCzqL/d27vfYR9T7RjivF
         ygKj+hAGDHiSS6/fIfC2sNRSo2OZs2vTTgeRQyLN+y/XzBYk7UXyVRKNG5ttewe3Ob89
         515cGvV0lujOGQ14ysgFX1UbTupJdh1Di6tACXGYmindqIMud+Kvo2YGeNPMhpzvBWYx
         L5fg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778481915; x=1779086715; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMPlEPi9zf9RVpC6UEP+/+vrS9JgpaFFDnRGG82wjDA=;
        b=S4LDL5nxDQEaAWyQwoY087R6s6dUWA34Ah+2cY/oynDfrBx8glPNkdal9lwQDgxSvf
         Tipa35RJraLvWV2LjxkVqxndTjfyvqFi57i7RG2cNKb+PmUPVKvgZpUhCsFCCaC81lKu
         5zEJ4+JxLd2QdoUyYfMQN0g3683UXkUa/thG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778481915; x=1779086715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VMPlEPi9zf9RVpC6UEP+/+vrS9JgpaFFDnRGG82wjDA=;
        b=JBICkxEDXBapfdag0Diw8cqPqe2NGI85X1ZsnkqssoHmav1mVEen+f1byhq2xAsNIz
         IC/AlxWYp5MNongLeTjdRyP3gyBrvtDa0GQn0csEjTuEs/dHt94zNZdsbTmxTunxc05H
         RaxvQhsCQnILzNToF/NvD8UYjMC1xpasFVpp2t1K3LYlFdBUi9iVh+iH899MG4GRGv9S
         o8Vt+Rb02pvzU2L1zA+vwtya9SjmVsssVOgRNsTbN96V/a+efPa7Wsb27gML+X2OEBJF
         e25OSnfu+kFvIJOD7Sfv6OqiDvzkp0kOaFcvAG6yZ2jZHoDTO24+JYJ4FF0PZGT7HqEH
         nLVQ==
X-Gm-Message-State: AOJu0Ywy58Nf8/HgRU/8WdPT5AyY7rYz5MuDSyTpQEe8tpU2ktJ0fSul
	N6fR6d/GC0woYr6hpU+s50zA25WoKPUksQkqq2D2mBE7Gr0+DCt2UUebd1BbGSwKVtX4FnNIOg1
	MQQJ1kCoao5LWZX4hA3utThZkGxtgP3cD0Lp3wefM2LGJQz42HOU=
X-Gm-Gg: Acq92OE0k47oVSblQLNZauNZI1USLJKBhRDfAaKpwILZjBYhWpiMQfP+k77oY2z4cdB
	G6DXA6aqZ5ugrTBbc3//aXOejQ78bS7gxB/LDIQWBERJH+0EhreAvLJc2yncALSwB3bf+jfn0am
	Z8ChhwLkeA/ah04lnhuNaHMiUSJK08lNm9mr+8KnwoxIFR88AUIjpaflYModxTy73O3qfc1y81X
	X/ohqy6CkM7QLCQCDKEe9hRjrZJKD77n+7lgV6gAN/buwpmTgyYh5jdijfKz9SsIPJsXgeaHSHs
	nXqE35334AR5fGUJPucH91F+CrTLjGGFFC6P6Q==
X-Received: by 2002:a05:6512:158e:b0:5a8:63e0:971b with SMTP id
 2adb3069b0e04-5a887ceaff8mr7299552e87.35.1778481914968; Sun, 10 May 2026
 23:45:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260505105918.1823170-1-wenst@chromium.org> <20260505112419.B9151C2BCC7@smtp.kernel.org>
In-Reply-To: <20260505112419.B9151C2BCC7@smtp.kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 11 May 2026 14:45:03 +0800
X-Gm-Features: AVHnY4KR-6Tf06R_RWua_y8Uai9EMagjSCzvJrMvpn9ggprlRnV50GcWLq8tPyw
Message-ID: <CAGXv+5Gp90XUHNk7S+ePJmymrHeLDagw+s604FZjKWZgDS49XQ@mail.gmail.com>
Subject: Re: [PATCH] PCI: mediatek-gen3: Do full device power down on removal
To: sashiko@lists.linux.dev
Cc: linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FTR,

On Tue, May 5, 2026 at 7:24=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Asserting PERST# and disabling clocks before deregistering the i=
nterrupt handler introduces a race condition that can cause a bus fault (ke=
rnel panic).
> --
>
> commit 392cdae7adde07f3a5a5cd47d941a62a1d778a2b
> Author: Chen-Yu Tsai <wenst@chromium.org>
>
> PCI: mediatek-gen3: Do full device power down on removal
>
> This commit updates the driver removal path to follow a proper power down
> sequence for downstream devices. It calls mtk_pcie_devices_power_down()
> on driver removal so that PERST# is asserted.
>
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/=
controller/pcie-mediatek-gen3.c
> > index b0accd8285892..e6acca7e79a0f 100644
> > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > @@ -1260,7 +1260,7 @@ static void mtk_pcie_remove(struct platform_devic=
e *pdev)
> >       pci_remove_root_bus(host->bus);
> >       pci_unlock_rescan_remove();
> >
> > -     pci_pwrctrl_power_off_devices(pcie->dev);
> > +     mtk_pcie_devices_power_down(pcie);
> >       mtk_pcie_power_down(pcie);
>
> Could this sequence cause a regression by introducing a race condition
> with the interrupt handler?
>
> Calling mtk_pcie_devices_power_down() asserts the PERST# pin, which force=
s
> the downstream PCIe link down. This can trigger a link-down or MAC error
> interrupt at the controller level.
>
> Immediately following this, mtk_pcie_power_down() disables the transactio=
n
> layer clocks via clk_bulk_disable_unprepare().
>
> If an interrupt fires during this window, the top-level chained interrupt
> handler will execute because mtk_pcie_irq_teardown() hasn't been called y=
et.
>
> If the handler attempts to read controller registers while its clocks are
> disabled:
>
> mtk_pcie_irq_handler()
>         status =3D readl_relaxed(pcie->base + PCIE_INT_STATUS_REG);
>
> Could this cause a synchronous external abort and crash the kernel?
>
> >       pci_pwrctrl_destroy_devices(pcie->dev);
> >       mtk_pcie_irq_teardown(pcie);
>
> Should the interrupt handler be deregistered or masked before the clocks
> are disabled?

The driver only handles chained IRQs, i.e. the INTX and MSI interrupts.
By the time this function is called, the downstream PCIe devices should
all have been stopped and removed, meaning all chained interrupts would
have been disabled already.

ChenYu
