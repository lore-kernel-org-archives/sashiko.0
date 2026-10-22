Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792669509;
	b=iYl6c9HvpRgHOSEoR3QfD56kNtgUcZ6Lxy7zGe2eKZ+XOTgtT9TYkDt27aLoZnjVRQ2q
	 mvOQszIRolw5MKmg6Duf9xc9DOpHDoED0jB4PSA7Y75zoI+0zrms++KfTv23lNLw2nls1
	 may8gkLqMZPfA/BlK6YZb8jbqz9ke4NOLeryVgiiYPAEByQiPOYKLgAJx9oV1jwRVnu+/
	 PDvgc2PCfWWCbeKZQzJz+4TCZ1+YVjZ68CYhTW3zs4s+Opb/u1ntQJmJ5cpwdk3MiU9sc
	 bje9N/7t2VgLlceftCoWvPD4ksVteGkk1MzypBzWjioTbLpwUgIlZBvf9v/3jD5W6cw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792669509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UifHhMPXVlR3/YmuyIrMlpuZk373MtjpLyJtHpwSm04=;
	b=qFZoSgsxK7Vr9jRFkt7iyCFl6i+ZQjGTPYSEqLtDHSZst3oIHKxc5ENFTvowEU9GW58D
	 9SsOo2B7CicOUdlG/1huYZN6JOr318XZID1BdWXPtzG6MMQWMkHzLOKVwpfhH/ubaAO1s
	 oHqrIntGGyyRx3tJ1EaQlktkmCO0v0NARQpgHeVtRYEdpbtemsP48XUiM2bUCtK7tq29H
	 jwAATGZWUN44a3+jNbM4SDYUC8NL7SET4vcFNY7+JAoc7NAbj07Qfn7VW4oEDF0Y87jdQ
	 NXJoE/n3V4iOqG5Hrk1dLfjCauyKg9sxEZnoL/L6aZ66MVW5Yp1PD9Qli8r1YHkIDDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BdWcob4R;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE13606A31B
	for <sashiko@lists.linux.dev>; Thu, 22 Oct 2026 11:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BE13606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BdWcob4R
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-313bab9cfe7so283653eec.3
        for <sashiko@lists.linux.dev>; Thu, 22 Oct 2026 04:45:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792669508; cv=none;
        d=google.com; s=arc-20260327;
        b=QEYnBrl70fr05Xn1bqDoX81w9pkcyin4votOu8OAvJFBZH+inxp0nqDyK52QXEY6Cl
         cQgacN5vux1lu3fRQFQbBwQgmw8wLxB+guuCG1TlHlTbVlsQiWavi5wDRLn9exI6bWmn
         z6HIyA8NjyH1Zs7CILMW5zD/867N+GygGAYpARCV6JA6r9eL7YQsyggOw4AYZ4zvPrDU
         1hLHl/rlKRmSl20yEg5FjBB1CKps+4kD5PxxAXM3Opm8bd5JiAghfPogdCvD8ZFcxyoJ
         QbgGtKWVLh0zjOWzKAs+SzulMwKWFh9aWbjCD9TEzXLOqqT/lIoOa1wWSTk6O1eEKofl
         iwag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UifHhMPXVlR3/YmuyIrMlpuZk373MtjpLyJtHpwSm04=;
        fh=gzcYE2Zeaw+yeHY/giNn9L7d1GliZO3qdV7HCbcLz5k=;
        b=i3J7l2jSKRq4OxZ1VH9ekRVMAjOFeFq6JvUU6L4qk9ri1FgG7Htd68ulN6ZWaqDKVV
         SOmHbY8irH9j4GQc4F6fNbgzQIEMpI1rNz148qYw5sBB0M+vHDbszj5Z1cwWTdsfqbsm
         VH74pPA/VCp8e4gG87mjeLQx2RdKia/gxdM79BRAb77HgNIkxZo3a56gLazAJWsYhLfa
         ZlzKJ+ELpRoJtLS0gkcUjufkmhk2YXQE0X21B2JSrHYPaxGfSYh6gzu/O3di5nvxhgmi
         +eSwzNBHe7QSBLGeO6Tr78DXELI/kvYo6EljRIuL5NJn6sp8ZGaqR1uxckKt00U9nKEL
         tteg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792669508; x=1793274308; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UifHhMPXVlR3/YmuyIrMlpuZk373MtjpLyJtHpwSm04=;
        b=BdWcob4RKyXhGi/XwulMsQHg19cCIQWmYOhQLf8UqxxiOC81aAM8qQQvp/Bx6gMYuc
         KUcknxugWQ3NMJ2us8WWQz/WS4M2EtRDUEMqUrBHWPBO8/crEzsJB1rd/Esc/LeTLs1g
         pZ2zbaTCl7u97+AyzYpD/VdJFuzu7ll2LhDxHYXiN9Buox2/tcRGeY/X2DqL00Wy+Tmc
         5fRijUR0iUHjaL0u/yoan7vcFjX0hO1MLThh7ELrhD+YS17VQE53DIxEMQppCYCSSmHj
         1VDYxlKYWTHiZYbj1nOEKsvgqm9S+DRLYajZZOC82VYXqr6db2lh2CBbdA2q+9qUx3uZ
         n38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792669508; x=1793274308;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UifHhMPXVlR3/YmuyIrMlpuZk373MtjpLyJtHpwSm04=;
        b=Bwq5aU4RpwuvtQoDspmYvwa67XVidkyjYhkHiBuYviZ0dlo+FNPawF4I1mY2Y4azhu
         AjhVFCrHlwIlxwzstbZaFAx1A/tUh4ZgandpYUhAoUDV+FfKC2x3aP1VY20jH321QXUP
         McgqUu6zruSKXBhMROl38E7MShgRrlEcCJYZH/elcvFF8l1MSa/2GVb5KzujWkXZzxX1
         ynm1HXpn1WFGqREpttZmLByDThdl3WPQ3H1psIv3H+h0PkAoBcI70Vno20sdc/wIwpdw
         HNKKVIrRTJL0IVri5PuQz0yRKFM9kfk+p4YwEVpNSQE4jaRL6gysJl/TvzMqzry7W/eF
         XLVw==
