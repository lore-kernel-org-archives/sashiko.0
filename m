Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6BC2D5436;
	Sun, 18 Oct 2026 16:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792342097; cv=none; b=UvewTCL8YjVN0R8mpmk/y8Okprqs6J0lYGawoVi4pujD3X5DgA6wXhwFG+sklsShMLEdhU4pSkOygfiWR9FsGEGGFtDudGjdCGahrzn5k+ybk4H9JU6Es0ISMTaP6cnta/QkzbmAgZjBLwh/ghHdp4Yyu24w/feD2Eor49aYJXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792342097; c=relaxed/simple;
	bh=SAEZto6S4U8s3h2G3+IwHzcNHqVvbLrxHeGPSLxW0Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HXUWbbEq2rM34Ze0Aa7Buiyc9LxJ6ewzVNHExhLKPSLysFVl5ZRWhj7krdkV0crz9bGExcByc0xvltJEUjuWXVPJx8T4UhjoiC/OKjxIAMnlEcLgCxe7MhD5iNazVD60LZNJVT1LwgKCYFzZiKAfRIT0uNEQIAoOtMRHNJ1fqTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=T6bIqfkH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T6bIqfkH"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07C274B0;
	Sun, 18 Oct 2026 18:46:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792341961;
	bh=SAEZto6S4U8s3h2G3+IwHzcNHqVvbLrxHeGPSLxW0Tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T6bIqfkH+E3+mV3zXG2r5xu2hdyWOEoKvjEFJf75uPQDTuox2z90NIdAoniikS0VP
	 tWFeVT+DIg4Qtv+HsfbPu1fq0WuM5dGQnUwabwl8Hhilnl3qZTvUvBUnsBqn7nF1qs
	 iiPp+4fPFdRYOpyd2qh3iIxRjO3TDc2ASKUg0hNw=
Date: Sun, 18 Oct 2026 18:48:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Jiri Kosina <jikos@kernel.org>,
	ksummit@lists.linux.dev, sashiko@lists.linux.dev
Subject: Re: Patch pre-submission to Sashiko
Message-ID: <20261018164805.GA664365@killaraus.ideasonboard.com>
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>
 <b8960b85-a381-4279-9c36-e5cad7a8d2d4@lunn.ch>
 <atSzd4EdU4_B5eKr@sirena.org.uk>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <atSzd4EdU4_B5eKr@sirena.org.uk>

On Sun, Oct 18, 2026 at 12:54:31PM +0100, Mark Brown wrote:
> On Sat, Oct 17, 2026 at 09:42:34PM +0200, Andrew Lunn wrote:
> > On Sat, Oct 17, 2026 at 07:28:48PM +0200, Jiri Kosina wrote:
> > 
> > > I have just received a v1 to v11 patchset submission within roughly one 
> > > day timeframe.
> > 
> > If they are iterating that fast, they either have automated tests, or
> > the code is untested. I would ask them to includes the tests in the
> > patchset, to become part of tools/testing/selftests.
> 
> There's some work (init paths for drivers for example) where it's
> perfectly plausible that you can reverify things fast enough to be doing
> that.  It's probably a relatively long day, but it's doable.  You're
> more likely to hit numbers like that over a weekend though.

And let's not forget that for most patches touching drivers selftests
are not an option.

-- 
Regards,

Laurent Pinchart
