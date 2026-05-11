Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ECE4CA295
	for <sashiko@lists.linux.dev>; Mon, 11 May 2026 19:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778527360; cv=none; b=Vx+1vIs1ETgsgEX5PNMmRI9pQRe8EdZbiamoPOrLM0B5EKJj6Fk2bCVwe9t7eciL18aT7WKfjVnIrdn94nffMbb2l9KMnaMqhLVlQnz7hMVuEeWkgMmutoSzCF/vmpkTeDSViP2fOvm6jSo4NdsAh7NffohZNr2axPpiDg30tTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778527360; c=relaxed/simple;
	bh=1Go7AkwpmkJBIvk/bDaA/aiLVxiJzm2LezpYLlLteKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iqj4J8CGgoGiIbJcDZyfzDPVt4CCJ9GHjFN83s8Lh3SospcCM1UIGKwiO54NUZP9Yo6ojhRUGCIe9TRfPWdVPXZoHVLUKeVawDmm8kadJsIAYpVGdgz3kU6Nmeji7EVsOYuzoasoSqbhZQsaGfBmU10/HZMYpKRi7kdsWFkZkek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cOvDNF0B; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cOvDNF0B"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64eb84d1e37so3768290d50.2
        for <sashiko@lists.linux.dev>; Mon, 11 May 2026 12:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778527358; x=1779132158; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/a2/tf3pJlvTRKWq0xdAAEeDOGA4QAmtV52+9YCkorE=;
        b=cOvDNF0BIE8PMSC8gYSgF/0nJPhAmwLT/rEg0SEVQ5jZgqLsY4FRY+9mVzSTqhmz7/
         lj/0VZqmY+DMYSkwR3ERRFqGPUU5Saau0enNRtC73s4oFnYBvVoPr4RRTtZLlbMCsED/
         ubzYXAJmwVBC3oitvWfEZHxO+Zw+ggzsk727pFvdThuIU4xDBx0MMmiAWNqTVpOCHkpK
         vXu5t8p44tBCfFABCaUIaVH54kev3d+GchaqE4Fd4DjK085qWEM9B79NPe56G/v/YrQH
         +BoCYOQQ0DlZJhKCnbVWEM8U5DkLdOyLZ7TA2zBrJ7gdDXCI/xOfEXfF+3zbW6eh3xaF
         J03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778527358; x=1779132158;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/a2/tf3pJlvTRKWq0xdAAEeDOGA4QAmtV52+9YCkorE=;
        b=Piq4kdZHIQHW7YzkdUnya0Zeu1GnuhBRItNQuRdooEFOr63xW1m+YPP+iPlVcZf5g3
         ZBKBGjFWXo/MICUzG2oervB6C1cSvn/IdgSieMhBW0KuPpQX0PljOP/beqdH56zcwYw4
         GpCytvcRChhVQzz21JdyKdsgd/+bYKpgUU9XbiLcBLNqlufF8/mPWv9FBcljaAqaGLbe
         fc9W3KzMgo7YHM+XkeruEA+FfFYHteSn3MxVeP3dh/2ZPifxJz0VE25j0EZ5+m1SqQ02
         YBhTzPE0kcscrAkOBk5ws5UBF7Hy9AqtAWHsKkzRw4QPWdwrl6qIt3C4vsTTe5BE4ltr
         Bb1A==
X-Gm-Message-State: AOJu0YzxM0qU+lRneAblsmjezRtR8EKTctRMVIbAljciwjGk0SxG+P07
	ZPdaGpo+Yc34F8B/5eg5Uv5gH1IcRmWIGq82+h59G444pwLXWMIpwJoE
X-Gm-Gg: Acq92OEvs8ICUPX1NHw9P8ZHUBgAxPm91KP2sCpmewSk2biU3IJgYwEQLUK7TLLQP/e
	YTU0vgDxaV8k578P7HufjAEOAbH4HA8oVqyejqTTcsL7+rbE/GOP37Cs8kJymiYKw6RIKXZOidU
	smN296sloxy8cab0c9Tsdi53LIwbIE4+NejsEyovODTdC4UnZBqS6pqE7Pxo+gckrfYnYymn4aY
	nRnqUeT/Z1ekbI+hYeDjSnYVv0CNSXSDmVb2mPfDuKI6bEdVU5mWrwT6TL9xFO0mFiEgayz5g0k
	L6D7gCCALjNTl0c4Tz13BEwlAqSQ+jO3cwJqmk66Fl33keuuZ6SCz6LQhD25TqGPyd0ggk0zIO6
	tTnI+r0AGG73xXdim5ypz2PSgoPT2T3zqCTzCMyaX9iw1WdulRekjOvJ+mz2Q8ZdX/VzpEwitKe
	qXdXXYOZ4CXk3mdMaM+aIxYpormpqAxsV1ExY++dRnnShbIP3VC8NKBa9kxA==
