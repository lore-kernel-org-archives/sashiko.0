Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090F4175A80
	for <sashiko@lists.linux.dev>; Wed, 15 Apr 2026 01:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776216635; cv=none; b=NYPalbKN3JDsH3PiGoUVa24dvUqeLS+xn++EpcEQEvZtsKFSXUCpA8iBB2tzkElBUPp4SPvaj+LGIGe8Q0mhN3aX9x+qNmTD+gUGw6su0LHGZ9QdoG9vcSXtFP7drnS7AucizZVYYaPyJbT3UVQIdvwRIISEJICTxLFFz5T14g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776216635; c=relaxed/simple;
	bh=ZPK8ZSL6oJGe9iFJqucVRZOn+2ugl7ZZ4aBNAzp638s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CcBirIGQqJkZfuLoJPBEwmuA0QpIQcfS7GTm97YYmnE6JEtUmeWNtygdhlKNDEpwSDFBHTzh2qKfHM+aEKshNnINuX4DTc8AW0k6L/cMju3Ql59tIr492CyDbU9FdIDo+5BJLhz7gNI6YSN3Q6QU+oTVPZ/hh/+XUbksPgLdHJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4dxEbIp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4dxEbIp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70AC9C19425;
	Wed, 15 Apr 2026 01:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776216634;
	bh=ZPK8ZSL6oJGe9iFJqucVRZOn+2ugl7ZZ4aBNAzp638s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J4dxEbIpUQvBWutT4OV07PlJ+s7N7azBJRXptJ06+ZJnvbU3KkyyiHp4Lbgf6VhAs
	 arLoCwz+uIJg1zZaH0b/pu9bhGIWToRsZoH45+I6QVnyCmVLb6wL0KpbrQz8wAqhdR
	 J/Zl6SHXjdEvrkcKxCm7ILCfnypkfOzF3Z3shn/Dz6vg7cb3FKzOFxUsbNi3XZV1lh
	 voQ1pq9eUduY8UVCXT5qgrhcUsjraNZJaQuuZoVMVEQRXhrIHSqTIJCzm1tyfife+y
	 jSsW5mhrD9tCDpoN4BYb2iVRA96zwFhpGevvxJOrIzxTjzCRnJSpqRxUJt+mYRY0as
	 ga4AGHjuJNDoQ==
From: SeongJae Park <sj@kernel.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: SeongJae Park <sj@kernel.org>,
	sashiko@lists.linux.dev
Subject: Re: [feature suggestion] fixup patch review
Date: Tue, 14 Apr 2026 18:30:31 -0700
Message-ID: <20260415013032.76585-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <7ia4wly9t4cw.fsf@castle.c.googlers.com>
References: 
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 15 Apr 2026 01:11:11 +0000 Roman Gushchin <roman.gushchin@linux.dev> wrote:

> SeongJae Park <sj@kernel.org> writes:
> 
> > Hello,
> >
> >
> > When a large patch series is posted and an issue on a single patch is found, it
> > is useful to post a fixup patch as a reply to the review, instead of posting
> > the entire new version of the series.  It is useful for doing quick reviews
> > without polluting mailing list and reviewer's inbox.  But it seems sashiko is
> > not reviewing such fixup.  Would it be possible to make sashiko understand and
> > review such fixup patches?
> 
> Hi SJ,
> 
> sorry for the late reply!

No worries, it is never urgent!

> 
> I like the idea but realistically I'm not sure I'll have time to work on
> it short-term. These follow-up fixes are often too context-heavy, e.g.
> are raw untested ideas or are drop-in replacements for some patch in the
> series, so accurately handling all edge-cases might be not exactly trivial.

Thank you for kindly explaining the challenges, I totally agree that.  Having a
sort of command-like reply rule for giving the context in easier and explicit
way, like syzkaller [1], might make it easier, though?

Nevertheless, this is never a urgent feature request but just an attempt to do
FWIW brainstorm discussion.  So no push, no rush!

[1] https://github.com/google/syzkaller/blob/master/docs/syzbot.md#testing-patches


Thanks,
SJ
