Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96244385519
	for <sashiko@lists.linux.dev>; Sat,  2 May 2026 19:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777748689; cv=pass; b=ikYhv5slARYybI7/LR3w/kFo1InH8Co5zUykE99wB+Fwiifrik/K9s5GWQAhziFSbmoe2N7861rhKZ+gORI6BhiGYxbKlm+mtgrWLsUtfG35HisnYlPlyWS27s/geXAyZOcz5NcGmFM/A62/2Z1pucdGkZNm995B4qxPaCiJ8Vg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777748689; c=relaxed/simple;
	bh=JabJJvGOVACFB5Q05Gm+KwlOst4BTOxQbBgtxJNSxhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=djX5xcbtTr1ti+JF7+/Aof3hDG8B7nYJTLUhqpbJmYrJl2vlkwubZ+w+h8OrsBUhkADUCkgix4PQTB4NYNT3t8zkXyoLeFn+nbAVkxtSAaxukXhuGSdJ+A7JPfYlocoIAS+JW/b9enW+DZAcGedef23RA/imLAVZQxxkr+j+Ev8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ravq6yyT; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ravq6yyT"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59dcdf60427so2529143e87.3
        for <sashiko@lists.linux.dev>; Sat, 02 May 2026 12:04:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777748686; cv=none;
        d=google.com; s=arc-20240605;
        b=W7/rhydYb0YKXCfQjeOwhKhCRar6KNbRtMjEN3SFLGPVa5yWi79oYNpfoS2A8Wz8CJ
         Q9Hjk8XuOIL6WlPRPla4rHPxnk/w79JzBX8GJKglCUnmrlgqdu3Dvla3/ra2nQv7HSEM
         C38rOVWcRsGbpId85bZaFS4wnBsMPl+3D3atVVvcuzX6a4EgrZk+6Gi3TiuVtigkNO45
         l6m5aYw9zxvRFPYy30DX6BUr9mYP+CLaL1Jf1eFRgb9M+iCoRGmmfGpABC9iN+VB6a76
         7X30MDCHDNHP1IGA6hvDn4qVG8D55XK3WPSXJalPOVaf8kgkcTPz5+EQvh8qMQCuLVR9
         QQLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UJEn27V6OkYesuaUVcNgLy1Ezf+jQkNNDAQg+5dVDzg=;
        fh=vWikvm8CNHZiaF6N4Gb9HpRiBy6fZqLb0P11KrtreRg=;
        b=LHBF2GFXR2b8v+Dq8TSBMO9iVmdh5bmYdzy7YZYHmGKHOziaVEKtBn0wy9FzPBswpA
         r86te2+6YLBwClCCDd1uxKWBC59sC1WRIsAgrfWU0FSzwIv4RG/2xJqziXOmggP38Csv
         R3aFjwUnsmVXFjtCSyA6lvAdggt+qJ2JWUh5wVuCrc1WwCR49cIDsRkUa6mboEdAt3is
         3UmkeSWLNkV+2qjsZcw1NpiB1In5+0TcJ8ND7J5E6RuZ5Pr1U7A2X1f78OY4dVZfupBE
         fT1/xR+ERQsWH08yVWJaF5ZglTfthFlrJP6zSkzoMJcuADYlSdF3t1fSc5R7FdRXzu/U
         PD6A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777748686; x=1778353486; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJEn27V6OkYesuaUVcNgLy1Ezf+jQkNNDAQg+5dVDzg=;
        b=Ravq6yyTzKoVV54Lpkuc5KbMkwpe9AVN0TLvl0L7Y6YjfTJ4sA0xTVngd/c02os4/v
         ILS95+BkDMuEHCB8RxYx4NoQYcDANm0bFX7j6gs//P8fE17YlqjEOUw9A38yDye+kClz
         vqL9FmuanI3O2q3v5h8PURWYf5bY4q5yl/fmZkRqY7zU9Ovz3Mb3gMzRXDP/C6xc+Tbp
         zL1B4PdAMu/iLhcAQNZgedobN2PK3NKHw76y0K/GLuP5zxMQkANP1AWPVwEoDSkDi5aP
         VX9hGj3aeFGZG1WN8T2jt342nnLWi/12ssYneoJMCFkkAngcn3RQD5WOr/wGWk61L9pQ
         eDTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777748686; x=1778353486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UJEn27V6OkYesuaUVcNgLy1Ezf+jQkNNDAQg+5dVDzg=;
        b=Kv1qw9ZlIBaKInWO9EVy12fz5DSBSaRuKvvfxZIDBXFVJf0UtoXs+seWxGiA5S3J0q
         JW9F/4b56+WubfaNNbNQvIy9tNpF9d2kEu36DOstKixAHeY9NwFJnEDoix/pW/QDx+dC
         TXm+2wPTzCVUPKZOmSaUqZ6gYZV31aerqS+KAh8OCWfduqO/YyEUYhYNaguoITlCyhDK
         2InIXHxT1+5j6NxCrpGNl9/Og3XuZZJMZZX1hD+kT/bh571HSbWbUDqAHfBCdhniB76F
         mjDUFqGqyfN37oN8vErpiUrbnIKE3nUqy2zZYiiEH9vJPEmDtWhyyuWRmqsqsMi1kj4p
         mwCg==
