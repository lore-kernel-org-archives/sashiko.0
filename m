Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9412F4418FF
	for <sashiko@lists.linux.dev>; Tue, 16 Jun 2026 15:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781623449; cv=pass; b=YbyfMRXUSsSmQB5tgFFJrHhyzDuuti7L38mLBo6nnfL3xPn/XwvCfZSk77Sl0OKEkl9xSk339SJ+YmrZJKUdMe2AlWOFPu+rCGZ5jlpitl3XNoQjok/QgDtCG2BvaMnjBPjH2xHxlspUo/DlJZFohzd2Z4D26DwVGPQIETlKdIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781623449; c=relaxed/simple;
	bh=ySVzSsVakcVFE2wtn9xhAfZhLDXQYnYd2gsVEtuaNQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p7BRURcsPTrqTkEQLJrq7A7PUykY6zzJ+Ze9gtCajGhUKEVINIBo2W0gIO3Q7Fv2aA2lMHbVpmWM0MqyL8WRabs8tmhm1r9OXB1hggxWRnQx3BsNEbjQ7Q2mHaCZm3NvM0XMibtWnx7GSbQ7qKS7WvEBk6cq+PxUAvbmGIYCxqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=aX9sIWwf; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="aX9sIWwf"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36dac5d5da0so2304508a91.2
        for <sashiko@lists.linux.dev>; Tue, 16 Jun 2026 08:24:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781623447; cv=none;
        d=google.com; s=arc-20240605;
        b=WRBOqJkyZlNrcCwBAeXtF9SZvwF4xER7N7rJN1ZsmjjatA/GC2+G7ldDxhEnWZRueY
         CnUqFaHbx2jQFbK8fR+r+4Pt5WTVYM+2PRoeWaYn8DndtoRU3yOIHiLy2NkYJDSXBzio
         XWDcIRuFBaJXEkYqGBX2EG5yN03Cp1Cu144r6YAjT3Dg4sSUuOPyjwRLSU3B9VgJwwWM
         OZKxT5vYxYw/E4klQuMCqz7jo7LcaQtaCb+9P/fQ29+4OgJswRYqLLkqHanP4Z2lipRu
         80SRD0MnSaBQPq1O1AqqgTR5vCPqD1MZPzLUeQtXpIP7EimXbAwodbgKisqwZBMpFfrb
         VGjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l9DyvKp5GlTfWCFl+DPg3gMJrNtSEWY6qdSng3vxqLU=;
        fh=+xl9WoxEQL0pxvpUIt720wQfSTlxOzgncLaodAdvyII=;
        b=LCE2Q3V+tfY9yNZBP1Wvk2gVUnBM8Ssmwncdf8CHFSrqbeoungfsQBE47QVTWJ5+Mo
         J2vSQj6BauYps8GmHJL7Z8dZrXUPxyVg79QWpqBLS0KU80YKauVDgJ3lM0iRDuGeGWPt
         ljrxpjKaNrLIXZN1AdDRHim6kMx41NZ3hg9d6q1VsvtQ2ael5dxd4tqe2NeN0q4lG25o
         d3IArGZ2iOrXCwhm5DStPeZ+VIgpzW2EiGn9auI2Eah2e0S4V5UNGGBvyt6QBD1Su7Pf
         dNNgvpwaTeSdZKry7+Qh9XvTgGLWCKYOcmM+I8b3w5Hlpr+frecd0YEDpESQlK5yT7eN
         ux8A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1781623447; x=1782228247; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9DyvKp5GlTfWCFl+DPg3gMJrNtSEWY6qdSng3vxqLU=;
        b=aX9sIWwfcbuLF4N5aps3su7rj14wS8ImylhmtnFYjmj+eAsmd3YbqqR/c4Mn8izex/
         yzIl1RoNN3/h7Ctygsh9ZkwvNFpjtBOHzrKv63HzJ9KWgcwVXHjD1i9ONFYU7xP7aRn9
         CbI9N2iVMU2DbCajPOhaQkNxbymjFl9cZJkQ3Z7PKf+bJaN3XscwdQZ7Ee6cje8lXVxU
         WkN6stukVGxTbnXaD9kMO/5tjvJMytIDW8f1LedZaBUairmG2f1xz1H2PS9u83LNLwQj
         PwfEx67o+Gs/VEA7uv0MiYhPCMZLqvftsNxOM+6A8bIY+pBl3zGxrU9Yj2aLkiZloqLX
         PCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781623447; x=1782228247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l9DyvKp5GlTfWCFl+DPg3gMJrNtSEWY6qdSng3vxqLU=;
        b=fGDTzNpFfWOUqd6/kBYa3gf0PhGtyeH9WNdH5dns/rUq1afp7KcBI9DwaUrJUb07Uf
         /i8iTlzRRtXNuK9qytbkujbyzEAoGQHqIzeI/hoWivD9/q5aO8wqySqteuz3K6zPmx33
         NrKPqpXZi5pE0m5rwodY2XOCZFIKr9PxR1c2EV09O1W9kME1lYh/n6LOVVonwmfXheCu
         oY2TC7M32ixI+EpfFedplRF8OONoACHSThMBXEzQQY2WWWefgM9WsXmvlJNoN1YID7co
         F8E2Z8N4qO7bXdbI/xNXOxnLJ+I7z0l4PrQTs8cekelrkVtHNajp5BbOAp8oRKl/bF5U
         sMbg==
