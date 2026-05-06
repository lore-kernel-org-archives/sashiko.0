Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE42E451051
	for <sashiko@lists.linux.dev>; Wed,  6 May 2026 12:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778072123; cv=pass; b=iYhFQHBrcalOYajOGuSlXnqMIb+YXfu6S7hoVDuehI/fXRiD0RrDnol491w2PPpsa+XtRm0un4yiSAUXKF3HeNVJD9wMJl3aBGfSmKrcMHjD2kBqAu0D/P6XMzJWF2BslutVcN/K+uHh3/agzjjX3eG1bBCQCXPtRs365JOLi3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778072123; c=relaxed/simple;
	bh=8TJpJxru8Ade5BKDFxSEZFsJc4R/utyuFPVV128Dcmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EoU9YBv11q41FpAJqKjJiHtgQ7oS2kZHJlyOwpBf8o+NhSDw5WvPsXuJr0htSi0E31cRHiP8uCmuff40bEvRaNtYphsMUwadtih6rN8saYrRcqkoSSHfTSnLUVEjyKKwiRhRG+A5k8XrwSkmxi0QSZgSjKpHiNrD4JfF+LPQKAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDYBlMsB; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDYBlMsB"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-393a44854d2so25362661fa.3
        for <sashiko@lists.linux.dev>; Wed, 06 May 2026 05:55:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778072116; cv=none;
        d=google.com; s=arc-20240605;
        b=YoqThruFENZibnFQoK3bWmMfEqGOfSCKYFZXaeylQjtd09d58J9h0UEJLKZzxrlkyK
         jk2bqjqY2fI6C9kPZxzVHBczNnBloeN3WTvgHqaJb7ebyuk7asB5EYpmK+mpiH04NLH4
         a9xEdJF/28WKoqyJIoF6FBASvplqcSI5p3a6ERggquAJbJp6AW7PYCxxT7TkEVfUGgKh
         RRlSKwtrzpkiLXQmHp3Nf6S7ZPMmytXJ+OmCov4sfBmZKcbxuS5s8x0+7CEfUmvSRnoz
         RSbTEkJnlq/QZdWP9XWWwcJ2/2lwcJTRhoV5C4fFxa0TjZvdNEMi98Jh7LiTyyGe8BPw
         IWPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HKcm7qSGID1d7+0fCs/2lQ6KEpi3TnEwsbyagB0V9rA=;
        fh=TehjY1t5eGpLR12A70uh3MyGVP6T186N9ByKaUcxf4Q=;
        b=g6vsjgDZtpt5yVCyKkF3WKWhdKhkZX8Kekaaf3aHLiugFyZ/xC/Fw98PLLG1Og6Uy8
         bg4LnlElGluXE4g41DsUUDC5rGOSXeSZhLyGxcSAISiQRObafdYKMElXtbXN4Vlr6yD3
         HSuUUy+HjvaRzWqYc9YgdV1AZSD0LEu+jOrHE6T9a/RoCTSy3yjkPPdOo0XH9ymZ7805
         6EoO2mExL6IKyf+K6tVNT+dKwBuQmX2JTqe61Ru/wWdQ+Rahz2MolN903aTTZNQyu64f
         UAS6lGjWIYPLou42oAL8aNWkJpLTEv1I7yQgzEW24Z/KW53Et9Bx/ASKj0kHEbAhXrAb
         +U9A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778072116; x=1778676916; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKcm7qSGID1d7+0fCs/2lQ6KEpi3TnEwsbyagB0V9rA=;
        b=hDYBlMsBkMtc+4voVDTIqrR/IpVLItWATamak3SWIaVXekfQhr3t9I7NSUaoCnNMk7
         x8sVBA7NNj/5+YO+hkfuERtSizJk0aOLAZ3O9XYXoTRObXTjDEt4HvH9nAHH3dFN1joa
         kJSb3d5JNGTJMqkKCqUZbkVsA/ksrO+J1jTI/WTJKCsDOD6rCwRA17ThxUmrCgr9OCYd
         sC5St7HmR1rSFkDJrnejQL+wlDebCqj0mmOJOatp2NJChs8oH6vzZ4k1LGtt+sgEwVE7
         +8N8cNlMPKegEtF8rjEuhQJ2D8wF+0hI1GQruNGd0TJEAKFV8pI/4q9grQtzpTuACGep
         ja7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778072116; x=1778676916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HKcm7qSGID1d7+0fCs/2lQ6KEpi3TnEwsbyagB0V9rA=;
        b=qpgwmXyLx5rB7BvwdUN0CjO9TUp1MNX6z+PyiL/9qRLKhRv5SGndn9E1/YdpDXk1eX
         FoSJyPAdN2uWf+e//SYE/taXV8rIMg65afIR7/G9a/KSUp70qIOqQFne7jOMUxqc/e2A
         N7OeUSgdKZooP/HIkyiHRsIA1NPhLvFbU34HnBHI2k6Sk92KvTBPvmjQd9pNutq36h11
         ea/e8XaWsFV1k9er6JATRHT4mRpJRSW3RE3sipSUGvQvRsniHp7NlSgTcqTJFhLzgLWy
         u2hkOfUIFW5C7MoiwjasiCt9Zag+TdR85E+VXB0uGK5Kg6hQx9TMS6eh3KEN3pzOWPLy
         K47g==