X-Forwarded-Encrypted: i=1; AKwUvBzEQNUGOwan5UpcogU0XbWuUV9f/xJiBQ/0StvNihVw4w4ZQv/eyLRDwG5jpcpkB4ReWPe879Tt@lists.linux.dev
X-Gm-Message-State: AFq9FYIje3ucjEF4SZhC/dolACqjr8elG6215SzHeOefHefKZP0k6sBe
	arGAfqqNXLIoTx+RfTchNljUnpHv8X7ydIQE8N0sFiCiu/iGezdkb77BhvL6PlVJtPVrnUurfAx
	k5kc86Sofs2rxSnpF/7IALpx06dX8RZY=
X-Gm-Gg: AYBFou0DClrhcnEFrPmDTXM+KnQnJoqWDoCbLddCRmrajbhPNzvdtOVkuGIOh+pG19M
	Z4/DURAXHXG5+QLNZ6GBVkFnY6BjnBtenFaLQtt6z5CzGSdQRGN/oSJc9xPd2vXPdfcwCX2icQj
	aaBo+/Z05+ukXYFjKRL32rdDVERN4YvBP6EW5BOEoZPw8ajSsfiK7mojsiCZridK6ZdMKQj9Q71
	XKLyhPK5BcHtoJYdNmYFGOL56RS2+C6iYYXYbabvotNnn9X0pt7LoQXy4N6hf2mFddSp5KiwSvV
	SHE4QS6apqNX4Tj3eQFEN6BXFq07xZ9+jR44x+nBFEe+JqUmcQAYOeAth3jyrew2AQETRTizAZI
	rBtgXjPRweL8CQm7IsR/oDilsoDZ8KLa04MQxZW5lAGLrbUhPq671wcg08bp7LgClg1Jf3ccJMs
	d5Txct3ooeH5etllWx5YXRbnc019CsXcI0/oOWWJB+fsXVFkLMm2RmpQai+UV+p8OCLY5rZK6Df
	baNgJ0wOXlDu/KY0a10jnj32dzejkN7CgG9
X-Received: by 2002:a05:7301:1a18:b0:351:7883:bf47 with SMTP id
 5a478bee46e88-367473c9a92mr9794707eec.0.1792669508335; Thu, 22 Oct 2026
 04:45:08 -0700 (PDT)
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
 <atkX3WwwV8XhMRiM@mit.edu>
In-Reply-To: <atkX3WwwV8XhMRiM@mit.edu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 Oct 2026 13:44:55 +0200
X-Gm-Features: AclHuK-XAu1-d11zmrhlN3wsQruIzf1xRWqY4TkytzhxzOkV_AzC278eMp2GmIQ
Message-ID: <CANiq72n=Y6XMyfuqYNUYpt5fxVmyrm6di6BAgXdrKZADDMm2Qw@mail.gmail.com>
Subject: Re: Patch pre-submission to Sashiko
To: Theodore Tso <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mark Brown <broonie@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Bart Van Assche <bvanassche@acm.org>, 
	johannes.goede@oss.qualcomm.com, Jiri Kosina <jikos@kernel.org>, ksummit@lists.linux.dev, 
	sashiko@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 10:03=E2=80=AFPM Theodore Tso <tytso@mit.edu> wrote=
:
>
> It's considered good engineering practice because regularly running
> the test allows regresssions to be detected, and by increasing test
> coverage, it makes life easier to feel confident that a future code
> change, or rebase, is ultimately correct.
>
> Of course, you need to do the cost/benefit tradeoff.  If the test
> takes a very long time to run, or if maintaining it requires a huge
> amount of code outside of the test, then it could be that the benefits
> aren't worth the on-going costs of keeping the test around.
>
> This is one of the reasons why I'm a big fan of unit testing.  The
> unit tests tend to run much more quickly than integration-style tests.

Indeed, it is a pleasure to work on projects that routinely add a test
for most regressions one way or another (e.g. compilers, typically).

And, yeah, sometimes the amount of time/code/setup/... may not be
worth it, and not all kinds of projects can easily do it, but still,
the bar for adding them can be quite higher.

Regarding AI, LLMs do a fair job at adding tests given a reasonable
prompt like the one you linked (I like that it mentions looking at
existing examples first; I do that in many tasks and it can definitely
help).

Can we move into a new skill (or similar) after Sasha's series land? I
see you already wrote it in a fairly generic way, i.e. not tied to
ext4. And hopefully having the prompt around encourages people a bit
to add more tests when it makes sense.

  https://lore.kernel.org/all/20261020161642.3713052-1-sashal@kernel.org/

Thanks!

Cheers,
Miguel
