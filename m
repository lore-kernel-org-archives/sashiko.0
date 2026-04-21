Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBF63D666A
	for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 13:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776777041; cv=none; b=rfCDTuLiLExVPBN9g6QIfEAYmBHI9y7MqIT+09APBdWtNj0RiazCJ8KYwEPe139/jjtyI4Wi+tAsmYXI5S3sGhmRoWKhJYs/+4WW1NOXHCocW6+0D5qFh8YQ7uhZCkP4OuigMQIlFFo49y57KycxTxPMrMTwHYTcoZiAjlmhkZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776777041; c=relaxed/simple;
	bh=Zzm5CAG0BkJ3OvqWHmNeQbEFq+tYr1q1wutZ2kme2hE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=htTojYUK6KaJ6BDdKrZZoenIoxCivuBaR8oYH/0Oo2rt2S+YMFEiGq8InSlMzcM3mHuPwgYq9gpwoGwOx4WclUjbsA2AzdIyKnS2c/GguTcjOrtzCrhjqxTMv1dvVyv8/i2S/URdoddkwtJcYK4uz2FSMGB2Frycu65inF+BuAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PLzZnrdq; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PLzZnrdq"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so26708055e9.1
        for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 06:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776777038; x=1777381838; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zzm5CAG0BkJ3OvqWHmNeQbEFq+tYr1q1wutZ2kme2hE=;
        b=PLzZnrdqbP1uNqjyBo7fGoQGirlMcgw1WFVbgX/f7WUdgM0yglQZMBQ6kMXaMniuqz
         atGI/auXf9uDT3hzDolQ9E7MOFfK7H1Yoo3kSyiqwYn/rl9v3Bml9zajNqc4lG3Tp2ZQ
         uUcDcIXBUOzNsa5M9VjQhO9V1qs1W5j8LfsVtHzffWxEcEXYygEDHHTgrJzrQK2yzIRZ
         RY9spUyGFqHFvMv69DxxJZLvoYczyY5z3+q4wtq1f8+S1iPkrj0SCNo4bzeO2i8MOLoe
         DjMwucbUeVdrUZhrmMKv68RemwJZCjhvF6QxWKVwfX+VQ1P6LUQsxr6+0by1X8N9wDGM
         a6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776777038; x=1777381838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zzm5CAG0BkJ3OvqWHmNeQbEFq+tYr1q1wutZ2kme2hE=;
        b=kfxQ9n+q56qsNrzDdoNWVOt3rvHM+Los8tcnnfbDovYg3D9S27Ndjr+L4Vbk6iNogh
         qGuTjyHIwgDYMRh7UbNdJiQ6wlairWPzE2sZCPNq2tunDotrACQuK2TpNli7jcjrQMBd
         2NurT3niJ4ipYkJMaAxEfg0kfSRoABnp1yKTGZHBdQK0v9aVUcfDVXBz4XgdM+xg/ySe
         NacD6gztOrIwD85nDH5Nfl9S2gEheIAf80MBXDqDFMLEUZgwsNEwcozS+BQmhzniov/l
         s6sHv0Z9XZX4gFocF8KFoXBum93a94/kOCT2GePKDRBbb9PT77V/NbdIPnAj3vEdDsI/
         fQ4g==
X-Forwarded-Encrypted: i=1; AFNElJ/ruwjraC7YZmDhxIshzE0iN7z81wxv6PETd7NM2vuq0bbYDCBYYrr+LgNQSY/Yz0Xi71XJMyIY@lists.linux.dev
X-Gm-Message-State: AOJu0YyQ6ihVAF5d56Vf7LYWJsHUX9VCqJVTn2R9MrLXP2ZVD2y0mI2h
	gagie8VCd5C7xpOWuG9elM6dps548l+2/TbZNppm1IQT3lrzNAMYAb4hIZGjWURzqQofundjG3I
	vz0Tzqyg=
X-Gm-Gg: AeBDieuF2K/BjqS6JvLcESvxGOjGs1CV+DBVC4hFLGKv2LQc06emGJW/2EO3yXodGDk
	H9b7k63CIVf4WNusD6lnrPxWgc5V91mmUAp+FQAAFPBFFXvh/ZhWE9ANYMZWTic3zUnOluM/+o0
	c127IktnNn/E3J5S/Dr95Qs5AD9XXL4roPYdu+vIrHLqZi4s6IfSuwOi2OkGAqiljm/07PxX1fH
	UonjrAuZZ5K4u20kYHcMPbMywyWMV/0yOwwaHgAgyPZRW5Sql5uZV+y4Od5FxirJ3xt8AjoCXhx
	xcGE3wGR8uVMpc2pEkC7Q6JmQInW9/ejoYjfnoj/JGXcusMLxVpGaH/YHAnQ/6du44tcTHd9Zue
	pdSuW/2PJf887Brt+YwCtzJXHwjHSNgL3zZDRMaSRwyWaq625VjyJ2t8dxYfgaoA6KNIG+pTdlt
	IeV5d1L8fSBfjM5OwWRhv7RXMs
X-Received: by 2002:a05:600c:8b84:b0:480:1c69:9d36 with SMTP id 5b1f17b1804b1-488fb76e4aamr282461815e9.17.1776777038432;
        Tue, 21 Apr 2026 06:10:38 -0700 (PDT)
Received: from blackbook2 ([84.19.86.74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1cfbf2sm381981085e9.15.2026.04.21.06.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 06:10:37 -0700 (PDT)
Date: Tue, 21 Apr 2026 15:10:35 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	"sashiko@lists.linux.dev" <sashiko@lists.linux.dev>
Subject: Re: Delivering reviews over email
Message-ID: <wer6utbjmuknoa3qny3q32e2wkd2adnr74a36pxih3icopz6go@3dgovuapwhyt>
References: <7ia45x5tuj88.fsf@castle.c.googlers.com>
 <z4eztn7epx6kghtm3nyoiexhnbxxc755f5vvh73gtir3nra6yl@etqgkhrpx6r5>
 <7ia4v7dl168f.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oogvayoyrdoipwul"
Content-Disposition: inline
In-Reply-To: <7ia4v7dl168f.fsf@castle.c.googlers.com>


--oogvayoyrdoipwul
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: Delivering reviews over email
MIME-Version: 1.0

On Tue, Apr 21, 2026 at 12:56:16AM +0000, Roman Gushchin <roman.gushchin@linux.dev> wrote:
> For now I just listed you guys explicitly:
> https://github.com/sashiko-dev/sashiko/commit/a9dfe0d103b2ea0e47d3efff56c40c563dc10108

Thanks.

> I hope this works.

I confirm it already sends.

Michal

--oogvayoyrdoipwul
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaed3SRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AhXPgEAiVJHltPIs7ev5tAjD+Sv
//Hb53+Roooklun3VlpR+DQBAN/a/MSzF42iY2Uw4xaY8RwX5yHhND2sSsUcbWvt
XbwD
=5BRQ
-----END PGP SIGNATURE-----

--oogvayoyrdoipwul--
