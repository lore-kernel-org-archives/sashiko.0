Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C0D3C5544
	for <sashiko@lists.linux.dev>; Wed, 29 Apr 2026 09:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455041; cv=none; b=brSiqTCvBmbRG3UQtilOSCOY7Qjoa495JrRps/kxH3Ig76I6bKnnM4WQeik4p6TUY9LVny+t+cNRpsf05HJCG6XwjbWAO0uYV6g9jJHm/RtbX0CaFvQ0sJaLDDyceKNFOJh6uTuiuVl7NPRTuQTj2dqQADSwbxx8xA2re8Cw39M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455041; c=relaxed/simple;
	bh=/ZVUCZTuUO6JyUM1f8oeaLbyLX0NLCT9d7HVIVgYyrk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=E7IzXl1eENEnqRYZs3Rqa5BsY+KGH/oPFh/r/nfi01j4ZT5OhcAk5+xjztJE9K/+xBOcqrdMPMuMYH1iaMUG2vW/MIh0nyy0j1d59ukigt8BEmzfxomDnPZIp67FmC6Pt8scqOtRZNXbb22l5BzJdp8RAuL2Tlr/jk6DAA7XbG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gtxtxpRn; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gtxtxpRn"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d1872504cbso601284a34.0
        for <sashiko@lists.linux.dev>; Wed, 29 Apr 2026 02:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777455037; x=1778059837; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OAY6vDE7Cb8hHo4kVY+rLYAoTItqF2Are9/Z3tjiQ0=;
        b=gtxtxpRnc+fS2Shf0qryx0Xx7b8H+hoI0lj1wRZZOhm7o8bUKzz5VcGg3LJUflfxN1
         tam3roFzWunTkiQKKIWmzs6cqr5xpshyVumy7jROBytP6fnlP46TtVohveBfMlFV9eWp
         GU0DQzLkWY9GMKJQ7Z2rsOb5aVYTtc8fOJo/THMIL7JrJluACpIrZuDUEiX3lyBOWBg5
         LbP5qOijMUeH6S34xKNfPr4iVRiVu8OnFp+2aBBOTV4WZZcjAhl11ZLgWzfEoxk1WSid
         88pA2uZt6jXOtW4hOaJCQu9wIjLbBz0ZADdGr8SRVC/QX68YeNN6tsEK5jn0o++wgOEW
         lEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777455037; x=1778059837;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/OAY6vDE7Cb8hHo4kVY+rLYAoTItqF2Are9/Z3tjiQ0=;
        b=RWkr94c01s9kBwdf4ZtKTrVXPzV/48dbrm61Vd8KLzIi2jYT3f4Aic1uLVqJ94aVs1
         YDqcjNXJRX0NkJ9iw0Qn0w5g1QJJMMVxlkeD3xO8VgxhXzHXreGJPIud0uAlpzfOPHW8
         Je9W873vsbXNKikLGi8tMXjUERmcKkYggpfjl7wggpFG/BFD8Oq8Uw/YkOo8S4mT8vHX
         /ze+We52COFeZ1bBk39lj6YHm2s+56v23o550g9fnCiO5FPvLnimVBepFjtf6dtzYO2T
         jIbVsW+dnmwFtH5qzGhKcryH+IQ1MQnytfLDGwH/XA8kjkAf1LEtEckKdWPik9UsIwuj
         QtWQ==
X-Gm-Message-State: AOJu0Ywj4KzPVapuTVN4JtSrgtvSL+tNfvhNNlWI0xiFVZcRmHZcnbQG
	vzixxoJKCzSfitoW0xFwmPd+YsalC0WBSp7bDRiRzfkxSZyK4cv/zCz0BsnqHaM4c4E=
