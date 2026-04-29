Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE8443E483
	for <sashiko@lists.linux.dev>; Wed, 29 Apr 2026 22:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777501113; cv=pass; b=SrZH2+0AQOwMonnMhUgkM7QRgWA5HoRdaugHCWSuvRihRcWY15urV2KluuU3w31D2c7pHpofG1uuxsVEVpYj/aTy53xk0jGVGyjhuuSFxBAJTW+m5ko7NfFzGN2MJcvvypli3gBmk0uxXZ5GS3QDyqINrPxVyQR9jRJrDl53D6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777501113; c=relaxed/simple;
	bh=tYF5ImeKfH0MhfqFqALg1UhDM4+qKe5D6LzI6Qrw3sI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UyNtEputwyzmGr/ggUF+wdorKIykicadT0PH5hY7tFCAxCtz8mSKwkaGwNrEwFKUKQqcwKR92oiNG2tXjnbj52MCqaJJuRVm2PtTCe7ZA/Q/51vZp6r6a5P6UStUOTYxbaqa4v+4m75SLEHt9AMIM2DPG7sVnYB2DuPxXJBWzKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ufiss0om; arc=pass smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ufiss0om"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-43cf8d550bdso254833f8f.0
        for <sashiko@lists.linux.dev>; Wed, 29 Apr 2026 15:18:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777501079; cv=none;
        d=google.com; s=arc-20240605;
        b=KUyWEKjIbMV45hpImeWCdtnEgrMYeDO7iNXvbdq66R7OPJf2kNgpxclTMcNEAwRVNs
         cqfyZODafEk7fqsL431HfiwFKjb2RsBwCgLlT0wcHSY5m3HRKS+WPPrQCL9gEjWuQ48L
         7jqiCX6/fOtqCtBiMeHIENlLRe+zEyTRS7Lu7/8PSW2wYSfcOsM74OvSBb+jm/HesBCp
         lPiKBcaeVdfHxKeJnr7jgoDCevSs/UZMrMq8ri895xZBfPkt7gXi46ibR3hwjC1TmBm4
         Ec/4pvOwwJT2cpqDZaYOdWGIj4ZSJtOw/zV99UHDl0X/NOfqC3wLbOlUkgiNV6J0DqyE
         cuuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=U2h3VezLsp5DKwP85IUlxsYIWmkmTvnb6c5O+N8gFCw=;
        fh=LoD9UWPGP7y1DlatwJoYobykvN8P8/KNFynZv0yv/3E=;
        b=hKpT34ZpsOJ4qIZFqLgIgfriCTx1+GuHs1ytFmtOgkRMj2SqOdHnaXpXpKqgPVSABU
         xnjL2IaVZtnQbVpVBD9dqGE4NwoZX9NdVLNFenOIUgykrV7rWKzeTDoefm2zY0tJ9NtR
         Pl+VFhTXbSeYlJhf5vQaZEb/lg33DnHN5yvi/txdl0JSzLM90Ea5SVTQHGsuVWtzImPq
         8WE0WdlaGQ+oOHg9EaN5coYO1m0n0XRvOprX5Az3EWuS7GSPe4btBL71KGJoJxEzWsLa
         S519MruQkfcTjGtmI45X1FXUj2AGc6ajHgphIMBa6e8ECh2a774PSCPXYUb2a1OEZpxf
         bN+Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777501079; x=1778105879; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U2h3VezLsp5DKwP85IUlxsYIWmkmTvnb6c5O+N8gFCw=;
        b=Ufiss0omd39ZGxJpGIap81AO3Vw5gy44QRmRzfIA1Ld2jRZBJLyyCMwQCO52uUuSeH
         YDp0D1+GrgoT9EmvgLGJqlH0d8nTHhOD069h7uyJk2sx9HKj7VQgXf5Il9Nq9GQRwdiv
         vbXXCNEcujHOYXPGb6fkBxZ1i/IvOTpZuKO0UPnnhmmm98nZ4PE9Zu1YKOAZQydMB5kq
         D/9tyFVcL5ppcWshMVJDi5GSbh7nuoPPgzw3zBc8MWB58YCIPJKUNYPY+NFjkIWoGpXK
         cs60Z96KTc3Yl9ncN07NF3yqWFtHgNXFq425COni1PmIH38oyHBQqUu/Y1jRkDL8a4xq
         PeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777501079; x=1778105879;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2h3VezLsp5DKwP85IUlxsYIWmkmTvnb6c5O+N8gFCw=;
        b=owGSAyMSBCeToYcjk+VRh1Hq0EZ9E6OqbNAzLgWkPyNhG+j/s1i3xofGeNV0sHi7cr
         8fvq7Ybtidd2OD7JIk3Oh+2omPevZlskNwchRVo7EVy1/x7ittMhMKUGaawsPO6ciuzL
         DF3bZhGeVh+gR56digIBNkmRPHP9gnxF+yLOYLYAkU5VEFaabXqM2wekbgJX4mQlyECf
         UFCjU9lat/WPWkbaKwdLavPf3eEtbgX9NMbsBVgxleHrXFhxhIb4nQ97Rdy4mDXYL07Y
         MKw7cBe/OhBlM9g4qfUfA9uUxrhzKOYSLk64iBwxygFZKlW49wikey3AmdQP7Leiorz5
         w8oQ==
