Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07D1434408
	for <sashiko@lists.linux.dev>; Tue, 22 Sep 2026 12:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080310; cv=none; b=jWUGhxB+KpFD2MyuBFHxV/5wWqKAUKrzG9FP0e79p24QE8EeBXRj2ISx3NBGVeZpu3O9r6PFWo+n5kZTBRvxKjZMgmq2o2BbC9cmOtMoEyPF8m/Dr8t5M95CYZI7EzPiU5XjotSu7J+aOxTWYu+JorVgIej5DuJpfME/co9A3Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080310; c=relaxed/simple;
	bh=IH0DsYZyma83iNopTKv6f6hvw9XJcWgkqqmXYXmgR1A=;
	h=Message-ID:Date:MIME-Version:Cc:To:From:Subject:Content-Type; b=NNraZZLf3SQDDZRtPLRR1ckpRCMVa1hHoycmqkNh5kdy/jLIVCzEzDeEpXh6m9JmZZpr5mVm3gX0CZ5NL5W1/hWKqRaMNe1lK+Xbvr+YyaiKEium75DTU2acA5m/YNHOEY1nzgHMxAIybQaIb+aOG4jRnX7ZmIavAnSe6W92MH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZwUb4vD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZwUb4vD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC8C1F000FF;
	Tue, 22 Sep 2026 12:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790080309;
	bh=IH0DsYZyma83iNopTKv6f6hvw9XJcWgkqqmXYXmgR1A=;
	h=Date:Cc:To:From:Subject;
	b=YZwUb4vDZ5H5igMCAmV7WGM8uxo9gGjUE6SBwOIjtML8dar7t9CSHPCqxeOEV0Zwg
	 UGJ9ain8/rKc0RbB2zeabAVJH0N5TrDCm4ScK6B5Hu4Kxfp4z48Gkxueut+klafKGZ
	 HGEL02sHBe7i4HH1avCd6ltMMF2kVZNgEcHDoA4HcRR3cyaD1hK3LIm5UL7yymnl8H
	 RVn3s4/P4suA8or4H3uA3tuPhrlJ3dK59lYRKd8VTYIeUSQry6yY/RgbnbpoD3TKTO
	 K660tObjGpidk9g4M5yiKADlfz3ktzCG1xzC2+qcZctrfZcnkR2xfa1fTcfdHljmrD
	 409N/IsJ3yLIA==
Message-ID: <c9abe570-cc29-4892-8790-4ccd5f7e6756@kernel.org>
Date: Tue, 22 Sep 2026 20:31:46 +0800
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Language: en-US
To: roman.gushchin@linux.dev, sashiko@lists.linux.dev
From: Chao Yu <chao@kernel.org>
Subject: add sashiko config and policy for f2fs
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Roman,

Could you please help to review and consider to pull this request?

https://github.com/sashiko-dev/sashiko/pull/551/

1. linux mailing lists: add f2fs
This patch add f2fs to sashiko tracking list, so that all patches sent to f2fs mailing list
can be reviewed by sashiko.

2. email_policy: mute review emails for f2fs
This patch adds the default mailing list address, and mute all outgoing review emails by default.

Cc: Jaegeuk

Thanks,

