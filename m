Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C269C3515FC
	for <sashiko@lists.linux.dev>; Mon, 14 Sep 2026 03:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789356759; cv=none; b=gAwvLPiH0TZU2wSIt7iLlWpi9HusJ+LJ5evB/ZShaRsp+SoKgIxbsbW3m/u52k2Gy7FLCmp2uha0O3QQIrqVEX31OM0KkUlfUo7cXVEK7Kn+swnTT7z3S/NZzuD+Al0Rvc+DiGtoyKZd6ZH0UqluQodoD86foWyp/VeVJqpsEI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789356759; c=relaxed/simple;
	bh=M/6FpMvTxhTCZ15BI6Gw0U0cVSkORXuaIttnvEP1yvs=;
	h=Date:From:To:Subject:Message-Id:Mime-Version:Content-Type; b=D0058eU1QrEAyXzFM9Q13weCTfk2J6RLm9AAtO8urPFIH0KcnL/o6wiHTwySUMU5brKGg5rsShRaNgdpRWxEd8j58UVE1ZqJn4gxGyrKt9/F5eJX8p6DViUwf1EZLR825djMi1kLP6MihIMzi4gJCpFHZoLqBe4SBN5f38TK1C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GJyOexxk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GJyOexxk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DD061F000FF
	for <sashiko@lists.linux.dev>; Mon, 14 Sep 2026 03:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789356756;
	bh=GAclQkDmfAbuNqiY8Fv5diE7FuRk9oc0Fz08pCakW9M=;
	h=Date:From:To:Subject;
	b=GJyOexxkYeJbVvH+WCk12szbNlrWOXLmIlY+Jnsgffbnkj/ItaMAj6cPjcRzoUPpD
	 F6v+Re4eEQQyZOkDdgBPkGTVpTzl+xMuAXo3cLBbTn9D8ULoECD4Vx9QD111bPkydE
	 JZOU+Qr6/rHbnbr0zvsWHhVzRnaElcc7re90Nx1Y=
Date: Sun, 13 Sep 2026 20:32:35 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: sashiko@lists.linux.dev
Subject: how to interpret footers
Message-Id: <20260913203235.d4965963fc37b11b1dcf6dce@linux-foundation.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

https://sashiko.dev/#/patchset/20260913-remove-pg_private-v4-0-848550f7574e@nvidia.com

The third-from-final line there implies that a large number of people
received an email from Sashiko about this patchset.

But I received no such email.  How should I interpret that info?



Also, Sashiko seems to have become more assertive lately.  It used to
always be "is there a bug?" but now it's "there is a bug".  What
explains this?


Thanks.

