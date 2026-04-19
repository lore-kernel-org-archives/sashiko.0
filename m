Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B779E1990A7
	for <sashiko@lists.linux.dev>; Sun, 19 Apr 2026 13:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776603991; cv=pass; b=T+zhG9nJ7SLeJ2S7Mhf6p8Z/Oc11MpAMT5rhNQNznR6O9IcXd+OY8tNpAMhdm1/C+UnPiGkUglDnTjm2JUsLAUz/Xe7K6zGP9LXd2Pjbo2qdQjj0ogJS4eQWYR0QsBK44i842v6u91AuCFTIbXIcjm2g97gRo0tJQA1GRwj2WBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776603991; c=relaxed/simple;
	bh=M3ycx3HP78yqs1oPUoxtzecetBA0RfqqZYVsez8A+0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ujdvIi99GT7hynoiz7LWiL8N3Y6mmKCaUEU1DGLSgAWC353kdqXxa9rR6yx1IIZ0gNRJ734Il11Inbhui4PtVitnCFys4jeESqbQkCZe+8FY7+99o2ThNWArH0qfW6Ip5DGX4KXIZlvH/fiCRKCOO67NySKDKBrD5qQNfenH5CU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YFGQQXbX; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFGQQXbX"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38dd575bca3so30967001fa.1
        for <sashiko@lists.linux.dev>; Sun, 19 Apr 2026 06:06:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776603987; cv=none;
        d=google.com; s=arc-20240605;
        b=iDMymjoOB7VIGZ4OZ40udk7HRg/yMqmurOP12TcAPTJtIMMMTb6sXDIhC8MiejbE/Z
         V1ntGxN+TCSQHiYAJe31tiu1tNSwYToKUwPv2LGvQsfsKt0SwITI0ZKEXKQuzzhv8uGE
         UYx/22R2hf+A7AqPeBQhV5FGnd2i9tDK0yVmkJFrgeY2LB3UNy3LfL6/5ai6koPKpg1O
         XPwhUiBcn0EcDFp98aik2y7kyiBuHn3rJJlZvzdrdc/ztTyk5kpjGG4ZQW/GYXkuKRWf
         98jZA5EnVUvezCqna5gTBdgD2N+n5q1hnhVqpW6d899BEb12TLHyP36RuglBg+mOmJ0P
         gp6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WNpC1nd6L0CPDk4zbCH8Cuo2VCHC85lBeU44RC3l4ik=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=kXmhmSVBfszHGX0I9zyUwmWeGCGsRcCZb+nWfZVQy9cW6kXpnK/G7ag6T2/Pu+vKp4
         rMbSqNTW3P6zQP6R8r+r7GQysQsEsw3qa39V9KBc8pwP5D3qCz1f/YX/V5H63TmVEnx8
         Cxc8rq8ahK+/82go0ZlSDNUx8kz6XJxwgdZv3NAYfo60+dyCiMl3RzLgdw/gun0yAgAh
         AhvQ/NuZRh/OvUFjgH2XL/bCCI7LQ00Dlq0T+3zJyky9cLf4Ge70H59sPF2vw1IlQFoY
         rMboll6Qj+yZZj2txR3Y3r8ZVmhj+v7lx0iweITFfO/wq/d1erXxXUQxwtdFq0OHp1/X
         yOiQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776603987; x=1777208787; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNpC1nd6L0CPDk4zbCH8Cuo2VCHC85lBeU44RC3l4ik=;
        b=YFGQQXbXfAdDHKPAl65+7oKUReX5jiMbt28lQvMMOuGQUW0JkqosFnAKzbj8SuIEgm
         FA+vSR24nL4BDZ5sW4r/PXh4pv+N7oU3/eim1cfSGYfv4Sqd6MoMvM9k7fvVsORIClcr
         +S7PxZV05kmP7VYlplIktEnI9glNoS/jruLe38S24xZRAi3cPEso1ybBOxvQtKTArwXR
         EqokEbj9UWxygmSIEvQmHNzvi/2GlKr7cXIbZWf/sMouRYpS6YO00rYKOjVWJ8LmY9eE
         v7XBuACtundFKq2IIjq+pznkwjzo1/Q9l3wN2INJ6nQuKawjkz9GNWtX5cDTVYz6QTcw
         3Z6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776603987; x=1777208787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WNpC1nd6L0CPDk4zbCH8Cuo2VCHC85lBeU44RC3l4ik=;
        b=Tt4aKvqwFWP93N2RnhWj0tj9gKBhMDUm7x9p9uK+jscKCvDsiLnryF0jh5wugYioY6
         EBZhWjVoo0M3J4q4ZyU1YQwe0Ohtv7BlL51VkUBr8p/GHdTIkYOu10wAAT0rKxotqwqw
         5AHjuG+cYtz3W/2hIkVDyYbovvTPkZ9fdpX5UAnCAxRh9W8su7IhRih6ypGcOa7HCqpt
         p3TwPafE1RRgxGpR2XEos/EyUgkKujVO/N44MVkMg2LGqKcyjdrGB1VhlbiwM8FRl8fg
         GLuYZCMVIvtw0jHgwu2xqAHWJ8ttFBJyJp4K5bwodrFEhZwFe/HyWEY07eIZHjnOi6SP
         4lcQ==
