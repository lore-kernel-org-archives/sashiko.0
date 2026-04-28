Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD9A282F12
	for <sashiko@lists.linux.dev>; Tue, 28 Apr 2026 09:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368610; cv=pass; b=iv8uh1nHX7bfQXxb0QEu2HQskUluDWoksdYH3ffiU5OLv1ypi1RaBsPQ0MpCk0/0928+V8/VHW8li7b7DrowGGlwGwUBhp5+IQHIVEOdRJbQKoRp+c2jZoCQtYo7DE2o02Wi4hhvihqoRutYOkA6yy0ruQPR8XXOF2KbblWFcvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368610; c=relaxed/simple;
	bh=bUKFL0mooMpwLXWWi23CY6Fe3FU71zNzPDR47LRd64g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DrjnMD++Q49iOEkG1Xn2ZFuOM1oSWA32RZOnUkcibwEkUusQzbDckUcA1upQbQ8croKP+p0WdDFlJDWnyg28LyVdq/mMlmXknmnzqvry/0wgI6ASdS2B0ClkxiGX63TPwwknAxiyZoVschTqkKyvNCP8c1QFrJB9dhfPdRm2794=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l07fW0Et; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l07fW0Et"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6788838d543so9610808a12.1
        for <sashiko@lists.linux.dev>; Tue, 28 Apr 2026 02:30:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777368605; cv=none;
        d=google.com; s=arc-20240605;
        b=hkahvTe7wJ91ICML/MxQuHb5zoNzvdJF12tK61mJ0ykFe4stqVJey5iDJAvvGYpeUn
         b1+0kh4oWB2sD7UkaCJoWt8V9O6hwkgKEjpR3HoW8EQ6vU21TQqxx0Q5aKtO9jkb4TA5
         5Fmba0Mu0iZSGsdExqnuipqZSNBFOIbm8An+W494tUDoXOoAbJ1NvaWH6MvhxTSHOfSg
         nACrcQeQv+pTqTjdt/VzXFzBCv/e4JudFqAh3Pg2lDXuEKSMeQHLY5aKqQKTKb32T+BB
         1LTYXtEXqWYdBLnUuvxcr09E7QNDFnxXiyWmGbARZ9syDWwp3PITnZDVDgFK91u752CL
         ks9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=padr2h2XEYJ5NHhm6V/pkf1/fnbasfn4pd6o7auN6mA=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=QOXpJUR3kX3zl9+m+h9TWaH+PInHE5H7JnRFPhgPCZmuNh9qMMse2jNRnSf+4JmXMC
         akfWJB0F+lEfy67T/CeYlJYLOhJT4m+4UGNXjQZ0ExkaQLPtcjVFKQRkYoSHvgXs7SzA
         T3XVGjgbAEv2ajrFfUz/20JSI3MOI9Y40ww6nhCGMttcHvBQ+Wi3kn/U0aiDTfY5Y/Jk
         NPEkKYPLbLoXisiodVK1Mg58NmFpT5GHqFRuYgdZQHiyec5YZZi5mUkpjQSDY2xKVLCV
         ug+YAC8GUFh+LQFs5bmzGO1c1J4vy+YTN4n4LSxzilzAFt05upttILKVwBZrOagloou7
         PlOQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777368605; x=1777973405; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=padr2h2XEYJ5NHhm6V/pkf1/fnbasfn4pd6o7auN6mA=;
        b=l07fW0EtKZTYMD0iT1R6Ekulu+zScXVhEXDRIoYPg1jzSSIRhxQWWIs2Uh6Trsd63/
         vDq/rL812SRiS2xcxnq5z1+OmFvkFnpw7VvwaRWqAK1W7Beo8mEn+TZi1UOXNWh8OdnI
         j6mmL8uwwMA0mgvcKycjDFRddx7fJMj0Vu7BAtPR40Q1MlE/PiGt5Pa5s7c+4doHoNIU
         Jr0ERPp/hn8LFmUn2+eFg5hAbHEtR1szvUTWSpi6w7Kxandf0PExXK/zfFIwkzyIUO2B
         BqRIiXAL2YBwcngH+7pOSbWa/EMYXSgwW9ZeSqP8EUjQ7cWL0fX+DFz+lkpLKs+WFxW7
         dDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368605; x=1777973405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=padr2h2XEYJ5NHhm6V/pkf1/fnbasfn4pd6o7auN6mA=;
        b=WqChBolXV+8aGtR7nj6Iy14F5rqrQOy1aW00sXPs2x8Fk8NoyPAOHOvW2jLxrUDuBd
         3TPy4WkLGCu4ovH1B0qmsJRGVFD3N/kYUe7URKtj8bsF0w/lOROK7ffsdshPCJP/KtGY
         QRt+VoNbbozyleOwtjF74lOdoqWcXP9E2KRQ+HNsnjMuFJVsBLa/exKKf5d9uTH0/XBF
         YiutNCHtR0LqsHcFRKh8GQtcNao04Y/GBcmlyA+KfwIVRjmggZlx1pueaeUe1ENrSdxk
         6S9EhGA+aJHzUM6yUU85mkIezEA1LNbgZaxoXoeC8BWy286gwzJnm0Rz19o7dd18M/eC
         +Pag==
X-Gm-Message-State: AOJu0Yyk2ZrqJl6CevtjEcCpMJltZqFfNXtkYfqR7SCt6PGPQ/Wlmb1i
	d4cpYRfNAgXIuapeTaNrBvdB93d3tQl/v8gxuBMog0ZCIiCQWrNaHYv2Z2OUUK2AZdTMUxhL2gf
	4/f+YUvxqNmRpVLBp89p7ghHVMkOkWdvFcgAc
