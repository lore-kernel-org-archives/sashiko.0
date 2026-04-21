Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FECF3D565F
	for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 12:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776775609; cv=pass; b=ZylIS06GzrniBIUBJ+Djjtv1ymuIz2GOSR5MjZg1pugbDLKv+daduonwKTT0vMk7Gsmgu/PUDrD2dL73LtryzM9i00ye3GpOTabx83HCEN2mTUnNbnOuQaau5pb305fu5DKticy7zyXyJWdMHwf0ht90drOTDVTmAXJNdt6PhEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776775609; c=relaxed/simple;
	bh=QKhrKmLJ8uvOBD3yo0buw5CSe/PN95d4YOSFY7J22wE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oIk9Qe+9ww5+mB5kTchB23WdP3lh4BRrPNhoHM9gnkeNYYXHOCDS5QzjfajbkDGLbdflGS0bPfJZHnJ4m1ChZnhoDpupaKuCE4oUbbgzOKeYZMXf4W/fqHBDJ9UsIHB9sT9slVzZAAJBkTvtbyDgBFL1Xyzs45UvIe65PwnzKqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jq4xwwLa; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jq4xwwLa"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-386b553c70eso33829111fa.0
        for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 05:46:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776775606; cv=none;
        d=google.com; s=arc-20240605;
        b=ETqFF5ZPaJlmkUQvqgbbldc9fur07fd6Mrk1N0Io787DCTWHoXR44tY4QFFpFj989L
         ioLT/mzIfnn44q2thA1R03IBIOe7R9vvebVJ0hvJ8aaUbhVyi5Flk6sR+lJVZcJXrxaK
         JZ3wVCchFJc9yp5bTJFBfY0SFQjgjq/Blrw9WHkWnMZbArFNs78Qe+ISay40DYO2m8Vi
         2uW2IgsA3yFFqugonruiYrlwWMVdexDe/TasyoxBqs7Vf9NmuALF9Nu9VxMbeEsjQ5wY
         iL1w8Rb7ym+Ta3oyy2bpgS6M7Hb2g42kov9jjGNS8B+2btx5utvmPumrBxGf8Ja8YzAk
         4DEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sKNxcZnpQRKJin6AtPmQmdcGPEHcDYeHh+yBhiH6NjM=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=G+TAh+XJa7Cw64UEXDBS4T0cM1IRxrXGqUvj9IJc4LqdglQHxVBpmPIM9P1BByzNyE
         EwvDvbx/WCQhof3IIXjbT7eFtZuRgKOsL19/3vBQaxWbLBsF8s0YJw19P4TBip22k+ED
         AI2TUMnY65miSVZkcSWN1h2v/dy7KwkYtAwh+pPR+0/gOL0SikXy5hzGbv229Ago+iqT
         6e3wVhaiI13jQ1bXbVjSq0DM7dboOJKWiY2e9F5EmsZhPjHSZVPTXXgHzIUA+Z//cBjw
         yNqkEj/fhjcDwUCoCMdUoBKEIPQWCr7o/qIUUuogyRlFuUecPOEX1Kw31vRsvKElLMHI
         AlZw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776775606; x=1777380406; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sKNxcZnpQRKJin6AtPmQmdcGPEHcDYeHh+yBhiH6NjM=;
        b=jq4xwwLaWEN8PMRO61K+QV7h6PmHU+4ofN8u4ppkOzG7aPciRoN075dtIMcOKRTne6
         FsXUuyGoaeQCsMdFYk61dSB208DazqEBS0Yq6c2kNGkQZY7phcyo4SmtVUPLvFq5ygXM
         juJyUlWp/lCsPjq5SFxr/aiQarH/1K37XXs72+b/Zay1toFKz95yni0L+easgrTDvkoS
         bsMXQYmhW70u2umjv5aGbDUDAxwRUfyhy9Uy4SEjZ98xZ3RL+YZUGSVhlH+LCYpayf5o
         TCJ6MOb+Ueg3mViFd3Qwuy6l6VUICK9/MuQ0w7Yekvvr/nvxuYZ1R+rtHPK2QqDp8p0R
         RKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776775606; x=1777380406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sKNxcZnpQRKJin6AtPmQmdcGPEHcDYeHh+yBhiH6NjM=;
        b=OhTw00nV7c46R0F8MOrHiJWEPmjh2YbsWXBR7iXak24kjXZECRJ8qdpAggTRfxYoc+
         aJt6uwaQjw6Y/MXkioZfL09UQcVGu6iEgGEUzmngX13QlbxXNPG7hBcymXPo47GotbFW
         gpmqfs+BZWKmq71idi8z0wvQP9KL0QYe9Sz7irqvcogVfvqG8Y6GgvagZYSYCyQro0ge
         HmPb2KJoaVMOJq3hRFvl1K6d4fiDmTQ44N98SxLvktzmAeaXVptBpYfeATCM3Lp9Cbc3
         /b8cf/RfRnTE92H0Q6nUArtacmmVJLXBCOdlV6QYLezIAT1V589g+FzUlV+jVuFF1nVF
         0bMw==
X-Gm-Message-State: AOJu0YxEXtSAaWM+7yNVlgUCko/7S3o2hm+EC0nax/VFkYH0+jQcTWGf
	J2LTR2KYKl7lR3lQ5/iJ+BzEYOcD9uSMbVpHp+ljAOuYPungs+dz4arbW7uZFvRKH/0NCHv4575
	PIYnSc7OJ0ZbsQjkqwo/8PFARp3bKaf4vFLyJ