X-Gm-Message-State: AOJu0YwY7v1qsuNFh0V5l0rQo83VDdLshVVrFa3WRXBVZU5d1vzL0K05
	t5Q/Op6qT0wZm6S75PtXeUNYv72eLa4OC8I9uTD6ZxvKN88x3FUfVReMh//dXz0K2xnxTJ3FdKd
	xMJMI1b++ky4S3TyMySbHQkb07qwtqMzmtPcMAP9TVFtj
X-Gm-Gg: AeBDievvqNgJg87nGyB3HB5VWIDPMEj7opZwFcBHkHNbSIxUDNhB0LmdotqMxYkLuie
	TY9KdddpJQkR+djEp4siTKueriRfiftOTr+e/eHQV+gnC206979SfR8gw/3nXfCyyCw3ayPgTAG
	1ExmMW4RQMwcv4QFLCcpE02yIo4/M/0ECgsbzQDJNUuG0aMHmQQzSr3p1gegz/dRcwdACX5m1Yx
	+0PVVaBxnZOI5d4X8HJIcv5g11F+YARRtbGE2keIvZSgdjDqT22OEnZpGuAxZH8mjaZ6gY+Mt21
	T0WankfQ525vk8CVZA==
X-Received: by 2002:a05:6512:b87:b0:5a4:a85:ba3b with SMTP id
 2adb3069b0e04-5a4172a7831mr3011387e87.19.1776603986447; Sun, 19 Apr 2026
 06:06:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260418045644.28612-2-kerneljasonxing@gmail.com> <20260419045822.843BFC2BCAF@smtp.kernel.org>
