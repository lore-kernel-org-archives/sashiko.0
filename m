Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5264F5DFE
	for <sashiko@lists.linux.dev>; Mon, 12 Oct 2026 21:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791840342; cv=none; b=HeQKN8VDP9wPac8Zda2bbvH9XGcfiaOFRofjvbVzQ68seyU7GC62C3mIYT/jpZor3+9fgirL7tQGGyFlITl/pXvVmDxCAkM9lAKH8v8Z58z4RDONgHVpxiRjldANcsnDab9e2hlMkJMS+qMrdPHx0E2TS4FDrti0Eh8uCiEHXTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791840342; c=relaxed/simple;
	bh=rpG3DVNaEcNWTmulWXK7ax9cGI4LhrIAB199pRHGM7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UvZ7aPaj/2+2p6uUohFOO4hwzfKzPTxuFrxyBNuJneRsLZFOq5U1ji1umcG+ceT7nsqYVYrsOAZW48jYUCePWnGrEm/qOQnosNEHInvUNEyjOKceCRrYf/D95jMVgTcExn5erBNAMbJbA0RU8fraiWfZfunG3G5kFHnYkhd4vms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0BKwf87; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0BKwf87"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3211F008A1;
	Mon, 12 Oct 2026 21:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791840340;
	bh=YnJpGrdSP7Bo2GjHc8lZi6uTElL84ccejCOyPUo8MFM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=S0BKwf87MT0DUVpqQzUcYh5nHiJo9YdlX8QXk9V1n+4JLFl96IYUxc0vYhbn4lhhP
	 RyPN20MzgWHyPWMKv9dZxxjLAMLyIygk50pA4RIGKySoTrsM0+jgyRryEAan0qBuzA
	 e3HMlYEDwZeCfmbt7hz0kjNvuI336TxB4RVv6YZtCwPA8FbrOT+CMAJ+e4Tnjv1VbU
	 ihAqU1avWj6UMKcmpBRPC8qR2Qw6/u4MvMgMY/P3n6iNwHSzOIEw0I4SsIg9m7c6/J
	 rVbhFaO206t1Gk3WCrgI6K3/tvNifHsgiT7w9NZWHWC8LYL7yztfwQcssCedl20G3W
	 d2UIcGXJnxn+w==
From: SJ Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SJ Park <sj@kernel.org>,
	sashiko@lists.linux.dev
Subject: Re: email handling
Date: Mon, 12 Oct 2026 14:25:33 -0700
Message-ID: <20261012212533.374891-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261010150629.0c00e0a4282eac9aa247cca3@linux-foundation.org>
References: 
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andrew,

On Sat, 10 Oct 2026 15:06:29 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:

> 
> Concerning this email:
> 	https://lore.kernel.org/20261009-b4-mmap-prepare-vma-flag-sanify-v5-16-923b70125b1e@kernel.org
> 
> I discovered that some lucky duckies were receiving Sashiko emails:

Apparently that's because the patch is Cc-ing a few mailing lists that are
configured [1] to receive the review mails.  For example, the patch is Cc-ing
s390@ mailing list, and it is configured [2] to send the review email to the
author of the patch, the mailing list, and a few more people including Heiko.
To quote the config [2],

    ["linux-s390@vger.kernel.org"]
    reply_to = ["author", "list"]
    positive_review = "all"
    cc = ["Heiko Carstens <hca@linux.ibm.com>", "Vasily Gorbik <gor@linux.ibm.com>", "Alexander Gordeev <agordeev@linux.ibm.com>", "Christian Borntraeger <borntraeger@linux.ibm.com>"]

> 
> Subject: Re: [PATCH v5 16/38] mm/vma: add and use
>  vma_[flags]_is_fixed_mapping
> Reply-To: sashiko-reviews@lists.linux.dev
> To: =?utf-8?b?TG9yZW56byBTdG9ha2VzIChBUk0p?= <ljs@kernel.org>
> Cc: linux-trace-kernel@vger.kernel.org, kvmarm@lists.linux.dev, "Vasily
>  Gorbik" <gor@linux.ibm.com>, "Oliver Upton" <oupton@kernel.org>, "Heiko
>  Carstens" <hca@linux.ibm.com>, linux-perf-users@vger.kernel.org, "Marc
>  Zyngier" <maz@kernel.org>, "Alexander Gordeev" <agordeev@linux.ibm.com>, linux-scsi@vger.kernel.org, selinux@vger.kernel.org, "Christian
>  Borntraeger" <borntraeger@linux.ibm.com>, bpf@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, kvm@vger.kernel.org, linux-s390@vger.kernel.org, linux-usb@vger.kernel.org
> In-Reply-To: <20261009-b4-mmap-prepare-vma-flag-sanify-v5-16-923b70125b1e@kernel.org>
> References: <20261009-b4-mmap-prepare-vma-flag-sanify-v5-0-923b70125b1e@kernel.org>
>  <20261009-b4-mmap-prepare-vma-flag-sanify-v5-16-923b70125b1e@kernel.org>
> 
> 
> 
> But I did not.  How come?  I was on the To: line so why were certain
> people emailed but not me?

I think that's because you are not on the configuration.

> 
> I'd prefer to receive such replies.

Maybe you could add below change to get replies for mm patches?

    diff --git a/projects/linux/mailing_lists.toml b/projects/linux/mailing_lists.toml
    index e41f1aa..330d1d8 100644
    --- a/projects/linux/mailing_lists.toml
    +++ b/projects/linux/mailing_lists.toml
    @@ -313,3 +313,6 @@ reply_to = ["author", "list", "recipients"]

     ["fsverity@lists.linux.dev"]
     reply_to = ["author", "list", "recipients"]
    +
    +["linux-mm@kvack.org"]
    +cc = ["akpm@linux-foundation.org"]

My understanding of Sashiko is quite limited, though.  Please correct me if I'm
wrong, Sashiko team.

[1] https://github.com/sashiko-dev/sashiko/blob/main/projects/linux/mailing_lists.toml
[2] https://github.com/sashiko-dev/sashiko/blob/main/projects/linux/mailing_lists.toml#L246


Thanks,
SJ

[...]
