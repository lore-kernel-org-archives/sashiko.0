Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FBE386440
	for <sashiko@lists.linux.dev>; Tue,  5 May 2026 05:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777959803; cv=pass; b=oUPQ6+/aLDi4GHUUizPKWyU/k8r8nsbOgzedtFhpSqHc5HZisqnrhp7MHQrejNyu3+5BO3HtIEubDvG8qJ2lAGBheZaOBh09Y+iBzi/JZcb45+98iMBAXotDPQnrct/qNDrG8jXF3nyu6QaxcuOUkKQwvdqybOCyhBtcY3IusM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777959803; c=relaxed/simple;
	bh=PBDvQznMxWjpcwNYDmYcjrNP7ss5epTT/kwErEyvUEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rQNzz8J0Go68iCl/PnTd0BpHD626u+Umn17TuIOC+3kiweCg1kzuGOKOzl9sswBuBzIFda7S+1LljDso6PCdvWSf0ccUBkdNGCRQ9hceBo+jYCvRDpH7yRz3fk9w9XwLvfd1P4JNZzQCFR7NEU7yiGgyybJ3Ym/4x4wIoqc6his=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g5SXCIg1; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g5SXCIg1"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1309f4ee973so1179839c88.1
        for <sashiko@lists.linux.dev>; Mon, 04 May 2026 22:43:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777959801; cv=none;
        d=google.com; s=arc-20240605;
        b=AHzdTzTWNAaAePwMUI6r5ce8TsrP0z5ZPg1leWX2BBEv4sPj4vLu8J5TQ8wsCZgso9
         7dD4EkhLmHi+oGivvpWozbK/WOMmEf/CjwFFJvzPjk9CGrxPilJAH8VZhcZVJ1awFJlv
         sgmzMdmCvOBEe+Hp73n+5Y5yuJQuVd15Ou/ACcANh7KtEgQzpWiwSfSQOHFDwo8jsyR6
         Ap2yFoND8NpW+FhhZIqZd6lWA0eX+xlh4U4vSNL5UuSht3sjNO8AI2pVKrBCIJp2pj6h
         HJUcmQXz+EsJusdsHwaw8qIk8IFtySjlnDeI/RSrGqUTuBdaeZbxr5WDPihzwWPevFmR
         DtsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ID9/lDtQnEfLjPMFXed1O963xIM5qgALbX2MVBfWr7U=;
        fh=BPNtcH7ntRniEjYIhZkfaTTujl+FWspWzDXVu7iCfaY=;
        b=ZnP2GWoLCm5nMdHI1mFDsq64Q+A6xkP2IdyVAbu2ye4nnocT6RpKR8dR0S01wNuhae
         U/ro147NtIjLU3jwmYgARPu10IR/Zfthy4DlTTz565rXwQLO2yjoCEBJB+xcDPZOrQ0u
         /pTiHdQ8IyhQzRbyNimIQ1EHGqCC07rIMPsdvYU3++Z3fBLeZzbUTJB8q9IsqRgUr0Om
         ST1PD9IbuBf/yRokBEHPbYEtz9uIagCrtTSrhn4B8jiF/fLT1eJEHXSIH0tvbKeam6Sz
         58RKTHdaS2ntDaBMOhazL9kZCzaJdZwa8uMywdI9YcXFmt7UtfVCwWo2XZ5cdFKe9dWg
         DR7g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777959801; x=1778564601; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ID9/lDtQnEfLjPMFXed1O963xIM5qgALbX2MVBfWr7U=;
        b=g5SXCIg11/CWOCIkDC9ofoLYUDTex9cggycsNiM8SO8vr2jJscyvsI5zc9yP3ql5t2
         vHY7Km6dywbOBsbNKnNGKaYu8dBsLbpSrnIkHHuCfJopsbx51ihRdWZxRdRZliIBNk+X
         acJ9GBvj30/yCAA2UMI+FkkSzu1884RoXddg7pBL/9K5EIAQh8vgNkTwPKxbK2sPTXBk
         FnQD7ZsARrPfgHnOpkyv38m4ZQyCacf7zUikxlJKtn1Bl8WaOxveUMXsDKt7shwq/6Ff
         j2k9vxTmwuSiEJ63yJHRLPfxsvawQtFjnxoba+YRDiSaLj94g9LWt9fNB5A2WU/4p5i4
         M+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777959801; x=1778564601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ID9/lDtQnEfLjPMFXed1O963xIM5qgALbX2MVBfWr7U=;
        b=Ym3BL3Tt2w81wHZBzPNbI0/9T39vjjxOXbcQmcpmcLX5W6WaawxNuE1RdIRjrOIHVL
         DYYSpMIbytFI5Daii9k0pO05CI9G+IswY0H7DFofL9piHyB+S316lkHU/spB9WVCI7xA
         7/7mEvBjFx0S75bVdbm9JG6TPjqvQ7r1vYbF0A8aY8yjIt2I6+8UIESlQQBsjZFb4VqC
         InPk3F4dOYSFHB1QQv2GOTESNMbN0bKY34bEYCwvRR6DuDzNDI4EvfSJ+Li1Y7S4bRkc
         dfy4JUTcgwd0RRAksOq6tFcXEhsAtiFFJOEHqeKBlg714sLqO00xcFmL5G2EShpPEwvT
         S2/Q==
X-Gm-Message-State: AOJu0YwjTExYPuoIgR18P9MswiqsDbIFa/6o5PRXKDA/prFpBC8xyCHL
	RUtMNPJLbFGDuJsLAlAxC78tpu5ybqnTzfkhwBh5HK4Ln3Ye++6FBdfkmE/epTlpnwryuZolxq1
	a7p8acUT+YeKtwNQ/tpgg6pPCVUP0aHmzwntKfMOpdvDODCGnwq4gbznubn4=
