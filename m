Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519E52C21EC
	for <sashiko@lists.linux.dev>; Wed, 15 Apr 2026 05:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776232557; cv=none; b=qHxacbono7aaNjyDn5Bo4lLcJu/UufTPphP6MNKwmy11xvSyvDUBmj/JZ5oSAOO7zKKEE0O+8CxVfaowJ9UOkW6gAaKwtmBOp6XrqigrpM5QFGt3X9jFSgaDJoESKWdOUK4leI/KO6uapCQLgfW2Mw10pVqCHeGq11Sx0pYclPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776232557; c=relaxed/simple;
	bh=mun1sf8kmKZk08Nymw1fIkZAY0k5mSEpHquJTLuAa90=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UyyuEmntPWK0+oEpI9UORHk7XWxQxghOSLZ0HImoN8gyR9mIxQRMxE/kbfFxuMom1VIy2Kflo4iMMMt4wSJ1nWWf9xrZtFgDBOEWsFw1WB5w/2H0UEH4hKXswxzFyk4zydUUqdTpYDl5934eimhY1j4/j2ft1RgGgssqT7jff0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XFAG8cdl; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFAG8cdl"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35d965648a2so5482982a91.0
        for <sashiko@lists.linux.dev>; Tue, 14 Apr 2026 22:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776232555; x=1776837355; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DS2EJhxlzryfSIx+ZY5iXdPRGbh5lfuGbvnIsk11xco=;
        b=XFAG8cdl2QDP+Htk/i6kf441spbUew5srXbV3sa19wuAnc4ke3x5/R2CG9jJ0fJDUP
         BfD2CLPxsCbK2DCitQbpkinqjIj1dpXu+qvLY0L70obXKBO3A7mPzGv//sT2yzOy2dS8
         KWqFOmpXmPos4TzQgYVIPXMY2v5dld1HATV3w2LgcqpSrj/vicVpngqYfOk9EB1dA7kc
         FkzgTZbxk/tr51tb5wvGeDbtz1nQxka3pWXuMhyyJLWtSRUa8w5qYnn2UNYzs/UNn2a8
         ptEDjMEfNCIUQmXCIJwWIhycxQ+Q/efVgL0TQik4GPkHb8Z/hrq0TAZ6qx2B6JyZdp1E
         i5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776232555; x=1776837355;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DS2EJhxlzryfSIx+ZY5iXdPRGbh5lfuGbvnIsk11xco=;
        b=M9jiRhHrGzj/eQg9bAdpDo8fPuKz2Li+MGMgO1iJQaMN5xMQVI4ehI7QQScpt4JE3z
         kJ+t+yShlrhKNBATPxWfmBpn5WjgvvRl2Z76QG0ZJUrpFQ4Hsv98fhdeNPrmSfHgV5Qj
         AMgEc6fmbbe4givkPwRAP8nUPdpAuMltTvuLiNhQeKOdefEvgJEHeKyjQPMNTGWkr+/i
         4nJbjAs7BpJ3uASUsKdqfBchAIHwMpzcnu707Q2YZ9vxcfG4oYA/zJ4OlGVuZ8yHHh5L
         IU52N3J4DuOE9D7JPuQl0MD005Cm4ulBJWDwOag4JEeOLZ4DpnXU4ymvyRH/2Rk35OFO
         8mYw==
X-Gm-Message-State: AOJu0YyXM/5I/d39kjJVULfmeG2QymWRxVV8YBWIO7JRBcjtCbimKWkg
	JKrBj8y1SA2TKu7oqYjjbWymmiSBWNxeBPtys0sOQ5hR2rNTcYbnNoVwHHnMxK1H
X-Gm-Gg: AeBDiettJZGPorbc0gcZ+WQLSB5RE7fGiVbh+yT/7Mz8xzXCq0simIafoKHW010Qu9s
	EEHOLxv8PQgRTJV31cZk57bVsQekobgmGU1UXOhvQoHLIgTXj2IrdJYSFlBk5w/kC2RMRmUF4/Q
	9i4dvwAvbW9Fd2FEz69F0obhIfbqCdp1wL6UYPf6SFun7YIq6TgqfWnIUbK6jzmzDnD5oD2GIYb
	gErVg0mqODmLCVmQGNi59FrzyD14gbMmQ/l1nLx2mgKj5cHIoX+o7ZFRRBPK0QiYFhj53T8Qoyk
	EM7o41n1VogdlZaenDDQDXU9ThvqD1JJxgPmFJ9M61JItav/Eqz4de/eZfBt2DxJYn4Rihd+7mq
	rD9CiZ3MAjNKGHvwGBvimZcp6qFMybYDEisWtgVv3NJZkEWLDjV6pnzlDsADOhQR07wwpVeG7m0
	6KnFId/bhZ0bNgPkjp6WDMHCON4F2mWew8yOBLLYwDSQRHdoteE05D
