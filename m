Received: from mta0.migadu.com (out-29.mta0.migadu.com [91.218.175.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826DF418347
	for <sashiko@lists.linux.dev>; Thu, 17 Sep 2026 23:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789687835; cv=none; b=rwPZJgaaWR25ZTrlMEzM4IwGNakhKh9esVwwAc1wrLjHVSh533xfveTBFAm2nF30g20QhJ5ZJUEskJFz0STTKbwVFqe78llAYdFhS+zPlYhyKL9ohu9djafMiIP7LU5XdJCkEEsYpi84Lk+ocRi+VUs9SCr2HRDmXV3Q0+Vy9rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789687835; c=relaxed/simple;
	bh=XQJbUe8sMDqqBW5miSJ/WWQvT7MMRyRqwO1bmF9XY6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Coubu+b9kuaPOqHenLr0Myr+9cSckAu+6HqJNu7e2Oii3ZY+GNTq2+1gAuh72na2WIaeuze6euMp1Wv+PZzps3D64OI/VDVttZ87EU6ysTm1dtwQBgYIb5QinNg9i3C6OD/NXQQsVvcxlAdvGL/muDPtF7FQ8LkkW2A9sMpnKJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qtXUEYE1; arc=none smtp.client-ip=91.218.175.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qtXUEYE1"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=XQJbUe8sMDqqBW5miSJ/WWQvT7MMRyRqwO1bmF9XY6k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789687831; v=1; x=1790292631;
 b=qtXUEYE1VFbkTq1smiIKWHyljSeob76vpMVFf+Bdur4v5NHJwCyMyjZJcbSV9i4vJkZQ06Ak
 6hDkvHqYEKxj5aN0p6NzsvCLWq1XxH+fdCY3950S8FeJ5sE4FmrwLEfq/MO+g6l29dhS0W+EYC5
 i4Jzs+m8EVCEGiSSA+pIpSOc=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta11.migadu.com with ESMTPS id 293cbf4040f81a82;
	Thu, 17 Sep 2026 23:30:27 +0000
X-Mizu-Trace-ID: 293cbf4040f81a82
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: sashiko <sashiko@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
Cc: Chris Mason <mason@kernel.org>, Kees Cook <kees@kernel.org>, Jason
 Gunthorpe <jgg@nvidia.com>, Jakub Kicinski <kuba@kernel.org>
Subject: sashiko & pre-existing bugs
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Thu, 17 Sep 2026 23:30:23 +0000
Message-ID: <7ia4se37qwvk.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hello,

as some of you might notice, a couple of days ago sashiko stopped to
report preexisting bugs together with not-yet-introduced new issues.
Instead, it started putting them into the database. All M: and R: in the
current MAINTAINERS file have full access to corresponding bugs.

There is a new "Bugs" button in the top right corner which is the access
to the database. You don't need to create an account, invent a password,
etc. It's all stateless.

If you're working on other tools which discover linux kernel issues
and/or can generate reproducers/fix candidates and want to collaborate,
please, reach out to me.

Thanks
