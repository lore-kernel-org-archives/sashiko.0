Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1FF3451AB;
	Sun, 17 May 2026 10:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779012608; cv=none; b=kgE+yqwBqUt7AtHrNhrgfJpDUQmN82WnGOVn9nMV7XzUUoshjE10Fw4MjIz8ebCaDCHXLvO7NNAzaesNl0HrBKTguWGdU+L1yeqSH1cPhS2nau8S0AtvzVg/C4mI+ZbEJiKyrZwWgGn8OPEoyEoKBmrP6XZBsbWlfEn9XHdHWvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779012608; c=relaxed/simple;
	bh=xWNGZuFKS50HsafSewfWDN4xsjvcsE7Kn/AFB9dRq0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EEFc3a/KFpyJf6W5q100UNXBCm4l8qIFdDUJMmLlsaJ6KTLsOStWDGylfUpIKRgIucVv0plGFvbniKaRR0fS+mGZPY+pMqoJZ1sLH7lZ/Rb7+7L7o1EIrE7SAJjlU1OOHGiNzRwpkW1VcIOMEDeYOvlv3YeaF3O5QBd0GoTXbso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=u0tkqmtS; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="u0tkqmtS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1779012602; bh=XZTzOujJ+tvEvXbCPESuV5YZygT+Ez2lffZYPg+zpJU=;
	h=From:Message-ID:From;
	b=u0tkqmtSObxRJsg/D1Vr8cCDRhqAn5Y35lukLd1EOTXHVR6OHAh+oBkT0M0sLXpEr
	 4m4qSk9FELAgV33u0+xZufK/wy2ybS8zj/L//BSqAkilOoM6BYNLtKgr2Vxj7oirZj
	 M1xjuNSCIuyT5lQxk9gMF+Q96502q7vcb8GmUYy0=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id DAFD4C09E2;
	Sun, 17 May 2026 12:10:02 +0200 (CEST)
Date: Sun, 17 May 2026 12:10:02 +0200
From: Willy Tarreau <w@1wt.eu>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>, debarbos@redhat.com,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Konstantin Ryabitsev <mricon@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>, sashiko-bot@kernel.org,
        sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev,
        Linux Kernel Workflows <workflows@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, kfree@google.com
Subject: Re: Stop false review statements
Message-ID: <agmT-mibeqjk4rG7@1wt.eu>
References: <4f3d7f48-5766-425b-91f6-0acdb5554584@kernel.org>
 <07602616-412B-4ED8-95D7-588C0D077EE3@linux.dev>
 <20260517120556.248852d8@foz.lan>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517120556.248852d8@foz.lan>

On Sun, May 17, 2026 at 12:05:56PM +0200, Mauro Carvalho Chehab wrote:
> On Sat, 16 May 2026 14:59:44 -0700
> Roman Gushchin <roman.gushchin@linux.dev> wrote:
> 
> > > On May 16, 2026, at 2:33 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > 
> > > I find it opposite: clogging commits with useless information, because
> > > some arbitrary and completely closed-source tool did analysis means
> > > nothing to me one year later when I look at the commit in the Git history.  
> > 
> > This is simple not true: Sashiko is fully open-source, under Apache 2.0 license
> > and the code belongs to LF. 
> 
> > Yes, the instance behind sashiko.dev is using
> > Gemini 3.1 Pro LLM, which is not open-source, but it's not a fundamental limitation - 
> > Sashiko is supporting various LLMs, including open models - it's just a practical
> > choice: to my knowledge the quality of open models is not on par with frontier closed
> > models 
> 
> I would very much prefer using an open source LLM, even if not in pair 
> with latest paid models.
> 
> > and it would require a non-trivial amount of hardware and infrastructure to run
> > an open model at the required scale.
> 
> IMHO the best would be to have them running on some infra that would accept
> open source models (*). If there aren't enough resources to have our own
> infra, there are offers out there which allows running open source models
> like https://ollama.com/pricing (I never used myself).
> 
> (*) For instance, Qwen3.6 is brand new and licensed under apache-2.0.
>     Not bad on my tests running it locally.

FWIW that's what I'm using locally coupled with llama.cpp to find bugs.
And it does. Plenty of valid ones. It's greatly sufficient for most work.

Willy
