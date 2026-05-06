Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFB736C588
	for <sashiko@lists.linux.dev>; Wed,  6 May 2026 07:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778051073; cv=pass; b=WJzxuY4Kjn88kIIpmz76GTn3bOCfMuU9qyAt8Id4Yl4IndHoE6TOIBQxOmfw4g+bvCRreDsWSjGUex5KVLoJrkwHnFA5/bHMRzQ36g3CaZM8b8+P0iblAUzIVgsvMri49vUSMVcOI6jrG3N29QeH678S5YIWSC1upGZ2etl7i9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778051073; c=relaxed/simple;
	bh=ssFSspPkI/ZVkAske6pW54q8l5QUCB7qB+KlWa5BVuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QqU/LYmEshbLCF6LuHNAeWq2XXZsdd6ZbNjwncwsTDLPmlpQImQZDIsvp2OyOLczMOB0oEgxoQNO1S1x4yBt+bjoPvcDgcmr7zjt5Q6+fq13P2KO6DC8Jdwerbfnul8bQAggueANVC9Ty2M3goCj2HeVzQO0wc75eWl982/jeCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eIIhFgSP; arc=pass smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eIIhFgSP"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4303eb92930so3954735fac.3
        for <sashiko@lists.linux.dev>; Wed, 06 May 2026 00:04:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778051071; cv=none;
        d=google.com; s=arc-20240605;
        b=EY7jr1v92UWoakBMY+lQSNE9bC0wuEuHdf6afGEUUOkGyIfYBYO2YKlqplzP8cN/0w
         M2Pn3iGo0XckMUNwdvWnpcI7fYGPytf0pXWpr96GO7bhFgwGye9Ev53jfVfUNOcZQ1qG
         zfVr7c2nviFLA6fhmhjENekcvxHkwL8DeN3cku8kchcalL8uijJF9iXV5f9hsdLVQlku
         ZnlfKER+YOFdQUgDhbVeo/G/QS8w7rT9swXjRCZGnmZfcUniHhKFQp2kvTUztx58dZHw
         12RPnP4yaK3ryvM2cqxqAnCT51/ny7AoEpEBAjCNtM/bCWTfI2vqtIo3cQWII3bCPrfw
         E4Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YFgyP3bTzum2n+ShJZRbTnBUvnnZ+xO2mUQjUayQ0co=;
        fh=ER0bWyEs9gghOqCJM7pmKalfPe1nAby6+mlWgUSKgPc=;
        b=YsZHrP6TiS84ryh6azsVgmjbdxBfwbL38IeLdqIromUoAO/1dFYDNyAZazvPGNxytP
         qoKUWanI7JuplRnh6H/OnvqdQmqHlQkWkQrCAjFOjEN2ZucXLNiv5Qqis7rGIWY4fjNR
         y6hC0FKA6EP2xS+acYMYYBbzx0pRmuJKIOgi8zuHX7aAWDVwBgdkKSqd75UKrBMM3tpN
         ZXcbShGYLhOLo9h4ND1ao7MU7prCrvn6wFQWtmde8JLtzIeR8jHudqtbhFdSWvFpOryx
         V8wtjDCg9y2WU/iyDHD20/DnqYQnPBcPxwuFcRiwP0bBtZ0Skp1tqmLfdYp2wMgB+rwN
         bfpw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778051071; x=1778655871; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YFgyP3bTzum2n+ShJZRbTnBUvnnZ+xO2mUQjUayQ0co=;
        b=eIIhFgSPaIE3GqSq0d7eHh7L+cU1txcAwPY9LfB7/EaqfrRi4I7hVopWpIM6NHD19U
         tSJd4SYgWAmP+XeCV1wpJExTA2n8h7qOqghcZ1b/NTP3DIMiLVJR3tnihzONwkSPamRi
         t1AwHGwIGe/qNOUE4OtbrHPt0V4+I2wfQ/wxFJoXmyFEt+XtJXxsTovdwmHFMvKzRPxy
         lkDcFuurw313SB2NYG2j0+BS9U+3qdRSyDPc7eCxxKXtgUQqVoc/rTRU2OEymxll/n5G
         dK49wJgU0vE7NCpGCw83x5ukFIGYEMqzTFwVEEGnx7dpMB2wu2LSaUc+ZMkaY5m0W+64
         fZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778051071; x=1778655871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFgyP3bTzum2n+ShJZRbTnBUvnnZ+xO2mUQjUayQ0co=;
        b=Tpg+Jq5Pzi/Cf3/Im0TdXfhMxWYTxLTej7tXGf3bxzT5boo0zIjhQogwpzJOOZdKh7
         HSvl0fRiwlmPgsipx8CTLOn+ACGeBlyhDxSZb5sRpuQfrK851hQoPCoJOduthg8uA31J
         9rx72iYMpcVTqiYDYjDf4orIJk7dRGIJxAQA4edYX0KEGHDmq2RG+UhQ5QkWLHZife0i
         dtU2MOQpeZFYdTT7MPoukQ9n2v453Jn7ZdzlTtQbSW0I1sCNGlH1D441osRoznzOXfT/
         vDcgmo+JYS7pGDCDUYCtWzyeKY3upi5G7iCIc4BTA+Jm6mGRSQ8A1lNy7MU3vkElBcpo
         SL+g==
