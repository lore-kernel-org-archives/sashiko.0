Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095B03C061F
	for <sashiko@lists.linux.dev>; Tue,  5 May 2026 19:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778009617; cv=pass; b=q1LUzAZ/97sCgd6TgmOlJqdO4woPqpMu4Ye2GYF2JLuAisUoi2lgaZuraKNQZ8tcwHkmxHQk62IMKQBIvSnTNKSX2RD3LXx+MQTef5bs5xPOQ6FqeeHW1SLD2GfYm7Ej+w11LAO8RrG7CubmOST2c+6LOLyWtUAODLzSmqNoj5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778009617; c=relaxed/simple;
	bh=6hQpRAVZET/RhGbGB4BG8p3CqbP6CtHoy5WXKlwPY/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JbKMDxREqFsF4qrY0GhOQUDWqNjCyrj9K5oQjX5ut360jSdC0Bz+L/ANQerAikhYTOgfxxST+7Ee2YVJWWr+NX/aJtjmGoT96VNy/giIk2OVcFNRMutJTKkfJ/wsJFmoWLZgbyps1GTJBPsH/Op51ObDDHBu9ExM69ojWyZ0U+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqPlzwhk; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqPlzwhk"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38e7d983f91so61135431fa.2
        for <sashiko@lists.linux.dev>; Tue, 05 May 2026 12:33:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778009614; cv=none;
        d=google.com; s=arc-20240605;
        b=VkqahLGou5WNDayjESkhPDsq0thQ0u/U0q+m4MIA/Hr6o1hhgp/O1TjWHub4WhixdF
         x7dI5afEtfepqQ93RGPHQAZl8z/YySBHCttw4bZQIM7Dw4T3/hpDbpcUoh2FwymqjI/g
         5Y0IopAiFxyO1PoPI/P6bi9TeeKffbJm86psF7tJZ8NPUW1X+zLDqG1KMZKbCNzwYwGr
         ECLaPVLzdflHtmlok+Tq8NCEyxtHxc+dO/kthtHg6OADaK+c+df2GcLzlQSC/2C6TJ7h
         7iObfJyCvb3CDLNeSR+wbwIoK6Ocfdqwjw/B8dJWKGkdn+iiF8m2bRiHXxVYjl3MHS6d
         ZyZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iFN4aIkGIz3vOcI87It1Of+5hlBzbaB7CC9s68mzn90=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=eHWA9ZtmyMqoq0R6PuPupnfLiOPSTk4vc0XjZnta0DxR6ovIBqaZ7J1kRoBD4cvMLQ
         ps1pRdi/UvFSBl/VhBrPx/yYIHaOHDbRWzDk6psdLw021ukCym0GrtAH9HYJvh4p4z1l
         5N3l7C5HVCVyLAmoQBiHw0GAcs0DDUcB5tLFHpDRorrWg/KpaJvpfuNpPyVicPoFiI/H
         HGDAEcz5h532vI9kMFWsNTpKMaOaySHE3XTRSuCjNYib6ktbUrp6Kbp9vFFCTVCcMyDl
         Q1keJ1wkXt8o9oq1nRzkoY1z0GYqBAD57T3Hc79UnN4wR02/gXpqEw05fUe5zJF1D8K0
         bRpw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778009614; x=1778614414; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFN4aIkGIz3vOcI87It1Of+5hlBzbaB7CC9s68mzn90=;
        b=DqPlzwhk7kk7n3bfClJmUW9t11fXUMdpiZ2uIgIPzw4NqjXlcFBUuRPrbxSkVa3ynj
         5+/729D8Z+1e1UvRRCdxZcILp8bM5tcw0/eLK6KPCZE6ORBm5Elz7IeEdKSCTEx9F0e5
         nXgJlTsE9dUZx6nNbkrbP/jGNSLt1lNsN5ZpDeCzBDmSgz7C+upjlUV35noiRn5ISEx9
         OuYtw3BuNpfZCRW3f/vCc//eTyyjiJmInlRybTxYYgOgYyXeqaMQMy+Q6mbTFJATzdvv
         HRTi7lgo+Ls8J/CG+oS3yY1fEf7m0j0BworF7wyHWlbL6QuTdtAWbjb8v7iSboF63MNr
         3AXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778009614; x=1778614414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iFN4aIkGIz3vOcI87It1Of+5hlBzbaB7CC9s68mzn90=;
        b=a8YGy+Jobe28v8k6yMpBVmfOs2RmWxGNr7j/QJpi/RXX2gQNI4p7Wiy98COQgxUE8X
         hzJCqr+QDI9L831kASllGLZjc9TRITPQyPUpTNFjlgt5JWU1ikg2BX8wUV/Cy/z/0wmq
         vRykBMlV+SrASJOH2n1Bm1IuStJ68n/Jx6NIvnVlJ5ECbHfVHbZ1zXZfH9fhm8rLB5El
         0WkkmomXzZZ2Zuozf5YTruIh1A+r+AnIurmHpBVD3xE46Rkgi3mWxrzjGGnUXDjHjuvC
         oCCYWbThVDxVYSsWHs/EFqTI2eqGQ/RXhQjsMmxB+5alp5Q4oPC4CM9/F1AR6xcA92x0
         goyA==
