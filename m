Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA4F3749F4
	for <sashiko@lists.linux.dev>; Tue, 16 Jun 2026 14:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781619116; cv=pass; b=jf5wMQZE8achh1Yof1PUFAfIrYjcgzXGNMASUkq7jFzyrnsSh9Fom1U7gaifRzSCC1e4/yJY+9okGvB135C+hbSAdmjeZa0uBXnOpIRg/to2/QGyZlaGBJJKvAAvONSEN5bMzRclabmz1cniWvqvtkL7joQpElIQRqWRY2IFCrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781619116; c=relaxed/simple;
	bh=XOT839ZUnmbC6i+ZNTrPHV5p7Nf4fmLOE3PmElgMq1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kk7MZe0ecKJu6/POduzjGwZvI4HCC5qrG/8HHqW68jIgOQ4Vai5k5nfcTbM1etvc3sj38xTa2WOXmkIqp9nWY74uo+ryFwntJ/HyEfmZpPscLlk0i7hW4GWAtJBBLB3Yn8b22akfpHiIlnbmxblfM0OxBSbN83ScNHIYWzjoftY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=d2oRmLYW; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="d2oRmLYW"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36bd175fdbaso2796788a91.0
        for <sashiko@lists.linux.dev>; Tue, 16 Jun 2026 07:11:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781619114; cv=none;
        d=google.com; s=arc-20240605;
        b=cpIeVTwXTcXbkamYVZd4w0R27A4rjF98i8y9ZnNOoCSjSLwM5w8HWZVgY9VevKrFL5
         xRr7lIpO6z2RCNee5xsLuaLkyey3Qs9THXY0QRD7/H1lOOWa6Kpe4rxPuG+lDdbW2EDZ
         /THFceNY4GGTo2q6oWx3LAYt0r6RD4knImqhL2HYgF5LSQ+OMfZm7x0oy7SKRXLg52h4
         eMsw9BGDd1sitsrKwza+xCS1vM9ZGY9CcF4+yWlcZWJBED8O/tsIkyAbrimd/7XRQm4l
         /bI5majpUqNkTij+YTRmE2ZI86e0ViLi19oeh2QetoV5xksKcf6ByR5RDhc5x26GYUDw
         B3KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mmerjkDOrPGzfV97bpVKX6uyBgCBlk1bg7OcSfg/xh8=;
        fh=AmnsEUqD2wodTSIPH/7ix5DGDZJRnrelEvsJ697Irx0=;
        b=LL/6xbOy5DZxVEwPYgihcSKtIz9DkRTMAlCo0xjPC5srXGBgTLpploOOsIZ+bhHawm
         Eb+nIdCAuRvzsyHU/ptYiMhjqcpFmRJ2ZwIYwLlPdbZ7GTZuLxQKnANRlkdyzwrtwo4t
         a/m9e1foMxF8R8gD/X03myk6Z/ElN/WGjxZ4NAOcejBWEt60UmQFRRiMNuRVSwJqCc1s
         1UarMKDPcqlQhjBsz8sdWL1+7lvuScFzLiW87dmLwOEe2xEqih+0GNhnvELWQ+4v6CZN
         bRJQKM1s7EJuJ/pwJ5NwJXCxxjgYu3EEodU15aKRAZiFr0+lYhKJg6zici3Lvq2g8SKa
         ZAcw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1781619114; x=1782223914; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmerjkDOrPGzfV97bpVKX6uyBgCBlk1bg7OcSfg/xh8=;
        b=d2oRmLYWYfF/9dM1oeC6j7O9LUolyKAoUrkmWNPN4wwgL+8kAyJ/n/Fo3t/pzN63N3
         KQwo2Za4Qdr40LenGsi6RVYlqSlGZYHEBxSH4nhGbQ1ikZXihqwdFK3I+6rWyM8XVgje
         5WX1cUdj2mjjRyjbEnmoY8z1m8cMjfH0yOlTUTTvodVH45CVKcBc+yZqIJ/N5YW4JcZ5
         gr9KmMkQp10AKFVjmftbUJxhVIeE82LRWbyszjv5/GtExESi/Ym7aj1JAVDxrYYmC/Rj
         UyDbjjkLDvYV1mPlW7XdxRs+oVcPijK6EU5bWNnRc3tmzCQV7NsqJDXxdy4CuHZWl6Y8
         wqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781619114; x=1782223914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mmerjkDOrPGzfV97bpVKX6uyBgCBlk1bg7OcSfg/xh8=;
        b=RkIsN+9oibBQ86Hg4u0VCK2tatT9QGnY69I+YfVMCk5B3IpwTOXrL4BjggrQiTB0Ax
         xJ0dzEt1f+tn54jDT9iYhTEiBN4OB/KF1QtjaW8dwaf/JDIZDuYueZBs0cMI4yS8rPsF
         3sVUaKxrc/Qwmq2/AtH3JXYEBFALgFu9gOf/xkETWS+0EE8reLep1ytct+gQEktE2dLK
         Fs5wIuR09aPjUaRBwlqk+k9qDAaiMk36oD9WMftRiS0J6t1uKNR20P/GVFu3oIExce9w
         P2Oh1rfTAgH0hUTwD0dm4YLkd0O68V6bO5cXWhKmftuJdjculH5wQt72r4ND/+mZnklK
         3zmA==
