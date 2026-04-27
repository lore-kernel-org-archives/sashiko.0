Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5C82E62B5
	for <sashiko@lists.linux.dev>; Mon, 27 Apr 2026 02:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777257301; cv=pass; b=ebBXJQZ6AugRGzkmOUIeMAylJlYwiYilJVW0nmOxWf45D8SF0bNkGWaC+Wx7/dXZtPr74j2pqfV8C5cwDUcqKHb1FQOIUQhgn7zphoXAZ1+S37Yh5h/jVLF0Ywz1eSTm4VqAOUQPXnnqJNtpY3KvBPgFpleWfIA6gnnG0exhqKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777257301; c=relaxed/simple;
	bh=jrAK3TMruyZj10TUC59kWX0H9558xi8uvoqZiyyhYVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bY9aPYdD6Q5bv15djCFiFNRFYNunVGbmupVdB5nzclTqliMJm+3uMORw1cbvlhwd6mBciYSdZjeV2blY4HOy0RH0FSpOWAFS4tZ7I8J+lAG4xFSDKtbkSr1ll7hLBNNUIMwkCWzS2Qp9pAWBVjM9Xzs/55xFy6jmsVSN/QW3aXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Syo16QxT; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Syo16QxT"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59e4a04f059so11766857e87.2
        for <sashiko@lists.linux.dev>; Sun, 26 Apr 2026 19:34:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777257296; cv=none;
        d=google.com; s=arc-20240605;
        b=clL3OIb49KO+6aYbr9/CK0hDBBz8XbM/OOjDMbIRdg+egbKrY0BW5DLmZ/Ul1SBttf
         ih/cvOM9ML6MbWrmF0u3ek3qEndz2fTuv1nr8ByKZdWQHy04v6E26eo4UbHw7YaBi399
         Zo0tLBbn7dEm8wzbD7DTAgHio8+XJ02/oSinQC967UIERf6PKa9M7zjluMJhHXq9G8S0
         ekU2K7sYhDOv/dAoHHkNapKJ0y/G/PG88T5JkBe+Qkr4tiGYmWSjr7vwkOi91Vz7fKbO
         0Bqvr4Z8B4rG8NE9En+eAlW6DdOXFOMoqIVwCu+5kSZszLjM4w5tu5NF8ANLwQORjLpr
         a0UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2nP9HqvSfp2EJKyiHDo/CtzNpkjzQGYzAWoP8uOpFqY=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=h4tvc4A/tgxUosqqavx7QfTkAUbvuleE8bBY2hrFj1XRXa2Jml2bpkwFqhtH+U7hF5
         kECiMmAFms9ug/K1PL++0LxnQhzxdvnikyBFBASzzmtEADRUHzr012teJaObU8Fk+2Cx
         Xe2+hEbDDUtOK9IQdFewB2uos4rvXOnPgnbaRJThmae7ya/Bp53yRMqReWzFgvI9SNWq
         w3xt+A1fooy4tUMGTmiSYB6mospo2JpZU72JoZcaN56kCQOCf6P8S4jLSHtfZYbkJHSQ
         nQOcXVsnAOYaIMWcy7cep4EvLddY8lGLYdo34WsTEt9fbI7ts44Cl2HASfX7OywjIyh6
         Ttnw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777257296; x=1777862096; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nP9HqvSfp2EJKyiHDo/CtzNpkjzQGYzAWoP8uOpFqY=;
        b=Syo16QxTqgv1f/wD9zK5/Dg/F97C4Rehpt4dRoUxfTLD8KcsKzvA6xp9gK5P3IPk5o
         XEdVE91H5ujVl2nwNJags7nCHz2WoP8aaMsH+rIPaWR+cJscNNudSDdgcJ9paIxlp+Z7
         jbFB9fWs7zyPP482Kdvg8aJpqriZgjA+iyux7fC91DXoHUV1YKCjMlF6MX4X9Qb0SF7f
         zvhHjTCbGnuKnTbdP43aM20IdafuLyGu0hQO7JaKfmvpJpHWSB3RzW+Va23xNrcJO2Fl
         h1qbK6DYxOXk7lIUnrO/oW0cpXuzpv5j/jZMlSZ077xbYCkmh3vvWGn+Md26ZAJzZ0AD
         POpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777257296; x=1777862096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2nP9HqvSfp2EJKyiHDo/CtzNpkjzQGYzAWoP8uOpFqY=;
        b=UMCCMsHiBab//Zg05O7bzHJtWVXhDQqGrpcR5YQ7kXSq/pZnSFejNQg58dpAquO2ML
         Y5WfrPxPv+7zlW0G2/HK1565DyjSsNeuTJpYXyJ5DxvOriRtgNReaa/ghX+0AUoRIgyL
         QqfOEW4NU6VAuXd+qj2IB/qyo1jmh6ApJQwf5rOmtFK2zk6wPGv98v2U6ErXUwxd/WlE
         xfD0KSB6R+V15/AXMjg/TGeXkoJZd8TbblfPERxsI/G7A4vpn01XWeb+mptArf7nCJhs
         l68dr3KEDla8NK3F/yzlTOlpv0uhZMVZXzYJVlH42DpwNCnepm2Gu66hawwKrBsfa6mg
         myrA==
