Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA1440DFCE
	for <sashiko@lists.linux.dev>; Sun, 19 Apr 2026 14:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776607460; cv=pass; b=l+BhOLKYffXvzpVH9eWjuksZKI0vYjeYeUToScj2exY0D6r1kOrP6mGxPFfvIKAYEmCn4/mMFFWZ+WqWYsZAptnZ6jZga4bVzyATCw9kUD9qKv9Ghs748qS/+GoKvSWEcIl8QHcZevZvCEFsRev586dxqa0tHzfIpdqaOKxUJO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776607460; c=relaxed/simple;
	bh=2RVo/RSCifhEzKkJZ9yxsZn/G5E0iUqkOdyqNiEFN24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JOlHBr/1ueDk2OaawZaA4KhcnceST3MoppwBHAWY30Bmu+y7bzZuFz2JUpwli/96car7pxK/skW9+7yfMYJ1TZsi2vH79hfiMfkUwfZefIjhMvv/06nuDoyrsMPhDAhBsjCBr63Nijw4efG3KQVWpmEuMJ6qhQG4l6XhTozByNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQihTTLa; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQihTTLa"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a3d42263e4so2125114e87.2
        for <sashiko@lists.linux.dev>; Sun, 19 Apr 2026 07:04:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776607454; cv=none;
        d=google.com; s=arc-20240605;
        b=RglzIlisvIFwQnUkVbvTepwh+zh8dc6al3kS0LJTr0Z3NlCUTZCI0sVQSqnqGb/kr7
         KZinysmjdRyaQOx4c0Yaz8L4idaxCiBgEIvphgilzFaoCjPzhVj5lVbycRb49WFA9JUJ
         GLdkT41+NLkHdjBO4dRADFMHvVoeyhijhlKtycyuIO3MQkwCH7WOjjU9bG1lAie/GaZp
         Vo6QNP4vXN5Kwg0GNd6h9ut+/zBp+VxNA0jkAn8JehYZewqz4g01rORfscTHxHiEd1Rw
         UsuwxR54OBUSpB9WT9HG4Gc0V2oJ6Jvqkyy8dd0crTcJoVfqsoxM89iZ7s8aPD0q1lPe
         ctQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e12Eq09G32hg7N3z+criCjnBR6FQ2NhhxFDm3/Q78Ts=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=F2769MQWaCpLRnIhYb12mW5DUToUGTJIoA54DrzpjntXecjzGvY8JVcbSsV9CnNuVj
         HqSKr6HRgT0gvP4bGmBqCq5/AYmZVabbsKsUjmSqpNf3qxu32JauA0V0VUG6cdlUHe4f
         nFZnGm2PRtPr6VxapAgwmmccEU82i68InR/yrCZphzcZjxA5LE9HzJzfvmhdBNyVczgW
         Dn3DWfHOaYAU8JfUYiPm+HKIPGG/CfomMKW5bLj1VKi9cvDMfhiw7+KRDASDDs6ox5dJ
         w8o86cokLHpC90KmfabiQDJDMw0nQYeP5Q5d6pCpgrTnMS1qxikxJrq9vLr2+iwgcek7
         0ZQg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776607454; x=1777212254; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e12Eq09G32hg7N3z+criCjnBR6FQ2NhhxFDm3/Q78Ts=;
        b=bQihTTLaFIzjYt/BVPJRqVAx43V52l4yAGChYYqnpmVF5HJ4low1UwAeyYe8KU47dK
         NKFRSBvYAGH7fnexLDNN/fByWXSvasTn8D1Ioc2IHp6yrQ9i6rh1boV0HRIAbnOTfZku
         vhJ6syjDtNG+BXNl3XDwxj6idI/LNkJ1lLu+5zug0nRH96MvhlV5R0taNXrdwvkh/RuB
         mXZ5RJIxnKATyXHSfIWMwM7+1I7s/aKDwaS6Gk6ATCfGg9cCJ/8aP0muM7hvMDuCeZLZ
         Rn8mc/0hWi5OUOPbsXBdiZOad+szP8CSqk12Jsg5TCcOWKaq6WV1lo+SXL3NcYCqGHSK
         Cm+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776607454; x=1777212254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e12Eq09G32hg7N3z+criCjnBR6FQ2NhhxFDm3/Q78Ts=;
        b=GxUhZ7wnXMPQv8+oRzDXpCFwm2Kx5YmF0JcSe+b1Iq79nwSjhEN51iTBCHkljSqsnT
         axOitQUz5UocewQzyRV8bfqIleeyY1w70TtrZRCEg8pQMdncZed6fvEIFA6eeFuMt9/l
         ynKTBVU+z2XydFohTf4s/HrB/6WdJ0o/jqn0aBU4p+6JviXikDwNY5ZYwuw0sry6R1uk
         aRcutP8Gy3MqrJVYeeQc1QJdeJyF46eqCLj1EZ81OGCpJWjSq2FoMo8A7ZNSXMON/EX2
         skrfK6kcdQ5snkkPGdLmVN1rIxmxgbYL7rvP2vS35MEHx/TSQYA3QN4CnZnhaXPmpNxG
         ulIw==
