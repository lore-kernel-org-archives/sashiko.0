Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B56382F08
	for <sashiko@lists.linux.dev>; Fri,  8 May 2026 20:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778271679; cv=pass; b=oyHn+J89iz9JNddLv2H6t6Wx7U83N0Q4PNQ9hZdBGlD//obWfFmitu+4aZNsc71QAdcR+qR7E3mbdqMZXpJ6Qd+CVP6t4X2U0pGLhlt0ZDRJIFAL7SpoRCaTyMxturX6uJXtzwMSn4d8JnLcYEPIjqyanuKp07+KOT46y4ZCAnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778271679; c=relaxed/simple;
	bh=clTjvontwUV5I1LzL/mG5UsFzPY6tLzjfYfcL4kTDMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BUc/TxAlGIYUt18XRXwtUsat7OOQhyBtpGMR0rTO+/b7zkzRnN54OhItSLNSCzZNFprFuSu1bgSwdyPXR6rI2WM6dJOnhVD3vPLXAHnWsfwaA+C4DifQEVARPxkdiY+4sTRjYQqLAmYxhy2rSOzuJzFjI3vHkdrHd6pOZRMBxcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g9c0pJKb; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g9c0pJKb"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12c1a170a50so3447746c88.0
        for <sashiko@lists.linux.dev>; Fri, 08 May 2026 13:21:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778271677; cv=none;
        d=google.com; s=arc-20240605;
        b=gYtPs6hAfEkHYadn8iCOCnNZRjRqV7bYsrvK2gSuhBKL8AVR5JTgtfA0DQqao97V4x
         0GvxkIKEG6Ts8z1fFI2/IQMkKGIZOrLr43gkpZX+C+NftOYRKKByNLEXC6VDuTzJIm94
         xpPHNaVdLn8H+HhuEfgowIaLHJTMpILAFTgTBF1C2G8GHgOjSqG3KlgmkfU6QdgPWhK2
         z1dTKz2v2mkIzZ5EhyF4YastdD1aGRrGh+PkXpS3jMZvx559dy4L15Q1YkKlWkUcGf7E
         FWIYZcAXAP6fZx5r8TiEczbC0Rb6CLECswUhjx0Jbhr2g/2B4N4RM0N3c8fE93wOuqse
         o8cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eofxHGAuid8OpacDdi/A4URZkbFN7TREJITktZCU5PI=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=ftF19sUI7sAPTp1/CfVFSG54TyMbMFbBzXNAfpXWnvZxCQnyspMEZJRdMISgOluo0g
         /JcfXQUBvytwm53M/Cy2lWt37Le+mOlEJ4VGWcsL6E+GF/+i8q0wjYlwTQ1Hvf/PCrSa
         C5Vk3owJ1tg+/KQTc1rVycrP/gnD+94X5LNk3+6hen+gaG2m3UXsyk5SzHNHJ0SrIlGH
         t8N9Jtf/PD7OQAunIHLN+GMuMuo0WFbrEnMQZHiI1OO9eUWBR+vDKPwtR08CZMht6VQH
         vHkCiWkbmVICIWBAkmaW8hqMqCQXBQ+bu2EPGEWcJrQuKvPuFuktUOXsd62+fusLjrnK
         BP4Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778271677; x=1778876477; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eofxHGAuid8OpacDdi/A4URZkbFN7TREJITktZCU5PI=;
        b=g9c0pJKbj4HqFaqOVajDdM5qwyEuQoI4b6kUdkGqThOWWneuS8naulV7+Odt9Gl5rc
         srXQW1Mly7Q7eJYwIe4kEJD450dBVVSqA1OsIGagyLbE5VsZ477W++sPQiAKyBj7UANU
         fEvs4mbU9o57DFFLn90F9G/VZrEZMcpGzMUiCBv+XrESOGa3veBWmRs4nvSHHlbATlgi
         lMWSTqrJ+eTg4MigCuyAnU0aznufgpqqjVlmWzdFngQRMSKCyKMcCJXK8RvSKqdraNRC
         R09q1NKwaq8QQnfGFpL2sIJZAE/2yC6uJ850UCtLI2gwQl63KrDXqJ3f7GvFaowdsa4l
         hvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778271677; x=1778876477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eofxHGAuid8OpacDdi/A4URZkbFN7TREJITktZCU5PI=;
        b=ZMHtgx66cw4DSzEI/MkncAHlAM0pWkJ4n3ZWTY2/tw5MmN9m4gj7Y70pdUrCP5+rBj
         U0FY2EbimIoCAPBAyPbXWWpf2poqb3JR6+fqaA1pwWgF9dpJN6nzOAx320WpEVZJvekh
         n1rDSVzZXUpMAdWfPl85lLAms7OM4z7Dx45mvpj+yuqf+XYXAJ4O43vFIfLuXUiVu2Th
         bfs5P7I+PEQh6Ek59CGIVjxh0eiRBAJUhoB5pA5JAChseOAdNdEbu7r1nRYL+TmqHM1i
         e6rkxSCeR7mToTkFXAILiwwDWulQTjF5M7ZONLrqELWx4BSfR1lFROyWtfNjwUPOXI3x
         igpQ==
