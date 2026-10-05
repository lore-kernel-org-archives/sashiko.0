Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C9C33688D
	for <sashiko@lists.linux.dev>; Mon,  5 Oct 2026 21:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791237191; cv=none; b=KzHiPbhQAP3LHqdflkW2WWjdVjwawQEaLWec9PtzdBkf6hHvoGJGzZ8/M+iuVanSSnBo9wT9yMExc1bTlDcO6jT4XssVwhVMuWnpCe1FUA3fiWZS5ZETYZSVH/x0PSEElggWfOtCZYEA/Js2L5b2i7BkaDZPWnFsUAnhzOA0Eng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791237191; c=relaxed/simple;
	bh=7uafdxln1F8Dzenr9ypUynyF/EcgNJ244tmgjohWi64=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T5xJN6JPp9MStQ/oW87WYqDBAabyVgh9IwJz3/4Y1hUsbpApm9imXLF7WonWizMBfteEZCEvh7oXb5BoLzg5YU+8JazeWFTKjnJxwSwXCW21UWk2lQroh/cU9+BI7thpG58N7eVuqBT/3eoT0L5EJRJLBcJame5Te/cKDAxqj+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fbti0jF8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fbti0jF8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45661F0089A;
	Mon,  5 Oct 2026 21:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791237189;
	bh=7uafdxln1F8Dzenr9ypUynyF/EcgNJ244tmgjohWi64=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Fbti0jF8cSxhCrrawVjyKBrdeVSwMCWQcj0wm1Sg30RclAfI+ghRpxhchX80ytHjC
	 le+VesTR0Q59go3EZWStZTti6POyGM4NP3iYZhUCS1WACYNr9xT1laxIxWd+neEvwa
	 gbGxcseKO0WeSlKrlEV/gzQAP10EB+JK+BAQCYHnKqQQXHov6XsTUNWF8Lb6Mx70Ck
	 2LZNOVc0PomXBHJhAtOQvqqE/0t+7tfKqa1UqIfVkLA4bd2Gc++/VPijMM6GGptG/4
	 DE1J6wu9iOKn/BpZb72J7RGVoJb+1ew44hL2UJjjcsP3z12oPK/3nIgG1ufBF05z/E
	 gbMRTkcVaX3qg==
Date: Mon, 5 Oct 2026 14:53:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: "Chris Mason" <mason@kernel.org>, sashiko@lists.linux.dev,
 ihor.solodrai@linux.dev, ast@kernel.org
Subject: Re: [RFC] reworking the review-prompts subsystem guide
Message-ID: <20261005145308.47949c6d@kernel.org>
In-Reply-To: <7ia4y0cbsvdn.fsf@castle.c.googlers.com>
References: <91e21331-ed6d-4ac0-b237-b01aeadca2d1@app.fastmail.com>
	<20261005125859.3ed00b33@kernel.org>
	<7ia4y0cbsvdn.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 05 Oct 2026 21:14:12 +0000 Roman Gushchin wrote:
> I plan to do this (and had a prototype in the past), but it's tricky if
> we take security seriously. And we absolutely should!
> Obviously just giving an agent an access to lore archive is opening a
> can of worms in terms of possible prompt injections. So I think we
> should do it really carefully.

Hm, is there really much extra attack surface here beyond what people
can already put in a commit message of a fake patch?

> And outside of security considerations,
> humans are simple wrong too. So my plan with sashiko is to force it to
> try to verify the feedback against the codebase and if it's not possible
> trust only maintainers or people with a long history of meaningful
> contributions.

Definitely, I was also wondering about doing some rough estimate
of "trustworthiness" of the person based on how long they have been
contributing + MAINTAINERS status. In practice, tho, noobs rarely
provide feedback. Closing the loop with patchwork is a better idea
(if patch go rejected == maintainer must have judged some feedback
as important)

> And sashiko can (and does in my prototype) generate prompts based on the
> feedback and automatically verify that it helps by re-reviewing original
> patches. This should mostly eliminate a need for human-generated
> prompts.
> This is all doable, but probably will take few more week to build and
> roll out.