X-Gm-Message-State: AOJu0Yy9zRs4OIgHEKfcVWzFFNgkK9dvLvuOSJbLF7ELx3MgqdlpnJHe
	fiO7BASFg2WBKUevzBP+qn/8hI52RpsTOtNf9mGaxW5KzQiH/50lS2TnRnulRixJz0y58z+rPU/
	7mbfYZDoC7+x26/kS0MlRGIVCUq5Savi8TPOR321ajw==
X-Gm-Gg: AeBDiesR89UcsBiEDH4doaxscwGgHXdYJpi426gLqhppI85wFbteySADk6BTrTzqvSO
	CvStw1b/UBRbqor45RDa+PEY0oiZTGGkpwLp1bH7gvXEjp1vcjKSM8a9G/dHSnpc0pMsIgJ1NXb
	7w0RhohlfXoWw05y04wq7X7AiZ873J5nF8KviPlXkpoupRVfUsYVseYY2jIqeRwbrfOBWSotpb4
	aMDaFC8YRfWawhL6OwlTlxQYBuL7obnwKGU65g7Y7rEeD64iDyG4Lc6lrOokLdSbUFwgbBzqWTW
	Mj+62gOvJftdCybZdA==
X-Received: by 2002:a05:6512:6c7:b0:5a2:c766:13bb with SMTP id
 2adb3069b0e04-5a4172cc01dmr3026692e87.18.1776607453929; Sun, 19 Apr 2026
 07:04:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260418045644.28612-3-kerneljasonxing@gmail.com> <20260419045823.417A4C2BCB8@smtp.kernel.org>
In-Reply-To: <20260419045823.417A4C2BCB8@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Sun, 19 Apr 2026 22:03:36 +0800
X-Gm-Features: AQROBzBk6dZxLwBITTzv6ntf1Ghy5u3GgL7dt6A_-e7BFhx940vQ0MvI_eYTV7o
Message-ID: <CAL+tcoD-Vx=93myozGvuCz8J9DTz0Byb9wX_mSvtFD3q-zDxUw@mail.gmail.com>
Subject: Re: [PATCH net 2/4] xsk: free the skb when hitting the upper bound MAX_SKB_FRAGS
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 19, 2026 at 12:58=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 2 potential issue(s):
> - [High] The patch leaves a guaranteed NULL pointer dereference in the ca=
ller's error handling path when `-EOVERFLOW` is returned for the first frag=
ment.
> - [High] Calling `kfree_skb(skb)` directly triggers the packet destructor=
 and incorrectly submits the dropped packet to the userspace Completion Que=
ue (CQ).
> --
>
> commit e5bfaac263557abd44f47ec6e9c85e50c7aa1efc
> Author: Jason Xing <kerneljasonxing@gmail.com>
>
>     xsk: free the skb when hitting the upper bound MAX_SKB_FRAGS
>
> This commit explicitly frees the skb when the MAX_SKB_FRAGS limit is hit
> on the first descriptor to avoid a memory leak.
>
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > index 5b273bcd0dbce..3d6c6caa7ff82 100644
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
> > @@ -858,8 +858,11 @@ static struct sk_buff *xsk_build_skb_zerocopy(stru=
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
> If we free the newly allocated skb here and return -EOVERFLOW, the caller
> xsk_build_skb() catches the error and jumps to free_err, where it calls:
>
>     if (err =3D=3D -EOVERFLOW) {
>         /* Drop the packet */
>         xsk_inc_num_desc(xs->skb);
>
> Since xs->skb is still NULL, will this cause xsk_inc_num_desc() to
> dereference a NULL pointer?
>
> Note that this regression appears to be fixed in a later commit 1c728000f=
884c
> ("xsk: handle NULL dereference of the skb without frags issue").

As you noticed, it was already fixed by patch 3.

>
> Additionally, does calling kfree_skb(skb) here trigger the packet destruc=
tor
> and incorrectly submit the dropped packet to the userspace completion que=
ue?
>
> Prior to entering the fragmentation loop, xsk_skb_init_misc() sets the
> destructor to xsk_destruct_skb(). When kfree_skb(skb) is called, it invok=
es
> this destructor, which sequentially calls xsk_cq_submit_addr_locked().
>
> This writes the descriptor address to the completion queue and advances t=
he
> user-visible q->ring->producer pointer, falsely notifying userspace of a
> successful transmission.
>
> The caller xsk_build_skb() then executes its own error handling, calling
> xsk_cq_cancel_locked(), which only decrements the kernel's internal
> q->cached_prod counter.
>
> Could this desynchronize the internal queue tracking variables from the
> shared memory ring pointers?
>
> Should the destructor be changed back to sock_wfree before freeing it,
> similar to how xsk_consume_skb() handles it?

Right, it's the same (pre-existing) bug as pointed out in patch 1.

Thanks,
Jason

>
> >                       return ERR_PTR(-EOVERFLOW);
> > +             }
> > [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260418045644.28=
612-1-kerneljasonxing@gmail.com?part=3D2
