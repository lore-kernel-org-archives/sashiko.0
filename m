Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74E739B498
	for <sashiko@lists.linux.dev>; Tue, 28 Apr 2026 09:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368654; cv=pass; b=UqqOS/nB5XB3PLjSrf152kfGEkUyCIYMrD26lSQvgTpRZ8MCWANDHB38bWRy2EQQHyvxl20C8NI7Ed6sZlTVZv4BwNGOXRYKbf+y4QjSr/0h/Nf/92BrfJgmUY4siRHMc9gutPmIFobEUDXAXEffZT/f2/LyrxJ/MSBubja2MSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368654; c=relaxed/simple;
	bh=hRPWI01LczqM4hpt5WQDV7pY2kzEn4X/KE1AsQfA4BY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPiIadcumpZr2TxooAOKo3N681xztXYb6cjOxXsLld0ctgh9fb30YunxbgRtStOc/N0aw3U9CgFy0ULulVq5yVRqFl/sYjJ5Q0NDbVEGdpAhLvGFhyBU32t38VtQn41Yn94RUf2k2Q5wf1Z/XxfDGdm6ipDGoaJiso+MZ4/avVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iDzFll7+; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDzFll7+"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6729c6f0ca7so13666194a12.0
        for <sashiko@lists.linux.dev>; Tue, 28 Apr 2026 02:30:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777368651; cv=none;
        d=google.com; s=arc-20240605;
        b=BObirnGrq4Fp3IP98pWzkhBHzcfKc1UXMBJRPbNllK1+yBxSojb1I4+HoF5QGDRtzw
         o8sW3FxqXZZwMbMxV9/oxQj9HikByJH5YLkVI1iU4dItA2Q2wGOAHRzR+Ch7Fb0mZ8OH
         5z1pZOqJsw+yVQCPNrNND4a53pbQh54gtNTB57Ylv1RXUgHSjKUzN2etZpPiCNLcfCaj
         1B1v6mTeKnTeDbmdErSmMKgN8PLHW6SVtGCcEYyexGDQL7R+hscm4QmTDAt1BpR70oKX
         Qi4HbBhQt8F7cH6HUBMUH/Bh4tXHtVOsohFe8k5rqsBL9x+vaztKJB0apweQIICXWpcA
         +CJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5QoxiNwVDl7IQJDnKzxsDGzAeRCuBbcVKoGRhpQQSSE=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=V4QGrQwN62knF73gYcxMDenzTG4zSgk/olfeN2SMkxUxWXdJQiN4FgusrrUO4JL9cz
         QWw6uPAj9Em8ZPunKDdMYk00iXvcGwJPPCocHZOnqgpt1tkUqZygKaJYTQ2R+9CQFyFE
         Ob6NIIWyx08etMBYbimyBiu7nJID/0zsfFtywAmsyJsUmkydWfbGpMThhXGPjoD11G41
         vaMn3pvq2GCU6K/bMqtoOXl5ePdhH01oepTJnCifVjfjHKGcjjhEg1SDJQvpsMoJ6nQq
         aIjEUiZJhBzoL2IhmfWgGFq6BDNR9SMQGCIlk/t6IKNhkCeBr00WjCfPG0HEWcfvcDfK
         ikGA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777368651; x=1777973451; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5QoxiNwVDl7IQJDnKzxsDGzAeRCuBbcVKoGRhpQQSSE=;
        b=iDzFll7+fJmiEcMVb2LEw0gWVpNR58UH85bay2nB6OXKM9l8w6rB5Sj8Lx2frRnzOM
         D+E5Rp2vpJdszgImvqc253ajQFJZhBe1AafJXXegTfNxlbSBPFcq2MC6OBr1Osxosjpa
         j+/kUx8L6lN3KgRCBKoB7z4zRKilIDKpp0Ni9NHKsuFuDZmtfq/MHp4OkpPXQnFfPfy5
         3tdwadxNxH6wPUp4R+Qi54W7smKTzm3y6BYT/vbQig5+Dm+PFVk9QCCSOpdWov79wtM8
         UBJ5ehL5hzs/gzY2MQnCMPC6zfRBhKs9ezllXczcuFu341OHTChIAd5whkMQoi+Um5QL
         JUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368651; x=1777973451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5QoxiNwVDl7IQJDnKzxsDGzAeRCuBbcVKoGRhpQQSSE=;
        b=QEdqRiyepF8RwT7SMFJzoRwUr5KvcbN1gGa4Iek+yBCvja5FCBTh3ABfH4oD/+56ZI
         heTKmcrV+7q54o0DYx0q4bu4y8kxX09WrnqS5iDJWjr6S1E6ZIvEaQtQrtDuMO+wwp/Y
         /+jtIxyfKecNQDzsmzMc6KYPXmfW0yzSWGH7QZJxuzHrOEmMhb5hJy7DRpOzlje4DRla
         xboobbS1dJ25Bvj9+5V5eOrNQ2qLNzYVpFf8KDuq+ZOHVnbkhkoPcqLw5jR9j8KlK38n
         OHbT3w0070ANUbn9STmM0VRqpklLh8kpnrENSZHtR2Uv5NxXbIrhNoU+gabLIp0Xut/8
         DbcA==
