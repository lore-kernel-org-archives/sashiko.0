Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF5F39BFF2
	for <sashiko@lists.linux.dev>; Thu, 30 Apr 2026 07:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533780; cv=none; b=n7yKpJ5rMf9roc63uhbVh+LNj0FYrOEWtEJ5p0V4BVzDyNtKMbCCud+jvUZfGzaVIAuNKjLp3jtK5If0UfU/0eSRg0XcyGKUshz4gmPkyxi/C7LNzED+sQHCbp3IGw1rW+bu/MDjAM81JpEFAx+UIgoBr4ORadT7kk90sKfDdl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533780; c=relaxed/simple;
	bh=+IWkKAkXV84a6l7FgFmgeCWP8H8DV7Tk1DD5krGrjgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kd1vqd3QsHtaL4DefIofGZS8xRU6vMd8NphKJhBlY8FXT//OCT+8Xry98Hi1aDfS+RHe2lu32yWOKL4JmuXQImbRMPbETaXVTORO3uOfObeDgcTGkbqQPwjUR2VeTiSl5MlP8a/cAn1OMu6niQtbS4tLfBMEl3xZvO6gYnJkh18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UDnNEV1f; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UDnNEV1f"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b93698bb57aso126254866b.0
        for <sashiko@lists.linux.dev>; Thu, 30 Apr 2026 00:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777533776; x=1778138576; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jSug2YRE1SrykhAI0zwsGiM0QCuGCDO5eNghgh5RXQI=;
        b=UDnNEV1feaaku9H87W7q/tnfK8wPuVsGcMZOdl/61wmooMJkAM7r28iRIejSXGzFO7
         REWmvNA03u2q5Crcdot8bVSyTagils4CZrmdoWTV1LrarQ3x/AuN90eYEiZY6zEz/XWK
         mpvshF6EVu6I/4HXpTJLfQ+Pp5+iPf9CDHFbYasZjxd9E/6940VJXbfBm9x79/x7m1IP
         J2JxyN26ghKQjGRO/xShAA8JPWaMBrIh8FuDePNt/8X/VUyW/uMzLoMNIPf3fUWAOIfA
         U24RCFXBqKbk/XOAZ7oySx0jfrvp6HMT3hxNgC2dwLamQq1hudzj0ROWgJVOsJXNdgzy
         Zj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777533776; x=1778138576;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jSug2YRE1SrykhAI0zwsGiM0QCuGCDO5eNghgh5RXQI=;
        b=Itj0p5pK2cDDJa6qY0rVo9vDSoNVDNW6AdZX1T962Y41YOd/B1uXPCY7l/04JAR5M6
         4NaKHdSwmLtuMEGb7O64WvHr+2t0Z4Da2dKuX0wt9jynWKJjZN/8QqZOBqWBquqIBFBT
         0fOJzU/x6VnVVHwjmSd2SMIxNoi3nfGb2Kl7vaCJEuwBpjJlsP31GEhsV4LqYZ43Tgup
         pd5FjoFR8Hn04VMEA9g8C84AKhT1yxHZhPtPPoe0gp55yNMzHckgOlwuY6POMtKZRRzX
         X2/HEKkwGcuVA9F+9M8gMYXFWWU+RF4Pibe8gSKUDwNXLd2SmvrKU4mdaIqdWfrlSk0c
         KTJg==
X-Gm-Message-State: AOJu0Ywz3m20U4tTyceXER2MxBwKQ+xXAF8kayzuy67HTkcE3eBljc1I
	3H5LgjBFkP55jcVbHTwceAactWM9dwDh9+Q+ObxZT5uzySgoopT1gfqGAgeWlDC3S/yZtqTMuI4
	A8e+W/A==
X-Gm-Gg: AeBDieuxF/XB6Clb9CF7CxQcwPDLJ2e8TFp2kYsOkDHdyf7FI4ID2hxYzppxahES2gv
	8xk1b2HzFEdIe8grdv1EVNsriXkO8FeVi03M15YLxABCwXtUNC5eazVnZrLjzbuGpLCf6yQgIlY
	Nhwhd1G9Oyw0ysCsTbpTli5I8pUmYv1AU1Ikh5+VymemyaV2SwFS8WMH9dmvFomcEb0o+8RegR2
	55bC9MHBTbXcskyqCMpfWIbfRT7mrw2wJW9utNUXvxxfUnD/J5Aav4V2RMOBJVjNtoqmM5pkF3y
	N/lX3BqgaMlvoYv7NPj16xFJsoLRaBCTlo+nBpgWu5c9xPhgZfl8kzXSDKxJ9HVOvUDaGjZOFyF
	Hbgf7QW8FXpHs3lJOMu0VTPLPHRm/eR2RR+2NEasv2zylxln/0GqsthaBLA8AVQNsl71W1sBPFd
	1PTGrD12UuubbmAMrTFqcTrWW168zBxEhMMt3HyhwOWb4+ACzgD9iygOUlfgiGWJrMARfrdQMxg
	ArCT7S1ScLV
X-Received: by 2002:a17:907:9494:b0:ba3:a8ef:67d8 with SMTP id a640c23a62f3a-bbb8891bd41mr65661466b.2.1777533775878;
        Thu, 30 Apr 2026 00:22:55 -0700 (PDT)
