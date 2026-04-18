Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31ED72D839C
	for <sashiko@lists.linux.dev>; Sat, 18 Apr 2026 20:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776544479; cv=pass; b=aQezwax+QmAZNurM00TeUdHdDu6+YnLjzaawfHSIxaEOI5QLHGXD+rX8ftgFC2imJaHlZTJTXffIbd2oNGW/ivqLl2imHfCErZKbG8BT7p++JTEGYpKjsN2tHAh0u+wcCjef9BMnIGaIfKFqD3eiWJzfICUy8J994rLygmwZWA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776544479; c=relaxed/simple;
	bh=zSH61zPq7ho/3oDm6Z623xkw2pZm0YZSEuIlUtQIjPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XntLJJABuPp1Foufsy/bwX5Cd3zyHcZBO2Y2lnfscVmdKiHlA0Pp8k9THTRunA+4kwERlxPKoNcYVhPquGWE8hl5a0PP966EPfDfAl02spR2keKl417RPXG8LyqBk/yYTpgULs6OgJcH/kAk8OI5hksqpyr95vswDuV83i5Wjq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9IeHO/N; arc=pass smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9IeHO/N"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-43eb05b1875so1023552f8f.3
        for <sashiko@lists.linux.dev>; Sat, 18 Apr 2026 13:34:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776544476; cv=none;
        d=google.com; s=arc-20240605;
        b=IaXeynhlUx4+6uPx9ipkSweJTGXGna7TUHnwdiULdrvHgGIzpxQt5ojEZmaF1YygEQ
         1gB7tMGJxagVHMtMzoS+BK20c4fMgZkdGTEc+Nm/nP47SqbfO+coF4puBb23uB+FOi8I
         KuZk1YhhPb3V6X2Y+Aysv00NRovH/rFbjZjBdLsfMaatp5tKMLc5yhqhHDiTVpGDgyS4
         Ae/oCvfuQwbz5/T7GOUPKpkfinnx5Yqu3wlJAyS0f+jJBFtMQntOOn3Zu/S4rbTMTL92
         oDtGfrXJITj0WIM3GR3bd8yLzLUxgJDmoU3BiGLYq1xQ2sl08wU0PE7DCrKA1dZo1t2m
         aHzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JTCAV7gPntav4t0K+c6AM2A4cKKE6i8QjCPAIqEW+7U=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=HF4lcnMNhrgpf+Pc1VDebs243l+o9EhpoxTot/NSYQ+c8NSJua3F3NdnMKCfi7MphG
         V73nZmy0orSmkHVTzBBfs0ujpKMh2AAH3aa1PSsmbDDg21jY5wnedGykW/qK4/h0bQHg
         9oiuUK/6lnqk9QdaUG/7DwJjiBZORArpOuWULCDJeTfeeKBYZps1t/7/MHsdUS0Oun85
         HPJQS+rTXlxl+qZkFtHL0g7zvNUxEp6z+e1yqPs/V/4n3tK6TnTdtY7EgjNesN8lvOK7
         dhssn8dtgzZJ6sGCq71kmaoOZqyk8OdHL6fnWIrlPZ4ZpxtD1+Vovuii4LrkuC3aXSS5
         gU/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776544476; x=1777149276; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTCAV7gPntav4t0K+c6AM2A4cKKE6i8QjCPAIqEW+7U=;
        b=j9IeHO/N91zE+qmN5ujwjTmGFuCFPe+yvjAaz3cQY30M8euHM5B3VWDS8KVACfBF9U
         a1dO/+VfW2MHHLJFy/kzbIUiZ7hd6803evTXw2rVl+YsGJgKokM36FCETfWy08DuBNfZ
         MK0ZJx5H71NG1i/TaWShYkwxzGXeQM2lLuqJ7tQi9g18khTbWYeVR4SJpDqSD919Pkev
         hrIJF+ss8cEb7RIXxbOdYQoM1QOnRr/sN2L/NXjqdhSs6f6tOFIwn389vCafiYloW3GE
         inlML6UAuJetfTH8FKPrhGCcXWIeh9R0ncQoL5CLKB/KW3Edg3/JLP7rNlv9K9i0jxBL
         DYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776544476; x=1777149276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JTCAV7gPntav4t0K+c6AM2A4cKKE6i8QjCPAIqEW+7U=;
        b=tIr9pGaxHrcc+p6B9LuGigKBEygK6FGi84tqdZQG3BXQkVTHpJIQBbIslsanKjEUvl
         02GGtJz6ApooEwd0uKMxPorV28O6e/xsEwpb9Rvk0gYvgGhtN0h+/GwwJcbiTBILf2TV
         Ruzwe6mXeyB4MIcipg9VyPr91MB8+A+hUmzkVmTR3Lj32AwJ2zJKKKwwoqH3B8ILN3Ig
         2zUfb4+T2NXDY71o/GYB1eVGkRZZWpkSHzfwq5CZEss+ueHMaeYBPJlV1yjW0fBibjUN
         Jo0f0CkY77u3L5ZbJVDKVEqIDESM3Bn1h6eA8H8joE/fakzM8U/OCvVVoScsNSTfyKM3
         saaQ==
X-Gm-Message-State: AOJu0YzvsTlHLP3ygXQjkSiRQWLpy5Zhq3MzmTESTfSUouGWmkHz+zsS
	RJGSeCkdUknVarfM+jX6wcykLE8ntZkL5WdNISQjQme5mrAXFq4qmXvGQCJQh58Z1uLsVqviOui
	jMvi/YQp6gFGNIsd5gBJj/tcXs9Gsj6mt+8Uway5W+p08
