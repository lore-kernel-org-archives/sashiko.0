Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93F61F03DE
	for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 01:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776302346; cv=pass; b=d9Ka3646yUoa1G5qYn/5x4DComrrTnp5lWNvokxcR6wPc0nc+V7YZ5kcjV63ET/kXrqM8o777QeeZS6OCAijMuaUp+n7XFavZpokimPZvMFzhtPLVyiOcEFxHysEvEKMXHKDgmbjVlJWm6IdIIuwlI3BAOfoVK7vj2eM2czSbJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776302346; c=relaxed/simple;
	bh=XCtJXo6oKu5qJcO35V9S1Ifbd7LnW/zGipwZFVwFPkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uwIbRP4EJnRI64KEUTSvGc1Uy5Y0N6LX8Mt0KVajsxnVNvCYBc1B4/UKvd4c1KYQDlLH0BsyMZ/sAsZkVLmfyFtB/iYopB4HhIXj/sXmEVBpL6kH0+mgH8daFkyhf1tvFccKYV3A5raBoo6Sc5dacfpz7R0KhfDjZ10ZB4pLLwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwQFk8gf; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwQFk8gf"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38e7d984096so41474731fa.2
        for <sashiko@lists.linux.dev>; Wed, 15 Apr 2026 18:19:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776302342; cv=none;
        d=google.com; s=arc-20240605;
        b=SjvZjoza3JtZUhy0t1IC4rbndTfZQbOkpG/f+WY8hcGnD8+eXX0On82sBxaF2aC//4
         sfsvGPoWXMKTW6njMXuriA7qpennUCdemf51rBk2tF/khXmn3Lt8Yf0raaZsXEHGzFay
         u/oSjNTiTfwoyuWmjJdxg3Rxc9j6lgBjrtoS951rUHqG0g5hNWz2v8P7q222yW6WjII4
         2hE057cS6cyDRogzWdr4H6f8aGrJTb7ucBwF9+QRF2X5rW6yfZnHbsxbtXAfurkcP4YF
         7qt3MpN+YN6qHQK5yyc54JkpiYm7ztNGxBJU0VvvnJmaqpPlEClG9dFxcun5lT4O29k0
         FV7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jZNhlsmlO+2dvKw7ULeWGa/3ZgJ/3xNp9y/uk0LituQ=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=QheQ6u869Ky/kDyBJugN7uN6CXjVALETVuIiSL1JOuHuwINa9AnFc/JD35PbdJi6CU
         xHuzemD49SPAQaau5dKRSSR+JGIDfZodeBjWtVHGK021+ph8YdAEG6YG7bINQs2QypBB
         hbFoVq3bOTsFl+C2MD0ArtA3jL78VkqAMfQSRebH4F8a+EGDq11Rzl0AL9TJo7PmbxqU
         KYIzEXEn7Yb468UtuYCBx7CG5J0/v14YlwBxughcCQiMQT6J+Vc4YD6n3rFpRWCLJfpb
         MZRkSOhtR856lq/Y6s++g2imLn9CXBx2+MvW8UxpZSdcklL6YpS4SBs92U8gMHc9uzn0
         PcjQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776302342; x=1776907142; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZNhlsmlO+2dvKw7ULeWGa/3ZgJ/3xNp9y/uk0LituQ=;
        b=ZwQFk8gfq3yVpq2sUH+ksSTlTxbu7+8ahXHG3VoWqRZwKxDxrO5z0w7cUX23rC/mzB
         IWgoM9qNl6W+RxX+1G7fdG3Q4i+WNQBKLZfh3Ad4B/1/DXS+W2lOe+bjPFiKfHQJ/ixN
         xNGuzECsI/W6OiUiOVBpfes2pCwPzMToaWsFJaZQOTrMSCWwsX9+kZdN46fjiVDR4fUI
         s2KpxlKKkpA773OK6Nu+lcGxd3T6aY5W6oZF8QgnYabw3a6lXC8zGHzxN644v1OZNBhT
         fVT4fw+FzAdr0XIoj4tKnNKwiRQlaqr+0eyYV89YJ+iJAsvHBSD+sQA1IPoYLLQB79Ic
         74tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776302342; x=1776907142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jZNhlsmlO+2dvKw7ULeWGa/3ZgJ/3xNp9y/uk0LituQ=;
        b=lJ0P8GeUUhyG1TazK+b6y06PezDAks6QJHhqE7t+NNOxjpmIeA+rV8i2sZ+Z3cTTQo
         VABZVy4zASV5FoPuy8Y3sLdGstzJFIoA8KraNFmS7Vb107kUhPgz2F2brgPrsxcu0AQR
         99aQtP72KImcVDvu4P10B4bz6u1vK2zwKpfC9LMzQ5X+p6JILFdIOPaVlIAmILLRvHAY
         XoSebRQ8CXWELpV8nrny7X6fMYizrE35SdzBV51DFn36b5p6kHhEKjuDz81kYdWblAdw
         ZKSb8FWe7Ar9mxhuDQt0TTf3teK2QjA9BlLj7pSxuvcvqnh3WSgTvxXIePufVudO31Sd
         xvSw==
X-Gm-Message-State: AOJu0YzkdxBpvP9vDPGom6ZrqpEv6+CMa+U8DJHky/3AXdS9+rmm68tH
	tmtFZIl1tbfDt9zY92qP8rputk0mPjIbHBM/fGUtokYh5SNwJZDiBanIbAK0ql9mhFyUiNDCVni
	RSiVx1OmXKoa2D51wA0zkUtJp+4P1s0GCwxaUlmXBzA==
