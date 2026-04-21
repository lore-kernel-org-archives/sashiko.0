Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C74A3A0EB1
	for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 08:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776761835; cv=none; b=fISowJdO9xSpN3QEI5HWuqPhL16bmhoS4dyWBHXGvFww9ZwOeHWUjvCL++zfpZHkVHu4xv6/ttxnXwyPzEwzbiOEwLE0e5S224P9ZAz05t+8XA+VGLw7WGKu9sfL8CCIXlPnroAaWxTnsfNCqyZ87adOfcihkTIaYEUu63Axx3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776761835; c=relaxed/simple;
	bh=eTLzMI7yWfeA7FpJW6pduFsu39gZsW1lezkyNZLf2Tg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOAHPlQ4Rf+eXDG9wODoOXOE9MI6ZiEf+VzYanMSZqBhFTKofa5ULFcdW1oFphr3IZD181GW2R1rYGj9XXy7S70S/UHRr2Wzm3YAkAkQX/rU1ShpCRY65SQO9C/iRN6PmI1Sa37AEc6CcO33iAHPgFuVP3a+aFVoKAHkJxtTZSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRH2GLOZ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRH2GLOZ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43fea39e066so3005265f8f.1
        for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 01:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776761833; x=1777366633; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3MXLb7hix0ehudvrz1Mhjelpsv8ZbBwlfk6T0/b/pdk=;
        b=JRH2GLOZTewJy9jZwTIH8QxEPPg7Gqi5xLGDeLGshuPQd9h85iTFBiNebao1SQgUEI
         yBdLECs+0bQp7s8au7dhcXzjaLfjBLuosaI1mPzOQPeACEo1pS6W4Yq01n06bSuAjC4X
         rBXUrEGH9L2CmJYFZYK3FRtZqEOJLc0CLDtT5SowPxzmUQ5zByhH+k3bizTEmOmEZ/AJ
         ysaAMoFGFdrlgSay1w9ixP8wumFVj85bAgJbyZD8rhplgZTepAUPV4jiHYyd+Np9rNxb
         gCW/hXRC1Yqbfg2Klz9zmuKJfh00X0qpi3gr+76cFYYeAwK124Q84RVV8bkA8dDi44X2
         OWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776761833; x=1777366633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3MXLb7hix0ehudvrz1Mhjelpsv8ZbBwlfk6T0/b/pdk=;
        b=j2K+sk+c+5ru7Th2IrXeh7NOnIZxS22mCnwcaS1vUFInxTEjaCqwm3i1ZSU3+sTO3Z
         sZwpOtU0ey2pGI0a1yckcl3MRLpWmxGdlOIRfCqo5IQm+ncSclJ9MpEtjYmI6cbc8rEx
         KYV9kjgt/nZnP7m7SqOe5L3NX9YxBnHk/WkZ4+/daTeNo1x74gMQiGNkmbdn8ZH7X+/B
         vxrcs9YOE25VfSAYeDBfD6Fs/40iPHZrrDo0IelsMn8BNmtGm1gWNDzPfRbD+Kx7NXYM
         cKdhn4lh0E4yrrM605X6EPyXl2S5y1wOe2D3ZOOLi1JD036nzWFeVeAODxD1PSVrXSSe
         ytjw==
X-Gm-Message-State: AOJu0YypmEWViYJojtVjmSH9RAWzW+G3upzorCbyFZGP3rLtdIgjLsp6
	Hm8K+dQsqizzk2ZfUJJTiz0OCxNbVVI9SM6UhjrPs/mCrxJ0mZDmqQqlrQ8Vg2TQ
X-Gm-Gg: AeBDiesYVhr3DQxeIzXA3gFlNqtUxRnVLXCCQRsc8cb7HpTtmwxPBaJ6WUXixMhiGnS
	j0jznFjDgBmxiEYp+WiEWzhO5SZ6PXbmlUHsaMMN3ZTmZFJisia+G4kK5DgqEhWRDWeT5o3PnsO
	C/8idBLeIK5tloQcUockiTVEzufanOmT6E/9kf+OL6K9O9nYHRtHaEW7yigM0Joe3c1u2Bqy4H/
	vD0sxE0ljOH0+7l6BIcLL0SqAZ8VoVwK7bd/p4nXpRO8qb68f+Hh3LZD9v61e+VU8X5uUNchdt4
	XyVdwfyxeQmwHnLt60sdaWes10uSfDKDCgt1losa+bLJohGLiOsb7oVpbleUs9pd1zwRLAXglOk
	nVj+5sID9MptGWwx9oNLbERSHNwIMg/erKt29twjpB5ds5xQZ8MwQIeHB/RQnM+5XeNvS3PIWRf
	12W+D6JZ0=
