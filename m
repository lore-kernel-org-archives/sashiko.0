Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6840939B975
	for <sashiko@lists.linux.dev>; Thu,  6 Aug 2026 07:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786002143; cv=none; b=atJrw7uPPXAgRPdTiGr/ggB9+PJDA47LdRGDyf6Uhf5A6oLdOOeFF5gNUPJ9OdPZ0NJJlXnTkn5jJIFLrtrsDUhR8lbEDalNApLrQLnzQnhSbepqn1gSqMcsaBH6xiqAfOSMZR9I0QjCXTGtd9G1BS0Z82Ss7ocjlGcCYKZww84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786002143; c=relaxed/simple;
	bh=uGIldl/Z2o3mbxQCTL4IocTTNwJ09id1x4dMDisfW+w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pjPQD2oZ29YqBttodIboVtBbKOYb5K7UMKAmvZ7QM7xJFPwnDvac2dWw7Xl7ECVBIHi2oE79FtN0dLNkjxhr1g1rT5vkbh+Bb9jRsO19fko7k3XIZk+BryUDzw+H2kcR53HFXQ9r68TB/iiaAVWK7g+lK1SYD4Jao4JMQJdJJAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=fpTo91nd; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="fpTo91nd"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1786002138; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=TsB0XArPEFrPV1B1/+cBDVJF9slgeW2ZX0prsJSHf8s=;
	b=fpTo91ndkZKtaBoRA8ah58EvshB1k/+CETcUEiCtfc4JcvazCx6Z2i6Z9I+NNC78eBrhyHa/Kvl9EyHxBiOskrw4WhVWVHVQ8a0j+8T3pIV5Ctzpt+TOvbCb96Yk5R7KyflmOGYB+brai5y7iTQQUJxnh3s5y+XC+wUB/Wg1VsY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R511e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0X8TBKlm_1786001815;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0X8TBKlm_1786001815 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 06 Aug 2026 15:36:56 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: sashiko@lists.linux.dev
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>
Subject: [PATCH 2/2] email: add policy for the ocfs2 subsystem
Date: Thu,  6 Aug 2026 15:36:54 +0800
Message-Id: <20260806073654.2510985-2-joseph.qi@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20260806073654.2510985-1-joseph.qi@linux.alibaba.com>
References: <20260806073654.2510985-1-joseph.qi@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 sashiko.dev/email_policy.toml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sashiko.dev/email_policy.toml b/sashiko.dev/email_policy.toml
index 26a6665..0570d35 100644
--- a/sashiko.dev/email_policy.toml
+++ b/sashiko.dev/email_policy.toml
@@ -276,3 +276,11 @@ cc = ["Miquel Raynal <miquel.raynal@bootlin.com>",
       "Pratyush Yadav <pratyush@kernel.org>",
       "Michael Walle <mwalle@kernel.org>",
       "Takahiro Kuwano <takahiro.kuwano@infineon.com>"]
+
+[subsystems.ocfs2]
+lists = ["ocfs2-devel@lists.linux.dev"]
+reply_to_author = true
+send_positive_review = true
+cc = ["Mark Fasheh <mark@fasheh.com>",
+      "Joel Becker <jlbec@evilplan.org>",
+      "Joseph Qi <joseph.qi@linux.alibaba.com>"]
-- 
2.39.3