X-Gm-Message-State: AOJu0Yz3hyo5kjYFQI69Q86r7CFralhEviNGIGXQk59wXOSyMaSZOMsN
	Vj0mFmjt+D3J595Mz8dZ75k0lXpiqPqktMZN/LIWPAeZwJTD5ELMoxaUgAw/Gb+bHPy1rN1383y
	Yl0CUAeKXrn8ithBGYOvcjmPsTlp/oEwdcpg5d0Ao42DfrcqWrNGxP0EP
X-Gm-Gg: AeBDietMvRrrkLD0sDSDNGs1dj2aklciUJO8ic/gEGRTryhk4hxMpU28RKYBafgiET1
	BtY8C90LuaU8Om28eZLCMbGoc8PwX9xIRklfpCVRldmr3Wu5NEnI0tdpOrvJib63T7qUOeh0/Vi
	df8qRdB5qZp1W9ZPja4lfcIAOWZIp+VScDeXPvrvDG4CbVd2w1nZ3t5vjm/9pbRSQD6W+wS+T4V
	3ka+hgGZWmv92cfL125DZ1YT5tqFR9zpwP283ZO1u5U0HU06eQFNJtq5lLGiynEwZqUf99IE+Nh
	Xh2/AWLaWVW6k7KaOdAbbUMiy1uEif86kHqek5d1W98j9szJzaI5Sh79gh43+6IWw9YqS1BpZ8j
	YEgTUxnE29tvOszKeS8e2tgF7P0tQdI8=
X-Received: by 2002:a05:7022:688c:b0:130:c9dc:bc55 with SMTP id
 a92af1059eb24-1319cf5d736mr7348783c88.28.1778271676496; Fri, 08 May 2026
 13:21:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260508073355.3916746-2-kuniyu@google.com> <20260508190227.AFAE9C2BD00@smtp.kernel.org>
In-Reply-To: <20260508190227.AFAE9C2BD00@smtp.kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 8 May 2026 13:21:04 -0700
X-Gm-Features: AVHnY4IITnMG9Ifo--WD0kHxiOjqAPYuz4ED94BpgA_GNomTzTUpKVDCO1IdJUw
Message-ID: <CAAVpQUAh-OiEUJ7PqcLAgYjJq8K9QTFPsDfVVeAcicyvtF4hog@mail.gmail.com>
Subject: Re: [PATCH v1 bpf-next 1/8] selftest: bpf: Use BPF_SOCK_OPS_ALL_CB_FLAGS
 + 1 for bad_cb_test_rv.
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 12:02=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Using `BPF_SOCK_OPS_ALL_CB_FLAGS + 1` to test invalid BPF call=
back flags creates brittle test logic that assumes contiguous bitmasks and =
breaks forward compatibility.
> --
>
> commit dfed6c2387074d0f6f7afb70b6bba777371f7267
> Author: Kuniyuki Iwashima <kuniyu@google.com>
>
> selftest: bpf: Use BPF_SOCK_OPS_ALL_CB_FLAGS + 1 for bad_cb_test_rv.
>
> Once bpf_sock_ops_cb_flags_set() supports a new flag,
> tcpbpf_user.c fails due to the hard-coded max value, 0x80.
>
> > diff --git a/tools/testing/selftests/bpf/prog_tests/tcpbpf_user.c b/too=
ls/testing/selftests/bpf/prog_tests/tcpbpf_user.c
> > index 7e8fe1bad03f5..e4849d2a2956f 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/tcpbpf_user.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/tcpbpf_user.c
> > @@ -26,7 +26,8 @@ static void verify_result(struct tcpbpf_globals *resu=
lt)
> >       ASSERT_EQ(result->bytes_acked, 1002, "bytes_acked");
> >       ASSERT_EQ(result->data_segs_in, 1, "data_segs_in");
> >       ASSERT_EQ(result->data_segs_out, 1, "data_segs_out");
> > -     ASSERT_EQ(result->bad_cb_test_rv, 0x80, "bad_cb_test_rv");
> > +     ASSERT_EQ(result->bad_cb_test_rv, BPF_SOCK_OPS_ALL_CB_FLAGS + 1,
> > +               "bad_cb_test_rv");
>
> Is BPF_SOCK_OPS_ALL_CB_FLAGS + 1 robust for forward compatibility?

This test is not supposed to run on older kernel.
