Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0C838734E
	for <sashiko@lists.linux.dev>; Tue,  1 Sep 2026 02:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788229209; cv=none; b=KoQ4s5NweO9FHGUyQcRTraeqcSHWvqR2c5aKb7WdTueypSTiXWE0OiVxg1OzjrQDw7FhBqhY+bX4QchbgjRVldl8nmcwgZ1JVdw6fktFfIxtgk4yu5cUQbmDQC+hbfbsUD/rQOVGtfns1rnJQL1quN6QbcMziSD97Mj3ZBvO8fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788229209; c=relaxed/simple;
	bh=7KmM5O/ZfaEA6k/bz2HVDEcTaSuB8J5Oj9LINYMbcmY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZJDsDHcdMUIg6x99ySBLWCl5h6zjrHJq3UAxHo5XBVB3WHcSvs1VEun/j7opVVzNIDd8Isf+Eh89EWpWKA+JNnW/ximZK+gJaBrgFN4lI8PlgTyOHhyXNSaASv3sbIUzETaHC4gVu/suORExoH6Zlh0gXDBBJv40v7mzMyBwHs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=RWjQL81F; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="RWjQL81F"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788229204; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=Wh+4O05CB/vlTmIUmQg5SxeRf3rTmhWy50TaZ2ziEwo=;
	b=RWjQL81FqtmXAWe0ATPjto6kwZ5O6bA5IhUmU6sQizYVwR8jvZDsUJAXESueCDgytOENaoeKWa1dQROgR3pLptdFLcBfsRd9XgDyyXvgcU27br93zgje7TY6H9A8LBTSzKnEtf05p9NLIZQYRzy452AaueS64qe6SIcRtsGKp7A=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0XA1RNMB_1788229203;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XA1RNMB_1788229203 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 01 Sep 2026 10:20:03 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: sashiko@lists.linux.dev
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>
Subject: [PATCH] email: update policy for the ocfs2 subsystem
Date: Tue,  1 Sep 2026 10:20:02 +0800
Message-Id: <20260901022002.543485-1-joseph.qi@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cc review comments to ocfs2-devel list as well.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 sashiko.dev/email_policy.toml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sashiko.dev/email_policy.toml b/sashiko.dev/email_policy.toml
index e6e4fb5..5b68eb1 100644
--- a/sashiko.dev/email_policy.toml
+++ b/sashiko.dev/email_policy.toml
@@ -320,7 +320,8 @@ reply_to_author = true
 send_positive_review = true
 cc = ["Mark Fasheh <mark@fasheh.com>",
       "Joel Becker <jlbec@evilplan.org>",
-      "Joseph Qi <joseph.qi@linux.alibaba.com>"]
+      "Joseph Qi <joseph.qi@linux.alibaba.com>",
+      "ocfs2-devel@lists.linux.dev"]
 
 [subsystems.linux-serial]
 lists = ["linux-serial@vger.kernel.org"]
-- 
2.39.3

