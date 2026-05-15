Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A9237C11B
	for <sashiko@lists.linux.dev>; Fri, 15 May 2026 07:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778829688; cv=none; b=asciX3PYDmsgaoGp4BICSfdwCnbci9kTMhpXjNLTrAhtWjWRWSUj+PJIp1BlVl6HfAgX7xe37Vh0Z9QdpS6+VrJNQYNRRog7dwWOFHKX3xroGtOTYP4Mp/C8/9JrQSid1m4hXRncwzANZe3dtSNkkPzQWkh528h6kjAJkpes3f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778829688; c=relaxed/simple;
	bh=1Z6uBZlhnZq7taSXC0j0P3oH5QjAyYZAvNpzObSnE74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kaf2/NtoJ6kUOdu/a4BE4E8dRk3HZO+FwLhfIm1IQfsO0btvh17ZMwOdAXWGT9cBxjZVNel6XgcAUgOuol2C1eM0FJ8VPu6bcdIIRc2OD2pFNXhe0/D1Qk8oNkYvSwazkIr6u/luJMgQBzJ9mqSHQZ/oTYoJruWwpr7bMNgsy78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-95673f7b5baso2662523241.1
        for <sashiko@lists.linux.dev>; Fri, 15 May 2026 00:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778829686; x=1779434486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RsqCLGSjjl19J/y6UJmHSf9ZNpy83CGHFVvq1De6XEE=;
        b=V0SUtU7c6fK4EhWgvjzS3SjoxeODYt+xY6yEt5jRfvBoIoVEzif40YNuGE9KqrXEPp
         UvCrms+UXNTTIlev8jW4xYLgVT0/+Satrhr2wFZc495Ne+hyXCgElX9DQjVEOFmpOYWY
         KbJwcNjQLIG9BVaEHFizUutDLmRYtzQ6wu0VIl37Q88kgT6FXy+VmqVgJmiRSqRT3WRF
         Qi4Bq8+hSj9SaIH5o5k1ueKfX1Dewa6QDpsOoEXrojboysQvmXUVjQIsZbPQM+rDBqQZ
         Tifp1bbyJxLL1gAJj7SDZk4wstM2qsnLnnIYZG2x9e5x6vsKS4c0pnzRtJfi9M2R61Ql
         Qfgw==
X-Forwarded-Encrypted: i=1; AFNElJ9A19zYyXV2q5Ct1qnloLvi9KDWKBilGeOOEF6yNkxNmlb7Vy60mRm+jKptDwEg6rGnq7BDTGb0@lists.linux.dev
X-Gm-Message-State: AOJu0YwVxuL8ZMSmK1ESEsZ7ZU+5KNqB2umUNFyFzCs4lXfRr1jk7YZo
	IuhW5TPg0hEjGGQoJBt2H/IgTg5DHsMAXSkQPIsgaaW4lQ083px0bTqAghZ/wwkK
X-Gm-Gg: Acq92OF5pIa4/T7HbldCS7TtfaxRZ6cQqolY8dGS+woLt/skzBNn4tXyYigQf10Jz88
	rSh7CVZrlOaWojCDAEn9F+MOjavdzGdFuAae0vqsZuyTenso1lQX470BDFxgLczbVat5ZgOXicr
	/Hxb3mRKAZpfApdAO8pmBvPHz+b4l6oG+KpZx0Nhv7cZfFvYHIlxBYIEltGmfl5DkGCCAfzCehc
	rGOYtTxyk1zztJyYm0Xrfjmny07aV2TTOwbp2RvF9mYTilWNFTYAOkgSznQKGmL7Ab3DYEc8Bwf
	OsuBtVFTW5WxSyuW6qWDQJU0KuwnKDdJrjFTSEIyuDQnebhfLl+FszWuGzoSP/CQLvlh8aEGp3n
	GEgYO5/nPYwoC0MzcjnkZcEbBvaD/MznHKCgs/hFmACQP32BVDo5jS1LcPIgqjsO+R5kCRLSxGC
	NPREaUewJRsPn28Iy3gwZjUe72KCgZ26DgSH09olos8QegcQO5KU8X48c6StjU
X-Received: by 2002:a05:6102:2ad4:b0:607:4fde:1921 with SMTP id ada2fe7eead31-63a3f8989e3mr991864137.24.1778829685996;
        Fri, 15 May 2026 00:21:25 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-63cea37bc47sm380200137.11.2026.05.15.00.21.25
        for <sashiko@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 00:21:25 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-6312a0d556cso3416710137.3
        for <sashiko@lists.linux.dev>; Fri, 15 May 2026 00:21:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/q4JXcIcdMAPuXUFN2fpiIiftjQcYFJmf3jYkscsQ998de6pqO38s2kDKva7VgVGkantsciFv8@lists.linux.dev
