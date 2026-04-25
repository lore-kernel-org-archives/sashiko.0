Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0051B40DFB2
	for <sashiko@lists.linux.dev>; Sat, 25 Apr 2026 00:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777076686; cv=none; b=F0tCdBICh7xTSGEaEr5jgqVOBdkF/8gvE88KZjguGa4v4qJm0VkHY3GvDbf539r0GuyDrQ4LUCG7H9QbGUac66PTwRXl5XotqbZdkCdKzbd9S1Uwac84EBd5SOWCREjLb5knjGrItohW/nBzHfnc3CH0/KnKcKc96bBrGJ2V82M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777076686; c=relaxed/simple;
	bh=fS6+BynKs/8+8tIfZIj3ns2FtLPObg4rm+EAqE3P3x8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=YFsMC1sa+DR0gjMQkrF0/zU1ylnZ+oF+7zh6+DeQrrIpnA/zuv80S9DCu+zISqwXN0bh7Dn+3Mfvq72mtW4dPVSxj1PTalYSMENqDe4EBkEkFlBb36eCUd80H4lhILHUXAsPfDYZSpiH38iZu7+P2vgCHjRpjphUT1m0PR6NujY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jm520Gqg; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jm520Gqg"
Content-Type: text/plain; charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777076681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fS6+BynKs/8+8tIfZIj3ns2FtLPObg4rm+EAqE3P3x8=;
	b=jm520Gqg97Y+QXTgVL5Fx1TY/5qIUX6BrCq9U0T7mxA+l6upZPG+HJ9fOHaMyHsbrKaIAP
	0i/GNiZl3oadH90DSWLM7m/JZ3CFDvi3IXA4sivE/B2PiFZVDKvzJGPsoNIsjxKDUe73X2
	WLUUeHAoaEWMfVbWFQ25ArLBuJqnL3U=
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: sashiko racing with maintainer for the review (duplicate work ?)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Roman Gushchin <roman.gushchin@linux.dev>
In-Reply-To: <ecb65bde-3d85-40fd-8c6c-782071bfd5be@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 17:24:15 -0700
Cc: sashiko@lists.linux.dev
Message-Id: <EE7C9947-83A4-4056-97BE-9F26D744E7E0@linux.dev>
References: <ecb65bde-3d85-40fd-8c6c-782071bfd5be@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
X-Migadu-Flow: FLOW_OUT

Hi Daniel!

It=E2=80=99s definitely possible, but Idk if it will generate too much noise=
. In general I aim to review all public submissions and in theory (subject t=
o current AI budget and stability) reviews should be within an hour, maybe e=
xcept large patchsets.
But I certainly can add emails notifications as an option on per-subsystem b=
asis, as well as emails on clean reviews.

I=E2=80=99ll be likely a bit too busy next week and then attend lsf/mm/bpf, b=
ut after that I can certainly add it.

Thanks!

> On Apr 24, 2026, at 8:41=E2=80=AFAM, Daniel Lezcano <daniel.lezcano@oss.qu=
alcomm.com> wrote:
>=20
> =EF=BB=BF
> Hi,
>=20
> as a maintainer, I don't know if I should spend time on reviewing series w=
hile sashiko is may be doing the same review in parallel.
>=20
> Is it possible to have sashiko sending an email to the maintainer(s), revi=
ewer(s) telling it began to review, cc'ing the submitter and send another em=
ail to the same recipients, telling the review is finished and is ok/nak ?
>=20
> That would let me know I should wait while the submitter takes into accoun=
ts the sashiko reviews. When sashiko review is ok, then I can review the ser=
ies
>=20
> Does it make sense ?
>=20
