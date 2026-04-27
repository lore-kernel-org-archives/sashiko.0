Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108313B6348
	for <sashiko@lists.linux.dev>; Mon, 27 Apr 2026 12:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777291794; cv=pass; b=t4PMbNqmwM0xSHE9ZMy6UfU08CDd85akospwQflrslUNQkPJ3DizwtZ8hGRAArgIOCtzBzKebSysnThJUvx+4VTom0K6IM8bQgzIhvfNcPSJ9HUCfKZBuXzymtD6wwzxJt9ktuq+dxbQP3CjgXG6/bPgtLJ2OJ+HKeor7aSNzAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777291794; c=relaxed/simple;
	bh=7ou4NuehRA3k1EdFM5tKEMdVpfctBHvyJJ8DBaw1rjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Te0gq5LgWR9D7dPCtrOmf2BuBGzlASTCeCyY4GFWWWT93YS6S0MASBGnzbbpKdgA31wk104wTXm819ZDxPjJl0YvgKUseQhHBKFM+cEPn81saB4e3tF1BJxlZFH4yl0eOMYhIHbDj/XMgzLh1sPXOI1wufhMTLE3N/9NncGo5KQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpYSCim0; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpYSCim0"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso13829693a12.1
        for <sashiko@lists.linux.dev>; Mon, 27 Apr 2026 05:09:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777291789; cv=none;
        d=google.com; s=arc-20240605;
        b=PZmstafDD8avQHBDKBj+YPF4sd/5xPNyl8An0N+Lgj2dxcow1d+3aL70U51bnnzu1m
         zPfyqX4h3WdgmL6dt4FIArP4T33AtpcFtDwgmNtNdcl3bSFhX/DxJPMIdzzyavJ3qQWL
         awd8nJg37fkseZSWsXCGchFyNd+VyMRfeDy80TTNkPUVj3dIiCBrIwsFXYFlgd+IjYIQ
         co9awuw4Kme0+ZRTaQY8FTlEyk0f4uvwv2iZsfBj5mGzQY1pdrD39lyHA/HAVxGnjEve
         tDN6Xawdpwwe8yWBJhETxSL+S1cfSXHWg1YyATWP24ZcOhkh+4C3g5tah6kFqzLEmy19
         +Rhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J4ME7vf7epyDcp3Ddjtmm3VoK4g15VbKSQsr+1vhcdc=;
        fh=7h0izHys8KHgVwAHFbDqh8DXgNjj235aXcN4iZY+6bA=;
        b=L7uRqyMkfJ8xBxiq0NIctprSc5+YfvwnmAZ5BlY+4lyOMJdmXideJB3S2UA4rIx3cY
         jVv0DKvQuRYURp7t8aiw1XKPiKxQlxtD6ksloo+brcKVjLgcRGU8J0WkWNNlSg088IgU
         C2Cpr1Q3WX44MaRvkbq48gXgsCKxmFF/LrurY9asBkaX04bFEFlPBJtZ99oqukUx4/Yj
         wl2kDxFdxt1IpliaTjAX5H3NAYN4NgOvpFQwivP11DYkOS9E9pfwjgWBEnTqnipK6Jv+
         boNmT0On/pTXwp2oIcn1Rx8wzpw5Q7tTay5SGh4z8EjiSDvTCHN9LWEP/d+9H17D3gbX
         JJxQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777291789; x=1777896589; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4ME7vf7epyDcp3Ddjtmm3VoK4g15VbKSQsr+1vhcdc=;
        b=bpYSCim0yvV4Wfyzz5adGqSt4uwbzdaOH5411ggxZmbnjyy6zz2JVuKUh+FlRSajc4
         yRFY+Hv5mCMtjwlBHvkUTMeqKkPS8gP6jJx6tBhEhj1qNC7zEVz1TGKpBvhGsjje//An
         l0v0O7DfGvyIfkXmH7jPlHBtPslN0Jzy4RAbBpPR1EN1X6bCQam3k4w0YrE61oRR0Exq
         3P3qBMhfaYjNtJShySAJJVwpAg8Ll7qT+haj+FwyPsPcE2slvgFnc7E++C5qtIQ4lYbq
         R21N5JGuzFrBzidhu1rpot9wk9gxLMCtSRRfRWnNCHu/74w8liiZIqvMNkeT4DCbm+B/
         HHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777291789; x=1777896589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J4ME7vf7epyDcp3Ddjtmm3VoK4g15VbKSQsr+1vhcdc=;
        b=DJ5RGX3nJ1l7yPLiLQO3YKkYJLDL5Tew3iVZBAf4a2abOVoDGq+vPpGWGMPAycJCnw
         hl1jc6bjqE2awDgKNx6MwatiqJ28H3mMLhBmm+IzS5GP/dwYFf7teOLyd5Yusg/lGhVf
         ceUzBMY8LD1qHvW9CNF7o5ZPlpoWCF8HbzhdysrhOjvoNa8HHzh5wovysEa7Fdv1BVXQ
         JkuRWFgSdKmtZNtp4Oivramv9hkZFJXfab+W88rlgnQZm5zdiYGI+aF75kHHnBsXgX7x
         f6KfuZdSnnxaZPtbo8oPX9e1IWcNTLnnbZIwfs7duya71/I5V17PLiQyg40TKQG2E46X
         HMiw==
