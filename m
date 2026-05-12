Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E956F368D6F
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 06:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778568148; cv=pass; b=mPrRC5AaNgqdbJEQoObI0PYm05VnYsSJLUCe7EmQfXdlrxn371jP3XlNzn/d6xe7/KrA4Exub+IuAZu6EUt8Nqy/4N+1HoGXpYsqfHp5N779xEOPPpoSSl3Wyx47REbiRa3sbqj4B/BOnw/RuImZTdl91TF7Qq+YgoAzUKOkS5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778568148; c=relaxed/simple;
	bh=JW+i/pVE71OvGEL5VzIECpn0VkCbGmOKNADt617MGsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lsuAH5gZavaXVOdCYrJrQFvF73qJHdVir6me2DG/9eQun2PQXwi8vES6bzuN/NNNi264nNsynJo3SDTFiX7yw/uzYjwUfLYLs+x2zDA8KkzDNDtcYBNNlGD11N2XFphJQu3OyGHxBIz+RnIe2D5keIFLlUC6CLI4ydLlMosBnuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ayUekGDC; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayUekGDC"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2bcd730e090so11990505ad.2
        for <sashiko@lists.linux.dev>; Mon, 11 May 2026 23:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778568137; cv=none;
        d=google.com; s=arc-20240605;
        b=LVihlzEQYWNnazUoo3nkfoygMHzWg3zR+oXZym4pbues2oJR99KiF0Dt+Nga3p0g1e
         lusaak6Z1KseWPHaH2SZo9B/wRpMQUcuTIrmIehrh2a71bSz/u9E6kTqEY1umBAAiHkW
         OlkpbGroh9gBMpnJ4qdsMD9ZIzoOMgiKCKmBP5+2uFTKZzQYQwNlIb2lc7nm/cRiPcCN
         z/+vh2Lij0wEVvDxKu/loc5kyYjfD69jT81gUeD8NjIMVJzCCQy63xnX12+NfQuCbE5Y
         1EjRlBsjYtT7AshSJCv7oecNf9uRyNGPT/Tf/zK0bEJ1zeGAwyBjTwfNys5mFFQCqB0f
         GWRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5TjPcoUMcuCxioj/5ldLRrHNHcGi2KwtoRGUoSJPPFU=;
        fh=nhVBLBX+dAch6do4vzWmq29JHs0Rl8rF4V4sv1WM/bY=;
        b=f0ETowBwUCuybHHqy9yDTfybFEN0WC5SWV6spScquGsjP7RKum9FQLMzsat7LOhu02
         TxqI/uRy+3V9cEQK+8QaNZIijfooSgphFEaBHXeObf/5fmpRbbOctu10okTxMdPC/yl5
         +ZkDwF7WKODurgKd6C0q7UuGTFrOFnsqOKE53FraTC3mubFxUGgBzIoic1LMgsV8tJVs
         XAZEiBW1gQnEX+39O0ymg5LZQHbWjVHqZD5n+68VOaZjBeGrypXKs1g+8r9lseiAXEhq
         OPCH0UnpjM8dK2+KgdsL/NsT98rZrAwqYi2z0bp7EcgabrYiqAHCfWYzxRH67jFS5rg+
         58uQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778568137; x=1779172937; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TjPcoUMcuCxioj/5ldLRrHNHcGi2KwtoRGUoSJPPFU=;
        b=ayUekGDCxNVefAxaoMz4xMwVkQ3nk9A6wTV8FHuLeVOqk/KNeFn0UmRslwu5yjbWeZ
         jV+nN2hlK2HYisM3Q7anVfx1r4xaNmdp94B52l20CjvzvsFlUsKLkfSYSVgOruohsDE+
         SQMtEe4dvPOWyVFxIuXO9iYpEOWijFUMdLkqo7H28YGPzMEy4nf15m7A9tEqCLjNCkwa
         0CxZBBklKbMnceHTKRK84fh4n9hMARxy0opoYSe5J1gCF3/n6+UL6i0Ka4skEIZrKBlp
         Qzob8jdKCLYNLZfl9EbzTBWsXl0EsAT8+kLA4CPGEeV0o+ONLyr+ATFhcjua9h/uYfBC
         yKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778568137; x=1779172937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5TjPcoUMcuCxioj/5ldLRrHNHcGi2KwtoRGUoSJPPFU=;
        b=bHJUZm7Spm5NvQ8hPO0HfuUV9DV2Ws76HIrG+SDYsWfAVKL3WgTZsPV0CdbX3vFEuH
         louzkmDzkhAnTymqaBYDaAQGQk2YVkHlNxowEv/MrEP4bLV5a5qiSrojnrgRYrU76B8F
         tVv4lJKZYwaS7K+TxGS2D0mUo9qVKkWMJHCwosE3CHsqNrysgE6G8qzo8EmGan2bi0lI
         DmevUfvM7NMPGpFF1NrZO65Bz3XLIftBW1148jv4FngfMo4OQBYMhseUwhlEmcFSpptZ
         5sVX+frQLmbV+pGu7IsawdcjMaEdJF4F7NX/dJ9fXzCFwK0ET6VRAVacDBzl/6FVxZD8
         jyBQ==
