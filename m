Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B21165F16
	for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 03:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776308728; cv=pass; b=lXYQXAO33e1RxWbwo5yfaMmUC3NRs15j73ZD+1ZbCNcVbdS7tjPdVrc1XtEEJGh1P5wopzT6sSSqQ8pCySMlJSewYM3V/h0WcB1b65TwilqTqLXWTDxsxu88vDnlBlZKmXfojeA3LE2li4agP8Yk+5RrsOjht/Au74lOYOfG5tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776308728; c=relaxed/simple;
	bh=3SJOaDXiJKPLrEQCXp0Hi1o/eFcwWpxbFDX39mPRpWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sizHCDBEf3dTe88hwlw3lg2ZWEilMGXB5oqc7DQukSB9IlXIQQzTd5efRN6FQjdQ6XZYMNMWcbyqYgBqPfBroFg7s7/S5R+ayX51NX0gJ54HYbYQD9y+DZ9sYX23ilcR0z42FRDJtltlQrbVP97I4BTOs8+kmdEgNt802JNu3hI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NoE2k6r8; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NoE2k6r8"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a0ff30b240so10133100e87.0
        for <sashiko@lists.linux.dev>; Wed, 15 Apr 2026 20:05:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776308724; cv=none;
        d=google.com; s=arc-20240605;
        b=T0SUy7lKhPHlRBCpPNF3vf5iM2k4ngMz77Gt46Qw/6JoJHV92sKBLvu23qD60QdhNf
         2/CvrPmhyp2RK2VR9PsEYzKcn5G/PHxQIpeaurlG9C0aMZg5MDm4M0gTN4KJO8Zfr2pM
         ggFhgOTIbUoORAzYiJcU3UVa4btPe3AwJxZ35JLLLKUmZFKZ3QKyTHs+jinbu4jPYWn0
         KxZEqJcs0PVAxcM6tDKxtSuPMVbjCThxFBQsw+MNAvOMz6m0T8+DCDliiI4P++VUMWaP
         vL/bzepxwd18rmATggVOiYqwz+ZbnER42wmEIAkqf+zf0FJaanyoNU4Sd1w1PWsBTE2M
         BvaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+x9fm6pO6USW8WdV5snWH77PpLZQ5qVyPAEGN3LxmSE=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=WjK1BtSqX1CkIAsDc0pMMFOV3mQQvPa99X5TvH2urTAOUs+sfA3+c5atvOpcWy+EQq
         h0XdF3EhrgIVMvKTKF2ksYc8ARB6wB5s8lN4kinCI+RIhbK1+lxEQNnsXSX1bGqyOFAf
         25AX31d7ddLROANIdI01n6eh5iuj0GNiv8DQ5wc/u1PSeB6DxESRJIsZgiwsOovyBMF4
         lSLV4IYcZh7FOXtK+jkVsauANK7KLzYDpIhbinxI3kCUSie+PIJVylbTb4NToSmBtRsQ
         xAyFm8A36R8j/c7M40d2zJevoXYpjETjRuT1vEpkuOuhmC9tDmiquERDtilGLzLr8Fuo
         tcNQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776308724; x=1776913524; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+x9fm6pO6USW8WdV5snWH77PpLZQ5qVyPAEGN3LxmSE=;
        b=NoE2k6r88dnlEA5gBRL/u6h/dyEK9hqyyk5So0A7kXFG6kHLys8wjjimgG2MGrt0D8
         Rep2bBXK5LlXt6ftyEfP8P3IMx7uFrS+7jiUGN1ddDRBM6B0FPrln9t0XOdbPpzlyZqJ
         wgytlFptd7ttruehQGmsiuAuMguhs2mQM9xrFt13J3xqeD+jbMYAjH3JG9swpkELE8ME
         9Sshwe8NExF+FIhgK7y1J51VX/Tytd1i9S6uMMyrzN8ysBprEGkrJSd6LX9awdF5EOaI
         4L29tcVdfqpx9XPNgjDEaOP5GWhe3H/Rj2631kO69Ie62Ma/fUWxX5AscyXJDAcaEuAX
         h6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776308724; x=1776913524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+x9fm6pO6USW8WdV5snWH77PpLZQ5qVyPAEGN3LxmSE=;
        b=WKMg8pWWKPfgVZVonzaNocStnH3oUL2kH6Ab96x3P9l0t8uiRAzjQ6pT8M0JvtoQ11
         mT5uFy6yFg7Pk3/DVMwG9I7zlw9Wg6ogVkYiOycAjPZYRSJmsYDMRX9BO1rXAXg23M15
         QXRIduKDVzZc8qVa7aHXuB6qwSxuA9V1UcMKtPgPEeWrXNkSJhjc4dRNwBAVlFWNmlBs
         qvreP0VHLVeLBJNz4oY+bspYkOEHTeVgg/lTGboyZzlfaf9gt62DRi6jbV1k57XSvM3a
         9s0zZZc75XtKF3JDqaRXQe0F46NSm5zpE8yW3zglDDhNFWeM0E5DIa3F/minEduauxqs
         9iYA==
