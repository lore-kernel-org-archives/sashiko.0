Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF6848A2B3
	for <sashiko@lists.linux.dev>; Thu,  4 Jun 2026 16:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780590270; cv=pass; b=KIrWqppsV5rGe19SVKjXwrMFaqCLevHxoJTbMagi5e532/KhjAIBzKqSpTWEA9sqtAzdCSxqPyRav444WAEzXAa2w9OPvYiAW+5hBlm3AEoKrZ7C11F+4n6kjCLRu/VepxLZzgwB/tKmQ5vHpBF00Mff2aI0VbqDXL+FZA/kQic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780590270; c=relaxed/simple;
	bh=9BbCAufTONp6k0gKDYhIyRorCOfyEnjrJMpO4e5OyaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AbtnQvJCB8McpinEB0khDsdVlFdRL/7mLrkXfmlf7DLvpqZAJUN33EckX2Kf7XuGGqMEEsvKltsMnQ3BI+YMlSK8lbqJp4auTDXhuQzy+EDjfo14cw1LXXtelRRQtjdykxjZBxpNbfeHmrSbyngdXAKvB2+H5khr/Hp2lcEmV3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/DYluh6; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/DYluh6"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so543515f8f.1
        for <sashiko@lists.linux.dev>; Thu, 04 Jun 2026 09:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780590265; cv=none;
        d=google.com; s=arc-20240605;
        b=GvJpFsmHhsJHpafOkVTRZVvOcMv4SZqqzpHsJ0RlJCtl85C7cJcvuE+OXAByN6osfR
         M+6xXpEe/jgB67TLBOYuV8xdMTH5KoJR9yueoMjeCAmRzeXIPzWjWrjo+gl3JO4WaNGY
         Y0xFMIxYMf5jJlG2C8vAtyV/BWx6rtXrrWZ+FNhYLEDaHpT8e2/iTl56yzCQyjQNDFW1
         88zLW6WsnROu/iWZwZo6HvZLgOvMR+6685A+iKknmUko8MjoXNXZWsJoBb66MXdFyfmP
         8QO/Ttu1/H3fZsQJm1srVNeZvvLR2J5Juyq428lxOnp4qJVHtqvSWWRaKYEhMIQhJH5a
         iUAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a4lEt+snPaiqBXfi5ibFtER4qYIR0nIZwhaJTo5Gqco=;
        fh=HlDwSYGQzTs/sWJqUxIHHBCUNjYWyNth/A6xoL/Wdh4=;
        b=Hn1srUx4/jBcpcw5I9NR5b8DjX1qgKMeXmqgaDoJmKTjNSwOGqVCWbLnOn+ihsLD4F
         xoXtmOp/zrw7TSjM6XGQ1Dmbc98erFAwJr0PWb0XHr6KjsQGcItYw+GOO2qElhGh2oQv
         GfbBfgBha1p3aU2wZ3Xaf1NGG011EWnhXBnAN0wGpQ6Rxgz7TbzwKt9eEw+DaYIiGO+2
         YX74B3O4M+Ou2aGBrUzG8o3QFvKwgDb34lzSbqgcrX17q4SBZVTLZY8YgptDC7tPCPzc
         WfACoE9Gu/+7aNWfhCSRlD0KqoQdXcG0wYxhy+VTi5hT/sfZQvTfRHJLSWmW62aYD3XE
         VeDw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780590265; x=1781195065; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4lEt+snPaiqBXfi5ibFtER4qYIR0nIZwhaJTo5Gqco=;
        b=c/DYluh6PPJwFIi8WkmCPZLtT0XtwgcV+0wiyzItc9EfHilRyWZnGB/2JjGRzIg6A8
         bWysLYA/kft/Mhk6hBk1jgmOjU/uwLsFycYiNLU7Pj7xG9Wmedf3q2RpSKg4HfB3oZrT
         p4QTaJD/JWYbEuf0biRPB6KBL8f9tru0uWcbfkc/J3Ny8Fgqq+FDF4nismFMs7xjccqn
         Mt3ZyoAMDS6WqQgDjgV003AY5YsGuE1f3++D7HMTNf4iGiaQsIfZNEcrdYTSXnAG4qch
         GGrQL6G6/eLOeKgzcxD+zPPifFDtAKF/xUGnhNJ6G4jXxoJRDcSZ19P25curs0ObE4az
         bMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780590265; x=1781195065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a4lEt+snPaiqBXfi5ibFtER4qYIR0nIZwhaJTo5Gqco=;
        b=YFPK2LwkB3iIPDrM9Hu7WX0Lbo088pTzuzOmnhMoMInxhtZdd1t6YLNjp6xktMed6I
         G3yQlx+q6RJcvgbECGGt+GFyFyj8xW9Exb/Lo0JTVfmhZ7kTnTzhzbTlIdmO8neX7RU3
         x0i82WFzYnd7bFGxfFqgbgjrZNRtXSngpGwXCZwyTHg+i31PuftYAll/vJeNkV1gVNuz
         uhaYFxII9hYDe3+ERsuXdFJZgijG3nTgYg0w2Gmo7INX96o9YUvLKp+AApyBluEAgmm7
         PFrNEi2r48eKnwwANKZQxEVbyJ+00/KFc72FHgrEPRr3NSmCPxqJ1sqfuwmI0RhSYa2L
         t6gQ==
