Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3E737C92C
	for <sashiko@lists.linux.dev>; Tue, 28 Apr 2026 23:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777420545; cv=none; b=pFZ2UBOD4ZJ2KwvEd4IS0FK7quyCq44u3p+QKq9iHJBQSqhVr2couyhkzlkYezOF/pKcQlkDtzJMNMhqTTF7evW5Z/sxZXZKAxmsHh2rswvECbz9lg+jYp8XKj99TntRGl8D/B4+ZCu2S2to0NJwQaB8tkPLyzjLPPSI0baYK/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777420545; c=relaxed/simple;
	bh=1hR2qqa4Y1OyuOCxf1xs9FpGdy5pT7ECAJJx/9SSp+o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dcBYBsOwL64SLCTn8cVKl4eED95AH/Cr85QcyOOetLOaZGZ64+p4Esr417OiMUXBoA0AuRpkSud/+L8e47otRvWhZimjZ4nrYIMX8wqpztF4+Z9D7dX/daVrvbW8gtjuKoUSWkToHr9XE+oB2NwTZvCZv+n4fCfuSAD7QgqJ/X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+faqmDF; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+faqmDF"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-48909558b3aso119485985e9.0
        for <sashiko@lists.linux.dev>; Tue, 28 Apr 2026 16:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777420540; x=1778025340; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9g7B8Ypo4SoUpZreQw8z2INkCZakr2UWz97FZIj+cH0=;
        b=S+faqmDFqOTYjoFeKfJvy6iyq6azWPC0BVAzTtoNawmXlOy31L6UE8X7AElLEcPLkW
         M7bLhLjjD2Xt1i/DORG0EoBau9xNJKu1+lnNlN51TGb9osCskWqLaoCXMG4zPYc0I7B2
         zBdRl7IEADuKOT5HiocO7RRN5LTOM/ZA9LVPPmHEfE3tEqxpXyMWOF1O83EySng0tjci
         eoqEoxCliQ+BX79bWX8qSzP2QVPiEx3VDZyRL0YoWgAIthim2T0ofZzD42ROK1SLLoob
         ZdA6R8o5zVkNCAoe0omyTMkTJIsELNevcou+ugVAtTE4zSVI9/r9tU4ne4nIUCGc3Z3J
         E04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777420540; x=1778025340;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9g7B8Ypo4SoUpZreQw8z2INkCZakr2UWz97FZIj+cH0=;
        b=qea67Ywq3I98oPcCigoy/6frv7EdhFLEUTDHKTlhus1b2NJimmbb5MatIv5JIKsVXS
         NF9pQT3HJycIAsAtbkryd2ccICftCUCTiwrSi+uuh8WT7O2+pvJCCArS2oZFgDpLB3Ir
         7fhlQIji3bbSxSRq/qWNkAyQdFKcAAt9fEfFQUZZ1RJQxieMDehNTLN2hWE5xB+vkcmI
         9Yg+f2oqXOfOA82C7UhFGD0s/+FOxlWqFEBjVyt51S8sIweOmPdmbgcbU/TRk0TLIZS8
         qmVfvmEG7Y1mriuRteY11+PcILTBvfAHLPQ7EONODEp8b2QqLHfhZEJl+W6/G7nup4pe
         4Klw==
X-Gm-Message-State: AOJu0YxpmckheGPKh7FQ0sm41oU0Vr13W+MUkc527QBjbz1Gu9xQwcC8
	qxL0tLgCDMK/91+2XdstQwnuOFnbgG+bZukQ36c0tvpEMlwTyoOtKXaoRb3UGXku
