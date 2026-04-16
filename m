Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A243793D0
	for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 05:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776318989; cv=pass; b=nTU8xENU6iebnTQVtHPF/WBRtdMxJdAkR9HVZPA1Xx7k7BM1QWgIqu9OIxXEhtqxZLhsgt/8ANIVDViTX8Fzk1WHdACYPB3nRyGPO+Tt+Ntei2zBPRA8LRazmiNI/swyFC+W6DLPIzTtoR0qBkbW+GO5vd9dCc5cfANjE4tseH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776318989; c=relaxed/simple;
	bh=W31fJ1JxJQYGjmSvX4KclqEKeZsNyAjbWE6Nax8Qe9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AiP0z3SiSNTp9K3SyfY6gwgwxTC8sZqBxMTYdEPbNwu7rFn7vbAIuafQMlyZE1OVW0UnLsD+52HYW0/ta3Hf1Aqe5synGdTPQUU5WnQOb9Fl8BwenwQfTHloFKAi8aSGagoRWVd/wvmnDZGeOcN1qE/uTyDrlu60A2PgjbD6rQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qwp52n4x; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qwp52n4x"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a2967e5de4so534344e87.3
        for <sashiko@lists.linux.dev>; Wed, 15 Apr 2026 22:56:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776318985; cv=none;
        d=google.com; s=arc-20240605;
        b=jJpKBHuGjaw0n5ihDOD9eBv6ug3L6cYH50UkYfEOYw7iGWAwJ/JGADzM1ueKvIlYe9
         zi6LFUh5TGidr36FnmvTkWtEvy/PNDiPMboVGVc8wtm1Jg/HsLIc8O5OUxGmgNIq+d6J
         sKjRvy1xA6oy0hbhI1zQNNzQIB5yRO00QEoC/p7U6IOyj7cd2SJSk9HFvaVUpPmCy4Kj
         ER2Yr9gHx0S0Irk0+MJG5drn7xB89QPg4R7bJKrS0p3pELIiYteBtyeg8JwPOQxirSmv
         /9FtFgSbvPALJBAFIuZlBQrqO4UgtXeNDvsZwAjVhHkyGvZLgC/oTdw0vSxjSqkg12NG
         i1jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gH6UMkImy0McJC94EHW1d9KPrIFruC8cngg/rsQ4PS8=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=kNkCn5wMaZY15j+nml6Vp4G3xPD8Qq8c3xVrBhhd6Zg1YAunB/NKgp44HyC+1A0IFV
         X3Y3O9127ffB0t2E7ZPyNVD6eU5Qhi34M4vIOX8cNt1ACpMb02w1GRall6LGKtrH21HI
         kP2YCA4y9o9pxhv1v1MQ+JzBBxD47OzB8tr5dIbZbOA8nE35hhBdWG9ooEk4p40LPpjq
         4iSjrV2qbA6Jo3c7uQBVwX7LnjQs6RaVBawkIRvhFHVaHEYvQCyXKFy7japiuMseSxhi
         31yRCgbm/by0YzoFxebH++tfSghXBkMcb+nd6XFO7TPPEUHnpV9MygTzN0Xpu5TWBUFM
         0FJw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776318985; x=1776923785; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gH6UMkImy0McJC94EHW1d9KPrIFruC8cngg/rsQ4PS8=;
        b=Qwp52n4xHcAIFeaUpW/xMsmo6C3MEE5VkD0ub8TCiS1UZbHqBVnoZVEoJi7PT6e3XP
         W5zKfErik0HuBwQELo+eY5obRHqpzQNDMXP5W7HtFvriltammtjxtDzXb1igMEmrTcju
         bSmrkaNUi9L2S4kjtOCi54l611B9coRhndZxFC9TzvAljRNs8tPjKmSFt0UqJy+MsrMQ
         h3bD8uygF+POYQ/o4VdeIuNL8cNOy37jY5BoDeLQ9dM3ggyQ2jq6QwznhEzdfqcnRvC8
         6UZFbNROPDK/rVVgebrke1kqgximl9fg7CN6FSgWEw9ej6QdRrEPsFdO2DTiVgvufjlo
         6ocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318985; x=1776923785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gH6UMkImy0McJC94EHW1d9KPrIFruC8cngg/rsQ4PS8=;
        b=DpAb8wHFQU86r58F3sk226IDQZx6xMFEtLe1zWZL2Rezwyh27MRTglOE549DXFeOps
         uzpQ9jPR9qZ2MSUJjs5d8UZBuelVfWMyAw5AOV+r+/nKRqRdLkIPTtg3tJls4nBm4vF4
         2jh3VIKbrP5sD5s+T2HXtLLxB2wZnuoRmUZ1a2f60NPZzPXSZKYf1q+s2Qc1wbHD02iJ
         ZPtnkHbk4Mc+p0Q/6lRBC4lETplAEJ+NTQN86wgeurXFeNkccJMjrdtHdin7n4UU60x+
         ceC6rO5CStPOnCQliptp6IKXwvWBMcLHYSJ/TeOSwIXpLNvkKCrY1EJmqvHyipHEqw8o
         e0ug==
