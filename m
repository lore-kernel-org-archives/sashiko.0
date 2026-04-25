Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136A733B6F9
	for <sashiko@lists.linux.dev>; Sat, 25 Apr 2026 13:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777125276; cv=pass; b=St36CQ4hffFTa+jwDwQlfhsrkH6oNEA2Z2kWYQPrc0rINLwZ5JuHOxmUvBasDfsAnYdGSZpUL4XPlVyg+otfWrrX/LmiLreZhTYcEzvFDScQVOIB+Uj9UE5sBdkIbvuQ07bwl0hkyCYHmSFItu+IbrcagFEjgLzLuPkMqjiNQiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777125276; c=relaxed/simple;
	bh=vbwPluvlf1NiwmpKuGMOnt7jPg/l/NJQS69Y1o49T5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aAszgVP7TrFaXfwsqXtxUw1otZXZhO9cTkcdd5JxyIYBjHiyvc1MIth2yFnttbqQsxL06BDAuxwgDsOMDfJMkKEdLvKAvEQsp6wPhTMsp4x1sXUiM/EM5sC0Koc71+NE/ToncdxFzQTdNWZAuog7dkEwskkJ38N5/XTq/LAy++k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jTq289aM; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jTq289aM"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59dcdf60427so7833526e87.3
        for <sashiko@lists.linux.dev>; Sat, 25 Apr 2026 06:54:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777125272; cv=none;
        d=google.com; s=arc-20240605;
        b=Fyw3e8+Qqf1+Hb5b1EcbtTxAQNpSdyWtActNU6tVoX8ya9fqvWY60SLftpFoeYWF+N
         Kr3/iVBS+P4oCSmNZF/hHhv1oqfd/ksoncW9pvw+IMExDZGMnBrtQn3hyoakRAawIeC6
         kUV3VTP+3j388DyzXrJfWka6qQNBpQDshCdFstmZ8XNJd7QdPE/1lOX4Vw711XHO4qqf
         BumfyNuicvBmnQJ9ueR1+y3gYVc63Fu3axgGBeOlXsteonRysRXX5xoiSVqkGzOy8OcF
         ubOdpaHONjp1tLVCzylDEAWw77igKCBJpuqDcz7AcXb4ItjbFIzIq85PXQGTloVoTJ6q
         EmrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0WioSV/XaHHzHaS5+gc9OU+O+VvZzNjsxQQraWtfsds=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=I1asVyCr4iOo8topSGzVAnsMa7IAjBIkk1RbOQ9uQ0kvchn6DEmlTFYRNLs8dWnn6G
         ThUe1HKsLOlorL0TV+MT0moMLqrRh13K3WffKhouE/K+Z+ITldaxxhHMpMcliSVqk4Bl
         VSRcvbU9+ntsXY4lT1564/whSmxQXqL0XVT+7/xrqLKVuRWXkqEwbajtoOHUXZLqTqz8
         xQqvVM6J0oVLqYg2ALXZBJmTDpPgmHQSzuFLdNuA2oknlCm6+nTyicbPBlFwBGJEDFlr
         rLyVAaEsxOm3096h7AMu/M56jK+7SyjJ2t8Y9EoJSSoInDPi/XJk3gf5GsBdPgAPWIs7
         4/5g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777125272; x=1777730072; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0WioSV/XaHHzHaS5+gc9OU+O+VvZzNjsxQQraWtfsds=;
        b=jTq289aMho9In/wYTYCdfcn/YgClEotxGzNRq65gt0czO5+OceHuaDYkBfOsEi2u7/
         GxToVqU2Duy7SsTPk23VHRfMy8vulAy7QHWR1W6wjkooQANwOJC/C08oP8UWz05huhHa
         CliDRnvgeFFRuy5OF/bZO59XHEpJ/dbIPUSGQoPlqPZF+kHw2q0MLW/X6dpcx6lOL/x8
         MwVekuTN5B2fkZn6yoJN5aJJPoQthMWpF/iWZigxVZDiolt5eP2XXkce2R+hJipZMd8P
         BwAU/K8ln6r+7hrqoS6T7+faHx7ybqdgFOd3hoWVeWfKTADdgv+f4yozaiNih+5NG+Vl
         9WBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777125272; x=1777730072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0WioSV/XaHHzHaS5+gc9OU+O+VvZzNjsxQQraWtfsds=;
        b=o+ye5vJhax/8VhU+0cFfoiRmDCGPMk/+cw6y9VzfPUcDGJMM9WY9PS1TpKvBt1UU1J
         gKpwzs2KRlZ9nq2NOsyV3L+JE5zUwtnKfsWl/w5GGLTudn2kAyFNDj3C9X49RsjYLmlT
         HYk/LU3tsaW6FqNYf9dZmuIbdfAQXDFG8zupnmux+VzVCAzzrnzpX61G2Bh1tHF17rO/
         BU0T7DndOrWuBJ6bqVk07Mpgzypd6CM+UcNZCbGDc/2+UpzLyufgCQQ0hAjRu4yestV+
         HAw93NSLiCuLBL9aBzydzTV4DsoxwXzJHB+/lHbzsIVeX4HtlLKpwBi1MTSeVPvgLEsu
         cJ6g==