X-Gm-Message-State: AOJu0YwhjT2nkzA8lI3BeNYLrbPk0614LFjzDTiV8tYR5yyL53p0bVbr
	6+c8JN1FdCEy5nqtJj1bzRGpC5n8UoNFFQrS6U+yAKZzuZh8dxMtwfn2cg0RxXvGm/yFLrE1b69
	3V0407OuZKIuluSniLqRQPyqtBSzBLlnHfeA9Xlw=
X-Gm-Gg: AeBDies+CPDKjWG7700q1ll05DSFch+Z3FK0ebnAvCjl56JQzGv3NKOCa2ksnLKa880
	YrZ3m1xJBNxewqmTYJMzYSzGG9J9sjafIyQ+2K+OSg4LTMk6tZcwrXW/z7ndM69Mz2aL+RKI/Dn
	9pxq8940pM6gEh50BxckUVt+rviW7031E150GmOoldLUy/SYfSppYtNOYzvn37gcwXXg/8p+FgT
	94JurAPYDq3xeNsO2B7AiwFudZ2iU/JQM315DUFX6fSmB8PAwOkQuLRo364+c3OrYuNA/oH3gO7
	ARqOYZEff2I9xIh8
X-Received: by 2002:a05:6402:324e:b0:66f:9f63:e537 with SMTP id
 4fb4d7f45d1cf-679bb09a4a0mr768704a12.19.1777368650261; Tue, 28 Apr 2026
 02:30:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260427232313.1582588-6-puranjay@kernel.org> <20260428010537.21D54C2BCB4@smtp.kernel.org>
In-Reply-To: <20260428010537.21D54C2BCB4@smtp.kernel.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Tue, 28 Apr 2026 10:30:38 +0100
X-Gm-Features: AVHnY4KE5HUzAET2yt59SOTeeiiNhF7ATWdseO9Oh0RhsOO7380gLx6KyotcVcw
Message-ID: <CANk7y0gRdXnn55RHjLgsGiR8gMUoiHxH6czdVwj-VNfZo-LArQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 5/7] selftests/bpf: Add XDP load-balancer BPF program
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 2:05=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 1 potential issue(s):
> - [Medium] The `cold_lru` logic inside the benchmark loop's `reset` block=
 toggles the IP source address back and forth, breaking the benchmark's LRU=
 cache miss measurement.
> --
>
> commit 295ed705f4fdd57c01615b43803c47313840bbf1
> Author: Puranjay Mohan <puranjay@kernel.org>
>
> selftests/bpf: Add XDP load-balancer BPF program
>
> Add the BPF datapath for the XDP load-balancer benchmark, a
> simplified L4 load-balancer inspired by katran.
>
> > diff --git a/tools/testing/selftests/bpf/progs/xdp_lb_bench.c b/tools/t=
esting/selftests/bpf/progs/xdp_lb_bench.c
> > new file mode 100644
> > index 000000000000..b9fd848c035d
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/progs/xdp_lb_bench.c
> [ ... ]
> > +SEC("xdp")
> > +int xdp_lb_bench(struct xdp_md *xdp)
> > +{
> [ ... ]
> > +     if (cold_lru) {
> > +             __u32 *saddr =3D data + saddr_off;
> > +
> > +             batch_gen++;
> > +             batch_hash =3D (batch_gen ^ bpf_get_smp_processor_id()) *=
 KNUTH_HASH_MULT;
> > +             if ((void *)(saddr + 1) <=3D data_end)
> > +                     *saddr ^=3D batch_hash;
> > +     }
> > +
> > +     return BENCH_BPF_LOOP(
> > +             process_packet(xdp),
> > +             ({
> > +                     if (__bench_result =3D=3D XDP_TX) {
> > +                             if (strip_encap(xdp, &saved_eth))
> > +                                     return XDP_DROP;
> > +                             if (rand_state)
> > +                                     randomize_src(xdp, saddr_off, &ra=
nd_state);
> > +                     }
> > +                     if (cold_lru) {
> > +                             void *d =3D (void *)(long)xdp->data;
> > +                             void *de =3D (void *)(long)xdp->data_end;
> > +                             __u32 *__sa =3D d + saddr_off;
> > +
> > +                             if ((void *)(__sa + 1) <=3D de)
> > +                                     *__sa ^=3D batch_hash;
>
> Does this code toggle the source IP back and forth on alternating iterati=
ons?
>
> Because batch_hash is computed outside the loop and remains constant, XOR=
ing
> the source IP on every reset block will cause it to alternate between two
> values.
>
> Won't this allow the LRU cache to easily cache both addresses, leading to=
 a
> near 100% cache hit rate and defeating the purpose of measuring cold_lru =
cache
> misses?

All cold_lru scenarios also have flow_mask set, which means
randomize_src() runs in the reset block on every iteration, producing
a different source IP each time via an xorshift PRNG. The cold_lru XOR
is an additional per-batch perturbation, not the sole source of flow
diversity. With flow_mask =3D 0xFFFFFF (16M flow space) and a 100K LRU,
most iterations genuinely miss.
