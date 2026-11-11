Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794359099;
	b=TOL2jjp+YFx8fzywLfCFaHabULDiscrPruORi54P7maUrsp9MUD2b9SIvR70oDHIJ8tJ
	 IyhcR0bYcmBFX/JHWtno/mPODWnGwy97tkq8hOhjhIUCryaCo+su7FO43D7Oc3+MyVf3T
	 T/HhLwL6iEN1k7Zi2bIBXDi/FiPE7NBZaT3FXd/1dFoeZZBEY8+87fyFKmMe3tba7yYIq
	 hAuVhHslORM3kU9TFYReSUrNQ14wxvcd9KrZWuYmbLqOfOoXYkCK2uTqCpkPZeYbSwfcW
	 aSDcZT0kZAGqB5GYgO11ZxYXp8lsFSTs4yY7spU19GfTK3eqR3iNmm6hvtFo+RVD5ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794359099;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Content-Transfer-Encoding:
	 Mime-Version:Subject:From:In-Reply-To:Date:Cc:Message-Id:References:
	 To:X-Mailer;
	bh=odHSBv2W9vgI3nKFs1+gQiFWTqdzD4eGanp0foQGlBU=;
	b=kiOq2IE+BOuW9Z+1cuDtT9TnBpbARDWZMkquA2K38K6P4tWk3mkFQQCNZzmS2jhLuTho
	 bExAavVg7cviCWDxlk4wb+dZmPFPaSJHO6YHJxEpUuysHi2PkmRUCCYbknvLTw/o07CFY
	 1s62DPIGAdoEqxbWkRPWBu00Ig/1Z2McFs+BK/JvnNeqKk3GLvQaE8MCPIylOdxQ0PZzo
	 W/5qC6b5CDv9iqBOrfsOlplbeMZljldp0iP4eoPL/CXsJdFHH6IvTDaQBKjv9iIXTMTM6
	 kkVpKhlcRtqybFBxD2at1zhcAWdnjPFwGC8nYIdQfXXePLNIE+MeWGXnNRIM0oshr2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ofxuipLc;
	arc=none smtp.remote-ip=95.215.58.45
Received: from mta1.migadu.com (out-45.mta1.migadu.com [95.215.58.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395A2606A321
	for <sashiko@lists.linux.dev>; Wed, 11 Nov 2026 01:04:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 395A2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ofxuipLc
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=odHSBv2W9vgI3nKFs1+gQiFWTqdzD4eGanp0foQGlBU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794359096; v=1; x=1794963896;
 b=ofxuipLcne1GBM0W8SUzKD9WaurNnSvM5TW1WXQ+jpz+jpYyZj1SFZ6pROPPu8URIsHl2VAY
 uk74t53tfg2KWgKCQtsoT5mO1D0YmrfQuIzw2yYQtqdbizOw7nnctHFf8Hq+1h1M1DDNVgxvwp4
 Xam8T+JPIFu6uJ1zkCSUM0RU=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta10.migadu.com with ESMTPS id 61b06792d9281594;
	Wed, 11 Nov 2026 01:04:56 +0000
X-Mizu-Trace-ID: 61b06792d9281594
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: Re: Request to add linux-mmc
From: Roman Gushchin <roman.gushchin@linux.dev>
In-Reply-To: <CAPx+jO_YeCeu3tN_8tKL5M3mZJT3VM2vVLLH6WdCpC04Mk=iAA@mail.gmail.com>
Date: Tue, 10 Nov 2026 17:04:39 -0800
Cc: sashiko@lists.linux.dev
Message-Id: <61C9D3E6-7E62-470B-B942-AFEA3ACFFCD7@linux.dev>
References: <CAPx+jO_YeCeu3tN_8tKL5M3mZJT3VM2vVLLH6WdCpC04Mk=iAA@mail.gmail.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
X-Mailer: iPad Mail (24B119)

Hi Uffe,

Added.
Please, let me know/send a PR if you want to enable emails with reviews.

Thanks,
Roman

> On Nov 10, 2026, at 4:08=E2=80=AFAM, Ulf Hansson <ulf.hansson@oss.qualcomm=
.com> wrote:
>=20
> =EF=BB=BFHi Roman,
>=20
> Can you please help me to add the linux-mmc list to Sashiko.
>=20
> Kind regards
> Uffe, MMC maintainer