X-Received: by 2002:a17:90b:1850:b0:35f:bcfc:27b8 with SMTP id 98e67ed59e1d1-35fbcfc2b0emr9507734a91.7.1776232555418;
        Tue, 14 Apr 2026 22:55:55 -0700 (PDT)
Received: from [192.168.0.226] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b478115de4sm8544415ad.27.2026.04.14.22.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 22:55:54 -0700 (PDT)
Message-ID: <6fe22c1f033064a68fe170e6135611cac72ee59d.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 2/2] selftests/bpf: verify kallsyms entries
 for token-loaded subprograms
From: Eduard Zingerman <eddyz87@gmail.com>
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Date: Tue, 14 Apr 2026 22:55:51 -0700
In-Reply-To: <20260415012106.5C63CC19425@smtp.kernel.org>
References: <20260414-subprog-token-fix-v2-2-59146c31f6f1@gmail.com>
	 <20260415012106.5C63CC19425@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2026-04-15 at 01:21 +0000, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 1 potential issue(s):
> - [Medium] The test modifies global sysctls (`perf_event_paranoid` and `k=
ptr_restrict`) while running in parallel, causing race conditions and poten=
tial host state leakage.
> --
>=20
> commit 9e0a167112286dfb5b44d5686732b8297533a10b
> Author: Eduard Zingerman <eddyz87@gmail.com>
>=20
> selftests/bpf: verify kallsyms entries for token-loaded subprograms
>=20
> This commit adds a test to verify that both the main program and its glob=
al
> subprogram appear in /proc/kallsyms when loaded using a user namespace BP=
F
> token. It temporarily modifies global sysctl variables to allow reading
> kallsym addresses.
>=20
> > diff --git a/tools/testing/selftests/bpf/prog_tests/token.c b/tools/tes=
ting/selftests/bpf/prog_tests/token.c
> > index b81dde283052e..89da527ed9304 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/token.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/token.c
>=20
> [ ... ]
>=20
> > @@ -1194,4 +1252,23 @@ void test_token(void)
> > =20
> >  		subtest_userns(&opts, userns_bpf_token_info);
> >  	}
> > +	if (test__start_subtest("obj_priv_prog_kallsyms")) {
> > +		char perf_paranoid_orig[32] =3D {};
> > +		char kptr_restrict_orig[32] =3D {};
> > +		struct bpffs_opts opts =3D {
> > +			.cmds =3D bit(BPF_BTF_LOAD) | bit(BPF_PROG_LOAD),
> > +			.progs =3D bit(BPF_PROG_TYPE_XDP),
> > +			.attachs =3D ~0ULL,
> > +		};
> > +
> > +		sysctl_set("/proc/sys/kernel/perf_event_paranoid", perf_paranoid_ori=
g, "0");
> > +		sysctl_set("/proc/sys/kernel/kptr_restrict", kptr_restrict_orig, "0"=
);
>=20
> The BPF selftest framework executes test_token() concurrently with other
> tests because it lacks the serial_test_ prefix.
>=20
> If another parallel test modifies or relies on these sysctls simultaneous=
ly,
> can this create a race condition where the parallel test reads the
> already-modified "0" as its original state?=20
>=20
> This could result in the host permanently retaining the lowered security
> settings once the tests complete.
>=20
> Should this test be renamed to serial_test_token() to prevent concurrent
> modification of global system state?

I don't think that we have tests that rely on these parameters atm,
but suggestion makes sense.

>=20
> > +
> > +		subtest_userns(&opts, userns_obj_priv_prog_kallsyms);
> > +
> > +		if (perf_paranoid_orig[0])
> > +			sysctl_set("/proc/sys/kernel/perf_event_paranoid", NULL, perf_paran=
oid_orig);
> > +		if (kptr_restrict_orig[0])
> > +			sysctl_set("/proc/sys/kernel/kptr_restrict", NULL, kptr_restrict_or=
ig);
> > +	}
> >  }
