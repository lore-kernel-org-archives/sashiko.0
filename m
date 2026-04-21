Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD9635DA4A
	for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 08:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776761820; cv=none; b=aUOSshjmRQ+flt4VI+BWFpwwKNhiDAAnOTrtJr1X6VqJPMbcfXb/II++urd/s0N66VgiUV3WyZBRJZss9L5WqPKZuB0KA6R5mssDJcxfcb6WVba3drWEnXkxc/DKgOBJznZwZEYWbvm0KCtjR+sDyUTRfl6oCY/TQQaeP9VHzG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776761820; c=relaxed/simple;
	bh=CIZL7UDOzIHx4kBy3bG1HxhhYIu6lC6fwaUSbwlvVis=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ESewEMpFM9Dzxyz4GWgYCJsRxfUEc4eYUNwfmSiJkMfk1AVQJSsO6UV73U6J8DeP6uzL4Yvd5FEPgolB7KYJLgfgRPQayYMlWkOy7M7Pv3Dv2zZ82cdUKG6xRXEk4bjAGtabNQtEUy/ac3epRiYGOOebAyjpGJimZ81Vb664+Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cO0RGdwF; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cO0RGdwF"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso17831675e9.2
        for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 01:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776761817; x=1777366617; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PogW4mupQvvo8UZj9OhLW51Gud2lL2Fw5bDCoh6om3g=;
        b=cO0RGdwFGGyIxT/PpLXoCaXAK0e6/W0lfTKej0ZUTPQm2wWO+VOh0tYBgQlf78tX7P
         0diw2oyOPZDOdKPR+U3oaM3cUD4kffsYThR7R3qh1O4AiR9evtwBu+m+Hn6CWypIgREq
         9DEDAN/Lz6wiytY+qkmgilIbRCJA3bzDeKPVZ0AtmmqTXMoHAYJe7A+vgi1uQm5oHuVE
         JJMxtTzKrMCjYkQLtXgxp3NCR7IilLKOTSKlxkZxKqv6Rb8ZOJCMOT8imq+0d7GT3f6Q
         AOzvOhbXUITE1D6gn3rKW+9P54noMZ/PYO6Px99FsZ583BC2geYTP6H1/zxCPgp+AykY
         a+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776761817; x=1777366617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PogW4mupQvvo8UZj9OhLW51Gud2lL2Fw5bDCoh6om3g=;
        b=UftSAw6wkrm/cwJC1wuxPjCCe3LdWoAVXeYXgkACf3q0mtSHjSRbSu7sAQpEDUi865
         C/GSeWuG6azqO6lYmZpDq3e8cTtPzbT4E0Pp3jDGB29NsBNQc/1zXGefOoq/ygPTlz0t
         QKV7Eg92feoIHRynhbvfVnkE5czcWZFiV4zudpJPXR5o6vPW7zHJiht3skrkTPmmge9G
         POKAV2CFFFNk9juqar9mx8eOom77uRax2h2pDKoQ2m/6qgGQiOezhuw8mo97Bzj9B8Ie
         LiiEcbq/5LhXEJ2KCqG3p6VK2nzTY2Wo+ZQR9InUEgldXFwdquwlB+cT9kj4YHk3xuGV
         RioQ==
X-Gm-Message-State: AOJu0YwefNzFWLrQmbzD1PXyqAcFXv0CjdEGCADczO1AwbLQb2AkIMGs
	pAR681oH7mAU4RUGLIez/qkDZtEWngY93csxO7Zczg5168HB25sCXLglVSLR6I5T
X-Gm-Gg: AeBDievwuLZQD3Ef6/co6aD8uzLFWth1h7nheZfruOIaFWdcg+e3B+fjUaM7ga3wdrC
	QZC/g75oxpfqpO7m1IWnHNIt+ibfAQcknCUYqLjy1ZIvZUKhf3vqVwGuQ7qBLkSodIEyWPkY/e1
	+XDjlni+F11vK4FhY3vasqfufQoJ1ONEI0lIxc8bZpjTwu2cRcdDILN5gbJ02uEQM1x09oe/j+I
	QUjYuuUUF9wq1cEZunlA5oX7HC4Aa8QGIpu81kKvPzJ7RznrMHrRtq+ELK/udy+TG3lfCvWv12s
	+EPArgxi9+njl3/zOYpXkyAzU4qzXEFyxBrqr9Te9tI7u5aaUAqBr4imP+XA3xFTXHzHj9GGMVZ
	eJzKUvNrsGfQ95Nc4/46Bc749wngmV1Vg5AYCHPt/2h0PCSsLCAmr7vBbAaPvYBnKMWiRdW5Ix7
	MYgbZ6/0Q=
