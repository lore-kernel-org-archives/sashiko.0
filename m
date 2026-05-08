Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0461A39098C
	for <sashiko@lists.linux.dev>; Fri,  8 May 2026 22:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778280469; cv=pass; b=VrXvg6lnh28+4IsKs4wxH1F5KDobugyU+mMWGahptFmS3ShWhNrxYTRZeGVnDmynPwOb2GCU4J42KDwj3Y+Kl7Q6x/SnHD7l2/DZLw4CC88nsgAf3DxxBu9JFn3lBhaeNvIFgMZT/ZwpcqmYWTdtLIx641wA8Gcmn3tsJ4R/T8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778280469; c=relaxed/simple;
	bh=ClpI8Jlme1QeRO8t/qIzKXdal214TarR5FWmGVqWkuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KhAqVmCo5d/jYY6N1H8auiF0YAmAUXU9agak9QyNzC39a1gMiLRxrd2tPC2Rm/80PjRJk/uCYZG+Ju6h+JvIYsK51WQKugHsvVJhIj13W5TwmE7bCelkpDcNYAaw0xSMfgb83uhVkpM+Av/TVW+ofoz6wO9Z2t7z2hZ+spEaKEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rxxoMOO2; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rxxoMOO2"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12dfee30612so2623007c88.0
        for <sashiko@lists.linux.dev>; Fri, 08 May 2026 15:47:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778280467; cv=none;
        d=google.com; s=arc-20240605;
        b=RcNDAUnLwmpugPYLay1h8ut5gkGL/SnPpwe5LzLBKI/5l+nT81XtaOyGzqOYGuLiXM
         QWMN6Jn8DPROZDSTFAPLZ1OpWS0Lkk1Y1ESDCpcfwqVoDLxtR22Hmdf/IFq8rrG0q/bk
         RHJJgQ4r5awkKDucKF4GKdg/Xxj93ljUdUfM4zC6b/rNt2Z+mJnlJzHEo1tJ3Ldd+AxT
         3N7r4NbDizyKYSZrLJC1rj4DRNYR6DCYdIlSimGhFY1U8zj7+piZcZPvtuNYgGaDWllm
         Fs1xkYnB/UjZyBO/ERLlKn+L8mpDoM5zpvdRpoH21GpWjininAsZi4evA28wPUsqj3WA
         ib7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LO9HnjJ/HwzGlHuNioBxerXiRJfjT6Qmmmi8RvuKYZ0=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=fkSyBBhZkMPqNd3SwNhk1pbAVeOvE2vbRIZMw7gcfTU5qBSphOSc1zoZz40HVYCDdC
         +r/G5gMbFQfPkC+9Bi+img7SqZ4xtWKDOhQSw2HZ7LdSnW2nwBDiYjNOpCq62PQJh4an
         iiRhFOLE/2Lb6MO5OzIcmqiUyN+eddrBfA3z0XGrbl/l1jy5j8QHARNE8c7usEzsdKCv
         DC+nC6HClAM1k00ig8IeIcSyBQrIaNoXhdakFJK6JkFyOAhjwxcq0NYpnC2XlmhHjwAi
         G2Fm5mSOTZ1cFClYujKHxImXtvaKLpXeSSoczwINFdCJk8j0MOVPRq/XgLEY69no5wp+
         T2sQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778280467; x=1778885267; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LO9HnjJ/HwzGlHuNioBxerXiRJfjT6Qmmmi8RvuKYZ0=;
        b=rxxoMOO2EsWD7IxhkqTW6PNQgxAJfDZdZq5TUuUdYLsDb9l8QBptHW2Kk7lEx5k3Si
         ntIGacPsmMDkeyBj8dlnJlBbP7vJKXORsDTwVVPnKTLNGX3Ibqpiz664eZV9ooiza2GM
         huNsnbmj3Qumj6Rjjbak1GHp3NpMzAQ0GPlPB1RAf1tToh8XjDsQvoc9EzeNrdMuENGN
         GWgZhNhKlHaqf9z5ki810dcGtmX8rkwlkwNcxppmYNWxJ6nMxzyfS79BTQvoYMaSUYii
         Y3JH0jhRxCCdmw20+6SrNUHs+RgQRAAPF4w0MnQmWBWoTGLUENAYAabgWSXFspeayNQO
         hGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778280467; x=1778885267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LO9HnjJ/HwzGlHuNioBxerXiRJfjT6Qmmmi8RvuKYZ0=;
        b=c47N3DFBbgTm37ryRwn6BSVWAcZUguTlGSMe1yqY+xkZS9WlLQZRtLi1Od6Ih6rw6c
         kdVcAo8QHYHjZ/tc8bo4OKdmcElbNjdrYi9d9akPILblROk96TXYVQVIym0YA1BpNzSN
         081+bOryxFzlm+tM0WW/eMUiyGtS0G4Mc+cvbTpm6PYq28Arnoqz7Z1BNCvJ2fpu2pS8
         qp5BSlLMg3kcLBnSxFhUhvri4XtVR1ZePqNfWjZd2tpS8ixOEgi1UxEzLjHdhfd8WvY4
         znGnlJmq3VhEQaU061LaLxXGM7jbRt4Wrozcy+q3LBjzJS9gqN07hiELC5B/m26z5ocz
         Bscg==
