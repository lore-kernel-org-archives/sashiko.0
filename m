Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBD9345CAA
	for <sashiko@lists.linux.dev>; Thu, 11 Jun 2026 05:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781156594; cv=none; b=R6jp44w/UNmn7Reen1gwXZZsAUBB8nnNdFvJkV6zjKpiCcrQGibbtedFtO5Ml7sd2zlOL2F3k1W5AA2vuqaiaJzGG3/iqjWZCTMfl9dHPd/l/7i5SXg4a3aNYrx6WC8CqisomMfhU5ZauaLetU/czkcdRgnVhwhbAQVkaItmr2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781156594; c=relaxed/simple;
	bh=cgnZe9Zo0ZHFjiKAvOqf6uh2UWx48g1JrXcQ5xzTeqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdOz7YTywe2ECnKC0bHEUw25IPAOALvf0QC9o+RjfCtCaLOFI++9BqHnEyhifWvAvh9ze3POuPSP79FdOIvXo8l/OpyJNTWr6Mkx7zziUIsmU9Aq2Ti7v2DChQbU6i+KIpyafFz073tzPrOR25+BZDbi3Yl9G/HQa/fpYbq9H/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XTr08iCH; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XTr08iCH"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so4810135e9.1
        for <sashiko@lists.linux.dev>; Wed, 10 Jun 2026 22:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781156588; x=1781761388; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cgnZe9Zo0ZHFjiKAvOqf6uh2UWx48g1JrXcQ5xzTeqo=;
        b=XTr08iCH4ALSr/pGpqscuk84AveXPGAKMxP2GDqav9Ciaac12AvgSCetbOT/NAE2OK
         ZXc4nLyJvbvgfN1ueOzhvZB1b5hOqMzLtNS8PiqhORPhLDgzRHKZ7Z//yRnr1QZaNX9x
         0I3mWHyVIfMmUpKMTU6UEDbqsCZHM1AJhwvikF6KO/0bPujkrYTDPS8+fk1b8jIyhe1J
         OvD+iaDS3Hq8uNudC/NplbBw/HJn6QRHld9czA+D+I5uG6R1sSe71NgYjCV7hHBwFJ0C
         5OldWAp/mVNfaoyaNCafvpcfRWnJX/xPj15+XD2PFB2A4+rxshQ/rIT0tEKt0CRApvyh
         YTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781156588; x=1781761388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgnZe9Zo0ZHFjiKAvOqf6uh2UWx48g1JrXcQ5xzTeqo=;
        b=midcv/zZ38ohgw84ZuQjF82jIeZjUMFgx5eTq5GIwB5Aqkga5aUu1ltyjpzaFVMRhE
         98Q6L792Y3iMIcHZHJb72AbFYy+xmPmFJNtywdponNufUjq9kUlEPrkN3PI0P7F5ZWaF
         pQpCeTdklvI/v1y/b34sqluCH6nT8DvsdTWc+tNpq+f3zIvOrttegoaU83+yjlR4W9EI
         Gofsn4RRC3w4Nj22WHyAvj5QSjhoufs5E8S+NtZsdjWoY0E+zXjJSKaznPEnL530iM2F
         P/gdNBPHoRkAj9O8riLm8rd3z13kjiKuczU2c7s32x/dDj8pr9Df6QfjXq1QvlnSZ78l
         pElw==
X-Forwarded-Encrypted: i=1; AFNElJ8DWIjXWut3ZIitXqJyotJlgUgdzoftHoZAgAtM+Qfz+pysFvke+WufMZrrttJO4Za8F20FCUNY@lists.linux.dev
X-Gm-Message-State: AOJu0YxX6mdsBPG3cKYEuFYuHXxpYxbli9KYDXnOE/aJTRum1q5tQj7e
	O+X7B5WC6HiJqT5VJagdPDKI0UiprdZLJSgEUWWJcjVKH4Q2Fk4KevbH+JrOjkkoGdc=
