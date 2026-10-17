Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB263C8C65;
	Sat, 17 Oct 2026 19:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266159; cv=none; b=pUFnPD5Z78KSmuMMJUBqYgB/XCq7fpln08VO4vCAwAFTFJoCaEp5Wehq9dmFyVw/ceEncSTXjy0xkX2Lpt/IGtrm+Em2EnmYElMfD3aJr25gH0+WnLz47WIjmgjBZfSMXjbCK4S9Mfo0GzpubN2suA0Guig/yw4PyO3HTXkrY80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266159; c=relaxed/simple;
	bh=emRa0pIJGWhqCMxyOYm5CPcY93q7JHk1bCHNIkVBaOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8XgW7F5FVnIaNfN3SA1EnpjVLlNZQrDHNaxw4HDvEvtGABFKvmH08VnulYTLv+xVLt+97/XFMf6pP/TMFJxHecWiKgMx2yhSU9NRWP9EU3Q7lP1B3LKkInrH4MjUBEMKc/vPHOkKMTjzjSR7/NpIng2M2gLNC4Dp4RmRp0XHXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=BG1qOK7Y; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="BG1qOK7Y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=/IrW99H5knb+KQziDtCc7WlyUgNO64gQgE74aZPAXhI=; b=BG1qOK7YrDdMawDFn7hcGhkEmw
	g/a9oavWC5BIPHeoaWq57YhbMDjok0iuF4nD8qPd39rdCMqtZaXXGkuX+B37q5gmlPeo800RUS8ZP
	zR7KsSbq6qqnsqCcr/Bv0s3vaTxd7KBpcQKTTkIMlyiPUONH5sTA2df258cxvu9J1YZ8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xIAIc-00BNy8-LY; Sat, 17 Oct 2026 21:42:34 +0200
Date: Sat, 17 Oct 2026 21:42:34 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jiri Kosina <jikos@kernel.org>
Cc: ksummit@lists.linux.dev, sashiko@lists.linux.dev
Subject: Re: Patch pre-submission to Sashiko
Message-ID: <b8960b85-a381-4279-9c36-e5cad7a8d2d4@lunn.ch>
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>

On Sat, Oct 17, 2026 at 07:28:48PM +0200, Jiri Kosina wrote:
> 
> [ in the spirit of the concluding discussion at this year's maintainers 
>   summit,  I'm using this list outside of actual maintainer summit 
>   planning :) ]
> 
> I have just received a v1 to v11 patchset submission within roughly one 
> day timeframe.

If they are iterating that fast, they either have automated tests, or
the code is untested. I would ask them to includes the tests in the
patchset, to become part of tools/testing/selftests.

	  Andrew
