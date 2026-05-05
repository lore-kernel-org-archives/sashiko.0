Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869813BD64A
	for <sashiko@lists.linux.dev>; Tue,  5 May 2026 05:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777959440; cv=pass; b=C6O6jVz81pyjsf+XTDzPg1zcX6exUYfyhxzTgWFUXTrtTFiHr1crkmY1HFOJ3P6TkIWTdXDTOptgkiZvpoQx0YmqXJLnExKlIClb3FT83VflGEhpmdrG9zMKVZHw3/m9pD9NYrIW2HyWaSxiHz86PyQPIHVW+FacYZnu+uZDCKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777959440; c=relaxed/simple;
	bh=trL7gv/06X0DWcZrzv48qbCKgjJgo5n7C3gZtkyEUC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=usHxSbKg7Zhf4hnumNvrYcPy7bJMqTuHGsygeX5ihu1/IOxodWDsY4tzt859GeNbhwLFlxJwpH/TEMNvQRFpvbuSxo8yHUgC5mhzSxqsXupckJMg/IbHYZnBJutbVvrS1Vf8E7mKABih4bLhaF4k1hr1w4GXWHeRtiEtZlFTsMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZtnYJNFJ; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZtnYJNFJ"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-130c653cce4so110299c88.1
        for <sashiko@lists.linux.dev>; Mon, 04 May 2026 22:37:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777959438; cv=none;
        d=google.com; s=arc-20240605;
        b=im02tk6fdCH9B4Lh1gwfJfV64Hw4r4+Gx6Ua8CMjLZ1RzhoHLjEDTBl155Hpe6YLzm
         bwkfd1LfrX9R1xLlx5ZR84G3bj+X4cn9T09C1HCoEMlwOwGj92K1ut8+idNRypePeahw
         McfTZ5AkiQPalErgtVc40ENAGgioK5N7uIKJ6TuhEP0XSv32Dy88A52elkqlZ4Z6ylF7
         bxdPvp4DmBJGIOmOTRd39daYjJNIW+YdzqUi2YBaHDQyQWu02Nxt/DcbWnS/vhBKu/xq
         fLHvvBGqlK0vlr4qgujaN9QT9wM8b8YVa44vbP4sdzAB+FuE9//EGpxsTTWQiv1xvVuu
         U3iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1TR/1cP9UKMBNleo9JuFC/3AaaYuVoaEqpxuVZ8Zj/8=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=i/vcxCsaXdZCJSHqfjspuQpEyIHYsOHcU7fdbyZN48iLkeIWxGBUeaslZfNtkwhdaf
         3Tk4MQ4OfOP5YRDqVTcNcI6BG3kaR9Vb+Yn0cmzwUVmIlEY45/d+c6Ph/LvN0EIBEfi8
         7gmU3bkg4fXO1jB0sSQJvAZCL4MXna0jTThFSAO1NRJ4Oj7Amdmc/BmgoYLgVTdgP7ZM
         MIIkDQpxZ/SqOu6KTGM0suuQzXKfzOZCyaLSW+5JatH/IuuhBPA8EjZNgRWEbuNeStgF
         2wvichqFMm0c8rkOncynh8FVc90Q2Oz7VRlxlqoIGaycPJpyjoyEqjlf8Y02OhVmmxPB
         VClg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777959438; x=1778564238; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TR/1cP9UKMBNleo9JuFC/3AaaYuVoaEqpxuVZ8Zj/8=;
        b=ZtnYJNFJeLxspoU17Ma9CcqpLhQcl+UC3PhjMRKfq9TqqZPsymJIc8phSCe02RHXlg
         5wK43diNQyOvO+89ZuocZxjISqTMcf0I4sbJ0E9K0NsCRJmLjV3z8Q24bF272AtnUlxo
         2GUzUrG+++bnBpqQYRThxvCb43tcW79UGvyTIKEQFuWMj1TdrdeWxIZTa6k9VarmzZjX
         obe6EFRvBn1EqotARTJzRkZz6lCqsA2rQczkeWE4HfFpyHi5uGYdzajm+LTT1moTd7Ch
         q2dThecB0hqHMEyQ27pCLPzbFPFpBFrVsYVWNHz6P8fInleusVz2f8ZjK95RQ2MtvHOA
         fp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777959438; x=1778564238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1TR/1cP9UKMBNleo9JuFC/3AaaYuVoaEqpxuVZ8Zj/8=;
        b=DexsF8O8ND+jOUjGIJTY2N2jcV102fO3mNcb6bz9rAGc/Uh6qbzwv2zek070kOjUPi
         m2FwcEPlEJKtMg6jZQtKFC2uuB3VKJoQnK41MlqxQ6FhKfk+wdjPAumyeIFySH07xqfU
         X8ReTCZKjzalmki750ApE8x2hTPtq48w4xaYeM75gmSF9RuI7Q7wF7i0SMtlJFi1h+gp
         S0YSDk4PTQMk20wVs5FetUE/x/j+90OyDLUjTFl4b2zroKBTRr2GXqYvfMy0AmkRuT53
         IgAXHDwAWMmJ20ULPTIUPS8+cbWdzn0UubcJe7mUtMgZ/4M4MtQ7XwPZOSZ6MfJopB0c
         TWoA==
