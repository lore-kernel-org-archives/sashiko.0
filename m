Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02023009D4
	for <sashiko@lists.linux.dev>; Thu, 23 Apr 2026 23:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776985353; cv=pass; b=QZGabVO37K9mjAkkRGA1UYK9STqLhyE/g9y25wlyxCT4gQu7Z9dYTv4LRy6D12N0z0yiklANKF4sIQTXqknDCAYGaU9043NOTpOwwsOaNOHnZAr+hLIYmS6kASpK+saESNwUMWcjrhfZyI24R2gAZ1w8xV28be9CcpHI8zGjj7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776985353; c=relaxed/simple;
	bh=3IC7YlTPgihA4fb1jIjGvKMddYC2T1s/uKUswaPXhYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c6ifAF2R4QkAQaGLfn3RHA0lcKK6JaLzEFhrN3dpfXNDDZ9t6ogZtmqHT1+a1/PrB4SlVVqr8qe7qZAvAmH52YhdV1JoYFjxDryCB9NKUASO3NRYvC9ltnSmWXLos+zuDyywE7hzFtJaiHU6fdAs+BYe9iWsWt+i4SucNsoKge8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g9Z3aLok; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g9Z3aLok"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12c565476d7so1948723c88.1
        for <sashiko@lists.linux.dev>; Thu, 23 Apr 2026 16:02:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776985351; cv=none;
        d=google.com; s=arc-20240605;
        b=H11yC1ex0WC88m+Vw/Jdy7n6Ny2y3MXphl4GzNK9zRlnft81clVg+qKEQi2RQzRLgw
         nVTb3LcBwIuGimRscoHhZsVxgrkPBd/Krn5GQO1MU513VcIKcrojAbHUcir6zKjLT8PO
         ph13KE2/1CSnDCbDQEcFoKezVwiOi/tWmDAf/lfPoBNYZuEe847XZZhO3VkpgCNiD/ki
         keZg7eJTr/WF1+GcdWFow0DzLzz3WTzGBtrpV2Dq7GbdK/y4JYOdBCDc4vu9wKeRfcMs
         SCgt9Vh0cA2FtsB+KVxbaVJdt8tfscd1GnbSXGRHE281TKppUpbbaXY3w1pQf4Na7NA8
         K00A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AMUiINtUz1MSaudwAI+i9FTqVo/QzcejA5YVuhJ0+IM=;
        fh=HK2q7ANAZi1TvOmFUMySGqTFRg80ZJWx2t299fkFXjM=;
        b=RcfcV6YEQ+sZl4MQq34C5Lr5Gr349TL5wSrLgl/F3OtBx2AU4W6Bjwc6TZLvcxRD2i
         XXiw/babyAUhsKvLEPQ9qCkb5OhMvPMVzBugdFTrPw+Gv1dNiF/NDjnZxiEACpXMe76i
         UCzUX6TaGSt0r2L9j0lrvb0phALw4WQluFqIQK3+5MXtOA0HvP2rCJPEPIwbEbqmvyAw
         XBT3niswdsT0muAt9N+mT/ozZ+Yp0uwk+jd6M+uLdemIG++v9hSyXKVkbi6yPF6MlEF2
         /Ud5oHzrZTIdUsP4f214JIUUDCPRy73zB8gZPAQia/4xk+dFy9OvGKbYKKyKnejfLvqP
         BQ3g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776985351; x=1777590151; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMUiINtUz1MSaudwAI+i9FTqVo/QzcejA5YVuhJ0+IM=;
        b=g9Z3aLokPOdK1sTKscaH4AkIDAavSm4VfVYxU46q7RVpvSxujKJH2VO9j4c4fH5xwZ
         /glzNQKKqOl24KcA6KSSnTAgLpK1mOkH4thtM1VeDNdOaICunDDybchKZD+z8knYGJYL
         y9Rs5BdzjLzQeD3duomb3qUA5crg+MqSHfCsvwcHP1RBLExljWUqNEmP9gbgBbB2OC9e
         j6eLzxrZBov1F93wYNrFU3K4qK1YU/CFXiZZc+piCQaE76infBHIrKfy0IxGuin0MtET
         KDqkqyQimLNdIst8sL2yGrDXHDwi0ANJxE8X7/rHbvu7ENZFFpgpqMcCV4tToerkNlcr
         qHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776985351; x=1777590151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AMUiINtUz1MSaudwAI+i9FTqVo/QzcejA5YVuhJ0+IM=;
        b=iiWYi7o1gDIKo7v5dWXpDd8kjSDJBgBKRPPyYGX2u5Iu1W7DZMfJb5G5IEgVxerUFX
         eHOc+ogcdog79kQgUKAYqxyEONZDj+DPUai+UCQrhYa2kssJHH1C9xQiF/A8RPWiM4gb
         7ZauGKvCuFXT7ol1oeg5PEjBaDxJzpgHdN8D6kVD75q4vYtIKR7P+1XETzMh8jI2pwzU
         mjyPZuzkTWo6DNjznaYns61eOMiksZ2EQj9KIla1ziOTy774qXwnF7d3roCFSNwV1UkQ
         KuZ1foCpRoYlg0NcrInHdXyC/jO/h0Tb3V4uMJFEyn6jS2AyicPpGw//rFB4Cu2OS/TQ
         ONyQ==
X-Forwarded-Encrypted: i=1; AFNElJ8cL1glGfQSbxzzr9JWkVuTL+hviqZGGxX1u10oviunAnd46DQz0xf4yh8DgKfA/uPmHXLZoiCR@lists.linux.dev
X-Gm-Message-State: AOJu0YzOyGFatks050to2jfnXHKAkNWF+jY6cuxDG9FuRTWoplvxixAB
	7n+1vggKcfRXBjgdyH4qJ9nd9Txh77MkDAgI8q7pu4hdhVygSt0nxIlJSNFaJz0jtjCnJ/PylfH
	qz1GeBwhUFfgVs7t2BSRFXz5H5v9aGxwuC434mEii
