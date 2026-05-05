Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B754963D2
	for <sashiko@lists.linux.dev>; Tue,  5 May 2026 19:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778010242; cv=pass; b=H/E/VL7Mq/Be4wCc8QV4Ajqc0XxATGBab1SFz35xd4beZHbjZldKOpiFfNsaaUnjh/98Bc2r8nu4niBzpSyUo49EDwd+OGZxzF/wKBzxLKNc4isnoP3JG7H8ny7FoOqDnO7YXvT5y9QP54copWijaOvvzMOPVZDZ/ggAGJT4pq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778010242; c=relaxed/simple;
	bh=hlKPTcZBKLMUo0YHNqgYAkK/xTkVxPVfe2bRbG9SGjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jVjdXzrdE9YYW13SSr1J8Pl/eqmmhjwsef033p3pjGR7cdEVnuFNse9WhIsOdLRfIftwzMiGmIe02jtoDZNP+7KEwvmvukSWgoewT9qCsRLpfGA7UfRMGpMAfGJbnYewCVvZNb8AILg9fXsOpjNUeUNx28DcL5A+S8ofy/WUuBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rU5lLgvt; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rU5lLgvt"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a8704dc3a8so2889153e87.3
        for <sashiko@lists.linux.dev>; Tue, 05 May 2026 12:44:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778010238; cv=none;
        d=google.com; s=arc-20240605;
        b=GuhutGKZzqEiHkQJ9S9lC2N5uUs4aiRqoccLiB4XkjBK64pAE0e0fwTGUVYjT/Baq0
         tId9Mmepdl4LM3nyFIfN/OdGrRy2NvfUsRnmnWbfKn9Dq8ZUJOyY+zKQf5iXrqb0mk95
         +gcmUC7JHEyztJ1t/HKP7ZSyv6EKG8EKOdOPzlQ9sQC7w6MsU9r9H/J2hv25TZf8tMRv
         Q43L1eC439hZEtYRKVrcx0PkIdN/W8fJsg2kOfqERdnB+6jGL180XOv7UDdBr9j3RyYO
         dInk7tapHJ5CFFWUrA2hkkzXvg9YkxeBZWY51w5mJarvE3SvoSOMPFYebPBsrDBa33WS
         F1ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fLcZnduWjFr2QmT8zmnfKUhZKhkrNViMb2XdB8+qmDk=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=cV/UpPIIZBBxWnITFozdzYDCdxNS44BtAfZ5Q1bUxKD/Qzx9feAF0tnCTJpBGE84yU
         XjDz3P9RRt9zGNbw6R0UmHM+PAwKzJ617rqv/b4fbMbpoO/vsGRb8zNhi2fCKjn7/a5X
         uo/j7zhhdYBBgb5gWewqWvkcb5AZKFWG4p3bN7BKiZ563vZSsv4pAhhQXW15Z+P8B6oX
         wBogwhx680keHXgNSBe7TmAZMdArtvaVpJnhHPw8vjtTnWfrVaib8vlS0+xc+qjJJmGC
         Yy6preDb+1K7oK1ss44lsEk0j6NplpxPEawaCdJtWmmuFoNMh0fOBqmT6LGK3F0rNRSd
         I7UA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778010238; x=1778615038; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLcZnduWjFr2QmT8zmnfKUhZKhkrNViMb2XdB8+qmDk=;
        b=rU5lLgvtGN5SLB4gwZ/5Nd0Pf1cYPryM3fMzeXTRJ9pk/0Hqzgm2ykKcFIGz7qCByW
         HK9GejaE3zs+p+3/ltebr9yjlbPNkK/ISkynut1omYxoHICVK9C2ORRPQjfPtbpAWxss
         rnL5jR3WA2MtaU3vYVwWL3f96QjJShFA63B6nsNm2ZLEK9cBMWNVO+qsBwNmdziFEWuD
         59NCF8L+wL1FbAbKuKuN2BpCgyBhUGpWxYnfumdDL4uRsOSQB1VtxQJ5efJqGcIT0V1q
         DzJ63kNYmSPO8HtnWqVPcJHjvUqqZ75WgQ8bkJJCt0C1AZ2b8YmqI+XJf57E+jeclKkJ
         7SbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778010238; x=1778615038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fLcZnduWjFr2QmT8zmnfKUhZKhkrNViMb2XdB8+qmDk=;
        b=QVRKYdBHd46eq6eCpqGeW0aV+2mdfnTt7ptkWXZFXe2nI16LcOaeSVOaPdXPAYVmPP
         oO5qoeUDGJozL8D2uTB8cEC1W6j3jYpqMOddCzs8N4c+ouVH3m1ZKhB2LYohfQEd2OG9
         mWCQuNR85ESYo6ANCdFpjyHSst4Q8J/d+ww9QC0ikqDQHc56H6gzkhem+TSIhTpOM+Vb
         thwIBrToccj9vkDFqTshwB8k1jQHpZmADTFFG1/mF0zyIlgcy8euOw8U7x3QtnZgZnCM
         itiToaOTgFzsT6UxcvpV+gNkuUnGBRBF+1xQ8wyTcPu8+TD8udzzOuTrRlyAhnSDF+cQ
         txnw==
X-Gm-Message-State: AOJu0YyYyOG943MMDlJYcqGMuFFeCfNPiR6YFlNuET+FAmu1TxB/ZYbo
	EShiwiyrbFko3rt/uovNz0YwpeoR+wXkXQfuI81JPrsyRfMQKNHXzgo+4QV351AfFZ/jc8IQsHU
	e+oldE+LBVbb9WhdwBgFlJiSIRyQZ3FkZrxAl95Pg7Q==
