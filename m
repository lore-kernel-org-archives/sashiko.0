Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A771B1EB5FD;
	Sat, 16 May 2026 15:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778946348; cv=none; b=STfzi50sxDBXsiTv+suoHbraLFMdoU3DQ07bttTFjb/xNzYux1RFZX7kyb+rDPFTi0pY+7lEXJg9lp2mlljlAOuq9cITenPLS7KWE84bq9fFvf3hb2/WtNcsNg4m0HdsHQ12NwnGlQM4Tavej1YXeBTTrY9oRicFCdwHFm7c7sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778946348; c=relaxed/simple;
	bh=pRFVmoNmf0bNFcvUJeUo1t7U8gYZLp7kTChwioajW+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4W05xqXoAEsRkY0/7ZJBgFtm4yTBSI+eGkntJN0v4CbxWe4qsWNft2EkY4wZfiuQxNns31rsBPXYXVGIqUqId5rGhoPLRRBvJo7Y7puLyq/7pdCX+/GbzMsiAGgpy8j0ZjR2Dp3mrsp4KEW5z4W1zZPzELcyO2ryMRhOppcFcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=g5N8A6de; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g5N8A6de"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56847C19425;
	Sat, 16 May 2026 15:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778946347;
	bh=pRFVmoNmf0bNFcvUJeUo1t7U8gYZLp7kTChwioajW+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g5N8A6deBHMcodEqljjw24yZ/uciuNlZqa3bw4X+wtvCAzVLxIGyBxrxlqwOtaeh4
	 OXF72/zT6p6yoQZ+smtijIu4GbKkyYIN8J0/ysrjYBVtWUGwU0ajD1rnhhw5d2E6ol
	 ydj991+T3gLLxEQq8OcI4bOR6v26pc4SgNrj1XjQ=
Date: Sat, 16 May 2026 17:45:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Konstantin Ryabitsev <mricon@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk@kernel.org>, sashiko-bot@kernel.org,
	sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev,
	Linux Kernel Workflows <workflows@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	devicetree@vger.kernel.org, kfree@google.com
Subject: Re: Stop false review statements
Message-ID: <2026051631-trolling-juggling-da1c@gregkh>
References: <20260516-upbeat-tody-of-feminism-4ab00a@lemur>
 <D659E814-069C-439A-B816-1BC383F38E1F@linux.dev>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D659E814-069C-439A-B816-1BC383F38E1F@linux.dev>

On Sat, May 16, 2026 at 08:41:43AM -0700, Roman Gushchin wrote:
> 
> > On May 16, 2026, at 8:20 AM, Konstantin Ryabitsev <mricon@kernel.org> wrote:
> > 
> > ﻿On Sat, May 16, 2026 at 05:11:28AM -0700, Guenter Roeck wrote:
> >>> On Sat, May 16, 2026 at 10:05:02AM +0200, Krzysztof Kozlowski wrote:
> >>> What the hell is that:
> >>> 
> >>> https://lore.kernel.org/all/20260515190707.033BDC2BCB0@smtp.kernel.org/
> >>> 
> >>> As a bot you CANNOT MAKE a Reviewer's statement of oversight. You are
> >>> not a damn human do be able to make such statement. You are a bot, a tool.
> >>> 
> >> 
> >> Where exactly do the rules say that ? I seem to miss that.
> >> 
> >> There is a policy document about _contributions_ made by AI, but I don't
> >> see the one that says that AI agents must not provide Reviewed-by: tags.
> > 
> > From my perspective, AI agents must NOT use the Reviewed-by tag for the
> > following reasons:
> > 
> > - We consider this a "person-trailer" and it implies agency
> > - Adding yourself to a commit via a trailer is a *binding responsibility* for
> >  the change. A lot of tooling will cc the Reviewed-by addresses on follow-up
> >  messages regarding code in this commit. If the address is bogus or doesn't
> >  go to a developer, this is both wasteful and potentially frustrating.
> 
> Hi Konstantin!
> 
> The goal here is to inform maintainers that sashiko has successfully reviewed the patch
> and there were no findings, otherwise maintainers have to go to the web site and check the status.

That's fine.

> I’m not attached to any specific form of it, I thought Reviewed-by is the most obvious form. 
> And we use Reported-by: tags with various tooling for years.

Reported-by: shows the existance of a problem that some tool found, a
subtle difference here.

> What do you think is the best form?
> 
> I’ll pause sending reviewed-by tags until we have a discussion and agreement here.

Just say it in some other text form, that our tools will not pick up.
Like:
	Tool XXXX reports that all is good:
		https://....

or something like that?

thanks,

greg k-h
