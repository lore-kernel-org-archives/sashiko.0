Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F243C871E
	for <sashiko@lists.linux.dev>; Mon,  6 Jul 2026 19:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783367668; cv=none; b=lDMoV4b1y6pLoh+rkchIh2I0KG1Yz3D8Vxz0+h1Ko4ICTAjA8YEFw6oyIKAK/pE7hn4XE/0GYBV+OZKejwOLXPwklnNpumELiXr5+SY9cA2QpsJXl7bm+pBGGSMOsCc4j10DpCDFB3wraV1Pa7kVY5nHAI8XwOnnZeQH6iaPzOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783367668; c=relaxed/simple;
	bh=caAqEKAPuzsOzNEHX1SoVnDqFe7zsSov3hrhT0KJY/s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rbu5iru3JMuivkg/nYptavVlHlS0W47xqUHrDY4JzDV2RCSfXdiYk8uDD3GsAh6aV1EqjIu76elmIvqjrlgo/FagyQlvnZQD2ewNUTY/2+4PG4SubCMKs6dDcBHevutRxaoOHKyrL1hKqYK10r9YRo8U3pJGkOuq7J55FkbEOIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ksN59HTI; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ksN59HTI"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783367665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=caAqEKAPuzsOzNEHX1SoVnDqFe7zsSov3hrhT0KJY/s=;
	b=ksN59HTIcAHOMmAeGjocLMDkUANlaJY+REBEYQgOrAQYG4PiwI2aY1pj5FwPQ2Icj4s4vq
	hQDpLPJaIqaONpRMksjYJDUwV50uGR/eZQmd5s6VKTWF7Md3GetPxvO9ZAaCLKT02aybz6
	FIuWt2v9sgga1x4JcRSdZor9KaGK0jE=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: sashiko <sashiko@lists.linux.dev>
Cc: Derek Barbosa <debarbos@redhat.com>, Chris Mason <clm@fb.com>, Theodore
 Ts'o <tytso@mit.edu>
Subject: sashiko v.0.2.4 [new sashiko review mode]
Date: Mon, 06 Jul 2026 12:54:12 -0700
Message-ID: <87v7arlwrf.fsf@linux.dev>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT

Hello!

I just released a new sashiko version with a relatively big feature:
new "$sashiko review [sha1..sha2]" mode, which is designed to be _the mode_
most developers should use for the local development. It should be overall
functional, but I'm pretty sure there is a lot to improve and fix. Also
"$sashiko init" for the initial setup, which I think we can make more
interactive and user-friendly.

Any feedback, bug reports and/or fixups and ideas are highly welcome!

Thanks!
