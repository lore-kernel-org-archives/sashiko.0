Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477193D091B
	for <sashiko@lists.linux.dev>; Tue,  5 May 2026 19:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778009228; cv=pass; b=hLMT7HGnpVZixAXeLeANCA2S8tGJ7lGZk6JKuJADEdOqsuwegIxEWFrH1j/o0wQOHJIeVMHZHuJya9/lM2SNhzLmH7uh6THnKRrZlXA6sZn46JnEf9YBAngfgbhusQFxQg5Y9UaRAQ8N1tl00qC0ncTAgLQbcwUZkC/k1tC88rI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778009228; c=relaxed/simple;
	bh=8e0G55xL7HvEe7Whpe/9RNUYBx4esqcy97V/NGtaNmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hMdQ/EzD0gBMe4iI4pC5r0na8KGEWLrtI5GxCeG2UYvFMmlsK2j3gDL2i8spUPvx00ICkYzXLoOUpR3QWSClrhinNgBm9YXkz1bWdRkoYzioZlLtKAaP4+Dln4yDa1N8UoNS7o3BdDjAmP9o0KzxHuS8lHqaHL9bjSdESgQ321U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKkU7hHo; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKkU7hHo"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a4113ab355so5424190e87.1
        for <sashiko@lists.linux.dev>; Tue, 05 May 2026 12:27:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778009224; cv=none;
        d=google.com; s=arc-20240605;
        b=QrYEDMm1ivHdoAO58UNEyY5VIdTjWMYSkQpXTESbEU3EsG1GD/884xuPxWrLNCGrNn
         qXy6LC1GSZn9JfS0Y5mggtMqvCXmUoFCApjfIk3/l4GezRSsB/1Ubl87WcJRj9nRShmu
         3PeqFZelA7r9zPFSLxOrFSgvRzSkYNHQJBsgpr4/asuCmKRA086pkm4wYbotlgdBu26I
         O1KDZA8Eb4gz0Tw31urWsxKzxhWOvPxYTaSrFBqU3Z4tezwY3TfEF4qjakNiDt3dDaLT
         n4hvtU0NkZA/raPnGjNII8BrJbQAWJef9+nPPL030y0j3gJKD82A6c/uinePSQ28Yng8
         NtcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YrlYF5xXPgCryFWDSMdpLq3EQMd37IvsrKIsSlr1DBQ=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=QzS/RidCyoZb0XylIdKAp21eGxjwdOmQWmUPNiz+HDrg5Z0cw93ywxmcditRxC/1XZ
         0V+rJaEHfWG04RAeLo9f9C0sgZ86n/HeeLb4KLz0UESQZMvZkdaZBZu7nW4kZuNbaRWw
         mohze9CC604CdH1UQL15X5R30Z/NljzviRuKQL/RVuWcu9XJYqHmxPhfeGSiwZ4OuyX1
         z2ca/dT4W5nRV/cIfXksVWPRLYZ1Y1X1VBbxwA7+6CY0k935MXUZ4paO8m9PeI6pozSn
         Sv9J4mbcTWkVeOHVDG4qepnKOVchwfUNhwde/h8eFgCWegwPubWo1NT5tfSU52Zf7neq
         BhPA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778009224; x=1778614024; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrlYF5xXPgCryFWDSMdpLq3EQMd37IvsrKIsSlr1DBQ=;
        b=aKkU7hHo7Gy1cmDKbscRqmKVMdc4HSOfHKG74WmmOTZtUGqeebudvnSLSMUdC1Qoc8
         b15PCj9EItfaTiGIQ7gH+L1icTW1vqgW0DG5y/vvOWNSpeJxz2CNRjrvtZargUZw/oYD
         bt+kuf0zwX+sXPwkS0gqiOC8zz1bwx++HdCvbIIO+Gu3YxCLzPn/K6mJrhy2pFWMnirc
         RqTjNZg60oc5KrEvruPufY7/s5fv+QT4yrNv6REVfFljdvImbVwT/W/yyF+grnRYjP7d
         VI6vK7Krt09SpgRm8fAnFYh4CcIXKP2F0Exy0RonB8NMgNZVica7u2vC/P2dsRVRhCSW
         eu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778009224; x=1778614024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YrlYF5xXPgCryFWDSMdpLq3EQMd37IvsrKIsSlr1DBQ=;
        b=KW0wo3wnfeK/HHyeJka4ihtqlR1eN29uDFzH6pJmatv1wUS/xQyDxZY1dyqrYqsQOY
         JvYUb5hWOR/8GUj2/h+tUh/q/64tXIpkmA/euK5bhURz7bIxTA0iYGv1rvjdGvE/XtIu
         X8v9IKrdoKzzf0InqrG8EhMyBrjDahVI1JomCtmvkvQM7JhG9VBsRlNRhDTQk/AWetsE
         o0Mo6hrY6g0OoRZeDt9sootEoJlQZ5vqK0zqQOHGjj9nZHaoj55MT1yOtkdjYWkqxl3U
         DqcLv9aM1mBqL+eb+I8+T/c4m7+v2FYaJJMgk9hqagwYzJF1qv4WeMxj9VwvZ/2He3Wp
         8W+g==
