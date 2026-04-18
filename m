Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C941E2571C7
	for <sashiko@lists.linux.dev>; Sat, 18 Apr 2026 20:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776544782; cv=pass; b=WvORxtkeVmPFO3H1RiW+UlTuf51DZSXd+bJGBMJzMSHL2RjlXIi2eq+9eNZW+L5l0iDb1lAVIrjdrmPrhycQgeC94Hvep6NTSqhgPNTdwrfqAHagzOSrumqAnx9i+NcSsk+7qiseBOOzMr7v+C4kaZFo+It4yY6OuMQys8L9ruk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776544782; c=relaxed/simple;
	bh=O7jSSckOMonLy+xozcAIybQRnRv0FKN0G1JX+qfr/8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NCy7cUG+fykQrSL4A9egyz90fhwLkpXFjhGVQWgt//+GGYt6haGSlVqcGQGvhtMZFEmmLqPmaq3PbsXs8H7VpUCixZpR29L65vLmaXuTgDk28UxitTTGSCcpmDUFAc8NyJZxgtCZyPGAM7/LwViADzmF2ufTB7PBU2k1HCU5YYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=elel86Vo; arc=pass smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elel86Vo"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-43d0deb7ad5so1386103f8f.2
        for <sashiko@lists.linux.dev>; Sat, 18 Apr 2026 13:39:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776544779; cv=none;
        d=google.com; s=arc-20240605;
        b=kTVX2feUyzA4ST2UeYrJk2komJoiJnzSZTUz9rXbCbgxCQQ2zsEU9gx+r+Rwsx0Lry
         YRXZ0GLL9an4VPc/7veq9BceVHyN+kwvH5DgVZ8HmemZEtF+wwfDC3tiJ9ErEBQQ1/us
         PHFZa9jgaer7hggTCQ5+/QZaN7agRUab/bjHoYOUKFrJdR4G+GYsxNBlOxfDIOcdjjht
         A2OvEDDX9W4eDL9fuVabY0ZvylLsEuci6IIHpkOrkPClxoZ5eZuG9oesqQYH2OdK8iFq
         ovRgOjiE+ztLy0VflsA+Dar1IK4/OgHPIoWfMOytG0gjFRcMJDQcON3peL0glhwsh4Yz
         kXNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O4FQDs/qamdC/a5Shtctq+JV+X2zZ2gGxNGHIOGI/9k=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=Psuel3tWJYJDpS3oXMCIe/Mqb1E28LCxQkkdVsHKGZTX/hTX4Vr5lNfPQ85LyS5dqZ
         3W0VUC2Df+v37FJbZwrKHFS/oGjtzUTwlFaUk5oGXmtXQVREMHh9NgnL3X/ZrzBnTyQ4
         s4yanl89SiiiWO9pszNiLd0tL160bV5i2kT9m1b66iFiEox8Wd3FrdwOhGdVAwwkbLyS
         K4mUXd1up2q2hlqW6a+Gwp2pYl12/o6lupmNZZSwmdAKm1y/WOsGBdzVDX9ZR1l07Yec
         zRHkyuvXcFvler57uni7pLAub3KcUw7a3lenm16eqydtR6HqDVCouULYRywljya58DNJ
         NZHA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776544779; x=1777149579; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4FQDs/qamdC/a5Shtctq+JV+X2zZ2gGxNGHIOGI/9k=;
        b=elel86Vo9wTrJy+rH3cPdiok+e+qB3LwM3p1O9e5f1z8Ze7vO/49ymEr7Psylv5XIo
         7CaBp0uEKUxG0q4P7cG4zzAme/AT/ifDih4K0BYG2DMV269CqnB6IwfpsiFFXCJsdVOo
         bThuvqu+ss/MlheXrAO/loJcywvpzUBQ4SoF+VvmuaEqLiCHtO8V9NH7G9d4IBXNFMR5
         fZg4GvpcIE0b8oQz6S5kzVOeBtViW2qyhBKBdgqrtb1MksilqUI+gpXOIGpfZNDQVp6s
         GXZaqCiUgxM8tVy/GXGKrmGImkyRClJSVdZMcPT4mf0OO+/Ue+mU++mNeOt5nxZmNTeg
         Qqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776544779; x=1777149579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O4FQDs/qamdC/a5Shtctq+JV+X2zZ2gGxNGHIOGI/9k=;
        b=gs7Kd2K4ecliw6FH/sCaibWl/srZ5PJbiVIiqOFee7jBAmFT34IpRwEaTf8ZFNbVTZ
         AJPHiPMzYdAju3S+DRirChw0Dpw1kU6hOxGxNI9P4r+6U6xQCtZbo4Du9WSF53wcHV1z
         aQU8NNuPNv8ZY7pSAUck2ItWoDrLEPLx3Y7r1qFtU2pBSzvOzEbHIkDYYJn2qQIkKHKg
         VWKa2yeBqbgD2Sin9HBZMkrC52UwAIFgBRBEq4mKuBVeUe5nl4QkRffxiRpRikS0Lq2l
         Qypbzl1YNA1DRJST/l8C9ejHdmL3/KLgCbDp6/RzTn7FCBSbsxfeUXtNfdwWYjbjjvM1
         LhvQ==
