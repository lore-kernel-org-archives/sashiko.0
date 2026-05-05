Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705163C1994
	for <sashiko@lists.linux.dev>; Tue,  5 May 2026 19:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778008770; cv=pass; b=M1HcS+pGmMrp6elXMQKHGMTsXyB3HC+T+xHUKRF3s0Un33jVSIkJ91rJ0oBWDpP2UmjZY8XXotSWrijEEeYy3EUggFvLg8WQBI77RtaXOVacMSdVPI6bvHmOub+UYl0etJcW00QoFUV4vL+BuNc4nXiaEP/hV1xczUyF8wwEJro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778008770; c=relaxed/simple;
	bh=OJ/azNTybqYl8mOJ31pbz8g2rYikwtmrBFK0JFJNo5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vu1hfMzAb7YUWHwNvt2j6ypQTd0iuodDh54wjZh5+yxK0Q8CKX+VAaeVzI0EEwnEAex4W54u8rUOUHOMFGsq7UUs73BZ+8EROJZDOd2BFLqGMtYHnaD7JISvEZr63i3HSkZLUjHSq5tVSZEz2V92LHLktiQV4qat6qM/n7+Dh7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BC4JQYQ1; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BC4JQYQ1"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-393c40246afso1909951fa.1
        for <sashiko@lists.linux.dev>; Tue, 05 May 2026 12:19:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778008766; cv=none;
        d=google.com; s=arc-20240605;
        b=hYwtjDMZakW+vqWz4HCLnWEj0MimHYzgdXNm/WJz3/xTJ9k3mORT+L7Ft/yO/Nuj4B
         xdchRYUut1jQ2rU9B9UMx0WGIq2KXxlkccxsvUJLlNg/Fto0Qc9Su2nrNW9+oYPG7He9
         mwve/UQEf/qgkshtjnuwKAqdvs7sSkA8PWcuerLVn5NajuFOQ/CJAcd4OHMCU0hMWutY
         HhJniFenvY3O8ttWlD1P/1MGNqUyPFtBoFPzp+DZlaGZBQrnS7aVDqKg833KaeUlXASE
         fgnbDgKZCJTDeaxwkF3xQDyZAwSWQwASArVv5FYiuhKxIIMURsCM4zmHfs/yZFyQEAay
         pE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J2hInhsFpGHxbrTs3e35Gl5nCTj5ZNbvxNvr+9nvuEc=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=EQsmxmFA2+9vDMwNZnGOFyHTzjfZTIdinSdWPZpc2p2QHU9afmXOGlk/MoJmLT60KT
         PKSWzBs5i7qKk0BnUhISCQ8ulqps+iAGHkI2C0suD4VtTWKnuk+0D42R84SeuoMtFY0C
         1nF6uInVgItn9opVxqx5fNuOJG8vAf0mQIYTkymCNpXK5KS1OTNuWyvqaLx5BImGS1kF
         1S07HWeS3tXhb7pcmRwEaLZOYNafJFzWCjOnv4OuwadEMeTQXFUyqHH4IUYh83eIdh9k
         IAk2FGaawjsvBzzcut1tHphIBVFRUXbDBF7k9upj5QmWwdhjgmqTWKJMIhhKjzdwmqWm
         fV/w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778008766; x=1778613566; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2hInhsFpGHxbrTs3e35Gl5nCTj5ZNbvxNvr+9nvuEc=;
        b=BC4JQYQ18eugPJg/C45vE7XPl13IIOrq3FC6EiyT6k+k5w77GWeL5gxAsg4+HUILiZ
         toiIdEZLoaWO/96pVfDnaYMCyN9jdLdzFsmIowzrFWSAOHIK3rl8QA6sHREWtckKPL2W
         oQ5XT9Ig5EFZMxmC6cdqpKan/yxLJGZOUZsrCRZt06TmA2khRt7E7q9/qt6RKYPFVsmE
         lSjdrDQhKf3iDC4rhMCmACAOeOmqLIVVjmAmIZMIZetu7S+JfWnTw8LsDpr5ody6ztxM
         EkDWNkl3Y0Qr2qWbiXobhfL8hmgjS73Xgdga4I+soZbIDIQZdts6iFJWOybiTGMk2E58
         xE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778008766; x=1778613566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J2hInhsFpGHxbrTs3e35Gl5nCTj5ZNbvxNvr+9nvuEc=;
        b=gezhJQcrQIwHcWefNbLpYIwGzsNpsRalYExM9K/UNz2dhMgs6F01lKcbzEuNxfFhpx
         OWtINeP/lge/Yi8vZIXa+abuPc6ZbNhx4bc66a1g5UoNlW61nHsyWsMJWG4qeyPks6fH
         hjOFR26qJ2YQtVT2cwLdQ6mxvLYBXuYTB/vLhXRnOwxmWS842rFRW9Qw0s0lXuzvtgLr
         29RblD24YJroyp9IB4SjwuVpe0r+ga61PWqPtNcluZVs8k/aU8r3lq2S4JMfGkvnO4sN
         WiuhVTtfR3H9HNjF49EgCGBSIp0mIuI/6CGJ/FsW1JxseIv7gLTcEvfVrdkGV6Wqa5s+
         fRvw==
