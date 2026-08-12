Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD50E415F27
	for <sashiko@lists.linux.dev>; Wed, 12 Aug 2026 10:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786529646; cv=none; b=KefARYTCbC6QxV6uy7hyiczdikEf6NMBNaJT8UXRhRQ0g4YuuCeCgXodV/myNjZ2aA26P/Sw1JihFtJDzkNekXD7P8wEgDblvS2MqA0aojgXp7WCG5ahORqcC7Fk9o/w2rSnnBMhy+PKhKImE8MMwlevNtMJXVcxs8PZi7H8bIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786529646; c=relaxed/simple;
	bh=k0iAjkdDu5nNypWbRHfIsp6zsL/692kutZEze4dKV6c=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g+ZMmELyeLFxI8w8eGKgEagTUjkJWM5gCQCeZi1F4VL5NB1i+hVHlJgfYQpt1Cipkvq8j9Och29TlXG0/wJB6g3JCq4sNcbuCvWUD2R8JgM74B5KDy6JC5MwZ+JtLGK3BncuETYAM5a2sk8dPQYg/yObHq7/flj953H2XxYWpEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+Ril1mI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+Ril1mI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B701F000E9
	for <sashiko@lists.linux.dev>; Wed, 12 Aug 2026 10:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786529644;
	bh=k0iAjkdDu5nNypWbRHfIsp6zsL/692kutZEze4dKV6c=;
	h=Date:From:To:Subject;
	b=S+Ril1mIrXfzMmkUTGBZ1/H0ncaA2/TiFBpxV/CVgGbjo9LdO2Wzp/CcKFq5lPLtE
	 pJ44kmv9GviqBxhtu+VQS7A+Nr/We0T6oxCfokIRbFLyhFwAYwTkGC6sIY26Uvgwcs
	 nY2avZgpGUd8jiozDGmH1lblLybcdi2ggQAPRYVmaj45bEs8XhmebEnR7izwGEmyvA
	 W0JlhicpyGG2+VjQaNCpcNcN6n8ejsByBGdZLHjOw9F6YRJgJ7zwJ8+jgntibSFzb+
	 e+CHksW5hMFwYdMSroq/9rEZN/C7Uqyi4dmmf1YC1NNIJPqL0QjRLBBTRHb0GNF+Jm
	 Inq26tnHaX0Ww==
Date: Wed, 12 Aug 2026 12:14:01 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: sashiko@lists.linux.dev
Subject: prerequisite-message-id handling
Message-ID: <anxHaUk_i0_ZPMr8@lpieralisi>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I have noticed that sashiko failed to review:

https://sashiko.dev/#/message/20260812-gicv5-7-2-fixes-v1-0-3743e82c69a4%40kernel.org

because it does not apply. I added, through b4, base-commit and
prerequisite-message-id to the cover letter but AFAICS from the log only
the former was taken into account while building the baseline, that
also matches the guidelines:

https://github.com/sashiko-dev/sashiko/blob/main/MAINTAINERS_GUIDE.md

Just asking if, for future postings, there is a way to handle patches
dependencies and feed that info to sashiko.

Thanks,
Lorenzo
