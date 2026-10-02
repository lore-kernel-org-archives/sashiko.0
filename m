Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCA0481A89;
	Fri,  2 Oct 2026 09:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934619; cv=none; b=OeWObRPFUnYNPikWtKHO5MQfKWlKlL6FM9F5WFipiIzkm5BduQ4iqum5pe5oDSyF3Jmi18v+aXRR0fwzU9qbE7zf0Kg0nzP5LSnBQHqy8R5/+kfAtUO9/St77gyGd1D3AaIHVgKfONLbdvFTz6CGxsSuErkSNxeeZbbcAmsbAHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934619; c=relaxed/simple;
	bh=ZJenCQuqj4N5GdPdC9fCbiCQXptzkfy1dBa7+dA+hnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cxb/3SYquA8hSzVr/r4c6RnJ/rCQ3VLE2r2hOC/tjOYzsBIulpp/NEccle1POlnL4KlW9SjxRFEoRDEup/Q4qjwtLhkAnGTZOEqdpTRp64mulCe7AHld9JTT2TgntbOY7j9ctu+aZ+lknyJ2IJgm/4tPFWqNejRH2hP/tnnToqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hDt5yANJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hDt5yANJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C7D1F00893;
	Fri,  2 Oct 2026 09:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790934611;
	bh=ZdPAKp99OsN5EGJHX3r1bi+u/3V2c6eA7UogAGakHQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hDt5yANJaE2+gciRZO/FswQkj8KtlPV/v8jqUfcxIaoLoNuzKfc3imqzD1YnoLIda
	 jxXfVUARZxowgEHlbsPcw8LCdCUqCqpT8VrtaPssZPerUkNaKvSufNc72Urv7tKNM/
	 ew/NygPxSFoNt3RFANdYH5hU+9TPLQ31xP/bkaqKJwoeikuugAiZ2g7O9WdrSmTUxT
	 6vreWRYBfOzo1K8K532+Ky0549hu/+zkdVD95mUUS6+R+YD/nvO/Dvg5vgVy1OsDqb
	 xMWra/Ak5AFpNCRDzd2NOg1KgsTNQQ5jBZgBcgOBeME3Gf1WbIZKzzUAz1kGqdwbZ5
	 Xz3DGg9MIoZgA==
Date: Fri, 2 Oct 2026 11:50:06 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Matthieu Baerts <matttbe@kernel.org>, oleg@kernel.org,
	sashiko@lists.linux.dev, users@linux.kernel.org
Subject: Re: direct replies from sashiko
Message-ID: <ar9-ThDPoyMFPhUo@example.org>
References: <ar47HvytXrbOiwTO@example.org>
 <15f15153-d19e-4a3d-9d7b-847109ebb96f@kernel.org>
 <7ia4pkxt5ob6.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ia4pkxt5ob6.fsf@castle.c.googlers.com>

On Thu, Oct 01, 2026 at 05:21:49PM +0000, Roman Gushchin wrote:
> Matthieu Baerts <matttbe@kernel.org> writes:
> Hey!
> 
> Several questions here:
> 1) What mailing list are we talking about? There are per-mailing list
> policies defining if and who sashiko is sending emails.

linux-fsdevel.

Joel Granados mentioned [1] that sashiko had some comments on my patches [2],
but I haven't received any emails from sashiko.

[1] https://lore.kernel.org/all/gbiwlkkqx5ezpn2drqj5apylk7ohbcz4kkrpba6tpqnkcph7z6@5ez5wwz3jhi5/
[2] https://sashiko.dev/#/patchset/cover.1789987960.git.legion@kernel.org

> 2) Do you see findings in corresponding patches on sashiko.dev?

Yes.

https://sashiko.dev/#/patchset/cover.1789987960.git.legion@kernel.org

> Sashiko previously reported preexisting bugs together with new bugs,
> but now it's putting them into the database available to corresponding
> maintainers ("bugs" button on sashiko.dev), so the number of emails
> might naturally drop.
> 3) There might be a bug somewhere :) I need more details to dig in.
> 
> Thanks
> 
> 
> > Hi Alexey,
> >
> > (+cc Sashiko ML)
> >
> > On 01/10/2026 12:51, Alexey Gladkov wrote:
> >> I noticed that sashiko-bot stopped sending me reports about its reviews.
> >> It was very convenient and meant I didn't have to keep checking
> >> https://sashiko.dev/. I thought it was just me, but Oleg Nesterov also
> >> told me that he doesn't receive those reports either.
> >
> > Do you know when it stopped? It looks like there is some activities on
> > the 'sashiko-reviews' ML.
> >
> >> Maybe I missed something - is there a setting to turn on its reports ?
> >> Or maybe there are some rules regarding when sashiko sends a report ?
> >
> > On my side, I sent a PR to change this file:
> >
> > https://github.com/sashiko-dev/sashiko/blob/main/deployment/sashiko.dev/email_policy.toml
> >
> > Maybe something has changed for your case?
> >
> >> P.S. For some reason, Oleg Nesterov is not subscribed to the users@
> >> mailing list.
> > I don't know if Roman and other sashiko devs are on this users@ ML, but
> > there is a Sashiko ML (now in cc).
> >
> > Cheers,
> > Matt
> 

-- 
Rgrds, legion

