Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE883F20E8
	for <sashiko@lists.linux.dev>; Thu,  7 May 2026 12:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158385; cv=pass; b=gF1q1y/6tmW6EoppsuXhGRUZKc4quCZPqThc/eCEmvY4dPXYxBLuVJQE3pe57oifi6uUx5s7EqtJ0sJ3ZVIwdCmkQrfwdyuknVa+GRGSKdag24OxMEighsenXV2BjN4DtQyRZ96ABmuE/GZrSSjStdYBQtcuBxnbsIquGamvViM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158385; c=relaxed/simple;
	bh=x82l6NaRoY/SIZgBDU99w/LVd7FiucMtpTcSpiO2/1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J4WmoDS1IrfxpPHC33c+MtH+YKsX8rXnCyRd3LV6tDZTnRcSD+iEtj+Rt/R4zXhRzbYIXH5Dery8q75E92zlW93U0UdbGKPtg6Xsjw6tSDeniQWm9KSJTf/O5zNknT5glX7AP0c+iXAGwYrCR4TYPIsvM4ew7E6RnpdnZ/nKp8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NKOQC1v+; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NKOQC1v+"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-65c6a2158d3so535941d50.3
        for <sashiko@lists.linux.dev>; Thu, 07 May 2026 05:53:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778158381; cv=none;
        d=google.com; s=arc-20240605;
        b=cXn27rJfmgemO/8R/Klms0/czm1OKxdkFAyiP3rhQEVSVATD+LYqUmRIIChgpgOXFc
         th/THs4+pGAYEQG2shGveWMdOIdgofcnVf6Vh/my5QjuqRAIgPSnxBSCOlswmOukMxEl
         dCVBEV0/Y7EXy0oEJnhq8Y9BBINscT6SOhTP1GbN1NQOeYwkhgCdZkWTMtfjDRUx4Z2e
         6XmD/f4fOSPlxFo31dB2JjPFLM8FvDE0n89g89jaDV4QyXJDxgQ0W0yYUc+EgLgwUMPv
         32fEEIyNEHwhlXy0ErWFxgCRGaX+OlWAYqdcmv7y78vjgVUTQxxl4eDP/gl47BK51b9w
         x6OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PrmNq2ynRuCEdYKNPCryM4xNScgxSx9BUckn5/WYdnM=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=RzxwiVSCp/EwOp9TCND6b1qfoBIwxVylxS+2swOMukf07o3dUaNoI5yLYBb4zuYQfh
         xb0R3A0aurPNUoxbY1U+wAU/BnlwelyYdt/nERtnsqdkiTVZW5KaoIHzr1sM3+s2xYjC
         TeLjX/t+qdXOJRkUfV1O4c+uLQcM8yiBLf8n2Fbac/k8Lw+rvnKCifpk3x4Burj2X9P/
         xPm5ONq89qwHMPPBDdi3OCBEzmQN33zAA++oiyxmqoboyDxfkUjOirGrN5uR8VLAB8wk
         V1INbsSyE+hiNMjDsgcj/qR+ldc+M8n1c+T6Tmk+DT1G/UdQVPVa8IYTDLJEXby7w4db
         s/Lw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778158381; x=1778763181; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PrmNq2ynRuCEdYKNPCryM4xNScgxSx9BUckn5/WYdnM=;
        b=NKOQC1v++6iZ74KZJL+BN30G+H+Sauj2pwzFALxqQ5bZfrtQey6kg3EHmw74asxgVh
         c/D3dQMTcpS5CDoHkOMzK5ANZ9BalGv3W0aMHajvztGFXR6AEvP83iPcK+XPIiTw1CWI
         HSw7bg1alyPJrJnVdx8eDtMxszqaWYx0WDuC0iuExXbuxaNvpI7CUHZitTC0n+DkwG/X
         WYfuDiSVXNWQKob4Sv8Qj0915HfCv1EDFoSIu7axf3LwImLwf3NAhLW5XIYdeoJfgcPN
         1s4hVyiJfVdZer1t65Du/w/sdwM4/NoQTnqEVulb3eKyG8vFkZEYxwmRdO7EtvMl4nG1
         txNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778158381; x=1778763181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PrmNq2ynRuCEdYKNPCryM4xNScgxSx9BUckn5/WYdnM=;
        b=Ss5ucmpEtWfHwqrHjFACDOoqh6PNgZQ1+yNs8AZEzwFXoyKQX0kWbmrj+YGlKKBcPj
         HdmMUwo4ez320HTwqreca5XUe3PyziuYVLQBOUXA5i8x3GyQAMk1716Mu7h/tAhKJf0t
         jjLmqsZYmzEiCKVCZTceMZ/cNygpm15EFeix+YDWWw+NcX2Jl6309V9I8hpVqg0Qo2SL
         5kW+slW3fgcl5eKOnmoLcZc0Jw5Gsnr505nBrroiIwATtAt+0f/sFVifMh6H1roMJBTz
         U3mMLN0TdUvR6kt1nbqcXi5PUm3xlx+iIRivG5ZA110+Xjd2MqkH0Uo3Zk6vvyPZwiNJ
         BlFw==
