Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB393C0608
	for <sashiko@lists.linux.dev>; Tue,  5 May 2026 05:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777959528; cv=pass; b=AIYqMjp1fZ19RSquEp4wkFJpTn+30S4Op0lD1YzJwkloBZTk19JfUUyq3M4Ec8RdaHGOv0STfswBJ/h4lmRbxeiBmSW7YyRG3+/qIG2mKaXKyz+Msnc5UlkAounCVyA9MIQihWviDbVAbk9Xybyq/ohp+B4NjSTM/c2YNoGnnFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777959528; c=relaxed/simple;
	bh=E15gTeE9IxpQqCiyRIAnhJyJyhZa2kflNcSZimN2LgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cMxDq5IYoFwinynU6eGD9EGe/eaK+FOPmjp+bnYTvLyHSvddTjRd5A0iKdRPjEsyv5thaCO4lMkYEBs9h9psNU0g0tNvXIrRTbphkdV8aUZo+Idcupxrhfn53aUvo4K6ZOPppTD9OV8l/oLbODZMhAB+00U0fjAHXv+uHcnOdYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XqN0xhP/; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XqN0xhP/"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-130c653cce4so112629c88.1
        for <sashiko@lists.linux.dev>; Mon, 04 May 2026 22:38:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777959526; cv=none;
        d=google.com; s=arc-20240605;
        b=cF7R3OA48IYBqDfmwjxzS50K5geZFSms4f5rwdJcP+wC6WD7wBTQIMWhhsJiFd1EhA
         2xOb58ZpRN+ac/FGizm8fStSr+F0WAdGtyMWTapmPBgNguP5cmaZYETi2TLp+FQILBZY
         Hlpv3wK0Nx2E2WkIw9GDHCgMggmmbkBDPG77L+bxm5mUn0u8Ks3Zb8g162V6TvayKNuP
         mgTDytx82Yg9oYpgjCYCExoC87UfnivSQxrNDQM/E796gijvA/qJ/nEpDWhlQIhCZtRG
         wcqa5WH7kQJpifccTs8+aaOn7dQuVghOERrP7zqu1UxvHE5x36vbUntUupvw4vQKLN1I
         T6jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OUm1t+0gZGzttowhsI56qfvRdvVsKy6ujIh4wA8TLdQ=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=NvtT3QXk9TmaJAwGC/NzoR8KxrurYTH60wKxqX/Owr9R1fRCwScxiOS4syXvhSsHHG
         2ErGW6K/Lfu8VqVDZRTcRI24pLAZRaNjKIfQuLcKpmkXF3+PuHZ/Lnf3VujQGMOVIG0W
         6x35XNTZ/4VqY6zyzp30DBIjQuSIrmWgzlJpm72gfNqun86LerOfqku1BPaB5Mkrg9Oq
         rC4lBTRpAsi4lcfYz5FqX/RC3rExm/TdNbp1PiX8NEUssUKma4MookgNvmiiBhf63Sa0
         2lsj3DsSQ9DnuUC2Nudkh+eN1TGDnxLg1kwxhBuyQdkq9iPMtioFJ8wUwEzhVQRKvVRW
         J6VA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777959526; x=1778564326; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUm1t+0gZGzttowhsI56qfvRdvVsKy6ujIh4wA8TLdQ=;
        b=XqN0xhP/dszZ1jdQgPGYcKR+a0jOg09Rf9vWiSnJnSg5XHLUwXa6m8Svo2ZQUKkiBd
         nUjat5g8Ul3w1MNrQ7dEk1NZr4JBCPZwgRLqswXOiFjhSEjWsFqHZDc/cmqJqW7B5B33
         Ri/+G+lz983SwRWDlZemeW5Z+irsqqCAgTUlX1bpYKBtZD6QY4v7uXRXfnXvR2UdnXyK
         hqA5i45D1MOFbKlmI0r2Lu2p9DJjapwulDI4IFif/imAq9GjyvfhjfvyTaX8SlPkephc
         T/lA1GcKUfdkvutcipFN48vYAn54PkJYLbuZCoD9SOwpxbUqa8PmmCTEwjEpQufF9RuT
         2vHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777959526; x=1778564326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OUm1t+0gZGzttowhsI56qfvRdvVsKy6ujIh4wA8TLdQ=;
        b=dmZftlj1Cb+5XCMFA1if3aPEPNQ46HIRarT1FYWZNFXm00aaSsxhUnnkP3eY4QFUHh
         NA17hY189xz6AYDR5wABkCwuVuB08GaAhaLXue+fVq4KGUte6RsLMz70J0ieIhCgNcJg
         Gvsk7RV+Jz3M3afay5LDvq/U+oemdelHTlFs3/+7u9TWwOLS33JWDqSQ45mdpuFYPv24
         nIJR+sZEeeaB6OxB04zivKYQD9fkfj+ogY3Q1NkIVYv74jSNGShqSztvJsqiAWNMFVpr
         I50nqRzIVdoTTtjvvR9u/AWOVPatJEWA1RcDwC9k0bs8aq8agOdLoO48z5/v1/udpD6Z
         q/Nw==
