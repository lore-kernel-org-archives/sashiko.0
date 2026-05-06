Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842913FB060
	for <sashiko@lists.linux.dev>; Wed,  6 May 2026 13:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778075427; cv=pass; b=Z0qOORyAy2R7QrmZ3vwzsKOa3/QKwY4IR+0l7zon59jG6XObSvyo5cW2l/Ar1AoFMecIqF2gP0iMiZRfO7VxVVbLg+Nbo0P8xtFJs9Fi/+4OOG+Dv5cjWQi9/my6A14JJlmW/k2BIsuneLIeFarKHLwZBJJyWFHvu8uYGONiBf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778075427; c=relaxed/simple;
	bh=3iDhx7/6fjvE83MU1N0QRbCRMeag6Iq5n9268QDDSUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TNKyHOxHVd6JOMi9dgBnz0lGxMd3XXttHnfdrClJLNWieJTh1WnrZTE25NKvRRlabuOJM1mwdJEYfHi2yERzbnW/b6FRAqp/feCTBoM7evVRhyIn5kGpo9Ws5uzefyLTcbtmirgwh8S91NzYk4Q3oja1iPEnepaYOS/cJX595cE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W0RYQCyj; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0RYQCyj"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-393c93a01abso6561711fa.1
        for <sashiko@lists.linux.dev>; Wed, 06 May 2026 06:50:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778075424; cv=none;
        d=google.com; s=arc-20240605;
        b=k6H729f7iGUyP93fLFaIlkExxWE2RmYYwgnJQ02oQtah/7gVQbWGG0OPy4uOOq6k44
         1E9HUknVE61zVGE8eecdFqllKxXgxgyzZ2kLLR++Tvcnl/ba9Xt2HSGE2UKOpmzYj3OY
         llu7m3h1qB/BKVwQjsFsEBZWdbVyANCs0UE1DwzUnPcB2bvVPA5bWWmBz40DNfPiDD23
         Wopd/so8eZ7/NXH3/s7bfVu2+qBNNcb5XaIDyr7jzElmxYXJeTBMRngK+SdmiPx1ijGn
         oqbw/KDwg/tH/NArMTFwyJ86RjhOk3Zxt+oH1avdFzLSeU02lwyP3ZUSNBUjnSW1Usgg
         y59Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6uvRH5NWwaeNa0HniCOROnjhGHZN7wgOdieTGzloLRI=;
        fh=TehjY1t5eGpLR12A70uh3MyGVP6T186N9ByKaUcxf4Q=;
        b=UcrlcO2VsR26L4KHOzd6TBxHO2Ge26YqUpzsvYMxh0TBNrCc+3Y6tjfaKrLguDkc39
         B5N22PxlgyzuKD+I3/sTXuKObT2NonuEXX4LNOgObl7CuLPHS/DJUoZkSFwwjV3E6SKH
         mxXrKKEKoukearGednYbJqPx1YHRzOnBRPxFiZB2OZGlzCgetf+2TpK51ADutItrOl32
         9x8YtqMwOyjBlk3PYjSBhxQgq5zV0tGp7pWU50GeLoAJ8D6v7u7CW9f0sz2uskvr4ku9
         /BnXvoRXCTNzNNKMA6XPo/G0jdx8DU2PGXAqWjl5ugrB7N3sq86sIvFGQKJ5r3pPU/TA
         eSmQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778075424; x=1778680224; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uvRH5NWwaeNa0HniCOROnjhGHZN7wgOdieTGzloLRI=;
        b=W0RYQCyj7AcHzT6KK3zrI+UQmDJEsOfeTPVz/S0iuZ4FVF+q+qGRMNmaho9yQYtgcZ
         KUMY5AzMWnG6ZxQo43Vz+suGNSVxglT52Z6FipWalnQ4VvM8cuDw0rw/tBlBkTJOe9j6
         AxLzKl8EPbYcpRQizgAhSqmUOfz4Qbxgg2aOTRjbKERy8R0Z1IdD599Xi071CzTpjSbM
         Ry8iH4AV1M3iOAhdWaZDhQN9r43f4Hp9r8rmex5dQboPdwH7zpbR+aD1Csq54PblquJ8
         Kt8LjEWk6O07IiOoRGcnBRLt1AmCYcpDuA/XKt+qbzdtM5lCwY+ZzafqSAbzWZZnvkyR
         WomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778075424; x=1778680224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6uvRH5NWwaeNa0HniCOROnjhGHZN7wgOdieTGzloLRI=;
        b=gZ5w56nyqezZdE+byWxYAART5MzRECQZ6f2rR6Dmd0tktOnw3ZDrVEmZ3xCw2scGeR
         pX26u3e/EdFy27/bUsdF8HHv7dDphsVxVQbsSdlLOW1s6kO0KtTug9GvUyZk7kc2KJPF
         YUAPBb/6FzUWtnE6DcUoVJ8RaBDxyupMjIacY+q/73ElKRTdqgBqWZv2nnUlodFJEf02
         c/LQf4eT5NDBkBhlCeFKbdnyzjANHMnwWBvXXOXe1S2PMnLcxjmCkureeGryuRWOCzBJ
         fiNVkps3ZuiP6zSTZyRG8lfzwiz5oA54Fg0TYRsLzCqmE8ubf7/X3PAuqsax5m+89nyd
         51OQ==
