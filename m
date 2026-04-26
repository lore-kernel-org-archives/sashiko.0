Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434DA389E07
	for <sashiko@lists.linux.dev>; Sun, 26 Apr 2026 19:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777231011; cv=none; b=ESQL3AYVcm4WUjfMblD80FXdH8tFlulgVVhksQ82GwywBjR5l+TYkxcVsrGAO6G+Ia18gXCbdAoljx/RwdXbT/Nhukv3yjnjD1+YEXK3/NzqrYxGeDLBfqVE2LTkDVx6pY2bYG/FjeQyp6Y7Ahap/EA91HPZS7h7LxpM9G5oL+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777231011; c=relaxed/simple;
	bh=Xuf+R/+WB9hB+YYiyN7uL2aDPjof5JKU2nWhd5xO/0I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=RvRWDHXfEZTZ60HRqn7SMu5MacsXeexJRd/VoRY1GcpRQBs2m+225SjSE/pB/lkSSz3Ka7l03oXf898vftSnmqSA0kG1MCkS2YjIPk791vGE1JwD3v3dKhHxdAY8HibhDjBf74of9bgMq5GUWmDC3n2HbbXCberLrHqZxFcutmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=FEFB8jkb; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="FEFB8jkb"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so80658285ad.2
        for <sashiko@lists.linux.dev>; Sun, 26 Apr 2026 12:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1777231008; x=1777835808; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCNYJ9Lu7oG9Wvhqwh+98GrCVYIvA0xo+CmPm9Nb2RI=;
        b=FEFB8jkb3t/R/ZhezcoUn2nJkmwx6eorDX2i1iOKSZKrXbVJXGJxk0vMflaAx6VYW0
         iHxLfHHhwIyYOAiOa24axgozxdZIPPWpHUoW5mxIu3/yoG8zG/Zic/lhpKpwyxVmQtAX
         uYsSbQLeaqhRjthlD6FadvzCvszvkGRnyJJ75mq/rvTJixkq9FvCC7AZaIl3dpLav+im
         9XOeJAouPS1PzavcysxG/hZBE5W0ju1TYs2irjEQO/4c9gjJy1hSP55noewrYEMWx0iW
         UjPaLQ/qPH+Z6KOfJeSTYX8YNRc9TO/4kSjaCc4gQIti66MJOhUsHrXjYkH/1cRfCL67
         GOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777231008; x=1777835808;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PCNYJ9Lu7oG9Wvhqwh+98GrCVYIvA0xo+CmPm9Nb2RI=;
        b=OiK5rY7WmjD8ArgjIDMC2xiDUI4QAE40NiE67Jue6oRvEAdsW+ELYbUs/r9hEkonVT
         QZYjatEDogyLcDg+s68AVwKglvZU95vhFsevwCHh3aS7Dx8NwKAMuYwEdvTqiU4usnqD
         C01DeHZx1MYKveG1qFbh7jUfKmgiPPS6fZvHe+agj5lstZTSbZz6GevsYzeNaTKKiTBu
         y5fuUablA4JBshd0LPxCG2vhv250YF5kA8A538DhjeZN4EBj7y4a3zMorriZ/fgNCj6p
         tm8P5xmMOrZNBn5HQcKXkOi4tjygkfqfG2KRCAWoHqb4PiKwN6HZjmnwKSsndPV900Ua
         TDXQ==
X-Gm-Message-State: AOJu0YzphORhrTJCKEHyWmfZlpW6LWlpOFiSJOKyE1b9+16V/4WMenv4
	Or/D2tvIbxannQx3h/9ioTr/xK3w91nxS6QnZkl+YOaWigvcmmTkYbQhghVAiuTEt3kYrSTuklJ
	xDOEgc9Y=
