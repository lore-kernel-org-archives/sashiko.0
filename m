Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEED3F166E
	for <sashiko@lists.linux.dev>; Wed, 29 Apr 2026 14:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777471290; cv=none; b=M/dBvqEXSUvyrvwQvPOL04s509d+V7/YhmNX87cm38VinFq/9YBDLFca1sMmQ8kC2yMdOGip8YLBPJ88SBCXo2A7GkT8oRh1w9tuXdSPTQOmmnz9P9xyX8NRMJsdiXmC5XoWWEEnu4v1GjzTklmfwGaNb31zX3/sLjBlrPrejNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777471290; c=relaxed/simple;
	bh=YkYM51GL/E0EPxztF09dalzXcDlZuXCPZe2oicp13x8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5PpmtA1OL/22w+BBh8KsLcBZ4BMc0jcI9pQBR+/yQUWkntkHe/PxcODDsE7fdhIPELflkDBp5m5KTTgk/ewz9h3xNTmfX7bP7Y0+mULUFtxHc22KDB1hdqks7e/y7HOgMZiJzFwhB5LjhWFPRwx6Rga6pSyxzAKzYWTbHMnss4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HRz4Hv0K; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HRz4Hv0K"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43cfbd17589so9837662f8f.0
        for <sashiko@lists.linux.dev>; Wed, 29 Apr 2026 07:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777471286; x=1778076086; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4VAWCSrGbt/D1GbLISgkV4OM6Tch3UUmiA5VC/PVL/I=;
        b=HRz4Hv0KKcIAYauMPhXvNp9wiJ7xwuZAc9jp7WZfs7ehW9/7l1a2+kOE5sOfYYKjHG
         GslkM0F50fkIthu2Z3sq5fhqcDC/uHmBnqbPC+5OE3OnBIWEscl0PSgzxn7GOgtKPJEO
         VG91w9kP/XWNI4xugWZpXP6YVjyA7NldjyRCibJM1p4S3UcEPByGwJGe9ceBTqlgykw2
         HuJDNK+BUxqthu5lWT0Eawpigqg9j1vqQN0Ikq31T8b/jteLQ1lVwFhK4SnJU4N+rUh+
         ++BnEhEJr/6If0feBD/UcYGRjvNBdIEe2tmkzqOQ+sg7p9s9y/IqkQyu9tfkUpz1N57h
         MYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777471286; x=1778076086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4VAWCSrGbt/D1GbLISgkV4OM6Tch3UUmiA5VC/PVL/I=;
        b=Gw0Mhb501S00U+Y89Id8InYFUK8OK+09f85rKQrzcV5yt/GSQyqYxdgKna8593V206
         5/TnRAod/GRmk/l4GxDKiesli5o9h7VNaGaLUcSxS03LKhyEHwaa3cIUiMLCMcu+c7Q0
         YRG5QfWbH4mu/bQDo6SORHE2ksyFYhTBrMbUK3yzUrRst9DRhvDOSlDtLgeWmFTEauHX
         WQohL9kZAGYbQdJIF13Qo9nOvIXwHhYvkFohw16i+9zORyQXReLWs6xr2JBfQ+EzdATw
         qpxMMPMD/H0fiuLHyOB3eWaIjpOhRx2zsvi6ZIccQgODn/LzabV3xCKx2vEN+C/K0kkY
         yuOA==
X-Gm-Message-State: AOJu0YxNisl+iilEe715dAkebfSU1BphwgZL0bFWBx2rcV7+I6J3OFOu
	FYEUekQn49sfNz/vydfy7hxbZc1FTR1IBdflgtdzxGWkzDQ8Yf36XIoz