X-Gm-Message-State: AOJu0YzVTjjolxqkoXP4OIHDOPGwiaX9yr/mRQWk9um0t+PCbWUJ9HYy
	HIacqxoymTe3mWe08MPDx6cvH7Ozwjc2JaBbp4STGu+vmHW4plD5PMRmGXywaEP2h5+5m2w9FKf
	ewFotK/F9coVr7dLOaXjnf6JWY4LKAfAaVGL6Gds=
X-Gm-Gg: Acq92OG2qOtPhFdeBT0jg/BnWJtfq/FMPLS2LHxLZ6ki58YqW5vbPvY3rcD/yJ9/OqY
	PUUG2IZ1qqHKq/zfQ6EGxAKw1vdZ51L/7iEfJ/qW4PhjPgKf2NQb8iROH9bDPh9tJCEGcvmZtGz
	/TzebBnwyI030OdWwfNuvN+8qO6CtQcpM0g+x57JVItl1fJiBg2t8mtRw7OUhJU0pCt/XsrqD59
	Hil+Mzlnfzzh2ifWQqxDRNeB70eK8e+KakfIFyHjY1rsmzTWCH5o8OewfrDV3gJz8cyp45QSRrq
	qcqYLUkxFM9lstovuJw=
X-Received: by 2002:a05:690c:8e14:b0:7bd:7c16:170e with SMTP id
 00721157ae682-7bdf5dfcaf5mr71836127b3.22.1778158381112; Thu, 07 May 2026
 05:53:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260506142709.2298255-6-ameryhung@gmail.com> <20260506215438.45B98C2BCB0@smtp.kernel.org>
In-Reply-To: <20260506215438.45B98C2BCB0@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Thu, 7 May 2026 14:52:49 +0200
X-Gm-Features: AVHnY4I8dLh_GNOSbdb9n4dj8p957fKTD6_O6e-_45ZqHDnU2U17zK6YoYBLQic
Message-ID: <CAMB2axO5ubguhhGTVRZ60odvHLHgyc+YggeiD8Fe7KDyP32YfA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 05/12] bpf: Refactor object relationship
 tracking and fix dynptr UAF bug
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 10:54=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] Dynptrs constructed from referenced objects are assigned a `=
parent_id` of 0, breaking cascading invalidation and leading to Use-After-F=
ree.
> --
>
> commit 5c82adaba693d44fcc105cb9d8d86e76a67e2a64
> Author: Amery Hung <ameryhung@gmail.com>
>
> bpf: Refactor object relationship tracking and fix dynptr UAF bug
>
> This commit refactors verifier object relationship tracking by replacing
> the PTR_TO_MEM-specific dynptr_id with a general parent_id in bpf_reg_sta=
te.
> It updates release_reference() to use a DFS approach for cascading
> invalidation when parent objects are freed.
>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> [ ... ]
> > @@ -11804,15 +11810,10 @@ static int check_kfunc_args(struct bpf_verifi=
er_env *env, struct bpf_kfunc_call_
> >                               }
> >
> >                               dynptr_arg_type |=3D (unsigned int)get_dy=
nptr_type_flag(parent_type);
> >                       }
> >
> >                       ret =3D process_dynptr_func(env, reg, argno, insn=
_idx, dynptr_arg_type,
> > -                                               clone_ref_obj_id, &meta=
->dynptr);
> > +                                               meta->ref_obj_id ? meta=
->id : 0, &meta->dynptr);
>
> Does this code assign 0 to the dynptr's parent_id instead of the actual
> parent's ID?

Yes. In this case, the parent is not a referenced object, so tracking
is unnecessary.

While we can track parent_id unconditionally, we should avoid doing it
now until every obj, referenced or not, has an id. Otherwise, it
becomes hard to reason where the parent_id is valid or not.

I will clarify this in parent_id's comment:
parent_id is only tracked when the parent object is referenced or is dynptr=
.

Although for a slice derived from a non-referenced dynptr, we don't
need to track the parent (allowing it to be accessed even when the
dynptr stack slot is destroyed). The slice should be destroyed when
the parent dynptr is destroyed in the dyntpr's mental model.

>
> For referenced objects acquired with PTR_MAYBE_NULL, the BPF program must
> perform a NULL check before passing the pointer to the constructor. Upon =
a
> successful NULL check, the verifier clears reg->id to 0 while preserving
> reg->ref_obj_id.

Not any more. See patch 4. Hence the following comments can be ignored.

>
> Consequently, meta->id appears to be unconditionally 0 when the dynptr is
> constructed here.
>
> When the parent object is subsequently released, the DFS traversal in
> release_reference() searches for descendants matching reg->parent_id =3D=
=3D id.
> Because the dynptr's parent_id was initialized to 0, does this cause the
> dynptr to evade invalidation and remain fully active, leading to a
> use-after-free regression?
>
> Should this pass meta->ref_obj_id instead of meta->id?
>
> >                       if (ret < 0)
> >                               return ret;
> >                       break;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260506142709.22=
98255-1-ameryhung@gmail.com?part=3D5
