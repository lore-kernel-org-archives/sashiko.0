Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545A73002BD
	for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 03:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776311077; cv=pass; b=lwab0dm7QsS6iWQoHRuLpJdwytVfBI5oULHpuPbHiiDQXriQorxESCbg7uKp8s89VmgN+taKU4z8NxgMcvEEyI/hBr0Z4+jRk1iTaMHMG4E8L5VMGzd8cvqd+HeB+9x7Eoac0v0NmmkjoTHJgTxeUsv1jlHO9eem795cztnFvTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776311077; c=relaxed/simple;
	bh=dpt4IJ3GDG0XHW9jydXe0NywBRPJF46+FLWkhFYg8uQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=itSNsYiLD/Ts6eUU4l8qn2nY6ReE6dh/B6IW/MgJoPfJqAsSDto54JxOSYhn79yyJQ2HhyC0UCB39XRoIYdOM2GKaJhRxzMTCfOFFob7Mca6megFBr7Mg9kbexFI5B6l3JFvr8xyaDOcQb4IAT6FT+e42W4rZNJX1M9NiE/N3AA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oFqVKYI7; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oFqVKYI7"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a3e66f849dso247742e87.1
        for <sashiko@lists.linux.dev>; Wed, 15 Apr 2026 20:44:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776311072; cv=none;
        d=google.com; s=arc-20240605;
        b=LDlRvSl//v39hCBBnlpvHNgy1xIAr5ZaH8mNY1NATO9Y6ebwNdIxALFNJyC27Idkee
         DIvSJ+jWe1faJq6imQP3vA2FcQ+B2PdNIe/n0MQvWlzCnS5CaV895STgrcw3Sph+NUph
         9gEkCxgx/Es556F0xIlLqZwYh31K4oe/J34lv1gDhhRktIvqFAHP4ubk6uVGqATFTLvr
         ygwXDM6m4QSi+hGHhu22N64OQ7d3BgsXeYN2/a+sOYPPiicIS6Su+cDRlegjNm7rN7OE
         NApBqFoH+VAkQ7JoyhlpaczG7Ryrxu2hOaTP/7Vw4ms7jXafnnWk6GeeWp10f5h30AZb
         1xlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ucDq05nFVA74XEJrVhKyCRM7W5uLCDWodS8G7L/HG4U=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=TUQEnwTbIKyicJNnYDks5+WLUngco3riC6+7rcNO9TFCm+9nBHKehd+CbQ95wVcAc5
         JZ8wgaaDMb2IO9lhrMXm3dvIOt8WxHRXOexhyh0rWV6IGcWidIAM25Si6evP/y3NnHwo
         aFgHcR3fDcpocuXhYbg4dqOh1IAjBb/WCd7cdQXv1JemBmtOu47f9IdJrjIb01X2CKAL
         t3fgoOOqgeCSo1JLantEE6WVudq820+Fzz57E4nJTCDnG35WPYYui9jC8GqLBQ8VhlFz
         tf3pxHNgLuczpUJUPHsyfNxeXDI0vr5lWEjpQSe/UNZuRaEBKIJmC5Au3E3I1+ysM4DM
         PwRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776311072; x=1776915872; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucDq05nFVA74XEJrVhKyCRM7W5uLCDWodS8G7L/HG4U=;
        b=oFqVKYI77f/KMFUsnUulquYQiMl8fzCpP/8YO+FlZFQgLrlQ8+odx8fZS1LwlN51wu
         CfiTAcrdg51YXqdFAi41jI5AtmcQXs4vUuL11VeJ0RxGuciKPnskslPaJqLkU/zIxT8J
         VEQgLUX2wPhq1WLfJ46V0abCZoiteI5FGa6UMR4eVm2lCoDsbXyxg9GyGQjsrakzhXLg
         A5tzDawBIdLdawx45MRvBa0q11X01Vw1KNm8mZxfFuoyY6gDl6BmbgS7FSMb3/riY9Dj
         bog2q5JYL8dQPlapivj0nJoEs0FV1vCD+yDgNvBQv0x9kaAaQd5CoNreF8LRaOTslLBK
         1oOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776311072; x=1776915872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ucDq05nFVA74XEJrVhKyCRM7W5uLCDWodS8G7L/HG4U=;
        b=JgLhye3krAO1/vBEffNhm5EKGl2iUYOhSJic6mQjlXioj3+20O7wKmXA432jP+JNDC
         o0OA+221KjN0Z1BVL88EpN5QBy7G6iiAyhEX4Hbn7kXju4DOz9Wxv6mqKU5ibMvrPAJ/
         DPdCbG3+nLrzjg7j/wGnAlcEZoce6ZDSbggLPjWBVKTSkdA37hYIrKDKJMgYL+1E0hUZ
         cYyyuMUdgVNIAtCkYMcHNRIFb92KiN96j1oYS4PcOBbn0DIA1GIK927Jew2SG609MOHm
         y9CBG28aWGFfstvDznNqMfLwPb9gNl3QckCRxHwenqxLxAvCaq0Pd+tTw2KuzPPd+M3n
         GBnA==
X-Gm-Message-State: AOJu0Yx9YNRhrZygMqMqVMVGZYuaCzH3FlJlHLeeRgBttvSb02A7TqJe
	vW74utLJ4eP23A/6M47qg3VrsNAX0UTWsYv3uByW9PB7UzYgVg1MQSm4fqRzLEA4+PFpn3afV1n
	DfNl8R1A6VyE57lpHjYzaXMGPagVHxLHWw8rglpancg==
