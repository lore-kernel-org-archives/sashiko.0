Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3665F39DBDE
	for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 10:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776334198; cv=pass; b=itTMs1dol7g/uusWPEWBY9fZi7PH6/eXI/5Wp7ylKwjt6jDv/LQsiKIt/HnwdC46fShiujt5JCtfjN7qAGfTt68T7lT2W0Iaj/3iwljKv/PZZcoc3MNA9fnGAPk9KW0m/Gpv5cXqPfZHOKyc32KeavdePwDAyHVbTULCIZlIeo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776334198; c=relaxed/simple;
	bh=V5RGcaWEQIL5doImkPYBf6NSUr8b19d+JjOqnGw7u5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rODPoP9nVkplndDSnoZh8hjQTT73mMehMZxSCnTR0xqGXa3gaegq9JH4kl/qd6F8ylALUHOVavyKSXqJHg7o4hTQk0Wda1ESd4kCOxlPHT59zrWBfm53xfHFmp+PbGt/W4YdvPKJxLJRggiRLA62NSmW3lhN6pQG9HR8vn+TiRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RrLzyFcY; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrLzyFcY"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a3cee3a271so7542610e87.3
        for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 03:09:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776334194; cv=none;
        d=google.com; s=arc-20240605;
        b=SDSFh7oQow1VDEjYvadvIXRYVN7YafvYtlskb1dihQ7lUK9K5/xOi92bDeyN2VXrTp
         KP8Brxx3siizemfGfAjAtDQsyeLDQ3e/bn/mu2VnFjXjPZJt1kwt7OH+QnLKpMG15WIk
         PWR0sIDW8l17F6Dho+4paR5wJwMFvAUvzp3izTLTOpQArRljnQ9LBVOKZwFjFCMOn0C8
         biCWwwH/eCByfbQ2Yg7jJiMJcBz++ojuFCa7r4Xb1LahO1xBKs3vtkgA8ojNyK+iB0Ec
         JNJKvdmukN67h2RW/gSZ8ZpZoIfCQ7s7QiIEnR6McZFZeO+YvRVQcMqdvJ3wl1dEkHrM
         uqsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FVWfRblvx3Z4ePRIGccQORQmFn391UgUUAHT2x9HlvQ=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=QYd3H5q8eYbVpN0BS8lTYerUQ7WSxPzxbLi6ePiMDxkqgoMkmjRHuT1tm4pbH1Xpks
         WAU8GI7jx/AWYMTIXH4S0pKnUJ28Su4LrsUx3S0GSfGHD1aMJJtIgXNTNXrJFb2T2Bz7
         dV5GLRT7rX4zbuD1hneOuZ+ZTT+H8TD3KgrxvxkU5GsamJRwdXtPbgFuaWYMuyjTKYjh
         02Ygx9/wCGSs1VbPQod/7xwV2VER19iNwY3g1okJh4yxvJ1WAPKAd/2ML6VW8tBK3P7f
         +r4zTqQihGv6861Upbv2rQRnlOEq8p9FeSJhpmjuCYDk/3lGJcOf4xrH1b8NuwsglaWK
         VubA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776334194; x=1776938994; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVWfRblvx3Z4ePRIGccQORQmFn391UgUUAHT2x9HlvQ=;
        b=RrLzyFcYkIL/4kifaw3EWw5hJTiT+0ytQ081QLskFpUtHA6mKpmJ6XKSRFiiuEnl9M
         lGNlQgIlf7NY2LFeCY/8xlVUrtEK2Pd6nw7e2+pgIg2XEAyvR9EgYzs+7ibLshgBiyy8
         T3PUnz0oJRdL802mW8lj6PT1FD0vAilduwJl+XYRni3HgFiFzChuV7MXmdkzgfTUJ0sR
         WTJ7+JKN1B6lEn7sbBgYbxgOZxz4vQ1H9K/BOdXlUiARYZpBpwzD1SoK9fzGsTFwmggT
         OaGrKy/NsQ1U2RRNU9IR1XbksVmpf0e4s5KQ4di34v+mTg+AwvQElJJX5vY27KALy8GC
         7OzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776334194; x=1776938994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FVWfRblvx3Z4ePRIGccQORQmFn391UgUUAHT2x9HlvQ=;
        b=LOEQ42t1LsVUzgC1JBmz1uUedFsQbXLnCKLdEjNGfjhLhRO14Pq7a6QxICss2ITF+X
         W1krxdjjFzSWJJXgZCujoNBN1T57TmSvWUDxllylHNWwhRAroIzxCGUsHqBd5FJ3Iumd
         yCV0PfWLaH9XDq/gTDtFShbF0vV+UTbRmWqTHpcOm5zmKxMKX4QuGW/IGVwfDp7CkwoD
         7bjYVhomnbMHI6ppFX3nEHpnkLxVBeuBmnXhMpKrmqfF14DjG2s1dau+Is3HZkuzxj7v
         LiIWpFOy9Wk32PFqKaTmLmDDihIdRlsDBodbFGakolerPdFOfDJTU/EXXA3WXiW02n24
         luWw==