X-Gm-Message-State: AOJu0YwBt95wa5bkbqgdRNiLhVK1q9Wus0t/rqiF1acWmuxFRNyd8Z0J
	0vjYKr/oHizukl91Cd+0qkQEyrlB67KGGmdTBO32xE5ojr2OeOCVq8qwjYPDi/74nS8IKy5HvAD
	k0Kwddb6YwXBNShtrsCLBfKkqRCtUbBTVbSwg
X-Gm-Gg: Acq92OGLbtH9DCXkzhxDZhCcfS+F2PYM/XhP+NCwBcQtgXX6RWpwRbeuY2T8mKuHkzP
	lYKPSy32A5jp6yZPoUnHt4s17l3n5dHdSgQbIg8u89LQhhumxV+yQQ6BOZ3NTqbfPoKYA3rXuUj
	dRCe+tzOjxrP3mgWp7m/idmr/MrOPg82dLn5OMlfP7mHITJ2BI9yFHk4sHRTdH6sEgeIxNXY8gv
	cjRnq18ElZF0AdwswYPf9C44CSEEp0OvKKS7NCnro+EH3UuetWkYRcHG7KzxOsk1QYpy/3NwyGf
	Ef8i/45gM3gTEpLTfM1S5vHwxrQ+fYzBCiwWhGKpeQpRZL0+
X-Received: by 2002:a17:902:e54e:b0:2ba:4e84:966 with SMTP id
 d9443c01a7336-2ba7a358d4amr307940265ad.36.1778568137174; Mon, 11 May 2026
 23:42:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260510084303.122426-2-phucduc.bui@gmail.com> <20260511204528.14632C2BCB0@smtp.kernel.org>
In-Reply-To: <20260511204528.14632C2BCB0@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 12 May 2026 13:42:06 +0700
X-Gm-Features: AVHnY4I84EJDkO3xEZHB99KhLWC30tC31OgwdWSjgxMsmVdXgk751IHSnHRgLEA
Message-ID: <CAABR9nEhOTz1-0NmCMTbz=-+782Pto0yovSQhBXrXqhLwMg80Q@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] ASoC: dt-bindings: renesas,fsi: add support
 multiple clocks
To: sashiko@lists.linux.dev
Cc: devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Based on the Sashiko AI review, I am thinking of adding the following
constraints specifically for renesas,fsi2-r8a7740 to address the
reported issues.

I think this may also help balance both Geert's and Krzysztof's
comments from the previous v2 review.

Does this approach look reasonable to you?

---------------------------------------------

-allOf:
-  - $ref: dai-common.yaml#
-
 properties:
   $nodename:
     pattern: "^sound@.*"
@@ -94,6 +91,78 @@ required:

 unevaluatedProperties: false

+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,fsi2-r8a7740
+    then:
+      properties:
+        clock-names:
+          oneOf:
+            - items: # FSIA & FSIB is slave
+                - const: fck
+                - const: spu
+            - items: # FSIA slave & FSIB master use internal clock
+                - const: fck
+                - const: spu
+                - const: ickb
+                - const: divb
+            - items: # FSIA slave & FSIB master use external clock
+                - const: fck
+                - const: spu
+                - const: ickb
+                - const: xckb
+            - items: # FSIB slave & FSIA master use internal clock
+                - const: fck
+                - const: spu
+                - const: icka
+                - const: diva
+            - items: # FSIB slave & FSIA master use external clock
+                - const: fck
+                - const: spu
+                - const: icka
+                - const: xcka
+            - items: # FSIA master ex-clk  & FSIB master ex-clk
+                - const: fck
+                - const: spu
+                - const: icka
+                - const: xcka
+                - const: ickb
+                - const: xckb
+            - items: # FSIA master in-xlk  & FSIB master in-clk
+                - const: fck
+                - const: spu
+                - const: icka
+                - const: diva
+                - const: ickb
+                - const: divb
+            - items: # FSIA master in-clk  & FSIB master ex-clk
+                - const: fck
+                - const: spu
+                - const: icka
+                - const: diva
+                - const: ickb
+                - const: xckb
+            - items: # FSIA master ex-clk  & FSIB master in-clk
+                - const: fck
+                - const: spu
+                - const: icka
+                - const: xcka
+                - const: ickb
+                - const: divb
+            - items: # FSIA & FSIB  full clock support
+                - const: fck
+                - const: spu
+                - const: icka
+                - const: xcka
+                - const: diva
+                - const: ickb
+                - const: xckb
+                - const: divb
+
 examples:
   - |
     #include <dt-bindings/clock/r8a7740-clock.h>
