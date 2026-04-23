Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979932F0673
	for <sashiko@lists.linux.dev>; Thu, 23 Apr 2026 17:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776965432; cv=pass; b=BVp4LxJF1XQRByZPg0DW5DQRkukZk3sWN3WMM0Ud5bMSA1s6Eu/8gAGRuCMO9IqGDr0+40swv8qypzOqx/wa5ZbkoWDTs76dt0IDkI6Rnq3CgQus2AuSNjJQklgO8xta1wfn6+tAjZiEEfs9UcKyEsAHVo7lzmkzn9+LENl1nqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776965432; c=relaxed/simple;
	bh=OHxZOrHjriMxHjho2VJUv8h1fFH1e65QaiQENIiJcY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gc71CSjcbExzarNZIrTgcqjT68GUqqoEpHqSVI/JlCfjQJljLtJ7FT5Oa643/qsfC+9EB8mf9giLU2fAsVCIWkqal9B1mGN5IG6BgMrQdxpT9CGxOhY1t6KwCMan+xEWIYKRsKzxaXdjW4mDusZZTmm3i8io0Z0lrbgJQxmyzzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+cStLRj; arc=pass smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+cStLRj"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-479932ccb9bso2103863b6e.3
        for <sashiko@lists.linux.dev>; Thu, 23 Apr 2026 10:30:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776965428; cv=none;
        d=google.com; s=arc-20240605;
        b=XrvjO13qyb1JNEQffS7XrEBu7Gb6qoShRIUQ9X0/90YYKRsNI8KTf2pkhFId6lxUcO
         O3Y/MsBKvilDuVRFT2G7w+wGTLkAHdGlIyq6//WixmIKT+N5C6jXU/M/xJiIHSoi5tuh
         mfgfOHobfulrcyFF5pNKjuErVtgxXgIhm4p+UhSIG5F1uLqBF+BO8RZ/M/2Iavm0I10K
         cYTR4uX5nX4Ih6EdVYCK8riwYMjMX05nXRQkyrWXXZjHE24siMQmTTQi5hR8mPWd69mH
         7DOwwPbog4aGzoZmR5XWPj6iKc9V3qrb2gak4n92h2KxiZRSIoScxjrjgd4DhFRCJLQT
         a+Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9npysP+5yV0pgdZL0GRM903p/ov5VmLa5E1kgEUBOlI=;
        fh=ER0bWyEs9gghOqCJM7pmKalfPe1nAby6+mlWgUSKgPc=;
        b=QNDZZTGNIjnH0gj7rleVlOLNIh9gTZw2doOeistAEGhU/Axi4noop0VYofAfb+ISEz
         RU+xsQRzLSEFUMaZuUIQLqWiF9sJNMaYbtKl3kXjDHVDvGxiJNc0dov1c/azMTXuTBVh
         17kpJ8F3JrdvYxdLAh+v2FQPVTyQk/q4oQdT4WAGPuqnELhyEUrl77HiEW8FPd+N5NlM
         o8KMVU4w8mAqPM/yNBX/s81bCyNfHU6uwpChtMT6P37BIsll+ItS0yAlg+3RDGMPNOGz
         asSFDz0zi9Hog+ExVlyO3mMQAIiasnQSx+mOh5cNB0hsT3DO5LGcUOAEFfBvKc4k2kPa
         B8Uw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776965428; x=1777570228; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9npysP+5yV0pgdZL0GRM903p/ov5VmLa5E1kgEUBOlI=;
        b=S+cStLRjuAdrNX6AW2lNOsa9GR+JymbJ0NJa7OQsplbDvp+0z8aslWYPH90LtWAIXg
         IQUYnUymnZ806ukzSTNzFgcXnemr0SXSMb4ZpIWDiUpZi3ObgK/SNrdq92+QpNB0b/z9
         MXCjkp8MhhcrJNI9DbwrBl8NlfYcgL9QkniCFGhGLweyrCL/SVsAPsH+OhEd+TU2isB6
         LgKcsHUYMtgxA2vtvZc11NLrZdQm4G4PcgDEPX5hA13k5rpQgWUqtnT3/tP/siTEqdYR
         KZODiOLuHpEjGD2ZCP3Yu+v+H9mKEBBUXdzBghZdEQXMWF0d6sbhJTFz80VzeqhJN4jP
         kV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776965428; x=1777570228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9npysP+5yV0pgdZL0GRM903p/ov5VmLa5E1kgEUBOlI=;
        b=m4sWEm/oliKR0hfUy0wmwtTXUS0JgYO4RbQza69q2wlgSGNul7VAFzANsxOlbkTsXS
         VtLVOxwz0MZl6KmJgs10Ib8lnT1zOgZv7DzVMLmEeXUxng+1CvUnIaOQMFahyfxJocDI
         QQLvRV26ykidS6Od1bDDqGppLgvpQu5MOWK082XJm1FC9ofi9fPyOMqsj6CMzTpnljQ+
         UjwMRKeu6TU/+X5uny5GtsX+7iyI8fs6t0FAdE0s/wgYgs+c1TU2LEinIHRt/RaI8Yhm
         wyCgFmslIHmwLITDxrKxa/h1D11E0NSdQKpcDABsTvxViW9cu8nqVlHLyraFtzV8Gh8p
         LOqg==