X-Forwarded-Encrypted: i=1; AFNElJ9TnQO0ckmsQ7vimB1/MVuQjpvu6lz/r+ZN6E14HzCxZxLZvaqb7734w8ahR9vwlZwHiI3+sHeo@lists.linux.dev
X-Gm-Message-State: AOJu0YzUP2Q1bBtiy3nX5w2JK9DUK6bQG+3MKcorV7UHhHfBvDYlz+xN
	1Xsh0arvNq/Q4HZLuYrjxz4tZ6D3/KDmiNo6+n7rIZrGD0gPEMTDkECSLE6etXv3u9dt7zqxFlQ
	MKAvr9VROSruf0Fzp47rHGD3gvKGKf18=
X-Gm-Gg: AeBDiev9jlGsu2q4FzbPZFPCBjr7rasHZdiB2dnOR9chel+14E+sQqYhi7CU+T4Ehlt
	XM6RjdfQLwEY+cBEJfvxl32hfKZR4oD6OZJITqSxPDdNM5ceI8ee9vJwROG5odBgS43zwVP4Bh4
	aO9FK7pS2QAD4JFodCM3RJegraAHgmlkwKxsxFnUMNbh3a9as8IbVFVtAlgNlpkwPzoeL671SW/
	JdjNj3w3GCp9DIfw2Y6yYGyRpIF5il8L3MlN4wEJ49E592crnd0YP0d16Aa+tifZKSoS7vZ1poh
	ysTDjN/bmYftfyvm+nAJ2wXFAiitbjSnWd+jZWsTg5kj0L4D
X-Received: by 2002:a05:6512:31c9:b0:5a7:46f1:d96a with SMTP id
 2adb3069b0e04-5a862ec3439mr409761e87.13.1777748685442; Sat, 02 May 2026
 12:04:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260424053816.27965-2-kerneljasonxing@gmail.com>
 <20260425054032.28A27C2BCB2@smtp.kernel.org> <99816901-6026-49ec-9c20-b548ed362d11@redhat.com>
In-Reply-To: <99816901-6026-49ec-9c20-b548ed362d11@redhat.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Sat, 2 May 2026 22:04:06 +0300
X-Gm-Features: AVHnY4Lr-W5067WEgcSeNunEx2Jj-8DqWBliGYLjrFqxjd89zBTtZWswi8YtXcc
Message-ID: <CAL+tcoDcOz0q9MNNOfgYdt2XAKHAkjFW=r-seHifYqyMH3RV5g@mail.gmail.com>
Subject: Re: [PATCH net v4 1/8] xsk: reject sw-csum UMEM binding to
 IFF_TX_SKB_NO_LINEAR devices
