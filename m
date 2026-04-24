Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1917438759C
	for <sashiko@lists.linux.dev>; Fri, 24 Apr 2026 22:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777068362; cv=pass; b=OdvOZ6GYvpsz8hCs/X68VFHDE573Ku7X7LxlpTl2PbwRu5n5wtSwdhcvzByDZoDfhwZu2k+8K8ukKGl3eIl2HtK67xpSCbXXjRNsT5MQNpMi4zIT4AQLsm429zXQRLIaWDY8eYAfKDKDUnkiaT1HphRyzyQKuVPY801zEpTXjhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777068362; c=relaxed/simple;
	bh=7gQQ0WbS6BfDp0nY6MJb9pQfWgZ9lXQf8swLrQ9a/AM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UK0pSyNegqYGJguZXW2QQh3+FLi0YN54nX6NaLvOFoducLh0PS/bm6lK/Dl8pW+gxwDCt3T/2UjEHQDsZGXdMWvhyP7lOnARfw623+rgATWNhqxQzpGFC/9d6LXHLBvGhNU8B/sbRi2+vroZkftP9EHgEkyKNhMeL9ZEx6L6ncA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RlNoITOt; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RlNoITOt"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d7badbd7dso4124007f8f.2
        for <sashiko@lists.linux.dev>; Fri, 24 Apr 2026 15:06:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777068359; cv=none;
        d=google.com; s=arc-20240605;
        b=JZG1royE/YydPjQf1IXGjMGU5xeMTAfKd/Yrn+TNCfqHSnCHbXHQZVEALAicy9I8M3
         c6dkx/Q3xBpbdnxdgY+a34/EvJluo/afFZ/x9exSZWAshMdEAt1L96svXU48yl0mYLJo
         +hqPg9EmQQCvtSzHkXkho7KnnFhW8JQnoJphvTE50am/xXpoU2jJW7YYkj0OsVD9pE34
         5kO/qhD3qz7//4BoAXpThYj1PpXqfrV2l6wAUTejxNIlZm01egvYShhCO/uUkkT1bf1W
         oKdwFn3fWkZVgpS+DJNK94ivMicN52IrppYH44juvUmSWQ1aKIIDKvYZEOIyt0DkKfxd
         SeLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r5RElcU3sJmtTmGQf615qTgHo6/2ahPDly8jUC64Wxs=;
        fh=6jAZCwCb0wk0XryB5IsHORzFHzZnUZ44mjzC+X7gNx8=;
        b=ObGycz6hAH+mG0AIo67QM73kdlTBQrAHdBlmg47Gjf0pOUrnE8p4Kzm8LTTBKLuYRh
         PXkWspRbK/1qBobOQq/6jk/2gAIhngvk2E4laBua6fmz7q6SFnUuI8iqKi3/Pq/5YmMD
         /aW7c1eh4WfPpPx52/wkcSMKGFxBBq+D2l8P3iuwZvlyqJ9wGCqrpfCLQlWBDWJYDqmM
         nzP1ZzxFOPeM5p4U+fozN1kInfsiDD52b09laip6xje2qudmwenUxnrzkaYG4TO1eGe4
         +JfReHjjKYGD/NmTDJACCsIC+/3ww7Pq0lzpfHRhcLPhUAuJDfuG7MThoTIMWaAH80gq
         iqPQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777068359; x=1777673159; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5RElcU3sJmtTmGQf615qTgHo6/2ahPDly8jUC64Wxs=;
        b=RlNoITOtw9ZcewwSMnz1VlYDidZwGjb5/YT7UJwmi7e88rgm0zjfZ6Iadw6S/oIL9H
         SmgcDDcCHQHmrdhuM6P0GlWukxeQMhA4QLN/ej5Q3UFKYKp7VQuhdwjWME68ha+QZTWf
         Q87csj0lJ6owHn3WqpV0tU49MZwz7oJetosGSj9Zp/jHXQI9Xj01xdPY2g5SdA3N4p1I
         ov2xce4jkHF8OglXUfpLjevwQCCRSmiPhOtP/382Z5sOLMX0oBE+JaAur6eW34Ub/urk
         lS8a411EnE5DNRYWcyIYeDQv/HaGUIAXO6d8dOiSaGBXcAmS8Fra2s7wyaC5xzac3zV3
         fthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777068359; x=1777673159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r5RElcU3sJmtTmGQf615qTgHo6/2ahPDly8jUC64Wxs=;
        b=aczcnK4dIMw6nDXpBUGIdk0IYSCyvCUfZKdnzu5GKpf3iYcmMV/9uRCgVThE3C2coJ
         HbD+MUPoBN34V6grgt8bT2Qr3KS5tEE24RNN7T9HF/z0JIMMtdzARKhEeECABdeLVASZ
         wbDuuz0XezaVp/fI3AqD/+g4Cd0MybXAZpwfHh5y11LyidRbAa3EJNgHupZoxoRMcJCN
         2sGfewrLt80QJbvQAqlzOaKUdnMBbwiAkXwjV3liRJSBG9syHn9yKHugzVT4gIARySPz
         nc+1c8mth/g8iPpWTamHSqphlNexpSSbEEhNrgDXwC19dqn+HjC2B91w09pZ9MTgHAL2
         MStg==
