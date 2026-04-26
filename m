Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD502750E6
	for <sashiko@lists.linux.dev>; Sun, 26 Apr 2026 23:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777246823; cv=pass; b=R8OSppbRV7klbbQjeWXb0dgqyScwHYjO54lEfCzcKxKkqV6yNM0fJMLfqynJqcwecczALCX3K2P2s3bCu4nVj5ME+5+kaji7FCtrslLT44vKECbzYZYp/oXwKZDAN0GY1LDUHlzYaJgWmanSqgslb0yVTY4KU/kemoRLwM4JfQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777246823; c=relaxed/simple;
	bh=tgv9IbHsjDZGnGt955jyv5cdZ1cNdTK4AJhVlCube/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GtqIJDw3XnPlJ67ichOuih9qC1tudFd5NGVxul6QscL9JHCcup0typ/Y6DRgr4vYB+1Srkf8Uv/1ZpLFZCRvP1fVwRoW5jNiGxtTE+AXTTi2gWmODJs1bNgmg4u2j+59isrE0Facm2Uu6MCKZVnuaE3rGUnfaxoLvI49ZlyzUaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YkMuhiZ6; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YkMuhiZ6"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48374014a77so126335675e9.3
        for <sashiko@lists.linux.dev>; Sun, 26 Apr 2026 16:40:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777246820; cv=none;
        d=google.com; s=arc-20240605;
        b=hVc49q/LxXNUNa4QXZes+OtDWzCrOhQpLjm9veFbMZh+TvI/5FcFSyp9dlYvw1aCw4
         kFblgDpCLi1LA8GkuffMidLUOq8q6C2m3gn2/0xC333bHf/5xk0aE+5BH0oduhjBImb+
         5H6E/+CtQbKvFi1HFsKTRD99OcGuYfZJU+ZFoNYGcUiHL7G/o7Gr5JUNdRZzc9hUUAUk
         QTL3agJ1SoNgjda/UvVOJ1qZZYKrjbgpcWsZQV/zey6KisxymCw0l2NS0ofpxR2f8Mpi
         fsy9o/dFxp59zhNlDn30AMsBeewvzow8y2medR4nMwOJrUwGanxYF/+ZQsE3evdhpUg/
         CgIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FbCgn9rXCZJWWcYjZxlUF/1JgeA3ASV63XA0f6EaFq0=;
        fh=nvpcIJgJUkWDWTyEPcufNvURWArEx7t3ST7zef/z0sQ=;
        b=Gvoxi4UwDfCUzWQTLMDP8/yX+AQaQlOoL3P4nEqS0nbGSCD1Z+3Kz4b1bH4Kk3v5yc
         zNqnrPUI9v8Iaxt7OYdR5BR3N4LnB2BDoDvdsN3pOrsjP660G9cXX0ssZdsfsLlEKDAz
         LeJ/Z9ZMjLVzjDxDZuwXOUja9/b2SGfm7N9LNTRBkBsx+lcgI2IUDBvLMBwidXlIwB4W
         loMtnp1019inpFjUK1SPQhx69T3wA2grqFEoVnJNLMhA2OEOgKOYtRkNOruZhSS2BK2m
         GoAN9tGmIEdOzw/sSgEFpru6a7Vx2AuKbZxh4ztmOx5S0AbIoEor/qjsR20kwzy3/Rg1
         ZbVA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777246820; x=1777851620; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbCgn9rXCZJWWcYjZxlUF/1JgeA3ASV63XA0f6EaFq0=;
        b=YkMuhiZ6X4sDI63aOR31eXeJZtzq5aS8BaDmsrn8FP8aPcwDtvDQ0fPVwFpUGD3eOk
         l8saujz6gQobJ8z01KUpwB2SVFjebBpxRrMjM8uUkgBFyCPLIpP9xWdQsnLf5e7+8/nw
         TzAJTF5pmiLtw3ZdGDpBDpA8p+EhJk2g9viryoH3Y1hVcsKiBTt6UxbXe6WOxtexFi6m
         Pb1a6nxI/9Hik4PL63dH9zs2f2iqTRFRU7kV1rO6J1iIrdJ1e+L8V3I9k7tpsw02Ah1T
         r7BqAP/kN+Epgws81kwzuvgv613yrLBFtRM2YFVOwPfDZQSB/bKPXMpA1iWIIxAJkbj5
         KciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777246820; x=1777851620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FbCgn9rXCZJWWcYjZxlUF/1JgeA3ASV63XA0f6EaFq0=;
        b=Sf4Rjd4q9qsRpMIcx4qrzwRnfbi51rY7dUHBws+Hmd0fQ9gqb6nTkhDgnlGMkO6E4M
         wxJQXGTXIQIjFXaqesYCbATSCzlgO5ub/+E1c/BVOnxi9tg1Od1Ylwf/M6V9bYchbp5W
         m9vDlsKkl3tYrjooYaixYslE4iOolnJJxeXCbvZ1IudCi0Qe7c88LJeAy14L9GW+E69e
         iH4R9r8vcMgvAwzVWYVwRDlH2Eql/m4BFaoFKcncP5U5G3xffPe01onFMzm+5Uwdd4NJ
         HPbZdGLRmzA5MqHxEFF5ajVaqSMFRRuY3jypCxiVqHtZtBWPhbr7uE40NJ/ea8tYRWyo
         cDAw==
X-Gm-Message-State: AOJu0YzcnT/pvA7DgXvG/lWwgPsRn5pVPPpwRQmWOVcIIsfanWmyxOXw
	QFQ3ghz/8oMfQC8SKpNYCv6DJAwIG7YuKLxAr3/aO+DzSHjqaGdA3knPym2hLC+X8zLPlkb4nNk
	lr+iaorQ9sTvNcslTe8meGpHKMCklnnEOx0O7