X-Gm-Message-State: AOJu0YwRfjxMv442XWcTXx9YWm3166VCWo+GmdJjReagBRUnxwWXwN4t
	eypiJnaBlYRoRv6boNDGjtTuMBivjBKuvio6ElI9dRYrNcGrTvJgIyQfuxOESIYmbiLNyte0B+s
	46I5ebTG985lLLR1eUdd4nSI1Gpfk8CYe5C72SWXQSw==
X-Gm-Gg: AeBDiesYDaAcpYerQER7c71SVySwBvD87PWdAVhmRDd8Sv5K4s7Dpg2AV9sBpFi8+sj
	lsSJ8i0T2xHLcPJevbyqZoGFcXZ7PvjCKrmOEy4r28miZE/WURoTJyOuFuc4Fo1UTfwmeQ9/m5f
	qylzf02TN96XztcpYs6Rqf51Rnk5hyV4LwLPHfQnD5vBe085BQCE5HkqJizEX0Z9ehBewRFMoJB
	Op3QTf3dNty+9z25DvgsYYYddSW0s6LoF89xsZY0vf6uh9p/Hd0LdB07P67VZMgA07Y7CzrLIZ6
	9FfUFMUzANEiRL2YfcLC8//ej8NxOyEzDErhyGxSUpXOBz+R
X-Received: by 2002:a05:6512:6cf:b0:5a8:5276:f0db with SMTP id
 2adb3069b0e04-5a887ae5607mr33173e87.15.1778009613522; Tue, 05 May 2026
 12:33:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260502200722.53960-5-kerneljasonxing@gmail.com> <20260503200925.DEF06C2BCC4@smtp.kernel.org>