X-Gm-Message-State: AOJu0YyMxempuB6rE53VQ2Y2CUMu0iPDd6U8bPP+9XmRafg+8JLGRDF8
	COqeZu3dwU6SJWp9YM5EAwk3KcGfTDfUqqEABUib+SLd69jfgwmYm+1FJSWQco3xE2VPmPNp3U4
	XsmSbnF5y6dNoXEdeubPbHorBhxdCGxb2ydVm6o3vdsxo
X-Gm-Gg: AeBDiets+n4yGM139Z6NCPTKvpQfz/XRXwVdODxcbfkHtKiOMr7Mri8uK4GoQXk3Vk7
	HzaNve6HW9r/Fvx7IYQSM2FDyuFdjYBfez+OC/8ojEGlqZw4ps7YhXsFW7K07VZFk/M0sqNmhMT
	lvKTuB0vKYDKyrzk686AM5jvT+NnWx51Ss6+w3EOUciHz1ui+YqzFptP1SXF1soqQA8Ly220kVR
	Fh0lmP5qZdUIvyZ6w643nkM5P3V02jmPbBYvc7zx4/XcWoAZQt5XzY+dn0ApHFntU57FupdwRZK
	2RDZt8mXRG+Oqvf777SM4K4rqatm98JhQicVDDLqSXlvovegrWNBg1UytdebeDK1q4pIX8zlLQL
	uuTiRfaIm/5Qeni4tPWtuxnQ3lakZILMKHxXql1Kr9DJHBLrs39s=
X-Received: by 2002:a05:6000:24c7:b0:43d:740:fb37 with SMTP id
 ffacd0b85a97d-43fe3dfbe4emr11719802f8f.24.1776544778694; Sat, 18 Apr 2026
 13:39:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260418171701.610025-4-memxor@gmail.com> <20260418183505.C472CC19424@smtp.kernel.org>