X-Gm-Message-State: AOJu0YwUhd60MG/9f+H3b2rFKEYOzaixOtLagkT96XaSUaZA5iVgYTo9
	05RFIeKI4D4NVUr3dsV3D4ARuJD2D9JJoPKW6CDLPLEXkTyvF6HvVqP5I8flt1FrUxNfMoxwvSw
	xnET/G+0e7COvx3TKbQ47yt7OabT5OGlO80AL
X-Gm-Gg: AeBDievuRV+IIHZS/+KT+cH3QoPZG4VwFQEl5P22zFOcCop1dAYjd6gkaN9Z7cME4JQ
	EZEdHE8HJGXi5Oid0BwT/K/yo3uakkujs4zwJebH5wdEnQ3lQvyu9yBDcX1XYODuKTy9Ogw7r+h
	POcAfZ1M4DyiJ+/9h0nR67V1x3W2+BXPfW6w7mH3hSigKe/w6AnvO7LJJ1pTsOcyEYPRuByumI+
	/aKJ/DAdQBbPMuakoHh3NwMosr8ySLUptgVHKJ8/PL8LfZlwZ5KFG37/XKe2PwDFxsaELOZj28R
	o/TVXjkE3C55IHDLgZlICVHS+7k8G0O9Akbhli6B5QBgLO9S6w==
X-Received: by 2002:a05:6512:3b13:b0:5a3:ff58:e111 with SMTP id
 2adb3069b0e04-5a4172d35d4mr11595405e87.17.1777125271364; Sat, 25 Apr 2026
 06:54:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260424053816.27965-2-kerneljasonxing@gmail.com> <20260425054032.28A27C2BCB2@smtp.kernel.org>
In-Reply-To: <20260425054032.28A27C2BCB2@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Sat, 25 Apr 2026 21:53:54 +0800
X-Gm-Features: AQROBzCGYddrlwvDcEbeMReF-0Bx3PFXgwy5lg3LeXzyvZitEsT1jZHhoHF23kI
Message-ID: <CAL+tcoAYdOawD3xfuD3Kap6qCBnviMdLodZa8JkKRHLN3r+fJQ@mail.gmail.com>
Subject: Re: [PATCH net v4 1/8] xsk: reject sw-csum UMEM binding to
 IFF_TX_SKB_NO_LINEAR devices
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 25, 2026 at 1:40=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 1 potential issue(s):
> - [High] The patch incompletely fixes the WARN_ON_ONCE in skb_checksum_he=
lp() triggered by pure-fragment SKBs. It successfully prevents the explicit=
 fallback in xsk_skb_metadata() (which wedged the TX ring), but leaves the =
