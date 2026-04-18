Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12684231832
	for <sashiko@lists.linux.dev>; Sat, 18 Apr 2026 20:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776544838; cv=pass; b=hLbn+DXeNT7scJbTUETc5xVt05GE51f9YZVRwMGgP7TECmKtedS/fkcrH6TJTJFLImTC6/ZjeWk0dVZ5KcUpFHfbqduV/1MxTllk6f8uzZ724MRZZiEB6S8jri24rqfIfHYYf0ANisWDPFUp/6yYwlzx7n/JTqnFHR88uLgSAOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776544838; c=relaxed/simple;
	bh=7B50zB8QbeX3uPVK9cZOsdCqcRSAMBb3zwUUFGmV4Xw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jwHQkWZN9vX3Hfw+D7FHBjaokK62Zv+hhbByLji2/RLe7kMk4Z7KL50zfLv0nkb0fp6l4axSyJnDX73U6t0tllDM2fzIyxz35FQsPYd4/QihxtTiSXZn1XYh/rTMI/6lW9mGaacJ1NiRLtLNkj+B6bGvergIuRulhRHieMMpsyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZVygjAc; arc=pass smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZVygjAc"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-43fea39e066so799276f8f.1
        for <sashiko@lists.linux.dev>; Sat, 18 Apr 2026 13:40:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776544835; cv=none;
        d=google.com; s=arc-20240605;
        b=ZuiJGsE77IOWazZQQS7fwsZJBVXHOrjWy+vawZvG1TQg2VGdCjGSb+F2LO988Yg9VE
         cCDF2vldqu5hrYHMuhLWD8a2pMbECWqThBAx1hgT8JYcIVV2REEdRhXzBnfabNfh31/j
         eAwnfjE/NbJQ3IMVPWfyxifsJi5nc3Td9CknPQLti9bAghvn31B1/pRbwRp2EHzR33gg
         7jiuHDT+VSRMbfO2nFNzbkM3EWhGlzhG51wXjvoN+naaEE1tbj0/mrbru3MS7i6pw3W5
         /D6XsVU0f3Tm0FVkp7+OpfBByUEi9b7Au9psEdKwnJljSn4CGSKFxzjJVRent1hvBmve
         cRlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d9I9a7XO9dtIiXmk5hGZfJcYVs5rx/AVNZYg2EtQcA8=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=GeM3QjMRewA1+YPuc7TYF0sjZvWwVk05bkbaCmxPX8FUqEsAyCVvqDnD0DWvOtNGZd
         zXAF9ntqdu/qCrP2Ua7aBwU1JwJQjW4Em6A3WEjpjTMYXj4OAYEaR7MKE+bEA09nN55I
         wPcEjCF/kD0euSPZDztU/EL4ofI5+04lv8xOeKgj7lfuIjmmZ21XqZDTdhBZND3cZCnp
         lIGbQxTmmzjG71nHixnrvi0ScGDn1URQ15Ot3JGvWVt8YWPcj80mh+lpetgowQcQNEdc
         qpaLJxZYurw1T6ct8DPEZRKpNuhZVAJaSxAOR5YSKX8JAgPbkMXqvSMzUJ5Wg6NjS2TA
         xNkw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776544835; x=1777149635; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9I9a7XO9dtIiXmk5hGZfJcYVs5rx/AVNZYg2EtQcA8=;
        b=iZVygjAcqWTcOxxauBH7R6dujopAOImpQNUgjaTw9wKjRBq+ap3JtbUdOC5ki8qV+h
         w+QwgMBxB+yFjVA7DTdiqhbo48H11+u2ACCSSIE0oMFjpPmE17lfB+ZnD79vhPQglLmO
         OMgBk/nFnW+81SldbakoTGnCriVEUMj0tpIkOnRzLcXgKfzN9hbZZAAms3bx4nAqMqPP
         9Ctmlev4ysk6WWrzIr75++LOWLxV4xCAQ/bimUpeXAH+AuIhwBB8BtpM1Pk0W2g+Iy84
         mss2ygwdPbc0wYeMDbWLtLDbOmRtgSYwHeVMxXYdq9q/+gGbcdSuuFx5XaeFmqklBKCa
         WSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776544835; x=1777149635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d9I9a7XO9dtIiXmk5hGZfJcYVs5rx/AVNZYg2EtQcA8=;
        b=pvHhV456r+hgHwsQNx4ZjLHl5S9Sm0G+oVVWLJa1shsddmxSOLbpGhz6BrH3+1f4Pv
         8kKIh2/R7yRc06YlFd4J+2hyHN0xv5Y+6MHAp/nTVJ4N4kMYVnI8I8MrbssRcQlQ6iwq
         5U9Qv1BtghrrRBwMtA9ODpUDdLlD61k2gg5EL5W0WV8q06gva0KkzY5MfT2t+tyhSUvC
         lApU2czI06sv7P3P+/1x/3k2GzNEdfcSmngYYe2nwQNN8dorIbRB/M46KrcF2YstEF55
         6fub3FuV3IEWAeVCs/Sm2mDDB+HZFAInDXT9vk3JhB2VSUj96dDl+XHM09noFtdeqAJ4
         fbkA==
