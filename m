Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB3B42EEDA
	for <sashiko@lists.linux.dev>; Mon, 11 May 2026 16:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517502; cv=pass; b=FCTVWn2mXH32zXTG9A2Ujw0KfgPfVRQgEV/YD+Dgem82xCuaG73aoNFxfuMuzuDvun8Hl+q0NDekCLT2g0l9bJknZBOXMlDdvTRzWzBg3E3hVupw0pLU0n5xbMWTbMecITNzYRlodaHbSCNzfk9D6JDh6ExTCrTDc65QIEEp5K4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517502; c=relaxed/simple;
	bh=Qkun2XB8543Jt6EiX1m2Cuzld5FktqIVy1nShMEqOyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N6zdWrPL3R0e/pkW+NhSVUT+vS58ywlgtZ1GDDhVTjB9jQGG0h1Ir8fGcCm7GNUGm5PQPf3LDj7jk1iXgwYThgIq+jPM/mRiAiOB33tWQASt8yEXyjX0YOCLlqjzPmmrB+v4KFQ8izjyJv4yjtSG7RxINzY27tMn87LuRkX8oqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G4U+ks2V; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G4U+ks2V"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c7980c060cfso2027410a12.2
        for <sashiko@lists.linux.dev>; Mon, 11 May 2026 09:38:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778517500; cv=none;
        d=google.com; s=arc-20240605;
        b=jiKEYfn70i7I2PZYcwzoYLcBVQ/bWKrwt1UMhWvuL2W19DOWrq7aXXGi1bc9mX/+2c
         ysj+NX1AZGHe8o//8aKzjSE7UBi0o6RqmZdS4Se4eDdk2FVJ8/zGawNHYrTdWXRyYb3a
         7UVr0k6jrAshnRKUQOAMJ7XF+dY/BtPWKORzI0b+yZnanTtWX7lQFZrZEpJy/TFT4zzD
         9yEOVjHJPbZwtb1gVOTBZk6wUYmdcpfVqawAfwuiLbA4UIE9KE415X42hARt1oySydbt
         T2eg6NyvLLjFBcS8xrf0hw1iSTUos1WClvK9RZ8L939JBa7q7vIwBnBEVFT12wCeKVs+
         xLlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jWZm/pn4FsyWFvcjyRMSpyt5xAcwS65Tr7Uc4rQ3R4I=;
        fh=rFkvtcwi5BgoMcGe76VE6iqH0R7YXpwqYb1UDU1M7eQ=;
        b=epYOJQ1e5aJVNiRbfYv3iAKbCA+KZ274KiyL0kkgIwruIxUV9INZUCYEljCb1HOOWR
         ymF2b1nqRFxwyD2T69oCW8g9geLoWM4SprcJji4fy+wxMZ0erxvAAmteRuKXPEPTZAfB
         RXhoBJOJnsA2CRfiTMlIa+RFeai6M3KN6cRV8pFGzHIZlRh1HxgZUUmU8BYgSIXWAmrb
         Uv6raAvZN1HutFv6HmP8LYEqi41JYPoAnAFmKhaeKHnP9YO1ViNDedwUBY3wNQw/U+17
         nPgsttyOth++O6yE8lHGyrssHURhDKcyKtsQA7aLdNfOrS3SjPZvzc/CRQgqy6/6xkgj
         7Pgg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778517500; x=1779122300; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWZm/pn4FsyWFvcjyRMSpyt5xAcwS65Tr7Uc4rQ3R4I=;
        b=G4U+ks2VFAkx+1MaGITzgTpJWz4lBeYNgqcqfEzcC2VC1tiSaKKIdhKnwkSHL03ttO
         xJ+k1XLNKDxXvTSufdz391BBB/uUYEwei4yaAjrRMKyM5RLTYZu2bhjoH2WyAR+/SjHL
         RoML/biscW1ut8W44JUqoJwb/98KNVT65bCKoNcB0sJ7KWMiphPtWkXWjy/9tMNKb+XM
         UcmqNtySz/ehJcHhPp/2/T84YWG+bBr5JUoDQqCFLQOwiJdj3xJQK6268xaTYQbnKFPf
         LfFob9Gq6zRVyx5gy170+IIAOIZHB27wsmvPPUxlfmZlF9HUMYHvpSYD9iBLv8JDYHYh
         Zxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778517500; x=1779122300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jWZm/pn4FsyWFvcjyRMSpyt5xAcwS65Tr7Uc4rQ3R4I=;
        b=X+S6cmpKbp27ptcTFuMWNBNJVF7nZOcX8vyhVZmeUeBaHJ57S7bT8bHhbmrKVhysJ3
         7l9k1ZUwZuyWLflIg1V159BcN7Vx86Uc1PzfDjaF0WMz8EIOvEs79LVkIJbTxgUXwx5o
         lygbbDCDu/TXfPWtK5//aCwEpfYQppOXMxmbZ1ZCHdSjQSQArMrvlmrHu7TLR6DU5XlT
         6Fn0f475MZ8VKRYuouDW3cL/dvpoFJYPYp+HCTqAgHTHTzUu8IEH0JKI5wH07hsnBB/S
         8SX9/OdpTeL/wPD3fCM3sUlJiq9oiENh7uUgj9/KxrocJlzx7oAbzQBsoTH230yEZhG1
         GIBw==