implicit generic network stack fallback vulnerable. If a user sets XDP_TXMD=
_FLAGS_CHECKSUM on an IFF_TX_SKB_NO_LINEAR device and the hardware checksum=
 offload is disabled at runtime (e.g., via `ethtool -K eth0 tx off`), the c=
ore stack's validate_xmit_skb() takes over. Because NETIF_F_SG is allowed t=
o remain active even without checksum features, skb_needs_linearize() evalu=
ates to false, leaving the SKB unlinearized. The SKB is then passed to skb_=
csum_hwoffload_help() -> skb_checksum_help(), which hits the exact same WAR=
N_ON_ONCE(offset >=3D skb_headlen(skb)) because skb_headlen is 0.
> --
>
> commit 86ab0a4900aa60bee0c3df7393a2846b5ff74ccb
> Author: Jason Xing <kerneljasonxing@gmail.com>
>
> xsk: reject sw-csum UMEM binding to IFF_TX_SKB_NO_LINEAR devices
>
> This commit attempts to fix a warning triggered in skb_checksum_help()
> by AF_XDP pure-fragment SKBs. It rejects sw-csum UMEM binding for
> drivers advertising IFF_TX_SKB_NO_LINEAR at setup time.
>
> Closes: https://lore.kernel.org/all/20260419045822.843BFC2BCAF@smtp.kerne=
l.org/#t
> Fixes: 30c3055f9c0d ("xsk: wrap generic metadata handling onto separate f=
unction")
> Acked-by: Stanislav Fomichev <sdf@fomichev.me>
> Signed-off-by: Jason Xing <kernelxing@tencent.com>
>
> > diff --git a/net/xdp/xsk_buff_pool.c b/net/xdp/xsk_buff_pool.c
> > index cd7bc50872f6b5..d981cfdd853578 100644
> > --- a/net/xdp/xsk_buff_pool.c
> > +++ b/net/xdp/xsk_buff_pool.c
> > @@ -175,6 +175,9 @@ int xp_assign_dev(struct xsk_buff_pool *pool,
> >       if (force_zc && force_copy)
> >               return -EINVAL;
> >
> > +     if (pool->tx_sw_csum && (netdev->priv_flags & IFF_TX_SKB_NO_LINEA=
R))
> > +             return -EOPNOTSUPP;
> > +
>
> Does this still leave a path for the warning in skb_checksum_help() to
> trigger if hardware checksum offloading is disabled at runtime?
>
> If a user sets XDP_TXMD_FLAGS_CHECKSUM on an IFF_TX_SKB_NO_LINEAR device,
> and hardware checksum offload is later disabled (e.g., via ethtool -K
> eth0 tx off), the core stack's validate_xmit_skb() will take over.
>
> Because NETIF_F_SG can remain active even without checksum features,
> skb_needs_linearize() evaluates to false, leaving the SKB unlinearized.
>
> The SKB is then passed to skb_csum_hwoffload_help() which falls back to
> skb_checksum_help(). Since the pure-fragment SKB still has a headlen of 0=
,
> won't this hit the exact same WARN_ON_ONCE(offset >=3D skb_headlen(skb))
> warning?

This is a new case that happens around sw csum feature. It's not like
how I did in this patch (this kind of combination proved to be a no-go
from the start. people should be notified of this).

But your concern about the scenario you're describing is right. The
problem only happens when the setting of the driver is changed. If
hardware doesn't support csum, and resorting to sw csum fails, that
will cause the skb drop instance. It's not that particularly strange.
People will soon get warned and adjust their code or policy. Maybe in
the future we'll be able to add more observability code into xsk to
include this case, like adding one drop reason to let admins be aware
of it. This is already on my todo-list.

Apparently IMHO it's a bug at all.

Thanks,
Jason

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260424053816.27=
965-1-kerneljasonxing@gmail.com?part=3D1
