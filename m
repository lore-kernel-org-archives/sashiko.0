Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723B527603F
	for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 17:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776361918; cv=none; b=ETIxExeBtx8aVoUsAfGUkHhlf/saSzBT2j45lzyEDp6PtEJXYj9YmMgYWhxI7Z3TUFZ7hhP0dmMl5cPLXJxJ0/CqYda5FvsFP33am4rJFZmSxMSDWFaiworVAxVMKYSDAxOEvMbJEfotBmeUOj6GO0PfR65aE0fdw/xn/2DqZJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776361918; c=relaxed/simple;
	bh=1EH6/eggcrN+2q9BPJj+q+jQoBGLudz6LP8XGzBakHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qfMK2J4IFnsJ6vL3s/FkPR8wn3bNhh8CSv3mRC/FJfLI+6HkxNifigoioHF0BE+Qv1V7Kq9DEbms2sKqrA2YBDDROwP/BnCGnOkglAlFZPxkLtpSTnSLwREuCrQFnFE34HWCHRR551dFRt5s/WwEaewTQCYdJvoUz8ykdFF9c9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADnIrZV7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADnIrZV7"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488a4bc360bso46433225e9.0
        for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 10:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776361916; x=1776966716; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9lw0+OPmfDnGiyamEFF6WGsMRzAbLtpadOQYAgY907c=;
        b=ADnIrZV7Pf/mIfVP61eu4th4iw/KjDzbYz//A6102X9R6jJMlBJMUHLwehbKqZWzyw
         mS7EUqLlpr/6KxL3oD6RbjS2xQFt0GWF3gNcHMGg3vA4AfW5vdmrfXEIsUy+Vbnmk82h
         mdAPQ2U5vojFoAssnjWBF0AkFsYgYMyHOORTA0eoCgvuSGF13OYktiviirs1/85yIMor
         qIn1GPAy1OdNB//ppnvpa5ObJVlkfwZJge56ZIWiNMSbg/zQZuxu0AkUpF49DRme5rNu
         qq6WBwx2uBZanp4+EEKG7MNbU/4Mm2hJxy8c3MjkzbtnKu77wissiIsCfDldFRHhWhEP
         AZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776361916; x=1776966716;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9lw0+OPmfDnGiyamEFF6WGsMRzAbLtpadOQYAgY907c=;
        b=TRK9YzpWyBuJMv5Iil1cRMQH/qXJ6Y/zPY1Lgfp0Y0WIoYr3AMGvzCkeYAGM4NfZ82
         n8NUuYKsdUd2gVe3pC5F0biB4Wr7r1W4x/N9gvflvzcm4iuSaDvXxxEDqSeI2UE0ABam
         QX5PpcncksudK8imPL9FNw9ciHX0o9b5oHzB/PKPXXWpIS5Jv9HCkKpVhWChqI/Rdxdy
         0ixACuUisvK/ybvu7CU8u2FzKFA97O10giphM+xB/XLEGhzkT1TAnNiK9ygIBKybDBeu
         xS40wTYEF375nxzlBbbaVZHxHgQMbq+2Zsyx65XI49ym12kHKnhU4UNpq2wnFM2nJeYJ
         PVcA==
X-Gm-Message-State: AOJu0YxMkH3aR0+h9bs8sTRF5AIoURF+ZuV2T52jqeLohitnRTF6BwvC
	WUZBDZWLOMFOvzYy1Z+zUtBkiPVAfLgm5Ov2JSBBYQcWBo+Na3HsWMa8akRVHmuY
X-Gm-Gg: AeBDies57F9yF1+eqv/eDpSarK6Fhfy0Bby2XIwECGWCAPpY0cWGKa5RHM3HmVa8shf
	npF8ch0RjowwxfVDrkSu0/WAhQcdGtnvOnzWBkZTav6DFKL9Hvsqma2odUi0fo/HMQX7v2QaaUn
	jg05Q47Q8ZQTwEkYF60zUKZV+cvUUfZqyjAsUY3UmH/hWRfupinCLUlTVEF9TG9DwUO0xr49VtD
	Y0fQ8fhOuAnVVWITPuv+DtV5mx6LAe7juAB8z8XBLWeLE8xTAO35lsPWq2Ch8EA5OsMBElnqLpA
	LyR0iqWYPKkEMD11uNfPGdzzXAcLiJh3+PO/69L+TKxZ4hBnHETAYttcqFswfP4p7qYtL9b3rWq
	IwHSDJwGUhNalLS8FZFTdMtv5IG7gpD2b6KWlM9ZKVCs77fpjfch2ntALxio+spkSKK91l33aBA
	D/e5U9wEidcHbRYJjKvqqB9X0eHZjjymKhZdc2vIhi8FVCn+K8IY8gDsJ7eT29Do5oze/N99ljX
	rdo1VkuVdqfnTKqJuGISwU+cKJdI2BDjyBPqGzz4eH3Ld8Vf672nOh9Z9ot324HH/SHNm4SbY9j
	1XsCkY2x1j9BRinRnpg4POKmqbB9xNc8ynqcR4u9zB6v8Xsb3kLL