X-Gm-Message-State: AOJu0YxRZRBSIPnKI2FejvdFOwxytxH3adGzmjFheM2YmNc3HzT6+M7i
	a4WIu/PUMeF7bGpUwi42LVSjplhk+cr3iKs7T3dnzCaOiabLfbVBjOiRhD6Sy5ortYaU+FPBGxb
	IXmbWobnKUlI1+T19rlNTsLSMdubkYWCae7Nb
X-Gm-Gg: Acq92OFACcyUJlY65Jgp4fy79K+d6LvoCS1XIcvQcjNrS1D4sjbOwuu/S+BogZKtITl
	ik8kevDH+v5heBcA465v+GB7BUiHkgBCkTbi5nKd6YpQP2Vn674UelvpxNbmR+GbD9VE2fgEJOg
	kL3LzurC3RZ/3qwo5ma8nKJ+fOdGsL1UWHJyoztPBA1wbXRDuPZXfr4+iRcPidhp6Cq5Pkpjcxo
	MkCQpm7Z4jn63PrZRe+8eG4QcLAE2dFjs02FlW7rOScrK6hG5JyoTk6+fLtIv9qdQ6Oj8rE6Bz7
	+WpYkR87fg7ipeags2O0eqw=
X-Received: by 2002:a05:6a21:328b:b0:39b:f026:6f8e with SMTP id
 adf61e73a8af0-3aab16eb247mr17743487637.34.1778517499593; Mon, 11 May 2026
 09:38:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260509003146.976844-1-andrii@kernel.org> <20260509020243.223B1C2BCB0@smtp.kernel.org>
