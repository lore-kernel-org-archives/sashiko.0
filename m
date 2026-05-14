Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CA625B0B7;
	Thu, 14 May 2026 15:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778771840; cv=none; b=F16lrqAng7ZsSM2ZWMB+iEelAax4XmU1GtH9xhIRDz66AknWg40nMz9ZTHMV/hfgt3+VQvtRVCis0MvHYChqKRM3ZaETqSsfUBjdbaHnr5Coc9YMRJsVgkC35yQzy+CKlYLxqH23QRVzSCYoRR9rFTp6RwFMFc+nsidi09GJu/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778771840; c=relaxed/simple;
	bh=gUlkQklFPSQDCQsC4tO30txGuXDyBu7PUw34/AsJP3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AY1bkAy3TN1WXO02ShG8u+3QhIYL+lm5t368/HgrqRBX49UhzHSBKZJqFLx3R75SbBJ1PJC0ip1GXoQp/1p8eyowNsWuHuYVcuECkUWIbYgnfNGTcmbCCTk7Jkhp2cw5FENGcnYxXumMF8yHu0/UJ4VlbG0DT0SXiLMuvLkhwB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IyNGeqyD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IyNGeqyD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56222C2BCB8;
	Thu, 14 May 2026 15:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778771840;
	bh=gUlkQklFPSQDCQsC4tO30txGuXDyBu7PUw34/AsJP3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IyNGeqyDUgawm3BSC2mp6Nv6T5rSkZZCfrKyLbHvqs6sbu5npW67YluL0e39mOKAX
	 RTCiSWYMFLzQE+zrWFkOJYYAcoRGX7T6+M9ZNTcxsVthNkF0jo9hxAw+ngNDLEUN4C
	 pQjgiFSLzfkUP0o0/XS3+H7rX3g1PvDMaG9QjdRyhZe1r2PrCpm9MlD9UM98mJELsN
	 OKauuN7PXgASvMzgAI2VMFfT4IASSqM4fbIaNsOsm83ATC+ZfsKJ8CtqCt6bEzTJMy
	 HuP1egj7kXcZRgpnmn3SuO42hF1+Y/924fy6er1coNHp4ujfcDT7Nx9uqZw2G2X30g
	 X0B8X8oTqFgmQ==
Date: Thu, 14 May 2026 10:17:18 -0500
From: Rob Herring <robh@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: sashiko@lists.linux.dev, devicetree@vger.kernel.org,
	wsa+renesas@sang-engineering.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v3 01/10] ASoC: dt-bindings: renesas,fsi: add support
 multiple clocks
Message-ID: <20260514151718.GA505743-robh@kernel.org>
References: <20260510084303.122426-2-phucduc.bui@gmail.com>
 <20260511204528.14632C2BCB0@smtp.kernel.org>
 <CAABR9nEhOTz1-0NmCMTbz=-+782Pto0yovSQhBXrXqhLwMg80Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAABR9nEhOTz1-0NmCMTbz=-+782Pto0yovSQhBXrXqhLwMg80Q@mail.gmail.com>

On Tue, May 12, 2026 at 01:42:06PM +0700, Bui Duc Phuc wrote:
> Hi all,
> 
> Based on the Sashiko AI review, I am thinking of adding the following
> constraints specifically for renesas,fsi2-r8a7740 to address the
> reported issues.
> 
> I think this may also help balance both Geert's and Krzysztof's
> comments from the previous v2 review.
> 
> Does this approach look reasonable to you?
> 
> ---------------------------------------------
> 
> -allOf:
> -  - $ref: dai-common.yaml#
> -
>  properties:
>    $nodename:
>      pattern: "^sound@.*"
> @@ -94,6 +91,78 @@ required:
> 
>  unevaluatedProperties: false
> 
> +allOf:
> +  - $ref: dai-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,fsi2-r8a7740
> +    then:
> +      properties:
> +        clock-names:
> +          oneOf:
> +            - items: # FSIA & FSIB is slave
> +                - const: fck
> +                - const: spu
> +            - items: # FSIA slave & FSIB master use internal clock
> +                - const: fck
> +                - const: spu
> +                - const: ickb
> +                - const: divb
> +            - items: # FSIA slave & FSIB master use external clock
> +                - const: fck
> +                - const: spu
> +                - const: ickb
> +                - const: xckb
> +            - items: # FSIB slave & FSIA master use internal clock
> +                - const: fck
> +                - const: spu
> +                - const: icka
> +                - const: diva
> +            - items: # FSIB slave & FSIA master use external clock
> +                - const: fck
> +                - const: spu
> +                - const: icka
> +                - const: xcka
> +            - items: # FSIA master ex-clk  & FSIB master ex-clk
> +                - const: fck
> +                - const: spu
> +                - const: icka
> +                - const: xcka
> +                - const: ickb
> +                - const: xckb
> +            - items: # FSIA master in-xlk  & FSIB master in-clk
> +                - const: fck
> +                - const: spu
> +                - const: icka
> +                - const: diva
> +                - const: ickb
> +                - const: divb
> +            - items: # FSIA master in-clk  & FSIB master ex-clk
> +                - const: fck
> +                - const: spu
> +                - const: icka
> +                - const: diva
> +                - const: ickb
> +                - const: xckb
> +            - items: # FSIA master ex-clk  & FSIB master in-clk
> +                - const: fck
> +                - const: spu
> +                - const: icka
> +                - const: xcka
> +                - const: ickb
> +                - const: divb
> +            - items: # FSIA & FSIB  full clock support
> +                - const: fck
> +                - const: spu
> +                - const: icka
> +                - const: xcka
> +                - const: diva
> +                - const: ickb
> +                - const: xckb
> +                - const: divb

Between this and just giving up on enforcing an order, I pick the 
latter.

Rob