X-Gm-Message-State: AOJu0Yy5r3zFmGTkrdb+UyQVfHiPVMuKKQ8li2Sjo4dIt9n/YiwhPLa2
	Jak2tHvXppVIy3bXhJqEeIMuyqBljc2Ql+dv6Qy0bmBaYeTbqQwzK0c9gjp0iiYPjxwA6A1zgl4
	iNMrTZ8HEdDJaXz7I7bE3F5YyoCX3DJM=
X-Gm-Gg: AeBDievhuJzvzBxObaohh7SiJiUFnMQpF+uOsABy0Pblc9Mb1SCzVS5Qf2Ukb5bncM/
	3H8qjZHNZn1OHUZgb1ZQb0z9jtKYP+DApqsml36ZZzF2/HwTS+FX6I6iASJFCBEpfoXdECJ3BbM
	j3QYLaEFCOHEWbxG1x9kvOE2XX5Mc/EzJTb05uygmXs/lE0QNeRsq0BVEkcDrcJTsyQ7GeyWFcV
	bPGVaAcm82Txj7OazCiOPhdJU6I4tUGWYw1wq4Gw1uoqylzRweVl68eX1QcdAcV9P57azXxTNTv
	DlnPELsyvf5Zt7ZJUOdEAUcb63o=
X-Received: by 2002:a05:6870:56a9:b0:3d9:2fe2:f5c8 with SMTP id
 586e51a60fabf-434f66c4375mr1629496fac.32.1778051070929; Wed, 06 May 2026
 00:04:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260504135138.17050-1-suchitkarunakaran@gmail.com>
 <20260504172338.6FA50C2BCB8@smtp.kernel.org> <afpwnf5VfjxBgIhS@google.com>
In-Reply-To: <afpwnf5VfjxBgIhS@google.com>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Wed, 6 May 2026 12:34:20 +0530
X-Gm-Features: AVHnY4INiEqN-KWsg1sOGfy8sVSRnDlqIQwTNbQlo9Jl86AgtqsiN2NjxhytRD8
Message-ID: <CAO9wTFjS85h8DvgsfifGkaTJUMe=Etqto26pqf+wsgQbgvS+rA@mail.gmail.com>
Subject: Re: [PATCH RESEND] perf/lock: Fix non-atomic max/time and min_time
 updates in contention_data
To: Namhyung Kim <namhyung@kernel.org>
Cc: sashiko@lists.linux.dev, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Namhyung,

On Wed, 6 May 2026 at 04:05, Namhyung Kim <namhyung@kernel.org> wrote:
>
> Hello,
>
> On Mon, May 04, 2026 at 05:23:37PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Low] The use of `__sync_val_compare_and_swap` introduces a compiler dependency on BPF ISA v3, breaking the `perf` tool build on older toolchains.
> > --
> >
> > commit 30820839a2cfcfa987fbc2e0f79fa0e2f2cf0dc3
> > Author: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> >
> > perf/lock: Fix non-atomic max/time and min_time updates in contention_data
> >
> > This commit replaces bare conditional assignments with a bpf_loop()-based CAS
> > retry loop to fix non-atomic updates of max_time and min_time.
> >
> > > diff --git a/tools/perf/util/bpf_skel/lock_contention.bpf.c b/tools/perf/util/bpf_skel/lock_contention.bpf.c
> > > index 96e7d853b9edf..5c8431be674ac 100644
> > > --- a/tools/perf/util/bpf_skel/lock_contention.bpf.c
> > > +++ b/tools/perf/util/bpf_skel/lock_contention.bpf.c
> > [ ... ]
> > > @@ -486,16 +493,49 @@ static inline s32 get_owner_stack_id(u64 *stacktrace)
> > >     return -1;
> > >  }
> > >
> > > +static long cas_min_max_cb(u64 idx, void *arg)
> > > +{
> > > +   struct cas_ctx *ctx = arg;
> > > +
> > > +   if (!ctx->max_done) {
> > > +           u64 old_max = ctx->data->max_time;
> > > +           if (old_max >= ctx->duration) {
> > > +                   ctx->max_done = 1;
> > > +           } else {
> > > +                   u64 r = __sync_val_compare_and_swap(
> > > +                           &ctx->data->max_time, old_max, ctx->duration);
> >
> > Does this cause build failures on older toolchains?
> >
> > The built-in __sync_val_compare_and_swap lowers to the BPF_CMPXCHG
> > instruction, which requires BPF CPU v3 (-mcpu=v3).
>
> Hmm.. this looks like a real concern.  We could add -mcpu=v3 to the
> compiler option, but then there would be compatibility issues with old
> kernels.  It seems it's added in v5.1 kernel and the oldest longterm
> support kernel version is 5.10.  So I think it's fine to add it.
>
> Could you please update the build flag as well?  It can be a separate
> commit.
>
> Thanks,
> Namhyung
>
> >

Sure, I'll send a patch for that as well.
