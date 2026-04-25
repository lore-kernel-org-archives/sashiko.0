Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E4B54723
	for <sashiko@lists.linux.dev>; Sat, 25 Apr 2026 22:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777155399; cv=none; b=lQg859ZZkiYQPi4h4FPr28taVwkUil2oXwkZKsm+wHy0Tsw+2xag4S4K3uRMWHvQ80qlPkIbwlGUlY3CWE9TeiQnqjvlGXEOi/oOHL+bM5OWxD0qdvI0EY/ipMIUAquUyIAI2weVAzV2LKAX7rarxc9MxqtgrlYLlZwZhbc2gxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777155399; c=relaxed/simple;
	bh=THixDnxbFNZEFM+qFk5i1zATA1Hb/mvXOuUBxaLn6SI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UIlzm4/O6EltHCHEE1jirZgkaKaBNnY++PUxqPs5Uw2KH0Q7I6+Jsy/03KdbXjIjk685viQndY6pYTLPvdIttMUtb5CNtRXVu0XXEubgCiK3iHXN6FxY0c7xYnlk9SvAv+iJB2DAnT1KuLTiqcFAq1oP1SVCqLxh6IbjAHrTiic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fvHcPU7v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fvHcPU7v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13FDEC2BCB0;
	Sat, 25 Apr 2026 22:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777155399;
	bh=THixDnxbFNZEFM+qFk5i1zATA1Hb/mvXOuUBxaLn6SI=;
	h=From:To:Cc:Subject:Date:From;
	b=fvHcPU7vHW+2V+UuzPdrr396DJoPMj60bgouKY8E9WiFbBoPHkZ6pFOPy07KVGgpR
	 +pLpR2nWX0aHiIXvlgssjqurZ0Zs31JTVyETCOslPuKtbvQ5gR2oYjQ8/sBcNXHkWS
	 CLnb1Mb/wiqEi2Z0bDO2xjr+FTq6IKiTkEIxlbbpOkwZrJBstJCtSLJMG3Z6zYQcb7
	 93X//elYAi6xrSUYVLFNtQPtXY7NFFzWVbFgF1WbATbXVrzkhASZzOHi8DxwSVi+EH
	 HLKWVczbjWtwYbf9HBNSZJE8OHxb45q9SvMu83JIyRUKUcfSrVs/ERXIGfaL540Jas
	 rvEJxr5iN0KxA==
From: SeongJae Park <sj@kernel.org>
To: sashiko@lists.linux.dev
Cc: SeongJae Park <sj@kernel.org>
Subject: Using mm.git or damon/next for DAMON patch baselines
Date: Sat, 25 Apr 2026 15:16:29 -0700
Message-ID: <20260425221630.81644-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Sashiko team,


DAMON patches are usually based on a commit of damon/next [1] that based on
mm-new.  So the baseline commit that added by git on the patch should be
available on damon/next.  Or, mm-new should almost always the right choice for
the baseline.

But seems Sashiko is not aware of [2] that, and therefore sometimes fais
reviews at patch applying step.  Could we make Sashiko to use mm trees or the
baseline commit on damon/next tree?

I was thinking changes like below might work, but I don't know how to
read/write/test Rust code...  I also have no idea about how I can make Sashiko
to try finding the baseline commit from damon/next tree.  So just asking here.

'''
diff --git a/src/baseline.rs b/src/baseline.rs
index 5eb3303..c3dc628 100644
--- a/src/baseline.rs
+++ b/src/baseline.rs
@@ -317,10 +317,12 @@ impl BaselineRegistry {
         candidates.sort_by(|a, b| b.1.cmp(a.1).then_with(|| a.0.0.cmp(&b.0.0)));

         // Check for Linux-MM special handling
-        // If the top candidate is akpm/mm or linux-mm, OR the subsystem is MEMORY MANAGEMENT
+        // If the top candidate is akpm/mm or linux-mm or damon, OR the
+        // subsystem is MEMORY MANAGEMENT
         let (top_url, _top_branch) = candidates[0].0;
         let is_mm = top_url.contains("akpm/mm")
             || top_url.contains("linux-mm")
+            || top_url.contains("damon")
             || matched_subsystem_name
                 .as_deref()
                 .map(|s| s.eq_ignore_ascii_case("MEMORY MANAGEMENT"))
'''

[1] https://origin.kernel.org/doc/html/latest/mm/damon/maintainer-profile.html#scm-trees
[2] https://sashiko.dev/#/patchset/20260425203309.108879-1-sj%40kernel.org


Thanks,
SJ