In-Reply-To: <20260509020243.223B1C2BCB0@smtp.kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 11 May 2026 18:38:07 +0200
X-Gm-Features: AVHnY4K1PGFzP1mFf471xzd0eIhUEeWHeOaZ86Y8osvuCHJ97l3GMSG-JBfn3Bc
Message-ID: <CAEf4BzbS0512oBcnPsPKrLiVWtDoevqS1Yvv-DHwCsDX0vANig@mail.gmail.com>
Subject: Re: [PATCH bpf 1/2] uprobes/x86: Fix red zone clobbering in nop5 optimization
To: sashiko@lists.linux.dev
Cc: Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 7:02=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Critical] `resolve_uprobe_addr()` unconditionally uses `current->mm`, =
causing `is_optimized()` to fail when called from tracer context, which lea=
ds to target instruction stream corruption and potential kernel panics.
> - [High] Exhausting a process's trampoline page slots permanently disable=
s nop5 optimization for that uprobe across the entire system.
> --
>
> commit 2c63c19710be8b050bc0e126d84e52c24209e062
> Author: Andrii Nakryiko <andrii@kernel.org>
> Date:   Sat May 9 00:30:56 2026 +0000
>
> uprobes/x86: Fix red zone clobbering in nop5 optimization
>
> The x86 uprobe nop5 optimization currently replaces a 5-byte NOP at the
> probe site with a CALL into a uprobe trampoline. This commit changes the
> optimization to use JMP instead, introducing a trampoline page with slots
> to handle register state saving and jumping to the syscall.
>
> > diff --git a/arch/x86/kernel/uprobes.c b/arch/x86/kernel/uprobes.c
> > index ebb1baf1eb1d0..7e1f14200bbbf 100644
> > --- a/arch/x86/kernel/uprobes.c
> > +++ b/arch/x86/kernel/uprobes.c
>
> [ ... ]
>
> > @@ -761,147 +785,153 @@ void arch_uprobe_clear_state(struct mm_struct *=
mm)
> [ ... ]
> > +static bool resolve_uprobe_addr(unsigned long ip, unsigned long *probe=
_addr)
> >  {
> > -     struct vm_area_struct *vma =3D vma_lookup(current->mm, ip);
> > +     struct uprobes_state *state =3D &current->mm->uprobes_state;
>
> Can this cause a NULL pointer dereference or instruction corruption when
> executed outside the target task's context?
>

...

>
> Could we pass the correct mm struct down from is_optimized() to
> resolve_uprobe_addr() instead of relying on current->mm?

yes, good observation, I'll change resolve_uprobe_addr() to accept
mm_struct directly

>
> [ ... ]
>
> > @@ -1113,8 +1149,9 @@ static int __arch_uprobe_optimize(struct arch_upr=
obe *auprobe, struct mm_struct
> >  {
> >       struct uprobe_trampoline *tramp;
> >       struct vm_area_struct *vma;
> > +     unsigned long slot_vaddr;
> >       bool new =3D false;
> > -     int err =3D 0;
> > +     int slot, err;
> >
> >       vma =3D find_vma(mm, vaddr);
> >       if (!vma)
> > @@ -1122,8 +1159,17 @@ static int __arch_uprobe_optimize(struct arch_up=
robe *auprobe, struct mm_struct
> >       tramp =3D get_uprobe_trampoline(vaddr, &new);
> >       if (!tramp)
> >               return -EINVAL;
> > -     err =3D swbp_optimize(auprobe, vma, vaddr, tramp->vaddr);
> > -     if (WARN_ON_ONCE(err) && new)
> > +
> > +     slot =3D tramp_alloc_slot(tramp, vaddr);
> > +     if (slot < 0) {
> > +             if (new)
> > +                     destroy_uprobe_trampoline(tramp);
> > +             return slot;
> > +     }
>
> If a process exhausts its trampoline page slots, will this permanently
> disable the nop5 optimization for this uprobe across the entire system?
>
> If get_uprobe_trampoline() returns a reachable trampoline that is complet=
ely
> full (all 256 slots used), tramp_alloc_slot() returns -ENOSPC. This error
> propagates up to arch_uprobe_optimize(), which handles failures by settin=
g
> the ARCH_UPROBE_FLAG_OPTIMIZE_FAIL bit on auprobe->flags.
>
> Since struct arch_uprobe is shared across all processes tracing the same
> inode and offset, hitting the 256-slot limit in any single process seems
> to permanently blacklist the probe from being optimized system-wide for
> all other processes, even if those processes have completely empty
> trampolines.
>
> Should get_uprobe_trampoline() also check if the trampoline has available
> slots before returning it, or can the failure be handled without setting
> the global failure flag?

It's a trade off. If we don't set ARCH_UPROBE_FLAG_OPTIMIZE_FAIL,
we'll keep wasting time trying to find and use uprobe trampoline for
each uprobe execution in that process, which is wasteful. So, given
this is a performance optimization, I think we'll just live with this.
The alternative would be a per-mm+per-uprobe extra information, which
seems like an overkill, so probably a no-go.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509003146.97=
6844-1-andrii@kernel.org?part=3D1
