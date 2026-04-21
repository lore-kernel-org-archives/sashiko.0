Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370FE35A938
	for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 20:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776803402; cv=pass; b=q3OM0jfqi8SzBo89D2oAJ6xE2zhcuQfqoYzVK1qxpZSdQgGR+tmtjiwKx88IZNeF1Eg8UgYPQEd5m5oVK4HXui2/3pUoM3qGdndnT37G7rrCrKJ2zaJHwoNFh+1rODSxDjuWpn2JYCbbar8F9xmN7e63fSEJGxkJ4XUv/6cgycE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776803402; c=relaxed/simple;
	bh=1PWI3WWDiD11dCdku5DMvyC6Wz/XRvR3qkp7NACXhxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bmjFhSI+C5HG1e4v8bx1+5YnfqUjYWAbLDAksOnsxb1W4oQu5nqRRTOyc+qrmY0/baKugZduMJu/7mNSUqwCN4VwfU6vToKup7JHcO6DLlbn47cLzIF/xhK1iozNo8lxyYvXy4YxBd56OKRrG3mcNSjagwuxm2eRSBhhW7F35vs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CUxDpnk6; arc=pass smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUxDpnk6"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so11194035e9.0
        for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 13:30:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776803399; cv=none;
        d=google.com; s=arc-20240605;
        b=hdYak5O+MvmJzxF8lhYgTBHfDWwhTEdgd2t48pX8S2ka4hZ97QKnV8bYpe2Q2CN8Nj
         gurqJWuzKfjlxHaax2qzOyv7QpM1og+k4Gc6UDWrxXPaYZATAsw+C0/Pn+SJyolAN5/c
         UcR7iRlkXeMPHPg2lw+5eicGkKqxccbYfciqleAyPBS/IiDLAMeUFDVFLbhs1wN5ttaq
         8F1/f+PqwzL3fd5sWjkTaC7I/9+IzDgkInGkr1cnNYd/j1PR4Ev1ViPvVAf4XCuVBqaG
         TxDJpqG2r7zVQTV14UpPt7BG4KtIPODyRVlC1b4edpG7h9X3I9gkWLlgb5UgLL0mSI54
         TUeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=99MPOIYc8QZM+lDX2U1YrxVffHKZ9TWe93T8J1RuSaQ=;
        fh=PKE3WuU4Yr1ziZzvoTbWYTY9qUD/gYkwEQ0cgoGUHRI=;
        b=Qm/T8dmXTLPn6Qdc2mAlpu7M+3KM8Ds6NvgaGYMFXp9UnTmD4QN62QALVidcyBmXnO
         BOmMvbOhl2ouaB3vN+2t818wP52vgXJEuvoJPN7oXnfEJ4RlyAJKpK781VCdzQRYr3CH
         cniV4dRK9yiNV7V/1sNHezQBd0cY3onV2tp7ykVC6a6AU2qr1SuDz5G7wBnoGB1TIlr0
         oPQ2FAnUV68X9o853XYwmI2hKgPx3m6NqH6RDr9Raz3WowCLJ7LXFVXOjKqXGIAxDzxw
         y4io4V3CdvymoCD9aJ101mAVuhSsFgueZhL1dGPXY+42u1lL1hRTmN8wQ8cvlzeji5Ia
         iWTg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776803399; x=1777408199; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99MPOIYc8QZM+lDX2U1YrxVffHKZ9TWe93T8J1RuSaQ=;
        b=CUxDpnk6maB5CIAvlKO8zYgDll62Ei11EGWWuLwWmbQOfTdc09T26uTuk+SKSspQN9
         PYmhbNCr36QL6Vfm0oPb3UO9cJSzDe48tiCMW2l0t8/CPgjZizZ9umRzNt7nVWi3fbrv
         BQ3G0sxOR+M4jyqBFTi3PJnwaKmhEm/LrgXsNkifyZFSXLyJYYXIcf0c9r+rNy00lNDl
         DWjY4CYZiUUgmpqcjlbQ8nlokbj9xLWauOazRF2oebueu3ywroEW+2LCMkpEqPAJh5Ai
         WGJ4nEgqvuqwCHHRRH7Pi8Kl6bxX+TBWy4M6ryU0v5VlR0w9ZLROGB+ZgxbgjohyAD/P
         WgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776803399; x=1777408199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=99MPOIYc8QZM+lDX2U1YrxVffHKZ9TWe93T8J1RuSaQ=;
        b=BwWczjXJezgXesSf9GPmTaWZUGveYSS7m1YP6ASWcWcwpydB4vJ9X9g0Jq14v+u0or
         1/fxBGWmhNm4+n3FFSyV7sgKQTcSJa07nkANMPYtEzpSQHiZ3ZoocY41Vy0mi6PgXEcq
         7Gb2VNAbaL+J6J7rG2q4JQaZfO+3+fy75N/KvGejcCdnMYoqUQt1kMK4NCZivwmfc1nm
         rGTGp4Jgs/Iw4Qn1v5IQYhLyMh9UGa4nP5Wi7dajFBHd67v0F+5M6OpvYzC+oTs3me6a
         x1iVx3C5ZEPlt93iJOA1p4LJ6Xst4otoqLHCkPoudlpKaa7m7zVH6R+XzjQsL44GEUHa
         GMwA==
X-Gm-Message-State: AOJu0Ywopcn2BLk5nLL4529VI6Iw31dSzqXa50BDp2istlc0NKN4EJw6
	odx174xkhiq/uOSm1kz6vxsO9fiJJBRZrWOE+pNX24GUbV3eZfinju6Ojmk0usnIspxO7ZfTOHO
	zWYSvUnp8SJwcnMuNPwJulT3x3NPngVA=