X-Gm-Message-State: AOJu0YwgA9aKFn9h4r8RFttjeuCfWWAoOhlLDYHKapC03f9/9d3ZdXuH
	KaAWINtBxXBbiNcnjhTJxYBXnF9M3SjAil9ybz81S0P5LdR75gNUre+mB+/qEMhjmeENm6dl6Es
	GoPhwThzZrNG51qb7hUBY48rKMzyDPgI=
X-Gm-Gg: AeBDieusfCtOORV/5+mYvdHBTSEShlxOgp483HanL4EzvKZ6BSBinzTg2HMyG9pbiM+
	V4WwzrZsNj/4vZm7YA5I4i9BmiEDys/6m5lV6zRi9KhENkseeJvSoJPwg9XA8KcjnqoWNtBJZqs
	8tmew7ux1YMcydz8EqOQID2blZykKCmKAkFiQZxJjIseFxq66upJKHhaa49KnWMKOp6jTRtNM8h
	qfGNVNUKtfnBMl3IpwrtX+IWtcGtp40GHCmZ6Wr1QK4z09rcJx91jLdQbojl9DhdhneyCZMBrxg
	5ExUUXaO6dD2TLhq6a4=
X-Received: by 2002:a05:6808:e659:b0:479:e9d2:26a3 with SMTP id
 5614622812f47-479e9d23f66mr6239447b6e.19.1776965427827; Thu, 23 Apr 2026
 10:30:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420184656.331306-1-suchitkarunakaran@gmail.com>
 <20260421004512.CDE13C19425@smtp.kernel.org> <CAO9wTFiFRSRjMRSAA+vV-AF1rJQGdoCK_p6TXvQ+V1ToaqMs0w@mail.gmail.com>
 <aelx3_VdT_PfsNjd@google.com>
