Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC8B43D503
	for <sashiko@lists.linux.dev>; Mon, 11 May 2026 16:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778518410; cv=pass; b=llFHuwropfhCUQzidFQwxb6sajBB9y8583IrhYc+fLjojob94KxDx12JT9vC3eS5Uovss2hV9m/kCtBQqF8lCCQ4wqxOFn/q6kzfy164IiGUz2jPiOa/wyyIB7NNtxRpUxMEgurbuJpNV8iPhxXsOcQKPBo6ZswtbOuM8rGa7MI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778518410; c=relaxed/simple;
	bh=WK5T5JfvYsoXwLxh3vVykUD2mRLGy3+mpvWaIBQy8/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KRh/3MsfM+fqg8DJCwoLIBUzHNA9EZmRLq6aaXon8oF3pyZTzLCfJ6vtd5BcOyLbEdi3E5WIues1coFS/p0jbs5fqY2b1L6jZvKSsk4UOzVmni33iPhCAKX9kPGQ9TAOpTJCex7Z88KsstFwrpAhYoBNoLpG4cyQ8/7tH75eFy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X5KH6o5H; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X5KH6o5H"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-367c26471f5so1764579a91.1
        for <sashiko@lists.linux.dev>; Mon, 11 May 2026 09:53:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778518407; cv=none;
        d=google.com; s=arc-20240605;
        b=kNcaxdkQR48aB7E3Q1mo+4+EwV74fqiWpAX4JYwSeas7P6tnIPjZ70enh8L5BZ/30x
         oAcKjMbwcwybERWyDZrIxXq9QZQNK5Kt8jnJ4xrkW2QwYHB3pTekyUXQxN/K+b8kTRmm
         UfKpzVNhCICd4nSvhA5Uf9uSsyDU2kw8kPObk95Q2GJAQoAulmR9Z3XLPjzrfBmlcReC
         jF/fl+mA20gcCuffNIOlY3B4dfdrEnpIidP9bGFfTBgoYTfpe2uFGvEkS7oansAx2+dX
         M0T5JSBLT235uC/Jr9n3lGBBbpE4w0tr6BkZQCvVWhmDRRW/tSY8dUVN+tKJGxeR60rx
         1ADg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pum98GMtwdOZuFVkPRuk8QjOK36LqVQS2DrUcasrMj0=;
        fh=rFkvtcwi5BgoMcGe76VE6iqH0R7YXpwqYb1UDU1M7eQ=;
        b=bt7cm6tNR4ITpIE7e/g4BES4e+XlMdvRt13U1shmQTf5gnvFW5V+TggS3jZpgCfreY
         B2YveFcqTfa52n37O9lGRFrNX6Uu/YCMRNqZQr9HRBGMaCsN06RwRzXjqUD0swO06Q7Z
         bSHhRUmcFAaeSFFo+zFFgE9P5qgJ3it9TRdjueNgneh44FfCYSbokKLpqBhLrsaoUIIn
         /15QCSa6mjn0+D5IgtgiuzNjOQ1rvEZHq+RGvLc3KWdWiAib0TOjtlQeqE3YbVn/smAA
         Io0MraJUD1i1dyrx5PAi2QOtcJrC8iWjkeY0RVo+malG8Gx8Tbnc3chT/Rle2Uu3bW9Y
         i4pQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778518407; x=1779123207; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pum98GMtwdOZuFVkPRuk8QjOK36LqVQS2DrUcasrMj0=;
        b=X5KH6o5Hj1rtMgyGMOxwkGBlfdSkqvfu8vi4eCJYQb/nh1tliSy21PySsLdN+vZQ4Q
         NYawo+WGVWYvyUgEWI9BW6+j1L2xzD+LjpWz0JLvWZ/kkXYtHyBKHzuJ51kLop6optD2
         wHpaaXxmonohqyBJdZI9sYDOhDFRK/QElj6eiNDpINUsA0HsaVb1HSTaLq/ypQ1uU5uN
         D35n2d65Lag5je7cqfUGTN12wcGDM90S0U4bxjQ11dC3dTY63f5OIelfRxZGXqdYfsNo
         zjWbAtYiFzXQO80E5t3K5DAAg8aI6y8hAOHoYjqfk1dfgox9SV5ntZYOylmdx/XVNF9M
         le3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778518407; x=1779123207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pum98GMtwdOZuFVkPRuk8QjOK36LqVQS2DrUcasrMj0=;
        b=ZE301MwNhvMEW9c183aCGkkNF6reNWpd2SkIfhEQfuLCGNOvcmyT3F4NcUE+eFr31o
         zjCsHz+fEQWt4ETl1EZV88eWQWZV5Yq4dv6U0vu6C1H3vzixHPNui/XlBOZgEgiq1RXm
         r3D2ta3rni33MI3EfUUMv6U1IG9rKkmZ/1a27M2jkoLxCmD3HEKaOAZLHLmNroftRqaf
         uNTcsoQNl4LW3D6LMi7K3dDzrDqVmsnpp/UaaLwaEK4EgYzcREbtS1xNF+39z9/NS3d8
         zXb2yyuDx0w+9tENMRc4R7MWu0XeWXIgdoCGkx82wLWMnRYMj7MmjZ+U5ytm1KMxg1vF
         G//A==
