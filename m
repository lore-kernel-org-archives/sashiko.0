Received: from mta0.migadu.com (out-41.mta0.migadu.com [91.218.175.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C4E36402D
	for <sashiko@lists.linux.dev>; Mon, 31 Aug 2026 20:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788209659; cv=none; b=eE3BCbhd8MMR8HVpTlXZz7/eoNrLCqXsn8/4UA8/EKxqyH0JoqJ2DDP8sY3q/vlOZpKQMTDP6csNuesjrhUW2BztuJIKTrRkbGwQbjmtdDVwoP7ZzYCkPTJcdq7ZV1bvN71W/GVbthx/U+Z1+X5LqGz1HrvB+ljUPJKkHdSFWVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788209659; c=relaxed/simple;
	bh=8HVPoqSoaHkdjzETgwAkIjXkfRCd4l8rCY/cb5QHKDo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WXfmrZHyAVkWIH1G+CXex66AeWR1QV0L7lGdfLabNTf/EFpdRP+P/CU5A75uuUNKz2pghdJHnIoGGzYNitN4r9RSMLkOsIkAmnd50sSc2D1kwXH8Cvmbhdg1t/+A8ABGLnBWiIVxLWyeuU/iNwNPz8untBOigQxTpylX1PVObus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mTGaE1jQ; arc=none smtp.client-ip=91.218.175.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mTGaE1jQ"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=8HVPoqSoaHkdjzETgwAkIjXkfRCd4l8rCY/cb5QHKDo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788209654; v=1; x=1788814454;
 b=mTGaE1jQg7WrtOp0pep+Qb/Bt5oNgyYQiVkBKP7GxQTxhZ64YV8LW6xKPrANiZYiBX9xLFn4
 ALnhwjDDy7xnMLG0Lby7E0AAYkKPa+r1+CIOknFnRKte14buVW8I49UcRRCNkcNjYp+QC8hOKwA
 HytHKIHtHJOlvpmkii0/Pin8=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id 4673b71581ee5317;
	Mon, 31 Aug 2026 20:54:13 +0000
X-Mizu-Trace-ID: 4673b71581ee5317
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: "Chuck Lever" <cel@kernel.org>
Cc: sashiko@lists.linux.dev
Subject: Re: Ingestion of patches to linux-nfs@vger.kernel.org
In-Reply-To: <e0a5f515-0292-443a-a0a9-1b505ed6e36b@app.fastmail.com> (Chuck
	Lever's message of "Mon, 31 Aug 2026 09:30:10 -0400")
References: <e0a5f515-0292-443a-a0a9-1b505ed6e36b@app.fastmail.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Mon, 31 Aug 2026 20:54:10 +0000
Message-ID: <7ia45x0q80zx.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Chuck Lever" <cel@kernel.org> writes:

> Hi -
>
> I've noticed since August 27, sashiko.dev is not ingesting and
> reviewing mail from linux-nfs@vger.kernel.org.

Hi Chuck,

Thank you for the report, I fixed it, should be ok now.
Please, let me know if it's still a problem.

Thanks