X-Received: by 2002:a05:6102:3f4b:b0:610:5b9:dde6 with SMTP id
 ada2fe7eead31-63a3cc0dff9mr1395107137.6.1778829684971; Fri, 15 May 2026
 00:21:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260510084303.122426-2-phucduc.bui@gmail.com>
 <20260511204528.14632C2BCB0@smtp.kernel.org> <CAABR9nEhOTz1-0NmCMTbz=-+782Pto0yovSQhBXrXqhLwMg80Q@mail.gmail.com>
 <20260514151718.GA505743-robh@kernel.org>
In-Reply-To: <20260514151718.GA505743-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2026 09:21:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXVp5qR39rxm1GnTx5voXfrRWy85E9ROqH6yFLXhBXDkA@mail.gmail.com>
X-Gm-Features: AVHnY4IaZwUjjboAa9w44wegGYbg_GnY787WQJ9d-0SLnG7aDexsYLaX24GohaQ
Message-ID: <CAMuHMdXVp5qR39rxm1GnTx5voXfrRWy85E9ROqH6yFLXhBXDkA@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] ASoC: dt-bindings: renesas,fsi: add support
 multiple clocks
To: Rob Herring <robh@kernel.org>
Cc: Bui Duc Phuc <phucduc.bui@gmail.com>, sashiko@lists.linux.dev, 
	devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, 
	krzk+dt@kernel.org, conor+dt@kernel.org, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Thu, 14 May 2026 at 17:17, Rob Herring <robh@kernel.org> wrote:
> On Tue, May 12, 2026 at 01:42:06PM +0700, Bui Duc Phuc wrote:
> > Based on the Sashiko AI review, I am thinking of adding the following
> > constraints specifically for renesas,fsi2-r8a7740 to address the
> > reported issues.
> >
> > I think this may also help balance both Geert's and Krzysztof's
> > comments from the previous v2 review.
> >
> > Does this approach look reasonable to you?
> >
> > ---------------------------------------------
> >
> > -allOf:
> > -  - $ref: dai-common.yaml#
> > -
> >  properties:
> >    $nodename:
> >      pattern: "^sound@.*"
> > @@ -94,6 +91,78 @@ required:
> >
> >  unevaluatedProperties: false
> >
> > +allOf:
> > +  - $ref: dai-common.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,fsi2-r8a7740
> > +    then:
> > +      properties:
> > +        clock-names:
> > +          oneOf:
> > +            - items: # FSIA & FSIB is slave
> > +                - const: fck
> > +                - const: spu
> > +            - items: # FSIA slave & FSIB master use internal clock
> > +                - const: fck
> > +                - const: spu
> > +                - const: ickb
> > +                - const: divb
> > +            - items: # FSIA slave & FSIB master use external clock
> > +                - const: fck
> > +                - const: spu
> > +                - const: ickb
> > +                - const: xckb
> > +            - items: # FSIB slave & FSIA master use internal clock
> > +                - const: fck
> > +                - const: spu
> > +                - const: icka
> > +                - const: diva
> > +            - items: # FSIB slave & FSIA master use external clock
> > +                - const: fck
> > +                - const: spu
> > +                - const: icka
> > +                - const: xcka
> > +            - items: # FSIA master ex-clk  & FSIB master ex-clk
> > +                - const: fck
> > +                - const: spu
> > +                - const: icka
> > +                - const: xcka
> > +                - const: ickb
> > +                - const: xckb
> > +            - items: # FSIA master in-xlk  & FSIB master in-clk
> > +                - const: fck
> > +                - const: spu
> > +                - const: icka
> > +                - const: diva
> > +                - const: ickb
> > +                - const: divb
> > +            - items: # FSIA master in-clk  & FSIB master ex-clk
> > +                - const: fck
> > +                - const: spu
> > +                - const: icka
> > +                - const: diva
> > +                - const: ickb
> > +                - const: xckb
> > +            - items: # FSIA master ex-clk  & FSIB master in-clk
> > +                - const: fck
> > +                - const: spu
> > +                - const: icka
> > +                - const: xcka
> > +                - const: ickb
> > +                - const: divb
> > +            - items: # FSIA & FSIB  full clock support
> > +                - const: fck
> > +                - const: spu
> > +                - const: icka
> > +                - const: xcka
> > +                - const: diva
> > +                - const: ickb
> > +                - const: xckb
> > +                - const: divb
>
> Between this and just giving up on enforcing an order, I pick the
> latter.

The important part is that "fck" must be first, and that the others must
be unique.  Isn't there a way to express that?

    minItems: 2
    maxItems: 8
    uniqueItems: true
    items:
      - const: fck
      - enum: [ spu, icka, ickb, diva, divb, xcka, xckb ]

or does the single enum line only work if it's the sole item, and
do we need 7 copies here?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
