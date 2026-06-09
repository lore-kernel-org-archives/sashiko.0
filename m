Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988F73B38BD
	for <sashiko@lists.linux.dev>; Tue,  9 Jun 2026 17:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781025716; cv=none; b=Lm0C5aAXzjLAUzpclKWvQnwSVhW/jMzie+7rTAdNzzwKmZAnH1Nqi6Md7uCPbs+V/X4GgdHrcl1Wsw5HF8ShRMibFLSbgTRneK6QA9nRU7Kzox89xeMosm3ZrVnA0IoO6yYyx4ni5HIhfxTVOcTDG5KXPCGZEeJmwgC9PeQeSHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781025716; c=relaxed/simple;
	bh=g88cCvXivilU9/t1pYeYpmmxbyLeRs7OAdwEAHbKF8s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O4uZN3lzggCbn98STGpjmYCQyvZi4CREq3cStQYvpqvIkFqXw/kDXMCYLYQRMdnEPeZffpydwupqqg0+iCXoDQJl7NnsLbQfuSLkFE/XrNLNBwtIlZAKfBEvK6o3d4Kb769+piKT/0I/SJyDIBAIBTc4y56oXc2oraS0o37V0TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=F/dWgIdq; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="F/dWgIdq"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781025712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g88cCvXivilU9/t1pYeYpmmxbyLeRs7OAdwEAHbKF8s=;
	b=F/dWgIdqKWJr7OT5VD/u3I12aNrcOMAzfMMCyO0eN78Sboo6xAE+DCEc6Qs+YIKBLiZXUL
	ZaCikQWqB5uwhVBahSsPrL2CfR34sVIwXA0TpmKVpyYcMbn9gEBsOKTC2xa8RKQTbBXUUy
	FdYfURw2XqVJnCUWh2VENGTo1Y7bZHs=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,  Alexandre Courbot
 <acourbot@nvidia.com>,  sashiko@lists.linux.dev
Subject: Re: Sashiko email policy precedence
In-Reply-To: <CANiq72k5n2yci3Qt=D9WbT2+yCU7V0AVe3UmUvsmQTcdJG0pDw@mail.gmail.com>
	(Miguel Ojeda's message of "Tue, 9 Jun 2026 18:38:43 +0200")
References: <DIX8UX2TJP8E.4OAWKUUF5JG1@kernel.org>
	<CANiq72mSpur28Fz8YL7_-FJk_h008kt=sw6mLeSsRNmiy+ko1Q@mail.gmail.com>
	<DIXM8JL1CM5A.315I0YBSDJT5O@kernel.org>
	<DJ3PO5LX7TQK.3BS0W5EV7NB7C@kernel.org>
	<7ia4ecifd6i9.fsf@castle.c.googlers.com>
	<CANiq72k5n2yci3Qt=D9WbT2+yCU7V0AVe3UmUvsmQTcdJG0pDw@mail.gmail.com>
Date: Tue, 09 Jun 2026 17:21:40 +0000
Message-ID: <7ia4a4t37hp7.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

> On Tue, Jun 9, 2026 at 6:27=E2=80=AFPM Roman Gushchin <roman.gushchin@lin=
ux.dev> wrote:
>>
>> One option, is to switch from mailing list granularity to the
>> MAINTAINERS-entry granularity. Wdyt?
>
> Hmm... What does this mean / how would it work?

Very vague idea at this point, but: for each patchset sashiko can
determine the main MAINTAINERS entry it covers and apply it's rules.
That would help with the case when large mailing lists are cc'ed.
Now if e.g. a patchset is sent to e.g. bpf@ and netdev@, sashiko
tries to find a combination of the rules and it's kinda tricky...
Maybe the better approach is to decide which subsystem is primary here,
e.g. by the subject prefix or diff stat, and go with the corresponding
rules.

Thanks,
Roman