In-Reply-To: <20260418183505.C472CC19424@smtp.kernel.org>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Sat, 18 Apr 2026 21:38:59 +0100
X-Gm-Features: AQROBzB6SMZ2S6lrMon_R5EKDogFQZq-M437qqtBZ-YPOIMsNYojGUycMEw0UC4
Message-ID: <CAP01T770m0vig=uxJw+GU3_km=dS6ShF2RM2XYrgSp90LxERew@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 3/4] libbpf: Request verifier warnings for
 object loads
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 18 Apr 2026 at 19:35, <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 3 potential issue(s):
> - [High] Valid BPF programs fail to load when a custom log buffer is too =
small to fit warnings.
> - [High] Massive performance and memory regression for valid programs gen=
erating warnings.
> - [Low] Empty debug logs are printed for every successful load without wa=
rnings.
> --
>
> commit ba31f1c82128deb94a4d629517c67a68ad69c567
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
>     libbpf: Request verifier warnings for object loads
>
>     On kernels supporting BPF_LOG_LEVEL_WARN, have libbpf request verifie=
r
>     warnings for BPF object program loads by ORing in the warning bit.  T=
his
>     keeps the existing log_level=3D0 retry semantics for verbose logs, wh=
ile
>     still surfacing verifier warnings for successful loads.
>
>     When libbpf owns the log buffer, use a small buffer for warning-only
>     loads and flush captured warnings through the print callback. Detect
>     support by probing for BPF_FEAT_VERIFIER_WARNINGS in enum bpf_feature=
s,
>     and document the updated kernel_log_level behavior.
>
> > diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> > index 3a80a018fc7d5..c7b00c0976983 100644
> > --- a/tools/lib/bpf/libbpf.c
> > +++ b/tools/lib/bpf/libbpf.c
>
> [ ... ]
>
> > @@ -7936,7 +7940,9 @@ static int bpf_object_load_prog(struct bpf_object=
 *obj, struct bpf_program *prog
> >                       log_buf_size =3D obj->log_size;
> >                       own_log_buf =3D false;
> >               } else {
> > -                     log_buf_size =3D max((size_t)BPF_LOG_BUF_SIZE, lo=
g_buf_size * 2);
> > +                     log_buf_size =3D max(log_level =3D=3D 16 ? warn_l=
og_buf_size :
> > +                                        (size_t)BPF_LOG_BUF_SIZE,
> > +                                        log_buf_size * 2);
> >                       tmp =3D realloc(log_buf, log_buf_size);
>
> If a valid program generates more than 4096 bytes (warn_log_buf_size) of
> warnings, won't the kernel's bpf_vlog_finalize() detect the log truncatio=
n
> and return -ENOSPC, causing bpf_prog_load() to fail?

Good point, will check this corner case.
That said, we only warn once for every kfunc, so it would require 4096
unique kfunc calls.
In any case, will take a look.

>
> [ ... ]
>
> >       ret =3D bpf_prog_load(prog->type, prog_name, license, insns, insn=
s_cnt, &load_attr);
> >       if (ret >=3D 0) {
> > -             if (log_level && own_log_buf) {
> > +             if (log_level =3D=3D 16 && load_attr.log_true_size && own=
_log_buf) {
> > +                     pr_warn("prog '%s': -- BEGIN PROG LOAD WARNINGS -=
-\n%s-- END PROG LOAD WARNINGS --\n",
> > +                             prog->name, log_buf);
> > +             } else if (log_level && own_log_buf) {
>
> If the program loads successfully and generates no warnings, load_attr.lo=
g_true_size
> will be 0. Doesn't this skip the first check and fall through to the else=
-if,
> causing libbpf to unconditionally print an empty debug log for every succ=
essful load?

Hmm, good point, we should strip BPF_LOG_LEVEL_WARN for this test.
We will always set |=3D 16 on newer kernels, otherwise, we keep zero as
the default log level. Thus, the second branch is hit only if the log
level is non-zero.

>
> >                       pr_debug("prog '%s': -- BEGIN PROG LOAD LOG --\n%=
s-- END PROG LOAD LOG --\n",
> >                                prog->name, log_buf);
> >               }
>
> [ ... ]
>
> > @@ -7981,8 +7990,8 @@ static int bpf_object_load_prog(struct bpf_object=
 *obj, struct bpf_program *prog
> >               goto out;
> >       }
> >
> > -     if (log_level =3D=3D 0) {
> > -             log_level =3D 1;
> > +     if (log_level =3D=3D (supports_verifier_warnings ? 16 : 0)) {
> > +             log_level =3D 1 | (supports_verifier_warnings ? 16 : 0);
> >               goto retry_load;
> >       }
>
> If the kernel returns -ENOSPC because the warnings did not fit in the buf=
fer,
> we hit this retry logic and bump log_level to 17 (BPF_LOG_LEVEL1 | BPF_LO=
G_LEVEL_WARN).
>
> If the user provided a custom log buffer (own_log_buf =3D=3D false), libb=
pf will not
> resize it before retrying. Won't the second attempt also fail with -ENOSP=
C,
> causing a valid program to fail to load simply because its warnings didn'=
t fit
> the custom buffer?
>
> Additionally, if own_log_buf =3D=3D true and we failed because the warnin=
gs exceeded
> the initial 4096-byte buffer, retrying with log_level =3D 17 will allocat=
e a 16MB
> buffer and trigger a full instruction-by-instruction verification trace. =
Won't
> this cause a massive CPU and memory regression just to load a valid progr=
am?

Sounds similar to the case earlier, I will study it while addressing that.


>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260418171701.61=
0025-1-memxor@gmail.com?part=3D3
