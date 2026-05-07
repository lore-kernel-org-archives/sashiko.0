Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462E13D9DC8
	for <sashiko@lists.linux.dev>; Thu,  7 May 2026 10:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778150636; cv=none; b=YYcNcMIbbNed0RRrg8OEbQ36K/4n7xyui2GowNvJB/+Mr6K3WFiRLqb6lBxU3N5JT8fzW2vdsQrPXz0wY+H/xUI77V1cE72B2xMbcPtNfxLS7SyCOgDQ7rk5hUqQQ5B263+Wcn1zBluB9ufaTmtKr+ytec+mjD1UgAhiFPjydL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778150636; c=relaxed/simple;
	bh=W7S7RhFVSwxfHIVjYOCjpZjAVzUe/hDQj7czMEUXhPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=it/FIHPNkpPYIRdQ3JkZnJIK3cw6vfXTUszdVBxADlzCHxI/shvq9GYzXAAh8joes5f2hTDEBWE2v/poL+4IiItgDXSZ++XvofqUOdQaaiWJCadLDRZCqrlzvOixHpH4IXrt5KPuyhVphEtcMIEZh1E+Y81h9sEp5yTBN76EVfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVyxGSqq; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVyxGSqq"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c736261ee8dso242018a12.1
        for <sashiko@lists.linux.dev>; Thu, 07 May 2026 03:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778150634; x=1778755434; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EOHEgl8CcCZH7pikudGOTxfIkDBIN2FCiM29F9id6vs=;
        b=BVyxGSqqm2g4ZbK2/cE4VyyHidf8AbfWp+woVfdMn5F1pubpIKhoj9zUfGCawbAO+7
         6joSEEGL63BfBhDUYcysrd5riQXz9q+rxoJKCTITfB8ORQtBzzNOoYR2swwc546qhFLq
         cWlG/wzMnVyW4oIJla+QzdkSJwuEJ4HDQXqhos5fXY6OeSwPgXeKG00pbeVoq9KdNjJO
         Xet87EJQgtsA9LEY/KkDKTsMMPzJCWfVQEsnQBUfVSw9rKgTPBRzKMlnMB1Uk2kmdM1E
         cHdefsj9ZLtJuklbjYOdoUvEYEZPZM/iBXTIco8ZIBsadzbzdlE1RMtlqodTWV6WG/Ig
         C2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778150634; x=1778755434;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EOHEgl8CcCZH7pikudGOTxfIkDBIN2FCiM29F9id6vs=;
        b=Cz4TnqXJ+fpMmMdJApxzUdO64i0ciwiNv1yOi/lGJrOBda4s/0AtU4ySdx6tB6OEV7
         fbEWqU0egWfD6GDZslmPXgBtijsCv+JxX2EbGroKXwnEflqj+YzEUS9aWnmUSxXjyUUm
         Rsrax2K3bzCLJHvk2Tl9be139Lc7ULgzcj+aCu9q08uCiXi89FNP+o2DQnGLY2RIUvfk
         ezY4BjJHWu4R5eT0cnujs8FXdc376bQKCC6bZctd723z9Bqtk0yb5AVtOLBovof9ueJi
         iG3eLgrLqS+V8R0034ObMZTnSvs9M1ID2DN2nE3HHg2tR6ofumDnF8jF3q/+tyOx7RD6
         T8ug==
X-Gm-Message-State: AOJu0YxuKpRiVm5slYmN+mrvHQjhHYEIlssMN4QkaywEgxZGq9GTfcNo
	OgauFsA8J337dPAPVXJECiiPJxQQgtBIts2vBOzZsCj4YuZmP0frjGomPO0kkg==
X-Gm-Gg: AeBDiesvurrdUbLCfc34Obd2gMxtAdQMyhMNKLVe8txI1zMwz+5sqJMfUmhe8JIzVdr
	Wk3L91BQ9B5etw7ID3f2EyJwIP4k0VtO9osugBOwLY5+0bXw5cFBIGNxrWxyVjZwWec+sP7g6sB
	f+5beyfaxXv6gKWgYr3YyQal2mL8zA+RWYEifvaumaS+n0K19Lr4C+wUbstUHJNA4Gn3oB0j3aE
	EL1rwXMgLsp2hQgKKEZJ+yieuSG6TfiymF3PXuj7KQp+L4BmlbOZFOHSbP3wCwAuCu1k574D6MS
	QLOMD5+RIeoj9ESjrbgAoG3Lj1rmCqouVKasByW1ogpLkxnd9lCrUKtH5Hn+/tYzvwwdj4rt+77
	h0AbzgknU0ZMfYGLW0zLYf8UJ/EWEWyoLS4/rAFH4ALauGDtq6sON0nPSIWKsX30zDyoh3215Ml
	/SWva6IhDACBdGrZxQG8+pPSn++pbKb6SAWSUBVZFx0HsW0c99hVvpgCcBxfGNRnxkeiamwcvyg
	xju7X4p4RzWZQMAoLgfDrEtAAk=
X-Received: by 2002:a05:6a20:3d0e:b0:398:9ae9:7110 with SMTP id adf61e73a8af0-3aa5a45877fmr8352540637.11.1778150634191;
        Thu, 07 May 2026 03:43:54 -0700 (PDT)
