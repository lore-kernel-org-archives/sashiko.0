Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C827C3D9DAF
	for <sashiko@lists.linux.dev>; Fri,  8 May 2026 20:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778271994; cv=pass; b=GfXTe3K9FdawVf4C+YWi1A7CtRf1MJChxyO0zkViBZER/MjBS+XkXu7pugg0aMoKY7PPa2ROS1iMOyyJcoousPNtnBSoIfnKOS8e3asf7T2fybdBgt6G8W1l47tjzuTn3khMKQWWpIucmWjEfw1MmflNqxmzF61wz8UhetgtnlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778271994; c=relaxed/simple;
	bh=lxuW3j4GqHcptgKyL/J2NALd6wSfGcijzfrXHbAVRVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UqNfWivw3Oi7IX3yYB8ld5jTIafI1+vQNmh2M7NCseigFMbXG/ruAOvOqW35lg5ToHJIHb1VH+M0AdNfPJnUfLkh0oI5gyRwx7bKc9bfNW4yUyhw+lRBiXvY/rbJoZdPVM/OIq/NUzo198Y75jHYPrJkwetUPAYMyJl0Vw+Gu+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dRfodaac; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dRfodaac"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1329fc4bf77so353872c88.1
        for <sashiko@lists.linux.dev>; Fri, 08 May 2026 13:26:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778271992; cv=none;
        d=google.com; s=arc-20240605;
        b=Lvhu12oa9/9aMfbz9whGBGl0As9CuxurXhSvkV4Q1P/T8xAJBNho0iJ6L3YSXPqRtZ
         jaF73Q0Z8jQwduan5//GnFPMFHjiO0+RmFgt5iVFrKgZBO5rafgYgEmOs7dmkVZP//4e
         tryyt/s8Tk7DIh2xmrxfK2PPV6H8taPbatDPTOXTqyRV4qSs9mKxFyokXlWqC+66hXdE
         m2541aYDSTnTa9aQKfDyUtA+wh2Ins4xpNmnKI2ijE6pII940FnQL0VgKJJhA6tPz3Bc
         MJDlrCdUlnammR+a60c3l3u1Gf36r63aKyYQAsBbqTq765K1Wtwc2gE29gNwZnJWveBq
         F07g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3odDrbDW8wBjms51QgSiFASGVEEXp49Os/e0qhZVjuQ=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=ITpHaXMukHJE2X3zjc39fqIF/kBMIX9/KzW8pMKyMYnDEigXXvTAljLehipsgiLTVs
         hrTcT9Mmn8pUv5FW60a3d/ZVS+7/5R8F3wCYNupaZmTE7+AHZ4W1YX9R6VHdDzMMSn8/
         4WIuu9xxSOsMU+ZhJz3NTnjA955tRPJeCRyw/da1Q13uM2U92TzKP1eQBxCDhoDxHApX
         fwStCBsw4tX7+ghBXwCXLizc1TcNKNfgBoWcJumBVR7VttvuoIveWrrZ3LmFTsvE9GXR
         IDeWLnCeja+2Tzx4AlvMyLtpX/Gz4huaAO+8BZEAySJlo7Xs+ukJa2tmb8RLbxeIhqQc
         fS5g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778271992; x=1778876792; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3odDrbDW8wBjms51QgSiFASGVEEXp49Os/e0qhZVjuQ=;
        b=dRfodaac3mC5AeIPCyv80OPf7PQkV52gxWh8/A4/P1kqixpf82WXXr+BbrG8X8LY0K
         tPCsRZH7RBETpxj9k1yANygGZNErY5fTC8vZ91aqVtj8MHNoJMthGp4UpS9P1p77xS+A
         B5plQ5OJQ7yu7yW0MrWm2+NZgv4jfsBYiP8v5mpBiCx6doSqLG8sxIU9ozzfs58hgwAv
         R0uSvZJvSRGG+go1Fl4FSIS1xJkZ65VtSC/T2orQKvyZOoDFBTKZeYsjARQEvixN+Woc
         wO3cr0obenUxEfHmnxD180X1Z00s1ZPwOhdsTvoncK2hA05NwTkUzE67Uy7Q/bU7D3oc
         TZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778271992; x=1778876792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3odDrbDW8wBjms51QgSiFASGVEEXp49Os/e0qhZVjuQ=;
        b=Vq+P5xzRCni47TjHKMSd5GKPJMDA7WJZ4l+FADAfuiH0vhwvR9i8o0gZGZNqoMOH/I
         m8XsPUy5tqo7IQVitbclSbNHCCGck4hZwDMcWWoHV6O8SCtFZkJ3VQWfloSJZOmIrl16
         3aXl9m1zsfDhR6pPVfT5dsDJMWZmCkXf5tpJZ5Oq+SeHKVAMlk5+CBIJA+78Ij6axdKW
         bBcw2UB73f0aI0sP5S/pKEDtuZhTKTJzfwDCDqBlFOKl0slHnGbkPkRiC113zzg4GH16
         pOAoEL6Hg0ZUtBSx0Cn6yftwEe4FgB2DqNwUle1MTL4jBAwZQvtaUBfuL6HwA/4z+qYB
         bStw==
