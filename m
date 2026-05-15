Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A8E3CC32C
	for <sashiko@lists.linux.dev>; Fri, 15 May 2026 06:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778828295; cv=pass; b=ai69f+bapG7sUpoFBscYxSOcAdxapcJXQhILRamPfyUpZuAB0cXjNQWEqqnrE8wt9tDnMyzIESKF50trLDXjOuHMQo3oGvCrFngp3mDbVXKnIO73TekcdWPM7DHAE7fntUa4EvlVZJUsc/eNLvESgCNtj9U3EiD5HiZRWaxIMDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778828295; c=relaxed/simple;
	bh=KUdg6NaWQDrpKtiYBBG7/RuYnu0UUwnrZH1VpFsFWGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WB0LTT02KOTA7fKtPy2SD0Op5BE9Ffmp4pKodN2orzS2E6pZMkVbEQgG7vIFzuWfwm6kDCSIZjSQ93whjDH1jL8egMQfKHigMIHC+t/We4nqHevbT4fkaTiB6zkJH6TuptMSgOzFocaDV9duZHBgp3EL4OGHVvVRJKWgpyPP70M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hlAUjJmy; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hlAUjJmy"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2adff872068so47462055ad.1
        for <sashiko@lists.linux.dev>; Thu, 14 May 2026 23:58:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778828293; cv=none;
        d=google.com; s=arc-20240605;
        b=HKEtoy7o9ekCdlydlNzAkw9FxDxYc3dfwdz7fXITU9gcci+18BOX3pTk2GOtQ5YRDv
         gKZQdqQ1RM46O7FW1578iC0J7WEA5x/oCkiztuHzX5AKuIDwIN3oXltuU9NV11t3J8at
         LfQ5SlOBFgVVcmuHYYtVYxfdPgQjFksUm0BDY9qIfXu5X6O42h5uA2cjco/8e/n16pmT
         8OxpLk5+qRMC609dFyDt5UoUVPal8HB4a0NDWuSGFetRObmOuyW7/tGQuZjbkDZNH7su
         5cvLyeiD5FmT0s5EydKYzMCUu28fHdM/TJtCbPtFc1HYc0OESUlw3ZtPoGrPe92ozjsl
         oZ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/eC1OtdjNZ3d+8g9rIjBdvZ8lfjkRUHKUFoBnIZ0sz4=;
        fh=835hh/BpkqnaepWx6ZPRcHoTWAcIncRXoQu1a+b7/s4=;
        b=PHBLN3ELmH5LULnnwYd9D7qzlCGvfnLFC+J2LPiPxaSHZFsFJHiIpw1zlaPDI9X5MD
         zc2mlGiRuVqU447u7AVQR3FpNkomD+e9erXbXVISMhf4iTuAvmwEIVaX90bDfkpkWsoT
         fMMDgMJMHWGu6Y4Z7BrO14gR+O4R6mFt/i+u36ttVn2wyJPbKlERLX5ykLh1nYkjuwBq
         eA76/X/l2NiL2sr0R+halwgacQASr9om7OWEvRM2//F0yCWWoqKAnGVfHcZsGy+N5lwb
         poNJ+o6TpOKaBrxA7X0Utus6Zguy9vMWHwguOMRoP9KgVuCnp2ij8IUMqPPrDdd+qUN6
         V2lw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778828293; x=1779433093; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/eC1OtdjNZ3d+8g9rIjBdvZ8lfjkRUHKUFoBnIZ0sz4=;
        b=hlAUjJmyqE5sTi+En0+nHNGnfEZGj3/OcsNdd4u0sva621ZKVNX459COhbKFODvJS5
         OOom6vOcHi9Xsyn8cxluYEuFNx60dBMkg2mHxC1NFVocdS84UW/3y5X0cgnUZo6X1ZnS
         sg3euSMNUxU5vR+3R0S8wAkct40Yk7ac3MW94+LMEw5r2lx94DBwxiMFvho+TRWo4quJ
         M/IjwXvXrrw1I7iuDxXoPvr64+M8FPQzPh9rMQEsplpVsAhUy77f14lb7wONcT9VMTeh
         HKp9cRXYZR5qabMBtC4WwLdNSsus/QoRPIhj6MxaCeKvxZYIvUUe1TWidhFHAlhxwEC2
         zAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778828293; x=1779433093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/eC1OtdjNZ3d+8g9rIjBdvZ8lfjkRUHKUFoBnIZ0sz4=;
        b=lCsjPGqJgNg9h63h9BmCC3KmkG+vWsJRCcRbRfchKm0x/J+cj4ylpmKAMfEQF9Ct9c
         I5DDTISJXEh4K3kg8eF+JMytLuD3lrVb/6saUoc0JdZRWBY8MH4jgbd6VHU2Ou9AM6e3
         mMOhCyiExlpLxqawtiwhMHua12rHm2SzdiunvrF1AxCw/GTS8tvMrn1RppLpkEwV3lyc
         5Otnc69i/c7pIwgJR++DEEXFKPtm+Q47KlX05YOX5V4T2wlt1eo8YpOXi5IQScX5U4RY
         jxjeUfFu7qnCA2JmoOko521nWJjCnTJkWJa1GWja+rWu2+aZ43ybArT/khKdLWJ19+ED
         TtQQ==
