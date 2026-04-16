Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7358439D6C6
	for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 09:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776333548; cv=pass; b=GwGsQrxecX9GUafmeOw0k3OTTa9k8XbGowgJWE7maXYk6w514ndljnZDuxdiARJXoHJy2x8cPD5W9TNoVzL5xwAnJR9TodjLmAiYZZkgLBMNwmzoGkRgqdT/iYbMN7ww8t1yOWRviwaXjvshi30WzJkSYjnkDD7EBGWRPUe9vrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776333548; c=relaxed/simple;
	bh=B2adID4oHMiKjpDnrLEpOdrg25k/SPPdzX3FVHgeEf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KxJQQnSBSfdbJQL5f3s9ZYUn1NYzmWL8cTcthOyR8xw2TfcUxJ/40JxxSAHQjzsRk5DzQn9/ZTU05ErJpLIP/ccTO0fY4xYStAGPE7unub9SyBRyU9+Vdk2fHOlcY17Al6fcbGUa7POf7T8sVmXYpTpNQi5bIc2Unm1xG+SEGeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tCkSWN88; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tCkSWN88"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a10d130b37so454952e87.0
        for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 02:59:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776333543; cv=none;
        d=google.com; s=arc-20240605;
        b=OMZNgdws7JQMgqx2ySV8bzzgGUbWFSYCqclr4+GaoBjlLsOvQGjUpKXyse5Hb5LxlY
         UjEkk+KAloEvP0fUeSZ+KoUJsMLWo4R4yZLwO9c1+UU8HcWhwkk33z9Z7PcfwImrAxXA
         dGvVkf5Xu4vzbzoGgYbf0ehfjljq9vB7o9hltTIyjOR813ugNXVjFPH8xrqu0PziD7nb
         ztY0jNeFBCzdr1mstEIfIsnMdGBuNTUWAGDOW9ihHXOAvlZdqZOeyzf5fFe4kOQST0WL
         yQWTfjJYuXsyVk8eEB7uXKhIaKizRbWx/KszcuRU9MiG0Jbu4Vx8YZH9yiRo0+MNhSNF
         NRew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HUxpOuiz+aOvX6zBmdfxgMUPYRyc3oE2F9IAKlQesWI=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=Y36gGqDaI6jOq4Qd3XKdm+3fyEIfcF/XHIk2GQwzbMTlLeK2zPgwILiRHLBfdxxebX
         KqP7OrXzxUwxoNM6wOvZQd4Wt3+M9RL0d3Vc9UssYdO8ouE/WrUvQzT7RKlKfv6tWksd
         VfufHKuQBijaWKWqn/ebu39p5wMoqtLKMGloecWj0jyvq4gFy3ESKnrDh/3uHr/0OSpE
         YvKp5AKhic38ctczyWh4x0NKchSioX61WdXMySw9nbMbTVXjzCMs5jqCqPBrd5ueIzKx
         tZOxG1VOYGVSnFKz/mqcTetY/wtcUIvqoQWc6sQUcF44D4Ni3giKYH64LeTwZjayEPr5
         OX7Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776333543; x=1776938343; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUxpOuiz+aOvX6zBmdfxgMUPYRyc3oE2F9IAKlQesWI=;
        b=tCkSWN88I05zlZRQSR1nF+bswDmtbZYn4TSnL/KDlRNzIET+Vep4h9UPEP4SRwvGyz
         rO3u60VkqvuSKNtGyk8lbx4zYtWYVl3Tp59nTfl+xvoqKhrDIXvu6PFpeNn5Gi0ASWgX
         SVavyGm7OWmSBCH8HhXpju0nMoiR+ZEkjCMorqseQWasyurIVSEBZtFv6gJdJ6y99iIn
         bctTN0ujTIAt1u/tBmAnzG7g0xPb8jezbpEo0keJxErH6kgHWWNrZSdqejSRWcjXNL/R
         BlpCIOw8TGphRWz8vpZhXisKPTEtviNPDsHVH0BMvGADhkPgknp85pCmRvqR/h2TWl+E
         OJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776333543; x=1776938343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HUxpOuiz+aOvX6zBmdfxgMUPYRyc3oE2F9IAKlQesWI=;
        b=UFpiksEFJmL2KXHb2KIcWB0joRqwpgHdN+PrFJQ1jWYsusQ5L/Z0UbmZOX1Ff4kjob
         XQTqIpCrOamFYD05FhfdRU9l+az9EMMTIGvwtLbgHOsAoj/aEcDflzqTmrPXors3zsHz
         v/MnSLkG/4nX7lZ1NGVCN/4aaRNxTr6ofr7ac5KxlbNQnrOFKaGzFMyXAe/uETTCOdw0
         8tscPVn2IkcwsIXFb3GAYICngAhHkC907eKj/dp1V7YQS2Q4WoYfhX2gUnLprcASukZb
         xULl8ooYlgAXDf12fZ1I/kJPN0FYK+VRUHQdeBPCzu+B6fB/FTbxduR3SQFSrZ/xfw89
         Uxhw==
