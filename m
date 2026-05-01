Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E3F37CD4B
	for <sashiko@lists.linux.dev>; Fri,  1 May 2026 09:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777626381; cv=none; b=ZBZanNQvC+8KfJ7Vkifi85OdbqZyL5MSr4YCiWjaU1rTjrXBdYlcNEYC5CF5tNNr8NwE+BcSs9G8kLipOsiSAh7odqD2DSchJ26BN1rnvFZscdIajcd3EZK6wZu3IHxCsMUGNMVY7C+nuYJ8KGkIKoj+uIBaV1WhEDK9tdo4PYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777626381; c=relaxed/simple;
	bh=f7hQPoUNOPFHNms1VtGeIdzhO2Fg4F8IUnwgd9ABmKI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iZcUv6Z/8oykN6CwSuJlL572+DHGxAnc/vNObYUinO2JO4fBst0guYbLb6bu/FakGubk/mLwPCDZ7KXg5d7hfiBxgcaftZWXqa8/LWSYy/B6KRwVkQveKlaG08en9dbVYdtsBJZv8AiI9ZaQKWpok2Nd6/azENfJCsLURvYr6I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eyqVFOlv; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyqVFOlv"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso14726005e9.3
        for <sashiko@lists.linux.dev>; Fri, 01 May 2026 02:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777626379; x=1778231179; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FAli/ojvvv60g9jGIIaKkrzw2RR4VbZckKfc9cgNVPM=;
        b=eyqVFOlv44t/M8u47Ls0ilqGSI0yA0fdfvLJ8RWlip7/fy6gMun+m8GijZ1ybp5r0V
         9+uGKWWv0ex6OuV9xoA/1twNLXEYMUkwNEaK60dQwQAeSwlJQx/uPYZWU+68XX6DElqQ
         0aSY4u994InF/weAAPCUg0H/ebnbnnJqvln6JR9GFO1+jjaHEQ/3HHLstlUeCu26Y4P3
         50TUDxX0ZNCDgOAyfwLtDNez+S9xljGArimhJZNk0j+UpQWuGoX9P6CZlT6Sonw+Wovc
         FwtIC/lD5EkhQJ0EO+zB1zhm7jPV44+nn1Re9urdJV9JgH03t84UaReWIbjWWpjJYb1T
         kHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777626379; x=1778231179;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FAli/ojvvv60g9jGIIaKkrzw2RR4VbZckKfc9cgNVPM=;
        b=o+W/cVqY0k2XQlIH3SvTgxmufRvo/F7NVl54xvv/15oHps+Yqjjm04ggJxweVL62zJ
         CX535OjD12rcrNj0DEyLZ631FTjsQOAwb9RxXf61ME4GUD4xvH94n5tQBnlVubYChh7X
         yd8Kfx/RApbQODX1fQrJzoT4s51KVzX93Mkrw3R+qW8zXjLXYycRiHfhrjud5H4cIzYZ
         TnzDzx7MnKwab+2ylQ9jwyyfposrSbDv6ab2AsykUsynJFNqprDghCm/Onj3rvIQORaa
         HfD2GdQiv7JELssUUqCZg9NeY74LfPBqctcHTPkBs+FbTaKbvDjCvlT9uEKGOVb/ANwo
         2oAg==
X-Gm-Message-State: AOJu0YylNADiTJAhxNk45VqjqYQx7xK/em3DMiUI23LD2qM77PAWgrpf
	1j741KyBitx9eXZpd8Mivt2LSFnGK8lknpnWFnT1Ei/+h/Oo1VMGBBT0