X-Gm-Gg: AeBDieubTVMfoiDLe5D1bAMXOSqeNVHnZj7QYWNE8WCC/ndeMLy4ZM5aAfpBCL3xlhC
	Ms971RVWVNNJcvnFVzy/ycl/9P5UzN0OvSMzrIoKcnHm5YRJKgLbxeJsSkMPTLwWw/U8VPFmIYM
	g4/GyKySVOD84Ay7Bqfsd0rK4gdgb0IbOFPpPpYeil2AfNHtAwLq6Sw1YVYdcu9O3yOJIrq18jb
	sep1q+c/+jP1tUwsn3hCxl6Fk9P1hmN4JxNLUFRaVLxcTNT94e/9rfhYPJ3VajROZY/fltk1mGx
	GJ6ipqDHd5p9LYWI1cE9wta/ovM0QC1hdJvcOi0XS1SnJ6+80kGVBvFIam9+ySHOoPWZtKvSYO7
	SPOHYRGp+y52+Gkq8A9BImtptc5reo/av7neGhi2JTRkBkVmbcdDS0JjzxJZIw+cHHnE=
X-Received: by 2002:a05:600c:8587:b0:488:a797:f0ac with SMTP id
 5b1f17b1804b1-488fb7880bdmr194389675e9.28.1776803399095; Tue, 21 Apr 2026
 13:29:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420203306.3107246-2-utilityemal77@gmail.com>
 <20260421010536.17FB1C19425@smtp.kernel.org> <aebef2Mz9fLoChwK@zenbox> <aefSL_kZ8GSbpdfH@zenbox>
In-Reply-To: <aefSL_kZ8GSbpdfH@zenbox>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Tue, 21 Apr 2026 22:29:21 +0200
X-Gm-Features: AQROBzBBg0QA_474lwIZdJH8GCRcZYj5ofZxaZMyZ6HQRPEQuJVnw-QeUoR3rNc
Message-ID: <CAP01T77=cADB+DmuTc2+RMdYKDMjSCaMn16bBRnCgEyuc5GqzA@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: Implement dtor for struct file BTF ID
To: Justin Suess <utilityemal77@gmail.com>
Cc: sashiko@lists.linux.dev, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Apr 2026 at 21:43, Justin Suess <utilityemal77@gmail.com> wrote:
>
> On Mon, Apr 20, 2026 at 10:18:39PM -0400, Justin Suess wrote:
> > On Tue, Apr 21, 2026 at 01:05:35AM +0000, sashiko-bot@kernel.org wrote:
> > > Sashiko AI review found 1 potential issue(s):
> > > - [High] bpf_file_release_dtor() directly calls fput(), which is unsa=
fe in NMI context and can lead to a system deadlock.
> > > --
> > >
> > > commit b9990bf55467191e86e004a62cdb84e6dc71b794
> > > Author: Justin Suess <utilityemal77@gmail.com>
> > >
> > > bpf: Implement dtor for struct file BTF ID
> > >
> > > This commit implements a destructor for struct file, allowing it to b=
e stored
> > > in a BPF map as a referenced kptr. The destructor calls fput() to rel=
ease
> > > the reference.
> > >
> > > > diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> > > > index 2bb60200c2665..ee5ceb82e4f81 100644
> > > > --- a/kernel/bpf/helpers.c
> > > > +++ b/kernel/bpf/helpers.c
> > > [ ... ]
> > > > @@ -2752,6 +2753,13 @@ __bpf_kfunc void bpf_task_release_dtor(void =
*p)
> > > >  }
> > > >  CFI_NOSEAL(bpf_task_release_dtor);
> > > >
> > > > +__bpf_kfunc void bpf_file_release_dtor(void *file)
> > > > +{
> > > > + fput((struct file *)file);
> > > > +}
> > >
> > > Is it safe to call fput() here?
> > >
> > > BPF programs can update or delete map elements from NMI context (for =
example,
> > > in BPF_PROG_TYPE_PERF_EVENT programs), which will synchronously invok=
e this
> > > destructor.
> > >
> > > When fput() is called in an interrupt context, it adds the file to th=
e
> > > delayed_fput_list and calls schedule_delayed_work(). However,
> > > schedule_delayed_work() is not NMI-safe, as it attempts to acquire sp=
inlocks
> > > such as the workqueue pool lock and timer_base->lock.
> > >
> > > If the NMI interrupted a context that already held one of these locks=
, won't
> > > this result in a hard deadlock?
> > >
> > > Would it be better to defer releasing the struct file using an NMI-sa=
fe
> > > mechanism, similar to how other BPF destructors handle this?
> > >
> > BPF_PROG_TYPE_PERF_EVENT allows the kfunc bpf_put_file which also just
> > calls fput().
> >
> > So if calling fput in BPF_PROG_TYPE_PERF_EVENT is safe for
> > bpf_put_file, why would it be unsafe in a dtor running in the same
> > context?
> >
> Disregard.
>
> The AI was partially correct, but my course of investigation revealed a
> real bug / reproducible deadlock in upstream.
>
> In addition to my patch having an NMI unsafe dtor, the existing dtors
> are also unsafe in NMI handlers.
>
> I was able to make a reliable reproducer that deadlocks the kernel with
> the task_struct dtor on upstream (without this patch).
>
> I'll send the full report in a bit.

This is an orthogonal issue, but what you're adding in this set makes
sense to me, but please respin after addressing the nits and some more
tests as Song suggested. Let's continue discussing the issue here in a
separate thread that you began.

pw-bot: cr

>
> Justin
> > > --
> > > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2026042020330=
6.3107246-1-utilityemal77@gmail.com?part=3D1
>
