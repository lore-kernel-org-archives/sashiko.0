Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979A33A5E6F
	for <sashiko@lists.linux.dev>; Tue,  5 May 2026 19:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778010414; cv=pass; b=hyufHgagpT73ZCt4M8xz+7qAZsrr9ovpN+MrH2HeoxRDR7HsNkJeNk2eztVQMy+EBa/71CYbste9V78Dh8TPPhpZJH4zkKszGMSyr/iBoMyICIMf4cBUtCsZI3i61/Ysgv8Awh39tjOjbOKnDqHrBeSOWCGPL8niTiPBI9GxXGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778010414; c=relaxed/simple;
	bh=E357EEz6wA12TgsMkENSmkoFH2QFS+9tNac78U2KDko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oDu0cbxCQR9ExvMDlFoBz8F6M+QzWeZ7XQVbBjpoJvLhM3OZxZrbfldjQ7b2Ae4ccG7LWqEv4+7ek5efqDDVGJobacAUleKOsbV++R9v+mntV5HZ3tZPe4eALdoqQ/Aj438Vv/AV3JMD+yx9X6qsKHrk1bNwIjUflyFum5LBqFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+mzutl0; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+mzutl0"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a884815606so828375e87.0
        for <sashiko@lists.linux.dev>; Tue, 05 May 2026 12:46:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778010409; cv=none;
        d=google.com; s=arc-20240605;
        b=ibY9xHRSKrrImhkij5XBgessLyzq2PvG6nVGa5/f4q2pUFWJUEWFHXlZ43dWLqFfNO
         zsBjmgTfGhuK5CYxiFLq6WdsRpC5Lm9GXvKw2OMUJw1j1jc63z2kaqJe4EYpM3sa1Emr
         AK+ZjH0MS/ngE41TYptJ+x0E1PxpjELd9+yC3b0tt8X/TgfzKykw8IQTLsdQ3dOonwJq
         RIT3a8YZGeR7vj+oWFXP6O0beuVSi4lvaBTn/7t62l4DlgKdto/8dhRep5dfcQtoojIl
         aZTBDZxCojmeDGAwpJ0Bjo8rHUoCR67AU4DJHh/0lImDkeLU8aROXnXLIM5lfb2uEE6/
         76SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pWU9rOpaHZ1DhhXMYqH7oDqxMjcohg/E8GRcu0AFpqo=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=AkKsWfAYwFcnWuQypGRDrrnp6SXnMdtfaPz8vQa+wMiHD2Rqlq3mIYPdWMmJ7nFHD9
         3JzIlRT24tcItKHF2jLCSKJ7BoX2FesI+9iBuuil7PRkZKjkUrEDy26UlzTIoiSCOZFA
         u/Zsye8QFr28c50XrQHeI45JjCAL9uFJQk99nd+8wl186GFnlAdHFOb3oeU5sJeiFg7U
         1rb6S0TLY/oEs2pGcN6eeXuw7/tMNXQ04vVdA9FmtS+VJgPubEu6k8Vw5kpgmgU2eB+b
         uoFrO7hrprpVwwaQqoO5/sk1TjimWkStvIiRtMLA3h60nDe2S6vDzs2N0qpuCTs0tvNR
         WoFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778010409; x=1778615209; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWU9rOpaHZ1DhhXMYqH7oDqxMjcohg/E8GRcu0AFpqo=;
        b=l+mzutl0mUSQGtVB8MSZkIIH8huqTWR7/jIQPo4ihJN6N2Zv9CDCMURG2Odn+p/+ai
         jq/GXLG8GsypMSjhlbbmWonw1CxNifl/osfKUBknswbNrL4hiOG+qTlkiGR8jEGgkQgi
         FYP8d75f7nVv5CfmKDJ1TxpcVaEIh1vci1gGoft6CP7uCX+8OauRoxIzCsvQc5zp+bbG
         CPYhm9CI84xZiO3Fd1ExJU+6v20oPsnRiGWPwhHQBZKS74As59FERNATX6VEZa2TGfPu
         Ritv5ALpEMrv8HflPKizi2GD4oO/di6kHC33uZstJKo9nwpZcAiVCbCNdwHvenwdcd43
         gmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778010409; x=1778615209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pWU9rOpaHZ1DhhXMYqH7oDqxMjcohg/E8GRcu0AFpqo=;
        b=sKQeCyOu8VfEuCU3x0p2H9esGNGZN7NRbkJGh6mWOd2hk28VgG4Yp3rGxJSxtYtZ9s
         cIF5T/EqXfopRuZ3Ug8c8Bc+iZ87rgdVvOtjLK0XdCPU8XvCS1OI0b1WXCQOy5YLtzmR
         aK8SPaGaYSnPorLKAz7eqxvTx1QVgKn755KXcUctQ0L1RvRdohoEiCLpenGH5ZdyQwzO
         MuqBQDbXbAw/maDeOO602kR3XAjA5QgOYYLwfTOmbqmHHl1/lGrIjBnoKqz33Aq6mcRs
         5fBdgifmzgoooEmccvTIoJaqpknRswDkkqjR8QKO6Ojqs+EPplXPjXZjhMUx91gSU7vR
         axpA==