X-Gm-Message-State: AOJu0YxJ1MOH71hT2X9YDb5/FxNWt065Lwn55NMCm9Ogy0npTsccGl/O
	CEaKA38k1Jl+EheRW/GmpoI9Jue3jsZNoNIzBcTmMSg88KxRHVPN5ntdj6lRbkegnB+cT9RL2ni
	9ZVswvUf7e2KPViWtYwsbnmviESLnK5Bc/cBa
X-Gm-Gg: AeBDietbqtAjjpiFhZJQUQsNyNGIWtOi04lev0H1WoNNoDG1BqrwqkFUJy9RKsPWox+
	jnHJD0AB2F7JaNGeTsmcRz6TeNLoRHHaZDdVtRUfJBMg49LuxxUzx0z4QPgp3tcm+8fLtfLrwaU
	rHNDuEiF7dK4WPdUkVR7JfchxhZCWQDB9PImpb6dUkY4nAKcgwPyt0vx3AO/fyzsfnxOJJ1q7Sh
	v+VgtXd8rXi40w03U/A0Y3B+gcitx5JSmC7+Br2PbFUEcLjQqGqVLqiDWrRo8KSlZmL3TtDFmB/
	mKkyjCWNvFFNpCQf
X-Received: by 2002:a2e:9d86:0:b0:38e:7a75:8763 with SMTP id
 38308e7fff4ca-393c41e12b9mr10705851fa.18.1778072115706; Wed, 06 May 2026
 05:55:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260503165024.1526680-3-vernon2gm@gmail.com> <20260503172520.376AAC2BCB4@smtp.kernel.org>
In-Reply-To: <20260503172520.376AAC2BCB4@smtp.kernel.org>
From: Vernon Yang <vernon2gm@gmail.com>
Date: Wed, 6 May 2026 20:55:03 +0800
X-Gm-Features: AVHnY4LN7DcPgfQAMn9z_9QQ6cdKCWiSeJ-qn33sbqiuvSP62RoVofl8dYPVkWY
Message-ID: <CACZaFFOJEBC_yJyprzUsbBzn7Rn6MB60Yi5jwxCm890TgjV4Ow@mail.gmail.com>
Subject: Re: [PATCH 2/4] bpf: add bpf_cgroup_{flush_stats,stall} function
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	"David Hildenbrand (Red Hat)" <david@kernel.org>, "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, inwardvessel@gmail.com, 
	Shakeel Butt <shakeel.butt@linux.dev>, ast@kernel.org, 
	Daniel Borkmann <daniel@iogearbox.net>, surenb@google.com, linux-kernel@vger.kernel.org, 
	linux-mm <linux-mm@kvack.org>, baohua@kernel.org, Lance Yang <lance.yang@linux.dev>, 
	Dev Jain <dev.jain@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Forwarding sashiko review