X-Gm-Message-State: AOJu0YxV7qVILdYRVNUNbwg7IPFQRU/VCOmDMPYAUgm7I6fp1W+cVWHp
	ZHrhXgNQtkJJA3hxbgPYWqPYLq1zWVPhYOp/MxpjHpDjfrY8aH8bu43dmIvTOcqmy2GKinnKHSf
	1siNLtI72hj7wS2iqlQtr8Ee+DvD4HbFtBVLPYP6EJRW6fXY7lXVbQ3fJ
X-Gm-Gg: AeBDiev8iooN50PYhK+QlZNFfUq+KIttz78jpm/s/0Xu+bXw1kCtI9z6SS4Xt+tONPb
	CPym7b5LODIF3WGuCeBICblJihdAGV1kGNT542k+Q4wE2Vldpj7fo3RvoMuzDQupVoH1C9rijwd
	tLX70mZuVvzyum2x0aWkjcXj3SY5nuXfJIbGqgpiXTqtsFDYUa5sr7UBpWr25DuP2d8qCPyApf8
	izhcuGcNDq0KLrtLRylDkoDVkLcX+WMoqFigeu7tYMpcfRmQQ6Bq9QcoW+f42CC2G5rDoLG/J3w
	+7MXd5iiQ7K/ra28gx8Wi29Nh0NqQeEhuGR1OOoZwKwE4leW6pVVtI5bRBAi1j9Fwt8TqqFbyra
	1v6FG3/Wazvh5UbAU+gkAxKVFS1J96la1sN2p5uI4w9zS3zKl6s2OXRqfFHApVuZ7v9KuGTkz4w
	==
X-Received: by 2002:a05:7022:5f12:b0:130:9f2d:ff99 with SMTP id
 a92af1059eb24-1309f2e02bemr1360811c88.20.1777959437563; Mon, 04 May 2026
 22:37:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260504210610.180150-2-kuniyu@google.com> <20260505041432.BD566C2BCB4@smtp.kernel.org>
In-Reply-To: <20260505041432.BD566C2BCB4@smtp.kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 4 May 2026 22:37:06 -0700
X-Gm-Features: AVHnY4Le8fD02CVorGOIqsvyJ6pRtpfz-lTFevvtgy2GYkjbLMI67HlAkB7mgWY
Message-ID: <CAAVpQUCdncvMnuuUfSRMkgE=YO=kF-6nP7MFEf0j6VrhSxFmuw@mail.gmail.com>
Subject: Re: [PATCH v2 bpf 1/6] bpf: tcp: Fix type confusion in bpf_tcp_sock().
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2026 at 9:14=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] The OpenVPN (ovpn) driver contains a critical type confusion=
 vulnerability due to insufficient socket type checking, leading to out-of-=
bounds slab writes.
> --
>
> commit 3e93f247feecc891b15b8d713331586af9371dfd
> Author: Kuniyuki Iwashima <kuniyu@google.com>
>
> bpf: tcp: Fix type confusion in bpf_tcp_sock().
>
> This commit fixes an out-of-bounds slab access bug in BPF by using sk_is_=
tcp()
> instead of just checking sk_protocol for IPPROTO_TCP. This prevents raw s=
ockets
> created with IPPROTO_TCP from bypassing the type check.
>
> > diff --git a/net/core/filter.c b/net/core/filter.c
> > index bc96c18df4e03..cd88633f8dc14 100644
> > --- a/net/core/filter.c
> > +++ b/net/core/filter.c
> > @@ -7475,7 +7475,7 @@ u32 bpf_tcp_sock_convert_ctx_access(enum bpf_acce=
ss_type type,
> >
> >  BPF_CALL_1(bpf_tcp_sock, struct sock *, sk)
> >  {
> > -     if (sk_fullsock(sk) && sk->sk_protocol =3D=3D IPPROTO_TCP)
> > +     if (sk_fullsock(sk) && sk_is_tcp(sk))
>
> This correctly prevents a type confusion where a raw socket can bypass th=
e
> protocol check. Does the OpenVPN (ovpn) driver need a similar fix for thi=
s
> exact same pattern?
>
> In drivers/net/ovpn/netlink.c, the driver accepts an arbitrary socket fil=
e
> descriptor from userspace and determines the socket type using only sk_pr=
otocol
> without verifying sk_type.

Not related to BPF.  The point sounds valid, but I'd let
ovpn folks follow up.
