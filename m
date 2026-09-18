Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526A925B0B6;
	Fri, 18 Sep 2026 04:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789705525; cv=none; b=fzDXC2KSG5iL6YqAQgC2xgkhMVqPf0yCFEVYpW++8zhE2/zVEi7kS/VvvNGByh1y758baM9IbMjjWrGoKhNZmL/PmDI90kFbh6RkL1LryPIIK6/8e9MhKYSSF8lvjteXN87r3abmXJusmZ/hxsk9kVxI2OGfmKcKrnlS/s7fznU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789705525; c=relaxed/simple;
	bh=iGH3DUH6VuklBcZIraTyxJiU7x/rPZYQdrfEX2QivKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hhx6Mxkh5tcMfVFwf6LlyrsEf13ONiSrdEwfO+aWPdhD3leHdOXQj9ERsNvOfViuwyShBdFDnK2Jlx97wLKVnrWw9UIi1KW1rsueIAbwWjYcCdhorN/job0k9vbjSA9FhDZvlLSSes2xrHPizNfuQ9xK2UakvDf6iWLjfrRJ7M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VX7BR2lh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VX7BR2lh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D78011F000FF;
	Fri, 18 Sep 2026 04:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789705523;
	bh=cyet3U0TOY/t70+ejc3bmUU8cREeugIEtDcQrnLm16I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VX7BR2lh3d9GSIX7IwyrdrOizlvxC+8QjNcLKA40PHLTRXpqG8FBlnlKjgo8MjnnY
	 vkPCsq3eEVtS/WW24Wn1y9ZkeMT1W0IdlhQqmLNfMY0rTr5+XLM/d4WXlPthFb5/d5
	 +GzCioByXnpP8PqrcDmuDrTitgLpqHXpddT9yaJUsDHFlglKSlZKKUheAHBB/Hws1D
	 c2nfvnDNjRs1/oK68+IFHcX+OnQHSNggLBPb+3bXS2YDPxCFBClp4kmjyigg8rl+ia
	 ViBACLzPhrWAEkkQvUHbLtlwhcfNY/pcjRQ8ynL88+Bj6fSjbLsVwxjCEFvnkufuzy
	 rlbMAhIBVs4bQ==
Date: Thu, 17 Sep 2026 21:25:23 -0700
From: Kees Cook <kees@kernel.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: sashiko <sashiko@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>,
	Chris Mason <mason@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: sashiko & pre-existing bugs
Message-ID: <202609172122.425EFBD9@keescook>
References: <7ia4se37qwvk.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ia4se37qwvk.fsf@castle.c.googlers.com>

On Thu, Sep 17, 2026 at 11:30:23PM +0000, Roman Gushchin wrote:
> as some of you might notice, a couple of days ago sashiko stopped to
> report preexisting bugs together with not-yet-introduced new issues.
> Instead, it started putting them into the database. All M: and R: in the
> current MAINTAINERS file have full access to corresponding bugs.
> 
> There is a new "Bugs" button in the top right corner which is the access
> to the database. You don't need to create an account, invent a password,
> etc. It's all stateless.
> 
> If you're working on other tools which discover linux kernel issues
> and/or can generate reproducers/fix candidates and want to collaborate,
> please, reach out to me.

Oh cool! That worked very nicely; I'm all logged in and cringing at the
lists. ;)

-- 
Kees Cook
