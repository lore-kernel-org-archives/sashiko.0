Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDEB4848BE;
	Mon, 19 Oct 2026 12:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411368; cv=none; b=VhbV/877ZttbwLnwSyJ5LUFnc3nRwmdcXELofurV9N27q6C62oHo8efoGlHZabXZx6DpG/FCAZICQLFLFAorjWAV3I1uE0PnWrVYFluiTJ9Am1DvhlS6JcpFESMhhY688KMSVV6c+9zKHoaQYdZ0Q2EbOpk66qcqwCbRjGWeo6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411368; c=relaxed/simple;
	bh=63QQ5AeRfHUsYqOcw5qE0M6sZlgDfHbjStxWjOdHNk4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qDTWsPmocXu/mBXqg04fAFOV7Gg9G0uNwqYFf+i2VFQNiAv2EqXosDcKBchFBNUGHfAWeSnZCsDf72o7gy/XHkRqOK8Qd0Ggefn8OguidPcbzm0dgO5cwUdrS7tRXH9AK9pOVEjDoLCJdqzXxzdVgcLk+kp+B2lBKegJYC7+vUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=aIEY9BHd; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="aIEY9BHd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=63QQ5AeRfHUsYqOcw5qE0M6sZlgDfHbjStxWjOdHNk4=;
  b=aIEY9BHd7sCrn3BlhzYCyJQMGGymB4kuRMisiOxTErjZwFqDSAk51MbT
   rYM+8aZmeVBCtdnX4iHMMnWptpqVeg5OsrdzG5HPn+3jQHUT1TcN1cPJ1
   mbUbTf0dbt8RCUbtcJIveoqbGuT7x1mbWZhfaw/3fqt2qb6Un2CI3qbBf
   k=;
X-CSE-ConnectionGUID: UJ80lYtCRFOw3/aPeJa4tA==
X-CSE-MsgGUID: t3AJDdJDTjeRaEPBdOG73w==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,167,1787004000"; 
   d="scan'208";a="160227903"
Received: from c-76-123-3-53.hsd1.va.comcast.net (HELO hadrien) ([76.123.3.53])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 14:02:38 +0200
Date: Mon, 19 Oct 2026 08:02:35 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Michal Simek <monstr@monstr.eu>
cc: David Woodhouse <dwmw2@infradead.org>, 
    Krzysztof Kozlowski <krzk@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    ksummit@lists.linux.dev, sashiko@lists.linux.dev
Subject: Re: Patch pre-submission to Sashiko
In-Reply-To: <99b1de44-a550-471b-8e0f-c2e1f95d35d7@monstr.eu>
Message-ID: <6249431-66df-d64e-77bf-8f93bdebf8c0@inria.fr>
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet> <350c7564-a833-4dd4-abf3-b8488280b0fa@kernel.org> <2989609157ab7ef8e9df06dbfce7a1584a987fb1.camel@infradead.org> <99b1de44-a550-471b-8e0f-c2e1f95d35d7@monstr.eu>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 19 Oct 2026, Michal Simek wrote:

>
>
> On 10/19/26 09:26, David Woodhouse wrote:
> > On Mon, 2026-10-19 at 08:25 +0200, Krzysztof Kozlowski wrote:
> > > I assume you mean they will be running it through Sashiko
> > > infrastructure, so using sponsored tokens. Otherwise that possibility is
> > > already there - you can run Sashiko, just a matter of money.
> >
> > I have a patchset in flight where I *have* been running Sashiko (as
> > well as lots of self-tests) locally, and then got further feedback on
> > the list from the public Sashiko which my own run hadn't seen. Twice.
> >
> > I still need to send v3...
>
> Isn't it better to create a new mailing list and filter all CCs/To?
> People can send patches to that mailing list and get reply without CCing
> maintainers and mailing lists. They can run a lot of iterations like that.
> When it is clear they can send clear v1 in a normal way.

This isn't just free tokens for anyone who wants to make a change to the
Linux kernel, not necessarily a change that will ever be sent to a
maintainer?

julia

>
> Thanks,
> Michal
>
> --
> Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
> w: www.monstr.eu p: +42-0-721842854
> Maintainer of Linux kernel - Xilinx Microblaze
> Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
> U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
> TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs
>
>
>