X-Gm-Gg: AeBDieuEeRCVkzr0oW7JGjbDjcRuJvO/ZZPD0ENxZK9XFlOgTlOpIvJhRS4n60wDLlM
	kI0AFMNuXfltwouU8sKxX/m0tLyX9W1sKlmXZCAvpf4lK1DmiguGVgbyRE4upAColkiuuwakaWf
	TvNPVMwKDt25kotaR0AwZWsctYQbtZoMc/FXiAQzKxSwnXfXdmGiF0cOeT+Rj47phgq9Il0yBlo
	u9bP5ktaZEiQAGTPwQ4GLD3C9Oi8MNvV6owXCmwwxvV2sHV+NCi8pIZH+eb/V8F7T11Zs3OfTtR
	gVrILnu0QN6a8vPJ
X-Received: by 2002:a05:6402:505b:b0:671:a18b:32b8 with SMTP id
 4fb4d7f45d1cf-679bafe395amr1080072a12.0.1777368604754; Tue, 28 Apr 2026
 02:30:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260427232313.1582588-5-puranjay@kernel.org> <20260428003801.C1302C19425@smtp.kernel.org>
In-Reply-To: <20260428003801.C1302C19425@smtp.kernel.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Tue, 28 Apr 2026 10:29:53 +0100
X-Gm-Features: AVHnY4JIVqiwx6HnJAVFEI_4IC68ew2f0xo2HV5mBdY7wzDillWNC2ZErkFOiCc
Message-ID: <CANk7y0jACz-MiJLtF1HO69kXz7M9fRzqW4BcgnP004M=spATmA@mail.gmail.com>
Subject: Re: [PATCH bpf-next 4/7] selftests/bpf: Add XDP load-balancer common definitions
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 1:38=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 3 potential issue(s):
> - [Medium] Endianness bug and invalid arithmetic on network-order values =
in IP encapsulation helpers.
> - [Medium] Implicit compiler padding in shared BPF/userspace structures c=
auses cross-architecture ABI breakage.
> - [Low] Missing anonymous union for IPv4/IPv6 addresses in `struct real_d=
efinition`.
> --
>
> commit 27405cc11d849dd578c45222803d3bbd40b0e500
> Author: Puranjay Mohan <puranjay@kernel.org>
>
> selftests/bpf: Add XDP load-balancer common definitions
>
> This commit adds the shared header for the XDP load-balancer benchmark.
> It defines the data structures used by both the BPF program and userspace=
,
> along with encapsulation source-address helpers.
>
> > diff --git a/tools/testing/selftests/bpf/xdp_lb_bench_common.h b/tools/=
testing/selftests/bpf/xdp_lb_bench_common.h
> > new file mode 100644
> > index 000000000000..aed20a963701
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/xdp_lb_bench_common.h
>
> [ ... ]
>
> > +LB_INLINE __be32 create_encap_ipv4_src(__u16 port, __be32 src)
> > +{
> > +     __u32 ip_suffix =3D lb_htons(port);
> > +
> > +     ip_suffix <<=3D 16;
> > +     ip_suffix ^=3D src;
> > +     return (0xFFFF0000 & ip_suffix) | IPIP_V4_PREFIX;
> > +}
>
> Is it safe to perform bitwise operations directly on network-order values
> like this? Since lb_htons() returns a network-order port, left-shifting i=
t
> by 16 and masking with host-order constants like 0xFFFF0000 or combining
> it with IPIP_V4_PREFIX (4268) seems to assume a little-endian architectur=
e.
> Could this generate corrupted packet headers on big-endian systems?

It is safe, everything happens on the same host, this is a benchmark!

>
> > +
> > +LB_INLINE void create_encap_ipv6_src(__u16 port, __be32 src, __be32 *s=
addr)
> > +{
> > +     saddr[0] =3D IPIP_V6_PREFIX1;
> > +     saddr[1] =3D IPIP_V6_PREFIX2;
> > +     saddr[2] =3D IPIP_V6_PREFIX3;
> > +     saddr[3] =3D src ^ port;
> > +}
>
> Will saddr[0] evaluate to the correct prefix on all architectures? Becaus=
e
> IPIP_V6_PREFIX1 is defined as 1, it evaluates to 0100:: on little-endian
> but ::1 on big-endian.
>
> Also, is it intended to XOR the network-order __be32 src with the
> host-order __u16 port without a prior byte-order conversion?
>
> [ ... ]
>
> > +struct real_pos_lru {
> > +     __u32 pos;
> > +     __u64 atime;
> > +};
>
> Could this shared structure cause ABI breakage between 32-bit userspace
> and 64-bit BPF environments? In 64-bit environments, the compiler will
> insert 4 bytes of padding after pos, but 32-bit environments only require
> 4-byte alignment for __u64. Should an explicit padding field be added to
> ensure identical memory layout?
>
> > +
> > +struct real_definition {
> > +     __be32 dst;
> > +     __be32 dstv6[4];
> > +     __u8   flags;
> > +};
>
> This isn't a bug, but earlier structures like flow_key and vip_definition
> use an anonymous union to overlay their IPv4 and IPv6 addresses. Should
> dst and dstv6 be placed in a union here as well to save memory and
> maintain consistency?

No, some scenarios use both.

>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260427232313.15=
82588-1-puranjay@kernel.org?part=3D4
