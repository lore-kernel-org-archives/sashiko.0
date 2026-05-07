Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CB13EE1E2
	for <sashiko@lists.linux.dev>; Thu,  7 May 2026 13:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778160223; cv=pass; b=CnhvNYt2vTFLB+6zf4f1BnlMPWba4lgb7Tm5wZlk4kBHiG9r4hOOZgmxiLsEDZtSxoBQtryC1e9ptjp4nbc04pDu/zgX4B7xp5VL5R1kB5AS8s6biA2Xbmva62IRFaaMwWqpcvTMRepEKyfZ0PtnULuqUVbFobWDiHBKxMDp0iM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778160223; c=relaxed/simple;
	bh=9Jgm2FO/o1Ngm5CMWr0tKMwtsRN5483k422YkFCi7/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=opGL7GfdjDpFkvA5VXiOcrrq8BdWvlFKGiz3PLFUIxPX/+nCjzMNiL7alkqRmLIzlouFf1sNXHt+Qa0S/IGWbKKUOQFdBQXScnkPG+WE1Z8S3IZOkf98fWv74Ek5OSGfQ4O69erIhmrZ3yAhWgrRZYERF21+XB/3m0vvHSXY2RM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rbI3ZFtX; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rbI3ZFtX"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7b6ae2ea4a1so8055347b3.2
        for <sashiko@lists.linux.dev>; Thu, 07 May 2026 06:23:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778160218; cv=none;
        d=google.com; s=arc-20240605;
        b=KRu3IqXITH3CGFlEVjaShYujkVv5WdVtlP1+SjXB8hQ77Egpz+90QxS8KRbk2flv4z
         xOSOFptqUKkBCaQKtREqQzJodm0pIFQVS0x5HA0T2zSq3YVUEnbJZXp450HmrmK6ZXoo
         EsGxK9s7bEbuCK2nnMfl2EL0xDicCv9H8slzefQKaubXejsBg/LYDlfP2ASszSTeNWkA
         p6JQpgTdbztqo1hNP9Ju8OoKUXSDjSvE+NH9iFOP8shkdC6BbaKleaaUpmSpDZgXmFD/
         ZBjGkd6396ocwAw35a2jeMnBhHpc+iJsrTG0fdwKvL8LSpn16dsg+VuvOsotbsXTbzVy
         0u3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W6smblTfezSJWX6RvWSVUMERv5fpI/QdrqhW+dClZI0=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=L1gMj9eQ+8r9nxmjq1PCZqBB4GibPGBta+GauHgcSELwsEPGbm4bIflKEmcoG0Jyi9
         ZQDKT7GafAATbsodWXI14rmRSvXkJmRywYoWLk+OFaRbh8uMSA3yUWGc8fYhsYF29BIx
         BJNp9UxtLYk4OfuxGHkaIS/UpwoaRdrJ+TPejKNCFZkiqTxAWu/IJLLlxQRSnNpIkh4x
         49NwKyOv8UOcyZif7s4x8WW6Z5MFQUVIfbUv1NAhJWPH0JineklpqqyLQkq8zznAA00Y
         Ul9mzmK20QFmA6e9y3l16SqVQIkAr/toaKs6eyixtwootXbYwyG09tNbPckqAAJ1cQBq
         08dw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778160218; x=1778765018; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6smblTfezSJWX6RvWSVUMERv5fpI/QdrqhW+dClZI0=;
        b=rbI3ZFtX3nyQ61ro26Y1ptr4QtL03k/RALAMAE+xONV0WTf6iJpNmUx7uQ2Pk5UZ3a
         p0bvQ3j6FNHYdWMJkueK0augdcNA/v08INMqVenBAYJ4rA+RTU1MYJwpIsjGNzQqNifc
         pzYtXGVP9LLRn21J0U1sh9G2W4czU11lLTddl4nKhaubi6a9ggDzlte5pd63YOD8wYJB
         vd74ph1YjzNFy/rRIV+aoM5mA40HsUnmwYEyqTXITym6VFR5LivpUpXv5NKIz2S/Zkp2
         it1wzCMaSH/jGyGANRkR/xAuqrHPFoiofew5klTYEeXxtWiQuOC/sT2svBLdxb9R4jAl
         awzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778160218; x=1778765018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W6smblTfezSJWX6RvWSVUMERv5fpI/QdrqhW+dClZI0=;
        b=D6f/MeVapO++sRGqrnkg4qCurBZDJ1ja3aZYnetfGJZTBXu/k63daGUfFynCF5ct7C
         CJL8kvZGArdcpQznG/p55kRrJ/+I7CQ7LWmfMG7m8vrqQQuSAyXABpUfFRvUZgQZafOD
         8Gn9DQS6M5M0KgU4CBq5IbcnvdfDYEesAm+o7dnUd1X+JR2ZH3JVBWGQ87tWd1xLS9ef
         ao5qvmWcWypMFLyqJYWSHfql5t7mIufpnUy+I6G6JUwqez9GiLLAqjq0/XSreds5lbC2
         gRzk3P3Eq6E49f6hctXKIJDnW+SHPEvkohMUkkYN4EsjRAlqcXsZGUYtjhXS4lMmZer3
         RLug==