In-Reply-To: <20260503200925.DEF06C2BCC4@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Tue, 5 May 2026 22:32:54 +0300
X-Gm-Features: AVHnY4KwMxKAZRkQzWU0JnQfzYE12w2IOibSYPNW7_E2hrHzFe7dqbrGkHLppuU
Message-ID: <CAL+tcoALJcEgPNuTXHESTkZxU8y2ASixW5Ccd7jd7vp9O2PWdw@mail.gmail.com>
Subject: Re: [PATCH net v5 4/8] xsk: fix use-after-free of xs->skb in
 xsk_build_skb() free_err path
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 3, 2026 at 11:09=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] Memory leak of SKB in xsk_build_skb_zerocopy() when TX metadata =
processing fails.
> - [High] Memory leak of xsk_addr array when an SKB fragment allocation fa=
ils and the packet is subsequently dropped.
> - [High] Double completion and Completion Queue (CQ) state desynchronizat=
ion when xsk_skb_metadata() fails.
> --
>
> commit 7c8b265d19cf8eaa2671c3f79683f55810dfc68a
> Author: Jason Xing <kerneljasonxing@gmail.com>
>
> xsk: fix use-after-free of xs->skb in xsk_build_skb() free_err path
>
> When xsk_build_skb() processes multi-buffer packets in copy mode, the
> first descriptor stores data into the skb linear area without adding
> any frags, so nr_frags stays at 0. The caller then sets xs->skb =3D skb
> to accumulate subsequent descriptors.
>
> Fix by using a !xs->skb check to handle first frag situation, ensuring
> we only free skbs that were freshly allocated in this call.
>
> Closes: https://lore.kernel.org/all/20260415082654.21026-4-kerneljasonxin=
g@gmail.com/
>
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > index 06ee260f3afc..55378c3855d5 100644
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
> > @@ -972,7 +972,7 @@ static struct sk_buff *xsk_build_skb(struct xdp_soc=
k *xs,
> >       return skb;
> >
> >  free_err:
> > -     if (skb && !skb_shinfo(skb)->nr_frags)
> > +     if (skb && !xs->skb)
>
> Does this code leak the SKB if xsk_build_skb_zerocopy() allocations fail
> during TX metadata processing?
>
> If xsk_build_skb_zerocopy() allocates a new SKB using sock_alloc_send_skb=
()
> but metadata parsing fails (e.g., xsk_skb_metadata() returns an error), i=
t
> returns ERR_PTR(err). The caller xsk_build_skb() explicitly overwrites it=
s
> local pointer with skb =3D NULL before jumping to free_err:
>
>         skb =3D xsk_build_skb_zerocopy(xs, desc);
>         if (IS_ERR(skb)) {
>                 err =3D PTR_ERR(skb);
>                 skb =3D NULL;
>                 goto free_err;
>         }
>
> Since skb is NULL, this check is bypassed, and the newly allocated SKB an=
d
> its associated socket write memory quota are leaked.
>
> I understand this is fixed later in the patch series by commit "xsk: avoi=
d
> skb leak in XDP_TX_METADATA case".
>
> Does this code leak the xsk_addr array when an SKB fragment allocation
> fails and the packet is subsequently dropped?
>
> When appending a fragment to an in-progress packet (xs->skb !=3D NULL), t=
he
> code identifies an inline address tag and replaces it by allocating an
> xsk_addr array via kmem_cache_zalloc(), initializing xsk_addr->num_descs
> to 1.
>
> If alloc_page() subsequently fails, the code returns -EAGAIN to retry lat=
er,
> leaving xs->skb intact.
>
> If the packet is dropped before a successful retry (e.g., socket close
> triggering xsk_release() and xsk_drop_skb()), xsk_consume_skb() attempts =
to
> clean up the array. However, xsk_consume_skb() uses the check
> if (unlikely(num_descs > 1)) to determine if it should call
> kmem_cache_free().
>
> Since num_descs is exactly 1, the check evaluates to false, and the xsk_a=
ddrs
> allocation is leaked.
>
> I see this is fixed later in the patch series by commit "xsk: fix xsk_add=
rs
> slab leak on multi-buffer error path".
>
> >               kfree_skb(skb);
>
> Can this kfree_skb() call lead to a double completion and Completion Queu=
e
> (CQ) state desynchronization if xsk_skb_metadata() fails?
>
> In xsk_build_skb() copy mode, xsk_skb_init_misc() sets
> skb->destructor =3D xsk_destruct_skb. Immediately after, if xsk_skb_metad=
ata()
> fails, execution jumps to free_err and triggers this kfree_skb(skb).
>
> This executes the SKB destructor, which unconditionally submits the faile=
d
> descriptor to the Completion Queue by advancing the user-visible
> ring->producer pointer.
>
> Immediately following the free, the free_err handler calls
> xsk_cq_cancel_locked(), which decrements the internally cached cached_pro=
d
> reservation counter. This desynchronizes the internal reservation counter=
 from
> the user-visible ring pointer and falsely pushes a completion event to us=
er
> space for a descriptor that failed transmission.
>
> I note this is fixed later in the patch series by commit "xsk: prevent CQ
> desync when freeing half-built skbs in xsk_build_skb()".

Those three points you brought up are all handled in the series.
Again, the order of this series is designed deliberately to avoid
new/severe problems.

Thanks,
Jason

>
> >
> >       if (err =3D=3D -EOVERFLOW) {
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260502200722.53=
960-1-kerneljasonxing@gmail.com?part=3D4
