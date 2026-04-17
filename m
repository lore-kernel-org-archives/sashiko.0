Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE8135B650
	for <sashiko@lists.linux.dev>; Fri, 17 Apr 2026 17:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776446044; cv=pass; b=dTDfotyn7GGeRUxotP1uV0g/oYEKbGqgbcyYiFdSdYx0FzSa4VVSaLxN/E7RJRk77/+5ma7DaLgf2OTutHWyzgzW0StNzQpNxZkFOGWvwWJn/2jQ430mV/n+ThdrzX7NV1I1xuoL2vMVN6otxQrlIfauAjcmCz171iORZShSU8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776446044; c=relaxed/simple;
	bh=06kMpxCm8ISCJ1snCCoGJXMkyB97GUyzLbPodOtLGjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CoJZ91bi2VW3iInZYtOfo+U6LIEsDyRNRlJ0uvOVqGChbET09vcQjpdfkwSIh5szS96VJO6Zq+mHeEIvP3na/oW6ezQt64V6Dk94LStYBAYiNz+7J4nOE56cZ/4aUDZ35upW0Ywl/rNyYxcP+tsbOLLJIkG1oEbmigDa1zBlk9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAdS4+Ih; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAdS4+Ih"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-66e8cf72a93so1242267a12.0
        for <sashiko@lists.linux.dev>; Fri, 17 Apr 2026 10:14:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776446040; cv=none;
        d=google.com; s=arc-20240605;
        b=WL+ipvHVVYXTgUImgh1oB+DKLJxSXrq90gow2tsbCzQwPMyegegKEzNowfiaDhJ+zK
         K2nm4RjSFT8tHk7CrqCfo0S9M1fHfZvxkU1TO6d65NQdCnO7QjY0ZcuHjqqjN4y85Jif
         5HOZeRRCshsXFCVL+SyJlCvp6ZZ0id5THVSHwb8FQ+z22W9iSzl3dHvgW/7DXB6IYHtZ
         ixUJv5m4o7+LIFIgXsxIbRDLCcZM013WvEF9HDFaIKTixqxrWgjWxjvdcJ2d+rQwkZAZ
         dq4kSMXtODbJxheEQpxjL5D6/GZh+4iMnjKrJBbUXgEr0mmhtyqgp450va0+5TtRTBoo
         qwUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vO0QlmUSScuGL60aZNWbsgf9uqeV6j4ThnI5lW9t5sg=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=cLzjsuGStGvkk6IJG/i/IJoXyCvPhzyozbwSj90oRv6cS2jcShzBi7Fp5X3r0DmyCh
         uQrRO+vS9NvKhf1xgWeuMbcnTJ4kf+tZA9NEyYNtb3DwIz9nn22/m0XieuJiY/khwXLI
         wSF0gbYrSzbzvZlPZ+29C6dFFAoHPVr8lhy/BBu6e+cZAgumJtrxfHhyjv6da4JDytua
         ECj+x2JYL3Ou5Wm4Y3USFvLmBsWC+oIFbFpaCVqFc5ppRUSKo45DIiON/Z77zGWyVdKy
         DPt0nBzgqGJO2SxG7VpEjUeHVylQuuzf3uC71kkcRT3cJVwNYdBqLPSQ8OETEUfsM87S
         EfGw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776446040; x=1777050840; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vO0QlmUSScuGL60aZNWbsgf9uqeV6j4ThnI5lW9t5sg=;
        b=HAdS4+IhsXVGd2Bs0O/a81HeWgn7QIO0HuwkJCHwX6sF/vdfybfei5uGFhZu7N1bNN
         IjZ1sx6+zpKkXTMXxjkcKmOmHb1KNL2KNqBAkprZ0wTNohZCKQJVcJbI9D6XhtKEJujb
         eMOX8LRoVnOiXEYlR20eCbBg/KEMxZqykG9s/KM6YNR40ggR64RAXNAJyk007A6I1ubi
         ZJJiZYwbA6342UM/gDX49+ZbipjYAah09ohPCJgXIBEaF7e+Y/EHm3pKl5aR5lklietE
         dmHooHz+tLHnFGaIRENTJ6qnCBZM6cPohhxwXwd4Przi8pZLfYT2C67tSq9snfcMpTwc
         5Lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776446040; x=1777050840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vO0QlmUSScuGL60aZNWbsgf9uqeV6j4ThnI5lW9t5sg=;
        b=gPEmfQ4DQkf+tcZkJLR3rBK27svVUUTolgGFcIrvq+wOOjaE5bmtt59TawarEbgvTs
         R8iSmiidtbBYeQiTrkU1n+KysCdXMA+yMLCb92ngd5aEZ8gQSuctNbllEvMvzphbhbzg
         drCHj/HncJIGoMGahfwLkm0ehK2V01UGsrwP7W+ejcZQh2o06A0K/nR+sJ3OqSlwUfWb
         PzDU2OAAAZ8YqAu5gKJCYEa5TbqMxz4qVSS9gzUk6vUUGcDCEhAeyBpxdObExRRwHOEx
         d6Bm0ZkOZc7TizhjK0lui6FmPkA6ehT3mz6qH7ZT4IX5vmTpRk43r18dJYiDtM/thuEk
         4a0Q==