X-Gm-Message-State: AOJu0Yx2suXUlKEkr2UFQfRaXOMlIqWbpX2iBL5wmImsuQMfOqXqrnRj
	Bp+ji6IifeIQRvIWhYNe8q7IxJedShKzGmaP1zyBCcUKl1YNRK5ScqHShcB/FqZeZ4k+Q7OULoN
	gv+BA5ZLhQv+hoxRSF2sIExjTUZ+M1VfC6Ory
X-Gm-Gg: AeBDietzVjd6KdjDWWwFDk14IE8A4ogQf9sE2su6B0G27GQfyixUf3ZqVuI4npvAmH2
	Y+GcF47y0ImXkHZXN+XosxIzqsM8/48+Slpz2oBIebxDgfX6FQwR2SIQR6AvTaR7DVhULcWQFA6
	+2Fn2qiFZhlsKO3vOLlwfjOHrtzdc9JCtDmGMKF6HJ/wsGVM27xhm0bAnX/PYfsZcKW5uElkBN1
	36sf24Jmb+MP0two4DU15GX/7x8lYo5g0em8sQcK7XKE02p0ws/hbkwu+tiseUjFaGIEfbwea7x
	4KWjOz357MRBpnup8eMfz1qS+qOnkx6zZiQtVwclE/OM0MXfFCBlg7BWSA5PtnMEuqFOQzm7/tQ
	Z//flPqJy7wS7ddrDBETGSSvB9lHMXNAwtqJ25FyEVktFYQlOz54YZA5+xydWIwPK2FV2
X-Received: by 2002:a05:6000:1869:b0:43d:69ff:6898 with SMTP id
 ffacd0b85a97d-4493d7fa267mr276743f8f.9.1777501079154; Wed, 29 Apr 2026
 15:17:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <5c3514dbc879f22ba3f9eff8a2c730e13bd0572c.1777388107.git.paul.chaignon@gmail.com>
 <20260428230844.EFA64C2BCAF@smtp.kernel.org> <DI56ZVH6HKDK.1L8J5HPA37J09@gmail.com>
 <DI578ZDDKR6K.QH52KXPV1CLN@gmail.com> <afIPMllq5VI-bJLY@mail.gmail.com> <afIphKy2138OC5GR@mail.gmail.com>