X-Gm-Message-State: AOJu0Yw9eNkAqXxsvsv48DJJzW2XXeim/QS6f/gQ5F9YbAejmWE5kfF7
	7cVjzbGyRePvFONKxY8U5pJzOZ9UvosbA34mP0gI993FaWr/e1Q7q83yfrPXhM7SAgtQQcryO/c
	6h66CL8nBaLR95WhYg3O9fCdAwj6M59tomNuIhYW/Xfdc
X-Gm-Gg: AeBDievHvHfni4QtAOpImSkdGQeWC7Jkfis85IgWeHhY4I0Bvu8ws24h0D3NlxqwgR8
	KWnnlvvrjAaNpuhG6w0gDD4LIFTR5/FG0M1+7dfk0102sXtoHAieT+ugTxRcQgFPDJdu+FajNAE
	vY5G3m1moLNIXRrKF2kGYJkvNpM/4fQ6VO+VrCl4q8IfcQPf49JjoqccYFeE/dEdynXwPfPf8Go
	+zXbM4F+LTzfJIdHcXFerS3K22tpnXSB7eRyKSjlA8YfhN1fKmBv26EATTGYegSpB9phir0cIa3
	rBHidg+EPV42d7pPs+kIRQAwUQ84cxru2uGI1TdKq8yG6CtoqMNjeGY1JtM=
X-Received: by 2002:a05:6512:2309:b0:5a4:b2d:25c0 with SMTP id
 2adb3069b0e04-5a887ad8c13mr32293e87.3.1778009224323; Tue, 05 May 2026
 12:27:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260502200722.53960-3-kerneljasonxing@gmail.com> <20260503200924.4EE32C2BCF4@smtp.kernel.org>