X-Received: by 2002:a05:690c:6d83:b0:7bd:8d1b:b2d8 with SMTP id 00721157ae682-7c102760192mr98515307b3.10.1778527357715;
        Mon, 11 May 2026 12:22:37 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:e8b3:b34c:911c:3e07])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd665464ccsm153207707b3.11.2026.05.11.12.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 12:22:37 -0700 (PDT)
Date: Mon, 11 May 2026 15:22:36 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: sashiko@lists.linux.dev, bpf <bpf@vger.kernel.org>
Subject: Re: [bpf-next v3 1/2] bpf: Offload kptr destructors that run from NMI
Message-ID: <agInlPe_e8Mpp3Nq@zenbox>
References: <20260507175453.1140400-2-utilityemal77@gmail.com>
 <20260507234520.646C4C2BCB2@smtp.kernel.org>
 <agCXEJKJh-JGMhjG@zenbox>
 <CAADnVQJdFCFJcg0Pqdnx=D2h5vHj_q4mrwSJYxRC5RW0NTFNvQ@mail.gmail.com>
 <agEnc0aYMhuIeDlq@zenbox>
 <DIFYUK5DKGAT.189D9YYSQFCUZ@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DIFYUK5DKGAT.189D9YYSQFCUZ@gmail.com>

On Mon, May 11, 2026 at 08:51:53AM -0700, Alexei Starovoitov wrote:
> On Sun May 10, 2026 at 6:49 PM PDT, Justin Suess wrote:
> > On Sun, May 10, 2026 at 03:38:08PM -0700, Alexei Starovoitov wrote:
> >> On Sun, May 10, 2026 at 8:14 AM Justin Suess <utilityemal77@gmail.com> wrote:
Here's a reproducer for the cgroup case:

https://gist.githubusercontent.com/RazeLighter777/5f77cdfe035a4e22ee2642ae7db6387d/raw/10898d27040a07098cccc5d0785d9ad6620344e7/cgroup_kptr_nmi_deadlock_repro

Hacked together with an AI prompt but functional.

Exercises a different path, but more consistently splats even without
CONFIG_RCU_NOCB_CPU / CONFIG_RCU_EXPERT since this dtor uses workqueue.

Had to use an fexit hook to get the timing condition right to release
the last cgroup reference.

But this lets you see the deadlock is indeed in the dtor in NMI.