X-Gm-Message-State: AOJu0YxXs1CrqotfVChWG2BbdjS2bSl4HG6dlrPNSkMmM+KBsAwS/NBm
	ME6ElhEonpxqPVnOdf8jgPNLENdUXZn/kCSk6dLlH5PpihgZKVCN89qqy62nTKLdpHGzrUdxHhT
	KofX0RMKqzHNfqitxyAmF6ZEsBeVNKxVszVAP+GyIv8F/9z30qPDKavC/
X-Gm-Gg: AeBDiess4Mv14wZfzRAnp/7FgX/O2CS36l6thxcCMsuI/2A5dCRMR/qZJo5MA5vgjSy
	6/Xbtap8tn+EH6MAlU2j/Le4XV1/E4t2jidWE3gZMZSo7xrdqh6ZBWygYDfDPiSb8VCBzX/pE3O
	9MmEZlWZx+4a2EfWRYre/xCcFuWPt+1FeWoM/yppG82/Qj1kxYOKQcNjBugcSJZTPCPI3BWi9mw
	A+Q06hdTrPDSvKyYP+sQSzrOWQG8V5QLK6B1Xbi7z/PDpqgpGeKvuYqCj6EkD/UwKCsS02pwMtB
	aYjuOfqwIah7XbKwQ8qUlF9x+sCEZu6d7FbuA0FNwSmGuLQkEhtQyNOTFIP301TN6249Pt+RRhJ
	igE3ExOdPPs76mxsIchdFt8oVpoUByLCrbH4cOYmUKeN6uu7Q/+sAzugrbAWprUHA+Rq4qkM3jw
	==
X-Received: by 2002:a05:7022:5f12:b0:130:9f2d:ff99 with SMTP id
 a92af1059eb24-1309f2e02bemr1361751c88.20.1777959525442; Mon, 04 May 2026
 22:38:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260504210610.180150-3-kuniyu@google.com> <20260505041433.8B6AEC2BCC7@smtp.kernel.org>
In-Reply-To: <20260505041433.8B6AEC2BCC7@smtp.kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 4 May 2026 22:38:34 -0700
X-Gm-Features: AVHnY4IxGWS5GN45za6_yY6sd3bDU6y42Zis9J4CL8PN0-baQe0fNUQ6g7bQ_Cc
Message-ID: <CAAVpQUAbUnN_bBfguit7GO1VkQFwO3Oj-1adra820r3RpjO=kw@mail.gmail.com>
Subject: Re: [PATCH v2 bpf 2/6] selftest: bpf: Add test for bpf_tcp_sock() and
 RAW socket.
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2026 at 9:14=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Newly added code uses manual error checks instead of the mandated=
 modern ASSERT_* macros.
> --
>
> commit 1a574056fa08ab8c66dcd9b6ee5f0739ff6721b7
> Author: Kuniyuki Iwashima <kuniyu@google.com>
>
> selftest: bpf: Add test for bpf_tcp_sock() and RAW socket.
>
> This commit adds a test to cover bpf_tcp_sock() for wrong socket types,
> specifically tricking it with IPPROTO_TCP on an AF_INET RAW socket. It
> also fixes a missing free() in the test.
>
> > diff --git a/tools/testing/selftests/bpf/prog_tests/sockopt_sk.c b/tool=
s/testing/selftests/bpf/prog_tests/sockopt_sk.c
> > index 53637431ec5d..5fd33ad2eaaf 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/sockopt_sk.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/sockopt_sk.c
>
> [ ... ]
>
> > @@ -211,6 +211,22 @@ static int getsetsockopt(void)
> >       }
> >       ASSERT_EQ(optlen, 8, "Unexpected NETLINK_LIST_MEMBERSHIPS value")=
;
> >
> > +     /* Trick bpf_tcp_sock() with IPPROTO_TCP */
> > +     close(fd);
> > +     fd =3D socket(AF_INET, SOCK_RAW, IPPROTO_TCP);
> > +     if (fd < 0) {
> > +             log_err("Failed to create RAW socket");
> > +             goto err;
> > +     }
>
> This isn't a bug, but should this new code use the modern ASSERT_OK_FD()
> macro instead of manual fd checks and log_err()?

I don't mix different styles in the same file, also such
cleanup should be done in bpf-next.


>
> > +
> > +     optlen =3D 20;
> > +     errno =3D 0;
> > +     err =3D setsockopt(fd, SOL_TCP, TCP_SAVED_SYN, &buf, optlen);
> > +     if (!err) {
> > +             log_err("Unexpected setsockopt(TCP_SAVED_SYN)");
> > +             goto err;
> > +     }
>
> Could we use ASSERT_ERR() for this error check as well?

Same.
