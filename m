Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6A33E168A
	for <sashiko@lists.linux.dev>; Wed, 22 Jul 2026 03:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784691113; cv=none; b=Rgk5Gw3pfTZGMhcs35Vi974w5vzYXRP07Xj1vsxUnlkjOXpdQUkpSH8UMEzxxJYZD4V1suwHw3opich8DC1quwKYZTRgYrnkbivP5CiUBYn/7yYmUkrkB5V4APhoDyKoh/bvKDH9fsYrycj6mMbpGT93WcCupWt34o3ikTwV4Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784691113; c=relaxed/simple;
	bh=ypSBIkKzM2P3Hz3HMQQqaT4Ak6cWjbxFtPA+JXd4Wlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LqikdPMxAKH7rA4HbYZY76ztZni4En8Incr81Gk1yd2JDzGij2Dld86sOYpgcGYbIxqjGYgLd4ejmULkr17QSAPq0OJfUDVFKOZccWxL4HP3yf4pbPj7rqJZp3KHobnzgv13QNkPQ3kAzK+y9QJQhcl4bxww3j+ru/YrutfaE2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=p3xdlUti; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="p3xdlUti"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=yf
	/wTQ/hYWLZAj6mhnyCY4ZYYAVONwisFVw0+tw9r5M=; b=p3xdlUti35FiG5zOsf
	sumJsaFy8Hcz+oWtMHiMPYYGGUKtqWEqR9sfa0AYcDqE76WkayodP33OiM86xabf
	fetZ0pkPASCjYSsKSoRF8hk4n1RXVXJU4Tz1l1oNB/wnyX6s1PGb4Yf1xbwNGlLs
	aVR6gvlclyAY7AQ4D5lNeYbnk=
Received: from XLL-9950X.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wAXHxmXOWBq6jjDKw--.33067S2;
	Wed, 22 Jul 2026 11:31:36 +0800 (CST)
From: Longlong Xia <xialonglong2025@163.com>
To: sashiko@lists.linux.dev
Cc: Longlong Xia <xialonglong@kylinos.cn>
Subject: [PATCH v2] ui: disambiguate local patchset links
Date: Wed, 22 Jul 2026 11:31:35 +0800
Message-ID: <20260722033135.850330-1-xialonglong2025@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722025717.818873-1-xialonglong2025@163.com>
References: <20260722025717.818873-1-xialonglong2025@163.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXHxmXOWBq6jjDKw--.33067S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw4UJr13Kr1UCFyDAr1fJFb_yoW8CF4UpF
	yktryfZrs8XFy5Z397KrW2vryrCw17GrWktrs0kF4xtan0qFWxKrW8ta1UZ34UJFZ5Ww47
	WFyvgrn8Xw4FkrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UgYFZUUUUU=
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC3BgnIGpgOZilHgAA3T

From: Longlong Xia <xialonglong@kylinos.cn>

Repeated local Git submissions use the same synthetic cover Message-ID
when they target the same revision range. Because the patchset list uses
that value before the database ID, each row opens the first matching
patchset and can display stale review results.

Use the unique patchset ID for synthetic local Message-IDs and commit
SHAs. Keep slugs as the preferred route for forge submissions and retain
stable Message-ID links for mailing-list submissions.

Fixes: d46ec40c1a66 ("feat(api): support Message-ID based lookups for patchsets and messages")
Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>

Changes in v2:
- Use numeric IDs only for synthetic local Message-IDs and commit SHAs.
- Preserve stable Message-ID links for mailing-list submissions.
- Drop the source-level regression test.

A broader database-level fix is proposed in
https://github.com/sashiko-dev/sashiko/pull/211; this patch is limited to
the UI ambiguity on current main.
---
 static/index.html | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/static/index.html b/static/index.html
index 9f424c7..4f50e7f 100644
--- a/static/index.html
+++ b/static/index.html
@@ -1964,7 +1964,12 @@
 
                     const clickHandler = (e) => {
                         if (e.target.closest('.copy-btn')) return;
-                        const target = `#/patchset/${encodeURIComponent(p.slug || p.message_id || p.id)}`;
+                        const isLocalGitSubmission = p.message_id &&
+                            (/^[0-9a-f]{40}$/.test(p.message_id) ||
+                             p.message_id.includes('@sashiko.local'));
+                        const routeId = p.slug ||
+                            (isLocalGitSubmission ? p.id : p.message_id) || p.id;
+                        const target = `#/patchset/${encodeURIComponent(routeId)}`;
                         if (e.button === 1 || e.ctrlKey || e.metaKey) {
                             window.open(target, '_blank');
                         } else if (e.button === 0) {
-- 
2.43.0