X-Gm-Message-State: AOJu0YyFED300+eSIKzGBLYrGG6EiosjNsBxzefgpu5oBfTRU72Ufejn
	XKZKgrOOfZF+iAntiEiTHFs+q0ks+/vAh1yvc8w+SNAL7li+wpvqfz38lepibCj2b87O7TVTeKu
	eI6BpaujXPZZYrWBw4Nt2CuqajgHRNAloFzla
X-Gm-Gg: AeBDiesYK6869AG24/awU8WtKIJ/7XiwJux2sHIf7nkxQdm5UNNwCi4ir2yZWiGrF2n
	UF5nP1QAwy50zDgVEWMbhQJvuwq5uOf+sbqfr21f6mxcgeBhV+6CHbK9kJs+1Ag1QJT4Po4L/4J
	hnQtK49NKDdOQ+kjYP4+c85ewYZkh6mEwywTHSSeMrGUz41GooLrmXH6++kahhpwSy7BUllxfxw
	Iuj5Ac5mdYhPazgiJNirTgk6L2UsBlYVdY7Z56YeD4pb7+UdN3al9+S6YbghOZFi/pqXF5l/cTC
	Q/h7KRD8IDhA3c1O6bY2UqbyXouHhTPmjAt+RceAM5L23zB6
X-Received: by 2002:a05:6512:124c:b0:5a8:7f4c:8a22 with SMTP id
 2adb3069b0e04-5a887cdf0a2mr16191e87.20.1778008765335; Tue, 05 May 2026
 12:19:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260502200722.53960-2-kerneljasonxing@gmail.com> <20260503200923.7665EC2BCB4@smtp.kernel.org>
