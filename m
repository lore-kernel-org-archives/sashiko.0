Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A13718BC3D
	for <sashiko@lists.linux.dev>; Sun, 19 Apr 2026 14:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776607809; cv=pass; b=QdEVuy1jzAe/YfYp1aBUsEiFU6SBurwvyOEMxD3201l4Ts9+ZAK1waJeOGxu11VbEEAK2zI1Hj9Haw1VVlqvZ8l2cjy1IB/zDOe1Xo6mNUO2tdV/8lJWxOEJtvy/8WIbNy+DIo6gJ1BeKCyVSOT0YQ90PjUuU3EJ+0A4wT+t9Bg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776607809; c=relaxed/simple;
	bh=FTki9bCzEbIWjDU0LcxyaxfwDRIFHTIRbOOJ3Rc3s+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YQBllPLMhmG4KJRd09vdCc4AmHtPW7AOwKxBWKec46SC8ZaeB3zGrW0004AbfHEm26A3gSWkZWaMBUY7qcyuw1mjGHKLFUPxIZLdqFL4mRUucFoqrfTtANm0LPcyzONGn0Rt/5XUApZpmI3PMwrHBP8q8M6i3CXbGs9ysCXo7Pg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XnwaRpWT; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XnwaRpWT"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a3d42263e4so2127834e87.2
        for <sashiko@lists.linux.dev>; Sun, 19 Apr 2026 07:10:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776607806; cv=none;
        d=google.com; s=arc-20240605;
        b=VQeIHJfyCybV/X7qqbfuCMy4g3od3WzriLfj0OwJP4uPKwO8l+vlBfvUt5/Rs8M39w
         eZa8lvw0gLglNjmIgbaG5xYFMfUtzrNyNeb1iKtx6r7TSLnexhOj5fsnjLjiO/M8Rvtz
         yFxYcyAwLfZRoa4lDZhZtzuNL2lN98A19sv6tntmdngFKcOBE64Xeo45IJJt9MVTNpk/
         fF6k+FEEJLQmomogaKQd1gCfymxehrA5TW5AO5BtL4Ds+3vxxLrpK8nf6y0bl8H4j5u9
         SX5Vg511UFGt2QKTDRTrY3fRbhX0cRNEGLYSMehhZEfrB6/FHL5LjModR8/DEApUw5xx
         fRZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P7lkofk80y5ASD7Y3pVbAIezkpP2DV7oPOOMIxhfpcw=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=SSN8IUOmX6Cyg/psD4fbcc2kbEBu/rtHKZY0JEuQZLs91QfHTm+5t8bAah+9iwK0jp
         7ELwccAnRCKrkLthHYdM9PQIjiT17gJwb0x0xM0EX30av3KcFRe1CUVtydXykt1nOhjO
         2v0YJ9Yf9NsRXZrG1Bd5etb41UO3hFVRgbuaAYFfgSNo0E3Y7NrT9Mfkq3YqswzZcRtS
         2fKi+U8vN5Wd+Sx7wMEoygvrGpPXp9WxgipCxhRxbvzFjfLXBpX1pk3Wz10M6pcOpj+N
         ztCyxUC5yjmTXQyC4FoHY3XJQZ1eADQJunDWR5K4DlsPCiT090DxwSF06EezJZIdwsaJ
         3xzA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776607806; x=1777212606; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7lkofk80y5ASD7Y3pVbAIezkpP2DV7oPOOMIxhfpcw=;
        b=XnwaRpWTg0yPtA3KqezvuzXuCyOcNRzarx5Q0dPdIUiCMoCc33jrGPyHKg5ABpLK71
         HClJgU6wHtupHet2CnhN9Dxp56HMrFsYegtZEwk790V8btjkmuZmx0M3onKeyxEIlcIG
         OyEiwVYrbUw5g5h82iJ04OFVU34phIGHDzyN1cDBwB6TjAxWQ31yQMWsc0PhWZA/85n+
         QOeLRrjkZK941K0SB21qwrNwCj0ALR9Edp/7MQesDW5B9SUmb9LTCJrAJBi0yfNdFiQF
         /idFm0oyUOtTrvTefAq6U+/0Vn4DnWM0RYKdfkUbZcCtTdblcuyREvVDxSOvWhYCyzrw
         z3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776607806; x=1777212606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P7lkofk80y5ASD7Y3pVbAIezkpP2DV7oPOOMIxhfpcw=;
        b=b+r2PHqG9q7yXeLxt8QIn+gcicW/vTjlSNNjWFiblmTXEf46P/oSlRCcc54fIZugPL
         yYYXBhDpeNw/eB8OMqbQzcEo8HZcdC+AI29OSliYdiJCrAJaUTzscCxAuYkJpoyXBxXs
         j1i7stH0tpeMJAneueYGHfLa2vJ5LCkZBHK3OG9ywkYaIKRt9bz8rYdLw9a7/99TJ2qN
         XAtFpmmCeEUciwsoTKhAfFkJAYtKTUFaJrsl2M+gGpdTB0D5PrdONahUO7Ap/y20PawZ
         Ghq1b94lybfk6/FnBk744MnH2FAFOxMHyX6yYUrS6DNuel4lnCjZOps6ahS0+uykL4YS
         d+vA==
X-Gm-Message-State: AOJu0Yy7+w18UIFBQxtS+hSAp32fkcoVFiejtntt4zCybCaQLYNnKh6i
	C7DfBwpDJryzgJSqGugszPYzR8RsETjBi/hi4SHym8wFE5CiMHxIkwXRflu2E6u+iXaVS6OBEFS
	nr/K4cNIyqUHB45paPRiRDI/6vnI3IT/yd4SWlP3csQ==
