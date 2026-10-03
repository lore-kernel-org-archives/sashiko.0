Received: from mta1.migadu.com (out-59.mta1.migadu.com [95.215.58.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C080830C177
	for <sashiko@lists.linux.dev>; Sat,  3 Oct 2026 19:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791054607; cv=none; b=pnLeSmByjJVxd1I7egNZHfJu6vuGu3tM/DnRQjLYpl70T8xVbyZ4EXGnZbbeF3C+JJwpf6iAsHCRKlSdog0zNoRcRsyUYd0qkRWUlENPvJFMK+Vfu5Jhtu9MGOT8KJpqrQsJ65K5K7WfxDue62HHq+51EQDic07ticUxhqOF5c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791054607; c=relaxed/simple;
	bh=edc5ma3tipq92yDo6hvgXPiWJwN0SmHqNkLi7stQj9U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=snT67wggUCQtITKFHHHFKysnl1VsCHCX0Nk7NK6dYdYtn32SmSDeos74qXMVRQdSggJqH/ODIR//c9xNV95/NIEKy5CkDX5DJtf7/g8qrT0qBH5T3V/SLfU7jnLYtz52vd4LrgYNfqfBu6YAnUtJePVzVkRXzMPVYIKCx+oMzcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Z/GPuncq; arc=none smtp.client-ip=95.215.58.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Z/GPuncq"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=edc5ma3tipq92yDo6hvgXPiWJwN0SmHqNkLi7stQj9U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791054601; v=1; x=1791659401;
 b=Z/GPuncqGrzID9yAWrpNOZrPTDhrrgOTXJyxVM6C9KW3S+wChPXhiJYon1qvLW/7zMlc5NxL
 /V5vSF912LuXSjbqbAVGDvglef7j2am4PZ+2Jgdg3K1BIM7DJHvWYNan76wZ8MkmJOzNLoXc3ez
 E/Vm0KE780d+Cli36gGP/Zxw=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id 01725ddef5eb54a7;
	Sat, 03 Oct 2026 19:10:01 +0000
X-Mizu-Trace-ID: 01725ddef5eb54a7
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Alexey Gladkov <legion@kernel.org>,  Matthieu Baerts
 <matttbe@kernel.org>,  sashiko@lists.linux.dev,  users@linux.kernel.org
Subject: Re: direct replies from sashiko
In-Reply-To: <ar-HdYtpdDzVLsqg@redhat.com> (Oleg Nesterov's message of "Fri, 2
	Oct 2026 12:29:09 +0200")
References: <ar47HvytXrbOiwTO@example.org>
	<15f15153-d19e-4a3d-9d7b-847109ebb96f@kernel.org>
	<ar98N7kvFD7Qxi0K@example.org> <ar-HdYtpdDzVLsqg@redhat.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Sat, 03 Oct 2026 19:09:56 +0000
Message-ID: <7ia4ld8elhx7.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Oleg Nesterov <oleg@redhat.com> writes:

> On 10/02, Alexey Gladkov wrote:
>>
>> On Thu, Oct 01, 2026 at 04:56:50PM +0200, Matthieu Baerts wrote:
>> > Hi Alexey,
>> > 
>> > (+cc Sashiko ML)
>> > 
>> > On 01/10/2026 12:51, Alexey Gladkov wrote:
>> > > I noticed that sashiko-bot stopped sending me reports about its reviews.
>> > > It was very convenient and meant I didn't have to keep checking
>> > > https://sashiko.dev/. I thought it was just me, but Oleg Nesterov also
>> > > told me that he doesn't receive those reports either.
>> > 
>> > Do you know when it stopped? It looks like there is some activities on
>> > the 'sashiko-reviews' ML.
>> 
>> I don't send patches very often, so I can't say for sure.
>> 
>> Oleg, you're sending more patches. When did sashiko stop sending you
>> reviews?
>
> I've never received any emails from sashiko. Fortunately I can read the
> reviews on sashiko.dev.

Email reviews are sent only to some subsystems (if corresponding
maintainers opted in). It's configured here:
https://github.com/sashiko-dev/sashiko/blob/main/deployment/sashiko.dev/email_policy.toml

fsdevel@ is not there.

I guess some of Alexey's patches had some other mailing lists in cc with
configured email policy.

Also there was few minor email outages over last couple of days, but it
only delayed certain emails.

Thanks