In-Reply-To: <20260503200923.7665EC2BCB4@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Tue, 5 May 2026 22:18:45 +0300
X-Gm-Features: AVHnY4Izr1VDOtLcrgCkeA9mksANhIATUkN7CcbB1jdPUEjGd4YL-TtrrNIfxM0
Message-ID: <CAL+tcoD09aryHzbUTwDMBP1u2fiCDO3MWo3fvsVSK58DG0TvNQ@mail.gmail.com>
Subject: Re: [PATCH net v5 1/8] xsk: reject sw-csum UMEM binding to
 IFF_TX_SKB_NO_LINEAR devices
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 3, 2026 at 11:09=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Unconditional rejection of `XDP_UMEM_TX_SW_CSUM` breaks valid na=
tive zero-copy configurations.
> - [High] The root cause of the 'wedged TX ring' remains unaddressed, allo=
wing trivial userspace triggers.
> --
>
> commit a1862dee263d88bc3b6ca0898f858a88e2e37fce
> Author: Jason Xing <kerneljasonxing@gmail.com>
>
> xsk: reject sw-csum UMEM binding to IFF_TX_SKB_NO_LINEAR devices
>
> This commit attempts to prevent silent per-packet failures and wedged TX
> rings when using sw-csum with drivers advertising IFF_TX_SKB_NO_LINEAR.
> It does so by rejecting the bind operation with -EOPNOTSUPP during setup.
>
> Closes: https://lore.kernel.org/all/20260419045822.843BFC2BCAF@smtp.kerne=
l.org/#t
> Fixes: 30c3055f9c0d ("xsk: wrap generic metadata handling onto separate f=
unction")
> Acked-by: Stanislav Fomichev <sdf@fomichev.me>
> Signed-off-by: Jason Xing <kernelxing@tencent.com>
>
> > Without the patch, every descriptor carrying 'XDP_TX_METADATA |
> > XDP_TXMD_FLAGS_CHECKSUM' produces:
> > 1) a WARN_ONCE "offset (N) >=3D skb_headlen() (0)" from skb_checksum_he=
lp(),
> > 2) sendmsg() returning -EINVAL without consuming the descriptor
> >    (invalid_descs is not incremented),
> > 3) a wedged TX ring: __xsk_generic_xmit() does not advance the
> >     consumer on non-EOVERFLOW errors, so the next sendmsg() re-reads
> >     the same descriptor and re-hits the same WARN until the socket
> >     is closed.
>
> Does this completely resolve the wedged TX ring issue? While this patch
> prevents skb_checksum_help() from returning -EINVAL, xsk_skb_metadata()
> can still return -EINVAL for other reasons, such as an out-of-bounds
> csum_start or csum_offset provided by userspace.
>
> If xsk_build_skb() returns -EINVAL, wouldn't __xsk_generic_xmit() still
> evaluate if (err !=3D -EOVERFLOW) goto out; and break its loop without
> consuming the descriptor? Might the generic transmit path need to be
> updated to consume the descriptor and drop the packet on terminal errors
> like -EINVAL to fully prevent userspace from wedging the ring?

I believe we've 'discussed' this before. This is a fresh new and
pre-existing bug (happending) unrelated to this one. A few days ago,
thanks to your reminder, it was put on my to-do list.

>
> > diff --git a/net/xdp/xsk_buff_pool.c b/net/xdp/xsk_buff_pool.c
> > index cd7bc50872f6..d981cfdd8535 100644
> > --- a/net/xdp/xsk_buff_pool.c
> > +++ b/net/xdp/xsk_buff_pool.c
> > @@ -175,6 +175,9 @@ int xp_assign_dev(struct xsk_buff_pool *pool,
> >       if (force_zc && force_copy)
> >               return -EINVAL;
> >
> > +     if (pool->tx_sw_csum && (netdev->priv_flags & IFF_TX_SKB_NO_LINEA=
R))
> > +             return -EOPNOTSUPP;
> > +
>
> Will this check unconditionally reject valid native zero-copy configurati=
ons?
>
> In native zero-copy mode (when force_zc is set), the transmission path
> bypasses __xsk_generic_xmit() entirely and processes descriptors natively=
,
> meaning it does not use xsk_build_skb_zerocopy() or invoke
> skb_checksum_help().
>
> If a UMEM legitimately has the XDP_UMEM_TX_SW_CSUM flag set (for example,
> when shared across multiple devices), it appears this will now return
> -EOPNOTSUPP. Should this check be restricted to only apply when using the
> generic datapath?

The same topic we 'discussed' before. No one is using the software
checksum feature on zerocopy mode. People will be warned because of
wrong usage and then adjust their own codes correspondingly.

Thanks,
Jason

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260502200722.53=
960-1-kerneljasonxing@gmail.com?part=3D1
