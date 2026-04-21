Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D297239A818
	for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 08:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776760156; cv=pass; b=aKFqVPd96vQmtroq2lprU9c2IKRr7XGwzemBbOpkiyO423CpbOttW8rDtbhSHAFUXfRB/QW22LuOlCPhDVLhy8QVtUCZnbhGZeCplj1zWdz8bBAZ31kE9FrR8IoF2NGjnsVAqLRxBOU9ab9+0r4AdJsXPqeFh71PGcwvy0YQiDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776760156; c=relaxed/simple;
	bh=DxweTDA1HWr3vdrk61H0Qs8so9f8NrtGRJglz2zsZwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ve8wWZVWDj5ifjqd23tvq2T0S9CGLv4mInthsN2INI5Li9TExCNLL6xJ6h3YQOmB4HEoliedxMO6BO4Q9gDRVbSXTv/5x8bjoNwULV9Vg9LPlbgYDPXEkkEqtKJnjzZEsP3eJGCPEMGZnHFOjy+Dsn4tk8bgqXf1Fn+EHogjmOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PMXwfcos; arc=pass smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMXwfcos"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-464bba3a9easo2054556b6e.0
        for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 01:29:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776760154; cv=none;
        d=google.com; s=arc-20240605;
        b=LdQO7jaVMRSS2mmZxEhl3N47AZ/zfIFjvFrQivE2+9eo8NGRY8EiF3kJI/yd8LJPKo
         +V1PfB9GegtzFTX6vQS9ken5UmgV3lxikWPjJF4nin+NGdnDvcQkdbZUeN5vZ3TS1DuP
         XHFQxF7cdKvn7/HP82/ZRUI9vERUPS20354k8R/umiwDEJUEXLxmkzKaCQO2j4CwiBjp
         mPN2UQvFvLVYZ77to4vu6DCZc5PD6Ik/sFI83GN/imfN7R6ppDZOZPqT0+S/fSDU+gts
         9zcjPjoPemrZfDj2wLOzgMgbi/DCSFWTcF9P2nUHMBFDYMbFJOhCX9L5XWS296HmYMlR
         +DMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WBVIXswxrTHLxN2X8g7ZfdzVtDIvweY9RptkLep9mS8=;
        fh=iJ/Y6mooKg8w9V941YofMm4Ar8PUH/p5dED8m8WJDcQ=;
        b=D1NYLMBRqcnOEDyw4t0L1l+XawI//SKZJS2rX3kIclBrY8bx477yH/MPNEg5lcJsba
         atywDhz4znvkeSW/07wN9Pa8DbNx/V/+rr/UsgOVm5Nih5BIhdHYwW9iIgnE9aZ/rIuc
         Kf/XEq6E68/WIa1B0HSZdkIxdCctz7e9DX4Ov3EgXHZrotxw/Kd5ifAYNoL6uiLqGUke
         wPoYAsMGoBAtvip24DsmB2+xXXVrmbAPuC5KrpAFmtPGAWhBSQDzEMIl31ZBFyoUj9lu
         l2E2R1sHmnV9amWoC40/SDCam0QoR/zc7UaAMk8xRNpdkOdVUnqIoedXeGiK2aN7sRdT
         L13A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776760154; x=1777364954; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBVIXswxrTHLxN2X8g7ZfdzVtDIvweY9RptkLep9mS8=;
        b=PMXwfcosn8ghyT1UWHuw/E6v2U7B41XMdWtB4sUGjKH63y7HZHwkgRSdAdQ8dvLDpQ
         8ltzcUlgKdIPqjn5ADz0kyoguSA3kYzABAqC4Zs8Q6fZnpuQ9Q/8+7Zu3mqh+nKqEgcX
         GDD89/JWIRPHrd+a0/MjDsYM/wBt5w/UO9gmzYUhckMZl1q/5hjHDzNwOdES4wtCEJRD
         xTEhPnS/OXV686Zv0oCUooN01+GgMoA8O1qGTQiJ5bpRw/szrc3q6PSR9UGmF6S5CVXm
         ObLm51o23tF2aR/wHW2Qvf61asNldTaDoVRr+EapgvLpsg3U5kYEPgdqKV9Qfb7VFfnp
         TqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776760154; x=1777364954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WBVIXswxrTHLxN2X8g7ZfdzVtDIvweY9RptkLep9mS8=;
        b=NHa6b9wSR8/u6Ev6pruVQOR3/Iudq7DyG2lMwgnd//9/qgbKd4BwHI7PN1b6Kdw1Nv
         UOJpWoV1QBoBgNdsGZhwDuHCWKMhfvse8K9IqHbRFIApMPaXKvwfscvW/3KnQYopvTLu
         jPX+6hW3T7kbGaOL+9tIVrME6toP/WDPZEVaz9yuI0QTbP8R7yQ2K7OpeLLp1YUomOsc
         1mhhNKulhriOCtx3yuh89m9BwprtBpwX23Lbs5XJyJAJC/tXcCtCEYNNT7StinWHse1Z
         HQP0+MqyRO3jX0/V6fJQXQ3Xf3A3I+ijzN4lHYORHUYldcnkUmccvmPe6oraZ6ZPshMe
         uRMA==
