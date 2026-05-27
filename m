Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92853DD864;
	Wed, 27 May 2026 13:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779887853; cv=none; b=MJM6Jp9KkWJymoHg70oqPiLKVEdM7fu7m1fRIkVPsa62tLZsz9ewHorJqh6n5Q+UV/xHydIT5uKQCFDf8MZ/sVnGR4/5gP+YMh7Q6Ltjs8TzV0gA6iFAlYRabTX9ELo7I0x6DLzYCu+st7Q/v9OvvreNWwnieGOh2YD/jXWpt3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779887853; c=relaxed/simple;
	bh=5KOzMz9F/mwCdOPXai2Be0tOQb6BnSUWJdSzCQ2KSJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBaCmcVBgFNHWM5vVPcPNUi0axDGF1RftSNo7PLdkNuzAP9VSNAO7BXRkAYTVsQnpf097M/eh/pQ9S5xuQSQSG4qfOwg+cIVdF0ohQnEAtBM7sy0jM18Dkd4MksKFiNgNXdS7YxYmZojRe2JQELvB4a8HW8B9jyLdaC90uUKYVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ADnXHmDZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADnXHmDZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F341F000E9;
	Wed, 27 May 2026 13:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779887851;
	bh=OmHmZcbL/urkK5w5dchBeSm3Yv1z3BrklCufRKfsrOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ADnXHmDZCAiLneJJ2geZruAODk9MWPjgBAC2wA/tCyNsGT1gler5RercExKCwMG4v
	 hPL4u2eMm8Gmt6lEwNClRst52Umk7uoqZZ5/y6lcVKUXxuxKK9iSGqfK5SWgG6YM6b
	 35auHjxM/07h3WYJSaqZoYTK1REfLNTiTh0S0PjpIBDP3I/ge6VVjhLwyufBK+rE7M
	 juleqvU67/RdGZsksqa5W0A2pAkdGsXBet7t1+3qmCFnX9MXRHj9rEoOAEBBM1u5RA
	 FY8D/cHVHrrt00gXsp2b/rYORKSRCaikVmkaS2pkJ/OdSIPCK/VcANy0MxjRFPvb/m
	 7XTvfKgIq268Q==
Date: Wed, 27 May 2026 15:17:26 +0200
From: Drew Fustini <fustini@kernel.org>
To: sashiko@lists.linux.dev
Cc: MoeLeak <i@leak.moe>, conor+dt@kernel.org, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v2 2/2] riscv: dts: thead: Enable WiFi on Lichee Pi 4A
Message-ID: <ahbu5h61o5ostry1@gen8>
References: <20260508-lichee-pi-4a-wifi-v2-2-7acf63559e62@leak.moe>
 <20260508203953.C981AC2BCB4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508203953.C981AC2BCB4@smtp.kernel.org>

On Fri, May 08, 2026 at 08:39:53PM +0000, sashiko-bot@kernel.org wrote:
> > +&sdio1 {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> 
> This isn't a bug, but since this node does not contain any child nodes,
> will including #address-cells and #size-cells trigger the dtc compiler
> warning for avoid_unnecessary_addr_size?

There are no dtbs_check W=1 warning or errors.

Drew
