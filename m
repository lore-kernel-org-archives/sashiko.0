Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A974441029
	for <sashiko@lists.linux.dev>; Mon, 11 May 2026 16:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778518794; cv=none; b=i8Bn3dqAvOszDiF7CGfzrg0PHCMq6ok8iurwzyUsYk8jmTr5uyxotHtoUfveuVFLxQruYdGM848AKAC0KEvSmXkZflFdFsRbxBivDg+wajLfy3Ublho8JK+Q+TV9ilRiwgtWZOvMmLeF0UF1sPedZhQTuuJ1+Ww+/TIQOU08SX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778518794; c=relaxed/simple;
	bh=6/Mh0pYGRdog8kYUEqnBfrNmcVjVoxYW5VF08qy2II8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HIW8N6zmVJLI3D6oYEGiE3bzRh2nMFvqrqmqTCxYORZb0uJ24jI6Bea2IrC4gblUpcbLscU1slF9IbbygnmtM/AY9Gc3k4diBw/4/lJfRoejwDKqShb1A0aVaz1pOJVJwcO9//ZmRcTKD5FjyzdLRBKalLVoGQSHNZ5UVKimdNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YGPPeVUP; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YGPPeVUP"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778518791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6/Mh0pYGRdog8kYUEqnBfrNmcVjVoxYW5VF08qy2II8=;
	b=YGPPeVUPERoKblhckcqoCvTlGVvu/0/Sg1eoqhCeyl9pcDNqwicoDN7LaFIvRmhCo5dwvJ
	C/kO/6knX7YQHzDWhWD1rl68t6EJZmpE0tNK/W23X7+L0c1IzH4AF+ul4mbYFF9TnJbqFX
	iGMgQHa0yeDYeEq8sOunBFJFuPpEFS0=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Charlemagne Lasse <charlemagnelasse@gmail.com>
Cc: sashiko@lists.linux.dev
Subject: Re: Sashiko.dev webview not getting updated
In-Reply-To: <CAFGhKbx53f0Y4XPpTcpqaYbXVd+Gu7c8L1pWKnEfVLxG-Aktcg@mail.gmail.com>
	(Charlemagne Lasse's message of "Mon, 11 May 2026 10:46:43 +0200")
References: <CAFGhKbx53f0Y4XPpTcpqaYbXVd+Gu7c8L1pWKnEfVLxG-Aktcg@mail.gmail.com>
Date: Mon, 11 May 2026 09:59:43 -0700
Message-ID: <87tssd51c0.fsf@linux.dev>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT

Charlemagne Lasse <charlemagnelasse@gmail.com> writes:

Hi!

Thank you for the report. It's a known issue, actually caused by some
issues with the LLM provider, nothing sashiko-specific. We're working on
fixing it.

Thanks!

> Hi,
>
> I just noticed that the web frontend is basically stuck since
> 5/10/2026, 1:53:04 AM. Ok, there were two more commits around
> 5/10/2026, 2:17 AM (most likely GMT+2 - not sure).
>
> Is this known?
