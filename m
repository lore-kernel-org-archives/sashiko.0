Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D666833B969
	for <sashiko@lists.linux.dev>; Tue, 15 Sep 2026 21:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789509000; cv=none; b=e7z7WlknM0uAsD74KO6/HJIabHFH/MVU0Z6E/lIGTnUl1eGiWM5Jsw/F024TfbxhqUc6KZCALn4OTckHGX+l1QYy3Re5NLjl397wi/fqP7DQKouCerR5hfhbwA0Hxjyp77OotQIrPUWrUFl6xwJCPbmYguHVJrBR7728m3XHztc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789509000; c=relaxed/simple;
	bh=FXyHrzv8I0IWTHKx+CxpXfpt8fulhloZ9HTZhHfHe8U=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ltreKqI9k2bLJ89w621SGYzeuYvnfXvBWVwdHsuM7jgeQcRKv0asoNYnoWzLRu5rlwEeVuNpe2ebxlsyK0jbIhK4tuvwEV35Ej8V3HPjnr3lHc4SUaBSR2XzMV93tWHF2cKj/gZ4zfbrTgKmNcRTuBfP+YVVNF3E0Y98mDm6hC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QXr+4klj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QXr+4klj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E0A1F000FF;
	Tue, 15 Sep 2026 21:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789508999;
	bh=sgW6WsC0hVTyCtJoRnGJvv9q+U8ApD7dLSghbBEQ/w0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=QXr+4klj6sSxo2600Hjid2CHZxCdki2DUaV/5dgXKY50TpHFgCE6pTK+Z4MA9oBje
	 oiVrEXDEL3Yht3znOG7qFSs93Uv6Yb2MUfVk8Z6e8ErYrz5Ax3q6qWc8WmNk9KVmSs
	 zoADPvX8vRgLYjYk6KDHuvlD4kxx1pqbNc5KRAKc=
Date: Tue, 15 Sep 2026 14:49:58 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: sashiko@lists.linux.dev
Cc: Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v4 00/16] Remove PG_private by using page/folio->private
 checks instead
Message-Id: <20260915144958.23000e3a625ecc24f48ee568@linux-foundation.org>
In-Reply-To: <20260913-remove-pg_private-v4-0-848550f7574e@nvidia.com>
References: <20260913-remove-pg_private-v4-0-848550f7574e@nvidia.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hey all,

On Sun, 13 Sep 2026 22:23:58 -0400 Zi Yan <ziy@nvidia.com> wrote:

> Subject: [PATCH v4 00/16] Remove PG_private by using page/folio->private checks instead
> Date: Sun, 13 Sep 2026 22:23:58 -0400
> Sender: owner-linux-mm@kvack.org
> X-Mailer: b4 0.16.0
> 
> Hi all,
> 
> This patchset removes PG_private to make space for upcoming PG_folio for
> identifying pages from a folio (more details in Note below). Instead of
> checking PG_private, all code is changed to check page/folio->private !=
> NULL instead.

Sashiko seems to have done something wrong with this review.

The original thread is at
https://lore.kernel.org/20260913-remove-pg_private-v4-0-848550f7574e@nvidia.com

its title is

	[PATCH v4 00/16] Remove PG_private by using page/folio->private checks instead

its msgid is

	20260913-remove-pg_private-v4-0-848550f7574e@nvidia.com



The relevant Sashiko URL is

	https://sashiko.dev/#/patchset/20260913-remove-pg_private-v4-0-848550f7574e@nvidia.com


That URL shows the email conversation correctly.  But the page's title
and the associated code review refer to a different patchset entirely,
"[PATCH 1/3] md: Use folio_alloc_buffers()".


I used the search box for "Remove PG_private by using
page/folio->private checks instead" and got the same result.


a) something odd happened!

b) is there any way of finding the review for "[PATCH v4 00/16]
   Remove PG_private by using page/folio->private checks instead"?


Thanks.
