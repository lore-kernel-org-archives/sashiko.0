Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDEA40DFBF
	for <sashiko@lists.linux.dev>; Wed, 29 Apr 2026 00:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777421257; cv=none; b=L72LUUxGOe6DEgZfqhuwlvQ4ScyF9tl5j0u0dMhjAgLn8EagtVFBUuNiBtsBSdSlEICOQHld9aboR99lSL0Ir3Kl4hCKGvkIwKuhVJuCMonWDUq4zvaGFXfX7ERJwI+cV4pmMhvG3Nk+HMKeJ/pq0IjNqZG7Ns0EcwwuYm9i+yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777421257; c=relaxed/simple;
	bh=S8Rsy8kprKwgRoCddvTdZx2hz3GL81C33X6Tlw7SFNs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=EjLHHP+T+zonLN0DxcGERfU7IZKfr+6Pcbt+lXrdefT4D/ctEV83j7sx6XLCkS9MlWcVTqLO7WStnphHJuddLBPtI8ag4DtumrCh1lSm44o06eZf8DD4JqIBuhBuIsEXR3erJVvki4cUaW3fKXblhu6ZxSqLxGYmlpA2AavHt4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BSyDA/kw; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BSyDA/kw"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so85075365e9.0
        for <sashiko@lists.linux.dev>; Tue, 28 Apr 2026 17:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777421254; x=1778026054; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACfb+/M+FYTSNEh0C02o5v+IVIBAx4mi5YgLpUoGiKk=;
        b=BSyDA/kw5Y/P1sLhTDN9RVKfcDnoryjrCs/glQk37t6rzuxETPaybGkyX9swFPEhKX
         2vIdmHsNPxynpnzfcYqwNCX+uyaxB3ljBp3F2sQ+u9dAEZ/YmeTh/RL21/sG/4BFHt/o
         DX+nf82rIKP94ILiUQP94Mme2vLgRuy74Oj081btvn5OsfaSvakjH13DKWCdG8mNvonI
         lXxmSV+KyiWiA0JB4Gg6na1dkV9jypSi7vpGEFQWFFBPeeJjI2S5ur2CoFtJVLK4xsvH
         fXHzcf6qpRRg/r2dd7WnwTR6/IOQ1I6oFVJYCvkpsNXBqLAnsv1zlAkxEunigYfWS56R
         IlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777421254; x=1778026054;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ACfb+/M+FYTSNEh0C02o5v+IVIBAx4mi5YgLpUoGiKk=;
        b=jOZbIPe/uoWCL1ENwoO49RZeDpTv8L5s4ytm6AvjNtH17ig9VuAWRCKYsEaancs40n
         KeosWOYowsqqCy6fPrjjvgwL7IxRqoRO4jU/FcKEH7xc2xZD0zi6WAUCBhhsDs8sl9cD
         GNnRib/F2VqCrgaQvVrNpjtQvtqzM9dUCy+gAMrNi6SqUW2991Tj7yWxwG/X1NIG3DKs
         lEqlT9VHaHLgLowwGrWOeQgCUXVDdcMSJ8ZH2a49NsJdfSJi/jjvG4aT1A21miV4i+S5
         uW+sJJEcOpcYCnKXwIViu5AQ2j2ncvzMYaZu1iq99adtmJxYe3IPU8nKuzuq5iDxH2Bb
         3qbQ==
X-Forwarded-Encrypted: i=1; AFNElJ8D1mANr7Z3Ebjuo1HSEfEYvyGUhgbXeR/ztBqSgVjafe11iF5Ttlk+WijnJu/UYswHFQBaj9SL@lists.linux.dev
X-Gm-Message-State: AOJu0YxES5HSJVXldk5MnGtKeEGg4nmAb08Uhg7EWvZrGWcb8PJiVwTB
	WrZnLUDYWoLr+ptJkpKw/jAEEGHtM71eqhr5SdOtaN0Tsp65FPk/47JOOn4Jwgw3
X-Gm-Gg: AeBDievrO5hKEo15chkTx3U/JHBpDhtt5wcK371WQftiFgnjZv4PfTxnDacDVi2O6pk
	io3RfPQoBQ3PDifupRuc8JWI+E2Zt+CNn+HNZda6gUU4z3H0F1aiUybQtfPx+QoRWmT3Lq30oKr
	pAZqlJM48qBI1p+SOPY9a+zRaL/RHz7amb2SiNWENSplO3U7Gp2GIshoxa/wzIcQDgMVjBsEV5g
	w8NxFvh8aQxHHaJpv70EzpF8wAYw9OT8g5D/CEan/cd+0ypoYzRSBJAewpVliE5X/WBo9x9SYq8
	kwmds1CXk4NQtg5ML4z6vYWFCQ4NH1P0qAJAd7rktqmCuY6b4a1sBRJ2C36sNnv4FyV3cPsZF4z
	J7SgtZk6AktFhJs7/OSN4eoMbd395ybAmoarHeTEgMbUSJebUxFE8uNHAWVsRa56uDKxYByOa1n
	oZ/RmAMwM8m2gkfVdt8f8HPx3eBWTVM0hGGLFOGxVIaoDIPWqUpxSbK7CPCCcuVEFeUYRuPKQD2
	AulyFZ4azntgfvqiT12BlX3LOan+jZexlr4BJkEoqALpxz25gVhfPYV4cARbjL+m6hx+5jHBccZ
