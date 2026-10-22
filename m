Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792672806;
	b=owsvbeVcW2DooQFqUtwjvu/rYMHgW6YYriSzlsa83hlfvt1zoD6TE9fLUS/yyiHOvHqp
	 LH11ehtqpNbn+G1iUePtxBstHLbvPM4iUmQ/9vz9OQpRHB3jK1DrqWurypV+1jSYu5Koa
	 dObal5CSHApOANGidyPG2e6R9hvAQo/nbVWEQCALhIKjkNv+HO8p5d2qLxcNpancy94/P
	 K6LpQ7s1bhBdW6l2wV78rddwq2jBUkbK0LAVMvAJk7R4mLhkxOatjjZvjBwjdui5lbVFU
	 wIlVM1oSIAi4XEdX6Mf/NcigaRhwecE+tAc9TP9TUrhFQ/oU3hCjAibUwuEMpXVgFIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792672806;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fbAd6sOH6jtlVaqldmciSJ6TDZjPBt59P7MHuVHt/uI=;
	b=k9Iae6XUOXynxgUrhXskzlyC06UAsWfOpgQG2yI5RqnB2J61zoEJYVRtEJP+BnzhOh+k
	 VQjHCtaNtUWsUf0FOQu2+zYGdS6r4AXYdTI6D2BimJuQYPu5aljLUBN+9bcFLuP4Ypyov
	 UYQLUokvlw6UrIrVuwwolwa0kJQdSa7wGvrBHpTgR5ptErzLBYjXD5YN2QlH3LiUsqYHt
	 JkVjbiyMxweN4vJyVUGIZJ2kG6AX3SAMIkcHamvZu9gUVMSP75O3YpVrek9sznbgXPbjc
	 m9J7CKTHW22Gd/RI0OmdqLjvOTDlpqDZetZgAvJIhoKDKAQQmX/1ZYijgjIFWyowIpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="glMlBS/v";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D53F606A31A
	for <sashiko@lists.linux.dev>; Thu, 22 Oct 2026 12:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=glMlBS/v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ADA31F000C5
	for <sashiko@lists.linux.dev>; Thu, 22 Oct 2026 12:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792672806;
	bh=fbAd6sOH6jtlVaqldmciSJ6TDZjPBt59P7MHuVHt/uI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=glMlBS/vhtrYgeFZFXkz3d3cKLUmWxTrtAXwg2CVC+ztRyt96efjJnaQpLWj7WUVQ
	 c++TvBpCQd/CpA2vf5siz6BPwxkERAIjkhXaPUQ7cINwdLPJjvJTQ+pAMlLy5D/A86
	 P4d1VAco13/JvxZTR4Ps4E/Omnff60B/qi2nnriLqBVAF5Tw9D2M/C2c164UzhWsXc
	 On74y4fdD9aPO7WACA4oiyMcAfRewsidG3SUk8797RNf6USD373DBBUOgM3vJNENnA
	 gAmjQGG6RTtxTnAnQFS6fUUJlzYh2GKSr89cP7vgdbzoL37ySxKbDJAnhIjv4hGJIk
	 e+OB7KCYu/Oug==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be4fea434bso756610e87.1
        for <sashiko@lists.linux.dev>; Thu, 22 Oct 2026 05:40:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzT1xMYyBLyKl7pBQIViIgbBHi5sx6nEynP3Czj05LY6aZO11PawIoR92SfHTgk3qqIXuJnmjJa@lists.linux.dev
X-Gm-Message-State: AFq9FYKcD1OHEHP/zD2J/dORUIe37V+6nhSI83ZvkFfxVKwXNUGnz27H
	zFA+TMYsF+koitM6g4YhArHa1pk6Vdtcdn9nRuiFvqNZbl0EigDY8zhTbrbrNKnwEuCYNlnPnY3
	Kmu76hQ5qtyhG9/OUClyQS92zbqK2xQ4=
X-Received: by 2002:a05:6512:2398:b0:5b8:f56d:d13 with SMTP id
 2adb3069b0e04-5bfa72f69edmr901729e87.40.1792672804655; Thu, 22 Oct 2026
 05:40:04 -0700 (PDT)
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <atO3pCuUxI950ftN@mit.edu> <3354ebda-5158-489b-a577-5cb10e5d5fb0@oss.qualcomm.com>
 <atZ4J86j7CXF82HX@mit.edu> <2fef166e-088d-4ffe-8d0a-0143aebc1b26@acm.org>
 <ate8oESqneK-3sQJ@mit.edu> <7e473af8-2f7a-4a36-a926-e756873c9c52@linuxfoundation.org>
 <atic3bbDeyJI6MJs@sirena.co.uk> <atjlUoEmTagZjrYI@mit.edu>
 <atjpS__OwjZ-Q_Fh@sirena.org.uk> <20261021114524.4c2ea2a31a9d527b78e78768@linux-foundation.org>
 <atn8Bcgvj9RGGTL3@sirena.co.uk>
In-Reply-To: <atn8Bcgvj9RGGTL3@sirena.co.uk>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 22 Oct 2026 14:37:42 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jbfvLO841jo7sxvN7uWGqeRk=AcPrXzgqMbyOTbSBj7Q@mail.gmail.com>
X-Gm-Features: AclHuK_zs3_d2tDskXJZLyTEcUVJi-R-HAXw9hTiIyFxOv0fmAMEBXdUzwh7MJg
Message-ID: <CAJZ5v0jbfvLO841jo7sxvN7uWGqeRk=AcPrXzgqMbyOTbSBj7Q@mail.gmail.com>
Subject: Re: Patch pre-submission to Sashiko
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Theodore Tso <tytso@mit.edu>, 
	Shuah Khan <skhan@linuxfoundation.org>, Bart Van Assche <bvanassche@acm.org>, 
	johannes.goede@oss.qualcomm.com, Jiri Kosina <jikos@kernel.org>, ksummit@lists.linux.dev, 
	sashiko@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 2:05=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Oct 21, 2026 at 11:45:24AM -0700, Andrew Morton wrote:
>
> > If someone's fixing something I don't see much value in
> > retaining/maintaining a test case for something we've already fixed.
> > This is considered good engineering practice but why bother - we fixed
> > it!  Move on.
>
> Like others have said there's a bunch of people would say the opposite.
> In the particular case I referenced where the code is generally pretty
> fragile (we have rather a lot of paths through that code) and we want to
> do a bunch of refactoring in the area it seems especially useful to keep
> the coverage.  It's far too likely that someone could make a mistake in
> this area, and quite likely that someone would want to do relevant work.

That part I actually agree with.