X-Gm-Message-State: AOJu0YzLwt4KPX6skweRC7Vqjo44tUfrl2en96+Zj4pjB3NRETHw14g0
	n0MboDsydWF2NoCDhBCbK9ZAHMuFWXQJQQH0lwVCKIqlamPxTlp1d/Xr0KdqmezfA7vnvkbIik6
	7uVBJJY5dnmDu5a/z1aePwp/miZY0AnPzKYQg
X-Gm-Gg: Acq92OEGe1MN3O1T4VkRa0hdGoje1+62TDG1SUXSZacBSAabr7ZjWxUb39zqVAkqf+1
	+zykkDkQkIpzcxKfUJhSTidmNa/DwuBarfhvEZZeIPqMR14HHq4zuxqkOGuA3+ETDX35wZ6TcWN
	DRWez4gti8OYDeodZ+hCn78xTmR73ErYtv7vcB110ehKEZoqKDt49armHobKGkSAyl5/wWFOACS
	Wx2ISK80K1TBffDOcaD3ozbVPMlh+yluZry1t0qPn/d0A/N95MhhM78sGyWDWMjKp168VI+QVTL
	PcoFoZoe/wR5tdjB0RQehFh4a9Wn8Iw30e7omcQFy3Y3xyVrFZAm1z09XqhWqrqayeqgJA0tyZs
	UrLDCQKtHTuApI56T5KXjF1btjpS3i3hg9A==
X-Received: by 2002:a05:6000:299c:20b0:460:1223:a044 with SMTP id
 ffacd0b85a97d-46021612545mr10027497f8f.0.1780590264624; Thu, 04 Jun 2026
 09:24:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260413-kasan-v1-2-1a5831230821@bootlin.com> <20260425050557.827F3C2BCB2@smtp.kernel.org>
 <DJ094TM6SLCC.2FU5ZV435P1UK@bootlin.com>
In-Reply-To: <DJ094TM6SLCC.2FU5ZV435P1UK@bootlin.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 4 Jun 2026 09:24:13 -0700
X-Gm-Features: AVVi8Cerra9gLZfjdDMPc-sPd_x4iMjZ6lRtDdyXJ-33JBVXtaVlx7eCj0KWN3g
Message-ID: <CAADnVQ+u=pCMcB1=K_WQ3Ae5ML92of+DA1Z-sKRhHq2KoUJbnw@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 2/8] bpf: mark instructions accessing program stack
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: sashiko@lists.linux.dev, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 5:23=E2=80=AFAM Alexis Lothor=C3=A9
<alexis.lothore@bootlin.com> wrote:
>
> On Sat Apr 25, 2026 at 7:05 AM CEST, sashiko-bot wrote:
>
> [...]
>
> >>  #define LR_FRAMENO_BITS     3
> >>  #define LR_SPI_BITS 6
> > [ ... ]
> >> @@ -6493,6 +6498,8 @@ static int check_mem_access(struct bpf_verifier_=
env *env, int insn_idx, u32 regn
> >>              else
> >>                      err =3D check_stack_write(env, regno, off, size,
> >>                                              value_regno, insn_idx);
> >> +
> >> +            mark_insn_accesses_stack(env, insn_idx);
> >
> > Global subprograms are verified independently of their call sites, and =
pointer
> > arguments are tracked as PTR_TO_MEM rather than PTR_TO_STACK. Inside th=
e
> > subprogram, check_mem_access() evaluates loads and stores under the
> > PTR_TO_MEM branch, which does not invoke mark_insn_accesses_stack().
> >
> > If a BPF caller dynamically passes a pointer to its stack as an argumen=
t to
> > the global subprogram, will the JIT-compiled global subprogram execute =
with
> > KASAN checks enabled for those accesses?
> >
> > Does this erroneously monitor the BPF stack, bypassing the intended
> > suppression mechanism?
>
> After having thought about this one for quite some time, I see no
> simple way to correctly distinguish stack accesses hidden behing a
> PTR_TO_MEM passed to a global subprog, as those are verified separately.
>
> I can either:
> 1. skip PTR_TO_MEM memory instrumentation when we are in global
> subprograms, at the risk of missing instrumentation on passed memory
> accesses that _need_ to be instrumented
> 2. systematically instrument passed PTR_TO_MEM memory accesses in global
> subprog, at the risk of inserting unneeded instrumentation when the
> passed memory comes in fact from caller memory.
>
> I then propose to be conservative and apply 2:  the only downside I can
> think of is that a few alwasy-passing kasan checks will be inserted, but
> we are at least sure not to miss any instrumentation.

Isn't it the other way around? Replacing LDX with asan_load() will
check stack access, but it doesn't have shadow memory behind it?
Or you mean to assume kasan_vmalloc and vmalloced_stack kconfig?