X-Gm-Gg: AeBDietp0/BAWyQv+CTRJoF44yDur0V8A3j/o0cDjBtjb6zHAJkpKqbp5P7iJmUzkQW
	uBEGv6QLdGE3ptKhDxwt6nYBL72zPqfhgxQMWxJIQOSNgW8ZFPtc2HwUxWnOtnGdx5pPL9rAg2W
	8dPWovYL24QE+x/pleQdk/0taGg4mo9zZoh7W1QgNS66BlrQZoCjMm+3eN4SnHU4v2o+Dqn8dzE
	AYo9t+iYyLKNznf42baq4VkW07mvd4EiY7PqtwS5x8OLPAQzdpI1lboWB9evzzgx0KDMvvukGyr
	hZkyvRGqRI6lRQzTNJa4sNvt7DNo3kt96tCH3MPgFYAWYOMiE8JD62zGRd2M3wwp0FrDLCZeU1F
	rsFJ0xADzbM/Nl/ciSO1/oO/pMwls3vPPe2jVW7LF+uDspV3iQouewxoQ0GyEtsiHA8zaGqcaoD
	r1D6UxjTEUdhylMs2t4udWGslvKvhEj3sp+1ibUqH8LNC5ZhLwkeT2tM2ePyaJ2r+15q80HzrHp
	LGB87v7Kbl8hBLBHvXFLT3ufZMCBiLx/GTDGkQVRtG6jFhmlN0IuR0Ybt3CjhRxQ65Xb0dete89
X-Received: by 2002:a05:600c:2e0a:b0:48a:5574:3a48 with SMTP id 5b1f17b1804b1-48a7b59d1camr14855135e9.16.1777420540294;
        Tue, 28 Apr 2026 16:55:40 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7bc7a359sm26899535e9.10.2026.04.28.16.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 16:55:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 01:55:39 +0200
Message-Id: <DI56ZVH6HKDK.1L8J5HPA37J09@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next 1/2] bpf: Print breakdown of insns processed by
 subprogs
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko@lists.linux.dev>, "Paul Chaignon" <paul.chaignon@gmail.com>
X-Mailer: aerc 0.21.0
References: <5c3514dbc879f22ba3f9eff8a2c730e13bd0572c.1777388107.git.paul.chaignon@gmail.com> <20260428230844.EFA64C2BCAF@smtp.kernel.org>
In-Reply-To: <20260428230844.EFA64C2BCAF@smtp.kernel.org>

On Wed Apr 29, 2026 at 1:08 AM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Out-of-bounds read in `bpf_subprog_is_global()` when printing ve=
rification stats for programs with hidden subprograms.
> --
>
> commit 08128f883e58301e0f97b1d4a94656be63b8f790
> Author: Paul Chaignon <paul.chaignon@gmail.com>
>
> bpf: Print breakdown of insns processed by subprogs
>
> This patch tracks the number of instructions processed by each global
> function (subprog) during BPF verification. It then reports this
> breakdown in the verifier logs under BPF_LOG_STATS.
>
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index 03f9e16c2abe..b48389b48eb6 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
>
> [ ... ]
>
>> @@ -18288,6 +18295,13 @@ static void print_verification_stats(struct bpf=
_verifier_env *env)
>>  				verbose(env, "+");
>>  		}
>>  		verbose(env, "\n");
>> +		verbose(env, "insns processed %d", env->subprog_info[0].insn_processe=
d);
>> +		for (i =3D 1; i < env->subprog_cnt; i++) {
>> +			if (!bpf_subprog_is_global(env, i))
>
> Could this introduce a regression due to an out-of-bounds read on the
> func_info_aux array if there are hidden subprograms?
>
> At load time, if BTF is present, env->prog->aux->func_info_aux is allocat=
ed
> with exactly func_info_cnt elements, and env->subprog_cnt initially match=
es
> func_info_cnt.
>
> During verification, if a feature like bpf_throw is used without an expli=
cit
> callback, add_hidden_subprog() is called which increments env->subprog_cn=
t
> but does not resize the func_info_aux array.
>
> Since this loop iterates up to the updated env->subprog_cnt, when i reach=
es
> the index of a hidden subprogram, bpf_subprog_is_global() will access
> aux[i].linkage where i >=3D func_info_cnt:
>
> kernel/bpf/verifier.c:bpf_subprog_is_global() {
> 	struct bpf_func_info_aux *aux =3D env->prog->aux->func_info_aux;
>
> 	return aux && aux[subprog].linkage =3D=3D BTF_FUNC_GLOBAL;
> }
>
> Is it possible to skip hidden subprograms here, or limit the check to
> func_info_cnt?

Don't see it happening, since hidden subprogs never get verified, so we won=
't
invoke bpf_subprog_is_global() with such a subprog index.