X-Gm-Message-State: AOJu0Yxxkadu3RZb92XpU1/z6+F1q83RxjVvTU+RJr0GVg0I9qoNSWSP
	ds+VjTQ6D+/hE/QWnv73lCDRn0XJKU1eOldOk1gqtcswmC9/uG+5ZJOfAUn10VUIEkWV4YZuHbL
	h7gN7FxeOGWF6GeUkh3jIQ+ZcuErw5JLlmA==
X-Gm-Gg: Acq92OGMEQOFtupPcgcdPYMBITl0deWwO4ZiEUkLljttIKosFiSKyVUvgAQg9qjvOXg
	pYgO64nqG9O6XWHNZboTwomn0yP03ywoE4DPIgAN1sF35cmH8WR19NiRIWv6D1RCEuhT5n/OyXb
	r0K1n/w+nZq+pQqQ/ADcuEUkJsoowVDKt4vpHjFaUlijmma8uwLXaYk78EyB0TOYKKQf90UAAs+
	5+YY/R3a683bCw44WKLBe6bOHS0rvHyzAgZjgX37qxeJLuUPVbZNxLT3OrY+9vXadW5tniHbWaW
	rKH/LyGorrfIeGhClNZsItg=
X-Received: by 2002:a17:90b:590f:b0:368:5367:d679 with SMTP id
 98e67ed59e1d1-3685368061emr4750343a91.9.1778518406654; Mon, 11 May 2026
 09:53:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260509003146.976844-1-andrii@kernel.org> <20260509020243.223B1C2BCB0@smtp.kernel.org>
 <CAEf4BzbS0512oBcnPsPKrLiVWtDoevqS1Yvv-DHwCsDX0vANig@mail.gmail.com>
In-Reply-To: <CAEf4BzbS0512oBcnPsPKrLiVWtDoevqS1Yvv-DHwCsDX0vANig@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 11 May 2026 18:53:14 +0200
X-Gm-Features: AVHnY4Lhchp7Sb50uPy0gGXFoX3gjQq3-1IcZFAkpdI-p4Og-OGlBKDCAI9-jP8
Message-ID: <CAEf4BzaLU_VaA7R3fUuPkk9QMF4rLYKKzrr8Z5F2MJJMPb+6qw@mail.gmail.com>
Subject: Re: [PATCH bpf 1/2] uprobes/x86: Fix red zone clobbering in nop5 optimization
To: sashiko@lists.linux.dev
Cc: Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 9:38=E2=80=AFAM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Fri, May 8, 2026 at 7:02=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to consider:
> > - [Critical] `resolve_uprobe_addr()` unconditionally uses `current->mm`=
, causing `is_optimized()` to fail when called from tracer context, which l=
eads to target instruction stream corruption and potential kernel panics.
> > - [High] Exhausting a process's trampoline page slots permanently disab=
les nop5 optimization for that uprobe across the entire system.
> > --
> >
> > commit 2c63c19710be8b050bc0e126d84e52c24209e062
> > Author: Andrii Nakryiko <andrii@kernel.org>
> > Date:   Sat May 9 00:30:56 2026 +0000
> >
> > uprobes/x86: Fix red zone clobbering in nop5 optimization
> >
> > The x86 uprobe nop5 optimization currently replaces a 5-byte NOP at the
> > probe site with a CALL into a uprobe trampoline. This commit changes th=
e
> > optimization to use JMP instead, introducing a trampoline page with slo=
ts
> > to handle register state saving and jumping to the syscall.
> >
> > > diff --git a/arch/x86/kernel/uprobes.c b/arch/x86/kernel/uprobes.c
> > > index ebb1baf1eb1d0..7e1f14200bbbf 100644
> > > --- a/arch/x86/kernel/uprobes.c
> > > +++ b/arch/x86/kernel/uprobes.c
> >
> > [ ... ]
> >
> > > @@ -761,147 +785,153 @@ void arch_uprobe_clear_state(struct mm_struct=
 *mm)