X-Gm-Message-State: AOJu0YxiCXAh/eCMaGkUpuZhqf2zBI7JOXowxgF4ErwI7ny3RarOK43H
	B5MwHJuj87NipwizQuavCjMRIrHVxgBPADseqZPGEmg+SwJUNn8IlxWdf9DSOLHP+htNYFMmsml
	k414J0N1o/WKuwlrvjDHB7pjSbMyAvDc0ltPn
X-Gm-Gg: AeBDieuUz8sIDI5yue10NRcK+WkppDJXqJb/V0KUjghIFFy5KRfmkMDU7qzEBngTLml
	K1Xi8BBs2o+ZCsXAXsrG+etXzarpLV2/SwHkdhSdXK5o5qUsUGVuhMgCge2LFBk+fD+84sFy+WK
	hZKKES0bWAlnMjAURJKOsFlqP2bSwP2fidt7behTNGA0uKmz3szucYw1hHuXVYB6K7udgg3/w0+
	9dqYwSqpfJNq34cJeRh9Q9F1+OphGW9xsnvGo4w0KWggBcadpFRSur4e5mnEN2YOPiXgn34n53u
	HMK2mr4bM3D3lAVh5ZN+5SNnPvRWRyL6vXDaRHblkeGR
X-Received: by 2002:a05:6402:90b:b0:66a:8002:fe17 with SMTP id
 4fb4d7f45d1cf-672bfdc964cmr18132483a12.13.1777291789297; Mon, 27 Apr 2026
 05:09:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260413185740.3286146-4-puranjay@kernel.org> <20260413203144.EA85BC2BCAF@smtp.kernel.org>
In-Reply-To: <20260413203144.EA85BC2BCAF@smtp.kernel.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Mon, 27 Apr 2026 13:09:35 +0100
X-Gm-Features: AVHnY4IAGYvtHVIU7hTjO364ldbCcFwSbQm2aFRg9p1ZdindgBj_OF_5KAAxkP4
Message-ID: <CANk7y0hHok1WBKmxr=bm7U+Ya0NGNZ+AL2cdGtJbxWU71huSvg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] perf/arm64: Add BRBE support for bpf_get_branch_snapshot()
To: sashiko@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 9:31=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 4 potential issue(s):
> - [High] arm_brbe_snapshot_branch_stack executes BRBE system register rea=
ds without validating CPU support, leading to an Undefined Instruction kern=
el panic on asymmetric systems.
> - [High] arm_brbe_snapshot_branch_stack destructively clears the hardware=
 branch buffer, corrupting data for concurrent perf sessions.
