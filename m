Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A59936B913
	for <sashiko@lists.linux.dev>; Mon, 19 Oct 2026 05:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792389303; cv=pass; b=NirDsH+TqR9jozer59Zv1wigfC29PLJmE1Ug2qirJAN9KID9lkRlNjrHBMKY+HaMai4ZpwNYExyiYoZaYMkxauTmLymh6sWfTySNAfl/JeSQN80jRf96IA3lpIw3kRP9WpKa3UF1/ji4iFQGcC1GzinmmNKKsO8zRBTFCKnQvD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792389303; c=relaxed/simple;
	bh=92jjG3em6YkNB3lESKDkVruoPRHZY45Bwwk/55xRxs0=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L1vT+40P+/CfHnLjscSx2uyOIjX2vLtDJQt7j48if7xOceDfJL1hlrF+0dFS0p6AXLbTC6ggudOFvNWWExM2WOvE9K7EfWs3zVGrZlnI0CTBulIYfyq79jW6Xpxlyf7hvM83hzeF1mcvtYkpCC9cGci+g0yLZFLwOMuK5ZmZ7y0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5/1HIYh; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5/1HIYh"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b05bf699easo12585807b3.2
        for <sashiko@lists.linux.dev>; Sun, 18 Oct 2026 22:55:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792389301; cv=none;
        d=google.com; s=arc-20260327;
        b=TRTUi5iEjzxtdQCoo93IS3VIuATFTXTeXNUTcHi/qftrJsPlC95SqlnCef9cy3otjf
         fpS8usZi5OUHqTqGOBjXQ3ZPwWyUO5WmNaltyk+KbKlrIayrJ5IBrWm+4+Z86L+vuAFN
         0F5Hmsctjv0RjS/PTaDPYxYI1mr0AmYku3/ATN+fJNvsgUUYOuzSetle6VTqDQX0q0JS
         s25lmsTIbNtcUGOU3vEPhXlkejz5bARjS4a2H24iE7yj/EBTf3y2O9eKwDfe5KpzO5Oa
         NnCUjeS3uVb1FLTnu3P93iwVqfmWeoODW1LLlB4M5mPlR7ldQx1MIIrIOqPE/mr/O/lD
         Czmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=uypgfV2yYt+2lqOIzEtJ8QdLzoH8m+SDghswTdMH9hA=;
        fh=QiaGUVw7gffylEQaRdSCfFI+bhTWZHfB6mjGcup6mps=;
        b=qnJ42IdYK98KIrmFUT3zVcR9AeyfyqAOr/5ZPK2GlTmOWmYR2n3SuPqymQRbC91PRY
         NcPZNcc03CzbAmOghhtqENrFSiWvqU+z3sBGyN1+2bdiBXunUKbUsw3tNq7jdEHXwCdJ
         vjxtNg8MQcG4UHHtVZtVj/B6PN698z7jzL1oGCc3HwAlu5oZAfKtRwKz2JH+4LMIzWRU
         KEMmB8kmD9BqNdEWy4BYh9WyK7wD0GWC41WLEsGQ/QSsjbvFILcF1D2aHjcxS8HyQpuh
         toxSbX4cThCqgGwhDdFU/gPFJ/c7LBJG5mXXnMhZl91LRrmg88GPigi+fxGXsxWefMUg
         rHWg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792389301; x=1792994101; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uypgfV2yYt+2lqOIzEtJ8QdLzoH8m+SDghswTdMH9hA=;
        b=i5/1HIYhU5MH7S8BSWzoBzlnHwVA3BJNvD7Vic7X5lQlCxaXe+30rkZNUbpYJaZlJY
         dvr+2xwOqxOrLCvOujJ5O1daY26iB637Bn6wRY3c1hqUZxt4dkPmcVfdWfBllNpz1G8b
         cgLlOwjJHZJTLNfT7wMyLSNJimT5PKVl3yt8zZhssLNCDnQEja9HGPjfSeUcUz7Mh821
         BOe7WOsn31y2v1kxlYPwnp4leSMgbnO58oyfwPyWgu0lZq6+aUA8cEW1DsMsqhjVqWW0
         xkCVvpY0WHxmn99n7pRGaKqGzTucYSyHdITgNkry6f2UuFs5wyec0CWrWDNeau0ez/Lr
         qE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792389301; x=1792994101;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uypgfV2yYt+2lqOIzEtJ8QdLzoH8m+SDghswTdMH9hA=;
        b=Tlh1fmxRDnAaPRv8VlZmVyYzkcikhRFPrL3r9Ur0sRo14gly/au2Uurhdy/uT1MVWO
         ylyeYikCLsVGf4yl/4FOMWvCewzThL5dwp53axJ+F4adJShJ88VcHDdTq0Fh1JKIdHVU
         1HJJIrqoKajKbkF56+Hpq2rALkpBlemB9BPEiHxmtHejE0d5HoNidyH0I+8wMSuCZgmx
         uKScaB5zk7Xiz/MS43zNabTRuW73DK1rowuOTXuMLYeEzGow4NYReR1lWNzV7rTLKPuU
         g9XBUunfAAo9LO9to5+Obk8r2zahiHhGg2o/1r3yLe0IiaPrRENK2RUoAAe8Bm6Nwezm
         /rFA==
