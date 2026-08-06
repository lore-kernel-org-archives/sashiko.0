Received: from sxplsmtpa04-10.prod.sxb1.secureserver.net (sxplsmtpa04-10.prod.sxb1.secureserver.net [188.121.53.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B437C2E06EF
	for <sashiko@lists.linux.dev>; Thu,  6 Aug 2026 18:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.121.53.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786041529; cv=none; b=JjufFub48ZWkna2GQHqvlJS49UDUdG5I0WdwZ1iGGTc7h9b2giFLiFjqdCSYtQHXGrVk9RZgJMCPXqMGQ6udMLkXwY9gk+Bx0AFPMVaeRySGW1dEr6Ls4jy9b3Gt2QCK4FxjsOgGgjWuKSx9iZ21uf3QE3ZvSnWW5x91wPkpHtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786041529; c=relaxed/simple;
	bh=lMfhYIfkRTF/VVfuXjCRKVqHdgYelPIl2kcNjU31v68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KrMjlDVL8xrO3NmaB5hC+tpFEe17BvHBxKj8PcX0EZ1KMLQLYbXb/xvRYU86XeDQB6wm1EGkEIDccy80gRKZU4GJWlcaiXribOitzGZxsM/BoYOLJhRQmf6GhgtGMFkh6b8aTVtxAu4RX/dHU5codg2TMPXEuKTC4ES2O+2NXcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk; spf=pass smtp.mailfrom=squashfs.org.uk; dkim=pass (2048-bit key) header.d=secureserver.net header.i=@secureserver.net header.b=nS1FJNTX; dkim=pass (2048-bit key) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.b=e6wxrmf8; arc=none smtp.client-ip=188.121.53.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secureserver.net header.i=@secureserver.net header.b="nS1FJNTX";
	dkim=pass (2048-bit key) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.b="e6wxrmf8"
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id s2gYwB7KX4Ufds2gpwPvce; Thu, 06 Aug 2026 18:19:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1786040378;
	bh=NDBonwYgXxU3b2zazfJz11ECI3DjXjgK9BqrhwPwndc=;
	h=From:To:Cc:Subject:Date;
	b=nS1FJNTXmaNsL9hupJtQIUCWRUf7iJFp98SLqF3AoBx7xgZ2ZGQ6wWE1Mlm6RfWBQ
	 ZGMB5uFfJXMHjxudq4MKK1gJmALzFx197eNHpJ4aMEiX9ZU0xdDBsNX8w+4PCN6Vm7
	 vW9dcpo2d6WN4301oLvynk4+Ic64pajH5OVFiOhV545iZ/W1KPKBjsHOWdTYCisnZx
	 BoI38tG0884EYkOZK+BghX/bFGPSQ1bohnxFaG4GmNWirIUbJqUhIy13aAfX/PWejr
	 2wYwhFNnnZSgnjaGvJNCvmiUTLQRuTwbpmp0xjzg8KISfDAfE0h3R/dU9QULjo4waf
	 yHcagK2WzTaZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1786040378;
	bh=NDBonwYgXxU3b2zazfJz11ECI3DjXjgK9BqrhwPwndc=;
	h=From:To:Cc:Subject:Date;
	b=e6wxrmf8Y5n5UWFaz9db9PlKk+9GMqI1xK1Q8n3HS2Hwtfddzt3quqnox8I9c2FXx
	 ADAKQIWl7rOb1ZAHWFK6BalBd92/vfEh4aNBBaJFt/XpPipAmK+JVgDfh+nmsjaMUT
	 nX8aHtY7+hWNMQlFxP2qQzqbyEp4Ezn1VhRdlbeQotpekVQwLRPFg9a1sJ9sZeae+C
	 JjOoAHpIOai9UY79Ai/I2Dmi/ouNDa6CYbXJXI6fJ62a/SaZpmw+iXxHPRzn0z8skD
	 EpL9wrU3tQUQG28MS56cQXzm7dc+io4xc5JwMM4vAG+e7CYZQup1tGemkyFfP7fh6A
	 fF3xRTyuHZEdg==
X-CMAE-Analysis: v=2.4 cv=XvRQ/1F9 c=1 sm=1 tr=0 ts=6a74d039
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=FP58Ms26AAAA:8 a=VwQbUJbxAAAA:8 a=1WqHmL4-ZfkYfLk0R64A:9
 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 3b5cac1761b1d60b5de20a7495a31eb7:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Cc: debarbos@redhat.com,
	sashiko@lists.linux.dev,
	Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH] MAINTAINERS: remove git URL for Squashfs
Date: Thu,  6 Aug 2026 19:19:15 +0100
Message-ID: <20260806181916.617881-1-phillip@squashfs.org.uk>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfD6cw3pC7i21PgdCIB1rSMvoZGyHlfd/DpOjNSCJprdu30vCuLxo1uUp7Gv2Xx0VX2c+p8vwEmb9QXmXBgire8MMSGsIX2yjdxofnu2UTghTkeJVOhTq
 3P4XMicaardI1Irtd2IUXAPTVHz6YdiIUxZzQZIdUsWpVUrsUwUAJiqWjBZApO5nkDIAlBH020/VPdTpngdvGWP5mVL86X186J6eeBUh90ODMGveRNbSj+U0
 n2JCQIMm21HE/3YB5DEG4BXEiSml2LYIh9vG6WXMavUol+9v21INQWq7cTMOJ5Dy2GBqTV7WAYnl3X7A+qhI5+ClzXnAFhBI/6OeHJ4duJd2nR5azntNELJ+
 OtYHsjF3

The squashfs-next.git URL hasn't been updated for many years, and it now
doesn't exist.

So remove it from the MAINTAINERS entry.

Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5114e6db7307..bbf48ad8bdd1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25552,7 +25552,6 @@ M:	Phillip Lougher <phillip@squashfs.org.uk>
 L:	squashfs-devel@lists.sourceforge.net (subscribers-only)
 S:	Maintained
 W:	http://squashfs.org.uk
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pkl/squashfs-next.git
 F:	Documentation/filesystems/squashfs.rst
 F:	fs/squashfs/
 
-- 
2.47.3

