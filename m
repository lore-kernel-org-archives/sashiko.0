Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B65F38F930
	for <sashiko@lists.linux.dev>; Sun, 26 Apr 2026 19:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777233505; cv=pass; b=crltfdE14sUagqJIsGl5c0BkB3kXsD+cebVjW7k92FylsFH4Yd0yBSZ/M+hUNu5/rs+VeIDx0hUBzpcyT+slkQDXO+Q6ZlCi90bMLcmTQEi0tyjXIDzfVW4QR7brHmh9GlcUOvHq3Lky7kIDt42YLryG3NtRkABZObeZc0X4jOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777233505; c=relaxed/simple;
	bh=trIOiXPC3ZznAjLInheohem9eH7X2h+P2el58b9UVm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kEMVYS2xdcdq9zsbwmwj9Pn8T4h2nOhcxsQ9n59TjDo9gJswS8kzcc7/ZMy/Lg5ixuLLRSIj56/JZOENhTJHrQT436Yna5Dl+peQU3QwIuwSgFxKiGDfNineKxmpEyL00EondRVrwwurdFXNsmiogCyC5Nyzz5gd7E++AGWi7Us=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Op8MiIIs; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Op8MiIIs"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so117796455e9.2
        for <sashiko@lists.linux.dev>; Sun, 26 Apr 2026 12:58:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777233502; cv=none;
        d=google.com; s=arc-20240605;
        b=OdxvRnUQLa3h2A8dy/7YSUxw4E6hA+AaGF04xORZNqLSHfMB3jButXxTR8oMagp2RQ
         +IcMIBHYZhfZgP5tuOCulNWvrk0mVgjzR9byzG0erEKp3kcVJmxRDG/UDD+4yuMd6w9X
         ibm0kQ45HhVQWrhlYLcMksnpCwXjsPbidoXDPhBO8rgDmm2/cfxq7ysvNj+q8Lc34g+H
         CmsIF49WleGWkkt3220W/4+CtbruTE9H3M6JlHTfBQ4qLagv2cD1o9Ne+z6eKO4Pak4f
         KUteP8ZVqp7iGxZVmqvj6fc6bIQmLsmr+iS53wDipvmRdtdAVmHXeimwWRkLRcahhCtn
         bDJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vZ7wzWQmLh+SZ6Kb2cKv58UWYCYxw7XUgx9m7326nc8=;
        fh=Z+MpoBVo7hbCOyhKBlmcx98UOTlgah86TJq+LNy3s1I=;
        b=DsL/huD96QJLPo+iSF+0WNj+ngUFUWgk7AI3/aH5igMK5KYf+s6p3Ye5vMsj/1hWh7
         qP1iO59hhV1QxQkmtnVqzScVdg0rgMh/u+p/oolmWmgFZE5za+QkYLA3VwcmHplcBpLR
         xOVLNtq2LHexub7bAtpRfxr0R0n4Kg47PqcR7vObxxN/HBThIwIRKks2JEIncdydRREs
         HGPdKVDdDHI2+TMjml8eCnLea152bETYkcu03I3phmDdSHN6Utdy7eBmWFjQnwQTP7DM
         sN7QgvEU+3+aOl3IbCXGz2b5WpI5Hrd5xTVt2hJTXF2XwqXsQIlR2tYIT1ub0ieyylCA
         XZWQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777233502; x=1777838302; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZ7wzWQmLh+SZ6Kb2cKv58UWYCYxw7XUgx9m7326nc8=;
        b=Op8MiIIsPRIz0IuSMizh+zyQsCqAoaa4WRE/3KGC4GRbUafsnkBQqpvkC6I4ZCGTo8
         wglsURapKV8DfUxYRalFkmXAmDhwDIgTwZcshZ92v5VFzGpQFZzxhb4RSRiGXw7ozKOD
         CIbcr79xIfWfk76utGrceWQmYvlwZJL8gizp19609Y/NGVEKYjSS7nv1zqyCN2yra4dL
         JmYfWey8o+OR4NlfI65oD3l79SaNZZBiOPPotHRWWh6jMySSS5UWtPEGMpbiubH1hr5h
         VpUrPY85O62aqwBDr9JVWAm+Hp1ZFvrpbrpDKsXOP24LEXe1y0iPXkQwoKucF34gbiuA
         oSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777233502; x=1777838302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vZ7wzWQmLh+SZ6Kb2cKv58UWYCYxw7XUgx9m7326nc8=;
        b=kOpFaVUGugb/f3MdUwqild2CaCjmobwB5l0lhcw4hgjW03aFZsARDRmzEOMEhRd/aR
         eU9wzYM7r6XqvpoWGdsIeCatAixGvJVaxMvXX09alo7AlsVTvQkLbsXbGzSHUjKyfSzb
         QCNWd3qwGjP7C5dc0QlhLyNFjsAtTOdjZusCyAZwcInFcW3vTKqNAgsi+cIX8rbu3gVh
         yCHcj6CiZYayBhS35cHlsD515zv3ig54Y+i2AJtcb0qQIWh27mGbYXIzAdFZ1SYdMNDt
         bDpbKZRRSch6ZIIEdZyVYjp4zMJx/VCN25iZz1LITJXznjYImEkkfBER3j/7dE03VkoT
         VMWA==
