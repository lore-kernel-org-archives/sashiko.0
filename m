Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5682D34EEF7
	for <sashiko@lists.linux.dev>; Fri, 17 Apr 2026 14:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776435801; cv=pass; b=G+mVDCFbn5/lz9zue8CiiLZHQmldHq0btjFpXmdg4nbIpoEyKzT0wQCfBMde7SJEapfkzOUpHruC8+imJz7pHo6EigwYZF2tDj47oBjMZL4CpaP0k9ZpVACcEKAZWtRxbU7L6jLJAHcKrdgSc8rLMlqtIAc7xdZA/OXKXhJxcI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776435801; c=relaxed/simple;
	bh=zMzuR/G1qb7Em1PcFkr9hzhqdP2KvoqZqFUlSzMypSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r1HgUrXvsObGvPJQX5SDpthCi8lntrzuX5dggUSGmshmHmRNsbx7N3XECySJB0ABSA9pG/t6t9uFuXY4LN2M4MirRO2dwj+P9MIDA1On4tBb4QCxIkpwg3qbCrPeWsbe8C0gWW5ZMq2z/GzAITvLKYcmAH+zJgDKKFyCXt139bw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HqtlJrtd; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqtlJrtd"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ba36357195bso83539266b.0
        for <sashiko@lists.linux.dev>; Fri, 17 Apr 2026 07:23:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776435798; cv=none;
        d=google.com; s=arc-20240605;
        b=D37Z9n/BxEflgxp4vuWvC7WtyBrJQwm1KrlHfJnHwIVKJirJPQBrpRe3GEdle/kv2D
         3iebKu32SeBu0TFUhyij52QlewSEqvpvePtESD/KQbtbCi0oo4IP/1uVKcwauSozgEpc
         ey2kAEtsYPjVguE5fG75wWhDhoFokFqpMT5G/iVlpHjnyQHnuEsvUiY+0Er+/RdoZBJ/
         gUGEKGI9TefgR/w+pCbalvFgKzx90ylh4eBF2TrVO0hqNOLkDrSSRjKMIWwlxbz/onAI
         38FTOgcOCoP0Li5ZrKepzCRfLIY3kWIlzLN8p2tv3zKDpN4ckS6l/+hwtvla/JzUq4Ns
         opXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qw47YsrmYc75ExdNxla+LXpcLBRU9NbH3e0/WJ1o+vc=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=YYLjXeHNtnEkZ04Z0tjXUC3U6zZCnHhVRJNKmNWe1DR2Ug0d2EX3HYQ9skvLdyrAhH
         y7rsH+QpatUWpqVOaGzJ1HeL+sEfjHenb3KNO8Zcs7ECVKT71m9583A3fz5wheqiJLDM
         tTvs07UaJ++3Nn8DbelNfbwzceJO2qhEHibife4olC/HbtpWNpXVsN/Jch9aTtumNcc2
         WZxzuL4donUSNZjFUS+VvhvJUcvgyPNhBzp6blhZ0y33iGb10if8whRvrzOqLHKvqWGj
         GSrdWdwngP+h1waNAXbvlT7bDpyGYPi4sR9JzvAawSMFmPpQ+rApdnXHjX+G0IuwNqJt
         4FnQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776435798; x=1777040598; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qw47YsrmYc75ExdNxla+LXpcLBRU9NbH3e0/WJ1o+vc=;
        b=HqtlJrtd7U+WjGC4ZFKzB4DTTLiOxuo8xoadXMnOMWQ5SAw/pWF4AAzCprcavNxRuv
         oUM7LK/nFhWLjPVhz0fSFgzQxL1cLuCF6t8R7tUImulAJL22lMYG6x1BvFXmROOc1qJ+
         qW0CyKEAkAROTMTNxolAOUVAgmH/y+1E6xO/zMeFXEShz9gIDbFQMstDqaqNi9xb6S4V
         ZE/DsVZybPDsvrsSFIytkuS2ceFjBxhOB+iNIiwJFuixOYkwXmUdUoh/3VzPyG0G6TN+
         VbpIPCrr7XVnDUXsW0roltnD7BUBFdIqQy5ag1S3cDt5zl+4a6LvkqewTlDBt2VH+f5i
         Xq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776435798; x=1777040598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qw47YsrmYc75ExdNxla+LXpcLBRU9NbH3e0/WJ1o+vc=;
        b=J/RYReBPZOuy/KhdZzDInaUBH4GPgide4Gwwy3agwLEWtTQOu1fCT21ghS/1K/d+DL
         l3lbfZeO7vB7k1CGgXC5seDsmBPMt4wdbIPb2t9YWOSDE/AInSTSr4pc+CYL/+iaYXOQ
         R4apclPd6tymG+NfPa4G0CYNdj08OqVln7AuyS2XKJBLbCMn8LSOKZs/Ve9yb5prkePE
         2t2tQROBjKZbNuS1d4PS+G0GikVfGnch4gKCN0OuHgdjfrEP/IP5r5tGe3avb8gjA6Y/
         VpYJvhn4wsKDHkK24Cr2/E/gn0gs3IVCAXTtk++0E1JuKgkpOGBnM7+sUK7JmVGJamt9
         4UmA==
