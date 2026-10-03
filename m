Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FED240611;
	Sat,  3 Oct 2026 17:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791048295; cv=none; b=dwjh5e738fvjHn7psORbUuRXDQqK5y2myOS2NLLJz1l653LNtfZnLEe21d5qaqLF1dbb134w6BmfmEjTZYYh4ovyWUd0flcYI3NgNVPB96TGR9w7YoRRXaK88uknwRMb4MtvIfDMZ3+48FmbfoLWzPdQK14cHCHjr3B/Wu+l5X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791048295; c=relaxed/simple;
	bh=2CpiNL1tIbjlFJpj+Xb83gQmPr51rZjInB4ElHUI/hY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C9iMecwqYC9+saUqpaMcv+FtbxXwS6/naVpwBXNoVmulE3FqvlQGmvwPvkcf0RqU9nQ+P+bQRAR4qPYYdodFQ8RMtxeGRslkyG2evG+L5jk+rSGjehAAw566fQCrTxu9o6qaWgCf5YHf9qC6nafXB73UIJc+O4p46L2oSB10uwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jxYoODlq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jxYoODlq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF91D1F0089B;
	Sat,  3 Oct 2026 17:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791048293;
	bh=PAzv7PHyp8UxjRGV/2tJqhRAiLwB4KYhmxoCUdrojw0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jxYoODlqurwA/l5IaR48ajglq+k+YjcabFaoWGf9d8sg8TBGbJj3DZWLdCZ/4aCsK
	 SwrduisRq8xbzEt0WfBue56w0v27lFM8ZxpVVo7MY3D8IyqknWU1eGIf2jpk5zcwNI
	 bXOHk1b1yXTfwjs9pYrL3g8VUruwUQhJTSI8zOEEQ13Bs/QdU2RIUjM/r0LN/a43Lb
	 D48qBK4K5sDTWkO9xK2tqAoOHyVbmBIFJsVZk37R4v70WXVT0unIGBUCNzFRecvve2
	 M7wabLS5qdI3LLVxI5jeM0gGn7URmTr2jFsPCbznrXprkwpSYs/QhbuZU5DkgSDKlN
	 mvGjSvqcAk2Jw==
From: SJ Park <sj@kernel.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: SJ Park <sj@kernel.org>,
	sashiko <sashiko@lists.linux.dev>,
	LKML <linux-kernel@vger.kernel.org>,
	Chris Mason <mason@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: sashiko & pre-existing bugs
Date: Sat,  3 Oct 2026 10:24:49 -0700
Message-ID: <20261003172449.33985-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <7ia4se37qwvk.fsf@castle.c.googlers.com>
References: 
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Roman and Sashiko team,

On Thu, 17 Sep 2026 23:30:23 +0000 Roman Gushchin <roman.gushchin@linux.dev> wrote:

> Hello,
> 
> as some of you might notice, a couple of days ago sashiko stopped to
> report preexisting bugs together with not-yet-introduced new issues.
> Instead, it started putting them into the database. All M: and R: in the
> current MAINTAINERS file have full access to corresponding bugs.
> 
> There is a new "Bugs" button in the top right corner which is the access
> to the database. You don't need to create an account, invent a password,
> etc. It's all stateless.

I asked it to send the sign-in link for sj@kernel.org.  But I don't receive the
link.  I waited more than 10 minutes and checked spam folder, but nothing is
found.  The last time I tried to sign in was a couple of weeks ago, and it
worked at that time.  I wonder if this is also related with my previously
reported issue [1].

Could you please take a look when you get a chance?

[1] https://lore.kernel.org/20261003171045.33520-1-sj@kernel.org


Thanks,
SJ

[...]