> - [High] A TOCTOU race can unintentionally re-enable BRBE after it was ex=
plicitly disabled by a PMU interrupt, corrupting hardware state.
> - [Medium] Missing isb() context synchronization after unpausing BRBE cau=
ses missed branch records.
> --
>
> commit ce06705327b522bc73c923ff4219c198fe71f3b4
> Author: Puranjay Mohan <puranjay@kernel.org>
> Subject: perf/arm64: Add BRBE support for bpf_get_branch_snapshot()
>
> This commit enables bpf_get_branch_snapshot() on ARM64 by implementing th=
e
> perf_snapshot_branch_stack static call for BRBE. It pauses BRBE, masks
> exceptions, reads branch records, and then invalidates the buffer.
>
> > diff --git a/drivers/perf/arm_brbe.c b/drivers/perf/arm_brbe.c
> > index ba554e0c846c4..fd62019ddc839 100644
> > --- a/drivers/perf/arm_brbe.c
> > +++ b/drivers/perf/arm_brbe.c
>
> [ ... ]
>
> > +/*
> > + * Best-effort BRBE snapshot for BPF tracing. Pause BRBE to avoid
> > + * self-recording and return 0 if the snapshot state appears disturbed=
.
> > + */
> > +int arm_brbe_snapshot_branch_stack(struct perf_branch_entry *entries, =
unsigned int cnt)
> > +{
> > +     unsigned long flags;
> > +     int nr_hw, nr_copied =3D 0;
> > +     u64 brbfcr, brbcr;
> > +
> > +     if (!cnt)
> > +             return 0;
> > +
> > +     /*
> > +      * Pause BRBE first to avoid recording our own branches. The
> > +      * sysreg read/write and ISB are branchless, so pausing before
> > +      * checking BRBCR avoids polluting the buffer with our own
> > +      * conditional branches.
> > +      */
> > +     brbfcr =3D read_sysreg_s(SYS_BRBFCR_EL1);
>
> On asymmetric systems (like big.LITTLE) where only a subset of CPU cores
> implement BRBE, the perf_snapshot_branch_stack static call is enabled
> globally. If a BPF program invokes this snapshot on a CPU lacking BRBE,
> will this unconditionally execute read_sysreg_s(SYS_BRBFCR_EL1) and
> trigger an Undefined Instruction exception kernel panic?
>
> Does this need a local CPU feature check before accessing these registers=
?

I had this in the previous version, but Rob explained that this
doesn't happen in practice so I removed it.

>
> > +     brbcr =3D read_sysreg_s(SYS_BRBCR_EL1);
> > +     write_sysreg_s(brbfcr | BRBFCR_EL1_PAUSED, SYS_BRBFCR_EL1);
> > +     isb();
> > +
> > +     /* Bail out if BRBE is not enabled (BRBCR_EL1 =3D=3D 0). */
> > +     if (!brbcr) {
> > +             write_sysreg_s(brbfcr, SYS_BRBFCR_EL1);
> > +             return 0;
> > +     }
> > +
> > +     /* Block local exception delivery while reading the buffer. */
> > +     flags =3D local_daif_save();
> > +
> > +     /*
> > +      * A PMU overflow before local_daif_save() could have re-enabled
> > +      * BRBE, clearing the PAUSED bit. The overflow handler already
> > +      * restored BRBE to its correct state, so just bail out.
> > +      */
> > +     if (!(read_sysreg_s(SYS_BRBFCR_EL1) & BRBFCR_EL1_PAUSED)) {
>
> Can a TOCTOU race unintentionally re-enable BRBE if a PMU interrupt fires
> before exceptions are masked?
>
> If the PMU overflow interrupt decides to stop the event, it calls
> brbe_disable(), which sets SYS_BRBCR_EL1 to 0 and sets the PAUSED bit in
> SYS_BRBFCR_EL1.
>
> Upon returning from the interrupt, the PAUSED bit would still be set, so
> this check evaluates to false and proceeds. At the end of the function,
> the cached brbcr (which was > 0) and brbfcr are written back, which would
> unintentionally re-enable BRBE in hardware without an active perf event.
>
> > +             local_daif_restore(flags);
> > +             return 0;
> > +     }
> > +
> > +     nr_hw =3D FIELD_GET(BRBIDR0_EL1_NUMREC_MASK,
> > +                       read_sysreg_s(SYS_BRBIDR0_EL1));
> > +
> > +     for_each_brbe_entry(i, nr_hw) {
> > +             if (nr_copied >=3D cnt)
> > +                     break;
> > +
> > +             if (!perf_entry_from_brbe_regset(i, &entries[nr_copied], =
NULL))
> > +                     break;
> > +
> > +             nr_copied++;
> > +     }
> > +
> > +     brbe_invalidate();
>
> Does calling brbe_invalidate() here destructively clear the hardware bran=
ch
> buffer?
>
> Since BPF branch snapshots are intended to be non-destructive observation=
s,
> wiping out the hardware branch buffer could permanently destroy the branc=
h
> history for a concurrently active perf session.
>
> > +
> > +     /* Restore BRBCR before unpausing via BRBFCR, matching brbe_enabl=
e(). */
> > +     write_sysreg_s(brbcr, SYS_BRBCR_EL1);
> > +     isb();
> > +     write_sysreg_s(brbfcr, SYS_BRBFCR_EL1);
>
> Is an explicit isb() missing after writing to SYS_BRBFCR_EL1?
>
> Since MSR instructions to system registers are not context synchronizing,
> the processor may delay unpausing BRBE. Could this result in missed
> branch records until the next context synchronization event naturally occ=
urs?
>
> > +     local_daif_restore(flags);
> > +
> > +     return nr_copied;
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260413185740.32=
86146-1-puranjay@kernel.org?part=3D3