X-Gm-Message-State: AOJu0YyOnkPe5vm3CG76o8gvrDhsjMCYeBabYbUBDhVDtNRgeKSz1Ykx
	h2zz0icHvRThoHRC/pylsf/+bFWTWXa8otq2pWZGvR17k5SGf+n2Q8viSPphKyGj5oXnUW85RB/
	pr2cg93CcgKZFBdt6KzgC/6bUbwu2372TuZ415q0=
X-Gm-Gg: AeBDietWHzeENFAnG74J8jkZEM4kpMVnK/Ewi/48x326L5Il+3/rcEXmc1cgo8rb5B3
	7LJZwk4cqW0wUu6+fACXIJ3rQYej7iYJE7IhEnI8w8hMOwTodycZy+4blGPLgDHjROMVjrjyf2m
	0kjLtVhWPFjDGJyBMDP0t5YWQ1rlzof9TyRYKWauC5iSw1/2s/+sH/3HD+LV38qUr94N7Akl07a
	w9iZt8BDSQTpu5chthVGkAnr2arkM/Jmri0GtjD/uMToy2N9CUW++c7freVBNiQx6FzzH7d7+CW
	/RGxtPbaTiQYDhbO4wMNd5gzuoZLeQ==
X-Received: by 2002:ac2:5df8:0:b0:5a3:f3a4:1aff with SMTP id
 2adb3069b0e04-5a3f3a41bbfmr5546765e87.38.1776308724250; Wed, 15 Apr 2026
 20:05:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415082654.21026-6-kerneljasonxing@gmail.com> <20260415091159.2BC4FC19424@smtp.kernel.org>