Received: from google.com (57.35.34.34.bc.googleusercontent.com. [34.34.35.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb980a6fcbbsm192952466b.3.2026.04.30.00.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:22:55 -0700 (PDT)
Date: Thu, 30 Apr 2026 07:22:51 +0000
From: Matt Bobrowski <mattbobrowski@google.com>
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next] bpf: fix crash in bpf_[set|remove]_dentry_xattr
 for negative dentries
Message-ID: <afMDSyrki9A1TzVK@google.com>
References: <20260429205438.2601592-1-mattbobrowski@google.com>
 <20260429221005.6D1C6C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260429221005.6D1C6C19425@smtp.kernel.org>

On Wed, Apr 29, 2026 at 10:10:00PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Incomplete Fix: Negative dentries still trigger WARN_ON splats in bpf_get_dentry_xattr and _locked variants
> - [High] BPF verifier blindly substitutes locked kfuncs, allowing arbitrary VFS lock bypass
> - [High] Missing VFS parameter sanitization allows out-of-bounds xattr sizes and arbitrary flags
> --
> 
> commit 07ec989f2fe3141fcb87e29833232a3f0591690d
> Author: Matt Bobrowski <mattbobrowski@google.com>
> 
> bpf: fix crash in bpf_[set|remove]_dentry_xattr for negative dentries
> 
> This commit adds a NULL check for the inode in bpf_set_dentry_xattr() and
> bpf_remove_dentry_xattr() to prevent a NULL pointer dereference when a
> negative dentry is passed. If the inode is NULL, the functions now return
> -EINVAL instead of attempting to lock it.
> 
> Closes: https://lore.kernel.org/bpf/1587cbf4-1293-4e25-ad24-c970836a1686@std.uestc.edu.cn/
> 
> > diff --git a/fs/bpf_fs_kfuncs.c b/fs/bpf_fs_kfuncs.c
> > index 9d27be058494..a0d58d5e3022 100644
> > --- a/fs/bpf_fs_kfuncs.c
> > +++ b/fs/bpf_fs_kfuncs.c
> > @@ -289,6 +289,9 @@ __bpf_kfunc int bpf_set_dentry_xattr(struct dentry *dentry, const char *name__st
> >  	struct inode *inode = d_inode(dentry);
> >  	int ret;
> >  
> > +	if (!inode)
> > +		return -EINVAL;
> 
> Are similar checks needed for bpf_get_dentry_xattr() and the _locked variants
> (bpf_set_dentry_xattr_locked() and bpf_remove_dentry_xattr_locked())?
> 
> If a negative dentry is passed to those functions, they will extract a NULL
> inode and pass it to bpf_xattr_write_permission() or
> bpf_xattr_read_permission(), which will trigger a WARN_ON(!inode) splat:
> 
> fs/bpf_fs_kfuncs.c:bpf_set_dentry_xattr_locked() {
> 	...
> 	struct inode *inode = d_inode(dentry);
> 	...
> 	ret = bpf_xattr_write_permission(name__str, inode);
> 	...
> }
> 
> Could a user-controlled BPF program intentionally pass a negative dentry to
> trigger this warning, causing a denial of service on systems with
> panic_on_warn enabled?

Yes, dropping the WARN_ON(!inode) makes sense to me. By definition,
attempting to set an extended attribute on a negative dentry is
considered as an invalid operation, so it should be handled
gracefully.

> > +
> >  	inode_lock(inode);
> >  	ret = bpf_set_dentry_xattr_locked(dentry, name__str, value_p, flags);
> 
> This isn't a regression from this patch, but does the BPF verifier safely
> handle the substitution of these locked kfuncs?
> 
> If a program is attached to an LSM hook that holds an inode lock, the
> verifier unconditionally rewrites calls to bpf_set_dentry_xattr() to
> bpf_set_dentry_xattr_locked(). The verifier doesn't check if the dentry
> argument provided to the kfunc is the specific context argument that the
> VFS already locked.
> 
> Can a BPF program obtain a trusted pointer to an unrelated, unlocked dentry
> and pass it to the kfunc, causing the substituted _locked variant to execute
> __vfs_setxattr() without acquiring the proper VFS locks?

Probably a valid concern and the current approach does seem a little
fragile. This too should be reviewed in further depth separately
though.

> Additionally, do these kfuncs bypass necessary VFS parameter sanitization?
> 
> The standard setxattr system call sanitizes inputs in setxattr_copy(),
> rejecting sizes larger than XATTR_SIZE_MAX and masking flags. Since
> bpf_set_dentry_xattr() and its _locked variant directly invoke __vfs_setxattr(),
> a BPF program can supply arbitrary unvalidated flags and massive values up
> to 4GB.
> 
> Could this bypass lead to huge allocations, integer overflows, or
> out-of-bounds accesses in drivers that assume VFS-enforced bounds?

I believe this is a valid concern and should be addressed separately
in a follow up patch. Thank you for bringing this to our attention.

> >  	inode_unlock(inode);
> >  	return ret;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260429205438.2601592-1-mattbobrowski@google.com?part=1
