Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76513793A4
	for <sashiko@lists.linux.dev>; Mon, 20 Apr 2026 16:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776703908; cv=none; b=YR0+/NaDXnSESvwfstBt+uOhg8L7QlqvRX9XQeO2jypU8LEjmicSyZbRYpzk7J7rmy+PXnB5kF7FEaL8F2gV8vycxMS/ZC/8PRx9xnKIBvFX43kYo7t1X+vaQnKwWs0iZVbgb8NVq21XcoIYPF4lPquAeCWP1RiFfLqg78gXIMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776703908; c=relaxed/simple;
	bh=BFfDdMQb65mkpOZv7ELlioKnU0Q3OZ0RNLyLobsFpWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0bOA389wzIhxQnlZ/MTppSRMSlG9gKSyKXBxZfexPNB+UEFOmS94b2r38YrCrzL0cxUTSsmoD3kSCqcTYN3qF1OCsdalkxwtF5HCoQ318yRU+FIWmuwFjGzcAe/ZwWtcg6l0ztLWTBOlG0id/ULWH960KpyLmIiy2os+FZV/UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=S2bHiz07; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="S2bHiz07"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso44917255e9.3
        for <sashiko@lists.linux.dev>; Mon, 20 Apr 2026 09:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776703905; x=1777308705; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BFfDdMQb65mkpOZv7ELlioKnU0Q3OZ0RNLyLobsFpWo=;
        b=S2bHiz07uC99FG6i7QUD811vvRiDY3W//kVd5Wt4JWfuUewamw5Xw7uPxIV4agnVy3
         oCUFDiyz8uA+VFWhOGA3/9kmQsuFFjP0adKcP0TZh/R6yRJqH38V0PMrUk6C9hHMGiNS
         bvtle6LSwNeMFjpAjpo9CzJl2oJcbTysqDnb/Df7VxF83leZhzfnb4qNb5CRLdyeCW8K
         KF84puPfMc7RofZIZ+6fOFXvwXqFzcNvomqzbiB/82+27PWrRQr4jUyly1S5nYuGfChG
         BGA+A26JmWZTqnsuEXJ+l60Kzwf7UzcM9ByN89kUFVKlOjY4STDpalwy38ZtCHs3vejT
         adZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776703905; x=1777308705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BFfDdMQb65mkpOZv7ELlioKnU0Q3OZ0RNLyLobsFpWo=;
        b=TUxZp+vatAjA3wtcJG8/L9l7FbqlZRy2jmIMXbRjmJGLTq1Wz3/QjTC6imGAxGRumO
         OjyxohVO/yo8TSkx0Z+n4LHhzB4zldR39D6i9/E8OWsYoaA08qpswjBe/gPvsGJ6pCO0
         HRyEJS7MJS/jil4O6zMuTOg0lth5y20g+J67VBb5QtsEodTnJ/YNGdDJw7OniOV3VosI
         1ZkVkIAc/2h5DhslH3AXVtKr4Wy0Xhg+tAqORw00DFrFKm9BwSkt6E8OXo9hO0CzRBXW
         mqq4zadAelf2WnyhyTxerEpr48Y0HjqRJf1IqTNI7sQRBTdhsdff5bo71t4YSuEQX3BC
         qbkA==
X-Gm-Message-State: AOJu0YzHGDKgQyMuT800kVVVfeNNftBRjH54bD7+K/af/Z7AsTNvlF6G
	eUmZYS0NQjQL/TWsYqNjqQZOyN4ljRw+3AcovfRkxY3u4fs0AgsrohouIr8q2XVS9AORtnM9mbE
	zvdXWq24=