X-Gm-Gg: Acq92OEtBRDk4D/8VfWsnx6BM9MzOrgR66nB4p9bSwqaZMSryLT4LH0hq8tZ2DRw6zN
	S691r5krrJAEkLSEyh+lbrtBMAub8oDs0oQlCuHebvGQIYnwbLm0ebHmFlEgunESGn8gnAyhYKX
	CK5vWwHsD6lmhrU3oOqCeGnUfM75NsiV96U4jLd/rFQXBzGNnDyI7LBxbK2Y8PUPRkWm4VV8gzE
	m97uyvcMXcFaHqBzGXffjS5VrDdjor452OWLtXHC+JXGBMmZCMMRMx/e3m2+H0CqrcE8waVHNFU
	lrPxGyt0GS0nWNVLbXIkYO6eMkFVANptGzHKshajFAkABxvk1iq1yVDHmnpZc+jOxZUyWb8jrJf
	61iouOq3ICPdrAn8Pw+GpIPQ3BC4E5UINn+TH9CU/feOACNFeLHK4tCSQpaZZZMHSOifO8usmGv
	o+pSP3CygQe5ed6YVuQj7sJOLkaru/MMw4Eyd1vH4=
X-Received: by 2002:a05:600c:2d4b:b0:490:da23:1d50 with SMTP id 5b1f17b1804b1-490e50fc9cemr6949465e9.3.1781156588495;
        Wed, 10 Jun 2026 22:43:08 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:559d:eec2:887f:c200])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4601f35fb24sm83598500f8f.34.2026.06.10.22.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:43:07 -0700 (PDT)
Date: Thu, 11 Jun 2026 07:43:06 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, sashiko@lists.linux.dev
Subject: Re: [PATCH v1] pinctrl: Use named initializers for arrays of
 i2c_device_data
Message-ID: <aipJa6qc8_isXFd6@monoceros>
References: <20260517134835.588648-2-u.kleine-koenig@baylibre.com>
 <aimZ-yzZ1hAut_KF@monoceros>
 <CAD++jLme4HQjp6kWWsgtuiAfzPU5mUOHPEY0EBWF9dZSrFp=Ag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="csy4capwujfxztmy"
Content-Disposition: inline
In-Reply-To: <CAD++jLme4HQjp6kWWsgtuiAfzPU5mUOHPEY0EBWF9dZSrFp=Ag@mail.gmail.com>


--csy4capwujfxztmy
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] pinctrl: Use named initializers for arrays of
 i2c_device_data
MIME-Version: 1.0

Hey Linus,

On Wed, Jun 10, 2026 at 11:22:32PM +0200, Linus Walleij wrote:
> On Wed, Jun 10, 2026 at 7:09=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capabl=
e Hub)
> <u.kleine-koenig@baylibre.com> wrote:
>=20
> > Gentil ping! I'd like work on the patch series that builds on top of
> > this patch. Do you still have it on your radar and maybe even consider
> > to apply it for your v7.2-rc1 PR?
>=20
> Actually I was waiting a bit for reviews but noone is saying anything
> (not even Sashiko!) so I have applied it now!

On the sashiko website my patch doesn't appear, so that there is no
feedback is no surprise. However why my patch didn't make it there, I
have no idea. [I added the sashiko list to Cc: in case someone wants to
do some research here.]

But let me assert you that sashiko is mostly happy with this type of
patches, the only critic is that sometimes I pick the wrong commit
log template or forget to mention that I also removed a trailing comma.

Given that the patch doesn't modify the compiled result, I think we're
save---even without AI feedback :-)

Thanks!
Uwe



--csy4capwujfxztmy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoqSucACgkQj4D7WH0S
/k68FQf+KXPPTnUQ3jzjcRqrHFehW4igG5ntwzEqepVlejviYR6enZXlXlC+m7m4
3yI+jrob6bkAcapa+ZE3dhGBqCYgc4Eey3N/yyDptQ98BvunRoVY0Zo4euIrHIU1
nlTw5L7xnf1MPxOCyiUQTYBzikniJzK3Q6yiEWOSY3JjzbnnFGxJ7C17+Oa+5ic4
1rmo7wfTz5054BFScCiFhk5rGQcwGSfmACQEcYNDXSb1qcx56eUZZKIvGFadpQmH
cRZTO9+Bwng71J3stVAkpWq9Jugy6tchzp++N8XkxZbn6UoEj+WS6HgPrYUbqki0
/ZmR+3R5guKfGlxiiuFU40C4Lozglw==
=MwRd
-----END PGP SIGNATURE-----

--csy4capwujfxztmy--