X-Gm-Gg: AeBDiesXAQdMXDe5te7h/4G3Il2WM6r0bdVe6Rd4WrIisYH7+eyvjhjPPcQ1s1cwFit
	+oNmrhgc0sxcfLgnxvkL+u4jbY05BW4T0s2xUHK4egeKTBvae5Wn43AfgeQ6klWQWAfCaeMVEuK
	JxAChcNHX2peiBP+mhih4xx7iDV2VTCNpA5E9k/K/n+h7YJGeB5L3HL/2bRG3vzh+rnvSRctNGh
	3Ni9pTCcEom9x05qgjReZX5VrtVNFL5emHDwJZ7aZ4r7xli5vF+tSNduYE+NbpJOUBkZNib14OS
	KSG6QFK5W1syqLi9rYOshClT4XtND4GwjlTithmD+lH+QYYMQapPrjVm8tA96wxqoiAvKBlQTB+
	IlX4o
X-Received: by 2002:a05:600c:348b:b0:489:5022:39a4 with SMTP id
 5b1f17b1804b1-4895040c025mr436061715e9.9.1777246820349; Sun, 26 Apr 2026
 16:40:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260416-selftests-bpf_misconfig-v6-2-7efeab504af1@suse.com> <20260416125321.7AF09C2BCAF@smtp.kernel.org>
In-Reply-To: <20260416125321.7AF09C2BCAF@smtp.kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 26 Apr 2026 16:40:09 -0700
X-Gm-Features: AVHnY4L3bl7RsnqeiuApcRGkb6NMQeyc2g0VwPPmbTcx3VLul4GfBburwUZv50A
Message-ID: <CAADnVQLXvs_+c67FH5rk15L+QDGS0=UovgOaTvHeQ9-_suzo=g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v6 02/11] selftests/bpf: Fix test_kmods KDIR to
 honor O= and distro kernels
To: sashiko@lists.linux.dev
Cc: =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>, 
	bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 5:53=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 2 potential issue(s):
> - [Medium] Relative paths passed via `O=3D` are incorrectly evaluated fro=
m the kernel source root instead of the invocation directory.
> - [Medium] The `make clean` target unconditionally fails and aborts the b=
uild if the kernel source tree is unconfigured and distro headers are missi=
ng.
> --
>
> commit 533e8d39cc98f56f3dff4f8c5bff0dcd49fc6ef1
> Author: Ricardo B. Marli=C3=A8re <rbm@suse.com>
>
> selftests/bpf: Fix test_kmods KDIR to honor O=3D and distro kernels
>
> This commit modifies test_kmods/Makefile to honor O=3D and KBUILD_OUTPUT,=
 and
> adds a fallback to /lib/modules/$(uname -r)/build for distro kernels. It =
also
> makes missing KDIR silently skipped when building in permissive mode.
>
> > diff --git a/tools/testing/selftests/bpf/test_kmods/Makefile b/tools/te=
sting/selftests/bpf/test_kmods/Makefile
> > index 63c4d3f6a12f6..10f202bd0d8c2 100644
> > --- a/tools/testing/selftests/bpf/test_kmods/Makefile
> > +++ b/tools/testing/selftests/bpf/test_kmods/Makefile
> > @@ -1,5 +1,7 @@
> >  TEST_KMOD_DIR :=3D $(realpath $(dir $(abspath $(lastword $(MAKEFILE_LI=
ST)))))
> > -KDIR ?=3D $(abspath $(TEST_KMOD_DIR)/../../../../..)
> > +SRCTREE_KDIR :=3D $(abspath $(TEST_KMOD_DIR)/../../../../..)
> > +KMOD_O :=3D $(or $(O),$(KBUILD_OUTPUT))
>
> Will this break out-of-tree builds if a user passes a relative path?
>
> If a user builds selftests with a relative O=3D path (e.g. make O=3Dout),=
 KMOD_O
> captures this relative string and passes it unaltered to the kernel build
> system via make -C $(KDIR) O=3D$(KMOD_O).
>
> Because make -C changes the working directory to $(KDIR) before evaluatin=
g
> O=3D, the relative path will be evaluated relative to the kernel root rat=
her
> than the directory where make was originally invoked.
>
> [ ... ]
> > @@ -14,8 +16,24 @@ $(foreach m,$(MODULES),$(eval obj-m +=3D $(m:.ko=3D.=
o)))
> >
> >  CFLAGS_bpf_testmod.o =3D -I$(src)
> >
> > +# When BPF_STRICT_BUILD !=3D 0, a missing KDIR is fatal (the default).
> > +# When permissive, skip silently.
> > +PERMISSIVE :=3D $(filter 0,$(BPF_STRICT_BUILD))
> > +
> >  all:
> > -     $(Q)$(MAKE) -C $(KDIR) M=3D$(TEST_KMOD_DIR) modules
> > +ifeq ($(PERMISSIVE),)
> > +     $(Q)$(MAKE) -C $(KDIR) $(if $(KMOD_O),O=3D$(KMOD_O),KBUILD_OUTPUT=
=3D) \
> > +             M=3D$(TEST_KMOD_DIR) modules
>
> [ ... ]
>
> >  clean:
> > -     $(Q)$(MAKE) -C $(KDIR) M=3D$(TEST_KMOD_DIR) clean
> > +ifeq ($(PERMISSIVE),)
> > +     $(Q)$(MAKE) -C $(KDIR) $(if $(KMOD_O),O=3D$(KMOD_O),KBUILD_OUTPUT=
=3D) \
> > +             M=3D$(TEST_KMOD_DIR) clean
>
> Does this unconditionally abort make clean if the kernel source tree is
> unconfigured and distro headers are missing?

I think both issues flagged are valid and need to be addressed.