X-Gm-Gg: AeBDieve+79xADVHsDblHXsSObFCinBeHgQVYsNPPPl/MKC3p9J6ZOg81641JxFyX6m
	hGe+qyhF8NuCWsOKjILVfrGQDaEN86P+ZiYHOgaht4VsBV1Xrzhm5jzM1YmSE/2jyoxcaEB9uyk
	7sXUJjlHPRZfTYGHlM3SUVcGQ1PAcfnyZV8ZIniJO1ZpoHJ4KOYvfgFhV6ajIKoXuiZrApicFyU
	xegqWm8/s2tuOqC6dnvS2Lpgi+NKrkHZHcHZj7BJvF/dCP8Xwrm0Y7U4W/+j21tLoIDMptKTOy5
	fQFYrREO/XzoKdSbMVg=
X-Received: by 2002:a05:6512:1081:b0:5a2:9b96:528b with SMTP id
 2adb3069b0e04-5a40dfa9058mr504302e87.20.1776311072241; Wed, 15 Apr 2026
 20:44:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415082654.21026-7-kerneljasonxing@gmail.com> <20260415093539.4A4BFC19424@smtp.kernel.org>
In-Reply-To: <20260415093539.4A4BFC19424@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Thu, 16 Apr 2026 11:43:53 +0800
X-Gm-Features: AQROBzBl8Pk-WRPKQxQEIYAyeKD4MLfT8hpQzV8U-3Xe31PaNeksxymOLwuLY2Y
Message-ID: <CAL+tcoDUa=MpXSEtweT0LvkBEM2hcYnrjn4FK-ntU3WNMbLEWQ@mail.gmail.com>
Subject: Re: [PATCH RFC net-next v4 06/14] xsk: support dynamic xmit.more
 control for batch xmit
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 5:35=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 1 potential issue(s):
> - [High] Stalled TX queue due to missing hardware doorbell ring on early =
loop exit
> --
>
> commit 6d7c8f2ad056eb4cb2eec8d360e632f9ef9044f5
> Author: Jason Xing <kernelxing@tencent.com>
>
> xsk: support dynamic xmit.more control for batch xmit
>
> This commit updates xsk batch transmission to only set xmit.more to false=
 for
> the last skb in the send queue, aiming to reduce unnecessary IRQs and imp=
rove
> batching performance.
>
> > diff --git a/net/core/dev.c b/net/core/dev.c
> > --- a/net/core/dev.c
> > +++ b/net/core/dev.c
> > @@ -4873,6 +4873,7 @@ int xsk_direct_xmit_batch(struct xdp_sock *xs, st=
ruct net_device *dev)
> >       struct sk_buff_head *send_queue =3D &xs->batch.send_queue;
> >       int ret =3D NETDEV_TX_BUSY;
> >       struct sk_buff *skb;
> > +     bool more =3D true;
> >
> >       local_bh_disable();
> >       HARD_TX_LOCK(dev, txq, smp_processor_id());
>
> [ ... ]
>
> > @@ -4892,8 +4893,12 @@ int xsk_direct_xmit_batch(struct xdp_sock *xs, s=
truct net_device *dev)
> >                       __skb_queue_head(send_queue, skb);
> >                       break;
> >               }
> > +
> > +             if (!skb_peek(send_queue))
> > +                     more =3D false;
> > +
> >               skb_set_queue_mapping(skb, queue_id);
> > -             ret =3D netdev_start_xmit(skb, dev, txq, false);
> > +             ret =3D netdev_start_xmit(skb, dev, txq, more);
> >               if (ret !=3D NETDEV_TX_OK) {
> >                       if (ret =3D=3D NETDEV_TX_BUSY)
> >                               __skb_queue_head(send_queue, skb);
> >                       break;
> >               }
> >       }
>
> If an error occurs and the loop breaks early, does this leave previously
> transmitted packets stalled in the driver's TX ring?
>
> Since more is passed as true for all packets prior to the failure, the
> network driver defers ringing the hardware TX doorbell.
>
> If the code breaks out of the loop due to validate_xmit_skb_list() failin=
g,
> netif_xmit_frozen_or_drv_stopped(), or netdev_start_xmit() returning
> NETDEV_TX_BUSY, the loop terminates without ever passing more =3D false t=
o the
> driver.
>
> Could this omission prevent the hardware from being notified to transmit
> the successfully processed packets that preceded the error?

The quite similar code snippet was added in dev_hard_start_xmit()
introduced by the following commit in 2014:
commit 95f6b3dda2a4a052f7dabe9998e4ffac491b7bc2
Author: David S. Miller <davem@davemloft.net>
Date:   Fri Aug 29 21:57:30 2014 -0700

    net: Have xmit_list() signal more=3D=3Dtrue when appropriate.

    Signed-off-by: David S. Miller <davem@davemloft.net>

Look at the doorbell of drivers, like ixgbe:
if (netif_xmit_stopped(txring_txq(tx_ring)) || !netdev_xmit_more()) {
        writel(i, tx_ring->tail);
}

It has already taken care of it.

If we really want to cover all the possible drivers in the above two
cases, maybe we need a separate patchset to add a common interface of
devices to actively kick the hardware. But now I choose to defer it
unless someone insists on this.

Thanks,
Jason

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260415082654.21=
026-1-kerneljasonxing@gmail.com?part=3D6