X-Gm-Message-State: AOJu0Yyhan45e2L3yyZbgCHmj8iLirJkLJT6cAZaUPuEQXK5yDdfwLUu
	u1JldChIzPUsW+NyFxGRxM7AAtxU5tngg5e523dDxu6DhejuVI/SPYl4cUb/W0Qv8UBm6EJIGSE
	WUVPwUWh1UhBScBxw0RsRydUiSRmT+pBYghoQaj30jh7O
X-Gm-Gg: AeBDies2ySABimlA3hvRVA/2x9dRiHJ6Cxlei5GJypf30Ac1yN4/wH0iOn1Rj3xwmV1
	KRz/xZ347697BhZiwHYDZ7ZxCrjMbz5sGSDJHAu3A7vD+Tt3qoTVw7LkGIGaGe2tYfsOhsIWCaF
	Z8StGwv/+N1ldmX1ICQNyvafeU2G2EPsdLzU3PXCaxsK+UP3tEsp3XcqqQu4GrBaGqFCMEfS4ha
	gkf4DUw0trjt3PusQYH8E1n1onjNl2g9JIhxkFHuCM86wAKeZcFKn7+Kc3Eg3dYfzClMyY0jVxX
	i6K+k61G/oskWfeURTN8KHBfBXlAcCXqyIKdfkzWmlTOEnEdB9hgmq/92bOfzpwQRWYxllDB/iY
	TClIy4+bDTtQf+XEdpNTjBiaAihgOAkav5wrQ/wd9qrXPUPxD/Uo=
X-Received: by 2002:a05:6000:144c:b0:43d:6a0c:9571 with SMTP id
 ffacd0b85a97d-43fe3dd339emr11882591f8f.11.1776544835102; Sat, 18 Apr 2026
 13:40:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260418171701.610025-5-memxor@gmail.com> <20260418184552.8C983C19424@smtp.kernel.org>