X-Gm-Message-State: AOJu0YzRkS0d37HjkWLeIQrWFv+f4snOTaz9U2QQShDbi1T1H3BlNr2Z
	dDLbfghnwM3LLWzu49FFt8AWqWP8hvG4e4G8dtjJ8Z4yeuEodKKM6OA5trLJaQ7IOvgSmPGlgj3
	T7+z702/5kGl2/Tuo0R3vAbGN4koY9IRwUqOy
X-Gm-Gg: AeBDieti8WBHP/Xjkrz9QgEpSniZasKXCq7tqtE57ZlAJl6sP5B7vxBE0BqmJplEXEg
	BjRozwSCTNtf6Q3rR/Xk1hKfH3tzKhikfFt5CBwdHGescUZLRa1zq4U5Q8peoUkF0Dorj8etrjJ
	Jp4qtGBPZn864fwIxYNcQGKQJ9iNxLdwLEL9lPUyaGGWzLRuFbQFUQeQ+SPCkClGB4t+yngXkI0
	dmbHicSf77Axptt3BxK6mzYNpSy85iR7KdnPJPgk5llzVYOvQI/uHxUfVadjxHvlv8qTWNRGxIe
	QJH7m9onmL2TaOIVu7mt
X-Received: by 2002:a05:651c:984:b0:38c:594e:ffd4 with SMTP id
 38308e7fff4ca-393c421098fmr14049071fa.25.1778075423200; Wed, 06 May 2026
 06:50:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260503165024.1526680-5-vernon2gm@gmail.com> <20260503175737.6190AC2BCB4@smtp.kernel.org>
In-Reply-To: <20260503175737.6190AC2BCB4@smtp.kernel.org>
From: Vernon Yang <vernon2gm@gmail.com>
Date: Wed, 6 May 2026 21:50:08 +0800
X-Gm-Features: AVHnY4L5VjeFMFFAf0OJw7QnVXEiQ4TczmASiolBkquu7suKzugMa7qGCYoWr-g
Message-ID: <CACZaFFPb+W7VzRXGKvhMOwLm+T62dytC+zYUKa3-TopLOVO=9w@mail.gmail.com>
Subject: Re: [PATCH 4/4] samples: bpf: add mthp_ext
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	"David Hildenbrand (Red Hat)" <david@kernel.org>, "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, inwardvessel@gmail.com, 
	Shakeel Butt <shakeel.butt@linux.dev>, ast@kernel.org, 
	Daniel Borkmann <daniel@iogearbox.net>, surenb@google.com, linux-kernel@vger.kernel.org, 
	linux-mm <linux-mm@kvack.org>, baohua@kernel.org, Lance Yang <lance.yang@linux.dev>, 
	Dev Jain <dev.jain@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Forwarding sashiko review

On Mon, May 4, 2026 at 1:57=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] Infinite loop in `trigger_scan()` when `read()` returns an error
> - [Medium] Integer overflow in `FROM_MB()` macro disables fallback logic =
for values >=3D 4096
> - [Medium] Spurious mTHP fallback during initial cgroup scan due to zero-=
initialized baseline
> - [Medium] Failure in `setup_psi_trigger()` masks the error code and exit=
s successfully
> --
>
> commit d30597e7a4d6ca7d5532535074e0c66c2c92f486
> Author: Vernon Yang <yanglincheng@kylinos.cn>
>
> samples: bpf: add mthp_ext
>
> This commit adds a new BPF sample program, mthp_ext, to adjust mTHP sizes
> based on cgroup memory pressure and usage. It monitors the cgroup directo=
ry
> and automatically falls back to 4KB sizes during high memory pressure or
> low usage.
>
> > diff --git a/samples/bpf/mthp_ext.h b/samples/bpf/mthp_ext.h
> > new file mode 100644
> > index 000000000000..33dc01bcebd3
> > --- /dev/null
> > +++ b/samples/bpf/mthp_ext.h
> > @@ -0,0 +1,30 @@
> [ ... ]
> > +#define min(a, b)    ((a) < (b) ? a : b)
> > +#define FROM_MB(s)   (s * 1024 * 1024)
>
> Does this macro suffer from a 32-bit integer overflow if s is 4096 or
> larger?
>
> If s is an unsigned int like configs.min_mem, 4096 * 1048576 would wrap t=
o 0,
> which could silently disable the fallback logic.

Good catch, I will fix that in the next version. Thanks!