X-Gm-Message-State: AOJu0YzwhhlOC3mD9UDsb4npGRQgLXAacGBWK/yrEpOcmms8vmPifFwt
	y6Bz7tX+ukKEh4Wq4wZsTdx9vht/CuZeODwaYrHwYbk+zUZQYTbsuTahlrJF68KRfaraIW9SYNe
	PlNJAS90y8gt2cYMbFxp9XkK/dcCmbfYOkocg45zXvQ==
X-Gm-Gg: Acq92OEmGDS896Hm3+OiG+x4BEkuVwvoX9s4unG60pBmgtdyBqsF0+fFgRY6pn7rltS
	teLSAOLeVqE2FucNs5J5O4otJm6d9tTRMIQjcK9lvvvAemiXUJQU2CIw8y58PnPnKaM695yDGM2
	lkehhHMYbgQlxXOwCQkmvDXs78cqtlJY9h/3SOLs1Lu4nFb2JTZw8XotJ3PdksdezmBe81O7xdO
	PPv5TY82/buuc7uMBezweAKsUOkwU9oejh/vLU58FF6AAgFfUJFqqph0M/GiXwIc9COuVr+NDWe
	4Ll6g+0bRYMmp61WRcfkGAaHUTLbwA==
X-Received: by 2002:a05:690c:dd4:b0:7bd:7b55:ebdb with SMTP id
 00721157ae682-7bdf5db91b9mr82957967b3.5.1778160217790; Thu, 07 May 2026
 06:23:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260506142709.2298255-9-ameryhung@gmail.com> <20260506235915.687C5C2BCB0@smtp.kernel.org>
In-Reply-To: <20260506235915.687C5C2BCB0@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Thu, 7 May 2026 15:23:26 +0200
X-Gm-Features: AVHnY4IGekU0O8uTCO6uo7TaWUsiNxKEX4SPGMTBCHCQrpoUs3X0nGFPkKlwMTo
Message-ID: <CAMB2axM9DM+6CD02sr7Qx56V-yp4Mr_=yRebC0PktthNTh227g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 08/12] bpf: Unify release handling for helpers
 and kfuncs
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 7, 2026 at 12:59=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Hardcoding meta->release_regno =3D BPF_REG_1 for KF_RELEASE kfun=
cs creates a Use-After-Free vulnerability for kfuncs releasing non-first ar=
guments.
> - [Medium] Incorrect evaluation of the release_dynptr flag leads to false=
 rejection of valid BPF programs.