X-Gm-Gg: AeBDieuzmyKStCkCJEmBZOsHvUlbziafZyixuv3ne5L4aD1GSAgS/FTdHnM61zgV0UK
	sVw9ShLY8bZfuF9uRW1IoWVBEXjeF5itx5xUTT7d69Y20CkE7ccwbfloeFjw37Y/giRH+3uyJCn
	Gz8nSbMSUVt+mZNCAeuQjrwHwgcLrDNTqJn/t+A0YYhkGodU6KhLWf0w8o9kD0qyJqtGAq/s6+b
	YiC4x8HyhlR7j46HTCqW6GrHw55P8mh1YQfept7BCNKztVRGFirv5m6+Tek//O6WMReqp5CAvH1
	CS1k/Juu4a+IHZ31kH5P3VWZDWfQdtHbxc4F1kGSSUArQKLjTVh/074s6AsR1fitKZipbCksXMf
	ST2kDj54yRLtLN6KjTWbn0qRDuaCMyhlOnxx5xfd4zC1n5Z762h/AacoWkQL4ltsoFArKhwYkmA
	dOUtV3qNQ3v5rYPPUx/I6CJu9JkOM0LdSFLtD0iqH6kIStEQfx4watpA==
X-Received: by 2002:a05:600c:1da1:b0:488:f453:b976 with SMTP id 5b1f17b1804b1-488fb7844c5mr229523865e9.27.1776703905167;
        Mon, 20 Apr 2026 09:51:45 -0700 (PDT)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48919f54572sm43755265e9.26.2026.04.20.09.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:51:44 -0700 (PDT)
Date: Mon, 20 Apr 2026 18:51:43 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>
Cc: "sashiko@lists.linux.dev" <sashiko@lists.linux.dev>
Subject: Re: Delivering reviews over email
Message-ID: <z4eztn7epx6kghtm3nyoiexhnbxxc755f5vvh73gtir3nra6yl@etqgkhrpx6r5>
References: <7ia45x5tuj88.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zjfdmvqqrh3amt57"
Content-Disposition: inline
In-Reply-To: <7ia45x5tuj88.fsf@castle.c.googlers.com>


--zjfdmvqqrh3amt57
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: Delivering reviews over email
MIME-Version: 1.0

On Wed, Apr 15, 2026 at 01:04:39AM +0000, Roman Gushchin <roman.gushchin@linux.dev> wrote:
> Sashiko is now able to send reviews over email.

Great job! E-mail interface is something I've been looking forward to.

> If you're interested in your subsystem to get email reviews,
> please, write into this mailing list or me directly or send a PR changing
> this file:
> https://github.com/sashiko-dev/sashiko/blob/main/sashiko.dev/email_policy.toml

Roman, IIUC, this considers maintainers as all non-ML addresses that are
CC'd in the original posting?

> Please, make sure all maintainers in the subsystem are onboard.

Tejun, Johannes, would you be OK with the change below?

(This would be a query based on MAINTAINERS entry, however, I'm afraid
the config change below may imply sending messages to all CC'd non-ML
addresses. So I may need to ask more people...)

> I also have a slight preference to not use reply_all and keep the cc
> list relatively short to not pollute all mailing lists.

My idea is only use this as notification to maintainers about existing
review findings whereas the content is always available publicly in the
web interface, i.e. do not send the review output to the cgroup ML (so
far?).

Thanks,
Michal


--- a/sashiko.dev/email_policy.toml
+++ b/sashiko.dev/email_policy.toml
@@ -47,3 +47,8 @@ cc = ["tytso@mit.edu"]
 [subsystems.net]
 lists = ["netdev@vger.kernel.org"]
 embargo_hours = 24
+
+[subsystems.cgroups]
+lists = ["cgroups@vger.kernel.org"]
+reply_to_author = true
+cc_maintainers = true

--zjfdmvqqrh3amt57
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaeZZmxsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AhQwAEAr2dRJkIgmnEgmkoEyCg9
oNFeUJOovJ/tcGnjFuzai9YBAN0s6rJpVhvOtYmNjMWQFph70tTZ6Ds1SjI8BJzz
D7cB
=CX0I
-----END PGP SIGNATURE-----

--zjfdmvqqrh3amt57--