In-Reply-To: <20260503200924.4EE32C2BCF4@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Tue, 5 May 2026 22:26:24 +0300
X-Gm-Features: AVHnY4LbIaAP9el5vDm6d-RIfE6mVNp52XjYBafC8ZxDY6o9lGAyPNzX7cLkfwU
Message-ID: <CAL+tcoBPNghJT-RTrWSHr9HYvr0QG1p=sL0u+Gm18YU4UE2PvA@mail.gmail.com>
Subject: Re: [PATCH net v5 2/8] xsk: free the skb when hitting the upper bound MAX_SKB_FRAGS
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 3, 2026 at 11:09=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [Critical] This problem wasn't introduced by this patch, but returning =
-EOVERFLOW when xs->skb is NULL leads to an unconditional NULL pointer dere=
ference in the caller's error path.
> - [High] Calling kfree_skb(skb) directly on a partially built SKB trigger=
s the custom XSK destructor, which incorrectly submits the failed descripto=
r to the AF_XDP completion queue.
> - [High] This problem wasn't introduced by this patch, but an identical S=
KB memory leak exists when xsk_skb_metadata() fails.
> --
>
> commit cf402952a5ccf9981b4749df15227be947716b0d
> Author: Jason Xing <kerneljasonxing@gmail.com>
>
> xsk: free the skb when hitting the upper bound MAX_SKB_FRAGS
>
> This patch explicitly adds kfree_skb() before returning -EOVERFLOW to
> its caller when hitting the MAX_SKB_FRAGS limit on a newly allocated
> SKB. This prevents the SKB from being permanently leaked.
>
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > index 887abed25466..d706b1e0bf60 100644
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
> > @@ -856,8 +856,11 @@ static struct sk_buff *xsk_build_skb_zerocopy(stru=
ct xdp_sock *xs,
> >       addr =3D buffer - pool->addrs;
> >
> >       for (copied =3D 0, i =3D skb_shinfo(skb)->nr_frags; copied < len;=
 i++) {
> > -             if (unlikely(i >=3D MAX_SKB_FRAGS))
> > +             if (unlikely(i >=3D MAX_SKB_FRAGS)) {
> > +                     if (!xs->skb)
> > +                             kfree_skb(skb);
>
> Does calling kfree_skb() directly here incorrectly trigger the custom
> XSK destructor for a dropped packet?
>
> Earlier in xsk_build_skb_zerocopy(), the newly allocated SKB is initializ=
ed
> via xsk_skb_init_misc(), which explicitly sets skb->destructor =3D
> xsk_destruct_skb.
>
> When xsk_destruct_skb() runs, it calls xsk_cq_submit_addr_locked(), which
> erroneously generates a spurious TX completion for userspace and bypasses
> the queue's cached_prod reservation state, corrupting the completion queu=
e
> logic.
>
> Should the destructor be cleared first to safely discard the partially
> built SKB?
>
> Note that this regression was fixed later in the patch series by commit
> 88b75ff1d12b ("xsk: prevent CQ desync when freeing half-built skbs in
> xsk_build_skb()").
>
> This problem wasn't introduced by this patch, but can returning -EOVERFLO=
W
> when xs->skb is NULL cause a NULL pointer dereference in the caller's err=
or
> path?

It's a very carefully designed order of this series. Without this
patch the skb is unconditionally leaked (permanent memory loss), which
is strictly worse than a single spurious CQ completion that userspace
can handle. Patch 5/8 then eliminates the destructor issue by
postponing xsk_skb_init_misc() past all error paths.

This is why I move this patch ahead in this version.

>
> In the caller xsk_build_skb(), the local skb pointer is set to NULL, and
> execution jumps to the free_err label. Because err =3D=3D -EOVERFLOW, the=
 error
> handler unconditionally calls:
>
>         xsk_inc_num_desc(xs->skb);
>         xsk_drop_skb(xs->skb);
>
> Since xs->skb is strictly NULL, these functions will immediately derefere=
nce
> the NULL pointer via skb_shinfo(NULL) inside xsk_skb_destructor_is_addr()=
,
> causing a panic.
>
> Note that this regression was fixed later in the patch series by commit
> 819a57cd3753 ("xsk: handle NULL dereference of the skb without frags
> issue").
>
> This problem wasn't introduced by this patch either, but is there an
> identical SKB memory leak earlier in this function when xsk_skb_metadata(=
)
> fails?

As you noticed, this patch doesn't introduce new bugs at all and the
following patches take care of it.

>
> If desc->options & XDP_TX_METADATA is set and xsk_skb_metadata() fails,
> the function returns ERR_PTR(err) directly without freeing the newly
> allocated skb:
>
>         xsk_skb_init_misc(skb, xs, desc->addr);
>         if (desc->options & XDP_TX_METADATA) {
>                 err =3D xsk_skb_metadata(skb, buffer, desc, pool, hr);
>                 if (unlikely(err))
>                         return ERR_PTR(err);
>         }
>
> The caller xsk_build_skb() explicitly overrides its local skb pointer to
> NULL before jumping to free_err, causing this SKB to be permanently leake=
d.
>
> An unprivileged user could trigger this leak by providing malformed
> metadata, leading to memory exhaustion.
>
> Note that this regression was fixed later in the patch series by commit
> f1079e939977 ("xsk: avoid skb leak in XDP_TX_METADATA case").

Right, it has been fixed...

No action needs to be taken so far.

Thanks,
Jason

>
> >                       return ERR_PTR(-EOVERFLOW);
> > +             }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260502200722.53=
960-1-kerneljasonxing@gmail.com?part=3D2