In-Reply-To: <20260415091159.2BC4FC19424@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Thu, 16 Apr 2026 11:04:45 +0800
X-Gm-Features: AQROBzBEKiKbghToJ65gA5j39dJR3T27ly3tRT1z5EFF8r1bEsdg-lixRkSHrkw
Message-ID: <CAL+tcoAN-U1YgKRGEys-nvamnbmEsnED=0bOThFi3vpEgYgOvw@mail.gmail.com>
Subject: Re: [PATCH RFC net-next v4 05/14] xsk: add direct xmit in batch function
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 5:12=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 4 potential issue(s):
> - [High] Packet validation executed inside hardware transmit lock, causin=
g severe lock contention
> - [High] Missing transmit recursion protection introduces deadlock vector=
s
> - [High] Missing device state validation allows transmission to stopped o=
r suspended devices
> - [Medium] Hardware doorbell batching is defeated by hardcoded 'more' par=
ameter
> --
>
> commit b98984346f64d24e3ecd521b219464ccbe9fba91
> Author: Jason Xing <kernelxing@tencent.com>
>
> xsk: add direct xmit in batch function
>
> This commit adds a batch transmission logic for AF_XDP. It introduces a
> new direct transmit function that disables bottom halves, grabs the lock
> once, and sends all aggregated packets in a loop.
>
> > diff --git a/net/core/dev.c b/net/core/dev.c
> > --- a/net/core/dev.c
> > +++ b/net/core/dev.c
>
> [ ... ]
>
> > +int xsk_direct_xmit_batch(struct xdp_sock *xs, struct net_device *dev)
> > +{
> > +     u16 queue_id =3D xs->queue_id;
> > +     struct netdev_queue *txq =3D netdev_get_tx_queue(dev, queue_id);
> > +     struct sk_buff_head *send_queue =3D &xs->batch.send_queue;
> > +     int ret =3D NETDEV_TX_BUSY;
> > +     struct sk_buff *skb;
> > +
>
> Should there be a check for the device state before attempting to transmi=
t?
> Direct transmit paths that bypass the Qdisc layer, like __dev_direct_xmit=
(),
> typically verify that the device is running and the carrier is up:
>
>         if (unlikely(!netif_running(dev) ||
>                      !netif_carrier_ok(dev)))
>                 goto drop;

Actually I did it at the very beginning of the sendmsg function, but
with the respect to the original code I will move it.

>
> Could invoking transmission on a stopped or suspended device cause issues=
?
>
> > +     local_bh_disable();
>
> Are we missing transmit recursion protection here? Standard paths wrap th=
e
> hardware transmit lock with recursion tracking to protect against stack
> overflows and deadlocks when routing through virtual devices:
>
>         dev_xmit_recursion_inc();
>         HARD_TX_LOCK(dev, txq, smp_processor_id());

This is intended because I think it's not necessary for XSK that is
only triggered by sendmsg only in copy mode. No such terrible thing is
likely to happen as no one binds xsk to macvlan type of devices.

I will reconsider it, fearing some over-engineering work impacts the
performance.

>
> > +     HARD_TX_LOCK(dev, txq, smp_processor_id());
> > +     while ((skb =3D __skb_dequeue(send_queue)) !=3D NULL) {
> > +             struct sk_buff *orig_skb =3D skb;
> > +             bool again =3D false;
> > +
> > +             skb =3D validate_xmit_skb_list(skb, dev, &again);
>
> Will executing validate_xmit_skb_list() inside the hardware transmit lock
> cause lock contention? This function can perform computationally expensiv=
e
> operations such as GSO segmentation, software checksum fallbacks, and
> subsystem hooks. Other transmit paths execute this validation strictly
> before acquiring the hardware lock.

The next patch adds a fast path check for this so it has been improved.

>
> > +             if (skb !=3D orig_skb) {
> > +                     dev_core_stats_tx_dropped_inc(dev);
> > +                     kfree_skb_list(skb);
> > +                     ret =3D NET_XMIT_DROP;
> > +                     break;
> > +             }
> > +
> > +             if (netif_xmit_frozen_or_drv_stopped(txq)) {
> > +                     __skb_queue_head(send_queue, skb);
> > +                     break;
> > +             }
> > +             skb_set_queue_mapping(skb, queue_id);
> > +             ret =3D netdev_start_xmit(skb, dev, txq, false);
>
> Does passing false for the more parameter defeat the purpose of hardware
> doorbell batching? It instructs the driver to ring the hardware doorbell =
for
> every single packet instead of delaying it until the end of the batch.
>
> It looks like this might be fixed later in the patch series by commit
> 6d7c8f2ad056e ("xsk: support dynamic xmit.more control for batch xmit").

Yep, it was suggested by Jesper already.

Thanks,
Jason

>
> > +             if (ret !=3D NETDEV_TX_OK) {
> > +                     if (ret =3D=3D NETDEV_TX_BUSY)
> > +                             __skb_queue_head(send_queue, skb);
> > +                     break;
> > +             }
> > +     }
> > +     HARD_TX_UNLOCK(dev, txq);
>
> Also, we would need to pair any added recursion increment with a decremen=
t
> here:
>
>         dev_xmit_recursion_dec();
>
> > +     local_bh_enable();
> > +
> > +     return ret;
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260415082654.21=
026-1-kerneljasonxing@gmail.com?part=3D5