@@ -102,7 +171,11 @@ examples:
             compatible =3D "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
             reg =3D <0xfe1f0000 0x400>;
             interrupts =3D <GIC_SPI 9 0x4>;
-            clocks =3D <&mstp3_clks R8A7740_CLK_FSI>;
+            clocks =3D <&mstp3_clks R8A7740_CLK_FSI>, <&spu_clk>,
+                    <&fsia_clk>, <&fsiack_clk>, <&fsidiva_clk>,
+                    <&fsib_clk>, <&fsibck_clk>, <&fsidivb_clk>;
+            clock-names =3D "fck", "spu", "icka", "xcka", "diva",
+                          "ickb", "xckb", "divb";
             power-domains =3D <&pd_a4mp>;

---------------------------------------------------------------------------=
--------------


Best regard,
Phuc




On Tue, May 12, 2026 at 3:45=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] The schema fails to enforce the mandatory SPU clock for the r8a7=
740 hardware variant, and the example provides a functionally broken config=
uration.
> - [Medium] Mismatch between strictly positional `clocks` descriptions and=
 unordered `clock-names`, combined with missing `clock-names` enforcement.
> --
>
> commit 3adcf4902a5e62b71566ef5381f002fd5338a399
> Author: bui duc phuc <phucduc.bui@gmail.com>
>
>     ASoC: dt-bindings: renesas,fsi: add support multiple clocks
>
> This commit updates the FSI bindings to support multiple clocks to proper=
ly
> describe the hardware clock tree. It adds the SPU bus/bridge clock requir=
ed
> for the r8a7740 SoC, as well as definitions for functional clocks, intern=
al
> dividers, and external clock inputs.
>
> > diff --git a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml b=
/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> > index df91991699a72..c50e7115b21a0 100644
> > --- a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> > +++ b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> > @@ -38,7 +38,32 @@ properties:
> >      maxItems: 1
> >
> >    clocks:
> > -    maxItems: 1
> > +    minItems: 1
> > +    items:
> > +      - description: Main FSI module clock
> > +      - description: |
> > +          SPU bus/bridge clock. On R8A7740, this clock must be enabled=
 to allow
> > +          register access as the FSI block is connected behind the SPU=
 bus.
>
> Should we add an allOf block with an if-then condition to enforce the
> presence of the SPU clock for the renesas,fsi2-r8a7740 hardware variant?
>
> Without it, incomplete device trees might silently pass schema validation=
 but
> fail catastrophically at runtime, as the commit message notes that missin=
g
> this clock causes a system hang.
>
> The examples section of this file demonstrates this:
>
>     sh_fsi2: sound@fe1f0000 {
>             compatible =3D "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
>             ...
>             clocks =3D <&mstp3_clks R8A7740_CLK_FSI>;
>
> This example only supplies a single clock and omits both the required SPU
> clock and the clock-names property, which contradicts the commit message.
>
> > +      - description: CPG DIV6 functional clocks for FSI port A
> > +      - description: CPG DIV6 functional clocks for FSI port B
> > +      - description: Internal FSI dividers for port A used for audio c=
lock generation
> > +      - description: Internal FSI dividers for port B used for audio c=
lock generation
> > +      - description: External clock inputs for FSI port A provided by =
the board
> > +      - description: External clock inputs for FSI port B provided by =
the board
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    maxItems: 8
> > +    items:
> > +      enum:
> > +        - fck  # Main FSI module clock
> > +        - spu  # optional SPU bus/bridge clock
>
> Does defining clock-names with an enum correctly map sparse clocks?
>
> Because clocks defines an items array with eight fixed descriptions, it
> acts as a strict positional tuple. If a board provides the Main clock and
> the icka clock but omits the optional spu clock, icka shifts to index
> 1. The dt-schema tooling will then incorrectly map it to the SPU descript=
ion.
>
> Additionally, using an enum here allows arbitrary ordering and does not
> enforce uniqueItems: true.
>
> Could we add clock-names to the required list when multiple clocks are
> provided? Since it is not required, a device tree could specify multiple =
clocks
> without names, leaving the driver unable to reliably map the phandles to =
their
> respective internal functions.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510084303.12=
2426-1-phucduc.bui@gmail.com?part=3D1