> > +#define TO_MB(s)     (s / 1024 / 1024)
> > +
> > +struct config_local {
> > +     unsigned long threshold;
> > +     unsigned long interval;
> > +     unsigned int  init_order;
> > +     unsigned int  min_mem;
> [ ... ]
> > diff --git a/samples/bpf/mthp_ext.bpf.c b/samples/bpf/mthp_ext.bpf.c
> > new file mode 100644
> > index 000000000000..bbee3e9f679c
> > --- /dev/null
> > +++ b/samples/bpf/mthp_ext.bpf.c
> [ ... ]
> > +SEC("iter.s/cgroup")
> > +int cgroup_scan(struct bpf_iter__cgroup *ctx)
> > +{
> > +     struct cgroup *cgrp =3D ctx->cgroup;
> > +     struct mem_cgroup *memcg;
> > +     struct mem_info *info;
> > +     struct alert_event *e;
> > +     unsigned long curr_stall;
> > +     unsigned long curr_mem;
> > +     unsigned long delta;
> > +
> > +     if (!cgrp)
> > +             return 1;
> > +
> > +     if (!cgroup_has_tasks(cgrp))
> > +             return 0;
> > +
> > +     info =3D bpf_cgrp_storage_get(&cgrp_storage, cgrp, 0,
> > +                                 BPF_LOCAL_STORAGE_GET_F_CREATE);
> > +     if (!info)
> > +             return 0;
> > +
> > +     memcg =3D bpf_get_mem_cgroup(&cgrp->self);
> > +     if (!memcg)
> > +             return 0;
> > +
> > +     bpf_cgroup_flush_stats(cgrp);
> > +     curr_stall =3D bpf_cgroup_stall(cgrp, PSI_MEM_FULL);
> > +     delta =3D curr_stall - info->stall;
>
> During the initial scan of a cgroup, info->stall will be zero-initialized=
.
> Since curr_stall represents cumulative stall time, won't delta be a very
> large number?
>
> This seems like it could incorrectly trigger the 4KB fallback during the
> first interval regardless of current memory pressure.

Good catch, This is a Bug exactly. I will fix that in the next version. Tha=
nks!

> Copy from cover-letter:
> When the redis is under no memory pressure, RPS drops by 10.3%
> (from 1.4M to 1.2M, compared to always).

After fixed, when there is no memory pressure on Redis, RPS equal to
1.4M, which means mthp_ext is a positive optimization in all
scenarios.

> > +     bpf_mem_cgroup_flush_stats(memcg);
> > +     curr_mem =3D bpf_mem_cgroup_page_state(memcg, NR_ANON_MAPPED) +
> > +                bpf_mem_cgroup_page_state(memcg, NR_SHMEM);
> > +     if (curr_mem < FROM_MB(configs.min_mem) || delta >=3D configs.thr=
eshold)
> > +             info->order =3D 0;
> > +     else
> > +             info->order =3D PMD_ORDER;
> [ ... ]
> > diff --git a/samples/bpf/mthp_ext.c b/samples/bpf/mthp_ext.c
> > new file mode 100644
> > index 000000000000..0e064bad136f
> > --- /dev/null
> > +++ b/samples/bpf/mthp_ext.c
> [ ... ]
> > +static int trigger_scan(struct bpf_link *iter_link)
> > +{
> > +     char buf[256];
> > +     int fd;
> > +
> > +     fd =3D bpf_iter_create(bpf_link__fd(iter_link));
> > +     if (fd < 0) {
> > +             fprintf(stderr, "ERROR: bpf_iter_create failed: %s\n",
> > +                     strerror(errno));
> > +             return -1;
> > +     }
> > +
> > +     /* Read to trigger the iter program execution */
> > +     while (read(fd, buf, sizeof(buf)))
> > +             ;
>
> If read() returns an error (like -1 for EINTR), will this result in an in=
finite
> busy-wait loop since -1 evaluates to true in C?
>
> Could this be updated to check for > 0 instead?

Yes, I will fix that in the next version. Thanks!

> > +
> > +     close(fd);
> > +     return 0;
> > +}
> [ ... ]
> > +int main(int argc, char **argv)
> > +{
> [ ... ]
> > +     psi_fd =3D setup_psi_trigger(root_path, "some", threshold * 1000,
> > +                                interval * 1000);
> > +     if (psi_fd < 0) {
> > +             fprintf(stderr, "ERROR: PSI trigger setup failed\n");
> > +             goto psi_setup_fail;
> > +     }
> > +
> > +     monitor_thread(psi_fd, &skel->bss->configs, iter_link, rb);
> > +
> > +     close(psi_fd);
> > +psi_setup_fail:
> > +     ring_buffer__free(rb);
> > +rb_fail:
> > +     bpf_link__destroy(iter_link);
> > +exit_fixed:
> > +attach_iter_fail:
> > +     bpf_link__destroy(ops_link);
> > +attach_opts_fail:
> > +load_skel_fail:
> > +     mthp_ext__destroy(skel);
> > +open_skel_fail:
> > +     close(root_fd);
> > +
> > +     printf("\nExiting...\n");
> > +
> > +     return err;
> > +}
>
> If setup_psi_trigger() fails, the code jumps to psi_setup_fail. However, =
err
> was previously set to 0 from a successful BPF operation.
>
> Does this cause the program to log an error but exit with a success statu=
s
> code?

Yes, I will fix that in the next version. Thanks!

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260503165024.15=
26680-1-vernon2gm@gmail.com?part=3D4
