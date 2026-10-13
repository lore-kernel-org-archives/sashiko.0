Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763C45349B8
	for <sashiko@lists.linux.dev>; Tue, 13 Oct 2026 19:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791918716; cv=none; b=ns5pB89j6GVKW/790OGKX2u7WM2dbY6k9Ux1lDWaalp67AV5H7eRF2ekqT/Ri/XRvA6mdF1SVaWersAvKv44IXYu0TSDnHE8US5i0/XqbM8rs9ikHmYvblrEPSUmiJxAah8lzn+mecPb5j8wffI4BTzIXvsiltCPx910hRhNKfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791918716; c=relaxed/simple;
	bh=BgjmU3WqM9CNu8cKThSR5BYZEQ/KdNqSDmPLHG4OiYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y10VbQfdY6qfI+4YI09vRsRPnS8wwTHETYx230GkRLh1PIcZK1W8KB6B2lvwPn/KgSRgPQAaBmPBKf4/b6PtwxY/mmHNPVr6BtaGYtk4jZlzfasuMpvrIcts/vkH6wLd7ujabLbV6vv1aWHNZpS/5oAN01C9llPf8LQ8u+iNsEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WBZM8AZ7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WBZM8AZ7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E48131F000FF;
	Tue, 13 Oct 2026 19:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791918715;
	bh=HWmdCAqSw88lhHeJm0ixJqs6A/zIZUdNpQfDbEfI70Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WBZM8AZ7kY0rXpjOzSO15QIci4BRya8MwFsj6D6tNGdWXNRxMjqCxhdGWlAqMzcgo
	 Kf39DX8w8YpnowE3ALOfGiAjwG0wHix+oL5fB0UO8dXBtWyRbqQqoQ9Lgx+N7xRyUM
	 W9jhTj2sBqi3U2aFUZPVqXosqlMlHrHlybmgVyveg59cCavPaifzx8deF3HcCeo0Fp
	 /yogy/BIO9EWVT8G5KhDX66wdaiNR+G6TCyCWaSbeNJi4KL3ssBpkdNhFAu+NE+6e5
	 mMhSSyyfo32k4fwUxO6yCMZbc4bGDOtRpwFxDK9NkqphJBkLLhEPUJpiX/aaAazYvF
	 0V4BJiY14to7g==
Date: Tue, 13 Oct 2026 13:11:53 -0600
From: Keith Busch <kbusch@kernel.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: sashiko@lists.linux.dev, hch@lst.de
Subject: Re: request to subscribe linux-nvme
Message-ID: <as6CeWap_6TyitY4@kbusch-mbp>
References: <as5G7HWh3TovdMOq@kbusch-mbp>
 <7ia4h5ip8teq.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ia4h5ip8teq.fsf@castle.c.googlers.com>

On Tue, Oct 13, 2026 at 04:19:41PM +0000, Roman Gushchin wrote:
> Keith Busch <kbusch@kernel.org> writes:
> 
> > Hi,
> >
> > Christoph and I maintain the linux-nvme driver and we would like to
> > subscribe our mailing list to the sashiko review system. Our mailing
> > list can be found on lore here:
> >
> >   https://lore.kernel.org/linux-nvme/
> 
> Sure, added, will roll out later today. Do you want email delivery or
> just web ui?

Thanks! Let's start with the email delivery enabled. If it's too much,
maybe we can change it later, but I'm okay with seeing emails for now.