To: Paolo Abeni <pabeni@redhat.com>
Cc: bpf@vger.kernel.org, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, sashiko@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 4:13=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 4/25/26 7:40 AM, sashiko-bot@kernel.org wrote:
> > Sashiko AI review found 1 potential issue(s):
> > - [High] The patch incompletely fixes the WARN_ON_ONCE in skb_checksum_=
help() triggered by pure-fragment SKBs. It successfully prevents the explic=
it fallback in xsk_skb_metadata() (which wedged the TX ring), but leaves th=
e implicit generic network stack fallback vulnerable. If a user sets XDP_TX=
MD_FLAGS_CHECKSUM on an IFF_TX_SKB_NO_LINEAR device and the hardware checks=
um offload is disabled at runtime (e.g., via `ethtool -K eth0 tx off`), the=
 core stack's validate_xmit_skb() takes over. Because NETIF_F_SG is allowed=
 to remain active even without checksum features, skb_needs_linearize() eva=
luates to false, leaving the SKB unlinearized. The SKB is then passed to sk=
b_csum_hwoffload_help() -> skb_checksum_help(), which hits the exact same W=
ARN_ON_ONCE(offset >=3D skb_headlen(skb)) because skb_headlen is 0.
> > --
> >
> > commit 86ab0a4900aa60bee0c3df7393a2846b5ff74ccb
> > Author: Jason Xing <kerneljasonxing@gmail.com>
> >
> > xsk: reject sw-csum UMEM binding to IFF_TX_SKB_NO_LINEAR devices
> >
> > This commit attempts to fix a warning triggered in skb_checksum_help()
> > by AF_XDP pure-fragment SKBs. It rejects sw-csum UMEM binding for
> > drivers advertising IFF_TX_SKB_NO_LINEAR at setup time.
> >
> > Closes: https://lore.kernel.org/all/20260419045822.843BFC2BCAF@smtp.ker=
nel.org/#t
> > Fixes: 30c3055f9c0d ("xsk: wrap generic metadata handling onto separate=
 function")
> > Acked-by: Stanislav Fomichev <sdf@fomichev.me>
> > Signed-off-by: Jason Xing <kernelxing@tencent.com>
> >
> >> diff --git a/net/xdp/xsk_buff_pool.c b/net/xdp/xsk_buff_pool.c
> >> index cd7bc50872f6b5..d981cfdd853578 100644
> >> --- a/net/xdp/xsk_buff_pool.c
> >> +++ b/net/xdp/xsk_buff_pool.c
> >> @@ -175,6 +175,9 @@ int xp_assign_dev(struct xsk_buff_pool *pool,
> >>      if (force_zc && force_copy)
> >>              return -EINVAL;
> >>
> >> +    if (pool->tx_sw_csum && (netdev->priv_flags & IFF_TX_SKB_NO_LINEA=
R))
> >> +            return -EOPNOTSUPP;
> >> +
> >
> > Does this still leave a path for the warning in skb_checksum_help() to
> > trigger if hardware checksum offloading is disabled at runtime?
> >
> > If a user sets XDP_TXMD_FLAGS_CHECKSUM on an IFF_TX_SKB_NO_LINEAR devic=
e,
> > and hardware checksum offload is later disabled (e.g., via ethtool -K
> > eth0 tx off), the core stack's validate_xmit_skb() will take over.
> >
> > Because NETIF_F_SG can remain active even without checksum features,
> > skb_needs_linearize() evaluates to false, leaving the SKB unlinearized.
> >
> > The SKB is then passed to skb_csum_hwoffload_help() which falls back to
> > skb_checksum_help(). Since the pure-fragment SKB still has a headlen of=
 0,
> > won't this hit the exact same WARN_ON_ONCE(offset >=3D skb_headlen(skb)=
)
> > warning?
>
> My take here is the issue describe above should be handled separately.
> (And on top of my head I don't see an easy way to address it short of an
> additional check in the tx path, which I think we want to avoid).

Agreed. I've already reworded the commit message locally :)

Thanks,
Jason