X-Gm-Gg: AeBDiet+fC63EsBaAqiiRoTiCBGMzLC80ndlz2KH1D1crhA5HikVuBVl12Wb98I+zdN
	t8Jq2kB/0+EasN7DjqRjcCZkdbKwartr/2EEQAOLeAwlY3PulaMBqRTN8wifpcAxoaGazv3G+tZ
	KUyFHYaLqtgEMAHAdqi4S0qGgtBcYG09bXK54Eai24QJJ5ON4dprMHoHsWDsKk2qK1ah77gkT9X
	UHAsuBa9O/HtH7+9gRxWYGKY9J1rv6m1jiAhV9sWXlIdLPnAcKZa9fOiB9khTLgCFYRNlnTV+v0
	iiJmdek2+3Mc2uy4u6awbZvF0TSvmfFIzT5kzYhEVfJ25f6swBhkoLimRESCrWL7esn1dWATyGA
	0A++7z8SkzyVHUk652lboUAoKml8QkFepyGdHmFs4i36HAR5cDHDT5pQfYM+OMRB+FxfY72+hXg
	==
X-Received: by 2002:a05:7022:4199:b0:128:ccaf:85d5 with SMTP id
 a92af1059eb24-12c73f83044mr16947354c88.15.1776985350169; Thu, 23 Apr 2026
 16:02:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420194846.1089595-1-kuniyu@google.com> <20260421011357.70974C19425@smtp.kernel.org>
 <062b1b3b-dedd-422b-83a6-1ca78d7270f7@163.com> <202642321855.Yu6v.martin.lau@linux.dev>
In-Reply-To: <202642321855.Yu6v.martin.lau@linux.dev>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 23 Apr 2026 16:02:18 -0700
X-Gm-Features: AQROBzDRM0jnKEO5OrUZkvspB4odNlLou39YUScW3ykzYD7HnPP568sq7o74n94
Message-ID: <CAAVpQUDLbi9OTXak-rFvsHy51t0yNfA0q57LGivdoEwNiSAZgw@mail.gmail.com>
Subject: Re: [PATCH v2 bpf] sockmap: Fix sk_psock_drop() race vs sock_map_{unhash,close,destroy}().
To: Martin KaFai Lau <martin.lau@linux.dev>
Cc: Jiayuan Chen <mrpre@163.com>, sashiko@lists.linux.dev, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 2:17=E2=80=AFPM Martin KaFai Lau <martin.lau@linux.=
dev> wrote:
>
> On Tue, Apr 21, 2026 at 11:21:27AM +0800, Jiayuan Chen wrote:
> > > > @@ -1652,20 +1657,25 @@ void sock_map_destroy(struct sock *sk)
> > > >           void (*saved_destroy)(struct sock *sk);
> > > >           struct sk_psock *psock;
> > > > +retry:
> > > >           rcu_read_lock();
> > > >           psock =3D sk_psock_get(sk);
> > > >           if (unlikely(!psock)) {
> > > >                   rcu_read_unlock();
> > > >                   saved_destroy =3D READ_ONCE(sk->sk_prot)->destroy=
;
> > > > +         if (unlikely(saved_destroy =3D=3D sock_map_destroy))
> > > > +                 goto retry;
> > > Can this unbounded retry loop cause a hard lockup due to softirq pree=
mption
> > > or priority inversion?
> > >
> > > If sk_psock_put() is called from process context with bottom-halves e=
nabled
> > > (such as from sock_map_close() after release_sock()), an interrupt co=
uld
> > > preempt the thread immediately after refcount_dec_and_test(&psock->re=
fcnt)
> > > drops to 0 but before sk_psock_drop() disables BH.
> > >
> > > If a network interrupt fires on the same CPU, NET_RX_SOFTIRQ may proc=
ess a
> > > packet (such as an RST) that triggers socket destruction via:
> > > tcp_done() -> inet_csk_destroy_sock() -> sk->sk_prot->destroy()
> > >
> > > Since sk_psock_drop() has not yet restored the protocol, sk->sk_prot-=
>destroy
> > > is still sock_map_destroy().
> > >
> > > When sock_map_destroy() calls sk_psock_get(), it returns NULL because=
 the
> > > refcount is exactly 0. The code then falls into the !psock branch, se=
es that
> > > sk->sk_prot->destroy is still sock_map_destroy(), and jumps to retry.
> > >
> > > Because the softirq spins infinitely in this tight loop and never yie=
lds the
> > > CPU, the preempted process context can never execute sk_psock_drop(),
> > > resulting in a permanent hard lockup.
> >
> >
> > sock_map_close(sk)
> > |___ sk_psock_put(sk, psock)   <- refcnt-hits-0 window lives here
> > |___ saved_close =3D=3D tcp_close
> >       |__tcp_close
> >             |____ sock_orphan   <- SOCK_DEAD set here
> >             |____(later) inet_csk_destroy_sock
> >
> > At the exact instant the refcnt can be observed at 0 with
> > sk_prot not yet restored, SOCK_DEAD is guaranteed not to be set.
>
>
> > > A similar priority inversion deadlock could also occur on PREEMPT_RT =
if the
> > > thread calling sk_psock_drop() is preempted by a higher-priority task=
.
>
> The same SOCK_DEAD reasoning applies to PREEMPT_RT?
>
> It is useful to have some explanation in the commit message for this case=
.
>
> Kuniyuki, does the above make sense? I can fold it in before landing.

Yes, that applies to PREEMPT_RT too and the AI's scenario
does not occur.

Thanks !
