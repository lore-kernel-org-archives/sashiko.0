Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF844347506
	for <sashiko@lists.linux.dev>; Wed, 29 Apr 2026 15:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777478027; cv=none; b=RoE7Xaq3/QsGd/uenYZxJ24pCbQkPtpMqPuKbc0CkA5t1HGwkFwLys2NYZWtsdupWQ+Ac/C+awXAHtEl6qBoKVQLjcS5KMY/bJrmwRMxsXqqFprZ+hQximLTkPk8BBnaw5Omf+oUD67cWYTFraVKDkvrmXIkp2av6iN8KGgDdJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777478027; c=relaxed/simple;
	bh=eVx1TolgAGWFBedQA7EDI6P6A+a2g3ZNcyQ9mIxFl0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nOnYzfz2uHp1+4X0MG9jXj4P+FYP68b7xmjRPNN4wKDRTi62+HnslH8h6ToLqCv6fJADb1M8SNEf/N9kp8aBdQMMdklNLsjCC2/05WMGll0KxziEjvtqwiYHeh4J2C2w2PN9kWomDd3qs2fFjuRTKKd6AMQK12Lh58SelPQHITQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e36yygX7; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e36yygX7"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso10520075e9.1
        for <sashiko@lists.linux.dev>; Wed, 29 Apr 2026 08:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777478024; x=1778082824; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x3d45FYs/u15o3gONdNkXWFSDj83L1ojAg9+bYGvTgM=;
        b=e36yygX7jFC8LKp2uT173JtdXlQv1vKjB0nwrEIrrqbsPZDiPr0FIWvb0OI2yp+WYU
         P1VHLMm+h6zApWqu4kRTaYIIo6v9ujMFqMMG7v03WMRSKWj3X2y4HI0FrFaAPSQhGk3y
         mzRHvXjPFyEuN1q68RNDRHr6GwbirCfHQ6OHPEpicklJZrFU6MEF9auZy+4nHC7MbaXG
         sNkcbi6x3/dJTTLOVhDwDD3zPb3k65v4eHZT4ktnHXgxyO/nb9/YsX65kUbg+sDHpXgB
         sd0Kxf31Mo/jpNIsb718IWPfD8OyvqyGeYq3P8dgvHBMqUC2s5cL4Q5NBEgBoI1tQ2dJ
         Z36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777478024; x=1778082824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x3d45FYs/u15o3gONdNkXWFSDj83L1ojAg9+bYGvTgM=;
        b=JlauGkfTZvWOAfKWxyZAnn/oCT4iH49G2DEAftIFEL8MHx8jKSutCjWyR55sSa0sl8
         809EP1lSGT7E6nZfA6czFZ2sQkCPOO31x6hdKDDgtWgAsyNcmYzZ23QKBA6oA1e0Df8j
         mff4YEK1txMQH5zdEWm9Ft43JVlXytFDCJrzcVkoRxVgCvqOmj62IqrjEymzKvI2aEz8
         Q+PlITpFE0ZrapN03fyNn/sYPjku3zpn8ZNoXY7mpZZiBP1l2SY/BBOGIFJwADyeUYaO
         byX3UxEbLklO7tf7Q7ExcM6jxeIMQ4jvID0h1YrotfQC67+IRrrEzYldfq3nM7G2X1eQ
         0UYg==
X-Gm-Message-State: AOJu0Yz77KAwjWoPfCMfABDAr93I4ZpK8fG9W1OjxG1HOD2S62vdBknR
	sZLIAiTWmLfnj0ug8ZkgjieqJhRYao2eQb60h0hKm45pL2usLHH/bYEx
X-Gm-Gg: AeBDievJvF0cV55j4MDoIWEZuBKL0T1h78WZtyWebhpgs5v1Vs1JxEKrCLtgTI7SQo+
	r652SRSO9kbNHaHcCvOcCmVX7xPVaNGUQHuFXHVla3+UHaU+qj8ty/wwjqzyAnQ8KhYZdNfbL7E
	D4aRVhWgxm206cfi8XoeRFTR90HiwrJRObR/a2NBNYNbuUEgz7VQ767hQ2cTZnk3PbadHkmWA3R
	5t0aZZapARSoTVBCTt5bWuUiprHfPD4+mGrgrSmFC+7uc8f2e/cho4tH52lDbryj5KMHLejTunw
	4jE6nr5/nrFWHK0HBfie7TmbccMC42ocYeDL/aQa+diISju/apMGX+NX1v41ZYIKGvu1IP+luEt
	5K3CC7Z3JNAXYrtEDxRZ9ud60zDrh1WdKZaaKd2xTA0/qA/m7xvKRjyBDNFHXOhu0S9mi8gkDqb
	8KczAWPOQMtpfSrCS+Vy1CMUV1KkybhMH8IX6okOpy8xOnAhALTxZh1tY8N4sqbRRwCKcH8eqZu
	wvYpmBzxBnnfr3bCaEgArn2ijTqY0SYcAe0Y8iArtrrAvTJrtZ+6ziLwxlpzU9s+SDJj0OIpHpX
	LGq9Hkd1KYRb/n1mTS4agVEx2my2WGCkbiNLalCEydMfikZVA9vvTQ==
X-Received: by 2002:a05:600c:a10d:b0:489:1abb:5559 with SMTP id 5b1f17b1804b1-48a7bf9956fmr42135605e9.5.1777478022928;
        Wed, 29 Apr 2026 08:53:42 -0700 (PDT)