X-Received: by 2002:a05:600c:630a:b0:486:fbd1:9dc0 with SMTP id 5b1f17b1804b1-48a77b19d7dmr98636755e9.22.1777421254032;
        Tue, 28 Apr 2026 17:07:34 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c5845c8sm13224245e9.7.2026.04.28.17.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 17:07:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 02:07:33 +0200
Message-Id: <DI578ZDDKR6K.QH52KXPV1CLN@gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: Print breakdown of insns processed by
 subprogs
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, <sashiko@lists.linux.dev>,
 "Paul Chaignon" <paul.chaignon@gmail.com>
Cc: <bpf@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <5c3514dbc879f22ba3f9eff8a2c730e13bd0572c.1777388107.git.paul.chaignon@gmail.com> <20260428230844.EFA64C2BCAF@smtp.kernel.org> <DI56ZVH6HKDK.1L8J5HPA37J09@gmail.com>
In-Reply-To: <DI56ZVH6HKDK.1L8J5HPA37J09@gmail.com>

On Wed Apr 29, 2026 at 1:55 AM CEST, Kumar Kartikeya Dwivedi wrote:
> On Wed Apr 29, 2026 at 1:08 AM CEST, sashiko-bot wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential iss=
ue(s) to consider:
>> - [High] Out-of-bounds read in `bpf_subprog_is_global()` when printing v=
erification stats for programs with hidden subprograms.
>> --
>>
>> commit 08128f883e58301e0f97b1d4a94656be63b8f790
>> Author: Paul Chaignon <paul.chaignon@gmail.com>
>>
>> bpf: Print breakdown of insns processed by subprogs
>>
>> This patch tracks the number of instructions processed by each global
>> function (subprog) during BPF verification. It then reports this
>> breakdown in the verifier logs under BPF_LOG_STATS.
>>
>>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>>> index 03f9e16c2abe..b48389b48eb6 100644
>>> --- a/kernel/bpf/verifier.c
>>> +++ b/kernel/bpf/verifier.c
>>
>> [ ... ]
>>
>>> @@ -18288,6 +18295,13 @@ static void print_verification_stats(struct bp=
f_verifier_env *env)
>>>  				verbose(env, "+");
>>>  		}
>>>  		verbose(env, "\n");
>>> +		verbose(env, "insns processed %d", env->subprog_info[0].insn_process=
ed);
>>> +		for (i =3D 1; i < env->subprog_cnt; i++) {
>>> +			if (!bpf_subprog_is_global(env, i))
>>
>> Could this introduce a regression due to an out-of-bounds read on the
>> func_info_aux array if there are hidden subprograms?
>>
>> At load time, if BTF is present, env->prog->aux->func_info_aux is alloca=
ted
>> with exactly func_info_cnt elements, and env->subprog_cnt initially matc=
hes
>> func_info_cnt.
>>
>> During verification, if a feature like bpf_throw is used without an expl=
icit
>> callback, add_hidden_subprog() is called which increments env->subprog_c=
nt
>> but does not resize the func_info_aux array.
>>
>> Since this loop iterates up to the updated env->subprog_cnt, when i reac=
hes
>> the index of a hidden subprogram, bpf_subprog_is_global() will access
>> aux[i].linkage where i >=3D func_info_cnt:
>>
>> kernel/bpf/verifier.c:bpf_subprog_is_global() {
>> 	struct bpf_func_info_aux *aux =3D env->prog->aux->func_info_aux;
>>
>> 	return aux && aux[subprog].linkage =3D=3D BTF_FUNC_GLOBAL;
>> }
>>
>> Is it possible to skip hidden subprograms here, or limit the check to
>> func_info_cnt?
>
> Don't see it happening, since hidden subprogs never get verified, so we w=
on't
> invoke bpf_subprog_is_global() with such a subprog index.

Ah, no, stupid me. We get here after fixing up and adding the hidden subpro=
g. So
we can still do OOB since subprog_cnt includes the hidden_subprog_cnt. How =
about
the following as a fix? I checked over other places where we iterate over a=
ll of
the subprogs and those look fine, so instead of changing bpf_subprog_is_glo=
bal()
we can adjust this function to only consider real subprogs. Didn't compile =
test.

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index b48389b48eb6..b9266e3d46c7 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -18281,22 +18281,24 @@ static int do_check_main(struct bpf_verifier_env =
*env)

 static void print_verification_stats(struct bpf_verifier_env *env)
 {
+       /* Skip over hidden subprogs which are not verified. */
+       int subprog_cnt =3D env->subprog_cnt - env->hidden_subprog_cnt;
        int i;

        if (env->log.level & BPF_LOG_STATS) {
                verbose(env, "verification time %lld usec\n",
                        div_u64(env->verification_time, 1000));
                verbose(env, "stack depth ");
-               for (i =3D 0; i < env->subprog_cnt; i++) {
+               for (i =3D 0; i < subprog_cnt; i++) {
                        u32 depth =3D env->subprog_info[i].stack_depth;

                        verbose(env, "%d", depth);
-                       if (i + 1 < env->subprog_cnt)
+                       if (i + 1 < subprog_cnt)
                                verbose(env, "+");
                }
                verbose(env, "\n");
                verbose(env, "insns processed %d", env->subprog_info[0].ins=
n_processed);
-               for (i =3D 1; i < env->subprog_cnt; i++) {
+               for (i =3D 1; i < subprog_cnt; i++) {
                        if (!bpf_subprog_is_global(env, i))
                                continue;
                        verbose(env, "+%d", env->subprog_info[i].insn_proce=
ssed);