X-Gm-Gg: AeBDiesDo/q+B3dU+TdMgeYQR7VhaoKhfmy136oIVl2w/ZG0Zvlip93iYxOmGyFMVwo
	dMGw823HR7Txq+XwbW3iI46Pv3B0JhGa0lBUHvZAqeNBQJJQM3ECg/VB4iANyQ6dNPGkiFwX3KO
	X8L2qlx1Me2PLD0A1etwLG5NXVoISe5DmAAoT0YRGu5KhUudpmwjWhzf01iOHrj4UpEnUKsScuw
	nKnLlROUMFwnWyZeANAttVHYSae4mp9Vm4pazaLiy26XVlnjAT+qKZkJjotadpuJhlNNrh53y8a
	4199esQvJ5owJwU5L+G0IOuJKdmAyXaYr5H/Yp+tKG4oKsDizlU8iNkmRLKTSHtjyQKXFOIex4R
	IAlMhDnejENiIqvvfvD+pu8h1kOQn3mdRic7oR5WGKRrG5wJ53eMA+Hb9AaVX9aIXrg9IcOeHni
	0aBLBSAlZiX3Ob91YbS0vNgp2LIG9z2/mVQA7V/uSatr7UEsOy8837Gj+VrXXz+mfuuLxw6e6aA
	mj0/29aeuBRSYC4iK3O4vkrAQE5aydlcVBkOgUifPQ8Qk/o7C2WkTWzPwrGWfMlbm6tpZfz4KK2
	UPCvRHRglISQP9cjAhZXL8iZMaaZx1IHrn38L935wy3pQaCUinAX4EU76+Q+0Skl
X-Received: by 2002:a05:6000:2089:b0:43c:f66e:f31 with SMTP id ffacd0b85a97d-446494ebaf2mr14548292f8f.27.1777471285475;
        Wed, 29 Apr 2026 07:01:25 -0700 (PDT)
Received: from mail.gmail.com (2a01cb0889497e00fb2d91b6f941d667.ipv6.abo.wanadoo.fr. [2a01:cb08:8949:7e00:fb2d:91b6:f941:d667])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b4216604sm7038590f8f.10.2026.04.29.07.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:01:24 -0700 (PDT)
Date: Wed, 29 Apr 2026 16:01:22 +0200
From: Paul Chaignon <paul.chaignon@gmail.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: sashiko@lists.linux.dev, bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next 1/2] bpf: Print breakdown of insns processed by
 subprogs
Message-ID: <afIPMllq5VI-bJLY@mail.gmail.com>
References: <5c3514dbc879f22ba3f9eff8a2c730e13bd0572c.1777388107.git.paul.chaignon@gmail.com>
 <20260428230844.EFA64C2BCAF@smtp.kernel.org>
 <DI56ZVH6HKDK.1L8J5HPA37J09@gmail.com>
 <DI578ZDDKR6K.QH52KXPV1CLN@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DI578ZDDKR6K.QH52KXPV1CLN@gmail.com>

