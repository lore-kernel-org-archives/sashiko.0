Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52044334C39
	for <sashiko@lists.linux.dev>; Mon, 20 Apr 2026 16:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776704221; cv=none; b=SpVQ9Ud5Gqf/gXlRjdPyWh7ZyfsOSsMa8nTExSODrkIbIoGMOJ27yOdXlgORYtcaY1tezJX7APuaey3ez1aQACS6SqyrNpHFPYKlmxIxpQkzugTQDf5GlQdjRD0oMBi6LHy5lqyJW5mWhRdcnqg/vPmLSlR7aeqgZADzqM3xGUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776704221; c=relaxed/simple;
	bh=46XMmwV8lAy6HOOqkJtG3d0TY4KFFYiqjEC7cCbnbAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UNxllIi9y45qS2TFN/zkZ8psBKwQPX/t6xANHMw1VJZumFJO3xyCo0OLJBAf3ji0vzQJo5ETRu7ogwIO/2OpB5hGKXbwmPhnkksNGpeazztJXD99fPCRikuS5Au16bLwqSr5Zdw36xDcxRG2PErsuTu1RrUBzjvypAg/SkWEHtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VbGRO5Ld; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VbGRO5Ld"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E34B2C19425;
	Mon, 20 Apr 2026 16:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776704221;
	bh=46XMmwV8lAy6HOOqkJtG3d0TY4KFFYiqjEC7cCbnbAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VbGRO5LdbuyqX1CIbYuFJmdL7c77G6cwRMHmkMt3yWBCs4+ewj//bvhea6b1ixvAi
	 ubZkc0NLn55hSI07X0zX9f4o7bgg/N5HXgSnk5XmqjuxoiVTYVI2LMX2IKGSEUMpvP
	 oVZv3OOmmtELJkiIv8jtppuM7XpC+5xXGb++Dqs3NQAxHLtAzFrUuLWO13r+I/ZCS4
	 YMpjBnQ083EtqDaPFvr9TmKK3bEJSqL3dX7uEZ3xqrlNPHat0sknHntAvQ2rjfDu+N
	 IuLbfC/A0P68fSSANmr3Kcda6MRsCQDnRWEVj/ywQunl1wUEReCZW9QEs9Q1Zzav1I
	 NpGHOjH1fLSCQ==
Date: Mon, 20 Apr 2026 06:56:59 -1000
From: Tejun Heo <tj@kernel.org>
To: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	"sashiko@lists.linux.dev" <sashiko@lists.linux.dev>
Subject: Re: Delivering reviews over email
Message-ID: <aeZa23TrnGzjmgRT@slm.duckdns.org>
References: <7ia45x5tuj88.fsf@castle.c.googlers.com>
 <z4eztn7epx6kghtm3nyoiexhnbxxc755f5vvh73gtir3nra6yl@etqgkhrpx6r5>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <z4eztn7epx6kghtm3nyoiexhnbxxc755f5vvh73gtir3nra6yl@etqgkhrpx6r5>

On Mon, Apr 20, 2026 at 06:51:43PM +0200, Michal Koutný wrote:
> On Wed, Apr 15, 2026 at 01:04:39AM +0000, Roman Gushchin <roman.gushchin@linux.dev> wrote:
> > Sashiko is now able to send reviews over email.
> 
> Great job! E-mail interface is something I've been looking forward to.
> 
> > If you're interested in your subsystem to get email reviews,
> > please, write into this mailing list or me directly or send a PR changing
> > this file:
> > https://github.com/sashiko-dev/sashiko/blob/main/sashiko.dev/email_policy.toml
> 
> Roman, IIUC, this considers maintainers as all non-ML addresses that are
> CC'd in the original posting?
> 
> > Please, make sure all maintainers in the subsystem are onboard.
> 
> Tejun, Johannes, would you be OK with the change below?

Yeah, that sounds great.

Thanks.

-- 
tejun