X-Gm-Gg: AeBDieuBDdQKC/A5hajTDQW5JMQPYc+TC7yPY+iJKBJ7J8ybhKN+gUjzUujXDM0w4N2
	C2mVSCxMqM3BZ0CKhmx6hhYvMA3tyAptW9cady1wPJCKEPkjm/lHKg0WOvMtdeE2SUun1/0soxV
	XdD/lR6TJFuMptSJcyGnXYoCI10tPJyYkQDvwIJYGCzJjY1N0ozF38IbF0+iy1TLLvcXz16jx4n
	fYXq91WrxKu/VRPS5fbd9ezUG4vAexIktWaDYvZhnV5KRuUcnUhLWZwldQPH4MroRPVEvf8YeG5
	2n7UzevGs2PcGDKAWPULWkl3AozuTEmb+Bt+sOEvlFhJgbAQcV99Gfql1wKnq7tKhFfOjgSbpc1
	8XlSUQDwquMu8d4MXPfG951WTED2x0Ky9iJAJIJ3Dh+M0pMqqlmM+GlaoTU3TLwm6IcybTU5r9k
	dO91ULjYd1LYRgISyNXnP7mIMRP5EOJTxqp2L9zO0U44/PCQsjjj9aEZSVTXyl1EFSAm0U2l0cP
	ERcyAiTJB7U7l5S8nh5WFkuHa4S
X-Received: by 2002:a05:6830:6d16:b0:7d7:e3d7:e200 with SMTP id 46e09a7af769-7dea9537f20mr1192393a34.6.1777455037484;
        Wed, 29 Apr 2026 02:30:37 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:59::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7deab80e9e6sm940505a34.10.2026.04.29.02.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:30:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 02:30:35 -0700
Message-Id: <DI5J82SMQFQL.2O53NRWH4QSH8@gmail.com>
To: <sashiko@lists.linux.dev>, "Paul Chaignon" <paul.chaignon@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 2/2] selftests/bpf: Test insns processed
 breakdown
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc
References: <24f2a5b5f8e3041d03d78305ca0e2277f684d588.1777398528.git.paul.chaignon@gmail.com> <20260429023623.73482C2BCB7@smtp.kernel.org>
In-Reply-To: <20260429023623.73482C2BCB7@smtp.kernel.org>

On Tue Apr 28, 2026 at 7:36 PM PDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] Asserting exact verifier instruction counts in C-based BPF sel=
ftests causes test flakiness.
> - [Low] Unused test configuration from blindly elevating log levels to 6 =
without corresponding assertions.
> --
>
> commit c4e03a953efa7cd8cf2e1a288a0c55c4f73cace2
> Author: Paul Chaignon <paul.chaignon@gmail.com>
>
> selftests/bpf: Test insns processed breakdown
>
> This patch updates global subprog selftests to verify the new verifier
> log breakdown of instructions processed by global subprogs. It does this
> by increasing log levels and adding new message assertions.
>
>> diff --git a/tools/testing/selftests/bpf/progs/verifier_global_subprogs.=
c b/tools/testing/selftests/bpf/progs/verifier_global_subprogs.c
>> index 1e08aff7532e..7092a046c018 100644
>> --- a/tools/testing/selftests/bpf/progs/verifier_global_subprogs.c
>> +++ b/tools/testing/selftests/bpf/progs/verifier_global_subprogs.c
>
> [ ... ]
>
>> @@ -186,21 +187,24 @@ __weak int raw_tp_u64_array(u64 *ctx __arg_ctx)
>>  }
>> =20
>>  SEC("?raw_tp")
>> -__success __log_level(2)
>> +__success __log_level(6)
>> +__msg("insns processed 12+5+2+2")
>>  int arg_tag_ctx_raw_tp(void *ctx)
>
> Will hardcoding exact instruction counts cause the tests to become flaky =
across
> different LLVM/Clang versions or optimization levels?
>
> Since test_loader.c natively supports regex matching within __msg using t=
he
> {{...}} syntax, would it be more reliable to use a pattern to validate th=
e
> log format?
>
> For example, __msg("insns processed {{[0-9]+(\+[0-9]+)*}}") might prevent
> failures when the compiler generates slightly different assembly.

I have to agree with sashk here.
It's way too many tests with hard coded insn counts.
Just one test with above regex is plenty.

pw-bot: cr
