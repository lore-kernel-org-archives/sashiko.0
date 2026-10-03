Received: from mta1.migadu.com (out-87.mta1.migadu.com [95.215.58.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C85F9C0
	for <sashiko@lists.linux.dev>; Sat,  3 Oct 2026 20:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791058248; cv=none; b=L7WmvwuXNSfNldxor2UnrZGnh8l1Q6s+YtfTvlUXXO9hlhG04QaCMMDLQ55d2hwTKDjUgoC5IFCrc7Rvd28z3c0e4Sfoa7uSw2HzsUyELRZ9WEDJ5DjVhMC7bek2JcepSEFpO1oAdfNXrp/EQ30CpPAanIEPSwl5ILmA9zXNqIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791058248; c=relaxed/simple;
	bh=X4nxifD4XUHq1BKvjEXSQCHM0bDL1a7IaCs/n/9tm+k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kRc26+b6YV7RdKMbm1/1DFQhxYbP8NXFwlc7bGtzEIsuglPc4hkDNCv6JTXcJrEaG6sEf++2HF0ajvzJg5QClozztlJPen1pHNAS6HBPsVu6BwRda4bbwjlfdO7nLOWV3gGO9tZ0+Ki3SIwTlD+iykYtYD8KriqBlfslG8ZaJTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TvQtQHSZ; arc=none smtp.client-ip=95.215.58.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TvQtQHSZ"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=X4nxifD4XUHq1BKvjEXSQCHM0bDL1a7IaCs/n/9tm+k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791058243; v=1; x=1791663043;
 b=TvQtQHSZ4WbB8qwLmA+i10kuk3NlWWwk59Ec+wObHLfbFPpY9940LFrjZL5UQS96L+GYDsvS
 mYbZP6/Xo6clAxvZ5i2IXuqN5KxfssDCXY46e70jKBEh6FfLnTtLzEYTpw6nvzfIen+5F9T1pSL
 9GrXNahx8bHEDvZqm5lGjVMo=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta11.migadu.com with ESMTPS id 7736264c25658130;
	Sat, 03 Oct 2026 20:10:42 +0000
X-Mizu-Trace-ID: 7736264c25658130
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Alison Schofield <alison.schofield@intel.com>
Cc: sashiko <sashiko@lists.linux.dev>,  LKML <linux-kernel@vger.kernel.org>,
  Chris Mason <mason@kernel.org>,  Kees Cook <kees@kernel.org>,  Jason
 Gunthorpe <jgg@nvidia.com>,  Jakub Kicinski <kuba@kernel.org>
Subject: Re: sashiko & pre-existing bugs
In-Reply-To: <asA_b1s4iVx2_v-U@aschofie-mobl2.lan> (Alison Schofield's message
	of "Fri, 2 Oct 2026 16:34:07 -0700")
References: <7ia4se37qwvk.fsf@castle.c.googlers.com>
	<asA_b1s4iVx2_v-U@aschofie-mobl2.lan>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Sat, 03 Oct 2026 20:10:37 +0000
Message-ID: <7ia4jynyzgsi.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Alison Schofield <alison.schofield@intel.com> writes:

> On Thu, Sep 17, 2026 at 11:30:23PM +0000, Roman Gushchin wrote:
>> Hello,
>> 
>> as some of you might notice, a couple of days ago sashiko stopped to
>> report preexisting bugs together with not-yet-introduced new issues.
>> Instead, it started putting them into the database. All M: and R: in the
>> current MAINTAINERS file have full access to corresponding bugs.
>> 
>> There is a new "Bugs" button in the top right corner which is the access
>> to the database. You don't need to create an account, invent a password,
>> etc. It's all stateless.
>
> Hi Roman,
>
> The access is not working for me for my linux-cxl and nvdimm.
> I ask it to send the email link and nothing happens.
>
> Anything else needed here?
>

Hi Alison,

not really. There was a temporary outage with the email delivery,
which I'm about to fix. Please, try again.

Thanks