X-Received: by 2002:a05:6000:401f:b0:441:1e8e:d8f7 with SMTP id ffacd0b85a97d-4411e8ed9bamr3596913f8f.29.1776761832542;
        Tue, 21 Apr 2026 01:57:12 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200::d99c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a166sm34965481f8f.19.2026.04.21.01.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 01:57:12 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 21 Apr 2026 10:57:10 +0200
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv5 bpf-next 21/28] selftests/bpf: Add tracing multi
 skel/pattern/ids attach tests
Message-ID: <aec75votcgmzrWI8@krava>
References: <20260417192502.194548-22-jolsa@kernel.org>
 <20260418033438.03847C19424@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418033438.03847C19424@smtp.kernel.org>

On Sat, Apr 18, 2026 at 03:34:37AM +0000, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 2 potential issue(s):
> - [Medium] Double free of `vmlinux_btf` in the error path of `get_ids()`.
> - [Medium] Missing error state assignment in `get_ids()` leads to returning a partially or fully zero-initialized array instead of failing.
> --
> 
> commit 44b619347c03e0f87cfb994ba8b14346b293edcc
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> selftests/bpf: Add tracing multi skel/pattern/ids attach tests
> 
> Adding tests for tracing_multi link attachment via all possible
> libbpf apis - skeleton, function pattern and btf ids.
> 
> > diff --git a/tools/testing/selftests/bpf/prog_tests/tracing_multi.c b/tools/testing/selftests/bpf/prog_tests/tracing_multi.c
> > new file mode 100644
> > index 0000000000000..52d3339b430a5
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/prog_tests/tracing_multi.c
> 
> [ ... ]
> 
> > +static __u32 *get_ids(const char * const funcs[], int funcs_cnt, const char *mod)
> > +{
> > +	struct btf *btf, *vmlinux_btf = NULL;
> > +	__u32 nr, type_id, cnt = 0;
> > +	void *root = NULL;
> > +	__u32 *ids = NULL;
> > +	int i, err = 0;
> > +
> > +	btf = btf__load_vmlinux_btf();
> > +	if (!ASSERT_OK_PTR(btf, "btf__load_vmlinux_btf"))
> > +		return NULL;
> > +
> > +	if (mod) {
> > +		vmlinux_btf = btf;
> > +		btf = btf__load_module_btf(mod, vmlinux_btf);
> > +		if (!ASSERT_OK_PTR(btf, "btf__load_module_btf")) {
> > +			btf__free(vmlinux_btf);
> > +			goto out;
> 
> Can this result in a double free of vmlinux_btf? If btf__load_module_btf()
> fails, we call btf__free(vmlinux_btf) here, and then goto out, where
> btf__free(vmlinux_btf) is called again.

replied for this one in other email

> 
> > +		}
> > +	}
> > +
> > +	ids = calloc(funcs_cnt, sizeof(ids[0]));
> > +	if (!ids)
> > +		goto out;
> > +
> > +	/*
> > +	 * We sort function names by name and search them
> > +	 * below for each function.
> > +	 */
> > +	for (i = 0; i < funcs_cnt; i++) {
> > +		if (!tsearch(&funcs[i], &root, compare)) {
> > +			ASSERT_FAIL("tsearch failed");
> > +			goto out;
> 
> Does this code return an invalid array if tsearch() fails? When tsearch()
> fails, we jump to out, but err is still 0. Because err is 0, the cleanup
> block below won't free ids and will instead return the partially or fully
> zero-initialized array.
> 
> Also, if the BTF type loop that follows this completes without finding all
> expected functions (cnt < funcs_cnt), err also remains 0.
> 
> Should err be set to a non-zero value before the goto and when
> cnt < funcs_cnt?

yep, I need to set err properly

jirka
