Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EAD2222D0
	for <sashiko@lists.linux.dev>; Wed, 15 Apr 2026 19:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776281534; cv=none; b=HBTVxJ5QN7i5sUHjzCx76FS2bk5kA9TNULF/nSD7B/4sztqCdhQ6U7qufvmvXCiFA6bDcJy/8iIm6mocDykGuP1HcxCBKdEEDrppwkA8ToLKFoZIzQK8mioNyyZKefwq1+QtpycoJBEn8vcf7LsJcMfChyynEl6u4+ph9C4hUUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776281534; c=relaxed/simple;
	bh=STr3ytdwHXCKXbD/oqlkTHF4bjtfg6nYMJTiZzXVZrs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZGT7F8Z4PD55zfAaVgHNaaD01KEd8OKdtwKSToq8gZYt5trPYkWGrxO0J2CZSagZ9G3A5hU+TqMG3R6LxDGYjL8Uh6hGoyu9a7ccoFZKbHA0BKiOLhJk84U0+Yza0w+SXNGn2uwPNUnX9yloesuabwvtMfVKLjvD3kbV4a4qMe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffMhMBy/; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffMhMBy/"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2d891442388so6683307eec.0
        for <sashiko@lists.linux.dev>; Wed, 15 Apr 2026 12:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776281532; x=1776886332; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xQDjnxsRJ1VgLaxh3r+cVvaXvxLdFW+s3hShCjWRoJY=;
        b=ffMhMBy/gaZbmBooGIoJCVp/ir/Snz4+iYSP1yeH4n9t7Rct5GE8RJyeokJCpXafgV
         UOJRN9CQvZokKuO3zoJcsbMUHcjhld2yqHSik9/VMEY0CnxKZ6GWHB8/1ZiSymq2WNNc
         F1vTfr0B/va1APGrPPOFwooJEPHeYkagbxkw6VJCBgFTR5r03t8SbF0mCpS+vV34jLrM
         zube0sblg+2flwTZA5wg1hFSdGgL2F2qMSnMsIkPVO+k5mvV2OW/AVQGktOPaqLgrnlk
         zRk0sdaglFgC6WWr+1nDV0L6gF6rohYylVO4zk46j0UiWlj7nlNHqMwQ9f8H+FPolGs4
         MKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776281532; x=1776886332;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xQDjnxsRJ1VgLaxh3r+cVvaXvxLdFW+s3hShCjWRoJY=;
        b=ULY7nLsPtXXh3l7I23LfVjQ+O/SWexiYMm0q3NbY7mt3bFQ20SvLuZu7PGvgpMnKbl
         OcwjS44fchBpofoeb7JpFSdn2LjI9Fdup7ISj2mHpUC9PJu6uOR98cBGPii72jyOX/r7
         MaPzkC5uZ37fCV8OMyz2ZvAXvHD6eKgnKwS8By2byBvw4KmRlnqF1Mx4gYV2Cjjnz3Vz
         yb99vUi2gJ9ZegDWgmT+flEFOe9Rs1uR+1Uw78yk1RkdnULCVDDl3pzfHRgMPYG4aT2m
         tK85b5Dw19XLeMwt3ezgoAh/RQPtnMQdLcyfeRJK1okvUAmBSNXExc0/1hppof2PA6ct
         uZzw==
X-Gm-Message-State: AOJu0Ywqtu5IyMd88c0bEDHuMMAWOY03IJ0LoHBQTu6SpI5rOaThIbPk
	skwzRoLDFzZWG9QFlcF0ZuyH48wReLLFQwxP+QEKXv5iDPztGyrQnx4hOxujrk50
X-Gm-Gg: AeBDietxK5vGy3HGiOnycxbWNzmdqTmzzwX6Lc+FGf9zQb3Jcv2NaSwm+WN8i40hKka
	ovEZ/lN1x2cl69X30boS81NQxKoAQhIWYqy+kFXyWoPcfUqoup2CxHdxKLhlQK7saxaKDFoWZ7i
	yNhQAw+pcUm/iWs/aMNsN4fuYkvlt0LyhYpc1j/YRu1o7IihgC7x7fvTC1GtrCkeIcYh28iozFs
	MNPFcA3dR2sG+tF6NHNJu19q8JpuP7qe9QxtxxShcrBTwTCe30EoC31IX9PnOndcbil8Tc1lBN4
	gPaCcnoy2F5hhbOKUCn9VTG4MObzv4/9sRKcQ/LkdS7y90Tg1eT83wci3FLU/t6dWkl+NM/a3gX
	JV/IlS2Meu3+T0VxaekRqWoXI5piAZ2VIOFBo9D55ByzZhMmKNHeBFjj3/o5QF7zPsCuG2Ob8zj
	EiddNQ2MIDPj+mEZABXXTntxtVefDRJBcf3/F9sOCqAimP/EEYDu2H+jzwts4SzLsvXYJ8EOdMk
	DFtYQ==
X-Received: by 2002:a05:7301:470e:b0:2d8:1efe:51dc with SMTP id 5a478bee46e88-2d81efe56c0mr6296618eec.6.1776281532185;
        Wed, 15 Apr 2026 12:32:12 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:21dc:2944:7f23:f4d7? ([2620:10d:c090:500::cdb0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8fe4ea2bsm4019815eec.31.2026.04.15.12.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 12:32:11 -0700 (PDT)
Message-ID: <f6016087c52b0a84cb2cb871cf62674ae1fb472f.camel@gmail.com>
Subject: Re: [PATCH bpf-next v3 2/2] selftests/bpf: verify kallsyms entries
 for token-loaded subprograms
From: Eduard Zingerman <eddyz87@gmail.com>
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Date: Wed, 15 Apr 2026 12:32:10 -0700
In-Reply-To: <20260415191738.226BFC19424@smtp.kernel.org>
References: <20260415-subprog-token-fix-v3-2-6fefe1d51646@gmail.com>
	 <20260415191738.226BFC19424@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2026-04-15 at 19:17 +0000, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 1 potential issue(s):
> - [Medium] Unchecked return values of `sysctl_set()` in `serial_test_toke=
n()` can lead to confusing test failures.
> --
>=20
> commit e7dc629b9f37dc08742ff9bbddeaaf65c1e34956
> Author: Eduard Zingerman <eddyz87@gmail.com>
>=20
> selftests/bpf: verify kallsyms entries for token-loaded subprograms
>=20
> This commit adds a test to verify that both the main XDP program and its
> global subprogram appear in /proc/kallsyms when loaded using a user
> namespace BPF token. It also introduces a sysctl_set utility to configure
> system parameters needed to read kallsyms.
>=20
> > diff --git a/tools/testing/selftests/bpf/prog_tests/token.c b/tools/tes=
ting/selftests/bpf/prog_tests/token.c
> > index b81dde283052e..cf5b94512cff4 100644
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
> Should the return values of these sysctl_set calls be checked?
>=20
> If the test is executed in an environment where these sysctls are read-on=
ly
> or inaccessible (such as inside a container), sysctl_set will silently fa=
il.
>=20
> This would cause load_kallsyms_local to read zeroed addresses because
> kptr_restrict wasn't successfully disabled, resulting in confusing test
> failures later at ASSERT_TRUE instead of catching the setup failure early=
.
>=20
> Would it be better to wrap these with ASSERT_OK?

Makes sense.

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
