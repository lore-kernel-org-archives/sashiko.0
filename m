Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EB63750D5
	for <sashiko@lists.linux.dev>; Thu, 30 Apr 2026 19:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777578134; cv=none; b=Sg1jqRuD9uUhiSuafo2e7Q6RINDDw484VTRxLDrGO0ofvr1WZLhhZTBOEjL2PQS9ZS3Obi6oUn1tQxiTUUNHVoH/BqcExRBiDSzozkplAhjMZEH3jM4a5t/wLetCbu+MhMq3L+fH+Ca8LY6m26DttmJIyUoHAqpYAwK6BOgahtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777578134; c=relaxed/simple;
	bh=WRzfp8aFMW+UcPGPg8wqzWXnck2XOQdXvT8ecfQOUPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WKlUE/pVvX69ABgM5ciEqh6NaGY9OY507SaG8aJ5HeJcs+eDgBhYRRHlBma0Laip8z16ks0lx7E7dEBtBzFLVsGZplxGLjvy92EHqr3uJ1X2qMNWMU2H7QMrNNhks0n22bivyO1TvqFPVny6EELDii/aOshbeBs9dWRAke3QWFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hr1cfKvn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hr1cfKvn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9E1C2BCB8
	for <sashiko@lists.linux.dev>; Thu, 30 Apr 2026 19:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777578133;
	bh=WRzfp8aFMW+UcPGPg8wqzWXnck2XOQdXvT8ecfQOUPM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Hr1cfKvnp9Mxm4TWcZxTzhiCYRRTOrBKVrU8dDIB5CUwNKRQt03gx3WvSazHClr3S
	 r0WfkXrTalTrsRKx1r+mB1D4suCUfjG8Qv11Z4z6zhlRJvr5R/p8MKa0wlaqXa3Jjj
	 /jrGgKuIlyG1uKbarCAYOvjphgKpvL54BdWeBzuwxGOC/VrJvLXqD3VAV6kYX2LCz6
	 pSltyJuh8HMaqL5BEkXJNX1eJDtT+o/Vsp8HU/LEupjPP6b9buoGbf6yU9x3spK93N
	 6pFwDGYUR0ZZsocFnsPiPrg7oXMGJe4IYfphezq9HkNYbdaWT5SvsvMcZFO5SyKKZ3
	 /YvH49tOssWEg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a40b2d26a1so1039042e87.0
        for <sashiko@lists.linux.dev>; Thu, 30 Apr 2026 12:42:13 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx07D9hCO3GC8ZtZHrEVIiU/1KQ5l/XpS0dgyMwMLJh/Z0hldJT
	sQEwd2B4mVMXf5FOyUvoQssbxWcDfFnWCHHiJOtXcMjq/8bCBW43yt34DY3c5OGGPlC/P4kpU0o
	ApG5TjXMxQuLiiIuhCyMeNdslMnYOPVQ=
X-Received: by 2002:ac2:4c52:0:b0:5a4:1a1:f04a with SMTP id
 2adb3069b0e04-5a85227d12fmr1572285e87.0.1777578131915; Thu, 30 Apr 2026
 12:42:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2413681.ElGaqSPkdT@rafael.j.wysocki> <20260422220704.5E5F5C19425@smtp.kernel.org>
In-Reply-To: <20260422220704.5E5F5C19425@smtp.kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 30 Apr 2026 21:41:59 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jB44y53+-135iuaMMsPvmH0wDskCx4Q1uVXH+QckG6kw@mail.gmail.com>
X-Gm-Features: AVHnY4Ko8yUaMCfIJfy9bPJrkMkZCltheLsjzXpvOKxTR4UR3d-JPh_RRbstBl0
Message-ID: <CAJZ5v0jB44y53+-135iuaMMsPvmH0wDskCx4Q1uVXH+QckG6kw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] thermal: hwmon: Register one hwmon device for each
 thermal zone
To: sashiko@lists.linux.dev
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 12:07=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 5 potential issue(s):
> - [Critical] UAPI Breakage by changing existing hwmon device names

This is done on purpose as explained in the changelog and if it really
breaks user space for somebody, the entire approach will need to be
changed (to something much less attractive).

> - [High] Buffer truncation during hwmon name construction defeats disambi=
guation

That problem is unlikely to happen, but formally it is a genuine one.
It will be addressed in the v2 of the patch.

> - [High] Kernel panic during thermal zone removal due to conditionally re=
-evaluating hardware-dependent state

That issue exists in the current code.  I'll add a patch to address it in v=
2.

> - [Medium] Subsystem Guideline Violation: Mixing goto and scoped_guard

Good point, will fix it up in v2.

> - [Low] Unused dead code (hwmon_node) left in struct thermal_hwmon_temp

This will also be addressed in v2.

Thanks!