X-Gm-Message-State: AOJu0Yz6H0SJpWNGlAytrJPiNjpJyU5mjh/YgBIsqyrvPD85bDrsPGZw
	552Lu6aoiAis7+uxRT4r7PXNm9/poukSfuaB8+a0VrYl97Y00zVaL/eut9bogdGZwU94kP1Jb2K
	2SXBbGFpPIa/oni69KQ/WPfG6DNPijkuimcLr/Yw=
X-Gm-Gg: AeBDieuVpYsbsvmursQ/N6pAJXhyStZBQoN6BkonwPDk+RszrOIqTHN/catdc7qMAeU
	RTV65GqA/tyC5MBtTpX09/CymejZ9KosNZud6uW34t4tWu6IIhEvE7hy+bM5+q/aJMYaxBHVrjY
	c5V67G9DfZOWjpw6N3hlNEFbgnlZB4AiUIdJ0GMfxudqvUmPW0h57iGywrWF7jwc7+WzhHQyzsg
	CSRm1qI9BlnGcVIZv/mt4Sc6lLTKV6L0mwNXjQVNxyHCCuJA1WRkGTYgImKWxk/LwbUsDYIAl0j
	TE48PoDgFJGhFWbMHR8=
X-Received: by 2002:a05:6512:318d:b0:5a2:b3dd:7a74 with SMTP id
 2adb3069b0e04-5a3efd80785mr7750378e87.33.1776334193996; Thu, 16 Apr 2026
 03:09:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415082654.21026-13-kerneljasonxing@gmail.com> <20260415092053.72D0CC19424@smtp.kernel.org>
In-Reply-To: <20260415092053.72D0CC19424@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Thu, 16 Apr 2026 18:09:14 +0800
X-Gm-Features: AQROBzBBDqxdhhkKTcZFySjG129qLX13HxyAcVjcvEObyfW9fJCS_Xie0-Tfgck
Message-ID: <CAL+tcoDJBH76L_b3NGGhaLMAEMLP2SqEgNBYtqRz006naBoX0w@mail.gmail.com>
Subject: Re: [PATCH RFC net-next v4 12/14] xsk: separate read-mostly and
 write-heavy fields in xsk_buff_pool
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 5:20=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 1 potential issue(s):
> - [High] The patch groups NAPI RX write-heavy fields and NAPI TX write-he=
avy fields into the exact same cacheline, introducing severe false sharing =
between RX and TX CPUs.
> --
>
> commit cf39ff4311089098b2e57c37ba6e85e7a36ac4a8
> Author: Jason Xing <kernelxing@tencent.com>
>
> xsk: separate read-mostly and write-heavy fields in xsk_buff_pool
>
> This commit separates read-mostly pool geometry fields from write-heavy
> fields in struct xsk_buff_pool by adding cacheline alignment. This is
> intended to eliminate false sharing between the sendmsg CPU and the NAPI
> TX-completion CPU.
>
> > diff --git a/include/net/xsk_buff_pool.h b/include/net/xsk_buff_pool.h
> > index 0b1abdb99c9ea..0376bd4cc95b0 100644
> > --- a/include/net/xsk_buff_pool.h
> > +++ b/include/net/xsk_buff_pool.h
>
> [ ... ]
>
> > @@ -73,23 +73,27 @@ struct xsk_buff_pool {
>
> [ ... ]
>
> >       void *addrs;
> > +
> > +     /* Write-heavy fields */
> >       /* Mutual exclusion of the completion ring in the SKB mode.
> >        * Protect: NAPI TX thread and sendmsg error paths in the SKB
> >        * destructor callback.
> >        */
> > -     spinlock_t cq_prod_lock;
> > +     spinlock_t cq_prod_lock ____cacheline_aligned_in_smp;
> > +     u8 cached_need_wakeup;
> > +     u32 free_heads_cnt;
> >       struct xdp_buff_xsk *free_heads[];
> >  };
>
> Could placing these four fields together in the same aligned cacheline
> introduce new false sharing between the NAPI RX and TX CPUs?
>
> The fields cq_prod_lock and cached_need_wakeup are updated by the TX
> completion path.
>
> However, free_heads_cnt and the free_heads flexible array are heavily
> mutated by the RX path during buffer allocation and release.
>
> Because cq_prod_lock (spinlock_t) and cached_need_wakeup (u8) only consum=
e
> a fraction of the 64-byte cacheline, free_heads_cnt and the first several
> elements of the free_heads array will pack into this exact same cacheline=
.
>
> If a deployment pins RX and TX interrupts to different CPU cores, it look=
s
> like this might cause continuous cacheline bouncing between the RX CPU an=
d
> the TX CPU for every packet processed.

It's not introduced by this patch. Previously those counters were put
in the same cacheline.

But the suggestion is good, which inspires me to separate the tx and
rx counters at the expense of adding more bits of the whole structure.

Now the problem is gone:
spinlock_t cq_prod_lock ____cacheline_aligned_in_smp;
u8 cached_need_wakeup;
u32 free_heads_cnt ____cacheline_aligned_in_smp;
struct xdp_buff_xsk *free_heads[];

Thanks,
Jason

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260415082654.21=
026-1-kerneljasonxing@gmail.com?part=3D12
