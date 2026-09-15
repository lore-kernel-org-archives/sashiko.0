Received: from mta0.migadu.com (out-67.mta0.migadu.com [91.218.175.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661A33909B5
	for <sashiko@lists.linux.dev>; Tue, 15 Sep 2026 23:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789514066; cv=none; b=K8dJLGGU5UqIwxa4n1ZtaOd4ikKe3ap8aGxyyB8fr31RHbavD3x+ImkYmR827z1IJvdto5XU9i9DkEzOQSgtEYPomhCTwyOKgEzQiOA6adI51aBzVr6u6OTarMnCNDtWGVMeRUasu4gMgQmFw6Zjn0c2h2WpUBVGc3fM6BwTrsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789514066; c=relaxed/simple;
	bh=08eMJ8pVfxX7lwFei640u01CcIs9ZXeNnsZ9/99uOK8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=I9DIYl8LJvJr1P+xkdQs+/O5w9IlaWhtDMBSVJksWmFSsE/fC4IUXefekR2XSRnUj/w4cERNgHQ3mMf0mCX/3fFRN3k1KmGE0dTyJD3zQqV2PnhuVGWHIu+rTDbliFGlacxYDUTO2vzKQS+ueXULlBTLwf58UY8YP16vn4+sXVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=csnwv3Dz; arc=none smtp.client-ip=91.218.175.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="csnwv3Dz"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=08eMJ8pVfxX7lwFei640u01CcIs9ZXeNnsZ9/99uOK8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789514060; v=1; x=1790118860;
 b=csnwv3DzJDrFH7sgmwyza3yWpX9Yedm0v00WHtjwwP4vyHMNk5/quFNetUMAGoGektvJ+Tqm
 bArWNw4d8lCxkLfB2k1MHEZ6E+VzhkQK0MRtV7aDFUG1owYIzZWdURcm8DfnrrncAmYfR1nsZey
 zhrP49UKwFkwqxdO0Ukl6Kww=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta10.migadu.com with ESMTPS id 0f5dada24b606ce1;
	Tue, 15 Sep 2026 23:14:10 +0000
X-Mizu-Trace-ID: 0f5dada24b606ce1
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: sashiko@lists.linux.dev,  Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v4 00/16] Remove PG_private by using page/folio->private
 checks instead
In-Reply-To: <20260915144958.23000e3a625ecc24f48ee568@linux-foundation.org>
	(Andrew Morton's message of "Tue, 15 Sep 2026 14:49:58 -0700")
References: <20260913-remove-pg_private-v4-0-848550f7574e@nvidia.com>
	<20260915144958.23000e3a625ecc24f48ee568@linux-foundation.org>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Tue, 15 Sep 2026 23:14:03 +0000
Message-ID: <7ia4mrti6rb8.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Andrew Morton <akpm@linux-foundation.org> writes:

> Hey all,
>
> On Sun, 13 Sep 2026 22:23:58 -0400 Zi Yan <ziy@nvidia.com> wrote:
>
>> Subject: [PATCH v4 00/16] Remove PG_private by using page/folio->private checks instead
>> Date: Sun, 13 Sep 2026 22:23:58 -0400
>> Sender: owner-linux-mm@kvack.org
>> X-Mailer: b4 0.16.0
>> 
>> Hi all,
>> 
>> This patchset removes PG_private to make space for upcoming PG_folio for
>> identifying pages from a folio (more details in Note below). Instead of
>> checking PG_private, all code is changed to check page/folio->private !=
>> NULL instead.
>
> Sashiko seems to have done something wrong with this review.
>
> The original thread is at
> https://lore.kernel.org/20260913-remove-pg_private-v4-0-848550f7574e@nvidia.com
>
> its title is
>
> 	[PATCH v4 00/16] Remove PG_private by using page/folio->private checks instead
>
> its msgid is
>
> 	20260913-remove-pg_private-v4-0-848550f7574e@nvidia.com
>
>
>
> The relevant Sashiko URL is
>
> 	https://sashiko.dev/#/patchset/20260913-remove-pg_private-v4-0-848550f7574e@nvidia.com
>
>
> That URL shows the email conversation correctly.  But the page's title
> and the associated code review refer to a different patchset entirely,
> "[PATCH 1/3] md: Use folio_alloc_buffers()".
>
>
> I used the search box for "Remove PG_private by using
> page/folio->private checks instead" and got the same result.
>
>
> a) something odd happened!

Yep, I'm looking into fixing it.

>
> b) is there any way of finding the review for "[PATCH v4 00/16]
>    Remove PG_private by using page/folio->private checks instead"?

https://sashiko.dev/#/patchset/73521

Thanks