X-Gm-Message-State: AOJu0YxthX4vDSMvjQZ0imPQLrupaNOzUm3RPNFUmLY82YDZc4LtzMf0
	zqkX9oEmKtnjmS8LbCfDSBVUqNWblK3na1j4EdOzd2M702nMNfjKk76YZWI7vWnreqMkxzPRaHm
	DBoDkMxdC8iTpawtdKBjqd0t/0G00HHxdWQO2mho=
X-Gm-Gg: AeBDiesCwbIiNvl+Ukuaep+yPfi4HJn36l+cwnnCfJDy6rGBWAXbo7MF/ETrNYcMZUS
	e1FPKA3RVRngyckd+Y89IepeW3g24pZ4QGn7k8e9GTsVhUv1bEWnjDlSg5vengGBOfhhbhIlNqT
	gAOl14Y/No/Jd7iPIbcbz+pwi+FDbRsN0f9XNTrBYjfA8PPpIuKh+MntiUe9Lhekb3cjcYESfOp
	NSiT9P7dmrBKxhAWZaF28n18D85oefaFMxUBF9LR1niF0s6qlqK5HWPWHsTZkaad76CyNrJGdAs
	haRHcB6oo5w31iJVMwg=
X-Received: by 2002:a05:6512:1302:b0:5a4:f0:c4c1 with SMTP id
 2adb3069b0e04-5a40df63d88mr992181e87.2.1776333542880; Thu, 16 Apr 2026
 02:59:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415082654.21026-12-kerneljasonxing@gmail.com> <20260415093801.0CECEC19424@smtp.kernel.org>
In-Reply-To: <20260415093801.0CECEC19424@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Thu, 16 Apr 2026 17:58:25 +0800
X-Gm-Features: AQROBzDgK52vu34vOfi2wBv8wO9PH-S6Ynn9N1Jw_mPIutb-OW6GDjEWc8Iof9c
Message-ID: <CAL+tcoDTZQueaNgcG+90wZohcU4c3Btn74McteqU7DSN=HgucQ@mail.gmail.com>
Subject: Re: [PATCH RFC net-next v4 11/14] xsk: support batch xmit main logic
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 5:38=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 5 potential issue(s):
> - [Critical] TOCTOU race on socket state pointers leading to NULL pointer=
 dereference and Use-After-Free.
> - [Critical] Integer underflow in `xsk_alloc_batch_skb()` leading to mass=
ive OOB memory allocation and kernel crash.
> - [Critical] Unconditional dropping of partially built packets (`xs->skb`=
) causes buffer leaks and packet stream corruption.
> - [High] Double cancellation of CQ slots and incorrect TX pointer manipul=
ation on SKB build failure.
> - [High] Infinite `-EAGAIN` livelock and stat inflation when packets span=
 batch boundaries.
