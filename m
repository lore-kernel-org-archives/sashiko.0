Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1223548EE;
	Sat, 16 May 2026 15:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778945771; cv=none; b=q+9nYMwlVARh4c1ai+5gyvgk/npa6RQcGloI9UJeG9gbltF5uDWsYInuUNA40kxk+qg6rkLtiwpdK6tdIBsDqxQmdfRTylOdoGLwSefB7CJOfqmwbHki6XqqmOOijjk4LWuRWDyKAdh5mV2TddfBIZzmbt0P36BKIHH8tEDGu6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778945771; c=relaxed/simple;
	bh=aUwWi3/912SStTCUnNctuM5DWKffokr2l2B8BKovQ6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P2T2j2AH7YprSAZeJNnETDxek3xvGXjjf1N8r7gqnAtO5NwtnVqdkFw2CwTnk/WfaBULWH5DdkzkGYloBq1+MgzDDEFNObfRpGUNaItc0J9GpbaRxNMZ8PKhb6iVxXns9i3GcKp1QTxIQ9wfw+YoYMe+QFFFxzPWv6dReIS4/5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FiFAMK1F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FiFAMK1F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28CD4C19425;
	Sat, 16 May 2026 15:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778945770;
	bh=aUwWi3/912SStTCUnNctuM5DWKffokr2l2B8BKovQ6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FiFAMK1F1TErDc4xCmwOiHpnUvqL2OZ7s6b8uGw1vKmzOcMu9rCsBaNYV7zszWlOO
	 qR6u2Qh7eDyfH2Fc/bVCGZBzOMK7Ponri+US/v5QD0NBRpWjgeT+7elMKBQ+7Xqqh1
	 JNQf7GbrTDEmRz7cnclWgXZ/haMwNKuutdckfUqc=
Date: Sat, 16 May 2026 17:36:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk@kernel.org>, sashiko-bot@kernel.org,
	sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev,
	Linux Kernel Workflows <workflows@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	kfree@google.com
Subject: Re: Stop false review statements
Message-ID: <2026051627-preformed-blinking-2b50@gregkh>
References: <ad139e54-a7f0-4d09-832c-6b2bf2e93e03@kernel.org>
 <fcc4b719-2696-4f31-bac4-6c07f8ddec47@roeck-us.net>
 <20260516-upbeat-tody-of-feminism-4ab00a@lemur>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516-upbeat-tody-of-feminism-4ab00a@lemur>

On Sat, May 16, 2026 at 11:20:33AM -0400, Konstantin Ryabitsev wrote:
> On Sat, May 16, 2026 at 05:11:28AM -0700, Guenter Roeck wrote:
> > On Sat, May 16, 2026 at 10:05:02AM +0200, Krzysztof Kozlowski wrote:
> > > What the hell is that:
> > > 
> > > https://lore.kernel.org/all/20260515190707.033BDC2BCB0@smtp.kernel.org/
> > > 
> > > As a bot you CANNOT MAKE a Reviewer's statement of oversight. You are
> > > not a damn human do be able to make such statement. You are a bot, a tool.
> > > 
> > 
> > Where exactly do the rules say that ? I seem to miss that.
> > 
> > There is a policy document about _contributions_ made by AI, but I don't
> > see the one that says that AI agents must not provide Reviewed-by: tags.
> 
> >From my perspective, AI agents must NOT use the Reviewed-by tag for the
> following reasons:
> 
> - We consider this a "person-trailer" and it implies agency
> - Adding yourself to a commit via a trailer is a *binding responsibility* for
>   the change. A lot of tooling will cc the Reviewed-by addresses on follow-up
>   messages regarding code in this commit. If the address is bogus or doesn't
>   go to a developer, this is both wasteful and potentially frustrating.

I agree, any sort of "automated" tool shouldn't be adding these types of
tags.

thanks,

greg k-h