In-Reply-To: <20260419045822.843BFC2BCAF@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Sun, 19 Apr 2026 21:05:48 +0800
X-Gm-Features: AQROBzCsB7ApA1p9olQI3oqDJZGQEhh5rgj8TiWKlM2IDkapmoaT94KipW8DKKc
Message-ID: <CAL+tcoBjsFmJNe-yQS-hgOtZHk=qMSpHDcqoeF_hyka_MWduUA@mail.gmail.com>
Subject: Re: [PATCH net 1/4] xsk: avoid skb leak in XDP_TX_METADATA case
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 19, 2026 at 12:58=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 2 potential issue(s):
> - [High] Premature SKB free triggers AF_XDP completion destructor, corrup=
ting the Completion Queue (CQ) and causing an infinite TX loop.
> - [High] Calling `xsk_skb_metadata()` before SKB fragments are attached b=
reaks software checksum offload and permanently wedges the TX ring.
> --
>
> commit 7fb48e575c16e2e098969186062c6a31c8245353
> Author: Jason Xing <kerneljasonxing@gmail.com>
>
> xsk: avoid skb leak in XDP_TX_METADATA case
>
> This commit prevents a memory leak when xsk_skb_metadata() fails by
> explicitly freeing the skb before returning to the caller.
>
> Link: https://lore.kernel.org/all/20260415085204.3F87AC19424@smtp.kernel.=
org/
>
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > index 887abed254668..5b273bcd0dbce 100644
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
> > @@ -823,8 +823,10 @@ static struct sk_buff *xsk_build_skb_zerocopy(stru=
ct xdp_sock *xs,
> >               xsk_skb_init_misc(skb, xs, desc->addr);
> >               if (desc->options & XDP_TX_METADATA) {
> >                       err =3D xsk_skb_metadata(skb, buffer, desc, pool,=
 hr);
>
> Is it safe to call xsk_skb_metadata() here before the SKB fragments are
> attached?
>
> Because the fragments are populated later in the function via
> skb_fill_page_desc(), both skb->len and skb_headlen(skb) are 0 at this po=
int.
>
> If XDP_TXMD_FLAGS_CHECKSUM is requested and software fallback is active,
> xsk_skb_metadata() will call skb_checksum_help(). Because skb_headlen is =
0,
> the bounds check in skb_checksum_help() can trigger a WARN_ONCE and retur=
n
> -EINVAL. This permanently wedges the TX ring since -EINVAL does not consu=
me
> the descriptor.

I must state that this problem is not introduced by the series. The
following commit should be fixed soon:
commit 30c3055f9c0d84a67b8fd723bdec9b1b52b3c695
Author: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Date:   Thu Sep 25 18:00:09 2025 +0200

    xsk: wrap generic metadata handling onto separate function

    xsk_build_skb() has gone wild with its size and one of the things we ca=
n
    do about it is to pull out a branch that takes care of metadata handlin=
g
    and make it a separate function.

    While at it, let us add metadata SW support for devices supporting
    IFF_TX_SKB_NO_LINEAR flag, that happen to have separate logic for
    building skb in xsk's generic xmit path.

I'll consider folding it into the next version even though it's a bit
complex to handle :(

>
> > -                     if (unlikely(err))
> > +                     if (unlikely(err)) {
> > +                             kfree_skb(skb);
>
> Does freeing the SKB here cause issues with the completion queue?
>
> Just before this block, xsk_skb_init_misc() sets skb->destructor to
> xsk_destruct_skb. Calling kfree_skb() triggers this destructor, which sub=
mits
> the descriptor's address to the CQ and increments the producer index.
>
> However, the caller xsk_build_skb() will see the error and call
> xsk_cq_cancel_locked(), which decrements the cached producer index. This
> desynchronizes the queue reservation pointers.
>
> Additionally, because the error is not -EOVERFLOW, the kernel does not
> advance the TX ring consumer pointer. The bad descriptor remains in the T=
X
> ring and will be retried continuously, potentially causing an infinite lo=
op.
>
> Should skb->destructor be restored to sock_wfree before calling kfree_skb=
(),
> or should xsk_skb_init_misc() be deferred until after the metadata is
> validated?

Amazing really. The same here. Sashiko checked this pre-existing
behavior is buggy, which the patch 1 only does follow.
In terms of the free_err logic in xsk_build_skb, the untransmitted skb
should be freed by the common new helper:
static void xsk_drop_untransmitted_skb(struct sk_buff *skb)
{
        skb->destructor =3D sock_wfree;
        kfree_skb(skb);
}

Will cook it as a standalone patch to fix the commit:
commit c30d084960cf316c95fbf145d39974ce1ff7889c
Author: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Date:   Thu Sep 25 18:00:07 2025 +0200

    xsk: avoid overwriting skb fields for multi-buffer traffic

    We are unnecessarily setting a bunch of skb fields per each processed
    descriptor, which is redundant for fragmented frames.

    Let us set these respective members for first fragment only. To address
    both paths that we have within xsk_build_skb(), move assignments onto
    xsk_set_destructor_arg() and rename it to xsk_skb_init_misc().

Thanks,
Jason

>
> >                               return ERR_PTR(err);
> > +                     }
> >               }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260418045644.28=
612-1-kerneljasonxing@gmail.com?part=3D1