X-Gm-Gg: AeBDiet+PhQ0Q6Nfh1QtywHQXWMKAeU8HE5I7AQBNdH8zash0/O0pbJ/+ok4+QywlHC
	JLSVdsCzhOM39vVLeQkXtOAD4BTSQYP9UGPUTq4yRZCXN4XtTjOW/7/TYkBzRGlm0EpMjfnvJxL
	rvCAC4rGipFdBRgGOgCe4R5tAnsacZU+Ff88t925aOIBLOyP0uGQjqvl36fX23dxKjiSvxUkYz2
	HPa2gBPtlZ5AEpZCLsixn5/RLxNeJf0LnCPkOmvW55t9tExIu9TYPLEaXZm7K979SobMyI4++37
	ukpeFTK7dzJi6lRgJPIs1OXztmzsMw0C6X9sLQx7Io2fVCvnkTrbbHZroYAkkZQVfT6vWGRTfCK
	PtQ6Io4njg3mbI0KWqp0da17dRJHmlbU8wNg4Vdq/4voP7Y2ycbHol9ULFDpBRdVc6ESPmYDi0B
	wAOgayM/An
X-Received: by 2002:a05:7022:4381:b0:130:9bce:ba26 with SMTP id
 a92af1059eb24-1309bcebb05mr1826901c88.35.1777959800854; Mon, 04 May 2026
 22:43:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260504210610.180150-4-kuniyu@google.com> <20260505041435.187D0C2BCB4@smtp.kernel.org>
In-Reply-To: <20260505041435.187D0C2BCB4@smtp.kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 4 May 2026 22:43:09 -0700
X-Gm-Features: AVHnY4JOCOb71wu5mt1KFGtOvg7crQc-IG8Nxqs_vTCH-gFp-2Dt9Bt1UXsuzwI
Message-ID: <CAAVpQUB-K4YBE5Em4xg5wWsjtK=7xZwwXFynX2vUN4DQDx2tRw@mail.gmail.com>
Subject: Re: [PATCH v2 bpf 3/6] mptcp: bpf: fix type confusion in bpf_mptcp_sock_from_subflow()
To: sashiko@lists.linux.dev, Matthieu Baerts <matttbe@kernel.org>
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

Could you follow up on the comments by Sashiko ?

On Mon, May 4, 2026 at 9:14=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] NULL pointer dereferences in bpf_mptcp_sock_from_subflow due to =
lockless concurrent accesses
> - [High] Use-After-Free in BPF programs returning freed mptcp socket duri=
ng teardown
> --
>
> commit 52dbcdaad7d49ff5db2faacf11c47b1c581024a8
> Author: Matthieu Baerts (NGI0) <matttbe@kernel.org>
> mptcp: bpf: fix type confusion in bpf_mptcp_sock_from_subflow()
>
> This commit fixes a type confusion issue in bpf_mptcp_sock_from_subflow()=
 by
> checking if the socket is actually a TCP socket before calling sk_is_mptc=
p().
> Previously, raw sockets could bypass the IPPROTO_TCP check and cause inco=
rrect
> assumptions about the socket type.
>
> > diff --git a/net/mptcp/bpf.c b/net/mptcp/bpf.c
> > index 8a16672b94e2..4cc16cbeb328 100644
> > --- a/net/mptcp/bpf.c
> > +++ b/net/mptcp/bpf.c
> > @@ -14,7 +14,7 @@
> >
> >  struct mptcp_sock *bpf_mptcp_sock_from_subflow(struct sock *sk)
> >  {
> > -     if (sk && sk_fullsock(sk) && sk->sk_protocol =3D=3D IPPROTO_TCP &=
& sk_is_mptcp(sk))
> > +     if (sk && sk_fullsock(sk) && sk_is_tcp(sk) && sk_is_mptcp(sk))
> >               return mptcp_sk(mptcp_subflow_ctx(sk)->conn);
>
> Could this cause a regression by dereferencing a NULL pointer when access=
ed
> concurrently?
>
> In subflow_ulp_fallback(), icsk->icsk_ulp_data is set to NULL prior to
> clearing tcp_sk(sk)->is_mptcp. If a BPF program triggers in this window,
> sk_is_mptcp() would return true but mptcp_subflow_ctx(sk) would return NU=
LL,
> leading to a NULL pointer dereference.
>
> Additionally, could ctx->conn be NULL when read here?
>
> During subflow_ulp_init(), the context is allocated and is_mptcp is set t=
o 1,
> but ctx->conn is initially NULL. Passing NULL to mptcp_sk(ctx->conn) trig=
gers
> a kernel panic on CONFIG_DEBUG_NET builds. On non-debug builds, it return=
s a
> non-NULL offset pointer, which bypasses BPF verifier NULL checks and caus=
es
> invalid memory accesses.
>
> Could this introduce a regression with a use-after-free of the mptcp_sock
> during teardown?
>
> During subflow_ulp_release(), sock_put(ctx->conn) drops the reference to =
the
> parent mptcp_sock and may free it. However, ctx->conn is not cleared, and=
 the
> subflow context remains valid until the RCU grace period ends.
>
> If a BPF tracing program triggers after sock_put(), could this retrieve
> and return the dangling ctx->conn pointer, enabling the BPF program to re=
ad
> from freed kernel slab memory?
>
> >
> >       return NULL;
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260504210610.18=
0150-1-kuniyu@google.com?part=3D3