X-Gm-Gg: AeBDieu7VsWMRxi9FHCJCDuFABcsaIPBOVnG2a+On5JHL3YCnQJiZBj5tSvKPR6HCfW
	hFSUJlSVpLwsWSG6MfB8Xhb6Lv4SHLi04XUJmfLZmty0Cp/mBGHQCXmKHMWDovAGwu17XREOy96
	mRoafLQJJQwMHap5EaT0APSRoaqWUYBFx/9qbg4wAo0R54xAoqnzKaKMtWkzCfj+orpYh8waFQ9
	MUAXRV0uJc5W5xCVU6tNumcZydFwSra2S7qu7FcFOxnEBnBwK7uZ8WI+gZasWck19lMMoIajFzE
	1b7qE7ZtzN045x2FPS2yPvD/aOkP
X-Received: by 2002:a05:6512:108d:b0:5a4:1add:c583 with SMTP id
 2adb3069b0e04-5a41addc69dmr4897729e87.41.1776775605928; Tue, 21 Apr 2026
 05:46:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420082805.14844-3-kerneljasonxing@gmail.com> <20260421094023.69C89C2BCB0@smtp.kernel.org>
In-Reply-To: <20260421094023.69C89C2BCB0@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Tue, 21 Apr 2026 20:46:08 +0800
X-Gm-Features: AQROBzDiVgJ0CPRwqId_m8MuXK9Bi_etdxEb0Yl49zkSHWCrwCFfuDGYPB07vCI
Message-ID: <CAL+tcoCXK=rjLQ9-1K-MRVvbfN_DSr8XP+mY5XnyrGUwCpFBsw@mail.gmail.com>
Subject: Re: [PATCH net v2 2/8] xsk: handle NULL dereference of the skb
 without frags issue
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 5:40=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 1 potential issue(s):
> - [High] Memory leak of newly allocated skb in `xsk_build_skb_zerocopy()`=
 on error paths for the first descriptor.
> --
>
> commit c0083470d60454acdbd801635be8f00a9b79a9eb
> Author: Jason Xing <kerneljasonxing@gmail.com>
>
> xsk: handle NULL dereference of the skb without frags issue
>
> This commit addresses a NULL pointer dereference in the error handling
> path of xsk_build_skb by explicitly checking if xs->skb is NULL. For the
> first-descriptor case, it cancels the CQ slot and tracks the invalid
> descriptor instead of dropping the skb.
>
> > In this series, the skb is already freed by kfree_skb() inside
> > xsk_build_skb_zerocopy for the first-descriptor case, so we only need
> > to do the bookkeeping: cancel the one reserved CQ slot and account for
> > the single invalid descriptor.
>
> Is this description accurate regarding the skb being freed?
>
> Looking at xsk_build_skb(), if xsk_build_skb_zerocopy() encounters an
> error and returns an error pointer, the local skb variable is set to
> NULL before jumping to the free_err label:
>
>     skb =3D xsk_build_skb_zerocopy(xs, desc);
>     if (IS_ERR(skb)) {
>         err =3D PTR_ERR(skb);
>         skb =3D NULL;
>         goto free_err;
>     }
>
> Since skb is NULL, the cleanup code at free_err is bypassed:
>
> free_err:
>     if (skb && !skb_shinfo(skb)->nr_frags)
>         kfree_skb(skb);
>
> Does this code leak the newly allocated skb and its sk_wmem_alloc charge
> when xsk_build_skb_zerocopy() fails on the first descriptor?
>
> I see this is addressed later in the series by commit aef1b3344bd95
> ("xsk: avoid skb leak in XDP_TX_METADATA case") and commit 93315725e1616
> ("xsk: free the skb when hitting the upper bound MAX_SKB_FRAGS"), but
> the commit message here appears to incorrectly assume the free is already
> happening.

They are already fixed in the series. And what I mentioned is "In the
series,...".

>
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > index 887abed254668..54d4895fc11eb 100644
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
>
> [ ... ]
>
> > @@ -973,9 +973,14 @@ static struct sk_buff *xsk_build_skb(struct xdp_so=
ck *xs,
> >               kfree_skb(skb);
> >
> >       if (err =3D=3D -EOVERFLOW) {
> > -             /* Drop the packet */
> > -             xsk_inc_num_desc(xs->skb);
> > -             xsk_drop_skb(xs->skb);
> > +             if (xs->skb) {
> > +                     /* Drop the packet */
> > +                     xsk_inc_num_desc(xs->skb);
> > +                     xsk_drop_skb(xs->skb);
> > +             } else {
> > +                     xsk_cq_cancel_locked(xs->pool, 1);
> > +                     xs->tx->invalid_descs++;
> > +             }
>
> Because the skb wasn't freed as the commit message assumed, can a
> malicious application exploit this missing kfree_skb by repeatedly
> supplying abnormally large descriptors to exhaust socket buffer memory?

It can happen but it doesn't belong to what I should here.

>
> >               xskq_cons_release(xs->tx);
> >       } else {
> >               /* Let application retry */
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260420082805.14=
844-1-kerneljasonxing@gmail.com?part=3D2