X-Forwarded-Encrypted: i=1; AFNElJ+SlGQena2J09H7Mt93GFOPPxUOm7BHQAQ35Dxdqr0Me9Bh9Sdbb/+bMUZ6QkJdELFopYZ/w9M+@lists.linux.dev
X-Gm-Message-State: AOJu0YxCRekL87ir9yymkp8Ni/z9HxAxpxTpY1kKiCIuiBEFSzGGTfk9
	Dn+H28fo+KLtZxDCyfwc5ikvF2T5DmhnaLlUbK5MvfzGbsdzVclaAGi7ZldNUmTPdwngmaJKZaO
	5yJziXeA/8PyRFE5VC/wjuDmM9v+6aoJZrXyb4+NI
X-Gm-Gg: Acq92OFxyucq2HGZf0qKmWC/HjPX9B3yqICS+kUXEvpGP2pvlHtD7owmehiDnhF17Ny
	E06h6oNBnAVZZzFJizcsDSSiuH1q7Hdn/b6TG0v+yOifLeQQGjJpqlPgV1LwIiwRdSKJMXukXjs
	vWi42GDoRD6AXuvsmW+sKYS8M9wBDNRFobRuyPlFe0+rfoBK5P00IIWqgC5K/WBztEuAfOcaf0J
	ggLtgVmkDkmcSEU9amuGQcwe2+bhqGsvheJ09I7tuh6EZQIsEZivYyEJ41KxTLr5dy/V08TPTbS
	DNXhheo=
X-Received: by 2002:a17:90b:258c:b0:368:f179:ba07 with SMTP id
 98e67ed59e1d1-37c2bc658a1mr16375202a91.9.1781619114133; Tue, 16 Jun 2026
 07:11:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260615.zeinurej8oZ9@digikod.net> <CAHC9VhQxHEuznN-xiMJ-LCsz2z-UB0ri6MeMn+Ajyn1WUTDNDw@mail.gmail.com>
 <20260616.EPh8ked0niko@digikod.net>
In-Reply-To: <20260616.EPh8ked0niko@digikod.net>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 16 Jun 2026 10:11:42 -0400
X-Gm-Features: AVVi8Cci0EKdSebS-l8LBZ6j2tnmFUw-8wfnDw-TPfiQIKyFQ-Puf0TWVpxapns
Message-ID: <CAHC9VhRa8DQ-ekrmPQSg2pO9pBFj6GA9DO=x5kguGFTbKKyv7Q@mail.gmail.com>
Subject: Re: Sashiko reviews for the LSM mailing list
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: linux-security-module@vger.kernel.org, sashiko@lists.linux.dev, 
	Roman Gushchin <roman.gushchin@linux.dev>, =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 4:49=E2=80=AFAM Micka=C3=ABl Sala=C3=BCn <mic@digik=
od.net> wrote:
> On Mon, Jun 15, 2026 at 04:13:59PM -0400, Paul Moore wrote:
> > On Mon, Jun 15, 2026 at 11:41=E2=80=AFAM Micka=C3=ABl Sala=C3=BCn <mic@=
digikod.net> wrote:
> > >
> > > Hi,
> > >
> > > I've been reading Sashiko's (AI bot) reviews wrt Landlock patches, an=
d
> > > most of them were valuable.  It found issues (security or not), but i=
t
> > > requires to go to https://sashiko.dev to find them, which is too easy=
 to
> > > forget, and requires additional work from maintainers to copy or poin=
t
> > > to these reviews.  I sent a PR (currently in draft) to enable email
> > > replies from Sashiko to the Linux Security Module mailing list (most
> > > patches are already reviewed anyway):
> > > https://github.com/sashiko-dev/sashiko/pull/278
> > >
> > > Making such reviews broadly available can improve the quality of patc=
hes
> > > we receive without much noise, helping for all LSM-related code.  We =
can
> > > fine tune some email-related settings if needed.
> > >
> > > If there are any concern or question, this is the right time to start=
 a
> > > discussion.
> >
> > I recently enabled Sashiko for the SELinux list to trial it there
> > first, with the goal of eventually bringing this topic up for the rest
> > of the LSM folks on the LSM list.
> >
> > While I think Sashiko's review comments are generally okay, you should
> > have contacted the LSM mailing list folks *before* submitting a PR
> > that would cause an automated bot to send email to the LSM list (this
> > applies to all automated emails, not just LLM reviews).  Please hold
> > the PR until you have given people a chance to comment on the issue.
>
> As I explained just above, the PR is a draft (GitHub specific state for
> WIP), so it cannot be merged as-is, but it is useful for reviews and for
> LSM folks to get a look if they are interested.
>
> > Personally, I'm okay with it.
>
> Looks good.  What about waiting a week to get some feedback here and
> then ask for a merge of the PR?

I would suggest enabling Sashiko for the LSM list, but not enabling
the email replies at first.  This would allow people to view the
reviews and perhaps make a better informed decision.

> Anyway, it would not be written in
> stone, we can update Sashiko config with new PRs.

It is worth noting that sashiko.dev updates are not immediate, so
there is a delay between a PR being merged and it taking effect.

--=20
paul-moore.com