Received: from cchengyang.duckdns.org (36-225-99-238.dynamic-ip.hinet.net. [36.225.99.238])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82535818cdsm1787580a12.2.2026.05.07.03.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 03:43:53 -0700 (PDT)
Date: Thu, 7 May 2026 18:43:51 +0800
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: sashiko@lists.linux.dev
Cc: sched-ext@lists.linux.dev
Subject: Re: [PATCH v2 2/2] selftests/sched_ext: Add dispatch_cookie test
Message-ID: <20260507184117.Gaff5@cchengyang.duckdns.org>
References: <20260506160412.522199-3-yphbchou0911@gmail.com>
 <20260506205234.E6240C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260506205234.E6240C2BCB0@smtp.kernel.org>

On Wed, May 06, 2026 at 08:52:34PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Failing an assertion in the run() function leaks the bpf_link and leaves the BPF scheduler permanently attached.
> - [Medium] The BPF program incorrectly drops the kernel-provided enq_flags when calling scx_bpf_dsq_insert_with_cookie().
> - [Medium] The return value of fork() is not checked for errors, leading to incorrect waitpid() behavior.
> --
> 
> commit de7f9ee9893bdc6cb049e25475e095b028e1ed26
> Author: Cheng-Yang Chou <yphbchou0911@gmail.com>
> selftests/sched_ext: Add dispatch_cookie test
> 
> This commit adds a new sched_ext selftest to verify the behavior of
> scx_bpf_task_get_cookie() and scx_bpf_dsq_insert_with_cookie(). It captures
> a cookie before dispatch and verifies that userspace accurately reflects
> the cookie-based dispatch activity.
> 
> > diff --git a/tools/testing/selftests/sched_ext/dispatch_cookie.bpf.c b/tools/testing/selftests/sched_ext/dispatch_cookie.bpf.c
> > new file mode 100644
> > index 0000000000000..cb198a5f50e89
> > --- /dev/null
> > +++ b/tools/testing/selftests/sched_ext/dispatch_cookie.bpf.c
> [ ... ]
> > +void BPF_STRUCT_OPS(dispatch_cookie_enqueue, struct task_struct *p,
> > +		    u64 enq_flags)
> > +{
> > +	u64 cookie = scx_bpf_task_get_cookie(p);
> > +
> > +	if (scx_bpf_dsq_insert_with_cookie(p, SCX_DSQ_GLOBAL, 0, cookie))
> 
> Does this code unintentionally drop the enq_flags provided by the kernel?
> 
> The fallback branch correctly passes enq_flags to scx_bpf_dsq_insert(),
> but hardcoding 0 here might alter task placement context by dropping
> directives like SCX_ENQ_WAKEUP.
> 
> > +		__sync_fetch_and_add(&nr_cookie_dispatched, 1);
> > +	else
> > +		scx_bpf_dsq_insert(p, SCX_DSQ_GLOBAL, SCX_SLICE_DFL, enq_flags);
> > +}
> [ ... ]
> > diff --git a/tools/testing/selftests/sched_ext/dispatch_cookie.c b/tools/testing/selftests/sched_ext/dispatch_cookie.c
> > new file mode 100644
> > index 0000000000000..f799b5828f9d6
> > --- /dev/null
> > +++ b/tools/testing/selftests/sched_ext/dispatch_cookie.c
> [ ... ]
> > +static enum scx_test_status run(void *ctx)
> > +{
> > +	struct dispatch_cookie *skel = ctx;
> > +	struct bpf_link *link;
> > +	pid_t pids[NUM_CHILDREN];
> > +	int i, status;
> > +
> > +	link = bpf_map__attach_struct_ops(skel->maps.dispatch_cookie_ops);
> > +	SCX_FAIL_IF(!link, "Failed to attach scheduler");
> > +
> > +	for (i = 0; i < NUM_CHILDREN; i++) {
> > +		pids[i] = fork();
> 
> Should the return value of fork() be checked here?
> 
> If fork() fails and returns -1, waitpid() in the subsequent loop will be
> called with -1, causing it to wait for any child process rather than the
> specific process. This could lead to out-of-order reaping and confusing
> test failures.
> 
> > +		if (pids[i] == 0)
> > +			exit(0);
> > +	}
> > +
> > +	for (i = 0; i < NUM_CHILDREN; i++) {
> > +		SCX_EQ(waitpid(pids[i], &status, 0), pids[i]);
> > +		SCX_EQ(status, 0);
> 
> Can this cause a resource leak that affects other tests?
> 
> SCX_EQ() forces an immediate return upon failure. If a check fails here,
> the function will return before reaching bpf_link__destroy(link).
> 
> Leaving the BPF scheduler attached could cause subsequent tests in the
> runner to fail with -EBUSY, since sched_ext only allows one active
> scheduler globally.

This is a valid issue, which can be fixed by moving bpf_link__destory()
before the assertion loop.

Will address this in v3, but would like to wait for more reviews before
sending it. Thanks!

> 
> > +	}
> > +
> > +	bpf_link__destroy(link);
> > +
> > +	SCX_GT(skel->bss->nr_cookie_dispatched, 0);
> > +
> > +	return SCX_TEST_PASS;
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260506160412.522199-1-yphbchou0911@gmail.com?part=2

-- 
Cheers,
Cheng-Yang
