Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBBE2D7D2E
	for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 12:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776775931; cv=pass; b=QlXXNjqzsaYPkWJiJEEMPpdxuwA5T+3ea5i7PmX8bOdT4wi9XaTOSdilyDrGyF6zgjkkLT7svQeBCki5FGibXkJRE8WXLf1SR+f/OWeXbEminncYoLxRkL6VFgf4XS800RL5AC39eVBIb28Wi0hgWA1zMjoXvGB2GBsObzuB6Js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776775931; c=relaxed/simple;
	bh=VpRx5r5O9+CKQARAYRtkajkTtNPQfi3cLUARV3b7Rps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JBugNSJNnYeJClAu+3z4BefSG2Q7oT8VBBVBchZMGF6xWlHrzUoVIDeZ9gjp6UedhFfoO1M7uX2cPbIA42TjxSayCceCs/+RgCu7zg8SgNxLViUI/HMQXa6YOSw2CnyUyoxqs8m99dLFvy8a/FaRMIeVLz2Iu8SGvEpxREgoasM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N2XRdx08; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N2XRdx08"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38be5e86918so49093531fa.3
        for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 05:52:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776775927; cv=none;
        d=google.com; s=arc-20240605;
        b=VwEklio7jqBDpyZeeaFVcqAlzmS1CyTHmBb8Gj2fvA8zawBfPmgfuPuElL5IS2nLCe
         2rdOomgKgTBvclD/u0tyKPYmjaX0s/3a43XR21v5OQ3tRtgH/mNNhaI2kEl4/SfubBs7
         JUHge0Y2TLoNQ1o6XmFecfcSIfikicBt7rEZWK814DktyxQcnZetM4c3EY8pdXkZHy37
         ng+eLI1BH/AvvDyDfIzHnVXT4FBvmsxHGaJw4A5O11scOw4ZcVowygkOqh9ZH3DdJSeZ
         PDuGc89w7Hbw+iA0j5MwV599A1W6BsLKpDy7ZkILjyEOHfSIt3XUB48UieLpLyutG648
         MebQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=737XG/nDMJ/5q6E1OMCzl01bn4enPbna+/IOlrDsYmo=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=a8ir0byA+4XIqfDkw3Q7zetEMoZS2nh26wDJJcZgUkn9XhechCpolXJUwtK1gkDXKD
         7nc3fwyHqsr6Gpzly6iPNgOPo9je/yCdCiWzz8S75GrH0bFjfsPyL0SfW+kgtDg5l/5Q
         ItTX7KjgWq5P/mEGX8VILOqGQ+sY+yxJLPgWxJe2MXFwZYp0i/jP/VxdTRklXWY9O/sc
         Ek6tMlIOyxP3vrN4mBwZ1irnG66kiVuRqUPp84jCKZmjsbFSlGIJpL3U2KMXjGyiBSlk
         8+XBDuzKYhccPi3+MWWNGFiwz7wP9Yh8+N1a422q3G2gggyjtnnRJomd8NeNk4lD/j6i
         nMzg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776775927; x=1777380727; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=737XG/nDMJ/5q6E1OMCzl01bn4enPbna+/IOlrDsYmo=;
        b=N2XRdx08HOYappXCcZ/G1IE+A5vQyJYsRraFh+V1B0SwMnWqFWqvNoOiOAGrK/p257
         kDO/MqQ/LdaJh4ArEEuxc7HrK7P9FahHZJBfm6swokvHvS7OF8APu5QMrLOtu0r1zeQY
         GYV1e6e1pppzQ/r/YBF5FWaQvckMq1KhB6GPzsd41tGnCpdVhFXIqNLLIDNawljaUv6N
         Qv30sMi5nWznmKgAflQ4iGmWUP3QQskxFjrNB6bMAClJFNrt+cN5zOlWSb6emopXg+Gh
         k51mdfSglCTNbHEpq54oxwPelCKkzvpqnQVIvUvNLMoUsTQJ0eh/zgckRF2xCiE4IT3M
         SRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776775927; x=1777380727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=737XG/nDMJ/5q6E1OMCzl01bn4enPbna+/IOlrDsYmo=;
        b=Cj0waIM4ImwyPDspEFXa8KT2JQx0sL21q5r7ySRweK2yWGijU3r/6ABmhs60FvdUxk
         o5QkEcS8GY9I062Mv0U0dB/eX5985FB63Jlzmq+0aa4VqlzaGYf94D7GxJlipcCCl6VX
         D0WwDD7dy7R7o1fd6/furx2vwTS63Q8nTNQXdgPubiGqRQvyEZH8ny8JS1uV/xJkqZq9
         68erHmm1BvvPwN7+qHlZIpSc9Nk8U46Mzv/3ldiYVuvWB+JbF2IcEQItxQY63rCqEkSc
         mzUqW2Rp1/fgUW4fehFtd+tKbA9yG9iAVRL5irEa6GQQs5YAFpscQgCg7xF5kvNghmPh
         OYQQ==
