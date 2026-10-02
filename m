Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224AB1F938;
	Fri,  2 Oct 2026 09:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934078; cv=none; b=dSp6bGMNaWI3DqM5n0m1qNnmAx/G83/9aEC1+6f/ZQqS7AhZytnNG0CecjH6sboro/rBHW4b4p1E7ok2qCjECVylUUuDexucGGh6AYM+koA2TcAW+nrgR5A7VOOOJfDTxp26JbB7Qec/IyA9uLRhBDoZvpFPBYb01JpGBGTafng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934078; c=relaxed/simple;
	bh=KbXhExo1Z+IzDahfX80MH2P/fhOJd5YF2dniu1uGWSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Waya1NrRxQa0cC4nVY4auhYNW9ynboHumLcqrFwM518t48JFSGkXhMTD6lQp9sBE+xwU8daF9UzA4f948FCmPTIVXOeIXDfjJSGklKKmYNyVFdTWrH36xVCwCmqwYGS3MN3byxrHv+e3eWzi9EDKWsGwAF1SZbZMSPGsm3bxYHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N3rxz0C6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N3rxz0C6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC4691F000FF;
	Fri,  2 Oct 2026 09:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790934077;
	bh=8oONkhhil/f9uUgxTwtpQWB2M57DaKt+3maBiphejEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N3rxz0C6t+wf3q7GJ7eVll4ikSn+Cirv5wtEYFGp0MWz30tZueKH7jL8RiOeYkNZa
	 lgDYsmYPpJmM9SRhJJ86UA40Nj7UVddvO5vn7exj3TONczBmseciJE6A/nL7jQ4ELh
	 eQ/C7RFfbw8qoPRLEJamdKwpJH+GrdCB2x8CNMW4ptRFreOVUr6vGHkB0lVXTJyFzC
	 Ky1f5PM2MsSqG92OK2hM+w40IIG0JjhYanlg2aiPg4H1Um5fGkCG/7hOwDZHdV01lg
	 gipFI4bIOH3TrSzPRPaljCQeL0TJXKpu4pw6Jp2lmLmettPcTQRNlGxUgwc5oYhndB
	 8Un9RKWu+dTiQ==
Date: Fri, 2 Oct 2026 11:41:11 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: oleg@kernel.org, sashiko@lists.linux.dev, users@linux.kernel.org
Subject: Re: direct replies from sashiko
Message-ID: <ar98N7kvFD7Qxi0K@example.org>
References: <ar47HvytXrbOiwTO@example.org>
 <15f15153-d19e-4a3d-9d7b-847109ebb96f@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15f15153-d19e-4a3d-9d7b-847109ebb96f@kernel.org>

On Thu, Oct 01, 2026 at 04:56:50PM +0200, Matthieu Baerts wrote:
> Hi Alexey,
> 
> (+cc Sashiko ML)
> 
> On 01/10/2026 12:51, Alexey Gladkov wrote:
> > I noticed that sashiko-bot stopped sending me reports about its reviews.
> > It was very convenient and meant I didn't have to keep checking
> > https://sashiko.dev/. I thought it was just me, but Oleg Nesterov also
> > told me that he doesn't receive those reports either.
> 
> Do you know when it stopped? It looks like there is some activities on
> the 'sashiko-reviews' ML.

I don't send patches very often, so I can't say for sure.

Oleg, you're sending more patches. When did sashiko stop sending you
reviews?

> > Maybe I missed something - is there a setting to turn on its reports ?
> > Or maybe there are some rules regarding when sashiko sends a report ?
> 
> On my side, I sent a PR to change this file:
> 
> https://github.com/sashiko-dev/sashiko/blob/main/deployment/sashiko.dev/email_policy.toml
> 
> Maybe something has changed for your case?
> 
> > P.S. For some reason, Oleg Nesterov is not subscribed to the users@
> > mailing list.
> I don't know if Roman and other sashiko devs are on this users@ ML, but
> there is a Sashiko ML (now in cc).
> 
> Cheers,
> Matt

-- 
Rgrds, legion