X-Gm-Gg: AeBDiesfoFUgK1DUKlk04wCOhAtzmRFz2Ev4T0ZVoc7RvaAZnvN2+fNwda10f1lq6fa
	hOuKSSHpNWPI4sUyBnah+efb8o8EQd33CmrM8fxhkzqum6nNIK4LKOcgvi6dF99lSOFQXsI+TBr
	NZA8GcYLE3ii/RJQxBLXun9emRS/OotQH7Svi37BNVyzWssyJdvzkloDZexEnqUTY/FIsIqIE0a
	2JB+Fl/aGSZrOE8G1E1V4DBSHJSgM9WOp4GAZaqfBN0vwgk86KvKL4f5KXzytXmqztLIGP8AI4x
	JQz/p7djCBVz0Z7PHvDm18C7G2f+fkQlH9NNI48jx1wyBLa8OVVeIjWHTeBfNaiDEmUPPkl5tJX
	dDgDD4/GrokWE9CHf5qzWuk+lYAkAMIMxMx/FsROHBQjifLX2zNfB1mCx9hpq99/7Oao96WPf+v
	mV7nEdT4Xq208Sfq5U+EhDHgLbGf9lJbxqn3+jCDcC0N0ANTE8c4S5gRc3od9nJTJwHL3zXfF+M
	fRBnceBshZG
X-Received: by 2002:a05:600c:3b2a:b0:488:b99b:4177 with SMTP id 5b1f17b1804b1-48a8eba4225mr30082085e9.25.1777626378454;
        Fri, 01 May 2026 02:06:18 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:56e0:ceba:7da4:6673? ([2001:818:ea56:d000:56e0:ceba:7da4:6673])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb3427fsm69224565e9.0.2026.05.01.02.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:06:18 -0700 (PDT)
Message-ID: <40d4b3f058d70c8e6650dfd2e453315b42fe371d.camel@gmail.com>
Subject: Re: [PATCH v12 2/3] hwmon: ltc4283: Add support for the LTC4283
 Swap Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko@lists.linux.dev, Nuno =?ISO-8859-1?Q?S=E1?= via B4 Relay
	 <devnull+nuno.sa.analog.com@kernel.org>, linux-hwmon@vger.kernel.org
Date: Fri, 01 May 2026 10:07:17 +0100
In-Reply-To: <190bf39b-172d-4852-be86-1d7379d7d4aa@roeck-us.net>
References: <20260430-ltc4283-support-v12-2-5dc9901f2567@analog.com>
	 <20260430100343.45D31C2BCB3@smtp.kernel.org>
	 <e2d14b68-7f3f-4bcb-8687-857e9335deb8@roeck-us.net> <afOH5xx29LGJ9yKH@nsa>
	 <190bf39b-172d-4852-be86-1d7379d7d4aa@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2026-04-30 at 23:10 -0700, Guenter Roeck wrote:
> On 4/30/26 09:50, Nuno S=C3=A1 wrote:
> > On Thu, Apr 30, 2026 at 07:52:55AM -0700, Guenter Roeck wrote:
> > > On 4/30/26 03:03, sashiko-bot@kernel.org=C2=A0wrote:
> > > ...
> > > > > +	id =3D (client->adapter->nr << 10) | client->addr;
> > > > > +	adev =3D __devm_auxiliary_device_create(dev, KBUILD_MODNAME, "g=
pio",
> > > > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &st->gpio_mask, id);
> > > > > +	if (!adev)
> > > > > +		return dev_err_probe(dev, -ENODEV, "Failed to add GPIO
> > > > > device\n");
> > > >=20
> > > > Can this error path lead to a use-after-free?
> > > >=20
> > > > According to the I2C subsystem rules, debugfs entries attached to t=
he
> > > > client debugfs directory are only cleaned up during the client devi=
ce
> > > > removal function on driver unbind.
> > > >=20
> > > > If __devm_auxiliary_device_create() fails, the probe function abort=
s and
> > > > the devres subsystem frees the st pointer. However, the debugfs fil=
es
> > > > persist and retain operations that operate on the freed st pointer.
> > > >=20
> > >=20
> > > AI taking everything literally :-(. I'll have to reword that guidance=
 again
> > > to include the probe error path.
> > >=20
> >=20
> > Yeah and it is annoying it always comes up with something that could
> > have been said before. Even more annoying some of are legit issues :)
> >=20
>=20
> Agreed, but I think it it is better that it finds the issues in multiple
> rounds than not finding them at all. And I have to say it is very human -
> the same happens to me as well when I do code reviews of complex patches.
> A major difference is that, unlike me, AI doesn't get tired.
>=20

Yes, nothing I can disagree with. Until it continues to come up with legit =
reports, I
just need to continue to re-spin :)

- Nuno S=C3=A1
