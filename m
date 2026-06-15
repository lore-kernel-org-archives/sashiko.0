Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6202D6E44
	for <sashiko@lists.linux.dev>; Mon, 15 Jun 2026 20:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781554455; cv=pass; b=ki6QgK22KxLGogc1yXuGiYGt/y9QWWP8dvsY3YwkH7osYB++RaUTzIEOn8HMb5I3V8BKeKfUfDSr9BEQ3vATEFl5UhNAbGskAP+IBa5p6voZ+cpeLnrlLXoCuAEw0XyYRbSrHC3Xv/jqfUvKlwXKqJ3xVS2io3a9vx7mtI99JY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781554455; c=relaxed/simple;
	bh=dN5lKLcB7WQw/x0wXZra8B+Rff+JPtL+Q5IFLvyfZH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JI1bIUusqeI0rVv4EMTixdxcu1rEC6ADEneWQ5UhdP55i5EJ/ZfIfdcipy8fcyJ6ypvlDXEyPQvsk8aBNttc3BGdflWag/awaqykk1MdV9/IM6hX+3BDZqr8b9epNuC+ufCZxt8CrMDX246441G1/hMtMAOHdkH88/fgS4hUatU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=azfQfuBZ; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="azfQfuBZ"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c8585ecdd71so1149821a12.0
        for <sashiko@lists.linux.dev>; Mon, 15 Jun 2026 13:14:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781554452; cv=none;
        d=google.com; s=arc-20240605;
        b=hV7Gr6azRV6EXSq0daG0dW7r3oALFxpxstHXTiujCLRo7cxgiNWMwJtsSrWrfZ8j39
         wKwHqZUDjVBHrOFXk8zpP4CWtOIVeptVABmBeNoOQmdVpH/LLmAZVzNSX2VdLI3xr8ef
         Wida/ha4Vy4jWyg+1cAq3SJVJcxkchgUT7fYfhtZRsbVNhhP2XRVXR1p04lySP6SnSus
         VIzPklPndli2V+yJzcEN8h1pKb8Gh4hWcUHYB1oNvJfjinpau06DxZ5As7RR5PoGSJvP
         wLRKu4OvqsghPQT5w355t2lCw96xsUtejuXd8QFELXZ+P24OIRj9SkWbyToxLzC6NpjS
         DDWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VOBAp0OrvFOnJWy9Vj2Mprp5yZM0V5v8P2zKj+t6STc=;
        fh=qzZEAHIGAhLZbL3VYfbZCKAP3aVjQXB+pocWbMH4ig0=;
        b=PmpOTfz5+BxnNER/vjGNZbwmf9EX8XSKLegYimhxUz/U5cVAiki7lAMPzAF2/Cgw5j
         mg43bPTNOY5pHQVj22FUU1Ayw+I7T960LvJOLqRkKQEaz+vXN7MUpYlZ30K08KweXFcO
         /yWLKMxcFc9Wfs3wEyewVWaOKtya/k4LKDuK9Q1x8Q1HavNPD9OZiGMwVAkPadXJT4s0
         /OSBBj4nf6/FSrH0WTTTRd168c0QA808Qzs1iKrJ4UlclFJhW5XikTQE+LLoJs1RDtIU
         FFhDaEsXaSlF2FlH33eME5zyG/oYWwA1SgtK6ArELRkgzTBSu4R17R1hn2mxZaJMYVrH
         ZCiA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1781554452; x=1782159252; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOBAp0OrvFOnJWy9Vj2Mprp5yZM0V5v8P2zKj+t6STc=;
        b=azfQfuBZCx+9aVkSbgP9uU1PQDrFsyc0RE55kdAES2SBWPgwIk4ba9V4oxNrMGTu+n
         k7o2S3W9ojnvxxCnNoTgP9Lluj9OaTgvwiC5lPwpUHUheouvDVFrUyUcIwh8QdgFEof1
         wp7t13i7NgxC2/J+wmObXUCLIt7abPwkpicjjKglmZ8xeDYIRJ2je99EPckFQi0ysNrF
         bbxidSHSa/lqFNXIT7/nD+E/zYo3G47vXpa8u4PhSTdggVRF4l8aNR+VtS9X1RqMg+F0
         XnpdCVkwoiWwFWqY03JK2vrOBMcXoO7xjzfnyJfh7BMcXrV6YiSoUzyy9Edk17eG24gp
         y3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781554452; x=1782159252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VOBAp0OrvFOnJWy9Vj2Mprp5yZM0V5v8P2zKj+t6STc=;
        b=lgFixqOu5XfNWah2B1jePDEG6B1QHWTqGHWYsitCQEGnFuY0RqPf+5yq/WytnAf8Sj
         Icd91UG9i/cXmir8kuL6Z7nH41M/3OKIQ9mkXN2AoLxFEFLh4qwugbBmV1EoXGsqXtpM
         /UJ2LK1bRM6bkP5sSCaXYYOj6lyDc7WjIE/1YZaNAZ1ak5l7UhIFIjjywF5Hs9bqTb/z
         OaAamPykD2qM5uBzDOYiZEx5F4qHUfIwQ9Djj+59Fais607vSVCqxFgN/ycHEPH094Ml
         SfGmHr4L74yakhMdshyQb4ZUdYWUDpaHqzqafaJSaxKainIUeUiXX/OaBntdGrBHYZ4Y
         Heeg==