X-Gm-Gg: AeBDietWNYeurIhvVEUBLNx1/dW/xc9CxkIcd12ueK16uMqaS/eQVSRvSjWLDBZ/9E/
	u0piD36i+fkGlj/CuWKAskqDt3vcAw49kHXmEQlIcV1kgMnrWdKT/dxEmcz80H5OlHM7vtdW0jb
	D9LiduDKhInp6zE/NPlkFmrHUFHcxuqq355ATJcDBOwFI/ZwzCvMho1/03clZLbzaaIeTZUZrnQ
	CzEPOYbCZBWw2vL4IMbq/GJzRizGVr7dadvTTt9m941V7A2Irzc2DFuC2HomWgyC2Ukfbu5BIXy
	cPHS3/qvy85VdAldwEguLiXGgoDTszbpUhVyuQr8ETwONZYDpgAQCsKuqtVVMlTe1/n6DqCZdQS
	m+1y8NhBFsoev7+Cq7jDE8A06/UsAXAinnxv6tXjXPeCBzWmBg2ypf4S5mDuBueJtnX3zQFhD25
	qAlkExfZdEXH8z29rPsA==
X-Received: by 2002:a17:903:3c24:b0:2b7:a3bf:b2a0 with SMTP id d9443c01a7336-2b7a3bfb415mr169412405ad.5.1777231008213;
        Sun, 26 Apr 2026 12:16:48 -0700 (PDT)
Received: from localhost ([2604:3d08:487d:cd00::2af6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab3ad18sm296596405ad.71.2026.04.26.12.16.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2026 12:16:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 26 Apr 2026 15:16:47 -0400
Message-Id: <DI3BT9LJCI1D.2TRRBC1BVKIP2@etsalapatis.com>
Subject: Re: [PATCH bpf v2] bpf: Fix off-by-one boundary validation in arena
 direct-value access
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: <sashiko@lists.linux.dev>, "Junyoung Jang" <graypanda.inzag@gmail.com>
Cc: <bpf@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260426172505.1947915-1-graypanda.inzag@gmail.com>
 <20260426181736.794BCC2BCAF@smtp.kernel.org>
In-Reply-To: <20260426181736.794BCC2BCAF@smtp.kernel.org>

On Sun Apr 26, 2026 at 2:17 PM EDT, sashiko-bot wrote:
> Sashiko AI review found 1 potential issue(s):
> - [Medium] Data race and bounds check bypass in arena_map_direct_value_ad=
dr() due to lockless reads
> --
>
> commit a9b5d3016475abf10be02a320dc627c95b306d92
> Author: Junyoung Jang <graypanda.inzag@gmail.com>
>
> bpf: Fix off-by-one boundary validation in arena direct-value access
>
> This commit fixes an off-by-one error in the arena map boundary check
> where offsets exactly at the end of the mapping were incorrectly accepted=
.
>
>> diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
>> index 802656c6fd3c..49a8f7b1beef 100644
>> --- a/kernel/bpf/arena.c
>> +++ b/kernel/bpf/arena.c
>> @@ -511,7 +511,7 @@ static int arena_map_direct_value_addr(const struct =
bpf_map *map, u64 *imm, u32
>>  {
>>  	struct bpf_arena *arena =3D container_of(map, struct bpf_arena, map);
>> =20
>> -	if ((u64)off > arena->user_vm_end - arena->user_vm_start)
>> +	if ((u64)off >=3D arena->user_vm_end - arena->user_vm_start)
>
> Could this evaluation be vulnerable to a data race?
>
> This function reads arena->user_vm_end and arena->user_vm_start without
> holding arena->lock or using READ_ONCE().
>
> Concurrently, a user-space process calling mmap() on the arena map FD
> can invoke arena_map_mmap(), which updates these fields under arena->lock=
.
> Because user_vm_start is updated first, a concurrent reader here might
> observe the new user_vm_start (a high address) and the old user_vm_end
> (which might be 0).
>
> In that scenario, arena->user_vm_end - arena->user_vm_start would
> underflow to a large 64-bit value, which would allow arbitrary offsets
> to bypass this bounds check.

This seems like a valid concern, though it is unrelated to the fix here
which seems correct. Can you sent a followup patch using an arena lock
guard in map_direct_value_addr? I don't see any issues with taking the
lock since the method is only used at verification time.

>
> Does this logic require synchronization or READ_ONCE() annotations to
> ensure the verifier's boundary validation remains effective?
>
>>  		return -ERANGE;
>>  	*imm =3D (unsigned long)arena->user_vm_start;
>>  	return 0;
>>  }

