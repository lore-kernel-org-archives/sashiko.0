Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8FB397B09
	for <sashiko@lists.linux.dev>; Wed, 22 Jul 2026 02:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784689053; cv=none; b=c/dIlQKdZ+lPahkMtlVc0ETkSacvH/lRUk9J07Nt1eU9w+Qt00Mwvlv/ryjIJH5ZkZ6ahyIL+29iqfrEAAdzZP75ZcawJL+AFBiMba2thCyvPGY0pAJ7j35TU94HvD2VBsGPz2HaB8eFtgsD9BBA9DN+LI/4IWttXra1AwK6HKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784689053; c=relaxed/simple;
	bh=CqWX0tvR2TKDOwLZG2xwAt6tjyule3Ypm59oI374Hxg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NlQvcX5MhpJMqhxAfbWKEcIaZxBcdb29bJfTg0R5ejJ9Ht+BXCeVnHua2KOmnZGDDQsGzY34Fd+6LTyWbzAME1HFCKrvdQs82NBjIk/zYww/SeBrIwGBXCrML5O3MBaaeqMfngLXR33QbQG6jaEid+LDP7/5Npnz3GPCRoQ89uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=QF0v4HfO; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="QF0v4HfO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=He
	8FhnhbTCxFu+S9BbDSS3TDTva11o86i/JS57O4lpo=; b=QF0v4HfO/WxRZa6Zn5
	QQzpEtSpyOtQZLOa95JgW2EUhN9+Jv+kv8YGcCfU3wGu84T/FGRXRZZEUlWuMzwp
	mW5pIVlkOMpRyxmC44GSU0hGMBhjGmk1NDFvfpRG1tZczi7twKH/nsRtrS+9+VFg
	SkLlVMX+6V8TWU1GGpWNrscfk=
Received: from XLL-9950X.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgC3mfiMMWBqsCoLHw--.42050S2;
	Wed, 22 Jul 2026 10:57:17 +0800 (CST)
From: Longlong Xia <xialonglong2025@163.com>
To: sashiko@lists.linux.dev
Cc: Longlong Xia <xialonglong@kylinos.cn>
Subject: [PATCH] ui: disambiguate patchset links with shared message IDs
Date: Wed, 22 Jul 2026 10:57:17 +0800
Message-ID: <20260722025717.818873-1-xialonglong2025@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgC3mfiMMWBqsCoLHw--.42050S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw4UJr13KrWftF4kJr4rGrg_yoW8uFy5pr
	WxKrySgF4rWFyrArWfKa1IvrW5Cwn7Wr4qgrZ3CFyxta15JFyUtFyfta1vvayUXFZ5G39F
	gFyvgrn8Ww4kCrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UgYFZUUUUU=
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC3A0iG2pgMY32jwAA3n

From: Longlong Xia <xialonglong@kylinos.cn>

Repeated local Git submissions use the same synthetic cover Message-ID
when they target the same revision range. Because the patchset list uses
that value before the database ID, each row opens the first matching
patchset and can display stale review results.

Use the unique patchset ID before falling back to Message-ID. Keep slugs
as the preferred route for forge submissions. Add a regression test for
the route ordering.

Fixes: d46ec40c1a66 ("feat(api): support Message-ID based lookups for patchsets and messages")
Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>
---
 src/api.rs        | 20 ++++++++++++++++++++
 static/index.html |  2 +-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/src/api.rs b/src/api.rs
index 2800743..a90c88f 100644
--- a/src/api.rs
+++ b/src/api.rs
@@ -1235,3 +1235,23 @@ async fn forge_webhook(
         "message": format!("{} {} queued for review", forge.name(), action)
     })))
 }
+
+#[cfg(test)]
+mod tests {
+    #[test]
+    fn patchset_list_prefers_unique_id_over_message_id() {
+        let index = include_str!("../static/index.html");
+        let route = index
+            .lines()
+            .find(|line| {
+                line.contains("const target = `#/patchset/")
+                    && line.contains("encodeURIComponent(p.")
+            })
+            .expect("patchset list route not found in static/index.html");
+
+        assert!(
+            route.contains("encodeURIComponent(p.slug || p.id || p.message_id)"),
+            "patchset list routes must prefer the unique database ID over the potentially shared message-ID: {route}"
+        );
+    }
+}
diff --git a/static/index.html b/static/index.html
index 9f424c7..f150c0b 100644
--- a/static/index.html
+++ b/static/index.html
@@ -1964,7 +1964,7 @@
 
                     const clickHandler = (e) => {
                         if (e.target.closest('.copy-btn')) return;
-                        const target = `#/patchset/${encodeURIComponent(p.slug || p.message_id || p.id)}`;
+                        const target = `#/patchset/${encodeURIComponent(p.slug || p.id || p.message_id)}`;
                         if (e.button === 1 || e.ctrlKey || e.metaKey) {
                             window.open(target, '_blank');
                         } else if (e.button === 0) {
-- 
2.43.0

