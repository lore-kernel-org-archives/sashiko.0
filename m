Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F9D39B975
	for <sashiko@lists.linux.dev>; Thu,  6 Aug 2026 07:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786002140; cv=none; b=PhPZwv2fXOas2mkmj7dwmZJzWcNgHAZsKt3sxuYubp/FiA0xnjXDDnrqd7kPH3y/bK8d/ShI2RrPtv6aCWsrllC1o7QqbY/Lb6M9msheiMxleVROow9mmm01Fn/qc417fwmQvM53ErDmNR4CceAK017J9QagdZSMdEEnVPxc5+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786002140; c=relaxed/simple;
	bh=XPMmSz/9KmDaIOO18/xUg5j8eA7wxFiKcGBSLT+dNKo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b143hXVnOvVGkX292IbhQ/tSMOgP8AzLOnC6LV1SiV9tRtJuCMJgtGg7yTgzpfkx72s52n7g5P6+QGs7yX6ixqj92mWlV30bjdPvxv8v9JsFxE7AWGU99BccKwfcXJmreALfptHEC7eIrnP7V1TyN99q7yEA0Q6cgdwUppJaUhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=WseQD8dB; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="WseQD8dB"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1786002136; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=8irwKXFf1jVa5+CDSFuIg2LIYuBG/6OdDcPPCcW5KCA=;
	b=WseQD8dBgga0bGDp9bxbLIIzJM1BJGjEOqJsWLhCsfCG5kJ9kaOi/DlhHkK9b8hoPMlqE7i2L/iqNh8yvg5EOy8SBAwl4Bp6KV4Xe0R0e+zsudverNs/ddeIMtL+FavDVNPD99jxYaucvGO5KGNatlqb9Z+P7Vc7dQfcXxAd/3k=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R241e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0X8TFlcY_1786001814;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0X8TFlcY_1786001814 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 06 Aug 2026 15:36:55 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: sashiko@lists.linux.dev
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>
Subject: [PATCH 1/2] k8s: add ocfs2-devel to tracked mailing lists
Date: Thu,  6 Aug 2026 15:36:53 +0800
Message-Id: <20260806073654.2510985-1-joseph.qi@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 sashiko.dev/base/app/sashiko-k8s.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sashiko.dev/base/app/sashiko-k8s.yaml b/sashiko.dev/base/app/sashiko-k8s.yaml
index 34e3875..8ce80e2 100644
--- a/sashiko.dev/base/app/sashiko-k8s.yaml
+++ b/sashiko.dev/base/app/sashiko-k8s.yaml
@@ -91,7 +91,7 @@ spec:
                 live-patching,openvpn-devel,platform-driver-x86,linux-arm-msm,
                 linux-modules,nouveau,nova-gpu,ntb,selinux,linux-raid,linux-rt,linux-rtc,
                 linux-can,linux-target,linux-hardening,linux-security-module,linux-unionfs,mfd,linux-leds,mhi,
-                linux-mtd
+                linux-mtd,ocfs2-devel
             - name: SASHIKO__REVIEW__CONCURRENCY
               value: "24"
             - name: SASHIKO__SMTP__SENDER_ADDRESS
-- 
2.39.3

