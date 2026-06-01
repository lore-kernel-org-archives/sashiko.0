Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F143451C6
	for <sashiko@lists.linux.dev>; Mon,  1 Jun 2026 06:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780294590; cv=pass; b=bq84m+mHCcj+6q4QMe+VSBgNXB/5B/2VF2GHKkDL42TL0xTo8lAWNX5eOzUln57ksOWYuaqogHwrBWgAsuuP+5u4ugz5ZjYxE/peuSyqw417Lq1JJbb4si4X7KBdf5FN19/u0F8xd+KM6xdc3K6uo2sewRMSbGLE+65u523FIJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780294590; c=relaxed/simple;
	bh=orm4qObqsEAgneet3dRG4nmdbeK+sqRkUYyJV5P1fQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MI65mleV42CuMgfKBFuFwUM7g1sWTfBaTGLtRO1miRMPpgMTOIWXAZA8ns9R4WMr2qZI8iDCrjjcmWUkzpaKeGTa0vMmvIro2yRsQRoxvqmdYIeElKBwXCtUvYrclDnom/ysQFeHCXNGcUDbkSHKLbhV+S2uTh7HuiCjIXWPBVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e01Hv/wI; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e01Hv/wI"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-305056ac6cbso156777eec.1
        for <sashiko@lists.linux.dev>; Sun, 31 May 2026 23:16:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780294587; cv=none;
        d=google.com; s=arc-20240605;
        b=BVs2v0kNLmhTYpQn7svt72Yz2pUm6snCTu33ppi937ne70dWbcC64EFt2Jd2ihfD5c
         06erjG4FRQ6qXKGjSPDSjn/MXH4RM4M3DqTdMOZXj1cFOfaIh0lvZvHPJX+5cUxIOBPL
         LKQJAcfdA+GENlpsE270x8qLP/lRk3d4EsHeZspaJ02jty/kFiY0Bw8oh8j0e0j1TE+v
         SBwTXUiI+NXrKoVn7wmBtCvFgLVYANnxEIm6bpDMum6Mh4aL0ApGsZgS1PL77bYwGam2
         ch3n1TtTwkzx7afPTKA9HzOxTtktdZaBbKCE9oAYIswb/+5hEunNg7vFK2MZXpRB+k9U
         anZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=orm4qObqsEAgneet3dRG4nmdbeK+sqRkUYyJV5P1fQE=;
        fh=2tU8rTiMKayGBGrXB22qZMEv5GOO+dAYGAE0TbO1Oyk=;
        b=EVvQtDsfc5e0ebZJGIqz0VG8mt6pJFgh/mYIHG2WXP62BFR9w4dYz7C80R/E1yug3o
         IiJtoo2YpzUAydDKXyg0hXMbPxTHaKvsWW2wyWSzL5eGQb33VY3GK6x+Ukm3aqtCc5WJ
         +PnnjTL3pxisJHtHB0A6bM6LH6FTqTFpKdrqYgU93uFBMVGKMj+jpsF4qEbJmEAqyTN5
         DecghC7QE8PvL7nAE4THhbvOw5B6GPaxCABHFjCnq74rua5IBlvAUcnQtE+AmbaD3NQc
         sGBXbukTdRbCWDTEnHfd214WRdiCcj1ADr4wgCnb00sSQBDgkgOrD3CrCO97KkiMcApM
         5UGw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780294587; x=1780899387; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=orm4qObqsEAgneet3dRG4nmdbeK+sqRkUYyJV5P1fQE=;
        b=e01Hv/wII4YAvQLpkl3r2TJg0+hfAJXfZHE0Utne6kfGsedVbPvPoXPHO8PVfzGILp
         Iu0G8DdGJrFZN4Qbsv+6y25eS2XB55F9S8UAdF5QyNRN20HnNdZ6NkIYdKfFSApr+JSQ
         mtfJ26j53yEjl2GJqNOnZzQGp8yqox9J9JHwQagqu2aXQGUWD4UK4NVFmkgZsjH1g1/w
         twERTZhDhmpuVKMCEaW54waVu3itlruNFwWiMXuPI+y1PhhaDIRkC3rQGPLWv4Lk/9Tx
         EwuSv9uixlDZ/YkgGGC8jGTBFlfBBb8XN8GEpg9RwMoWbjV4PFM7Fg3iiPadzi6Ix0r4
         dV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780294587; x=1780899387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=orm4qObqsEAgneet3dRG4nmdbeK+sqRkUYyJV5P1fQE=;
        b=svSSbfa38FE9t/MhBJ9bnwtINbRHE3NN6GeP2VlEYMx765Fn+MnLaix6u0dWYcVR2Z
         f+ety7ceywCFnbolqgE3BCnScIAe9V6kNPP5tNZIB6Q+ZE3ylf7BU4Fk4iOMhlql6KnV
         HuKLu/UiE1Mb+GcE+Nkz6kZvZmHVOfqyu+VfQOqg1C9IOARrHWvseHIq8/Vj087ItsBJ
         wJn5q/xHNNrpGlgCiEFUiDQyCnsmWAmBdQfoEHwLbFOFoR3naPNxmjcCWSJV3KqhCgR3
         ipZF+Iv42Dx+Igldc03laiXbD8wdpLyc8Z274H9UEh7HW2ZLvHjTCE0+PwlHh5zaiwmU
         ZbNw==