X-Gm-Message-State: AOJu0Yz/Ue+mhIzoDZKW1PfhQ7pssJSBmD4TjvUz0oWOzuGVAk0efjPS
	xpTNY+9XKJPbp4VxjN7xMTL3K2WU1keZ8qmnkDKAwTAebyhSopqFBhquENYYEgJYmdGUzAYuKIz
	DmVoLZxo84PHO/G0F3yFk9BP6aQ8L2EO3u/BOc7M=
X-Gm-Gg: AeBDies7xFHQmNaDR09JXqmM5D7LEwnCYUkSwDTslwpYKtkNgJURhgachW9d9GctSXp
	S0DaMt9cM47rAY9sMPcoogaBskCsh14yNSk1lBT0If5AmmtTmmWh1tiOswuKmrawNwmk8A4sFa3
	gnYJJp0ZYi70fT36nLJsTwPl7OKxfVDZzfchU3pjCyfZasA6160ncjU5g65wgvJyL8bAZCXoUUa
	COVn49Jr0ta6xbzPmIW5BdmNzOamqH1HiBX6nS4RNxARnL/nXQBzvfLKCKgpIlmANR25VIY1MIy
	BgJ7LKZLhWqGgFRx9A==
X-Received: by 2002:a05:6512:3053:b0:5a2:7bc9:5ea8 with SMTP id
 2adb3069b0e04-5a417308d6dmr4825857e87.42.1776775926500; Tue, 21 Apr 2026
 05:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420082805.14844-4-kerneljasonxing@gmail.com> <20260421094024.5E8EBC2BCB0@smtp.kernel.org>
In-Reply-To: <20260421094024.5E8EBC2BCB0@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Tue, 21 Apr 2026 20:51:28 +0800
X-Gm-Features: AQROBzBvOEVDnrllqINttlteAMoHUYhHG9TTyxC-L4vg0Zi7omrGlHiNO77ggG8
Message-ID: <CAL+tcoDYCX0cdte=jFiFfR5VhkoMQ4-w9Xp-ySLL-aOYS+zFRA@mail.gmail.com>
Subject: Re: [PATCH net v2 3/8] xsk: fix use-after-free of xs->skb in
 xsk_build_skb() free_err path
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 5:40=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 1 potential issue(s):
> - [Critical] Dangling `xs->skb` pointer on `-EOVERFLOW` error path leadin=
g to Use-After-Free.
> --
>
> commit 4ce0cecf5e8e18bd369c02242f70a42cc8fbdf03
> Author: Jason Xing <kerneljasonxing@gmail.com>
>
> xsk: fix use-after-free of xs->skb in xsk_build_skb() free_err path
>
> This commit aims to fix a use-after-free in the xsk_build_skb() error
> handling path by ensuring we only free newly allocated skbs when a
> continuation descriptor fails. It prevents freeing an in-progress
> multi-buffer skb by adding a check for !xs->skb before kfree_skb(skb).
>
> Link: https://lore.kernel.org/all/20260415082654.21026-4-kerneljasonxing@=
gmail.com/
>
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
> > @@ -969,7 +969,7 @@ static struct sk_buff *xsk_build_skb(struct xdp_soc=
k *xs,
> [ ... ]
> >  free_err:
> > -     if (skb && !skb_shinfo(skb)->nr_frags)
> > +     if (skb && !xs->skb && !skb_shinfo(skb)->nr_frags)
> >               kfree_skb(skb);
> >
> >       if (err =3D=3D -EOVERFLOW) {
>
> Does this patch leave a use-after-free on the -EOVERFLOW error path?
>
> When xsk_build_skb() handles a continuation descriptor and encounters an
> -EOVERFLOW error, it jumps to free_err and enters this block. Looking at =
the
> subsequent code in xsk_build_skb():
>
>         if (err =3D=3D -EOVERFLOW) {
>                 if (xs->skb) {
>                         /* Drop the packet */
>                         xsk_inc_num_desc(xs->skb);
>                         xsk_drop_skb(xs->skb);
>                 } else {
>
> The xsk_drop_skb(xs->skb) call consumes and frees the socket buffer, but
> xs->skb is never set to NULL.

This conclusion doesn't hold since this path (xsk_consume_skb(skb) ->
xs->skb =3D NULL) handles this.

>
> Because xsk_build_skb() returns ERR_PTR(-EOVERFLOW), the caller
> __xsk_generic_xmit() intercepts this error and continues its transmission
> loop without aborting.
>
> On the next iteration, __xsk_generic_xmit() would pass the dangling xs->s=
kb
> pointer back into xsk_build_skb(), which will dereference the freed memor=
y
> when checking skb_shinfo(skb)->nr_frags.
>
> Should xs->skb be cleared to NULL after calling xsk_drop_skb() here?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260420082805.14=
844-1-kerneljasonxing@gmail.com?part=3D3