X-Forwarded-Encrypted: i=1; AKwUvBxfdodU0JD/V9Q4lOSairSMqUoOTzukDCNi7rPluT3L6wuRvhxTYfhrNkj6Q2pQ+WlnOn8UOXTT@lists.linux.dev
X-Gm-Message-State: AFq9FYKeZVkZO7RWtNGyr/lqPkc/ajFHq7HEDnKfdXiTUeSnCTqToBnp
	jV+0XJ0wUgEH9lvAjazVmkP+CB/EgFU0N4tQ7vOjl/XXXLvp6BszBn3jauBv5/2S7AW7vsD/RuS
	sOij9QdMUs4JaoAebDfwzXGEUre3wPcI=
X-Gm-Gg: AYBFou0Rn7tCgx6F6AZbZm9HZTsTKbfRjMr4fW0z7Aj9WVfIfYbfQk/UkpEQXuLj4aI
	mcYa6LhscOWweeE9JFPaxL7wGCZ5Uc3KKwA7uqVOqN0slxeKfJNA3lAWMz/kqP7OEoNbNyVnOll
	Zypmxzi1nAYpUWAedlE0wIpsc5HJxUf2UDwrEQzRxPkkPicQt359gYLTt65f7aaQ6mjAkOutdN3
	JLZVPZY/vE2DyRm55Z7Sn+H139i5ClDIZZQO+dnwqKLothFbE8NkEHAvTJweyUsHNicMLtkZx56
	uyvT2SUnwLpV9BnMmwsGW5U1KsJKOG6aLJS3ifJ5r4odyvqqE4uoeqlcTlwwI0oQ
X-Received: by 2002:a05:690c:47ca:b0:8a6:1901:30d9 with SMTP id
 00721157ae682-8b0f21b60c7mr15082517b3.37.1792389301155; Sun, 18 Oct 2026
 22:55:01 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 18 Oct 2026 22:55:00 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 18 Oct 2026 22:55:00 -0700
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wj24dSSRDQjvkmcw9LMC=K86d-Xys9=qX=gKoXgrQN1UQ@mail.gmail.com>
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet> <CAHk-=wj24dSSRDQjvkmcw9LMC=K86d-Xys9=qX=gKoXgrQN1UQ@mail.gmail.com>
From: Oliver Slapinski <olliefromcanada@gmail.com>
Date: Sun, 18 Oct 2026 22:55:00 -0700
X-Gm-Features: AclHuK8F3_DrdF6wO0JeANQibELezP9Tx8DyDYRRgQ4ITe3vo_9SMVrwS4CK3ig
Message-ID: <CADJhFpSAafHv7fTdGRRxq-3iq-oNbQ=CxCGMDXa_kg8jnELXzg@mail.gmail.com>
Subject: Re: Patch pre-submission to Sashiko
To: torvalds@linux-foundation.org
Cc: jikos@kernel.org, ksummit@lists.linux.dev, sashiko@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

I'm working on an opt-in adaptive publication cooldown to address the
rapid-resubmission loop. Suppression of superseded held reviews is
implemented and tested; the adaptive policy is still in progress.

The initial scope is a capped delay based on revision activity,
preserving existing behavior when disabled. Series-size weighting and
cross-posted series are outside this first version.

I've also read your later point about discovering kernel rules and
local-review guidance automatically. That's a separate gap from the
publication limiter.

Thanks,
Oliver

On Sat, 17 Oct 2026 08:20:49 -1000, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Sat, 17 Oct 2026 at 07:39, Jiri Kosina <jikos@kernel.org> wrote:
> >
> > Another option I'd like to propose would be to introduce a way for
> > submitters to run patches through back-and-forth with Sashiko even before
> > properly submitting the Sashiko-polished v1 to maintainers and
> > mailinglists.
>
> I think maybe we should make it really easy for people to run their
> some kind of sashiko setup on their own, rather than rely on sashiko
> itself. After all, these are all people who use an LLM to begin with.
>
> And assuming they sre starting out, they are probably are *not*
> building their own local LLM for this either, so presumably /
> hopefully they have a fairly capable LLM setup, and the problem is
> primarily lack of kernel knowledge (and possibly LLM background too -
> that side was certainly a learnign experience for me).
>
> So maybe at least one piece of the puzzle is us pointing to existing
> sashiko (or sashiko-like) rules so that people who use LLM's get the
> "basic rules" almost by default, rather than burdening sashiko more.
>
> .. and I do still think that we should have some kind of "sashiko
> doesn't answer for 18 hours" kind of limiter. Possibly with some
> back-off per submitter (and by patch series size) so that repeated
> submissions get spread out even more.
>
>                  Linus
