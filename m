Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2BCEEBB
	for <sashiko@lists.linux.dev>; Sat, 11 Apr 2026 18:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775931780; cv=none; b=Z0IZ1ioiWDn6aAL8Nq3G8TdkNkJBz0IesO1aezDlrcLvTx2KiaA5EeNJzpnsMA5TZ+juNVnTEfp9Q22nQacy7xO2SW4/A0FTiodMrya8Ln7YMH4G1YYV4C/nTfCjr1DuLxDAwaGcNdkWkPH0kfpifah83/RPZZOC7pN8UrodaiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775931780; c=relaxed/simple;
	bh=A8CH+dKWN/C705bA1HPHY90NFTYM5hSqpO8XPSJLGQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nONMQVJrmL3132D0NqNaewjfaD9SUYK3hbI5BcuTKR395/IU1l5NZX3oKa9dayzc9hhCi5ySGgSZDB3T0cuy7VyE0cnhzp97YJxegI061ZOt1NXA/oEZZ+Cx9IWZ9oIlqsjCfRa+Trfklwsi8bhWBS6kmhEhZpSfjcFS+n1tp/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZ3kw9gN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZ3kw9gN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4BDC2BCAF;
	Sat, 11 Apr 2026 18:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775931780;
	bh=A8CH+dKWN/C705bA1HPHY90NFTYM5hSqpO8XPSJLGQg=;
	h=From:To:Cc:Subject:Date:From;
	b=QZ3kw9gNZGSQjNuFuw25a+e6TfnBzSb0k+2gSA524CltQ1XDSo7FjcS2pNguXYaLM
	 +5EDMlEXym/orX5SjEb5z7VWSj5X6/bM36eMlNV+JCz+nTRTpQMRQJ2dOJ2haloBT0
	 aKH/jDj1dxdftvmloYhdkDaON11IVIA4447gkp5phCdtyj80cRcrzJZ62pPqlPyWl2
	 s7k/B2ncsE6tx5lMFdz0Q006HSC3Uc2aVZwavKQCb1Hz3ovfX1muFpN+aJQ5Jz+/NH
	 tTlXClYfLOb+yuZf6xAThtehp6TwVrmbaP/3tDTxKboCIq4yCi0TNrtCL/CPaiKpIL
	 jimM5dBnKjnqA==
From: SeongJae Park <sj@kernel.org>
To: sashiko@lists.linux.dev
Cc: SeongJae Park <sj@kernel.org>
Subject: [feature suggestion] fixup patch review
Date: Sat, 11 Apr 2026 11:22:50 -0700
Message-ID: <20260411182251.80335-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,


When a large patch series is posted and an issue on a single patch is found, it
is useful to post a fixup patch as a reply to the review, instead of posting
the entire new version of the series.  It is useful for doing quick reviews
without polluting mailing list and reviewer's inbox.  But it seems sashiko is
not reviewing such fixup.  Would it be possible to make sashiko understand and
review such fixup patches?


Thanks,
SJ