X-Gm-Message-State: AOJu0Yx+Uj9NTsQ7ScGRhwQxQL5s207sedIEct1nAdOF7mXMbYI8c2Wu
	48f3jwh5ngOTu0tNsG31UPUtZjjUBgDwKWmxWX0aHo7PTDUnIaNV5cy94xsAhuI9URIHn8e1W0d
	4RrdU2pg9x6unT1yJaiZwiG05Pdna1GM=
X-Gm-Gg: AeBDievdJABNIJjYyECfRkfn29ljg51r/+LuBm5SQ7SofJXv4tCZtUwWCXNON2YAp6e
	1EIzkjP09F6Cn+/3fKyhzdrrYPPb14cNL+zpMLEtdB7EUUedJkojXv+RxIJylLZTjw0+P5dRWH9
	qxeV1YQEaDOAHBQkDTnh3AUrkBcUuBhKCCYb9nDearNvmiAlNmZDzZ2b7RrhA4AiKh0xooZJh+x
	AckQIGb0orrgTrKXcalGPGqLS+IdUpJ+GdbZy5PQgXlqA8hh3r5PwQescdA2IrZ9nZ/PQr/B6yo
	9q2DsZBApuebtBHA2IWphXVEpd0CLnCxfFMh0ksOadTY4+d1TJDU+ulACHibAAJQpCaLFgqTRTC
	rknHYWSsSkjEHkXXOV7xkCviCXeck7JkAIKoD
X-Received: by 2002:a5d:64e3:0:b0:43e:aa88:f1a1 with SMTP id
 ffacd0b85a97d-43fe3dfd649mr52383468f8f.30.1777068359361; Fri, 24 Apr 2026
 15:05:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260424192252.695240-2-utilityemal77@gmail.com>
 <20260424195958.AED4EC19425@smtp.kernel.org> <aevOssMWH_Vm9CPG@zenbox>
In-Reply-To: <aevOssMWH_Vm9CPG@zenbox>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 24 Apr 2026 15:05:47 -0700
X-Gm-Features: AQROBzArnv5I2cQAO8z3xS8tXYahE2_qJWz1N6nhxxHXWgkmwfxIdd0w8y8BVa8
Message-ID: <CAADnVQKFtuX48V9Yy88GHGVbQyY30M3b3YBvZ2PmYt_-jbohpQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 1/2] bpf: Implement dtor for struct file BTF ID
To: Justin Suess <utilityemal77@gmail.com>
Cc: sashiko@lists.linux.dev, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 1:12=E2=80=AFPM Justin Suess <utilityemal77@gmail.c=
om> wrote:
>
> On Fri, Apr 24, 2026 at 07:59:57PM +0000, sashiko-bot@kernel.org wrote:
> > Sashiko AI review found 1 potential issue(s):
> > - [High] Calling `fput()` directly from `bpf_file_release_dtor` can lea=
d to a hard deadlock when invoked from NMI context.
> > --
> >
> > commit 6368f91be1fd91bc9cb38d3498f35d279bad04c9
> > Author: Justin Suess <utilityemal77@gmail.com>
> >
> > bpf: Implement dtor for struct file BTF ID
> >
> > This commit implements a destructor for struct file, allowing it to be
> > stored in a map as a referenced kptr. The destructor calls fput to
> > release the reference.
> >
> > > diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> > > index 2bb60200c2665e..ee5ceb82e4f812 100644
> > > --- a/kernel/bpf/helpers.c
> > > +++ b/kernel/bpf/helpers.c
> > [ ... ]
> > > @@ -2752,6 +2753,13 @@ __bpf_kfunc void bpf_task_release_dtor(void *p=
)
> > >  }
> > >  CFI_NOSEAL(bpf_task_release_dtor);
> > >
> > > +__bpf_kfunc void bpf_file_release_dtor(void *file)
> > > +{
> > > +   fput((struct file *)file);
> > > +}
> >
> > Can this cause a deadlock if the destructor is invoked from NMI context=
?
> >
> > If an NMI-context BPF program (such as a perf event tracing program)
> > updates or deletes a map element containing a struct file kptr, the BPF
> > framework will synchronously invoke this destructor to clean up the old
> > kptr.
> >
> > When fput() drops the reference count to zero, it calls
> > __fput_deferred(). Since in_interrupt() evaluates to true in NMI
> > context, __fput_deferred() bypasses task_work_add() and instead calls
> > schedule_delayed_work().
> >
> > This leads to the following call chain:
> >
> > bpf_file_release_dtor()
> >    fput()
> >       __fput_deferred()
> >          schedule_delayed_work()
> >             add_timer()
> >
> > The add_timer() function attempts to acquire the timer_base->lock raw
> > spinlock. If the NMI interrupted a thread that was already holding this
> > lock, the NMI handler will spin indefinitely waiting for it, resulting
> > in a hard deadlock.
> >
> > Would it be safer to defer the fput() operation using an explicitly
> > NMI-safe mechanism like irq_work_queue() to handle arbitrary BPF
> > contexts?
> >
> For (human) reviewer context: The NMI stuff needs to be addressed separat=
ely. [1]
>
> I guess the AI isn't gonna understand but just doing irq_work wouldn't
> be right either as it would break operation ordering for maps and
> fixing it here wouldn't fix the other dtors broken in NMI.
> (cgroup/task_struct)

Will break operation ordering?
What do you mean?

I feel we should fix things first before being subject
to more of these bugs.
Why cannot we defer to irq_work the whole map element if in_nmi
and call all dtors there?
should be a simple fix.