> > [ ... ]
> > > +static bool resolve_uprobe_addr(unsigned long ip, unsigned long *pro=
be_addr)
> > >  {
> > > -     struct vm_area_struct *vma =3D vma_lookup(current->mm, ip);
> > > +     struct uprobes_state *state =3D &current->mm->uprobes_state;
> >
> > Can this cause a NULL pointer dereference or instruction corruption whe=
n
> > executed outside the target task's context?
> >
>
> ...
>
> >
> > Could we pass the correct mm struct down from is_optimized() to
> > resolve_uprobe_addr() instead of relying on current->mm?
>
> yes, good observation, I'll change resolve_uprobe_addr() to accept
> mm_struct directly
>
> >
> > [ ... ]
> >
> > > @@ -1113,8 +1149,9 @@ static int __arch_uprobe_optimize(struct arch_u=
probe *auprobe, struct mm_struct
> > >  {
> > >       struct uprobe_trampoline *tramp;
> > >       struct vm_area_struct *vma;
> > > +     unsigned long slot_vaddr;
> > >       bool new =3D false;
> > > -     int err =3D 0;
> > > +     int slot, err;
> > >
> > >       vma =3D find_vma(mm, vaddr);
> > >       if (!vma)
> > > @@ -1122,8 +1159,17 @@ static int __arch_uprobe_optimize(struct arch_=
uprobe *auprobe, struct mm_struct
> > >       tramp =3D get_uprobe_trampoline(vaddr, &new);
> > >       if (!tramp)
> > >               return -EINVAL;
> > > -     err =3D swbp_optimize(auprobe, vma, vaddr, tramp->vaddr);
> > > -     if (WARN_ON_ONCE(err) && new)
> > > +
> > > +     slot =3D tramp_alloc_slot(tramp, vaddr);
> > > +     if (slot < 0) {
> > > +             if (new)
> > > +                     destroy_uprobe_trampoline(tramp);
> > > +             return slot;
> > > +     }
> >
> > If a process exhausts its trampoline page slots, will this permanently
> > disable the nop5 optimization for this uprobe across the entire system?
> >
> > If get_uprobe_trampoline() returns a reachable trampoline that is compl=
etely
> > full (all 256 slots used), tramp_alloc_slot() returns -ENOSPC. This err=
or
> > propagates up to arch_uprobe_optimize(), which handles failures by sett=
ing
> > the ARCH_UPROBE_FLAG_OPTIMIZE_FAIL bit on auprobe->flags.
> >
> > Since struct arch_uprobe is shared across all processes tracing the sam=
e
> > inode and offset, hitting the 256-slot limit in any single process seem=
s
> > to permanently blacklist the probe from being optimized system-wide for
> > all other processes, even if those processes have completely empty
> > trampolines.
> >
> > Should get_uprobe_trampoline() also check if the trampoline has availab=
le
> > slots before returning it, or can the failure be handled without settin=
g
> > the global failure flag?
>
> It's a trade off. If we don't set ARCH_UPROBE_FLAG_OPTIMIZE_FAIL,
> we'll keep wasting time trying to find and use uprobe trampoline for
> each uprobe execution in that process, which is wasteful. So, given
> this is a performance optimization, I think we'll just live with this.
> The alternative would be a per-mm+per-uprobe extra information, which
> seems like an overkill, so probably a no-go.

We can have per-mm flag inside uprobes_state common to all uprobes,
but that will make reattachment to previously attached uprobe with
allocated slot not work, if I understand correctly.

Jiri, any thoughts or ideas?

>
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509003146.=
976844-1-andrii@kernel.org?part=3D1