X-Gm-Message-State: AOJu0YzZGJZo8P3FcCU3DmpdX7bgOsR0jSBHHU01K+kLe7bnDr6QySEh
	EzG1RONPOgXZzteYlqFmCUhIWyfJWcbVNau+Sknl7i6l04FY1W+J4uVaSiz2/NYyqzPtwZbqKry
	4L2PJnPqEU8d5v9PDNrz2CxWQ20LcCWRRnvA7el4=
X-Gm-Gg: AeBDiesMnT74t+GB0PgqiFIio913E9s7M/TKT7DYeg2zoz/dPv96Ght9TlIi6n70DzV
	XmRTe88gNdsSF1JKdDmBNWi0MgZP0Z9wP8ZzlYuaVIU8J5w4H5fj8kua2YOernKnIMQe5ZpeY6A
	toMLV8oU6v3Bma/hYDpPhqBUoRwGGlidYKhNR5TY5ywGLqysHgyeA20Y5ka4SJBg8m/KfFcy/xK
	d/WPXTMHnbgLCDQJxeAmGH5xYn85/L3hNZvxONXoOx9FoRyYBw5fBYXXPD3koKxolTRTi4imErr
	0eCzCD4VKK0XlaA2ke9XBGjUO05b6DQnRA==
X-Received: by 2002:a05:6402:3048:10b0:670:8d21:dcb with SMTP id
 4fb4d7f45d1cf-672bfdd8356mr1551240a12.19.1776446039632; Fri, 17 Apr 2026
 10:13:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260417152135.1383754-1-puranjay@kernel.org> <20260417165515.63952C19425@smtp.kernel.org>
In-Reply-To: <20260417165515.63952C19425@smtp.kernel.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Fri, 17 Apr 2026 18:13:46 +0100
X-Gm-Features: AQROBzCdPwmEe49XyOn_2cCFXB4mKHxUeyJiKM4HIoEe6cwlCfUGb06ABItgwlU
Message-ID: <CANk7y0hkC8D-8LTb4yc6c9m=qBj0gYk2rc3sFrai6LG6s9278w@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf: Validate node_id in arena_alloc_pages()
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 5:55=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 2 potential issue(s):
> - [High] This problem wasn't introduced by this patch, but apply_to_page_=
range() is called within an atomic critical section with IRQs disabled.
> - [Medium] Validation of user-provided NUMA node ID uses node_online() in=
stead of node_state(..., N_MEMORY).
> --
>
> commit 312a17d46d0e6285c5b29bc93a445829df8c62c7
> Author: Puranjay Mohan <puranjay@kernel.org>
>
> bpf: Validate node_id in arena_alloc_pages()
>
> This commit validates the node_id parameter before passing it down the
> allocation chain in arena_alloc_pages().
>
> > diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
> > index 9c68c9b0b24ad..523c3a61063bf 100644
> > --- a/kernel/bpf/arena.c
> > +++ b/kernel/bpf/arena.c
> > @@ -562,6 +562,10 @@ static long arena_alloc_pages(struct bpf_arena *ar=
ena, long uaddr, long page_cnt
> >       u32 uaddr32;
> >       int ret, i;
> >
> > +     if (node_id !=3D NUMA_NO_NODE &&
> > +         ((unsigned int)node_id >=3D nr_node_ids || !node_online(node_=
id)))
> > +             return 0;
> > +
>
> Should this check use node_state(node_id, N_MEMORY) instead of
> node_online(node_id)?
>
> A node can be online but memory-less, such as CPU-only nodes. Passing a
> memory-less node down the allocation chain could ignore the user's
> placement intent and cause unexpected allocator fallback.

That is fine I think. it is just a hint.

>
> This issue isn't introduced by this patch, but looking at the surrounding
> code in arena_alloc_pages(), is it safe to call apply_to_page_range()
> while holding a raw spinlock?
>
> arena_alloc_pages()
>     if (raw_res_spin_lock_irqsave(&arena->spinlock, flags))
>         goto out_free_pages;
>     ...
>     while (remaining) {
>         ...
>         ret =3D apply_to_page_range(...);
>
> Since apply_to_page_range() can sleep when allocating page table entries,
> could this cause a sleeping function called from invalid context panic si=
nce
> the spinlock disables interrupts?

No, the page tables are already allocated we just do
set_pte_at(&init_mm, addr, pte, mk_pte(page, PAGE_KERNEL)); in the
callback, so it is fine.
