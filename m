Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B7A38C410
	for <sashiko@lists.linux.dev>; Fri,  8 May 2026 22:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778278594; cv=pass; b=rbYW7+5r6VjRTxdY1O8569/VyEuOtdwDWTxA1Oe4eyDvbc+urydq15G/QfAM0nuseeSr9rWnkCPw1V8DmlX2Kumw6xPVIWSZzgumx28XRGfRJvSoJfrZ5R6xrq6VyFbC3/SQcr4Qqxr7ZkK1kXvR8akJ/94Uu8onFg6kqecIp/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778278594; c=relaxed/simple;
	bh=e+E5zuCyazZJmFaSY0AwU7cB5eQG/o6vL6H3Wforntk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p9b3geuRb7vg93Klji2XJiitPKJHxh0SYXx494HpBthjH+8jIbNM4gzEs+jYDSWyJb8KW1eQxO6YxZT1uzvbWaVdh/883zuYCZN9eTignKGv3tzT2eMImn6iedEIEpq4/cQHpVANiRBuqdPCuWsQRkvMfGOhiJn/KgNIVtwW0ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IjtB+eyL; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IjtB+eyL"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-449de065cb3so2249832f8f.2
        for <sashiko@lists.linux.dev>; Fri, 08 May 2026 15:16:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778278591; cv=none;
        d=google.com; s=arc-20240605;
        b=W23DhX30eJdzdxoufiriGCJtF7W+tOUsTtupqrxh9L7DtVnOacmEMFAlNJPalOV9ZG
         cfnr1ioZ49XZEC3m/nmXM87OounGtkm/Jnzgyk65j5uVMHjzignuwRwZ/sH4CzAMGece
         gpFyHxDCJCIHRT09VMA9NlSMUF7Yaq9RD3OPOjnKsH1Snxa0r/ysBHsmj/H1FMxAcQxc
         7yljPSURHZ+w4SWqJF2e4H69qqLga4dAwMyp2LfYIcc0YJSFflKZrPHHW1DkzA10E/9n
         8UUyZtQsMMmwcAK7sTQ9gQgLQg078sbspJOb6WliXYZtKQjj/tyDqj0UVybEfyZMkM5b
         9tPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e+E5zuCyazZJmFaSY0AwU7cB5eQG/o6vL6H3Wforntk=;
        fh=3HUx5lVldlqiLPTI08LhR0CP3wkkmU6PLmAN1o24E9Y=;
        b=CN6dusKnba2zBLrGopLyokak2QEhZ7I1TJICkvyVhSsKsxeB2coLtVOii92vI+WBmr
         pPqU0jmwC4KC2toZR37TMofjrGaJoHSxL8f1+42JtgUTJ7FkmpTHd/7l3C7kHa4JK2Pd
         tIbrNN0qYW+i5wlsuEgcjDpA5vnFsA1ovNp6tjsSk2CaccQPClsb9cfIXQ7Ms2f1VJ7E
         FhcNamEYpKAhw8OzKdc2dVDz/G/rnU0VNoEp7NX6MMeWG70bm4O4UQL0dfeancWt371o
         ObcLl8gvijpZCxFczV56ifKfpeehkdsbZtcyPgyQDjbgSi7aH69Q/WfZP7lylliQgnQr
         gcQg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778278591; x=1778883391; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+E5zuCyazZJmFaSY0AwU7cB5eQG/o6vL6H3Wforntk=;
        b=IjtB+eyLICsIM15NFBcAXVhZ0rKbjJ3Ajz42UBCsRn3uFJa2yTIV4h/Lx664sg5bC1
         2iRROfkQq91SQMy/7/Iqz1AxJ0xIN2nr7GTqlF7A8t/5ion4cVC7YZSB4hF/6ELSU36x
         G7Y+rTPDw4+gijdjM2lDSVe729ARRsrvKGpDaTSVttLojipJN/6MJOY6wxA7h91qqIIv
         5mKMz1oS+uX/vgtYhCy0HqpP2xd29mSQaxICTg8axKQJdVXvCkXy5hP7hCgbZw319grw
         Ks+mhn6KAj7hu+RAfju9Jlrv3UhxTmsmJmc0F4zPIa5xjdT6Nzrkr6raQTPjj2EDcfK2
         stIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778278591; x=1778883391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e+E5zuCyazZJmFaSY0AwU7cB5eQG/o6vL6H3Wforntk=;
        b=kfeWfyboneo3/S4gA+oUDfMqaCNuGYYG/d97A26fnd7RzXmurDnK2Of80zNU6y50i2
         Mj6ldReCz8vM0bQVBZLDortrWyrTYqPRmV8g3t+60xnSR4nM/0vUFbf0UWVha72RglRg
         x0lA5QeG655UXLQJMFmlJwBtl7K7VedaUG+h8AfQUYz4PmIEaKvVsy+t6gEp2cxj/X99
         1jnji+rcpGvGbfItW4NrJU9V58SDas4OIY9kpS/JsoCMI1dRdqjjrQeXvI2u4oo1T1ZH
         73btN+HK/C1I0ksTLXpZYurGA77x6/MvShMdYdXjT6lUbVLLfUCHdggl7wwvzZzf9aTI
         hMlw==