X-Forwarded-Encrypted: i=1; AFNElJ+HGhfbymMJ4YzTttpdMRkhVm+o/NAtt6jTf5q2TVHXAhjDocIyUI/8HvlMIlGhbXY31aQzIDkn@lists.linux.dev
X-Gm-Message-State: AOJu0YwM3AKRmStgrA5K1s/XxkFOd3Ya6H1JinnflqtdJ8sBLz1gl6sI
	mFjfO520DxrFYFxsY+7XWA5nwet+VrxlkkfR9PiiMlxJdj1GvaU++VPFIogjjw3a432EYgXCrSU
	F6GYQ7ccYO6spSmuyJsqnPrgGuSLBm3V1+aA1dqFjAikOhHIeNx8=
X-Gm-Gg: Acq92OEf0KFSCQLdBOsCPE8YpNFcNkZDZuoJLIGSikGbUFq/D9O5yXtWHhyp4Svalo+
	WoSjd2vaL2adxJRzBpFu4T6XJt8RLq2jId8v/JH2Qums0DROghx+C5U1LfDdFeJqlk4WMTTO5aB
	Ti+EQxZk9jW5kxpy+qA3T6z6/0iOwgKnPd54IxxCkAyo+IgBtMTfx3PC/kJPSa5UDUmIsiyse0v
	zKJvQgiuNoNTqYBd1rF/IMj8tIekf6uRCefiqHLkmNyYSgbNG5M9XNK/E8KQd6BkXObzYYrGoV2
	8HOoSFw=
X-Received: by 2002:a17:90b:3e8d:b0:36b:77b9:5c8c with SMTP id
 98e67ed59e1d1-37c528ff244mr4243093a91.17.1781623446649; Tue, 16 Jun 2026
 08:24:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260615.zeinurej8oZ9@digikod.net> <CAHC9VhQxHEuznN-xiMJ-LCsz2z-UB0ri6MeMn+Ajyn1WUTDNDw@mail.gmail.com>
 <20260616.EPh8ked0niko@digikod.net> <CAHC9VhRa8DQ-ekrmPQSg2pO9pBFj6GA9DO=x5kguGFTbKKyv7Q@mail.gmail.com>
 <20260616.aiGaim8xie8z@digikod.net>
In-Reply-To: <20260616.aiGaim8xie8z@digikod.net>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 16 Jun 2026 11:23:54 -0400
X-Gm-Features: AVVi8CfG7acvH-660edmw_6INQnGnywkelyYTrpO4uSRVLA0B8-F6MPHkQIkf5E
Message-ID: <CAHC9VhQyN3CczsTHG=sJF8G=MqxGL6NO7assuAjuF9K1t-qDmQ@mail.gmail.com>
Subject: Re: Sashiko reviews for the LSM mailing list
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: linux-security-module@vger.kernel.org, sashiko@lists.linux.dev, 
	Roman Gushchin <roman.gushchin@linux.dev>, =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 10:59=E2=80=AFAM Micka=C3=ABl Sala=C3=BCn <mic@digi=