X-Gm-Gg: AeBDiev3+K/U82RVmm0fp6dNyAcl430+Ksrd0DIj7OdCrKmnRTvkLS16XRS1rltAPb5
	9QgUx8h5vECmqR0OPJS+QbvsnzkzBDLrh0t2BY4pECyxzqhpslfKmVbaY7a8pPmG/LsA0ZG4v4i
	LTbnqjAZW43GO0kG7mi7RA9QGNzXNjkbiMobsoSJxzUrzDSHUrKQl7JFBjXS4mMU54I8AyhdU0w
	8NTBH7CFnpgShOyN45WU7kGX23WFrjROWO+bDhT+ScMR1TnZMhq5sg9QukX9NFD8iQmJDK5G70b
	1zmpv2qpM3g7Pq51L+qjG45Modin
X-Received: by 2002:a05:6512:3a90:b0:5a2:b903:3b43 with SMTP id
 2adb3069b0e04-5a3efb2c5a2mr9974360e87.7.1776302341381; Wed, 15 Apr 2026
 18:19:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415082654.21026-4-kerneljasonxing@gmail.com> <20260415091743.97FA1C19424@smtp.kernel.org>
In-Reply-To: <20260415091743.97FA1C19424@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Thu, 16 Apr 2026 09:18:23 +0800
X-Gm-Features: AQROBzDY8Xm2_8Cu4ecozfQPST7XLRuJGrF9Z76mRu-0wA7GQDyWPFtrQn7sF58
Message-ID: <CAL+tcoD9g4M9iv+oLzSzPs1pcyQDe+R9wnHvn-DfnuZVysxbSQ@mail.gmail.com>
Subject: Re: [PATCH RFC net-next v4 03/14] xsk: add xsk_alloc_batch_skb() to
 build skbs in batch
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 5:17=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 2 potential issue(s):
> - [High] Pre-allocated SKB and socket memory charge (`sk_wmem_alloc`) are=
 permanently leaked when zerocopy metadata processing fails.
> - [High] Double-free and Use-After-Free of `xs->skb` when fragment alloca=
tion fails with `-EAGAIN` in copy mode.
> --
>
> commit 3ef2c03b6204759327ab337fe34617d9dd8e04ef
> Author: Jason Xing <kernelxing@tencent.com>
>
> xsk: add xsk_alloc_batch_skb() to build skbs in batch
>
> This commit introduces xsk_alloc_batch_skb() to support allocating and
> building skbs in batch. It reserves skbs, batches the sk_wmem_alloc charg=
e,
> and then copies data to complete initialization.
>
> > diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> > --- a/net/core/skbuff.c
> > +++ b/net/core/skbuff.c
>
> [ ... ]
>
> > +     /* Phase 3: Build SKBs with packet data */
> > +     for (j =3D 0; j < alloc_descs; j++) {
> > +             if (!xs->skb) {
> > +                     skb =3D skbs[skb_count - 1 - k];
> > +                     k++;
> > +             }
> > +
> > +             skb =3D xsk_build_skb(xs, skb, &descs[j]);
> > +             if (IS_ERR(skb)) {
> > +                     *err =3D PTR_ERR(skb);
> > +                     break;
> > +             }
>
> Can this lead to a double-free and use-after-free of xs->skb if a fragmen=
t
> allocation fails?
>
> If xsk_build_skb() fails to allocate a page for a subsequent fragment in =
copy
> mode, it frees the partially built skb and returns -EAGAIN. However, it
> leaves xs->skb pointing to this freed memory.
>
> When this loop breaks and returns -EAGAIN up the call chain, the caller
> __xsk_generic_xmit_batch() checks xs->skb and calls xsk_drop_skb(xs->skb)=
,
> which would double-free the skb. Furthermore, any subsequent transmission=
s
> could dereference the dangling pointer. Should xs->skb be explicitly clea=
red
> when handling this error?

Ah, great job! Sashiko again found a real pre-existing bug! I will
include it in my separate fixes.

The corresponding fix would be adding a more strict check in
xsk_build_skb() to exclude the case and let the caller to free it:
free_err:
        if (skb && !xs->skb && !skb_shinfo(skb)->nr_frags)
                kfree_skb(skb);

>
> > +
> > +             if (xp_mb_desc(&descs[j])) {
> > +                     xs->skb =3D skb;
> > +                     continue;
> > +             }
> > +
> > +             xs->skb =3D NULL;
> > +             __skb_queue_tail(&batch->send_queue, skb);
> > +     }
> > +
> > +     /* Phase 4: Reclaim unused allocated SKBs */
> > +     while (k < i)
> > +             kfree_skb(skbs[skb_count - 1 - k++]);
>
> Does this permanently leak the pre-allocated skb and its socket memory ch=
arge
> if xsk_build_skb() fails?
>
> When xsk_build_skb() encounters an error like a zerocopy metadata process=
ing
> failure, it returns an ERR_PTR() without freeing the skb. Because k was
> already incremented before the xsk_build_skb() call, the Phase 4 loop sta=
rts
> reclaiming at the next skb.
>
> The failed skb at index k - 1 is bypassed. Since it is never freed,
> sock_wfree is skipped, leaking both the skb and the batched sk_wmem_alloc
> charge.

This is the pre-existing bug that you pointed out in patch 2. I'll
take care of it for sure.

Thanks,
Jason

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260415082654.21=
026-1-kerneljasonxing@gmail.com?part=3D3