X-Forwarded-Encrypted: i=1; AFNElJ8UeoP6QIoB4iI33jMEhzpMQWpiyXisJrPDHNNw7uxiSoFrLL6WVNOjK1FJs/C2dwNieqVdy4Zp@lists.linux.dev
X-Gm-Message-State: AOJu0YxzInUCXfPEp9RLIMtOPbfHT5KNs2s8DocfXhJ07R2y1l58+wit
	dwQCl50GKcZWw8+RwrIgGMrNauP1kbaBXgoToihx5mbmzBYtbyG/F5+y4k3K0IOTEyJoS/0WdKq
	ZcX4BKMdu3PWN6j0h0Ux1ufR4y4n5vCU=
X-Gm-Gg: Acq92OFQlkokUCM39F/a8isiMpezd07MnK5SyMJ/C5Qf3bisle0tW08STLnyynQVxSc
	Gljl59tN2lXbKXir8E7WqOrwOG6+vnGa5n3brHAzy10MKLY80xmdkT3Wo834Af/tVgRLGB/9aA5
	t2HKlNj5OmEOZZqy4BsCzFbw96UrIeOH3VagUkzx5X0PeNauygo/6HVHkxdHhlqjB4yQ/ys4SYu
	c705OHP+4L0/Ljjr25lYiimrOXJujr7BC9dYdhf8h0JoDC93/xNhYeTLKR9K+8d4x/vnkAL8BwG
	IpN6Cr0r5mhV53qI5qnMX/sQbFixvpX2Uq6DYnBaSJt9uQw15wprr690UBp3I/TdVzLl/oAAwN+
	SQBSgCur6tC4Xm//7GHKDznA+Rq8z2A8cxC5d
X-Received: by 2002:a05:6000:2c05:b0:43d:7868:21f0 with SMTP id
 ffacd0b85a97d-4515b056a7dmr23961689f8f.9.1778278590502; Fri, 08 May 2026
 15:16:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260506150547.767315-2-paulhoussel2@gmail.com>
 <20260506210856.C6C29C2BCB0@smtp.kernel.org> <CA+aJb_1vFaSvBjsZbi_EYhGfiefCruaEaLqgagX6HAGfLFxqGw@mail.gmail.com>
In-Reply-To: <CA+aJb_1vFaSvBjsZbi_EYhGfiefCruaEaLqgagX6HAGfLFxqGw@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 8 May 2026 15:16:19 -0700
X-Gm-Features: AVHnY4LmEprSW8fEF3PF0JuH8iIdLeksir3-oE-WnUPnoXE1yPhAwdPpSbusQm0
Message-ID: <CAADnVQJyT3fLLv8hnBQHhpc7AQhsAyLiiECm6APqyrt10kzCsA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] bpf: render CGROUP_LSM_NUM configurable as a KConfig
To: Paul Houssel <paulhoussel2@gmail.com>
Cc: Paul Chaignon <paul.chaignon@gmail.com>, sashiko@lists.linux.dev, 
	bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 7, 2026 at 9:40=E2=80=AFAM Paul Houssel <paulhoussel2@gmail.com=
> wrote:
>
> I would therefore propose to set the maximum value to 50 or 100 (where
> cgroup_bpf is 2024 bytes long), what do you think Paul C?

Sorry we cannot grow it with documentation only.
The whole thing needs to be refactored.
effective[MAX_CGROUP_BPF_ATTACH_TYPE]
is problematic as it is. Plenty of memory waste already.
It needs to be replaced with scalable approach.
Yes, it will be a big change to __cgroup_bpf_attach()