> --
>
> commit 4041fe3cb310f6f01b04ae2ff1fbd04cf0aa2713
> Author: Jason Xing <kernelxing@tencent.com>
> xsk: support batch xmit main logic
>
> This commit implements the core logic for batched transmission in AF_XDP
> sockets via __xsk_generic_xmit_batch(). It introduces a loop to read
> descriptors, reserve completion queue slots, allocate SKBs, and transmit
> packets in batches.
>
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > index b4f3cc7125804..16e47f6fc30ec 100644
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
> [ ... ]
> > @@ -914,6 +914,122 @@ struct sk_buff *xsk_build_skb(struct xdp_sock *xs=
,
> >       return ERR_PTR(err);
> >  }
> >
> > +static int __xsk_generic_xmit_batch(struct xdp_sock *xs)
> > +{
> > +     struct xsk_buff_pool *pool =3D xs->pool;
> > +     struct xsk_batch *batch =3D &xs->batch;
> > +     struct xdp_desc *descs =3D batch->desc_cache;
> > +     struct net_device *dev =3D xs->dev;
> > +     u32 max_batch, max_budget;
> > +     bool sent_frame =3D false;
> > +     struct sk_buff *skb;
> > +     u32 cons_descs;
> > +     int err =3D 0;
> > +     u32 i =3D 0;
> > +
> > +     mutex_lock(&xs->mutex);
>
> Can a TOCTOU race occur here with a concurrent socket bind() or setsockop=
t()?
>
> The pointers for pool, dev, and batch->desc_cache are read before the mut=
ex
> is acquired. If another thread modifies the socket state, could these
> pointers be NULL or freed by the time xsk_is_bound() is checked, leading =
to
> a use-after-free or NULL pointer dereference when accessing dev or descs?

Indeed, I'm going to move those read operations under the mutex lock protec=
tion.

>
> > +
> > +     /* Since we dropped the RCU read lock, the socket state might hav=
e changed. */
> > +     if (unlikely(!xsk_is_bound(xs))) {
> [ ... ]
> > +     for (i =3D 0; i < max_budget; i +=3D cons_descs) {
> > +             u32 nb_pkts =3D 0;
> > +             u32 nb_descs;
> [ ... ]
> > +             cons_descs =3D xskq_cons_read_desc_batch_copy(xs->tx, poo=
l, descs,
> > +                                                         nb_descs, &nb=
_pkts);
> > +             if (cons_descs < nb_descs) {
> > +                     u32 delta =3D nb_descs - cons_descs;
> > +
> > +                     xsk_cq_cancel_locked(pool, delta);
> > +                     xs->tx->queue_empty_descs +=3D delta;
> > +                     if (!cons_descs) {
> > +                             err =3D -EAGAIN;
> > +                             goto out;
> > +                     }
>
> Could this lead to an infinite -EAGAIN livelock and inflated statistics?
>
> If a multi-fragment packet spans beyond the nb_descs batch limit without =
an
> end-of-packet descriptor, xskq_cons_read_desc_batch_copy() might safely
> rewind the fragments and return 0. The code then treats these valid
> descriptors as empty, adds to queue_empty_descs, and returns -EAGAIN,
> causing the application to loop infinitely hitting the same boundary.

Point taken. It costs me some time to investigate how to support
multi-buffer in this scenario. I finally come to conclusion that
change the behavior of __xskq_cons_read_desc_batch() should be fine:
diff --git a/net/xdp/xsk_queue.h b/net/xdp/xsk_queue.h
index c3b97c6f2910..c8b7079a6728 100644
--- a/net/xdp/xsk_queue.h
+++ b/net/xdp/xsk_queue.h
@@ -270,6 +270,7 @@ __xskq_cons_read_desc_batch(struct xsk_queue *q,
struct xsk_buff_pool *pool,
 {
        u32 cached_cons =3D q->cached_cons, nb_entries =3D 0;
        u32 total_descs =3D 0, nr_frags =3D 0;
+       bool copy =3D !!nb_pkts;

        /* track first entry, if stumble upon *any* invalid descriptor, rew=
ind
         * current packet that consists of frags and stop the processing
@@ -288,7 +289,7 @@ __xskq_cons_read_desc_batch(struct xsk_queue *q,
struct xsk_buff_pool *pool,
                if (likely(!parsed.mb)) {
                        total_descs +=3D (nr_frags + 1);
                        nr_frags =3D 0;
-                       if (nb_pkts)
+                       if (copy)
                                (*nb_pkts)++;
                } else {
                        nr_frags++;
@@ -300,10 +301,11 @@ __xskq_cons_read_desc_batch(struct xsk_queue *q,
struct xsk_buff_pool *pool,
                nb_entries++;
        }

-       cached_cons -=3D nr_frags;
+       if (!copy)
+               cached_cons -=3D nr_frags;
        /* Release valid plus any invalid entries */
        xskq_cons_release_n(q, cached_cons - q->cached_cons);
-       return total_descs;
+       return copy ? nb_entries : total_descs;
 }

 static inline u32

After this, this function shall return the correct descriptors.

>
> > +                     nb_descs =3D cons_descs;
> > +             }
> > +
> > +             cons_descs =3D xsk_alloc_batch_skb(xs, nb_pkts, nb_descs,=
 &err);
>
> Does this calculation of nb_pkts trigger an integer underflow?
>
> If a batch contains only fragments without an end-of-packet flag, nb_pkts
> will be 0. Inside xsk_alloc_batch_skb(), if there is an existing partiall=
y
> built skb (xs->skb !=3D NULL), the code may decrement nb_pkts. Since nb_p=
kts
> is unsigned, nb_pkts-- would underflow to 0xFFFFFFFF, resulting in a
> massive out-of-bounds memory allocation.

Right, I should avoid that under the condition where the nb_pkts is zero :
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index a61477d04c14..e04eda59eb7a 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -671,7 +671,7 @@ int xsk_alloc_batch_skb(struct xdp_sock *xs, u32
nb_pkts, u32 nb_descs, int *err
        if (!(dev->priv_flags & IFF_TX_SKB_NO_LINEAR))
                base_len +=3D dev->needed_tailroom;

-       if (xs->skb)
+       if (xs->skb && nb_pkts > 0)
                nb_pkts--;

        if (skb_count >=3D nb_pkts)

>
> > +             /* Return 'nb_descs - cons_descs' number of descs to the
> > +              * pool if the batch allocation partially fails
> > +              */
> > +             if (cons_descs < nb_descs) {
> > +                     xskq_cons_cancel_n(xs->tx, nb_descs - cons_descs)=
;
> > +                     xsk_cq_cancel_locked(pool, nb_descs - cons_descs)=
;
> > +             }
>
> Can this cause a double cancellation of completion queue slots?
>
> If xsk_build_skb() fails inside xsk_alloc_batch_skb() due to memory limit=
s,
> it already calls xsk_cq_cancel_locked() internally:
>
> net/xdp/xsk.c:xsk_build_skb() {
>         ...
>         if (err =3D=3D -EOVERFLOW) {
>                 ...
>         } else {
>                 xsk_cq_cancel_locked(xs->pool, 1);
>         }
> }
>
> Calling xsk_cq_cancel_locked() again here for the failed descriptors woul=
d
> underflow the completion queue pointers, potentially corrupting the user
> space ring buffer.
>
> Also, does xsk_build_skb() advancing the TX consumer pointer on -EOVERFLO=
W
> conflict with the rewind happening here?

Right, I mentioned in the previous patch that we can handle this issue
in patch 2 to bypass this part in batch mode to solve the problem.

>
> [ ... ]
> > +             if (err)
> > +                     goto out;
> > +     }
> > +
> > +     /* Maximum budget of descriptors have been consumed */
> > +     if (xskq_has_descs(xs->tx))
> > +             err =3D -EAGAIN;
> > +
> > +out:
> > +     if (xs->skb)
> > +             xsk_drop_skb(xs->skb);
>
> Does unconditionally dropping the partially built xs->skb corrupt the pac=
ket
> stream?
>
> If transmission hits a NETDEV_TX_BUSY (-EAGAIN) or a valid multi-fragment
> packet spans a batch boundary, the code drops the fragments processed so =
far.
> Because the completion queue slots and TX pointers for these early fragme=
nts
> might not be properly rewound or notified, does this permanently leak buf=
fers
> and merge unrelated fragments into corrupted packets on the next sendmsg(=
)
> retry?

Right. It will be fixed by:
diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
index 8c115202fe42..c7c81ee81c00 100644
--- a/net/xdp/xsk.c
+++ b/net/xdp/xsk.c
@@ -1020,7 +1020,7 @@ static int __xsk_generic_xmit_batch(struct xdp_sock *=
xs)
                err =3D -EAGAIN;

 out:
-       if (xs->skb)
+       if (xs->skb && err !=3D -EAGAIN)
                xsk_drop_skb(xs->skb);

Thanks,
Jason

>
> > +
> > +     /* If send_queue has more pending skbs, we must to clear
> > +      * the rest of them.
> > +      */
> > +     while ((skb =3D __skb_dequeue(&batch->send_queue)) !=3D NULL) {
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260415082654.21=
026-1-kerneljasonxing@gmail.com?part=3D11