X-Forwarded-Encrypted: i=1; AFNElJ8xekx+jzCRZm8JRGGH3RIwvOp72wgQUt6kFRDfHdJiXq1xvUQvPqPJd8zeoBILKweM/6XMnp8z@lists.linux.dev
X-Gm-Message-State: AOJu0YwqWNZVKneIZf3pOK/YwkJos8ux8B1RYiDylve6ZBG01ra14qgM
	S4WNtVzRM5lZaKnMbiLG8M98Vkn1MBCW1XOXPDHQ6G2hcKwFGfQrwLi0o0od5Ssk8It5PgHDIi1
	q3/SxYEif6SpSK13+8nEZnuGFr+IASOY=
X-Gm-Gg: Acq92OG77Ea7da2wnDN+2FxP/DQj8kNX6vy906NKYANAooqWv7mRwgHEL9c1vysm7ic
	EEyKmngOBB7UuL3LvKkke9eQuMz019nTwh7eLQ+EWSqRYD83O3WWWsplQGIB5dFnhSoSYZw5R4m
	BYbRwFLsRAEFjgpzM+BDZJMSeqMJ3YR4jHmAHT4ehgH6RTulS+Y1y8Cyjvmab4o59LkTgk6ESfj
	+QRg1Mezzran4jQX5vdpmSNgyQOvcSfhW/eqvIu/pm58BMF0lUSxmYLFF9g9NxO+mDJv9kWAnOc
	5TQtqxHLhsUwab3WFtmgG7iLayiwwQjCZBpIFRigVmMDHJfUTbiFg7sSPD3TNmsr+mXP0Dfml+0
	aDHpqG2VUs9LdCFFPQj+pR7ULAKtrFinqsw==
X-Received: by 2002:a05:7301:6785:b0:2d3:4252:b13d with SMTP id
 5a478bee46e88-304fa6815a1mr2259382eec.5.1780294586571; Sun, 31 May 2026
 23:16:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <DIX8UX2TJP8E.4OAWKUUF5JG1@kernel.org>
In-Reply-To: <DIX8UX2TJP8E.4OAWKUUF5JG1@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Jun 2026 08:16:13 +0200
X-Gm-Features: AVHnY4IqLC4XXCXs-NAdixZ-fNyoebZjZkA8zGUjQTFob4VVEac5MdMmThSi-W8
Message-ID: <CANiq72mSpur28Fz8YL7_-FJk_h008kt=sw6mLeSsRNmiy+ko1Q@mail.gmail.com>
Subject: Re: Sashiko email policy precedence
To: Danilo Krummrich <dakr@kernel.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Alexandre Courbot <acourbot@nvidia.com>, 
	sashiko@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 1:17=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> E.g. when 'passive=3Dtrue' is set and a passive list is matched with a no=
n-passive
> one the passive one won't impose its restrictive defaults (e.g.
> reply_all=3Dfalse) on the non-passive one.

The configuration I added didn't explicitly ask for `reply_all =3D
false` (just `reply_to_author =3D true`), i.e. perhaps the fact that
something is not set could be used as a "don't care" (e.g. latter
lists could override that).

Special casing "wide lists" sounds also fine.

Roman: on my side, the intention with `reply_to_author` was to make
people aware of Sashiko and hopefully be a good middle-ground default,
not to force something on everyone else.

We could also consider setting `reply_all =3D true` for rust-for-linux
-- IIUC, from what Danilo says, the current algorithm's conservative
approach would remove that setting as soon as the patch is sent to any
list where that isn't the case, right? Some people would find that
useful (a few even reply directly to the LLM's feedback), but of
course it could be seen as too annoying for others (e.g. readers
subscribing the mailing list that do not want to get bombarded with
even more emails), so that is why I took the other option, but if it
is too complex to implement other logic, I guess it is an option.

Cheers,
Miguel