On Wed, Apr 29, 2026 at 02:07:33AM +0200, Kumar Kartikeya Dwivedi wrote:
> On Wed Apr 29, 2026 at 1:55 AM CEST, Kumar Kartikeya Dwivedi wrote:
> > On Wed Apr 29, 2026 at 1:08 AM CEST, sashiko-bot wrote:
> >> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> >> - [High] Out-of-bounds read in `bpf_subprog_is_global()` when printing verification stats for programs with hidden subprograms.
> >> --
> >>
> >> commit 08128f883e58301e0f97b1d4a94656be63b8f790
> >> Author: Paul Chaignon <paul.chaignon@gmail.com>
> >>
> >> bpf: Print breakdown of insns processed by subprogs
> >>
> >> This patch tracks the number of instructions processed by each global
> >> function (subprog) during BPF verification. It then reports this
> >> breakdown in the verifier logs under BPF_LOG_STATS.
> >>
> >>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> >>> index 03f9e16c2abe..b48389b48eb6 100644
> >>> --- a/kernel/bpf/verifier.c
> >>> +++ b/kernel/bpf/verifier.c
> >>
> >> [ ... ]
> >>
> >>> @@ -18288,6 +18295,13 @@ static void print_verification_stats(struct bpf_verifier_env *env)
> >>>  				verbose(env, "+");
> >>>  		}
> >>>  		verbose(env, "\n");
> >>> +		verbose(env, "insns processed %d", env->subprog_info[0].insn_processed);
> >>> +		for (i = 1; i < env->subprog_cnt; i++) {
> >>> +			if (!bpf_subprog_is_global(env, i))
> >>
> >> Could this introduce a regression due to an out-of-bounds read on the
> >> func_info_aux array if there are hidden subprograms?
> >>
> >> At load time, if BTF is present, env->prog->aux->func_info_aux is allocated
> >> with exactly func_info_cnt elements, and env->subprog_cnt initially matches
> >> func_info_cnt.
> >>
> >> During verification, if a feature like bpf_throw is used without an explicit
> >> callback, add_hidden_subprog() is called which increments env->subprog_cnt
> >> but does not resize the func_info_aux array.
> >>
> >> Since this loop iterates up to the updated env->subprog_cnt, when i reaches
> >> the index of a hidden subprogram, bpf_subprog_is_global() will access
> >> aux[i].linkage where i >= func_info_cnt:
> >>
> >> kernel/bpf/verifier.c:bpf_subprog_is_global() {
> >> 	struct bpf_func_info_aux *aux = env->prog->aux->func_info_aux;
> >>
> >> 	return aux && aux[subprog].linkage == BTF_FUNC_GLOBAL;
> >> }
> >>
> >> Is it possible to skip hidden subprograms here, or limit the check to
> >> func_info_cnt?
> >
> > Don't see it happening, since hidden subprogs never get verified, so we won't
> > invoke bpf_subprog_is_global() with such a subprog index.
> 
> Ah, no, stupid me. We get here after fixing up and adding the hidden subprog. So
> we can still do OOB since subprog_cnt includes the hidden_subprog_cnt. How about
> the following as a fix? I checked over other places where we iterate over all of
> the subprogs and those look fine, so instead of changing bpf_subprog_is_global()
> we can adjust this function to only consider real subprogs. Didn't compile test.

That's a nice find! I also doubted it initially as we have that pattern
everywhere.

It looks like this would be a fix for commit 335d1c5b5452 ("bpf:
Implement support for adding hidden subprogs") (or technically, the next
commit as 335d1c5b5452 didn't have any user). So maybe I can resend as a
first patch (with you as a co-author) and the following diff (took the
opportunity to simplify the logic on the assumption that we always have
the main "subprog").

Not sure if it would need to be sent to bpf instead of bpf-next. Maybe
keep the patchset on bpf-next, but add "Cc: stable@vger.kernel.org"?

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 03f9e16c2abe..8dfe7da76258 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -18274,19 +18274,15 @@ static int do_check_main(struct bpf_verifier_env *env)
 
 static void print_verification_stats(struct bpf_verifier_env *env)
 {
-       int i;
+       /* Skip over hidden subprogs which are not verified. */
+       int i, subprog_cnt = env->subprog_cnt - env->hidden_subprog_cnt;
 
        if (env->log.level & BPF_LOG_STATS) {
                verbose(env, "verification time %lld usec\n",
                        div_u64(env->verification_time, 1000));
-               verbose(env, "stack depth ");
-               for (i = 0; i < env->subprog_cnt; i++) {
-                       u32 depth = env->subprog_info[i].stack_depth;
-
-                       verbose(env, "%d", depth);
-                       if (i + 1 < env->subprog_cnt)
-                               verbose(env, "+");
-               }
+               verbose(env, "stack depth %d", env->subprog_info[0].stack_depth);
+               for (i = 1; i < subprog_cnt; i++)
+                       verbose(env, "+%d", env->subprog_info[i].stack_depth);
                verbose(env, "\n");
        }
        verbose(env, "processed %d insns (limit %d) max_states_per_insn %d "