X-Received: by 2002:a05:600c:a105:b0:485:3af5:7e53 with SMTP id 5b1f17b1804b1-488d6839821mr261694475e9.19.1776361915648;
        Thu, 16 Apr 2026 10:51:55 -0700 (PDT)
Received: from mail.gmail.com (2a01cb0889497e00b55a04a9836ebec0.ipv6.abo.wanadoo.fr. [2a01:cb08:8949:7e00:b55a:4a9:836e:bec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f5818d70sm119654275e9.4.2026.04.16.10.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 10:51:55 -0700 (PDT)
Date: Thu, 16 Apr 2026 19:51:53 +0200
From: Paul Chaignon <paul.chaignon@gmail.com>
To: sashiko@lists.linux.dev
Cc: Harishankar Vishwanathan <harishankar.vishwanathan@gmail.com>,
	bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next 2/2] selftests/bpf: Test for empty intersection
 of tnum and u64
Message-ID: <aeEhua0q1C8xCO0F@mail.gmail.com>
References: <20260415160728.657270-3-harishankar.vishwanathan@gmail.com>
 <20260415182952.C7B77C19424@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260415182952.C7B77C19424@smtp.kernel.org>

On Wed, Apr 15, 2026 at 06:29:52PM +0000, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 2 potential issue(s):
> - [Medium] The test relies on the verifier treating the return value of `bpf_get_prandom_u32()` as a completely unbounded 64-bit scalar. If the verifier is improved to track its true 32-bit bounds, the test will silently stop testing the intended logic.
> - [Medium] The inline comments in `empty_tnum_u64_intersection` incorrectly describe the verifier state at the wrong instruction boundaries and use incorrect terminology.
> --
> 
> commit f07d8c6131ab63ef38acb708d393fc328146ef7c
> Author: Paul Chaignon <paul.chaignon@gmail.com>
> 
> selftests/bpf: Test for empty intersection of tnum and u64
> 
> This commit adds a verifier selftest for a scenario where the tnum and u64
> values don't intersect on a branch. It uses bpf_get_prandom_u32() and
> conditional jumps to test if the verifier correctly deduces that the branch
> is dead code.
> 
> > diff --git a/tools/testing/selftests/bpf/progs/verifier_bounds.c b/tools/testing/selftests/bpf/progs/verifier_bounds.c
> > index c1ae013dee29c..151c7a479a6b8 100644
> > --- a/tools/testing/selftests/bpf/progs/verifier_bounds.c
> > +++ b/tools/testing/selftests/bpf/progs/verifier_bounds.c
> 
> [ ... ]
> 
> > @@ -2184,4 +2184,29 @@ __naked void tnums_equal_impossible_constant(void *ctx)
> >  	: __clobber_all);
> >  }
> >  
> > +SEC("socket")
> > +__description("dead branch: tnum and u64 don't intersect on true branch")
> > +__success
> > +__naked void empty_tnum_u64_intersection(void *ctx)
> > +{
> > +	asm volatile("									\
> > +	call %[bpf_get_prandom_u32];							\
> > +	r6 = r0;									\
> 
> Since bpf_get_prandom_u32() returns a u32, its runtime value is strictly
> within [0, 0xffffffff]. If a future verifier update bounds prandom_u32() to
> this range, the verifier will accurately determine that the jump
> (r6 s< 0xe00000002) is always taken and prune the fallthrough path as dead
> code.
> 
> Would this cause the test to silently pass while no longer providing any test
> coverage for the tnum intersection logic? Could a truly unknown 64-bit value
> be constructed instead to prevent this test fragility?

That's not a bad comment, but I would expect bpf_get_prandom_u32_proto
to be part of the API at this point. Many other selftests use it to
retrieve a RET_INTEGER from the verifier's point of view. If we were to
ever change that, we'd likely get more than one failure.

> 
> > +	r1 = 0xe00000002 ll;								\
> > +	r2 = 0xf00000000 ll;								\
> > +	if r6 s< r1 goto +2;								\
> > +	/* On fallthrough, r6's u64=[0xe00000002;0xf00000000] */			\
> 
> Are these inline comments describing the verifier state accurately? The upper
> bound of 0xf00000000 does not seem to be established until the fallthrough of
> the next instruction (if r6 s> r2 goto +1).

The convention seems to be that comments explain the next line, not the
previous (cf. other tests and [1]).

1: https://lore.kernel.org/bpf/CAADnVQJ2hX6E1_p557MYJOQLxXROzDxezwr-x79A7MyZZLzJuA@mail.gmail.com/

> 
> > +	/*                      tnum=(0xe00000000; 0x1ffffffff) */			\
> > +	if r6 s> r2 goto +1;								\
> > +	/* On fallthrough, r6's tnum=(0xe00000001; 0x100000000) */			\
> 
> Does this tnum state actually describe the fallthrough path? It appears to
> describe the mathematically deduced state on the jump target (true branch) of
> the w6 == 1 check, making the term "fallthrough" incorrect here.

Same here.

> 
> > +	/* It doesn't intersect with the u64 so the condition is always false */	\
> > +	if w6 == 1 goto +1;								\
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260415160728.657270-1-harishankar.vishwanathan@gmail.com?part=2
> 
