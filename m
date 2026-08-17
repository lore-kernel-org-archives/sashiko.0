Received: from mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D5B3BB69D
	for <sashiko@lists.linux.dev>; Mon, 17 Aug 2026 20:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786998023; cv=none; b=c48UK6Kvb3mTubL8Nm/dq6bra11xpndUihmIbg0nJiHywIvLZ/4XDGWc3i4co8P8fas+iStNftte4svqGSJgwm05PYKA4YkvRb1mLNW5UD0K+PJQwFjUlxeRwgS7OsvDxR1ltw5Q3hKWBklG87qJkZLVrSckgW8UZwaC2UBug2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786998023; c=relaxed/simple;
	bh=aKzRFlN+wa+yi0QlCfDbduVxghERY/ArzpGMrSlnSX8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tHu/Eg3TELQVYzCnC7A/9evYcGOxsNIxHcWYPIOHgzJrTp6zkGEWaJH0KvanmsrSh0Kwx69jYQ/byddjvR9jEiJ94WnpW9AH6kKGscoVz6W20fCyqHgjJ9yYaAZNw5mL5VzNFKk56fhkDtrdpPC79b5LhvzTw2sXODVT4NGEDWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Br4bvRRQ; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Br4bvRRQ"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=aKzRFlN+wa+yi0QlCfDbduVxghERY/ArzpGMrSlnSX8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786998019; v=1; x=1787602819;
 b=Br4bvRRQNOzGnP0wO11DcSF7Uwcs6L2MwS6+JHCjvJUSZ5v0M+G8Ae9iKO3ECFlefrJOPIit
 quTCl9GyRspui0oDo0itUqO3nnRst6Clxm7SxhgyYL6+TyBNRCoXTR5Z13947tarMwgOILeZvPH
 tch1lrxp80ni9wxoH6JmMPfk=
X-Envelope-To: sashiko@lists.linux.dev
Received: from castle.c.googlers.com (35.227.148.244)
	by mta11.migadu.com with ESMTPS id fff5e3c1b0b090c7;
	Mon, 17 Aug 2026 20:20:19 +0000
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: robin@snyders.xyz
Cc: sashiko@lists.linux.dev
Subject: Re: [Feature request] Support b4 prerequisite-patch-id dependencies
 when applying patchsets
In-Reply-To: <b27c34f3-4188-40e4-be65-e90a89890dc1@mail.infomaniak.com>
	(robin@snyders.xyz's message of "Wed, 12 Aug 2026 11:33:11 +0200")
References: <b27c34f3-4188-40e4-be65-e90a89890dc1@mail.infomaniak.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Mon, 17 Aug 2026 20:20:12 +0000
Message-ID: <7ia4h5ksebyb.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

robin@snyders.xyz writes:

> Hi,
>
> I ran into a Failed To Apply result in Sashiko for a kernel patch series that uses b4 prerequisite dependencies.
>
> Affected Sashiko patchset:
> https://sashiko.dev/#/patchset/20260812-submit-qcom-smbx-send-v1-v2-0-f504b8f9bfad%40snyders.xyz
>
> Lore thread:
> https://lore.kernel.org/r/20260812-submit-qcom-smbx-send-v1-v2-0-f504b8f9bfad@snyders.xyz/
>
> The series is based on:
>
> base-commit: 99b38cda3f4c486cfbc40f3c8ede1703594e9f13
>
> and declares five prerequisite patches using b4 dependency metadata:
>
> prerequisite-patch-id: 3d8a9cf43b5e5eac64a60aeec5e9c90880bcf792
> prerequisite-patch-id: de3e3b494f9644596cfa4cafc362ca0b48288c45
> prerequisite-patch-id: d5e22a0fe7cd55374f60d7c2cb14ed3df8f94e0b
> prerequisite-patch-id: 9eafa41402e97d6a3e5369bec46df4e9db3d2af6
> prerequisite-patch-id: 5638b901cd10773fa9485605f84b25a1dd826a84
>
> Those five prerequisites are the preceding qcom_smbx fixes series:
> https://lore.kernel.org/r/20260812-qcom-smbx-fixes-v1-0-eb48246be599@snyders.xyz/
>
> The SMB5 v2 series intentionally depends on that fixes series because
> both modify overlapping areas of
> drivers/power/supply/qcom_smbx.c. Applying the v2 directly to the base
> tree without first applying the declared prerequisites is therefore
> expected to fail.
>
> On the Sashiko page, the result is Failed To Apply, Baseline shows
> Selected: -, and no AI review is run. From looking at the current
> baseline/application logic, it appears Sashiko applies the patches in
> the current patchset to a candidate baseline but does not resolve and
> apply b4 prerequisite-patch-id dependencies first.
>
> Expected behaviour would be roughly:
>
> Resolve the base commit.
> Resolve each prerequisite-patch-id from public-inbox/Lore.
> Apply the prerequisite patches in dependency order.
> Apply the patchset being reviewed.
> Run the normal review on the resulting tree.
>
> b4 itself supports this dependency metadata, and b4 prep --check-deps can validate that the dependency chain is available and applicable.
>
> If automatically resolving prerequisite-patch-id is intentionally out
> of scope, it would still be useful for Failed To Apply to report that
> unresolved prerequisite metadata was present, rather than making the
> failure look like the submitted series itself does not apply.
>
> Please let me know if you would like any additional reproduction
> details or the exact b4 commands used to prepare the series.

b4 support is in progress:
https://github.com/sashiko-dev/sashiko/pull/389

Thanks