X-Gm-Message-State: AOJu0YxCUIv1MMR+owxfaa3gda6bJLwPaHVjLYPLdUuzrD65M5lrNYh4
	XvD8MRQZZGe8sDs+iFArSNARRG/rtnN5i6xmCMBIQITByp/2o7FhX9udx+6lLJYbmmqax1OzLOZ
	JTs/DYjjj0xHYwb49maSNAAxEl6mkkAO/mA4KBoNQ4A==
X-Gm-Gg: AeBDiet3AM8kSl5zGqJ5mGJlkTuXVO1cQsic5yjYIMrfhMNRyItlSYiLLlKLSiTcKex
	VTwA4ZHudoIIVEszYxcwPufm/vsLWoBNny+IWKW7o+hMuffO13LTvBSqEcJHleNoXauQ+RkgFKc
	1SbK0fPbVOnZfCmJp1ShFtU2avpEd/cPQqrSlbO0fc2KMXdlfIqYHtCzlvffOSB1KChFSmBdrVZ
	fyLi02pVTOv4UY7Cw9mF+w9PISeLuwMEWfi2cvVT+UOgcYVBgkEN2CsJcAuWKpYEW/fKDSrAf9z
	rSxLIlIk6zuw96W+YCFnMnvWqu4moI6udNpaz44kcRU5x9Vb
X-Received: by 2002:a05:6512:3a8e:b0:5a7:49ed:8aa with SMTP id
 2adb3069b0e04-5a887adfc1bmr58626e87.11.1778010409350; Tue, 05 May 2026
 12:46:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260502200722.53960-9-kerneljasonxing@gmail.com> <20260503200928.5988DC2BCB4@smtp.kernel.org>
In-Reply-To: <20260503200928.5988DC2BCB4@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Tue, 5 May 2026 22:46:05 +0300
X-Gm-Features: AVHnY4LBojguOcRNc5OxJ3xvYVr8nJ5tvHPQKuM4JG_dxX64kfAOGRi4oc5nZsw
Message-ID: <CAL+tcoAK-X3Tn-7Gc4X6UjW1FUBSKquqsKOFF1UBBLGeGWMSRQ@mail.gmail.com>
Subject: Re: [PATCH net v5 8/8] xsk: fix u64 descriptor address truncation on
 32-bit architectures
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 3, 2026 at 11:09=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] In the copy-mode TX path (`xsk_build_skb`), if a multi-buffer fr=
agment exceeds the `MAX_SKB_FRAGS` limit, the buffer's address is leaked to=
 userspace because `0` is erroneously submitted to the completion queue.