On Mon, May 4, 2026 at 1:25=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] Missing bounds check on the `states` enum parameter in `bpf_cgro=
up_stall` allows out-of-bounds memory access.
> - [High] Both `bpf_cgroup_stall` and `bpf_cgroup_flush_stats` uncondition=
ally dereference the pointer returned by `cgroup_psi()`, which can be NULL.
> - [High] Compilation fails when `CONFIG_CGROUPS=3Dy` but `CONFIG_PSI=3Dn`=
.
> - [Medium] The `bpf_cgroup_stall` function truncates its 64-bit return va=
lue on 32-bit architectures.
> --
>
> commit 11e75919a882d61e2b11423881cab05305d77c18
> Author: Vernon Yang <yanglincheng@kylinos.cn>
>
> bpf: add bpf_cgroup_{flush_stats,stall} function
>
> Add bpf_cgroup_{flush_stats,stall} function to prepare for the
> subsequent mthp_ext ebpf program.
>
> > diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> > index 2bb60200c266..87f3072adce3 100644
> > --- a/kernel/bpf/helpers.c
> > +++ b/kernel/bpf/helpers.c
>
> [ ... ]
>
> > @@ -2819,6 +2820,32 @@ __bpf_kfunc struct cgroup *bpf_cgroup_from_id(u6=
4 cgid)
> >       return cgrp;
> >  }
> >
> > +/**
> > + * bpf_cgroup_stall - acquire the total stall time of cgroup
> > + * @cgrp: cgroup struct
> > + * @states: psi states
> > + *
> > + * Return the total stall time.
> > + */
> > +__bpf_kfunc unsigned long bpf_cgroup_stall(struct cgroup *cgrp,
> > +                                        enum psi_states states)
>
> Is it possible that div_u64() returns a 64-bit value that gets truncated
> here on 32-bit architectures? Since unsigned long is 32 bits on those
> systems, would changing the return type to u64 prevent the stall time
> from wrapping around?

Yes, I will fix that in the next version. Thanks!

> One more thing regarding the build, what happens when CONFIG_CGROUPS is
> enabled but CONFIG_PSI is disabled? Since struct psi_group might be defin=
ed
> as an empty struct without a total field in include/linux/psi_types.h, an=
d
> cgroup_psi() wouldn't be declared, would it be better to wrap these kfunc=
s
> and their BTF_ID_FLAGS in an #ifdef CONFIG_PSI block?

Indeed, this is a problem. Compared to adding =E2=80=9C#ifdef CONFIG_PSI=E2=
=80=9D, I
prefer adding follow, as it is clearer, Thanks!

diff --git a/include/linux/psi.h b/include/linux/psi.h
index 7b4fd8190810..243dcf97bea4 100644
--- a/include/linux/psi.h
+++ b/include/linux/psi.h
@@ -52,6 +52,10 @@ static inline void psi_memstall_enter(unsigned long
*flags) {}
 static inline void psi_memstall_leave(unsigned long *flags) {}

 #ifdef CONFIG_CGROUPS
+static inline struct psi_group *cgroup_psi(struct cgroup *cgrp)
+{
+       return NULL;
+}
 static inline int psi_cgroup_alloc(struct cgroup *cgrp)

> > +{
> > +     struct psi_group *group =3D cgroup_psi(cgrp);
> > +
> > +     return div_u64(group->total[PSI_AVGS][states], NSEC_PER_MSEC);
>
> Could states be out of bounds here? Since the BPF verifier treats enum
> parameters as unconstrained scalars, a BPF program might pass an arbitrar=
y
> or negative integer. Does this need a runtime bounds check like
> states < 0 || states >=3D NR_PSI_STATES - 1 ?

Good catch, I will fix that in the next version. Thanks!

> Also, is it possible for group to be NULL? If cgroup PSI tracking is
> disabled at runtime via the cgroup_disable=3Dpressure boot parameter,
> cgroup_psi(cgrp) can return NULL for non-root cgroups. Does this derefere=
nce
> of group->total need a NULL check first?

I will fix that in the next version. Thanks!

> > +}
> > +
> > +/**
> > + * bpf_cgroup_flush_stats - Flush cgroup's statistics
> > + * @cgrp: cgroup struct
> > + */
> > +__bpf_kfunc void bpf_cgroup_flush_stats(struct cgroup *cgrp)
> > +{
> > +     struct psi_group *group =3D cgroup_psi(cgrp);
> > +
> > +     psi_group_flush_stats(group);
>
> Similar to bpf_cgroup_stall(), if PSI tracking is disabled, group could
> be NULL here. Since psi_group_flush_stats() might unconditionally acquire
> a mutex, does this code need a NULL check on group to prevent a panic?

I will fix that in the next version. Thanks!

> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260503165024.15=
26680-1-vernon2gm@gmail.com?part=3D2