X-Gm-Message-State: AOJu0YyD1J6v3p6lGLFqvJoXmiyaFzo6t+GK74ILQJfOErDz2kpk+aIA
	g0Xh72xYOKijzAWt4oDxBlU7tefRPoLduml8rGw57/UWjVTGs7Pl5U/8pawtoP2on/MOhq7hB9p
	jdHhU3a8mGnfpNNGIeD5+EI/8w5FNjJzk+vjI5wVz08g0kBYv9Y7vTUWQkHM=
X-Gm-Gg: AeBDiesfugfNmDZqWZ87kIpyuXdOLVT3TJGv1Ax1JVhSA8qWqBgds+lfYGFb++b4RsY
	aH2KiWLQVNLbz2aYZTXgwI3Ay1s8q9dF68zMvMN1zM9WFWHkX31pZDc4n5Olvq504D1HS9LxuOo
	w3RiGnjHDRkY3Prb26isiIcMFq7W9kuTswF4L7SfgWqlMj/6BhTDZYJ9B5w3I3GNZYSe7YCWTSV
	LRbkZdHfBySVxJv3SQ+ssHc7PuVSJSZTW4qGKMviBSq3sfnvGuEoI8Naf1UxXqkVWzdZ13OiJNQ
	r5o6BOxrT3MCJ9lQWpNyn4bnztWIw0YXr6YbEvgq5wzAafODZmzX4RluOS9P96pvuJ7RNXwABeb
	hqa3Zrycq7GRJ3U3q9BQTCNvf3192p9s=
X-Received: by 2002:a05:7022:ea24:b0:12c:87f1:f41a with SMTP id
 a92af1059eb24-1318e91771bmr7525230c88.21.1778271991253; Fri, 08 May 2026
 13:26:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260508073355.3916746-3-kuniyu@google.com> <20260508191737.01190C2BCB0@smtp.kernel.org>
In-Reply-To: <20260508191737.01190C2BCB0@smtp.kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 8 May 2026 13:26:19 -0700
X-Gm-Features: AVHnY4ICHUHDZYm28szu71sFqY4e-p8Nj0_JIbZRlpsCllnhj2x6FBZx-tQgYqc
Message-ID: <CAAVpQUAhzd6ocMBwKFxPAKkuHyB2D-HL5fjrwcBcLrxwQbaT2w@mail.gmail.com>
Subject: Re: [PATCH v1 bpf-next 2/8] bpf: tcp: Introduce BPF_SOCK_OPS_RCVLOWAT_CB.
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 12:17=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The deliberate exclusion of BPF_SOCK_OPS_RCVLOWAT_CB from is_loc=
ked_tcp_sock_ops() disables critical socket helpers, notably bpf_sock_ops_c=
b_flags_set().
> --
>
> commit 2ab2e31caf792b1e7312616215a88ad7ae1ef4e1
> Author: Kuniyuki Iwashima <kuniyu@google.com>
>
> bpf: tcp: Introduce BPF_SOCK_OPS_RCVLOWAT_CB.
>
> This commit introduces a new hook, BPF_SOCK_OPS_RCVLOWAT_CB, which allows
> BPF programs to dynamically adjust sk->sk_rcvlowat upon recvmsg completio=
n
> or when packets are enqueued. The commit leaves is_locked_tcp_sock_ops
> unchanged to prevent unnecessary enablement of bpf_setsockopt.
>
> >     This will allow the BPF prog to dynamically adjust sk->sk_rcvlowat,
> >     suppressing unnecessary EPOLLIN wakeups until sufficient data
> >     (e.g., a full RPC frame) is available in the receive queue.
> >
> >     Note that is_locked_tcp_sock_ops() is left unchanged not to enable
> >     bpf_setsockopt() unnecessarily.
>
> Does leaving is_locked_tcp_sock_ops() unchanged also prevent the use of
> bpf_sock_ops_cb_flags_set() from within the BPF_SOCK_OPS_RCVLOWAT_CB hook=
?

Good catch.

I need to support BPF_SOCK_OPS_RCVLOWAT_CB in
bpf_sock_ops_cb_flags_set().


>
> Because BPF_SOCK_OPS_RCVLOWAT_CB is appended to the enum after
> BPF_SOCK_OPS_WRITE_HDR_OPT_CB, is_locked_tcp_sock_ops() returns false
> for this new hook.
>
> Both bpf_sock_ops_cb_flags_set() and bpf_setsockopt() require
> is_locked_tcp_sock_ops() to return true. If it returns false, they fail
> with -EOPNOTSUPP.
>
> Since direct modification of bpf_sock_ops_cb_flags is disallowed by the
> verifier, wouldn't a BPF program running in this context be entirely unab=
le
> to clear the BPF_SOCK_OPS_RCVLOWAT_CB_FLAG once it finishes parsing?
>
> If the flag cannot be cleared, does this permanently trap the socket in t=
he
> fast-path hook for every enqueued packet and recvmsg() call, leading to
> performance degradation?
>
> While the potential UAF concern regarding bpf_skb_load_bytes() is a false
> positive addressed later in the series by "bpf: tcp: Support
> bpf_skb_load_bytes() for BPF_SOCK_OPS_RCVLOWAT_CB", and the hook omission
> is fixed by "bpf: tcp: Add SOCK_OPS rcvlowat hook", this limitation
> regarding is_locked_tcp_sock_ops() does not appear to be addressed later
> in the series.

Looks like Sashiko now has context of the series, nice.