> --
>
> commit 4a776aefc60aa4d3123e7e63fd8f927f3748d008
> Author: Jason Xing <kerneljasonxing@gmail.com>
>
> xsk: fix u64 descriptor address truncation on 32-bit architectures
>
> This commit fixes a 32-bit truncation issue when storing 64-bit descripto=
r
> addresses in the SKB destructor argument by allocating an xsk_addrs struc=
t.
> It consolidates the allocation logic into xsk_addrs_alloc() and uses it i=
n
> both zerocopy and copy modes.
>
> Link: https://lore.kernel.org/all/20260419045824.D9E5EC2BCAF@smtp.kernel.=
org/
>
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > index 079abd4bcb69..5e5786cd9af5 100644
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
>
> [ ... ]
>
> > @@ -929,19 +959,10 @@ static struct sk_buff *xsk_build_skb(struct xdp_s=
ock *xs,
> >                       struct page *page;
> >                       u8 *vaddr;
> >
> > -                     if (xsk_skb_destructor_is_addr(skb)) {
> > -                             xsk_addr =3D kmem_cache_zalloc(xsk_tx_gen=
eric_cache,
> > -                                                          GFP_KERNEL);
> > -                             if (!xsk_addr) {
> > -                                     err =3D -ENOMEM;
> > -                                     goto free_err;
> > -                             }
> > -
> > -                             xsk_addr->num_descs =3D 1;
> > -                             xsk_addr->addrs[0] =3D xsk_skb_destructor=
_get_addr(skb);
> > -                             skb_shinfo(skb)->destructor_arg =3D (void=
 *)xsk_addr;
> > -                     } else {
> > -                             xsk_addr =3D (struct xsk_addrs *)skb_shin=
fo(skb)->destructor_arg;
> > +                     xsk_addr =3D xsk_addrs_alloc(skb);
> > +                     if (!xsk_addr) {
> > +                             err =3D -ENOMEM;
> > +                             goto free_err;
> >                       }
> >
> >                       if (unlikely(nr_frags =3D=3D (MAX_SKB_FRAGS - 1) =
&& xp_mb_desc(desc))) {
>
> This isn't a regression introduced by this patch, but while looking at th=
e
> modified code, does this error handling path leak the buffer's address to
> userspace?
>
> If this overflow check evaluates to true, the code sets err =3D -EOVERFLO=
W and
> jumps to the free_err label before assigning desc->addr to
> xsk_addr->addrs[xsk_addr->num_descs].
>
> In the free_err block, it handles -EOVERFLOW by calling
> xsk_inc_num_desc(xs->skb) and xsk_drop_skb(xs->skb). This increments
> num_descs to account for the dropped descriptor and eventually calls
> xsk_destruct_skb() which calls xsk_cq_submit_addr_locked().
>
> Since xsk_addr->addrs was never initialized with desc->addr for this
> descriptor, does this mean it submits 0 (from kmem_cache_zalloc) to the
> completion queue instead of the actual buffer address, causing userspace
> to permanently lose track of the buffer?
>
> By comparison, xsk_build_skb_zerocopy() assigns desc->addr to the array
> before checking the fragment limit:
>
> net/xdp/xsk.c:xsk_build_skb_zerocopy() {
>     ...
>                 xsk_addr =3D xsk_addrs_alloc(skb);
>                 if (!xsk_addr)
>                         return ERR_PTR(-ENOMEM);
>
>                 /* in case of -EOVERFLOW that could happen below,
>                  * xsk_consume_skb() will release this node as whole skb
>                  * would be dropped, which implies freeing all list eleme=
nts
>                  */
>                 xsk_addr->addrs[xsk_addr->num_descs] =3D desc->addr;
>         }
>
>         len =3D desc->len;
>     ...
> }
>
> Should xsk_build_skb() also record the descriptor address before checking
> the -EOVERFLOW condition?

It has already been uncovered by you, maybe in v4 or v3 :) Sure, it
will be fixed after this patch gets merged.

Thanks,
Jason

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260502200722.53=
960-1-kerneljasonxing@gmail.com?part=3D8