X-Gm-Gg: AeBDievK8M8ZIfbkzom3WMac13ERcdhUmoiTZb6AddB85oCCOGCvTFP1/8hM2CK8RWu
	tvFXcFq/ETZBzGXpAoD1Bt/SBBo6kWfNkCtzNwRJXveF7tIaZkEhIWO/mRp2ABqb94f0YevLMMG
	QvfWd8YcrhagbUPbRfaF03m2T2XIwQMIWE8P5+UGun2zMFPcpt1nqKP2C9TaNK/Y5KardL3+3XT
	APAXkzcPEqdIBCfw/U8qObDtzbb+1PBV/ngUj5Stk+rWCPGZUztBohcQeztAoIy4D8Z4dat9JB0
	e8LEXfEzsp0LOQlk42piVyP6MgEmZel5Yn9bhQkIQaqOfq7y1xZ6aPTWw9Ossf3n/Ja+YvA4hDR
	uQzzoJmE2Fa9GJK35VRQX5WQPtRNIHfZmlYIhUuznxRHfzmtzL3LB0OKKzVr1sw==
X-Received: by 2002:adf:ffd0:0:b0:43f:e413:f6fd with SMTP id
 ffacd0b85a97d-43fe413f7c0mr8500983f8f.0.1776544476131; Sat, 18 Apr 2026
 13:34:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260418171701.610025-2-memxor@gmail.com> <20260418174214.1A764C19424@smtp.kernel.org>
In-Reply-To: <20260418174214.1A764C19424@smtp.kernel.org>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Sat, 18 Apr 2026 21:33:57 +0100
X-Gm-Features: AQROBzB20kK2f1gVCyqNeNyXIqM0F95-WYuhzW6KxD7p8QcxA1cNf6fVs6DLklM
Message-ID: <CAP01T77ZjTWhHffh42R17xmsVwKkjRD8T2=8MA1TT1Y09GG2+w@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 1/4] bpf: Add support for verifier warning messages
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 18 Apr 2026 at 18:42, <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 2 potential issue(s):
> - [High] Unused static function `warn()` breaks the build and bisection.
> - [High] Disabling log reset completely after a warning leads to log buff=
er explosion and overwrites the warning when combined with `BPF_LOG_LEVEL1`=
.
> --
>
> commit 35e5ff3f696c81863084f9e6fb58225f8242f3e0
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> bpf: Add support for verifier warning messages
>
> This commit adds a mode where log_level 16 can be used to receive warning=
s
> and have an associated log buffer. It introduces a warn function and
> aggregates warnings to decide whether to reset the log.
>
> > Add a warn() macro that emits messages to log
> > buffer without any restrictions, aggregate the warnings emitted, and
>
> This isn't a bug, but the commit message states it adds a warn() macro
> when a static function is actually added.

Will fix.

>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 69d75515ed3f7..8de2a4e5f5de2 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -282,6 +283,20 @@ __printf(2, 3) static void verbose(void *private_d=
ata, const char *fmt, ...)
> >       va_end(args);
> >  }
> >
> > +__printf(2, 3) static void warn(void *private_data, const char *fmt, .=
..)
> > +{
> > +     struct bpf_verifier_env *env =3D private_data;
> > +     va_list args;
> > +
> > +     if (!bpf_verifier_warn_needed(&env->log))
> > +             return;
> > +
> > +     va_start(args, fmt);
> > +     bpf_verifier_vlog(&env->log, fmt, args);
> > +     va_end(args);
> > +     env->warnings =3D true;
> > +}
>
> Is this static function called anywhere in this patch?
>
> Unused static functions trigger a -Wunused-function compiler warning, whi=
ch
> can break builds when CONFIG_WERROR is enabled.

Would just be unnecessary diff noise.

>
> [ ... ]
>
> > @@ -1683,7 +1698,8 @@ static int pop_stack(struct bpf_verifier_env *env=
, int *prev_insn_idx,
> >               if (err)
> >                       return err;
> >       }
> > -     if (pop_log)
> > +     /* Preserve warning output across branch explorations. */
> > +     if (pop_log && !(env->warnings && bpf_verifier_warn_needed(&env->=
log)))
> >               bpf_vlog_reset(&env->log, head->log_pos);
> >       if (insn_idx)
> >               *insn_idx =3D head->insn_idx;
>
> Can this completely disable log resets once a warning is emitted?
>
> If a user requests both standard logging and warning logging, both verbos=
e()
> and warn() will actively write to the log buffer.
>
> If log pruning is permanently disabled after the first warning, will the
> verifier dump the state of every successfully verified instruction into t=
he
> log for all subsequent branch explorations?
>
> Because the log buffer acts as a rotating buffer by default, could this
> flood of output wrap around and overwrite the warning that was meant to b=
e
> preserved?
>
> Would it be better to track the log position of the warning and reset to
> the maximum of head->log_pos and the warning position?

Good point, should probably do this only when log_level =3D=3D 16.

>
> [ ... ]
>
> > @@ -18803,7 +18819,8 @@ static int do_check_common(struct bpf_verifier_=
env *env, int subprog)
> >
> >       ret =3D do_check(env);
> >  out:
> > -     if (!ret && pop_log)
> > +     if (!ret && pop_log &&
> > +         !(env->warnings && bpf_verifier_warn_needed(&env->log)))
> >               bpf_vlog_reset(&env->log, 0);
> >       free_states(env);
> >       return ret;
>
> Could the same log buffer wrapping issue happen here when log resets are
> disabled after a warning?

Likewise, will fix.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260418171701.61=
0025-1-memxor@gmail.com?part=3D1