X-Gm-Message-State: AOJu0Yw3cGfdOdMD/i8zGEpt0SdTgCy7/HziCXFAnBJXoKsKUFdIW4xv
	ysqGlqepiLsybo1teKhq+isCrbZa1yffula8Q1g0sFLjgKCBjAzBraHpbRRZOops+0TEbxOPImG
	zPLQRjiv8TEYtz4NnA38vuOK/xZoJX+e+22CbNMTu29+D/rWBhsO1QD21
X-Gm-Gg: AeBDietWA+UhFxlRAID6SCIbdo0TyHfIgu+umR+bAMRlYcYm8nRI0SPaACQxlmtQM36
	gbm/UtSLQQ5bpG7ToZP/IQQyyY0RQJYxzTptG3+0fWZW2J8DXpCZvbEmPhEFAFYk/g3FZUjXdmK
	kKtH3VYdn+ypJ2zOLLZv2ehfqD/TtxPn/hnn8WtYkRl7JnaXMaMELRwQIcx+gaH0aabA6jnDC4W
	uQniEv4ooemn7zNTTc/iXcelbvHlzgrzQl6dY35NbyNsNmXCUqEBY8kafSdv9XtLxQQsFTDs7xM
	5uzy4OmbbflmrEPShM6ZIW1ahSB+IrSTSiPw+7YW0bgtYnEKPRr0rAy5UNjBJqYvAgLQ4Whfyku
	aDKz2zT1uYKBX5lwtZ1+0hKDZrPj4rKc=
X-Received: by 2002:a05:7022:6987:b0:130:68a1:a237 with SMTP id
 a92af1059eb24-13271cb33bcmr2739311c88.35.1778280466191; Fri, 08 May 2026
 15:47:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260508073355.3916746-9-kuniyu@google.com> <20260508221719.EED64C2BCB0@smtp.kernel.org>
