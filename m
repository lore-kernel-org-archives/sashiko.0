Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9751E376C
	for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 00:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776733006; cv=none; b=pSVay3NrAidafyP8UzcLmgR+eFqgkpIcps+elWGxBcpaktrCeE/bsNjBAxll4wfx4i+/QcS0ZJv/HUYTnUAtXkvcM2R9kbfBqC/pQT8b4+hww+b7VYl2998k8gkQcHiWfkzwAnOPj6NC6WFB6uftWuD82LyCQ3yAH5/xn8SPlJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776733006; c=relaxed/simple;
	bh=obDJ7GXFA6VzJ+fm4W1f14hJmVMYDRwil7YSo6pV7zQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FJMDj+pPj0zL6YTbkAMKmrc2+vee2AO0/DVF1cuGgEQ7UioC9TMXznqqqGYGCzwGM1UR5BV4PWOwhmP4IZVoH72rCtCXe3jQSDrTniiHmGDoZBMuEgpxMIXOvuFjNmDeIE3kTZixCNEKuKApKyrGMPjr/YVsMRiSucfJOSfbDh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=C/fpspN+; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="C/fpspN+"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776733000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=obDJ7GXFA6VzJ+fm4W1f14hJmVMYDRwil7YSo6pV7zQ=;
	b=C/fpspN+Xltgs2pC5OrnpMY1h7rQ+29tZtiWWQ8jT2QeChTzJpihTWi91iCDuCkz03QkJ9
	ZvPgB86HnYB0hLRuz1y49H/AGN/QVFb31PRAKYmmqnQJlHShaV8vkooKDgi+szT/oKvznc
	w6GWHhTf2wSxnSPIoco+b4ActNENfJo=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Tejun Heo <tj@kernel.org>,  Johannes Weiner <hannes@cmpxchg.org>,
  "sashiko@lists.linux.dev" <sashiko@lists.linux.dev>
Subject: Re: Delivering reviews over email
In-Reply-To: <z4eztn7epx6kghtm3nyoiexhnbxxc755f5vvh73gtir3nra6yl@etqgkhrpx6r5>
	("Michal =?utf-8?Q?Koutn=C3=BD=22's?= message of "Mon, 20 Apr 2026 18:51:43
 +0200")
References: <7ia45x5tuj88.fsf@castle.c.googlers.com>
	<z4eztn7epx6kghtm3nyoiexhnbxxc755f5vvh73gtir3nra6yl@etqgkhrpx6r5>
Date: Tue, 21 Apr 2026 00:56:16 +0000
Message-ID: <7ia4v7dl168f.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

Michal Koutn=C3=BD <mkoutny@suse.com> writes:

> On Wed, Apr 15, 2026 at 01:04:39AM +0000, Roman Gushchin <roman.gushchin@=
linux.dev> wrote:
>> Sashiko is now able to send reviews over email.
>
> Great job! E-mail interface is something I've been looking forward to.
>
>> If you're interested in your subsystem to get email reviews,
>> please, write into this mailing list or me directly or send a PR changing
>> this file:
>> https://github.com/sashiko-dev/sashiko/blob/main/sashiko.dev/email_polic=
y.toml
>
> Roman, IIUC, this considers maintainers as all non-ML addresses that are
> CC'd in the original posting?

Yep, really not the best name was chosen, I'm renaming it.

For now I just listed you guys explicitly:
https://github.com/sashiko-dev/sashiko/commit/a9dfe0d103b2ea0e47d3efff56c40=
c563dc10108

I hope this works.

Thanks!