X-Gm-Message-State: AOJu0Yxb7Ez6lBQcQ27hDclYlr39EGQPE1zN6Y8x4TiP70O0pgvcVkuF
	vw360PKcbXnYMas8GAjLXxioWEls8dkZrrbuj9mnafpC1JNXk+dThw+Qmw/yyuydSzDgyx9/au/
	qICiMAuCkmvJm4VN6tRd0ow5dOOPOluW9a6yn
X-Gm-Gg: AeBDieurPVsOVLTzQG9BKVAUp6lvfEf8ZYvkTiGwAtJ40jFeHQPi8vimwFBSby/E8R/
	uzbiaG6qrWl/eiVk8jWlCAm+plJHQI2zaFihtn4mI6Jn3ajc2BKCoJ/w8tH24tYpUaXs1u1SHZo
	j7izRW05Kt7SVE/LvuOKShiqXxJG4HLNiafymvH9teyvcGKXBbauS4Q0C9xusiilKEzRrIKZlj7
	IL5n3xLLt4uqt2Pw1JlNnaAaxHEERjQ4cMfrxAT/lpfwrzu0oi1JtJj/+NfIVDJPcsNz/jrKKlw
	lqtdSo94KEhlheg+q/GE
X-Received: by 2002:a05:6808:4f21:b0:45e:69af:6bc6 with SMTP id
 5614622812f47-4799c8efc88mr9708304b6e.13.1776760153594; Tue, 21 Apr 2026
 01:29:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420184656.331306-1-suchitkarunakaran@gmail.com> <20260421004512.CDE13C19425@smtp.kernel.org>
