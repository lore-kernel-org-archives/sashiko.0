Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4025395AD2
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 11:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778586939; cv=none; b=jU4l1oDfJq+jTOjuxIRUihWB2f2TJZCI1yXBl1dlySXKc8Ik0aWWuYum2X0tddQJcH6paB92D1uHWb+KLKy8CylFX/OMm96R5MXmuodtNE/FWK005kGvGlnX6a30hZL1+cFmg5GMZ4DriX2sUyPJewSHs1nFyxviABBVo8unJtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778586939; c=relaxed/simple;
	bh=j+DsivULN9fsFBCX66MvkwLgGPE+FN39iQmBiisOpy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pfqXJ0SSJtXCbp4YZopeBSZjOqwZcJRYDjBMufX4Y8H6TwSMvo+YduxPgpPc96JxbrkeTnvjG1EKb80h4K1WeJda1QMhHVoxtjdOlvaxtqwPRWq1wBs8fGEUQ3r7wqGGKLtKBRPfdO3Zv+AL8fudYXirajq7uO9JXAgn4jvvB/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWy0Itmm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWy0Itmm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A732C2BCF5
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 11:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778586939;
	bh=j+DsivULN9fsFBCX66MvkwLgGPE+FN39iQmBiisOpy0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SWy0ItmmVisT7bAIZ3ra/BAiOfNQl78R4tfUSBBz19vx5uCkI3khqpCsqLBkbUajq
	 /lPTxBbyvYxemiViMDwaC8+9h4IHbqeuLu2hH7BS9pvcD4qW35dM/GdlURMEzAKKMa
	 h7h35eAP1XR7kIdS5MS1xT8tgdbnwsqj9jLkFQlyNULlBhBL+Wfv/65/QfBd9ZwxtJ
	 g49U0xU6vjTPmdSg15qFpiITtmkkVLUnwLKsvfMj0pdE8BPv4dhZm0pnmhauNJt1Xv
	 u2BB2+YtMWn0/tAggApRqHY5/Zav0jtdD+SpP7lyF0WCcpmM4PPs9h1KgmJ8Smy739
	 bMBNr9TWsy0/g==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-67cac5ece75so8935456a12.2
        for <sashiko@lists.linux.dev>; Tue, 12 May 2026 04:55:39 -0700 (PDT)
X-Gm-Message-State: AOJu0YwdUMU4AtjRiOhKBQ+sS5tiV9k1w5ai6v02NxpDVv3NO+RRQTlX
	Bj5JKcDWb2ckyw/sLmXu7QhUUp1aQ3ahGYbr+4B9klGJ++4IRsccgbLggIQL2Qy7Qn9ZkABdDgn
	Hok0LOp0mrPGdabhaxOeO8dQX7F57Ug==
X-Received: by 2002:a05:6402:28cb:b0:67c:7697:1ee8 with SMTP id
 4fb4d7f45d1cf-680cdd250cbmr1451214a12.5.1778586938007; Tue, 12 May 2026
 04:55:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260511111116.1109643-4-a.heider@gmail.com> <20260512022817.879A3C2BCB0@smtp.kernel.org>
 <4ac5bd1a-ac7a-420b-b0ce-acdcee4b20e2@gmail.com>
In-Reply-To: <4ac5bd1a-ac7a-420b-b0ce-acdcee4b20e2@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 12 May 2026 06:55:26 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLx6uwsjTHgcmqRKu32Mh4vJPu=u=N7DjVeGAaK04mOWg@mail.gmail.com>
X-Gm-Features: AVHnY4ID7a0_3CCCWYxK655cEtAfDuW2yCI_keSpCnp5egP8iN4fy14pBjhwNhk
Message-ID: <CAL_JsqLx6uwsjTHgcmqRKu32Mh4vJPu=u=N7DjVeGAaK04mOWg@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] riscv: dts: spacemit: k1-musepi-pro: enable QSPI
 and add SPI NOR
To: Andre Heider <a.heider@gmail.com>
Cc: sashiko@lists.linux.dev, krzk+dt@kernel.org, devicetree@vger.kernel.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 1:51=E2=80=AFAM Andre Heider <a.heider@gmail.com> w=
rote:
>
> On 12.05.26 4:28 AM, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to consider:
> > - [High] Potential overvoltage risk for the W25Q64FW SPI NOR flash via =
the 'buck4_3v3' supply.
> > - [Low] The unit-address in the 'uboot' partition node name does not ma=
tch the base address in its 'reg' property.
> > --
> >
> > commit 470f9c74bd3cfec41ed69dd8c4e22535a7e8164f
> > Author: Andre Heider <a.heider@gmail.com>
> >
> > riscv: dts: spacemit: k1-musepi-pro: enable QSPI and add SPI NOR
> >
> > This commit adds the QSPI controller node and describes the attached
> > SPI NOR flash. It also provides a corresponding vendor flash partition
> > layout.
> >
> >> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/ris=
cv/boot/dts/spacemit/k1-musepi-pro.dts
> >> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> >> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> >
> > [ ... ]
> >
> >> @@ -166,7 +166,7 @@ buck3_1v8: buck3 {
> >>                              regulator-always-on;
> >>                      };
> >>
> >> -                    buck4 {
> >> +                    buck4_3v3: buck4 {
> >>                              regulator-min-microvolt =3D <500000>;
> >>                              regulator-max-microvolt =3D <3300000>;
> >>                              regulator-ramp-delay =3D <5000>;
> >
> > [ ... ]
> >
> >> @@ -249,6 +249,47 @@ dldo7 {
> >>      };
> >>   };
> >>
> >> +&qspi {
> >> +    pinctrl-names =3D "default";
> >> +    pinctrl-0 =3D <&qspi_cfg>;
> >> +    status =3D "okay";
> >> +
> >> +    flash@0 {
> >> +            compatible =3D "jedec,spi-nor";
> >> +            reg =3D <0>;
> >> +            spi-max-frequency =3D <26500000>;
> >> +            spi-rx-bus-width =3D <4>;
> >> +            spi-tx-bus-width =3D <4>;
> >> +            vcc-supply =3D <&buck4_3v3>; /* QSPI_VCC1833 */
> >
> > The commit message notes this flash is a Winbond W25Q64FWSSAQ, which is=
 a
> > strict 1.8V part. Could this vcc-supply assignment cause hardware damag=
e?
> >
> > The buck4 regulator has a maximum voltage of 3.3V. If the regulator def=
aults
> > to 3.3V or is configured to 3.3V dynamically, it exceeds the absolute m=
aximum
> > ratings for the 1.8V W25Q series flash.
>
> As per the comment, there's a the non controllable regulator QSPI_VCC1833=
 in between.
> k1-milkv-jupiter.dts matches in this regard.
> I'll keep it unchanged unless someone has an idea how to express that in =
a better way.

That's what we have fixed-regulator binding for. It can take an input suppl=
y.

Rob