X-Gm-Gg: AeBDiesfWbtZyvTDneeGnjRDLh2Yk1R/quolsc2tHda91rdcPM5us9fY1GwAcCxNKwO
	ZPNVnGa7JMmooqsQFZuDnoJbZmG6YSPQrsX022gmkMI5INd4kpakEjb5ByFzM5H38/AQNBkReed
	btf4aXH2oQLakAibiYJ7sx1QhJKSEOxLiTHEFgxesrrKuGol366JhTMhmFcI5WH75zUV/a9Oxrg
	+j7U1C6yz2dfsiiF1anizBbw1qP9la34XXLByqIFnOBcIMJPDwDiKRLT7jskCtRwtSwiD5G19GC
	35m8JKfDJrUv6Fg99JKx8ZAnxGWmuGbixR2nAJN9/xZyiWha
X-Received: by 2002:a05:6512:692:b0:5a8:707f:904 with SMTP id
 2adb3069b0e04-5a887a9a8abmr65729e87.0.1778010238183; Tue, 05 May 2026
 12:43:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260502200722.53960-7-kerneljasonxing@gmail.com> <20260503200927.73EA1C2BCB4@smtp.kernel.org>
In-Reply-To: <20260503200927.73EA1C2BCB4@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Tue, 5 May 2026 22:43:19 +0300
X-Gm-Features: AVHnY4Lv01cINAhIEEIe6wZATxILLiiSJz-Rsic27z6kKIapgvXwSyYVKlAQsZ8
Message-ID: <CAL+tcoA01z+L6fQdN-JXk8u+jC7=2qerMEFUD3AF4QdPXVG48g@mail.gmail.com>
Subject: Re: [PATCH net v5 6/8] xsk: avoid skb leak in XDP_TX_METADATA case
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 3, 2026 at 11:09=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Critical] Time-of-Check to Time-of-Use (TOCTOU) vulnerability on share=
d UMEM metadata allows bypassing checksum bounds validation.
> - [High] Leaked `xsk_addrs` structure in the non-zerocopy `xsk_build_skb(=
)` error path when page allocation fails.
> --
>
> commit f1079e9399771f267ff5b6767db05016e5ee4840
> Author: Jason Xing <kerneljasonxing@gmail.com>
>
> xsk: avoid skb leak in XDP_TX_METADATA case
>
> This commit fixes an skb leak in the XDP_TX_METADATA case by explicitly a=
dding
> kfree_skb() before returning back to its caller. The issue happens when
> xsk_skb_metadata() returns an error, leading the caller to clear the skb
> without freeing it.
>
> Closes: https://lore.kernel.org/all/20260415085204.3F87AC19424@smtp.kerne=
l.org/
>
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > index af3c5752bb63..770ba4695a9d 100644
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
> > @@ -821,8 +821,10 @@ static struct sk_buff *xsk_build_skb_zerocopy(stru=
ct xdp_sock *xs,
> >               skb_reserve(skb, hr);
> >               if (desc->options & XDP_TX_METADATA) {
> >                       err =3D xsk_skb_metadata(skb, buffer, desc, pool,=
 hr);
>
> This wasn't introduced by this patch, but is it possible for a shared UME=
M
> metadata TOCTOU race to bypass the checksum bounds validation?
>
> In xsk_skb_metadata(), meta points to the metadata area within the umem b=
uffer
> (buffer - pool->tx_metadata_len), which is memory-mapped and concurrently
> writable by userspace. The function performs a bounds check:
>
>     if (unlikely(meta->request.csum_start +
>                  meta->request.csum_offset +
>                  sizeof(__sum16) > desc->len))
>         return -EINVAL;
>
> If this passes, it re-reads the values directly from the shared memory:
>
>     skb->csum_start =3D hr + meta->request.csum_start;
>     skb->csum_offset =3D meta->request.csum_offset;
>
> Could a malicious user application race to overwrite these values with
> arbitrarily large 16-bit integers between the validation check and the
> assignment, leading to out-of-bounds DMA accesses? Might we need to copy
> the metadata to a local variable (e.g., using READ_ONCE()) before validat=
ion?
>
> > -                     if (unlikely(err))
> > +                     if (unlikely(err)) {
> > +                             kfree_skb(skb);
> >                               return ERR_PTR(err);
> > +                     }
> >               }
> >       } else {
> >               struct xsk_addrs *xsk_addr;
>
> This wasn't introduced by this patch, but does the non-zerocopy
> xsk_build_skb() leak the xsk_addrs structure on its error path?

This issue will be fixed by a standalone patch then :)

>
> When appending a fragment to an existing SKB (!skb is false) in
> xsk_build_skb(), the code converts the destructor_arg from a direct addre=
ss
> to an allocated xsk_addrs structure and initializes xsk_addr->num_descs =
=3D 1.
>
> If the subsequent alloc_page() fails, it jumps to free_err and returns
> -EAGAIN, leaving the partially built SKB in xs->skb without incrementing
> num_descs.
>
> When the socket is closed or the SKB is subsequently dropped via
> xsk_drop_skb(), xsk_consume_skb() is called. Because destructor_arg is no=
w a
> valid pointer, it fetches num_descs as 1. The cleanup logic relies on:
>
>     if (unlikely(num_descs > 1))
>
> to free the xsk_addrs structure. Since num_descs is exactly 1, does it sk=
ip
> the free, permanently leaking the xsk_tx_generic_cache object?
>
> I saw this issue is addressed later in the patch series (xsk: fix xsk_add=
rs
> slab leak on multi-buffer error path).

Yep, it is handled by the patch you said.

Thanks,
Jason

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260502200722.53=
960-1-kerneljasonxing@gmail.com?part=3D6