X-Forwarded-Encrypted: i=1; AFNElJ86Wy/oKbPTNc/zy398NT7jSMxmr5bdL7OkknxtA83Ssd3hFZIlP8IyYpewppgiEsaYZA8pkliH@lists.linux.dev
X-Gm-Message-State: AOJu0YxeMbZLLKsDwsA4hvvxEEaHQ8OdDSX425o/WcXLJsl7GoG7tW+j
	/6aWHXtcaFLEryTH5zeGjmqI52ApXhVHsEhHjNCIxsNKPjy/k+ZOEFqVHOA82d5zwvAcewKFp74
	eD266Z7t0aiyGp5vxxtbHXBHLeIxoDt/JvWS3E5nv
X-Gm-Gg: Acq92OHUG5PyJERtH6gdHmJiw10gyyeD6fRtYO9ncc5TgBfP7tDa60TzO/66CME7Y5f
	D0FWUunhIuQsA/b7+O4G/a9cMbw1etZH+CrvEWmn2VDqk7Xgmlmm/Bv8tTNn4DMdpL3OiD+G0JV
	5U21g5gACDLJFQSLx34BcFEw3V7ufmcQIYuZBCSGW83cSHzE21L1YUvmlSZ4gHcnC/IVOBDG9QO
	kkcwnYw5LFSPzba8GeS11sOzRXZ4RvuYxQzlreyqn9S727lTL6XqTBrifF6OTZIRKzbkMFZ5Wvd
	gVxonUw=
X-Received: by 2002:a05:6a21:3d89:b0:3b7:d9d6:9fc9 with SMTP id
 adf61e73a8af0-3b7d9e5f9f1mr2403549637.2.1781554452126; Mon, 15 Jun 2026
 13:14:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260615.zeinurej8oZ9@digikod.net>
In-Reply-To: <20260615.zeinurej8oZ9@digikod.net>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 15 Jun 2026 16:13:59 -0400
X-Gm-Features: AVVi8Cd3qtvo9laeXmNE1xHUqG8S1fVFDN_4vCveRADQz_4qhqKW3-tq1qmqozc
Message-ID: <CAHC9VhQxHEuznN-xiMJ-LCsz2z-UB0ri6MeMn+Ajyn1WUTDNDw@mail.gmail.com>
Subject: Re: Sashiko reviews for the LSM mailing list
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: linux-security-module@vger.kernel.org, sashiko@lists.linux.dev, 
	Roman Gushchin <roman.gushchin@linux.dev>, =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 11:41=E2=80=AFAM Micka=C3=ABl Sala=C3=BCn <mic@digi=
kod.net> wrote:
>
> Hi,
>
> I've been reading Sashiko's (AI bot) reviews wrt Landlock patches, and
> most of them were valuable.  It found issues (security or not), but it
> requires to go to https://sashiko.dev to find them, which is too easy to
> forget, and requires additional work from maintainers to copy or point
> to these reviews.  I sent a PR (currently in draft) to enable email
> replies from Sashiko to the Linux Security Module mailing list (most
> patches are already reviewed anyway):
> https://github.com/sashiko-dev/sashiko/pull/278
>
> Making such reviews broadly available can improve the quality of patches
> we receive without much noise, helping for all LSM-related code.  We can
> fine tune some email-related settings if needed.
>
> If there are any concern or question, this is the right time to start a
> discussion.

I recently enabled Sashiko for the SELinux list to trial it there
first, with the goal of eventually bringing this topic up for the rest
of the LSM folks on the LSM list.

While I think Sashiko's review comments are generally okay, you should
have contacted the LSM mailing list folks *before* submitting a PR
that would cause an automated bot to send email to the LSM list (this
applies to all automated emails, not just LLM reviews).  Please hold
the PR until you have given people a chance to comment on the issue.

Personally, I'm okay with it.

--
paul-moore.com