Received: from mail.gmail.com (2a01cb0889497e00fb2d91b6f941d667.ipv6.abo.wanadoo.fr. [2a01:cb08:8949:7e00:fb2d:91b6:f941:d667])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a824f9f0dsm383695e9.15.2026.04.29.08.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:53:42 -0700 (PDT)
Date: Wed, 29 Apr 2026 17:53:40 +0200
From: Paul Chaignon <paul.chaignon@gmail.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: sashiko@lists.linux.dev, bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next 1/2] bpf: Print breakdown of insns processed by
 subprogs
Message-ID: <afIphKy2138OC5GR@mail.gmail.com>
References: <5c3514dbc879f22ba3f9eff8a2c730e13bd0572c.1777388107.git.paul.chaignon@gmail.com>
 <20260428230844.EFA64C2BCAF@smtp.kernel.org>
 <DI56ZVH6HKDK.1L8J5HPA37J09@gmail.com>
 <DI578ZDDKR6K.QH52KXPV1CLN@gmail.com>
 <afIPMllq5VI-bJLY@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afIPMllq5VI-bJLY@mail.gmail.com>

On Wed, Apr 29, 2026 at 04:01:25PM +0200, Paul Chaignon wrote:
> On Wed, Apr 29, 2026 at 02:07:33AM +0200, Kumar Kartikeya Dwivedi wrote:
> > On Wed Apr 29, 2026 at 1:55 AM CEST, Kumar Kartikeya Dwivedi wrote:
> > > On Wed Apr 29, 2026 at 1:08 AM CEST, sashiko-bot wrote:
> > >> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > >> - [High] Out-of-bounds read in `bpf_subprog_is_global()` when printing verification stats for programs with hidden subprograms.
> > >> --
> > >>
> > >> commit 08128f883e58301e0f97b1d4a94656be63b8f790
> > >> Author: Paul Chaignon <paul.chaignon@gmail.com>
> > >>
> > >> bpf: Print breakdown of insns processed by subprogs
> > >>
> > >> This patch tracks the number of instructions processed by each global
> > >> function (subprog) during BPF verification. It then reports this
> > >> breakdown in the verifier logs under BPF_LOG_STATS.
> > >>
> > >>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > >>> index 03f9e16c2abe..b48389b48eb6 100644
> > >>> --- a/kernel/bpf/verifier.c
> > >>> +++ b/kernel/bpf/verifier.c
> > >>
> > >> [ ... ]
> > >>
> > >>> @@ -18288,6 +18295,13 @@ static void print_verification_stats(struct bpf_verifier_env *env)
> > >>>  				verbose(env, "+");
> > >>>  		}
> > >>>  		verbose(env, "\n");
> > >>> +		verbose(env, "insns processed %d", env->subprog_info[0].insn_processed);
> > >>> +		for (i = 1; i < env->subprog_cnt; i++) {
> > >>> +			if (!bpf_subprog_is_global(env, i))
> > >>
> > >> Could this introduce a regression due to an out-of-bounds read on the
> > >> func_info_aux array if there are hidden subprograms?
> > >>
> > >> At load time, if BTF is present, env->prog->aux->func_info_aux is allocated
> > >> with exactly func_info_cnt elements, and env->subprog_cnt initially matches
> > >> func_info_cnt.
> > >>
> > >> During verification, if a feature like bpf_throw is used without an explicit
> > >> callback, add_hidden_subprog() is called which increments env->subprog_cnt
> > >> but does not resize the func_info_aux array.
> > >>
> > >> Since this loop iterates up to the updated env->subprog_cnt, when i reaches
> > >> the index of a hidden subprogram, bpf_subprog_is_global() will access
> > >> aux[i].linkage where i >= func_info_cnt:
> > >>
> > >> kernel/bpf/verifier.c:bpf_subprog_is_global() {
> > >> 	struct bpf_func_info_aux *aux = env->prog->aux->func_info_aux;
> > >>
> > >> 	return aux && aux[subprog].linkage == BTF_FUNC_GLOBAL;
> > >> }
> > >>
> > >> Is it possible to skip hidden subprograms here, or limit the check to
> > >> func_info_cnt?
> > >
> > > Don't see it happening, since hidden subprogs never get verified, so we won't
> > > invoke bpf_subprog_is_global() with such a subprog index.
> > 
> > Ah, no, stupid me. We get here after fixing up and adding the hidden subprog. So
> > we can still do OOB since subprog_cnt includes the hidden_subprog_cnt. How about
> > the following as a fix? I checked over other places where we iterate over all of
> > the subprogs and those look fine, so instead of changing bpf_subprog_is_global()
> > we can adjust this function to only consider real subprogs. Didn't compile test.
> 
> That's a nice find! I also doubted it initially as we have that pattern
> everywhere.
> 
> It looks like this would be a fix for commit 335d1c5b5452 ("bpf:
> Implement support for adding hidden subprogs") (or technically, the next
> commit as 335d1c5b5452 didn't have any user). So maybe I can resend as a
> first patch (with you as a co-author) and the following diff (took the
> opportunity to simplify the logic on the assumption that we always have
> the main "subprog").

Just saw that subprog_info is statically allocated (contrary to
func_info_aux) so we wouldn't get an OOB on the existing code, just
some garbage "+0" on the stack depths.

> 
> Not sure if it would need to be sent to bpf instead of bpf-next. Maybe
> keep the patchset on bpf-next, but add "Cc: stable@vger.kernel.org"?

[...]

