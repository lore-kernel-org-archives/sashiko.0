Received: from mta0.migadu.com (out-25.mta0.migadu.com [91.218.175.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1EE29B78F
	for <sashiko@lists.linux.dev>; Thu,  1 Oct 2026 17:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790875331; cv=none; b=K76symo3fLuhsbWytpmFH0+oUJJqXnq2N/NqJ0yRFzAiVtQiTv6p0D+wVerHzqmMDX3wLBRCmiraXVPMhtu9UThqlUFKzjLMN8UtFUTCe6TMjx5In43e1VJpdaqCc3Mp6LGj/RIncxe5Hqo6HOFI2NE4z5neg2EDCTxMZwbyFhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790875331; c=relaxed/simple;
	bh=6K35T7bQWKVALSl23besgEcEmd/xdp9eQdiJZwueCTA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qRnU36xX4xYKl0w60iTD2r9/bO7dus2/VdiQdwDH1k7g8DKtUJUd5OVJe6WnPLy5bHQ2YqrZZ7T7e1uhGIq/zD+tHodBd9Zq/LL19zihbzv1wHX4JrDLlNQLykk3XxGMXS/WPn8V6m3zjeQT2wZaj+SbVilcNMhX5ri6dk4tokE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GfeNchFa; arc=none smtp.client-ip=91.218.175.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GfeNchFa"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=6K35T7bQWKVALSl23besgEcEmd/xdp9eQdiJZwueCTA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790875326; v=1; x=1791480126;
 b=GfeNchFatDcmoMsaE8ACDP/WbCMQR0dsYHtBIbGhaeTSHXmV7nsb9jFszjfkUv23X25ZaQlR
 Bxl/ixxg4d9whQcliAqNb7u43s6FkvjhCcghWQyAJSm2sQTFtild8IbywChLGYuMu7zDt9d2h/f
 Lq85drWMr+jkwFfixrOqou9U=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta10.migadu.com with ESMTPS id 59ebb07b259f749a;
	Thu, 01 Oct 2026 17:21:56 +0000
X-Mizu-Trace-ID: 59ebb07b259f749a
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Alexey Gladkov <legion@kernel.org>,  oleg@kernel.org,
  sashiko@lists.linux.dev,  users@linux.kernel.org
Subject: Re: direct replies from sashiko
In-Reply-To: <15f15153-d19e-4a3d-9d7b-847109ebb96f@kernel.org> (Matthieu
	Baerts's message of "Thu, 1 Oct 2026 16:56:50 +0200")
References: <ar47HvytXrbOiwTO@example.org>
	<15f15153-d19e-4a3d-9d7b-847109ebb96f@kernel.org>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Thu, 01 Oct 2026 17:21:49 +0000
Message-ID: <7ia4pkxt5ob6.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Matthieu Baerts <matttbe@kernel.org> writes:
Hey!

Several questions here:
1) What mailing list are we talking about? There are per-mailing list
policies defining if and who sashiko is sending emails.
2) Do you see findings in corresponding patches on sashiko.dev?
Sashiko previously reported preexisting bugs together with new bugs,
but now it's putting them into the database available to corresponding
maintainers ("bugs" button on sashiko.dev), so the number of emails
might naturally drop.
3) There might be a bug somewhere :) I need more details to dig in.

Thanks


> Hi Alexey,
>
> (+cc Sashiko ML)
>
> On 01/10/2026 12:51, Alexey Gladkov wrote:
>> I noticed that sashiko-bot stopped sending me reports about its reviews.
>> It was very convenient and meant I didn't have to keep checking
>> https://sashiko.dev/. I thought it was just me, but Oleg Nesterov also
>> told me that he doesn't receive those reports either.
>
> Do you know when it stopped? It looks like there is some activities on
> the 'sashiko-reviews' ML.
>
>> Maybe I missed something - is there a setting to turn on its reports ?
>> Or maybe there are some rules regarding when sashiko sends a report ?
>
> On my side, I sent a PR to change this file:
>
> https://github.com/sashiko-dev/sashiko/blob/main/deployment/sashiko.dev/email_policy.toml
>
> Maybe something has changed for your case?
>
>> P.S. For some reason, Oleg Nesterov is not subscribed to the users@
>> mailing list.
> I don't know if Roman and other sashiko devs are on this users@ ML, but
> there is a Sashiko ML (now in cc).
>
> Cheers,
> Matt