X-Gm-Message-State: AOJu0YyQHThjQhtctiNU86blIz7ysLBUz5LmoRDYP6ZyDLQGU6jGuox2
	18M1P2k0R+1tG3vgGuOOx08bL1ZOsduKWdx+gNwoYuIctx56r+hDOAiJOHtuOQcBoh2jZzoRkgn
	72KAdj6RPTNll9m9XT1snPyTRCGzX0AesncO0
X-Gm-Gg: AeBDievIAo9N7zRiGP++WNt5n8qyRD5L8p8Gp6XZCyZrcaiG+WmkYaIvoepsPzXzDsu
	+QhXa9Cx/cq5Yz4PPmEB/lk5bEskcJA8+sZlTIqsOlWqUbQ1bCLpSnpOIrkaax4cTByEJVXKogg
	O7BhgkZL5Ad2wy/4O+RAKH8dbzhxpZK5Rwryfua9fAbrAdKo8CXG92PhrSZLATCramEikE+YLDO
	Cj9TpU5lB+poa03lBgOSMI5cly8vObWPXhOcXdElCGZWGNy+gX7vczxkBbNgKwakTBG3sa+doBC
	s3YlXOiXuwdymQ3eIbFbHFsBx/fe13d6dA==
X-Received: by 2002:a17:906:99c2:b0:b98:2d0d:fc00 with SMTP id
 a640c23a62f3a-ba41a250074mr149298166b.24.1776435797970; Fri, 17 Apr 2026
 07:23:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260417103004.3552500-1-puranjay@kernel.org> <20260417112507.A99D7C19425@smtp.kernel.org>
In-Reply-To: <20260417112507.A99D7C19425@smtp.kernel.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Fri, 17 Apr 2026 15:23:02 +0100
X-Gm-Features: AQROBzBjH3Xtlm9dXz-oWmWwzS1lummXpMH-qG1SajuQtitrfYpntJXfyIUKcXg
Message-ID: <CANk7y0hjx36UvPnsdo4cmNaSNZEjmoH+KBHixdr0CA-ncaiw8w@mail.gmail.com>
Subject: Re: [PATCH bpf-next] bpf, arm32: Reject BPF_PSEUDO_CALL in the JIT
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 12:25=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 2 potential issue(s):
> - [High] The patch leaves the memory leak unpatched for BPF programs util=
izing callbacks (BPF_PSEUDO_FUNC).
> - [Low] The patch introduces a C90 'declaration after statement' violatio=
n that will cause build failures on stable backports.
> --
>
> commit 5b49d0ae3429d9aefefa73b4cf12e6c41845458c
> Author: Puranjay Mohan <puranjay@kernel.org>
>
> bpf, arm32: Reject BPF_PSEUDO_CALL in the JIT
>
> The ARM32 BPF JIT does not support subprograms. This patch rejects
> BPF_PSEUDO_CALL early in the JIT to prevent leaking a JIT binary
> allocation during the second pass in bpf_jit_subprogs().
>
> Link: https://lore.kernel.org/bpf/b63e9174-7a3d-4e22-8294-16df07a4af89@pe=
ngutronix.de
>
> > diff --git a/arch/arm/net/bpf_jit_32.c b/arch/arm/net/bpf_jit_32.c
> > index deeb8f292454b..91fef10e88bc4 100644
> > --- a/arch/arm/net/bpf_jit_32.c
> > +++ b/arch/arm/net/bpf_jit_32.c
> > @@ -2047,6 +2047,8 @@ static int build_insn(const struct bpf_insn *insn=
, struct jit_ctx *ctx)
> >       /* function call */
> >       case BPF_JMP | BPF_CALL:
> >       {
> > +             if (insn->src_reg =3D=3D BPF_PSEUDO_CALL)
> > +                     goto notyet;
> >               const s8 *r0 =3D bpf2a32[BPF_REG_0];
> >               const s8 *r1 =3D bpf2a32[BPF_REG_1];
> >               const s8 *r2 =3D bpf2a32[BPF_REG_2];
>
> Will this cause a build failure on older stable branches?
>
> This patch is a bugfix tagged for stable backports, but placing code befo=
re
> declarations violates the -Wdeclaration-after-statement rule enforced in
> kernels before 6.5. Should the check be moved below the local variable
> declarations?
>
> Also, does this leave the memory leak unpatched for programs utilizing
> callbacks like BPF_PSEUDO_FUNC?
>
> When a program uses a callback, the verifier creates a subprogram. During=
 the
> first JIT pass, the ARM32 JIT ignores insn->src_reg and compiles the
> instruction successfully as a 64-bit immediate load.
>
> Because the first pass succeeds, bpf_jit_subprogs() executes its second p=
ass,
> allocates a new binary, overwrites prog->bpf_func, and aborts with -ENOTS=
UPP,
> leaking the first allocation exactly as it did before this patch.
>
> Is an equivalent rejection needed for BPF_PSEUDO_FUNC in the
> BPF_LD | BPF_IMM | BPF_DW handler?

Yes, both reviews are correct, I will fix them in the next version.

Thanks
