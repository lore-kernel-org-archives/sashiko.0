Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5E140DFCF
	for <sashiko@lists.linux.dev>; Sun, 26 Apr 2026 20:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777236470; cv=none; b=dECzae+yAehhOTrQFc+yc5GqGyvabRsExVHV7KfQmhaIuUmKVUiXVYk3FKVcyh3SNVv3M9RejRMRIfKflZ513R1sQ4I5r4iXYMvBAgOMv15bpf71GmdFhDUy+42gG0/L+4s9BuuK5rhL8/P5ZKPkwaNvx8Bp/gXVfWfLRn3g3Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777236470; c=relaxed/simple;
	bh=iUIKMa037K2qC8a/0h8IANYcHVtLZXNcf5RIUCxM3aE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q2uBcPOZtGeHcbCd9tGidlPnSbPrAkxNVhd4lxM2aBwPhnJ3u7umWWg4lUwzeERIBYMYONj8swofHWwXaTT3ogBrZNzIMDXUHA4j0ABC0FgRY/p3egLxcnU9gNmJ8UIhtbEfd5sU3+AIhhsB84SZxHutmE78Gn7CrVuJYGV4eu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZMx8kNtI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZMx8kNtI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9582FC2BCAF;
	Sun, 26 Apr 2026 20:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777236469;
	bh=iUIKMa037K2qC8a/0h8IANYcHVtLZXNcf5RIUCxM3aE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZMx8kNtIM4+p0XsgnFYy18erwP1ckJpXWXXTfb+cITWmVMfCL5ZooMuzqKTR9SeUs
	 yDQBUY4PdSdaNxPvuqdRc7/syQ076dZ4LBIe4XXtPchulcGHYbVuOBmO3fQrv40hVW
	 rhAbHBo209sNSzwXup2bUoudMTz+DruKktEHfQZwxoGMv7yvKwn0Y8eeG3mtPreRxX
	 34gXmKsy7sOTJYeCIOIqyuNOS3+xJubBUQGDCHcYruoUNPSjawgZ7c+W2R6Er1EyC5
	 d4SHcsgoH7xkBe8y3aIk8qBtkmtkZi/gUHI5/3V6HviALdE2fpZNohCXeqX8sEZY7A
	 /IYYJ1+YTCtuQ==
From: SeongJae Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	sashiko@lists.linux.dev
Subject: Could we command Sashiko for "Failed to apply"? (was "Re: [RFC PATCH v2 0/7] Implement a new generic pagewalk API")
Date: Sun, 26 Apr 2026 13:47:45 -0700
Message-ID: <20260426204746.93567-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260426061148.944a69c2cb020b0d51f13f6a@linux-foundation.org>
References: 
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

+ sashiko@lists.linux.dev
- lists and people who might not interested in Sashiko discussion

On Sun, 26 Apr 2026 06:11:48 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:

> On Sun, 26 Apr 2026 14:57:12 +0200 Oscar Salvador <osalvador@suse.de> wrote:
> 
> > Also, I would like to thank Vlastimil, who helped me running this
> > patchset quite a few times through Claude, to catch some fixes.
> 
> Well dang, I wanted to do a Claude-vs-Sashiko cage match, but "Failed
> to apply".  Again :(
> (https://sashiko.dev/#/patchset/20260426125719.24698-1-osalvador@suse.de).

I also got [1] a "Failed to apply" yesterday.  For that, I was asking a way to
make this better for only DAMON patches.  But seems DAMON is not a single user
who getting this problem.

I'm wondering if we could have some kind of magic words for Sashiko, like the
syzbot has.  That is, replying to a patch with a magic words and the baseline
info like below makes Sashiko tries applying patches again with the given
baseline.

E.g., #sashiko-retry-baseline git://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git 0123456789ab

Never an urgent request, but just a brainstorming attempt.

[1] https://lore.kernel.org/20260425221630.81644-1-sj@kernel.org


Thanks,
SJ

[...]