X-Received: by 2002:a05:600c:890b:b0:488:a977:8d6 with SMTP id 5b1f17b1804b1-488fb775a35mr171422315e9.19.1776761817133;
        Tue, 21 Apr 2026 01:56:57 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200::d99c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f82bbsm584707825e9.3.2026.04.21.01.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 01:56:56 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 21 Apr 2026 10:56:55 +0200
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv5 bpf-next 19/28] libbpf: Add btf_type_is_traceable_func
 function
Message-ID: <aec71yEZE8KF19Xz@krava>
References: <20260417192502.194548-20-jolsa@kernel.org>
 <20260418034049.4F212C19424@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418034049.4F212C19424@smtp.kernel.org>

On Sat, Apr 18, 2026 at 03:40:48AM +0000, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 3 potential issue(s):
> - [High] Unsafe BTF type resolution in `btf_type_is_traceable_func` lacks validation and bounds checking, leading to out-of-bounds read and segfault.
> - [Medium] `btf_get_type_size` hardcodes `sizeof(void *)` for pointer sizes, breaking cross-architecture analysis.
> - [Medium] Missing maximum resolution depth in type modifier loop allows Denial of Service via infinite loop.
> --
> 
> commit 70d9630993310d9569ee7d038356f4a4ec3a18e9
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> libbpf: Add btf_type_is_traceable_func function
> 
> Adds the btf_type_is_traceable_func function to perform checks on functions
> to prevent attachment on some functions. Exports it via libbpf_internal.h
> for use by benchmark tests.
> 
> > diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> > index 3a80a018fc7d5..65a9ac10053d5 100644
> > --- a/tools/lib/bpf/libbpf.c
> > +++ b/tools/lib/bpf/libbpf.c
> 
> [ ... ]
> 
> > @@ -12425,6 +12425,80 @@ static int attach_uprobe_multi(const struct bpf_program *prog, long cookie, stru
> >  	return ret;
> >  }
> >  
> > +#define MAX_BPF_FUNC_ARGS 12
> > +
> > +static bool btf_type_is_modifier(const struct btf_type *t)
> > +{
> > +	switch (BTF_INFO_KIND(t->info)) {
> > +	case BTF_KIND_TYPEDEF:
> > +	case BTF_KIND_VOLATILE:
> > +	case BTF_KIND_CONST:
> > +	case BTF_KIND_RESTRICT:
> > +	case BTF_KIND_TYPE_TAG:
> > +		return true;
> > +	default:
> > +		return false;
> > +	}
> > +}
> > +
> > +static int btf_get_type_size(const struct btf *btf, __u32 type_id,
> > +			     const struct btf_type **ret_type)
> > +{
> > +	const struct btf_type *t;
> > +
> > +	*ret_type = btf__type_by_id(btf, 0);
> > +	if (!type_id)
> > +		return 0;
> > +	t = btf__type_by_id(btf, type_id);
> > +	while (t && btf_type_is_modifier(t))
> > +		t = btf__type_by_id(btf, t->type);
> 
> Does this loop need a maximum resolution depth limit?
> 
> If a malformed BTF object contains a circular modifier reference (e.g.,
> typedef A -> const B -> typedef A), could this loop spin infinitely and
> cause a hang?

I will add that, something like in btf__resolve_type

> 
> > +	if (!t)
> > +		return -EINVAL;
> > +	*ret_type = t;
> > +	if (btf_is_ptr(t))
> > +		return sizeof(void *);
> 
> Does this correctly calculate the pointer size for cross-architecture
> analysis?
> 
> Since libbpf is a user-space library that may process BTF blobs from
> different architectures (like a 64-bit tool processing a 32-bit BPF
> object), will hardcoding sizeof(void *) return the host's pointer size
> instead of the target's pointer size?
> 
> Would using btf__pointer_size(btf) be more appropriate here?

yep, will change

> 
> > +	if (btf_is_int(t) || btf_is_any_enum(t) || btf_is_struct(t) || btf_is_union(t))
> > +		return t->size;
> > +	return -EINVAL;
> > +}
> > +
> > +bool btf_type_is_traceable_func(const struct btf *btf, const struct btf_type *t)
> > +{
> > +	const struct btf_param *args;
> > +	const struct btf_type *proto;
> > +	__u32 i, nargs;
> > +	int ret;
> > +
> > +	proto = btf_type_by_id(btf, t->type);
> 
> Could this cause an out-of-bounds read if t is not a function type?
> 
> Because the type and size fields share a union in struct btf_type, passing
> a type like BTF_KIND_STRUCT causes its size to be misinterpreted as a type
> ID. The internal btf_type_by_id() helper skips bounds checking.
> 
> If the interpreted ID exceeds the BTF type array bounds, it might read past
> the end of the array and return a garbage pointer, which would then be
> dereferenced in the next line.
> 
> Should this verify !btf_is_func(t) first, and use the bounds-checked public
> API btf__type_by_id() along with a NULL check for proto?

will add the check

jirka