This is on the same bpf-next/master
7e033543a2ab4c72319201298ed458e3bbddd82f:

  [   15.160694] ================================
  [   15.160695] WARNING: inconsistent lock state
  [   15.160695] 7.1.0-rc2-g7e033543a2ab-dirty #130 Not tainted
  [   15.160697] --------------------------------
  [   15.160697] inconsistent {INITIAL USE} -> {IN-NMI} usage.
  [   15.160698] test_progs/434 [HC1[1]:SC0[0]:HE0:SE1] takes:
  [   15.160700] ffff9096fd66ced8 (&pool->lock){-.-.}-{2:2}, at: __queue_work+0xde/0x720
  [   15.160707] {INITIAL USE} state was registered at:
  [   15.160708]   lock_acquire+0xbf/0x2e0
  [   15.160711]   _raw_spin_lock+0x30/0x40
  [   15.160715]   __queue_work+0xde/0x720
  [   15.160716]   queue_work_on+0x54/0xa0
  [   15.160716]   start_poll_synchronize_rcu_expedited+0xaf/0x110
  [   15.160719]   rcu_init+0x958/0x990
  [   15.160722]   start_kernel+0x746/0x980
  [   15.160725]   x86_64_start_reservations+0x24/0x30
  [   15.160727]   __pfx_reserve_bios_regions+0x0/0x10
  [   15.160729]   common_startup_64+0x12c/0x138
  [   15.160731] irq event stamp: 18704
  [   15.160732] hardirqs last  enabled at (18703): [<ffffffffa200148a>] asm_sysvec_apic_timer_interrupt+0x1a/0x20
  [   15.160734] hardirqs last disabled at (18704): [<ffffffffa30e3f8f>] exc_nmi+0x7f/0x110
  [   15.160737] softirqs last  enabled at (18698): [<ffffffffa22e5800>] __irq_exit_rcu+0xc0/0x100
  [   15.160739] softirqs last disabled at (18687): [<ffffffffa22e5800>] __irq_exit_rcu+0xc0/0x100
  [   15.160741] 
  [   15.160741] other info that might help us debug this:
  [   15.160741]  Possible unsafe locking scenario:
  [   15.160741] 
  [   15.160742]        CPU0
  [   15.160742]        ----
  [   15.160742]   lock(&pool->lock);
  [   15.160743]   <Interrupt>
  [   15.160743]     lock(&pool->lock);
  [   15.160744] 
  [   15.160744]  *** DEADLOCK ***
  [   15.160744] 
  [   15.160744] no locks held by test_progs/434.
  [   15.160745] 
  [   15.160745] stack backtrace:
  [   15.160747] CPU: 1 UID: 0 PID: 434 Comm: test_progs Not tainted 7.1.0-rc2-g7e033543a2ab-dirty #130 PREEMPT(full) 
  [   15.160749] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.17.0-0-gb52ca86e094d-prebuilt.qemu.org 04/01/2014
  [   15.160750] Call Trace:
  [   15.160751]  <TASK>
  [   15.160753]  dump_stack_lvl+0x5d/0x80
  [   15.160757]  print_usage_bug.part.0+0x22b/0x2c0
  [   15.160760]  lock_acquire+0x295/0x2e0
  [   15.160762]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   15.160763]  ? __queue_work+0xde/0x720
  [   15.160767]  _raw_spin_lock+0x30/0x40
  [   15.160768]  ? __queue_work+0xde/0x720
  [   15.160769]  __queue_work+0xde/0x720
  [   15.160772]  queue_work_on+0x54/0xa0
  [   15.160774]  bpf_cgroup_release_dtor+0x12e/0x140
  [   15.160778]  bpf_obj_free_fields+0x118/0x250
  [   15.160782]  free_htab_elem+0x85/0xd0
  [   15.160785]  htab_map_delete_elem+0x168/0x230
  [   15.160790]  bpf_prog_23fcbbeb395ac6b4_clear_cgroup_kptrs_from_nmi+0x54/0x74
  [   15.160792]  bpf_trace_run3+0x126/0x430
  [   15.160795]  ? __pfx_perf_event_nmi_handler+0x10/0x10
  [   15.160799]  nmi_handle.part.0+0x15b/0x250
  [   15.160802]  ? __pfx_perf_event_nmi_handler+0x10/0x10
  [   15.160804]  default_do_nmi+0x120/0x180
  [   15.160807]  exc_nmi+0xe3/0x110
  [   15.160809]  asm_exc_nmi+0xb7/0x100
  [   15.160810] RIP: 0033:0x5607a669541b
  [   15.160813] Code: c7 45 f0 00 00 00 00 eb 1a 8b 55 f0 8b 45 f4 01 d0 48 63 d0 48 8b 45 a8 48 01 d0 48 89 45 a8 83 45 f0 01 81 7d f0 3f 42 0f 00 <7e> dd e8 7e f5 ff ff 48 89 45 f8 48 8b 45 f8 48 3b 45 e8 73 16 83
  [   15.160814] RSP: 002b:00007ffdb09c1dc0 EFLAGS: 00000293
  [   15.160816] RAX: 0000003aced4e2f4 RBX: 00007f1d8d574000 RCX: 000000000000000f
  [   15.160816] RDX: 00000000000ad857 RSI: 00007f1d8d577000 RDI: 0000000000000001
  [   15.160817] RBP: 00007ffdb09c1e30 R08: 00007ffdb09c1da0 R09: 00007f1d8d577010
  [   15.160818] R10: 0000000000001614 R11: 0009718b9187183f R12: 0000000000000003
  [   15.160818] R13: 00007f1d8d5b6000 R14: 00007ffdb09c3358 R15: 00005607a9daf890
  [   15.160824]  </TASK>
  [   15.214040] perf: interrupt took too long (2501 > 2500), lowering kernel.perf_event_max_sample_rate to 79000
  [   15.246002] perf: interrupt took too long (3135 > 3126), lowering kernel.perf_event_max_sample_rate to 63000
  [   15.308032] perf: interrupt took too long (3928 > 3918), lowering kernel.perf_event_max_sample_rate to 50000
  [   15.500072] perf: interrupt took too long (4912 > 4910), lowering kernel.perf_event_max_sample_rate to 40000

Justin