In-Reply-To: <20260508221719.EED64C2BCB0@smtp.kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 8 May 2026 15:47:34 -0700
X-Gm-Features: AVHnY4KKMq1w4Rg9ZKPKy6J_t8S5lTE6KZpSdpe5GwyyiTGMiekCJ7QG-AL3PAQ
Message-ID: <CAAVpQUAwFPkS3rL_RtVgVy7PtzXtxCN=ZfkTn71Kb2-37D+sDg@mail.gmail.com>
Subject: Re: [PATCH v1 bpf-next 8/8] selftest: bpf: Add test for BPF_SOCK_OPS_RCVLOWAT_CB.
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 3:17=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] Flaky test design due to race condition between send() and epo=
ll_wait()/getsockopt().
> - [Medium] Pipelined data causes a TOCTOU race that permanently breaks an=
d disables the BPF autolowat program.
> --
>
> commit 7be0b88b0617982ff63886ecdcf680fd3a6f0db8
> Author: Kuniyuki Iwashima <kuniyu@google.com>
>
> selftest: bpf: Add test for BPF_SOCK_OPS_RCVLOWAT_CB.
>
> This commit adds a selftest simulating a production scenario where a BPF
> program dynamically adjusts a socket's SO_RCVLOWAT based on the parsing
> of RPC descriptors. The test exchanges partial and full RPC frames over
> a local connection and verifies that epoll wakes up the application at
> the correct boundaries.
>
> > diff --git a/tools/testing/selftests/bpf/prog_tests/tcp_autolowat.c b/t=
ools/testing/selftests/bpf/prog_tests/tcp_autolowat.c
> > --- a/tools/testing/selftests/bpf/prog_tests/tcp_autolowat.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/tcp_autolowat.c
>
> [ ... ]
>
> > @@ -0,0 +1,350 @@
> > +static void tcp_autolowat_run_rpc_test(struct tcp_autolowat_test_cb *c=
b,
> > +                                    struct rpc_test_case *test_case)
> > +{
>
> [ ... ]
>
> > +             switch (event->type) {
> > +             case RPC_EVENT_END:
> > +                     return;
> > +             case RPC_EVENT_AUTOLOWAT:
> > +                     err =3D setsockopt(cb->child, SOL_BPF, BPF_TCP_AU=
TOLOWAT,
> > +                                      &event->val, sizeof(event->val))=
;
> > +                     if (!ASSERT_OK(err, "setsockopt"))
> > +                             return;
> > +                     break;
> > +             case RPC_EVENT_SEND:
> > +                     err =3D send(cb->client, ptr, event->len, 0);
> > +                     if (!ASSERT_EQ(err, event->len, "send"))
> > +                             return;
> > +
> > +                     ptr +=3D event->len;
> > +                     break;
>
> [ ... ]
>
> > +             case RPC_EVENT_EPOLL:
> > +                     err =3D epoll_wait(cb->epoll, &ev, 1, 0);
> > +                     if (!ASSERT_EQ(err, event->nfds, "epoll_wait"))
> > +                             return;
> > +                     break;
> > +             case RPC_EVENT_RCVLOWAT:
> > +                     optval =3D 0;
> > +                     optlen =3D sizeof(optval);
> > +
> > +                     err =3D getsockopt(cb->child, SOL_SOCKET, SO_RCVL=
OWAT, &optval, &optlen);
> > +                     if (!ASSERT_OK(err, "getsockopt") ||
> > +                         !ASSERT_EQ(optval, event->rcvlowat, "rcvlowat=
"))
> > +                             return;
> > +                     break;
> > +             }
>
> Are the epoll and getsockopt checks vulnerable to flaky failures
> under load?
>
> Since TCP loopback delivery can be deferred to softirq context, could
> epoll_wait with a 0-millisecond timeout return 0 if the packet hasn't
> been queued yet?

No, it's over "lo", and TX/RX is in the same context.

>
> Similarly, could getsockopt read a stale SO_RCVLOWAT value before the
> BPF program gets a chance to update it?
>
> Would using a polling loop or a positive epoll timeout prevent
> intermittent test failures?
>
> > diff --git a/tools/testing/selftests/bpf/progs/tcp_autolowat.c b/tools/=
testing/selftests/bpf/progs/tcp_autolowat.c
> > --- a/tools/testing/selftests/bpf/progs/tcp_autolowat.c
> > +++ b/tools/testing/selftests/bpf/progs/tcp_autolowat.c
>
> [ ... ]
>
> > @@ -0,0 +1,316 @@
> > +static int tcp_parse_descriptor(struct bpf_sock_ops *skops,
> > +                             struct tcp_autolowat_cb *cb,
> > +                             u32 seq, u32 end_seq)
> > +{
> > +     struct rpc_descriptor *rpc_desc;
> > +     u32 rpc_copied_seq;
> > +     u32 copy_len;
> > +     u64 rpc_len;
> > +     int err;
> > +
> > +     rpc_copied_seq =3D cb->rpc_desc_seq + cb->rpc_desc_buff_len;
> > +
> > +     if (before(cb->rpc_desc_seq + RPC_DESC_SIZE, end_seq))
> > +             copy_len =3D RPC_DESC_SIZE - cb->rpc_desc_buff_len;
> > +     else
> > +             copy_len =3D end_seq - rpc_copied_seq;
> > +
> > +     /* Since LLVM commit 324e27e8bad83ca23a3cd276d7e2e729b1b0b8c7,
> > +      * clang omits the "copy_len =3D=3D 0" check below, which is nece=
ssary
> > +      * to satisfy the BPF verifier's range check for bpf_skb_load_byt=
es().
> > +      */
> > +     barrier_var(copy_len);
> > +
> > +     if (copy_len =3D=3D 0)
> > +             goto disable; /* FIN. */
> > +     if (copy_len > RPC_DESC_SIZE)
> > +             goto disable; /* always false, only for verifier. */
> > +     if (cb->rpc_desc_buf + cb->rpc_desc_buff_len >=3D &cb->rpc_desc_b=
uf[RPC_DESC_SIZE])
> > +             goto disable; /* always false, only for verifier. */
> > +
> > +     err =3D bpf_skb_load_bytes(skops, rpc_copied_seq - seq,
> > +                              cb->rpc_desc_buf + cb->rpc_desc_buff_len=
, copy_len);
> > +     if (err)
> > +             goto disable;
>
> Is there a race condition if pipelined data is already in the receive
> queue when BPF_TCP_AUTOLOWAT is enabled?
>
> Looking at tcp_init_autolowat_cb(), cb->rpc_desc_seq is initialized to
> tp->copied_seq. If there is already unread data in the queue, the next
> packet arrival triggers BPF_SOCK_OPS_RCVLOWAT_CB.
>
> Because seq (which comes from tcb->seq) corresponds to the new packet
> and is greater than tp->copied_seq, will rpc_copied_seq - seq underflow?
>
> If it underflows to a large positive value, won't bpf_skb_load_bytes()
> fail with -EFAULT, causing the code to jump to the disable label and
> permanently disable the autolowat functionality for this socket?

This assumes the client will stop at a certain point; it will not
send the next request speculatively before receiving the previous
response.

In such an irregular case, we want to fall back to no autolowat,
so this is fine.