In-Reply-To: <20260418184552.8C983C19424@smtp.kernel.org>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Sat, 18 Apr 2026 21:39:55 +0100
X-Gm-Features: AQROBzAYafRlGmIgiWv38zJIHVmqJb4mIj0aS1xylho8uw7ZrXlAdTce3vbfJsY
Message-ID: <CAP01T75a_-GkmOvQSjcsziSTEFYgn8X-_zn8haLvh4OhoJ0f1A@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 4/4] selftests/bpf: Test verifier warning logging
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 18 Apr 2026 at 19:45, <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 1 potential issue(s):
> - [Medium] The custom `libbpf_print_cb` unconditionally buffers all log l=
evels into a fixed 4096-byte buffer, which will inevitably overflow during =
skeleton load and silently drop the expected verifier warnings.
> --
>
> commit 602c54794881684bfce8f29591c7e680ab7d51fe
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> selftests/bpf: Test verifier warning logging
>
> This commit adds test coverage for explicit verifier warning logging and
> libbpf's default warning flush path while keeping the warning bit private
> to the test.
>
> > diff --git a/tools/testing/selftests/bpf/prog_tests/kfunc_implicit_args=
.c b/tools/testing/selftests/bpf/prog_tests/kfunc_implicit_args.c
> > index 5e4793c9c29a0..f92a27d764557 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/kfunc_implicit_args.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/kfunc_implicit_args.c
> > @@ -4,7 +4,99 @@
> >  #include <test_progs.h>
> >  #include "kfunc_implicit_args.skel.h"
> >
> > +#define TEST_BPF_LOG_LEVEL_WARN      (1U << 4)
> > +
> > +static size_t libbpf_log_pos;
> > +static char libbpf_log_buf[4096];
> > +static bool libbpf_log_error;
> > +
> > +static int libbpf_print_cb(enum libbpf_print_level level, const char *=
fmt, va_list args)
> > +{
> > +     int emitted_cnt;
> > +     size_t left_cnt;
> > +
> > +     (void)level;
> > +
> > +     left_cnt =3D sizeof(libbpf_log_buf) - libbpf_log_pos;
> > +     emitted_cnt =3D vsnprintf(libbpf_log_buf + libbpf_log_pos, left_c=
nt, fmt, args);
> > +     if (emitted_cnt < 0 || emitted_cnt + 1 > left_cnt) {
> > +             libbpf_log_error =3D true;
> > +             return 0;
> > +     }
>
> Since libbpf generates a high volume of LIBBPF_DEBUG and LIBBPF_INFO mess=
ages
> during object load, will this unconditionally buffer all log levels and o=
verflow
> the 4096-byte buffer before the load completes?
>
> If the buffer overflows, libbpf_log_error becomes true and subsequent mes=
sages
> (including the expected verifier warnings flushed at the end of the load)=
 will
> be discarded.
>
> Should this callback filter out non-warning levels to avoid filling the b=
uffer
> too quickly?

Perhaps, I will check and adjust if necessary.

>
> [ ... ]
>
> > +static void test_default_warning_flush(void)
> > +{
> > +     libbpf_print_fn_t old_print_cb =3D libbpf_set_print(libbpf_print_=
cb);
> > +     struct kfunc_implicit_args *skel =3D NULL;
> > +     int err;
> > +
> > +     libbpf_log_pos =3D 0;
> > +     libbpf_log_buf[0] =3D '\0';
> > +     libbpf_log_error =3D false;
> > +
> > +     skel =3D kfunc_implicit_args__open();
> > +     if (!ASSERT_OK_PTR(skel, "skel_open"))
> > +             goto cleanup;
> > +
> > +     select_legacy_impl_prog(skel);
> > +
> > +     err =3D kfunc_implicit_args__load(skel);
> > +     ASSERT_OK(err, "skel_load");
> > +     ASSERT_FALSE(libbpf_log_error, "libbpf_log_error");
>
> Will this assertion predictably fail due to the buffer overflow mentioned
> above?

No, it's a non-common case.

>
> > +     ASSERT_OK_PTR(strstr(libbpf_log_buf, "-- BEGIN PROG LOAD WARNINGS=
 --"), "warn_banner");
> > +     ASSERT_OK_PTR(strstr(libbpf_log_buf,
> > +                          "uses deprecated kfunc bpf_kfunc_implicit_ar=
g_legacy_impl()"),
> > +                   "warn_msg");
> > +     ASSERT_NULL(strstr(libbpf_log_buf, "-- BEGIN PROG LOAD LOG --"), =
"no_verbose_log");
> > +
> > +cleanup:
> > +     kfunc_implicit_args__destroy(skel);
> > +     libbpf_set_print(old_print_cb);
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260418171701.61=
0025-1-memxor@gmail.com?part=3D4
