Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42B63D412C
	for <sashiko@lists.linux.dev>; Sat, 16 May 2026 12:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778933492; cv=none; b=ppZKvEku7yiuzAlMrMvmFYljZaaDXgAY8oPQOy5/6Ap/OjZKFyIUdQbb1vPxPp83n3b2AvSSuExnTlWghoQ7E987IOq2uo1MIFborFvEI5UM0tlzMPylJXNgCJwfGJtxsuBOilNoHp1JeeflJCq7pxHxLVFqAeRLjXN64/nYFP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778933492; c=relaxed/simple;
	bh=Z28oTA3GMSXIjm6qDFnu5n/viFA2STRDZfrShD1dZck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxgYTg7pFo233Wy5C6UmuL1MxgT1BiK4X3ahH7J9/z+KB8bDdgSz/WgjKNeczP1R4rCVkbf/4nBtAVfKqSS5K1UrFx4XVk6YHbeixwRe8u9mBWGmynA/EZ80duJL2+7tb2wQ+/E4D12VRCeBaOB+oKAwZacqs7yaB3lKyDYMniY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmS456Mw; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmS456Mw"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ff5472f263so685853eec.1
        for <sashiko@lists.linux.dev>; Sat, 16 May 2026 05:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778933490; x=1779538290; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DcR1L4lWy0FktqufnY8V8UAksIVyQ73+bedTGKxuci8=;
        b=mmS456Mw2Y009NbjiaU+HMw1993Nwq6h2nWPN96eLdS1Z7uOOAMqre01Dn1KRpRuE/
         yNZ+R5kLbu9dYt1PAGV6CE6NCnvtdONf8te1B5eMYR1TDALNVIGvaIgsKUfFGTCscS//
         OXtQmShk3u8nbd2wMuCNGPOLIePPxqB5VHC3nHo+tIQo/8alOhYAmJGcYf1p0cmUshyD
         fzQjXRLt8zhoB950ZV0w6EokmyiToTcW62yFc3SpQSP0+jrJ4O+23Bub6R47VMrwT+QM
         L3G1U3wtX7OtEjaRzyecqIyboUugdOg5Rj4K7gwzUccW+5xzoUitS4YOeFwE8KkDn/Gq
         1M2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778933490; x=1779538290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DcR1L4lWy0FktqufnY8V8UAksIVyQ73+bedTGKxuci8=;
        b=h+iU4v/hG49lVm9RMA36rHmxVdGQrqK5s7Oii8eYzCAswhY4PW3BzaaJR8INy+I0e1
         BDQAI/dDPj5gX9j++zcGL+sJ4DDW8XZ1U33ErlGg9L3SWl5I183a+pPHwJfxIKRwb3Tg
         q/c6VMABnVjgp0BfooESWBaIMD+I3I2hsATePNA/lcCSikQSdFSTz4RIN9s9nd9vm882
         QerqLkIyq4ZcDPZ5N8kcaxG0x6mh2daOxWIuXQ0guZYrVkVQAsfoF2qSJ32i71JNInN4
         wfTwjPDYswE+mTWhA8SkX+82RAHKDRCSQ2Wzb3qA8phrtrcu/ds9nD7WBlbFBkr/seo2
         F0Sg==
X-Forwarded-Encrypted: i=1; AFNElJ8gS7i22+7zJSZyrOpWQ0Fta5WvddVBTOqfQvCFoKX9pGID+ynqVkyc0LqQTNmVpcDHYscfUvgz@lists.linux.dev
X-Gm-Message-State: AOJu0YwHW6Lm8EFyyYvfRxiuGWoFc9VBpMCT94L9DTgmwuohEgi+4TT8
	f9a6jh4i5wq1fZWPGPQRFujXqZSWfFTtjkS4gFRSl1cY23R6VEjxtvQz
X-Gm-Gg: Acq92OGtY0NNRk7KwhZlZmAzoDgEIBQqwOPt0B5FKv2ulRrENFg61ci395K1CgEXpX3
	9E88VgiyewbF3cGvh8FiVyzeHf4cD9xkzijyRWF2bZ9HdBnc/91bGGiPLqErWM0QWkKO5IyMetq
	xgB9Im/wUCDosMJmuWbzNvMCOX20sPFM3GYzGe72BYjUqITZ2HT+5k1dOWaVCW/xWv6GDF6qwtn
	/+zofXpdH8LCIK4bqvvzInZNbDfDjfANZ3Hhk00c+uh5LeEFGoFOQziyrk9M8hiCMbYHEunRvcP
	Rz3uSn+UDQW6+ahvECxIRuLzDVcWh1J1BjgD0cNzN7lNBOBP8rnjNiy1PkbmZeMLFVu7qLXZNx0
	9N/RjTfDyNIi5UzvwPq8E5r3U6h6Wuh7O00iDs4PuOCdkw/EU3HKXBeNZLyNJZ1wig5Y931/o+A
	ybMt9SOfesZx0chb307X1C+8vEfNvpYpRl7kgwDp5kU02l6Zy9TFTMajDXdg==
X-Received: by 2002:a05:7300:dc03:b0:2ee:be86:7b90 with SMTP id 5a478bee46e88-303986b1538mr3431840eec.29.1778933489890;
        Sat, 16 May 2026 05:11:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302978afdd3sm9763251eec.29.2026.05.16.05.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 05:11:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 16 May 2026 05:11:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
	sashiko@lists.linux.dev,
	Linux Kernel Workflows <workflows@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	kfree@google.com
Subject: Re: Stop false review statements
Message-ID: <fcc4b719-2696-4f31-bac4-6c07f8ddec47@roeck-us.net>
References: <ad139e54-a7f0-4d09-832c-6b2bf2e93e03@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad139e54-a7f0-4d09-832c-6b2bf2e93e03@kernel.org>

On Sat, May 16, 2026 at 10:05:02AM +0200, Krzysztof Kozlowski wrote:
> What the hell is that:
> 
> https://lore.kernel.org/all/20260515190707.033BDC2BCB0@smtp.kernel.org/
> 
> As a bot you CANNOT MAKE a Reviewer's statement of oversight. You are
> not a damn human do be able to make such statement. You are a bot, a tool.
> 

Where exactly do the rules say that ? I seem to miss that.

There is a policy document about _contributions_ made by AI, but I don't
see the one that says that AI agents must not provide Reviewed-by: tags.

> Stop faking tags.
> 
> And really, considering how many false positives Sashiko produces, how
> poor review comments it gives, how many misleading comments, it's
> unacceptable to me to consider that a review.
> 
> Amount of useless noise Sashiko produces already changed my mind how
> useful that tool is.

We seem to have completely different experiences. Yes, it does produce
false positives, just like humans do. However, I have seen it find many
real bugs, including many in patches which already had Reviewed-by: tags
from (presumably) human reviewers.

Again, it appears that our experience is completely different than mine,
but after several weeks of getting code reviews from sashiko I do have to
say that I trust its review feedback significantly more than human reviews.
Sure, it does not guarantee that a patch is indeed bug free. A human review
doesn't guarantee it either.

> 
> I will be NAKing every damn tag produced by such tools.

I'd like to see an official policy. Until then I'll ignore your NAK in my
scope of responsibility.

Thanks,
Guenter
