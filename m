Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D8417736
	for <sashiko@lists.linux.dev>; Wed, 15 Apr 2026 01:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776215097; cv=none; b=I24+CYxXuft2GXiTHblDrxP10NqsUXuiN4o94TJIfvnLYJowc5ra/mWwVu99ak7Xmt3IG8QqhO6T6I6rkU1rTaufIJ3M4lEdnZr3JgssaC5V4ek5KLp7c1UwBqxiRbTyiF8OKZ563dRQRo3fqNQjMkRiAkWXkluvBRKY6EE3vmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776215097; c=relaxed/simple;
	bh=w+eN5ik5JBfvUCsVHuSDswrQZ+40z3gTn/wGONInlKE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E36vazazlDxNy16WW9WvxwVANSp0EyrefBgCHCje2XgtbKtI8ic0wy0ySCWYM6uygI029DRFuIjRE94/m/eVqpy23xO7UIRBrpsZd1mvYK556Cn4MZRTa+cIMq6NVekbBZG1HIsIplNRRAZbUozYAaXlIdfT1LdX1rppzlV8Eto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Vw9pSHje; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Vw9pSHje"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776215093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=w+eN5ik5JBfvUCsVHuSDswrQZ+40z3gTn/wGONInlKE=;
	b=Vw9pSHjes2PLjplNCumYn5P/x4C5VeI+StthXGhaskyUKuQjVdYUJ+pTsXiyE9rl0hbC8f
	3VPJnedQrxGSkNa9Uw8rWLylT1xvv25fMBZzr057Wwj+4qcoSrPaa/Tze3yfew20HTFM0R
	tM7LIpSHgQPX7L/n5IS/48Xh7AAUgaA=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: "sashiko@lists.linux.dev" <sashiko@lists.linux.dev>
Subject: Delivering reviews over email
Date: Wed, 15 Apr 2026 01:04:39 +0000
Message-ID: <7ia45x5tuj88.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT

Hello,

Sashiko is now able to send reviews over email. It can be configured on
a per-subsystem/mailing-list basis. Sashiko can reply to the author and
cc mailing lists, maintainers and/or listed volunteers.

If you're interested in your subsystem to get email reviews,
please, write into this mailing list or me directly or send a PR changing
this file:
https://github.com/sashiko-dev/sashiko/blob/main/sashiko.dev/email_policy.toml

Please, make sure all maintainers in the subsystem are onboard.

I also have a slight preference to not use reply_all and keep the cc
list relatively short to not pollute all mailing lists.

Thanks!