> --
>
> commit e0e1bbafcfda45d42ce5635352bc4b69c0d713c6
> Author: Amery Hung <ameryhung@gmail.com>
>
> bpf: Unify release handling for helpers and kfuncs
>
> Introduce release_reg() to consolidate the release logic shared by both
> helpers and kfuncs. The patch determines release_regno from the function
> prototype or metadata before argument checking.
>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 542912c7983f7..e40f09cefa291 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> [ ... ]
> > @@ -9870,37 +9928,11 @@ static int check_helper_call(struct bpf_verifie=
r_env *env, struct bpf_insn *insn
> >       }
> >
> >       if (meta.release_regno) {
> [ ... ]
> > +             struct bpf_reg_state *reg =3D &regs[meta.release_regno];
> > +             bool convert_rcu =3D (func_id =3D=3D BPF_FUNC_kptr_xchg) =
&& in_rcu_cs(env) &&
> > +                                (reg->type & MEM_ALLOC) && (reg->type =
& MEM_PERCPU);
> > +
> > +             err =3D release_reg(env, reg, convert_rcu, !!meta.dynptr.=
ref_obj_id);
> >               if (err)
> >                       return err;
> >       }
>
> Does passing !!meta.dynptr.ref_obj_id as the release_dynptr flag cause va=
lid
> programs to be rejected?
>
> If a kfunc or helper accepts both a normal PTR_TO_BTF_ID to be released a=
nd
> a referenced dynptr as a normal (non-release) argument,
> meta.dynptr.ref_obj_id would be set. This would cause release_reg() to
> mistakenly invoke unmark_stack_slots_dynptr() on the non-dynptr release
> register, returning -EINVAL.
>
> Could the release condition be strictly derived from the argument type of
> the specific release register instead?

No existing helper and kfunc releases a ref_obj that also has another
dynptr argument.

Kfunc already use this check and I choose to make helper align with
kfunc to make it the same without overcomplicating things. In the
future when there is a universal proto for heleprs and kfuncs, we can
check meta->fn->arg_type[release_regno] to make it more robust.

>
> [ ... ]
> > @@ -12083,6 +12107,9 @@ int bpf_fetch_kfunc_arg_meta(struct bpf_verifie=
r_env *env,
> >
> >       meta->kfunc_flags =3D *kfunc.flags;
> >
> > +     if (is_kfunc_release(meta))
> > +             meta->release_regno =3D BPF_REG_1;
> > +
> >       return 0;
> >  }
>
> By unconditionally hardcoding BPF_REG_1 here, could this create a
> use-after-free if a kernel module defines a release kfunc that frees an
> argument other than the first?
>
> If a BPF program passes a dummy referenced object to R1 and the actual
> target object to R2, the verifier might drop the reference for R1 while
> retaining R2, even though the kfunc frees R2 at runtime.
>
> Should we still rely on dynamically discovering the release register base=
d
> on the argument type to avoid this?

If anyone is developing a new kfunc whose ref_obj to be released is
not BPF_REG_1, the verifier should scream "unreleased reference", so
the bug is unlikely to make it into the kernel.

Some reason for this approach: The longterm goal is to remove the
dependency of bpf_reg_state from kfunc proto generation. In this case,
I want to tag OBJ_RELEASE by looking at the proto. This is currently
impossible since we haved enable decl_tag for kfunc arguments yet. I
think hardcode to BPF_REG_1 is a reasonable workaround for now.

If this sounds okay. I will add this temporary constraint to kfuncs.rst.

>
> [ ... ]
> > @@ -12622,13 +12638,7 @@ static int check_kfunc_call(struct bpf_verifie=
r_env *env, struct bpf_insn *insn,
> [ ... ]
> >       if (meta.release_regno) {
> > -             struct bpf_reg_state *reg =3D &regs[meta.release_regno];
> > -
> > -             if (meta.dynptr.ref_obj_id) {
> > -                     err =3D unmark_stack_slots_dynptr(env, reg);
> > -             } else {
> > -                     err =3D release_reference(env, reg->ref_obj_id);
> > -             }
> > +             err =3D release_reg(env, &regs[meta.release_regno], false=
, !!meta.dynptr.ref_obj_id);
> >               if (err)
> >                       return err;
> >       }
>
> Similar to the check_helper_call() case above, does this global dynptr
> metadata check safely handle mixed arguments when releasing registers?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260506142709.22=
98255-1-ameryhung@gmail.com?part=3D8