X-Gm-Message-State: AOJu0YxWGZK8D8Z2An3diI3ozo+YpVQmR0w93PdurIGX5+yeMuzw8Nl/
	RayWLJFIqqEG9Q2K/VZIYJH/lmq2yRvtx1+vWlqga2V6RFSJpqX69o879QaBYdwjG3+0YC3JwAX
	Ycq+w3WXpw+IMddpP69q1CK/uOtF+/jWXluSg
X-Gm-Gg: Acq92OGjXIpqQQk0Oj2W+ZSnsyIoKd/0MKWyuJ7beAp9oL9YALJuKsyXDA6uoNi31Pj
	Uz/u9Sa935NFRHWiDPhQi4VmkJrFEd7yniFMJqq5yxyfWqKDTAUzHh0YOLxmgCw9HFCIdhrrP8n
	VDiihujG8pR1jPeyM2fxK+7hJmnYs69Tuwu0P6K9/ZiiukgMHDfVzwi3CXg1346PIixWwZW13LW
	pJrS3aTRdtkQz9b0e8Ah5IFH0NYEvR19mklgldL3sN3eb2XQYs8+iMpqLzqsZZAk08YIad2ks7w
	FBUXxAUHOvwlyJPByAW1A9DU4IsO0k9kKqv/0w==
X-Received: by 2002:a17:902:bd0a:b0:2b2:4260:109 with SMTP id
 d9443c01a7336-2bd7e980363mr21178305ad.23.1778828293255; Thu, 14 May 2026
 23:58:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260510084303.122426-3-phucduc.bui@gmail.com> <20260511220354.CCDCBC2BCB0@smtp.kernel.org>
In-Reply-To: <20260511220354.CCDCBC2BCB0@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 15 May 2026 13:58:01 +0700
X-Gm-Features: AVHnY4IkpWSudu6WWXvdLPvc-p7JcRPzpQsP4WMEAKh-EKbzc9nN8ZsT1I8ujWg
Message-ID: <CAABR9nHrBceHOoOR1ZqoBPjx2JyWBFKtYh_VNOoa8oeF4+St=w@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] arm: dts: renesas: r8a7740: Add clocks for FSI
To: sashiko@lists.linux.dev
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, May 12, 2026 at 5:03=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> Will adding the spu clock to the device tree without the corresponding dr=
iver
> support cause the common clock framework to automatically disable it duri=
ng
> system initialization?
>
> If the bootloader leaves the spu clock enabled, and the kernel disables i=
t
> because the driver hasn't claimed it yet, could this cause a regression w=
here
> the system hangs on subsequent register accesses by the fsi driver?

Yes, that is the current issue.

The SPU clock was already present in the DT, but since it was not managed b=
y
the FSI driver, the common clock framework could disable it after boot.

This change adds the SPU clock to the FSI clock handling so it stays enable=
d
while FSI is active.


> To maintain bisectability, should the driver be updated to manage the spu
> clock before or in the same commit as this device tree update? I see this
> regression was addressed in a later commit adding spu clock control in
> hw_startup/shutdown, but it may break bisectability here.

Reordering should not be necessary here, since this is a pre-existing issue
rather than a regression introduced by this patch.

The SPU clock node was already present in the DT previously, and the later
driver change simply adds the missing clock management support for it.

> > +             clock-names =3D "fck", "spu", "icka", "ickb", "xcka",
> > +                             "xckb";
>
> Does appending the external clocks (xcka and xckb) here without the inter=
nal
> dividers (diva and divb) violate the strict positional order defined in t=
he
> device tree binding schema?
>
> The dt-binding schema for renesas,sh_fsi2 defines the clocks property as =
an
> ordered list where the 5th and 6th items are the internal dividers, and t=
he
> 7th and 8th are the external clocks.
>
> Since dt-validate evaluates array items positionally, will it evaluate th=
e
> external clocks against the internal divider descriptions? Should the arr=
ay
> be padded with dummy elements (like <0>) to maintain the strict positiona=
l
> order?

No. These clocks are defined as optional, and the current schema does not
define fixed positional constraints for individual clock entries.

Best Regard,
Phuc