In-Reply-To: <afIphKy2138OC5GR@mail.gmail.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Thu, 30 Apr 2026 00:17:22 +0200
X-Gm-Features: AVHnY4KrtM4V07tNGQMH1e-9IWZnb87S9yAPWfWBWf463BF_kxL9uAQjccpYRzs
Message-ID: <CAP01T74Vk3+udUbt5scHNuudje9ArOatSARQdkbhtFw7E7nJLg@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: Print breakdown of insns processed by subprogs
To: Paul Chaignon <paul.chaignon@gmail.com>
Cc: sashiko@lists.linux.dev, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Apr 2026 at 17:53, Paul Chaignon <paul.chaignon@gmail.com> wrote:
>
> On Wed, Apr 29, 2026 at 04:01:25PM +0200, Paul Chaignon wrote:
> > On Wed, Apr 29, 2026 at 02:07:33AM +0200, Kumar Kartikeya Dwivedi wrote:
> > > On Wed Apr 29, 2026 at 1:55 AM CEST, Kumar Kartikeya Dwivedi wrote:
> > > > On Wed Apr 29, 2026 at 1:08 AM CEST, sashiko-bot wrote:
> > > >> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > >> - [High] Out-of-bounds read in `bpf_subprog_is_global()` when printing verification stats for programs with hidden subprograms.
> > > >> --
> > > >>
> > > >> commit 08128f883e58301e0f97b1d4a94656be63b8f790
> > > >> Author: Paul Chaignon <paul.chaignon@gmail.com>
> > > >>
> > > >> bpf: Print breakdown of insns processed by subprogs
> > > >>
> > > >> This patch tracks the number of instructions processed by each global
> > > >> function (subprog) during BPF verification. It then reports this
> > > >> breakdown in the verifier logs under BPF_LOG_STATS.
> > > >>
> > > >>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > > >>> index 03f9e16c2abe..b48389b48eb6 100644
> > > >>> --- a/kernel/bpf/verifier.c
> > > >>> +++ b/kernel/bpf/verifier.c
> > > >>
> > > >> [ ... ]
> > > >>
> > > >>> @@ -18288,6 +18295,13 @@ static void print_verification_stats(struct bpf_verifier_env *env)
> > > >>>                                 verbose(env, "+");
> > > >>>                 }
> > > >>>                 verbose(env, "\n");
> > > >>> +               verbose(env, "insns processed %d", env->subprog_info[0].insn_processed);
> > > >>> +               for (i = 1; i < env->subprog_cnt; i++) {
> > > >>> +                       if (!bpf_subprog_is_global(env, i))
> > > >>
> > > >> Could this introduce a regression due to an out-of-bounds read on the
> > > >> func_info_aux array if there are hidden subprograms?
> > > >>
> > > >> At load time, if BTF is present, env->prog->aux->func_info_aux is allocated
> > > >> with exactly func_info_cnt elements, and env->subprog_cnt initially matches
> > > >> func_info_cnt.
> > > >>
> > > >> During verification, if a feature like bpf_throw is used without an explicit
> > > >> callback, add_hidden_subprog() is called which increments env->subprog_cnt
> > > >> but does not resize the func_info_aux array.
> > > >>
> > > >> Since this loop iterates up to the updated env->subprog_cnt, when i reaches
> > > >> the index of a hidden subprogram, bpf_subprog_is_global() will access
> > > >> aux[i].linkage where i >= func_info_cnt:
> > > >>
> > > >> kernel/bpf/verifier.c:bpf_subprog_is_global() {
> > > >>  struct bpf_func_info_aux *aux = env->prog->aux->func_info_aux;
> > > >>
> > > >>  return aux && aux[subprog].linkage == BTF_FUNC_GLOBAL;
> > > >> }
> > > >>
> > > >> Is it possible to skip hidden subprograms here, or limit the check to
> > > >> func_info_cnt?
> > > >
> > > > Don't see it happening, since hidden subprogs never get verified, so we won't
> > > > invoke bpf_subprog_is_global() with such a subprog index.
> > >
> > > Ah, no, stupid me. We get here after fixing up and adding the hidden subprog. So
> > > we can still do OOB since subprog_cnt includes the hidden_subprog_cnt. How about
> > > the following as a fix? I checked over other places where we iterate over all of
> > > the subprogs and those look fine, so instead of changing bpf_subprog_is_global()
> > > we can adjust this function to only consider real subprogs. Didn't compile test.
> >
> > That's a nice find! I also doubted it initially as we have that pattern
> > everywhere.
> >
> > It looks like this would be a fix for commit 335d1c5b5452 ("bpf:
> > Implement support for adding hidden subprogs") (or technically, the next
> > commit as 335d1c5b5452 didn't have any user). So maybe I can resend as a
> > first patch (with you as a co-author) and the following diff (took the
> > opportunity to simplify the logic on the assumption that we always have
> > the main "subprog").
>
> Just saw that subprog_info is statically allocated (contrary to
> func_info_aux) so we wouldn't get an OOB on the existing code, just
> some garbage "+0" on the stack depths.

Yeah, I don't think it was buggy before this, e.g. adjust_btf_func()
explicitly avoids touching func_info for this reason.
Just feel free to fold the diff into your commit and resend, no need
to send a separate change or make me co author.

>
> >
> > Not sure if it would need to be sent to bpf instead of bpf-next. Maybe
> > keep the patchset on bpf-next, but add "Cc: stable@vger.kernel.org"?
>
> [...]
>