X-Gm-Message-State: AOJu0Yw6zMzdYhd3CmZbRc3Yxh1uXSvhVJZI4+YSq9PIg/RRFiu233a+
	ovTTLUu6jTohstSKOTpjqHV+BF2MQNMQMyeyJgZbs6sb9+pisNZdNRtoVrboRLHjO9mIdtUgnWc
	q+BfesnogpysiAk9pEPufh1X3vdeUMGmZXWECINluAA==
X-Gm-Gg: AeBDieuGeCB72XCx9BySUHe93wwWdIAPFnplXlfEx11On3wO6renwpe6wywx2AAMqlV
	Y/GQQlBQCmWcvUKnVuOlRXc3h0tN0Uw/RRg9ih3i5kQVyffyQsh9o4voEfldMnD9nEW9BnqpQCY
	+Opov6QNpFFv3JK+hLaq63xI8V5pWRt7EHuJCa0rtVqRiz2zMMHJHmLb9XL7KpeaQ+qMTCe0d8n
	EogSX57t+srE/2vPFljd7r+M2NaL9IvQXnJFQemBgAzemGPpipr/epo5iOOqHxsC40o1+VVTUaW
	nnZew7pch2jbHtRkHe0=
X-Received: by 2002:a05:6512:3e20:b0:5a2:c914:8af7 with SMTP id
 2adb3069b0e04-5a3ef705974mr7717535e87.5.1776318984448; Wed, 15 Apr 2026
 22:56:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415082654.21026-8-kerneljasonxing@gmail.com> <20260415093301.799F2C19424@smtp.kernel.org>