In-Reply-To: <20260421004512.CDE13C19425@smtp.kernel.org>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Tue, 21 Apr 2026 13:59:00 +0530
X-Gm-Features: AQROBzB2-lB0ULwE7TD80N0d04Nl5b0rwS9pxFz-WQLDkYLwQhO5hDs3zwW6nSw
Message-ID: <CAO9wTFiFRSRjMRSAA+vV-AF1rJQGdoCK_p6TXvQ+V1ToaqMs0w@mail.gmail.com>
Subject: Re: [PATCH] perf/lock: enable end-timestamp accounting for cgroup aggregation
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Apr 2026 at 06:15, <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 2 potential issue(s):
> - [High] Incomplete spinlock and rwlock contentions are silently dropped =
for LOCK_AGGR_CGROUP because account_end_timestamp() skips the per-CPU tsta=
mp map.
> - [Medium] Inconsistent cgroup attribution between complete and incomplet=
e lock contentions when a task migrates cgroups.
> --
>
> commit 7ba25dc647534f97eb1ae9f34c6c8d38e7fef074
> Author: Suchit Karunakaran <suchitkarunakaran@gmail.com>
>
> perf/lock: enable end-timestamp accounting for cgroup aggregation
>
> This commit adds a cgroup_id field to struct tstamp_data to properly acco=
unt
> for incomplete lock contention events when aggregating by cgroup. It reco=
rds
> the cgroup ID at contention_begin and uses it to build the aggregation ke=
y
> in userspace.
>
> > diff --git a/tools/perf/util/bpf_lock_contention.c b/tools/perf/util/bp=
f_lock_contention.c
> > index cbd7435579fea..1a5bd2ff8ee4c 100644
> > --- a/tools/perf/util/bpf_lock_contention.c
> > +++ b/tools/perf/util/bpf_lock_contention.c
> > @@ -463,8 +463,8 @@ static void update_lock_stat(int map_fd, int pid, u=
64 end_ts,
> >               stat_key.lock_addr_or_cgroup =3D ts_data->lock;
> >               break;
> >       case LOCK_AGGR_CGROUP:
> > -             /* TODO */
> > -             return;
> > +             stat_key.lock_addr_or_cgroup =3D ts_data->cgroup_id;
> > +             break;
>
> Does this fully enable end-timestamp accounting for cgroup aggregation
> on per-CPU locks like spinlocks and rwlocks?
>
> Looking at account_end_timestamp() in tools/perf/util/bpf_lock_contention=
.c,
> there is an early return that skips the per-CPU tstamp map:
>
> static void account_end_timestamp(struct lock_contention *con)
> {
>         ...
>         /* Now it'll check per-cpu tstamp map which doesn't have TID. */
>         if (aggr_mode =3D=3D LOCK_AGGR_TASK || aggr_mode =3D=3D LOCK_AGGR=
_CGROUP)
>                 return;
>
>         total_cpus =3D cpu__max_cpu().cpu;
>         ts_fd =3D bpf_map__fd(skel->maps.tstamp_cpu);
>         ...
> }
>
> Since account_end_timestamp() skips iterating over skel->maps.tstamp_cpu
> when aggr_mode is LOCK_AGGR_CGROUP, are all incomplete contentions for
> spinlocks and rwlocks still silently dropped?
>

As per my understanding the tstamp_cpu map stores per-cpu entries
without a TID, so there is no current task context available to derive
a cgroup ID. Unlike the per-task tstamp map where cgroup_id is
captured at contention_begin time, per-cpu entries represent
spinlock/rwlock contentions that are inherently CPU-bound and not
attributed to a single task at contention_end time either. The
original LOCK_AGGR_TASK mode has the same early return for the same
reason, cgroup attribution without a task context is not meaningful.
This patch addresses only the per-task straggler case.

> [ ... ]
>
> > diff --git a/tools/perf/util/bpf_skel/lock_contention.bpf.c b/tools/per=
f/util/bpf_skel/lock_contention.bpf.c
> > index 96e7d853b9edf..d0e2cad02fa36 100644
> > --- a/tools/perf/util/bpf_skel/lock_contention.bpf.c
> > +++ b/tools/perf/util/bpf_skel/lock_contention.bpf.c
> > @@ -536,6 +536,8 @@ int contention_begin(u64 *ctx)
> >       pelem->timestamp =3D bpf_ktime_get_ns();
> >       pelem->lock =3D (__u64)ctx[0];
> >       pelem->flags =3D (__u32)ctx[1];
> > +     if (aggr_mode =3D=3D LOCK_AGGR_CGROUP)
> > +             pelem->cgroup_id =3D get_current_cgroup_id();
>
> If a task migrates to a different cgroup while blocked on a lock, could t=
his
> lead to inconsistent attribution between complete and incomplete contenti=
ons?
>
> The cgroup ID is statically recorded here at contention_begin() and used =
by
> userspace for incomplete events.
>
> However, contention_end() continues to dynamically resolve the cgroup ID:
>
> SEC("tp_btf/contention_end")
> int contention_end(u64 *ctx)
> {
>         ...
>         case LOCK_AGGR_CGROUP:
>                 key.lock_addr_or_cgroup =3D get_current_cgroup_id();
>                 break;
>         ...
> }
>
> Would it be more consistent for contention_end() to also use the statical=
ly
> recorded pelem->cgroup_id, ensuring that both completed and incomplete ev=
ents
> attribute the contention time to the exact same cgroup?
>

I think the fix should go in the opposite direction. Instead of
calling get_current_cgroup_id() at contention_end, I think we should
be using pelem->cgroup_id. Semantically, the cost of lock contention
is incurred by the task that had to wait for the lock. So it makes
more sense to attribute that cost based on the cgroup at the time the
wait started (contention_begin), rather than whatever happens to be
current at the end.
I=E2=80=99m not entirely certain about this, so I=E2=80=99d really apprecia=
te any
input from maintainers and reviewers on whether this attribution makes
sense.

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260420184656.33=
1306-1-suchitkarunakaran@gmail.com?part=3D1
