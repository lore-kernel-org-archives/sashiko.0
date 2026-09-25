Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D083F2D73A0
	for <sashiko@lists.linux.dev>; Fri, 25 Sep 2026 19:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363493; cv=none; b=JQnNuawE9PWI5AX9PTw06S4Dnak+63V11hcnEpBuc52h2Y1ECraEgb4kJKKIn79xRQip4NmX0+kOaslKGyZdS45gs+HxeA3dDWCOmqyfkV3o70fqVq5rKR39W/LmnJ2ymLtMEb0o95ZXi2nsUo2yJpiFBLUORoo10R1AcTfb0Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363493; c=relaxed/simple;
	bh=WIpLx2EQd19gNirsq7YW4/vdIYTszzR8CwVO1XNhZL8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=PXYBvb7zi6pulQQY3MiBT5zg8wsGmtxX7uaUGWaVLNWz17Y/DLxt+D8/XI1i/v+XF5BIUyCVGmt41EGpvbx3AEItHagIdFi8Pv24W6gCwXyNaaJG6yoem8+jKgYHrZW51H2fIzeeh//ike3kBCUY8jr0YUmZ4hD/rPjr+9GFr3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBbKcfBa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBbKcfBa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D7291F0089B
	for <sashiko@lists.linux.dev>; Fri, 25 Sep 2026 19:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790363491;
	bh=WIpLx2EQd19gNirsq7YW4/vdIYTszzR8CwVO1XNhZL8=;
	h=From:Date:Subject:To:Cc;
	b=OBbKcfBaTi0YcP5rg6yzKTHznu6WPMYy/ZI4ZKBD8BJ7Ks8aLvXGsBcXqYUBsnPFo
	 yIJMRGVOYbgCFCpnJWhTVFu/nxkennlc+IUmTPX6syO6jjmip60su5GxTlbyQ5jJNM
	 dP9e/8T2axjkPukLb6eZhoMSbrcaVzUnE34KuR62JVgPqAXR9Bfby6seJvaRhsIvyB
	 MuC1LF50btNz0CjAtqfYTDDiw67oIIDDQ3A8J++g0gpu50ED2hHe62Utpvc/4ZU/Od
	 e7UH8fINn4GrqSrfundQlzNYHSSk80enZPd0IfnwEobUbhF5NC+yQCk7UNvGoMWCYI
	 FF16GDAjrmUiQ==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a6595b0612so740581fa.1
        for <sashiko@lists.linux.dev>; Fri, 25 Sep 2026 12:11:31 -0700 (PDT)
X-Gm-Message-State: AFuF++ktoiobsGR3BMWF1jZP2B5YwXX9tKChY/82hRzZ0bbTE1xWQbJY
	MmdhEXQuQnxWDL9C8F9w85fXurqbAua81xLm+1SgD76zkZ57Z99yD9cIiviuKiAbnmOhAAGXuhm
	LZfW0st7wT4eCzts/RwMiCPz71l7kG8k=
X-Received: by 2002:a2e:a593:0:b0:3a6:d50:e26e with SMTP id
 38308e7fff4ca-3a63bf1c44fmr15523341fa.2.1790363489848; Fri, 25 Sep 2026
 12:11:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 25 Sep 2026 21:09:52 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iX2BkHujsyCHEeLQ44d-ZDvQ_dcwhrhOQ=u-5+6sZd-g@mail.gmail.com>
X-Gm-Features: AclHuK9_sskjfGWnORxAjmCUoCSj9VfmVwKqHIqNimIILTeoo7jbayzvLY3-djQ
Message-ID: <CAJZ5v0iX2BkHujsyCHEeLQ44d-ZDvQ_dcwhrhOQ=u-5+6sZd-g@mail.gmail.com>
Subject: Tracking request for linux-pm and linux-acpi
To: sashiko@lists.linux.dev
Cc: Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi,

I would like Sashiko to track the linux-pm@vger.kernel.org and
linux-acpi@vger.kernel.org mailing lists that are both archived on
Lore.

Thanks,
Rafael