X-Gm-Message-State: AOJu0YzlSvkfANPU1JrxQXVYQZ0iU2w9Qa10TRGVnpO8IQUKRXNr/0Ml
	TEDjp9E5pESM1YEv0AUCG69tPGEuYi1YVpI8yaAJba1DnCc1IM01bo7E+3arO5TqPm4ylJ3h+YH
	GGxNXFq2Ubb3M9fRrCmzaoDv9XPM1oQzrfQhEpjSK1g==
X-Gm-Gg: AeBDieuQHhKT/TC+AiltCb7nAi9/0qAcEtGcW1GsdvrclAKNuvLd+ErPuvK3y/P+z0l
	N8z6+biPmTTNRsdfDdIw3xXTw1WxcDTUOBQzqwCxyaRT/K+0kWAwRSN12KOpd8cASVhgurvkpNc
	WEKpof6SH9YK8nQeODtPRoLE9LFiO1e/YIYjvBc8cbr3sxzWJ7FMxLurZ2eg0Dc8kVOE/CjKJvj
	EiglYXVWO4V1GY4QO+hYftqwG+/uMgQPN1rLY9DFmLC8MaVVtogCkQxD7jSoiw+xSHdsw+UtC1T
	uZRiRfiau9ZxAkWTXp50vl/SM1GyaUKCNCIP9sCBFg72mr+VXA==
X-Received: by 2002:a05:6512:398c:b0:5a4:7ed:3e4d with SMTP id
 2adb3069b0e04-5a4172de851mr15031706e87.27.1777257296092; Sun, 26 Apr 2026
 19:34:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260422033650.68457-4-kerneljasonxing@gmail.com> <20260425041726.85FB3C2BCB2@smtp.kernel.org>
In-Reply-To: <20260425041726.85FB3C2BCB2@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Mon, 27 Apr 2026 10:34:17 +0800
X-Gm-Features: AVHnY4LMvlAB60tQ8YpoH83GiQpze55nBGDO3vdI77clWc0JvGzivZ-CU64ELMo
Message-ID: <CAL+tcoAvYOXfVM-YqN1G_8BQk98xDJ4ppeuGYNt_JeZfECU33A@mail.gmail.com>
Subject: Re: [PATCH net v3 3/8] xsk: fix use-after-free of xs->skb in
 xsk_build_skb() free_err path
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 25, 2026 at 12:17=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 2 potential issue(s):
> - [High] Incorrect completion address reporting to user-space and leaked =
descriptor on `-EOVERFLOW` in multi-buffer packets.
> - [High] Packet stream corruption when dropping oversized multi-buffer pa=
ckets.
> --
>
> commit 38322c7d2a85e9ef029404cbf4ae750b54520d27
> Author: Jason Xing <kerneljasonxing@gmail.com>
> xsk: fix use-after-free of xs->skb in xsk_build_skb() free_err path
>
> This patch fixes a use-after-free in the xsk_build_skb() error path
> by ensuring that in-progress multi-buffer socket buffers are not
> freed if they are still referenced by the xdp_sock.
>
> Link: https://lore.kernel.org/all/20260415082654.21026-4-kerneljasonxing@=
gmail.com/
>
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
> > @@ -969,7 +969,7 @@ static struct sk_buff *xsk_build_skb(struct xdp_soc=
k *xs,
> >       return skb;
> >
> >  free_err:
> > -     if (skb && !skb_shinfo(skb)->nr_frags)
> > +     if (skb && !xs->skb)
> >               kfree_skb(skb);
> >
> >       if (err =3D=3D -EOVERFLOW) {
>
> I noticed a couple of pre-existing regressions in this error path.

Good job. I'll cook a separate patchset to fix this new bug as a
follow-up instead of polluting the current series :)

>
> Do the error handling paths for -EOVERFLOW leak the original descriptor
> address and submit an invalid address to user-space?
>
> When a continuation descriptor exceeds the fragment limit, the code
> jumps to the free_err label before the current descriptor address is
> stored in the xsk_addr array.
>
> However, the error path still increments the descriptor count:
>
>         if (xs->skb) {
>             /* Drop the packet */
>             xsk_inc_num_desc(xs->skb);
>             xsk_drop_skb(xs->skb);
>         }
>
> When xsk_destruct_skb() loops up to the new descriptor count, could it
> read past the initialized entries, find a zero address from the earlier
> kmem_cache_zalloc(), and submit address 0 to the completion queue instead
> of the actual dropped address?

Exactly! It doesn't have any change to run:
        xsk_addr->addrs[xsk_addr->num_descs] =3D desc->addr;

At the stage of destruction, the right address has never been put into
the completion queue, so the application will not be able to reclaim
them.

>
> Does dropping the socket buffer here cause packet stream corruption?
>
> When a multi-buffer packet is dropped due to an -EOVERFLOW error,
> the partial packet is discarded and the socket buffer pointer is cleared.
>
> Because there is no state tracking to discard the remaining descriptors
> of the dropped packet, will the transmission loop process the next
> descriptor (which is just a continuation of the dropped packet) as the
> beginning of a completely new packet?

It's another critical issue but unlikely to occur. It indeed happens
when the num of frags exceeds 17 as default. The remaining body of the
packet will be treated as the start frag of a new packet since the old
skb carrying 17 frags is freed.

Thanks,
Jason

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260422033650.68=
457-1-kerneljasonxing@gmail.com?part=3D3
