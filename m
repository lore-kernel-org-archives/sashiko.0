Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CC731F986
	for <sashiko@lists.linux.dev>; Mon, 21 Sep 2026 15:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005953; cv=none; b=aFH6wwVTkImo9g4XKsCWf3RxB/7Zi4BfpHnpVGPunnsXwd8w5Hs1nWM/FYCoP/Ah5lk1uLXjeC/tcSFww5k2KmRwvUZlCQ6feR2kpsxFOrXIyJwSBVBrdswHo88CmoamoGGeSUbBJOWFWeI8pJxpnjwv3T2I316Ev4j2EMPYmd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005953; c=relaxed/simple;
	bh=+wMGYYQ81fmbxhf7Ba7fkKn8O6diHfVdpknlD4xmw/0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=IowK/aZxrOIDOchh0Q4klPly6xhNmCzovMQdpfOnxeKArmgT3IF41D41UPdu9klTwqelgZwRCIN/oAIPSOBXDuGjhJGq2S8XKM2jtBwkQtva/8ZrU3ffGIRn3sBtO8T1ucZhuBbmJ+lB/h88DGvr6S31U/pemXLBCkkgf/i3714=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G6gyuhST; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G6gyuhST"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62C571F00893;
	Mon, 21 Sep 2026 15:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790005951;
	bh=As/FwwyutELFZreVn1c/VCPVh0ZGF6bkX5b288FQ1gc=;
	h=Date:To:Cc:From:Subject;
	b=G6gyuhSTmVJeUAbyMqnsamvg6iId7qfFyBP5XLf3CR4RymMomrSjqA/mR5lmAkbdM
	 KQmmy3ukJaRCkAPjJfNpcH1zwdCZT0mmsDHepPxbebx7r2+4lW9HJvU7Tsx1B1DTPp
	 JJXYB6MB78zmb3K3g3AbkmDVf2cvbfNULlMQhPiiR1+Vzh18Hl3nATZofAUWvE58Tr
	 euE170r5PkcenDiuLp4cNpA9l/WWC0nWA2c2o8AZnV0+1kmL4jV5rOU2BxzwqTHkFJ
	 AWUsM6+HZIxbnfi1Q9ZB0hlZgvm+FHT+TKK3WbkGOGgCfUGeoDE6ubYdjL8RMXvWGf
	 3CLYPDbo+oG0A==
Message-ID: <9e1ca7ef-a1c2-4e0b-a8f6-28989d0896c6@kernel.org>
Date: Mon, 21 Sep 2026 10:52:30 -0500
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: sashiko@lists.linux.dev
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Mario Limonciello <Mario.Limonciello@amd.com>
From: Mario Limonciello <superm1@kernel.org>
Subject: Enabling sashiko for amd-gfx M/L
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Can we get Sashiko enabled on the amd-gfx mailing list?  It should use 
the drm prompts.

https://lore.kernel.org/amd-gfx/

Thanks!

