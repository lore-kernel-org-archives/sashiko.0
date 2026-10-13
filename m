Received: from mta1.migadu.com (out-86.mta1.migadu.com [95.215.58.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E1F3EE1EE
	for <sashiko@lists.linux.dev>; Tue, 13 Oct 2026 14:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900471; cv=none; b=o3rxTkB/GVv+1eJ5r8Oi6Qyq1a+BYhDrJWbApm8gt6E1nP5uSRa+hCbrfdY+7SDIh+WOADG6eCkTeKYzG9BHFFwE29dP0zAsHCiL4xoKPMnFCXhyCWuuPzQ5K7HdBOw2TpRIcNDj/ib4cU3HWBFSe0B/HxTwuPtirMgDz6nz9z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900471; c=relaxed/simple;
	bh=uCjftZGXbzYLw46M+dYo5Fpmag6Z3fLnywJPEnooDy8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=aKv//gRCDDtTXYZk+1mxFcYV9iq4Q7h9eXIOl04UWMbP5JT1kwwIbt9yBEHgw60lPac86770VM+99Y/YBUmpy20F3DT5oCOM5EChvjVBmWIHvT2zKGboVMKdpd7DyytuFa1ApSNXNh62N+u4BajShtIGvBq895CM6vlZuy3fhXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=o2QL9QRS; arc=none smtp.client-ip=95.215.58.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="o2QL9QRS"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=uCjftZGXbzYLw46M+dYo5Fpmag6Z3fLnywJPEnooDy8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791900467; v=1; x=1792505267;
 b=o2QL9QRSnQh6lqmyDaXlTkt/6iodXUzRYyE+gD8ATHz/55t67n5w4x93/U44enUKW1dA0Ahi
 sheVRK6NCtdLFST4KfDWGa4gT6JZtVzxPOmwxcyO9PHPCmtzRe0baQMmmEpTbiIzLxY/WcQei6m
 VNIYe0ZJMh/P9Zd2NbWF97jQ=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta11.migadu.com with ESMTPS id e137603c64b7681b;
	Tue, 13 Oct 2026 14:07:47 +0000
X-Mizu-Trace-ID: e137603c64b7681b
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: Notifying the assignee of a sashiko bug
From: Roman Gushchin <roman.gushchin@linux.dev>
In-Reply-To: <CA+EHjTzi7fbbA_t3-9Q3KD7Orn=ptphXPQw6TMO=n9_z9t2OyQ@mail.gmail.com>
Date: Tue, 13 Oct 2026 07:07:29 -0700
Cc: sashiko@lists.linux.dev
Message-Id: <AFA5C0C9-DD89-4F2A-8C54-9AFBD1C50E65@linux.dev>
References: <CA+EHjTzi7fbbA_t3-9Q3KD7Orn=ptphXPQw6TMO=n9_z9t2OyQ@mail.gmail.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
X-Mailer: iPad Mail (23G90)

Hi Fuad!

This sounds like a great feature, waiting for your PR!

I think the email should clearly say who did assign it, basically it will el=
iminate the risk of spamming.

Thanks

> On Oct 13, 2026, at 1:45=E2=80=AFAM, Fuad Tabba <fuad.tabba@linux.dev> wro=
te:
>=20
> =EF=BB=BFHi Roman,
>=20
> I really like the new bug database, and I've been using it to triage
> KVM/arm64 bugs. One thing I noticed: when I assigned a bug to a
> colleague, he didn't get notified.
>=20
> Could the database email the assignee when a bug is assigned? The risk
> of people using it to spam others seems low, since only maintainers of
> the affected code can assign a bug.
>=20
> If you're open to it, I'm happy to send a PR. I wanted to check here
> before preparing one.
>=20
> Cheers,
> /fuad
>=20
