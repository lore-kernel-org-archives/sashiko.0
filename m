Received: from mta0.migadu.com (out-211.mta0.migadu.com [91.218.175.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9DF3B443F
	for <sashiko@lists.linux.dev>; Mon, 17 Aug 2026 20:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786998311; cv=none; b=BgiJGp02RuKoltLyipxjukeOkHdyu0JkMMWFzXKZN0vByNxxnar1ZlZCjU1O/4AEVjPq7cjMQ8HfQLHalJoouUQPdpVF+pFl1JQvSSwLhamffNtpKFfQjcRPmP11xXzmdoB9oEtB+qI/BI70MyMCFzumL5Sv/rnKrciRDbu6ndg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786998311; c=relaxed/simple;
	bh=C+VKHww+RLb87kaxamSAri2/cirzp1WLFHn+YVMW5yQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZbhPvsfwHjEyyD5kKBA/j7dPSPTYUeWD0Ii37cfj9ftH7VEvItb/+gnxNgIALb0Ltqpnp+CF4USvs28U6RajpsYtlncZlyG20LbrIC4aH+UeHnqT+rcLv+OfF3hZIdH+CYbSgICaY3NmWP8Brxcqsrl33rgkOZSZLKe9y6Ju8EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=e+qPRtSe; arc=none smtp.client-ip=91.218.175.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="e+qPRtSe"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=C+VKHww+RLb87kaxamSAri2/cirzp1WLFHn+YVMW5yQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786998307; v=1; x=1787603107;
 b=e+qPRtSe19223D0VuWHWidNyrflnymNZN7+GIhippdMX7mSD4v1vYpsd1Paj/E9rhAijlRdJ
 nli6YS0L/84hh2V2f0Y80Pq73Vvqhoe3Z+TxqGlL+ssc0KJDgw0gBrjPV4SJquWFfjjem3Yix9d
 DDNuXTq5MYLfkSZuPfhFz+f8=
X-Envelope-To: sashiko@lists.linux.dev
Received: from castle.c.googlers.com (35.227.148.244)
	by mta10.migadu.com with ESMTPS id 9cfe37e7cabcb8d6;
	Mon, 17 Aug 2026 20:25:07 +0000
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: sashiko@lists.linux.dev
Subject: Re: prerequisite-message-id handling
In-Reply-To: <anxHaUk_i0_ZPMr8@lpieralisi> (Lorenzo Pieralisi's message of
	"Wed, 12 Aug 2026 12:14:01 +0200")
References: <anxHaUk_i0_ZPMr8@lpieralisi>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Mon, 17 Aug 2026 20:25:00 +0000
Message-ID: <7ia48q64ebqb.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Lorenzo Pieralisi <lpieralisi@kernel.org> writes:

> Hi,
>
> I have noticed that sashiko failed to review:
>
> https://sashiko.dev/#/message/20260812-gicv5-7-2-fixes-v1-0-3743e82c69a4%40kernel.org
>
> because it does not apply. I added, through b4, base-commit and
> prerequisite-message-id to the cover letter but AFAICS from the log only
> the former was taken into account while building the baseline, that
> also matches the guidelines:
>
> https://github.com/sashiko-dev/sashiko/blob/main/MAINTAINERS_GUIDE.md
>
> Just asking if, for future postings, there is a way to handle patches
> dependencies and feed that info to sashiko.

Hello Lorenzo,

Not as of now, but there is work in progress on adding such support:
https://github.com/sashiko-dev/sashiko/pull/389

Thanks