In-Reply-To: <aelx3_VdT_PfsNjd@google.com>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Thu, 23 Apr 2026 23:00:16 +0530
X-Gm-Features: AQROBzCPMzU5pdTXIwzSBgqZUjnJDYTQmeSHfacHJvSFBm0vWjNwGE6EVqX6rAU
Message-ID: <CAO9wTFhoZ5MR4Gv_mgnqSLYz_bemtd3DYusg8OQp_+i_PA3atQ@mail.gmail.com>
Subject: Re: [PATCH] perf/lock: enable end-timestamp accounting for cgroup aggregation
To: Namhyung Kim <namhyung@kernel.org>
Cc: sashiko@lists.linux.dev, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Apr 2026 at 06:42, Namhyung Kim <namhyung@kernel.org> wrote:
>
> On Tue, Apr 21, 2026 at 01:59:00PM +0530, Suchit Karunakaran wrote:
> > On Tue, 21 Apr 2026 at 06:15, <sashiko-bot@kernel.org> wrote:
> > >
> > > Sashiko AI review found 2 potential issue(s):
> > > - [High] Incomplete spinlock and rwlock contentions are silently drop=
ped for LOCK_AGGR_CGROUP because account_end_timestamp() skips the per-CPU =
tstamp map.
> > > - [Medium] Inconsistent cgroup attribution between complete and incom=
plete lock contentions when a task migrates cgroups.
> > > --
> > >
> > > commit 7ba25dc647534f97eb1ae9f34c6c8d38e7fef074
> > > Author: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> > >
> > > perf/lock: enable end-timestamp accounting for cgroup aggregation
> > >
> > > This commit adds a cgroup_id field to struct tstamp_data to properly =
account
> > > for incomplete lock contention events when aggregating by cgroup. It =
records
> > > the cgroup ID at contention_begin and uses it to build the aggregatio=
n key
> > > in userspace.
> > >
> > > > diff --git a/tools/perf/util/bpf_lock_contention.c b/tools/perf/uti=
l/bpf_lock_contention.c
> > > > index cbd7435579fea..1a5bd2ff8ee4c 100644
> > > > --- a/tools/perf/util/bpf_lock_contention.c
> > > > +++ b/tools/perf/util/bpf_lock_contention.c
> > > > @@ -463,8 +463,8 @@ static void update_lock_stat(int map_fd, int pi=
d, u64 end_ts,
> > > >               stat_key.lock_addr_or_cgroup =3D ts_data->lock;
> > > >               break;
> > > >       case LOCK_AGGR_CGROUP:
> > > > -             /* TODO */
> > > > -             return;
> > > > +             stat_key.lock_addr_or_cgroup =3D ts_data->cgroup_id;
> > > > +             break;
> > >
> > > Does this fully enable end-timestamp accounting for cgroup aggregatio=
n
> > > on per-CPU locks like spinlocks and rwlocks?
> > >
> > > Looking at account_end_timestamp() in tools/perf/util/bpf_lock_conten=
tion.c,
> > > there is an early return that skips the per-CPU tstamp map:
> > >
> > > static void account_end_timestamp(struct lock_contention *con)
> > > {
> > >         ...
> > >         /* Now it'll check per-cpu tstamp map which doesn't have TID.=
 */
> > >         if (aggr_mode =3D=3D LOCK_AGGR_TASK || aggr_mode =3D=3D LOCK_=
AGGR_CGROUP)
> > >                 return;
> > >
> > >         total_cpus =3D cpu__max_cpu().cpu;
> > >         ts_fd =3D bpf_map__fd(skel->maps.tstamp_cpu);
> > >         ...
> > > }
> > >
> > > Since account_end_timestamp() skips iterating over skel->maps.tstamp_=
cpu
> > > when aggr_mode is LOCK_AGGR_CGROUP, are all incomplete contentions fo=
r
> > > spinlocks and rwlocks still silently dropped?
> > >
> >
> > As per my understanding the tstamp_cpu map stores per-cpu entries
> > without a TID, so there is no current task context available to derive
> > a cgroup ID. Unlike the per-task tstamp map where cgroup_id is
> > captured at contention_begin time, per-cpu entries represent
> > spinlock/rwlock contentions that are inherently CPU-bound and not
> > attributed to a single task at contention_end time either. The
> > original LOCK_AGGR_TASK mode has the same early return for the same
> > reason, cgroup attribution without a task context is not meaningful.
> > This patch addresses only the per-task straggler case.
>
> Right, it'll miss spinlocks and rwlocks but I think it's ok.
>
> >
> > > [ ... ]
> > >
> > > > diff --git a/tools/perf/util/bpf_skel/lock_contention.bpf.c b/tools=
/perf/util/bpf_skel/lock_contention.bpf.c
> > > > index 96e7d853b9edf..d0e2cad02fa36 100644
> > > > --- a/tools/perf/util/bpf_skel/lock_contention.bpf.c
> > > > +++ b/tools/perf/util/bpf_skel/lock_contention.bpf.c
> > > > @@ -536,6 +536,8 @@ int contention_begin(u64 *ctx)
> > > >       pelem->timestamp =3D bpf_ktime_get_ns();
> > > >       pelem->lock =3D (__u64)ctx[0];
> > > >       pelem->flags =3D (__u32)ctx[1];
> > > > +     if (aggr_mode =3D=3D LOCK_AGGR_CGROUP)
> > > > +             pelem->cgroup_id =3D get_current_cgroup_id();
> > >
> > > If a task migrates to a different cgroup while blocked on a lock, cou=
ld this
> > > lead to inconsistent attribution between complete and incomplete cont=
entions?
> > >
> > > The cgroup ID is statically recorded here at contention_begin() and u=
sed by
> > > userspace for incomplete events.
> > >
> > > However, contention_end() continues to dynamically resolve the cgroup=
 ID:
> > >
> > > SEC("tp_btf/contention_end")
> > > int contention_end(u64 *ctx)
> > > {
> > >         ...
> > >         case LOCK_AGGR_CGROUP:
> > >                 key.lock_addr_or_cgroup =3D get_current_cgroup_id();
> > >                 break;
> > >         ...
> > > }
> > >
> > > Would it be more consistent for contention_end() to also use the stat=
ically
> > > recorded pelem->cgroup_id, ensuring that both completed and incomplet=
e events
> > > attribute the contention time to the exact same cgroup?
> > >
> >
> > I think the fix should go in the opposite direction. Instead of
> > calling get_current_cgroup_id() at contention_end, I think we should
> > be using pelem->cgroup_id. Semantically, the cost of lock contention
> > is incurred by the task that had to wait for the lock. So it makes
> > more sense to attribute that cost based on the cgroup at the time the
> > wait started (contention_begin), rather than whatever happens to be
> > current at the end.
> > I=E2=80=99m not entirely certain about this, so I=E2=80=99d really appr=
eciate any
> > input from maintainers and reviewers on whether this attribution makes
> > sense.
>
> Agreed, as I replied earlier we should use pelem->cgroup_id.
>
> The tstamp_data is saved per-thread so it doesn't matter which thread is
> calling this.  I think the concern is when - IIRC I put it at _end()
> because it may reduce the overhead when we have some filters.
>
> But it seems it's already after checking the filters.  Then it should be
> ok to do in _begin().  Maybe it's a better choice doing it in _begin()
> since the thread is about to go to wait for the lock and doing nothing
> critical.  While at the _end(), it'll start the critical section soon.
>
> Thanks,
> Namhyung
>

Hi Namhyung. Thanks for reviewing the patch. I'll send a v2 patch
shortly for using pelem->cgroup_id instead of get_current_cgroup_id()
in contention_end() as well.
