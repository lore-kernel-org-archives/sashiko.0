Received: from smtp-bc0d.mail.infomaniak.ch (smtp-bc0d.mail.infomaniak.ch [45.157.188.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F103BA220
	for <sashiko@lists.linux.dev>; Wed, 12 Aug 2026 09:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527196; cv=none; b=fXRyk/+p653UB2f63VzeSVy1FfvQoL9IXGU64sUHGJUnhq82TGXWqA2jsxq+bj4RSPir4x7Ykp+0nWrgEerUYYSH5y3vN9B9USV4dGhklTRvCPNEBgYwWxFeOnHayA99BipEfiUKxUrjxEwQs5d7aGKMHYya7IMy0xPg8eWvgfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527196; c=relaxed/simple;
	bh=HOgVZufTYPIkfh8eXKWUSg7yWVpKfy0RLpUptSLgAYQ=;
	h=Subject:Message-ID:Date:From:To:MIME-Version:Content-Type; b=FEpJHNOS64P/1et7ni+CMvAGCHVEyV2O1R+vlud2halL+xk0KdSj6OylchT/1z+cDEN1H+trQ1hPf4M+xDKtcghEHc1f4jglSdw+wsnQq7iL4z1duR51E7KhQLRbtRpUghivdSwVSIqCl4KGhd61Lo71uYnMpSARn4AGruoOqAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=snyders.xyz; spf=pass smtp.mailfrom=snyders.xyz; dkim=pass (2048-bit key) header.d=snyders.xyz header.i=@snyders.xyz header.b=cuBMT/2Y; arc=none smtp.client-ip=45.157.188.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=snyders.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snyders.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=snyders.xyz header.i=@snyders.xyz header.b="cuBMT/2Y"
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4hKjw75h8VzYjd
	for <sashiko@lists.linux.dev>; Wed, 12 Aug 2026 11:33:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=snyders.xyz;
	s=20251118; t=1786527191;
	bh=HOgVZufTYPIkfh8eXKWUSg7yWVpKfy0RLpUptSLgAYQ=;
	h=Subject:Date:From:To:Reply-To:From;
	b=cuBMT/2YbTTNijAedCHYKihZzZ5crgV2PKePaQDgDQf2xQjrOE14J7WX0McOo/aWm
	 3JGvRWZ/zONHSdtlhRLy9PVT6wwoUgl7pq5vElkX9DEPY3JRh64dTMdV55DrAFWYou
	 bsW/8QwS2RfXAy4iisN33TgKMxk4vDhXlVVeXryDAFAfw/YzkM9y/EKi4OR2H6Khp+
	 Xb7vd0pac1fpW69pW1j9gIqKcC0YzTxlzAD+F1PvAJJgDCXVtx8Okq2ywU28a2N1G6
	 K4lg3IwSAcrQ+JmpIp2WEqnUTgQhBjeaD419Uu53QkUahL8uF97VwCaxdlT8ztWnML
	 tNup1HDRK/Yjg==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4hKjw721KHzCp3
	for <sashiko@lists.linux.dev>; Wed, 12 Aug 2026 11:33:11 +0200 (CEST)
Subject: [Feature request] Support b4 prerequisite-patch-id dependencies
 when applying patchsets
Message-ID: <b27c34f3-4188-40e4-be65-e90a89890dc1@mail.infomaniak.com>
Date: Wed, 12 Aug 2026 11:33:11 +0200
From: robin@snyders.xyz
To: sashiko@lists.linux.dev
Reply-To: robin@snyders.xyz
X-WS-Location: eJxzKUpMKykGAAfpAmU-
X-Mailer: Infomaniak Workspace (1.3.1329)
X-WS-User-Origin: eyJpdiI6ImZvWmZxbEo4T21UcEUvSG1xZHNVR0E9PSIsInZhbHVlIjoiUk43UmRLNmVNTlAxT0NVdTMwN2c2Zz09IiwibWFjIjoiOTkxYzI3NmZiMGUzMGFjY2Q2MzZjNTA5MTEwZDczMzRiNDFiNjVlMWEwMDYwZjcwZWMxM2UyMTY4ODVkZTY3MSIsInRhZyI6IiJ9
X-WS-User-Mbox: eyJpdiI6Ii9EeEZoRkJSUU5NS3RtdDJaRGdvZnc9PSIsInZhbHVlIjoiemtNZ1QvZ3BwWHNLaHNWWUNwdnRiUT09IiwibWFjIjoiOWE2ZTUyMmE2MzhiMDY3NTYwOGI0Y2U1ODQ0YTc0ZTEzYWE5MjU2YWNkNzFiODBkYzc2NGFkMjVlNzdhZjNjZiIsInRhZyI6IiJ9
X-WS-LOCALE: fr_FR
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Infomaniak-Routing: alpha

Hi,

I ran into a Failed To Apply result in Sashiko for a kernel patch series th=
at uses b4 prerequisite dependencies.

Affected Sashiko patchset:
https://sashiko.dev/#/patchset/20260812-submit-qcom-smbx-send-v1-v2-0-f504b=
8f9bfad%40snyders.xyz

Lore thread:
https://lore.kernel.org/r/20260812-submit-qcom-smbx-send-v1-v2-0-f504b8f9bf=
ad@snyders.xyz/

The series is based on:

base-commit: 99b38cda3f4c486cfbc40f3c8ede1703594e9f13

and declares five prerequisite patches using b4 dependency metadata:

prerequisite-patch-id: 3d8a9cf43b5e5eac64a60aeec5e9c90880bcf792
prerequisite-patch-id: de3e3b494f9644596cfa4cafc362ca0b48288c45
prerequisite-patch-id: d5e22a0fe7cd55374f60d7c2cb14ed3df8f94e0b
prerequisite-patch-id: 9eafa41402e97d6a3e5369bec46df4e9db3d2af6
prerequisite-patch-id: 5638b901cd10773fa9485605f84b25a1dd826a84

Those five prerequisites are the preceding qcom_smbx fixes series:
https://lore.kernel.org/r/20260812-qcom-smbx-fixes-v1-0-eb48246be599@snyder=
s.xyz/

The SMB5 v2 series intentionally depends on that fixes series because both =
modify overlapping areas of drivers/power/supply/qcom_smbx.c. Applying the =
v2 directly to the base tree without first applying the declared prerequisi=
tes is therefore expected to fail.

On the Sashiko page, the result is Failed To Apply, Baseline shows Selected=
: -, and no AI review is run. From looking at the current baseline/applicat=
ion logic, it appears Sashiko applies the patches in the current patchset t=
o a candidate baseline but does not resolve and apply b4 prerequisite-patch=
-id dependencies first.

Expected behaviour would be roughly:

Resolve the base commit.
Resolve each prerequisite-patch-id from public-inbox/Lore.
Apply the prerequisite patches in dependency order.
Apply the patchset being reviewed.
Run the normal review on the resulting tree.

b4 itself supports this dependency metadata, and b4 prep --check-deps can v=
alidate that the dependency chain is available and applicable.

If automatically resolving prerequisite-patch-id is intentionally out of sc=
ope, it would still be useful for Failed To Apply to report that unresolved=
 prerequisite metadata was present, rather than making the failure look lik=
e the submitted series itself does not apply.

Please let me know if you would like any additional reproduction details or=
 the exact b4 commands used to prepare the series.

Regards,
Robin Snyders