X-Gm-Message-State: AOJu0YxN2lA8+QQ/KCM7ynwv2L5TAZxFaGqXq3uHBxdNFwVuWis7z+xB
	26nY+rBtVNRa7wmV0SIqcHQvTHvjdP+sLfGuIGTUH8xtOGaqxRpAGcpU9idi0+TIvLXe7oScfAx
	yLalZONj7UNkgENzQZ9ZUsDMuNeQHpX8=
X-Gm-Gg: AeBDietzR1ecrWxaKYs6hzVHwwGtuLQDnrPQ4+U2hJU/R1WeJlFJNrbhndmcwUXqUDH
	dwkx6B7E7Aw9N5PdJjB/yV2sEQZ8uZnxLxhBVfDFTygzIenSuWjMOjD2Tw3ol02YpBM/X66SMrE
	J0uWXv5nY5c2YYZQ7dqtxHGOhTbh6qgXkFu7BUMFHjXwI+kcStZ2K5HND3e2a62ho4fBm8O9g6O
	sSOK1PW9TanB6hBmMAvRhaZhMFuDMf0WUcjf+0kPjELcAzxFLL0htAWiJlxpqMF9tja2q3t/P8a
	UoLt0NgyOonHh1U/LRYmhNtTJ3HMDRxUtGQLOec544huusqCo3PLC5nWGY9utCaiEYCJ1vURYDV
	aJGylGn4nxzdQC4YJNWhN5jCPcj+XEEXk9+fD
X-Received: by 2002:a05:600c:a416:b0:488:e7e4:8425 with SMTP id
 5b1f17b1804b1-488fb787674mr456008145e9.23.1777233501582; Sun, 26 Apr 2026
 12:58:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260426172505.1947915-1-graypanda.inzag@gmail.com>
 <20260426181736.794BCC2BCAF@smtp.kernel.org> <DI3BT9LJCI1D.2TRRBC1BVKIP2@etsalapatis.com>
In-Reply-To: <DI3BT9LJCI1D.2TRRBC1BVKIP2@etsalapatis.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 26 Apr 2026 12:58:09 -0700
X-Gm-Features: AVHnY4KJ55lxN1RRoJMGc4pt8ZhF2zS5ST9s1upiCmj3EpzYMk1gFXRtaU6ML7E
Message-ID: <CAADnVQJGCr9_iBH3wtCZy2rHYCQJ0Ca4Xz_y0tnF0+E7An9BXQ@mail.gmail.com>
Subject: Re: [PATCH bpf v2] bpf: Fix off-by-one boundary validation in arena
 direct-value access
To: Emil Tsalapatis <emil@etsalapatis.com>
Cc: sashiko@lists.linux.dev, Junyoung Jang <graypanda.inzag@gmail.com>, 
	bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 26, 2026 at 12:16=E2=80=AFPM Emil Tsalapatis <emil@etsalapatis.=
com> wrote:
>
> On Sun Apr 26, 2026 at 2:17 PM EDT, sashiko-bot wrote:
> > Sashiko AI review found 1 potential issue(s):
> > - [Medium] Data race and bounds check bypass in arena_map_direct_value_=
addr() due to lockless reads
> > --
> >
> > commit a9b5d3016475abf10be02a320dc627c95b306d92
> > Author: Junyoung Jang <graypanda.inzag@gmail.com>
> >
> > bpf: Fix off-by-one boundary validation in arena direct-value access
> >
> > This commit fixes an off-by-one error in the arena map boundary check
> > where offsets exactly at the end of the mapping were incorrectly accept=
ed.
> >
> >> diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
> >> index 802656c6fd3c..49a8f7b1beef 100644
> >> --- a/kernel/bpf/arena.c
> >> +++ b/kernel/bpf/arena.c
> >> @@ -511,7 +511,7 @@ static int arena_map_direct_value_addr(const struc=
t bpf_map *map, u64 *imm, u32
> >>  {
> >>      struct bpf_arena *arena =3D container_of(map, struct bpf_arena, m=
ap);
> >>
> >> -    if ((u64)off > arena->user_vm_end - arena->user_vm_start)
> >> +    if ((u64)off >=3D arena->user_vm_end - arena->user_vm_start)
> >
> > Could this evaluation be vulnerable to a data race?
> >
> > This function reads arena->user_vm_end and arena->user_vm_start without
> > holding arena->lock or using READ_ONCE().
> >
> > Concurrently, a user-space process calling mmap() on the arena map FD
> > can invoke arena_map_mmap(), which updates these fields under arena->lo=
ck.
> > Because user_vm_start is updated first, a concurrent reader here might
> > observe the new user_vm_start (a high address) and the old user_vm_end
> > (which might be 0).
> >
> > In that scenario, arena->user_vm_end - arena->user_vm_start would
> > underflow to a large 64-bit value, which would allow arbitrary offsets
> > to bypass this bounds check.
>
> This seems like a valid concern, though it is unrelated to the fix here
> which seems correct. Can you sent a followup patch using an arena lock
> guard in map_direct_value_addr? I don't see any issues with taking the
> lock since the method is only used at verification time.

No. sashk is wrong here.
In general I suggest to ignore sashk's medium and low suggestions.
'critical' are often correct.
'high' should be considered, but acting on them needs thought.