In-Reply-To: <20260415093301.799F2C19424@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Thu, 16 Apr 2026 13:55:46 +0800
X-Gm-Features: AQROBzDPBGTwcTBz7FItba8D2EL1RQu15_e5rBvhpfDw5iG271Yd9yhDFbFOb8A
Message-ID: <CAL+tcoCVOX1oPY1S+QrHVMFYvXx+V2PYXq0Hykimt8YbnfPSMA@mail.gmail.com>
Subject: Re: [PATCH RFC net-next v4 07/14] xsk: try to skip validating skb
 list in xmit path
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 5:33=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 2 potential issue(s):
> - [Critical] Bypassing `validate_xmit_skb_list()` based on `NETIF_F_SG` s=
kips critical hardware capability checks, software fallbacks, and SKB initi=
alization, leading to kernel panics and corrupted packets.
> - [High] Breaking out of the transmit loop early leaves packets stuck in =
the TX ring indefinitely because the hardware doorbell is never flushed.
> --
>
> commit 7603ac608a36b8d39e026a60b567ea2b106617f0
> Author: Jason Xing <kernelxing@tencent.com>
>
> xsk: try to skip validating skb list in xmit path
>
> This patch attempts to optimize the XSK transmit path by skipping
> validate_xmit_skb_list() if the device supports Scatter-Gather,
> aiming to improve performance for drivers like ixgbe.
>
> > diff --git a/net/core/dev.c b/net/core/dev.c
> > index 99188353abec6..12643cbab6530 100644
> > --- a/net/core/dev.c
> > +++ b/net/core/dev.c
> [ ... ]
> > @@ -4878,15 +4879,17 @@ int xsk_direct_xmit_batch(struct xdp_sock *xs, =
struct net_device *dev)
> >       local_bh_disable();
> >       HARD_TX_LOCK(dev, txq, smp_processor_id());
> >       while ((skb =3D __skb_dequeue(send_queue)) !=3D NULL) {
> > -             struct sk_buff *orig_skb =3D skb;
> > -             bool again =3D false;
> > -
> > -             skb =3D validate_xmit_skb_list(skb, dev, &again);
> > -             if (skb !=3D orig_skb) {
> > -                     dev_core_stats_tx_dropped_inc(dev);
> > -                     kfree_skb_list(skb);
> > -                     ret =3D NET_XMIT_DROP;
> > -                     break;
> > +             if (unlikely(need_validate)) {
> > +                     struct sk_buff *orig_skb =3D skb;
> > +                     bool again =3D false;
> > +
> > +                     skb =3D validate_xmit_skb_list(skb, dev, &again);
>
> Does skipping validate_xmit_skb_list() based on NETIF_F_SG bypass necessa=
ry
> hardware capability checks and software fallbacks?
>
> validate_xmit_skb() performs dynamic feature verification via
> ndo_features_check(), transport header initialization via
> skb_set_transport_header(), and software checksum fallbacks via
> skb_csum_hwoffload_help().
>
> AF_XDP users can request TX checksum offload, setting skb->ip_summed to
> CHECKSUM_PARTIAL. By skipping validation solely because the device suppor=
ts
> Scatter-Gather, packets bypass skb_set_transport_header(), leaving
> skb->transport_header uninitialized.
>
> Could this cause drivers that use skb_transport_offset() to compute massi=
ve
> sizes, corrupting TX descriptors and potentially hanging the NIC?
>
> Additionally, if the device lacks NETIF_F_HW_CSUM, skipping
> skb_csum_hwoffload_help() sends CHECKSUM_PARTIAL to drivers unable to han=
dle
> it. Might this result in silent data corruption on the wire or driver cra=
shes?

Makes sense. I will exclude this metadata case (using csum) by adding
a new condition:
if (unlikely(need_validate || skb->ip_summed =3D=3D CHECKSUM_PARTIAL)) {

>
> > +                     if (skb !=3D orig_skb) {
> > +                             dev_core_stats_tx_dropped_inc(dev);
> > +                             kfree_skb_list(skb);
> > +                             ret =3D NET_XMIT_DROP;
> > +                             break;
>
> If this loop breaks early, does it leave packets stuck in the TX ring?
>
> While this behavior was introduced earlier in the series and not by this
> specific patch, the issue is present in this modified block.
>
> The batching logic calls netdev_start_xmit() with more =3D true for all p=
ackets
> except the last one in the queue.
>
> If the loop breaks early here due to a validate_xmit_skb_list() failure,
> the function returns without ever calling netdev_start_xmit() with
> more =3D false.
>
> Will this cause the driver to defer ringing the hardware TX doorbell,
> leaving previously submitted packets stranded in the TX ring and causing
> latency spikes or TX watchdog timeouts?

I answered in patch 6. No need to take action in this series unless
maintainers request me to do this first.

Thanks,
Jason

>
> > +                     }
> >               }
> >
> >               if (netif_xmit_frozen_or_drv_stopped(txq)) {
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260415082654.21=
026-1-kerneljasonxing@gmail.com?part=3D7