kod.net> wrote:
> On Tue, Jun 16, 2026 at 10:11:42AM -0400, Paul Moore wrote:
> > On Tue, Jun 16, 2026 at 4:49=E2=80=AFAM Micka=C3=ABl Sala=C3=BCn <mic@d=
igikod.net> wrote:
> > > On Mon, Jun 15, 2026 at 04:13:59PM -0400, Paul Moore wrote:
> > > > On Mon, Jun 15, 2026 at 11:41=E2=80=AFAM Micka=C3=ABl Sala=C3=BCn <=
mic@digikod.net> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > I've been reading Sashiko's (AI bot) reviews wrt Landlock patches=
, and
> > > > > most of them were valuable.  It found issues (security or not), b=
ut it
> > > > > requires to go to https://sashiko.dev to find them, which is too =
easy to
> > > > > forget, and requires additional work from maintainers to copy or =
point
> > > > > to these reviews.  I sent a PR (currently in draft) to enable ema=
il
> > > > > replies from Sashiko to the Linux Security Module mailing list (m=
ost
> > > > > patches are already reviewed anyway):
> > > > > https://github.com/sashiko-dev/sashiko/pull/278
> > > > >
> > > > > Making such reviews broadly available can improve the quality of =
patches
> > > > > we receive without much noise, helping for all LSM-related code. =
 We can
> > > > > fine tune some email-related settings if needed.
> > > > >
> > > > > If there are any concern or question, this is the right time to s=
tart a
> > > > > discussion.
> > > >
> > > > I recently enabled Sashiko for the SELinux list to trial it there
> > > > first, with the goal of eventually bringing this topic up for the r=
est
> > > > of the LSM folks on the LSM list.
> > > >
> > > > While I think Sashiko's review comments are generally okay, you sho=
uld
> > > > have contacted the LSM mailing list folks *before* submitting a PR
> > > > that would cause an automated bot to send email to the LSM list (th=
is
> > > > applies to all automated emails, not just LLM reviews).  Please hol=
d
> > > > the PR until you have given people a chance to comment on the issue=
.
> > >
> > > As I explained just above, the PR is a draft (GitHub specific state f=
or
> > > WIP), so it cannot be merged as-is, but it is useful for reviews and =
for
> > > LSM folks to get a look if they are interested.
> > >
> > > > Personally, I'm okay with it.
> > >
> > > Looks good.  What about waiting a week to get some feedback here and
> > > then ask for a merge of the PR?
> >
> > I would suggest enabling Sashiko for the LSM list, but not enabling
> > the email replies at first.  This would allow people to view the
> > reviews and perhaps make a better informed decision.
>
> The point of this PR and the related discussion is to enable email
> replies ...

... and you've heard my opinions on that.

> the reviews are already there.

I don't believe the LSM list is being directly reviewed by sashiko.dev
at the moment (check the lists drop-down in the web UI).  Any
LSM-posted patches being reviewed are being reviewed due to a CC to a
sashiko.dev monitored list.

> As explained, my motivation for
> this change is to get reviews, and without emails I suspect almost nobody
> (will) take a look and that would not even be an experiment.  I'm saying
> that because I forgot several times to take a look and it adds more work
> to the review/maintenance.

I think it's important to allow people a chance to see what the
reviews are like before you enable an automated bot on the mailing
list.  I'm sorry you found it cumbersome to check the web UI, but a
change to what is sent to the mailing list affects more than just you.

Perhaps we do eventually enable sashiko.dev to post to the LSM list,
as I said before I have no problem with that, but I want to give
people a chance to look at the Sashiko reviews first and make a more
informed decision.

> FWIW, there are currently 41 kernel mailing lists registered:
> https://github.com/sashiko-dev/sashiko/blob/main/sashiko.dev/email_policy=
.toml

Yes, I think we can all read a configuration file.

> > > Anyway, it would not be written in
> > > stone, we can update Sashiko config with new PRs.
> >
> > It is worth noting that sashiko.dev updates are not immediate, so
> > there is a delay between a PR being merged and it taking effect.
>
> Sure and I don't think it's an issue.  It's really easy to filter
> emails on any MUA if really needed, and I'm sure the Sashiko maintainers
> would be able to fix things quickly if needed.

I think it's important to understand that not everyone approaches the
email lists the same way, and something that is a non-issue for you
might be a larger issue for someone else.

As a reminder, you are always welcome to create your own list for
Landlock if you find that the LSM list no longer meets your needs.
The only thing I ask is that any patches touching/affecting the LSM
framework are sent to the LSM list and of course any pull requests
sent to Linus should CC the LSM list.

--=20
paul-moore.com