X-Gm-Gg: AeBDiet+yM0jH6ulPNs1SUI4/AHIOXoXEGDgiX2dK7efhJiedTsBAXlI5x+7ugbh+PU
	VoHk093Zh81jtOzuUEwC/ZFBOC3O3WKPWqk+91vMqjZaWBK9QkbD+45dEiC7xqbC/UPLsIJfrQl
	kglsm4NiGYKd+JfXhOJZWHT7tzn/EFyCZi+nBkjcA+wFRZAupGRW0ikH5ZFMoirSlEaO08ODR6w
	X4gGRkJ3FNWnZl/ZLUT001CH79CWLKzoMJ8g8vzusj/ekgMmZSRRBZytBGdMWMIcIigHEPfWrS4
	sOC/h+4f/CrQjDX4VQ==
X-Received: by 2002:a05:6512:6c7:b0:5a2:c766:13bb with SMTP id
 2adb3069b0e04-5a4172cc01dmr3031631e87.18.1776607805655; Sun, 19 Apr 2026
 07:10:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260418045644.28612-4-kerneljasonxing@gmail.com> <20260419045824.0402FC2BCAF@smtp.kernel.org>
In-Reply-To: <20260419045824.0402FC2BCAF@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Sun, 19 Apr 2026 22:09:28 +0800
X-Gm-Features: AQROBzAj5QfNvzo4HfvcWfY23xgvR6EoL_oTEqTN7mHZ9WtLplKGMNuQ-ks4tVk
Message-ID: <CAL+tcoBoKKDXKgMJucehEZnRkXOZm9EgR6RqQ2pH3SNzWDDHDQ@mail.gmail.com>
Subject: Re: [PATCH net 3/4] xsk: handle NULL dereference of the skb without
 frags issue
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 19, 2026 at 12:58=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 2 potential issue(s):
> - [Critical] Calling `kfree_skb(skb)` without clearing the SKB destructor=
 causes Completion Queue (CQ) ring corruption and false completions.
> - [High] Use-after-free of `xs->skb` in the continuation path when an err=
or like `-EAGAIN` occurs.
> --
>
> commit 1c728000f884ce0a536d9c1fd763eb0c560ada51
> Author: Jason Xing <kerneljasonxing@gmail.com>
>
> xsk: handle NULL dereference of the skb without frags issue
>
> This commit addresses a NULL pointer dereference in the error path of
> xsk_build_skb_zerocopy() by checking if xs->skb is valid before
> dereferencing it during -EOVERFLOW handling. It also adds an alternative
> branch to handle bookkeeping for the first-descriptor case.
>
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > index 3d6c6caa7ff82..2f00f188533c1 100644
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
> > @@ -978,9 +978,14 @@ static struct sk_buff *xsk_build_skb(struct xdp_so=
ck *xs,
> >               kfree_skb(skb);
>
> Can this lead to a use-after-free on xs->skb?
>
> In the non-zerocopy path, if the first descriptor is linear, nr_frags rem=
ains
> 0 and the caller __xsk_generic_xmit() stores the SKB in xs->skb.

Patch 4 already handles this.

>
> During the next iteration for a continuation descriptor, if an error like
> -EAGAIN occurs (e.g., from alloc_page()), the code jumps to the free_err
> label. The cleanup logic if (skb && !skb_shinfo(skb)->nr_frags) would
> evaluate to true, freeing the entire SKB.
>
> The function then returns -EAGAIN, leaving the freed SKB pointer in xs->s=
kb.
> On the next application retry, the code could dereference the freed xs->s=
kb.
>
> Note that this regression is fixed later in the patch series by commit 'x=
sk:
> fix use-after-free of xs->skb in xsk_build_skb() free_err path'.
>
> Also, could calling kfree_skb(skb) without clearing the SKB destructor ca=
use
> Completion Queue (CQ) ring corruption and false completions?
>
> In xsk_build_skb_zerocopy(), xsk_skb_init_misc() sets
> skb->destructor =3D xsk_destruct_skb. When an error occurs on the first
> descriptor (e.g., xsk_skb_metadata() returning -EINVAL), kfree_skb(skb) i=
s
> called.
>
> Because the destructor is not overridden with sock_wfree (like
> xsk_consume_skb() does), kfree_skb(skb) triggers xsk_destruct_skb(), whic=
h
> submits the descriptor to the CQ and increments q->ring->producer.
>
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
> >               xskq_cons_release(xs->tx);
> >       } else {
> >               /* Let application retry */
> >               xsk_cq_cancel_locked(xs->pool, 1);
> >       }
>
> The error handling paths then call xsk_cq_cancel_locked(), which decremen=
ts
> the reservation counter q->cached_prod.
>
> Does decrementing the reservation while the actual producer pointer has
> advanced break queue accounting?
>
> The kernel calculates available space using cached_prod; this artificial
> underflow could cause the queue to over-report free space, allowing the
> producer to silently overwrite unread user-space CQ entries.
>
> Furthermore, in the -EINVAL path, does the invalid descriptor generate a
> false completion to user space without being released from the TX ring? W=
hen
> the application reuses the completed buffer, could the kernel retransmit =
the
> same descriptor on retry, causing a use-after-free and data corruption?

For the above two issues, yes, we've discussed in the previous patch :)

Thanks,
Jason

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260418045644.28=
612-1-kerneljasonxing@gmail.com?part=3D3
