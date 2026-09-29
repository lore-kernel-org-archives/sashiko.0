Received: from mta1.migadu.com (out-234.mta1.migadu.com [95.215.58.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9A430F92E
	for <sashiko@lists.linux.dev>; Tue, 29 Sep 2026 04:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790657068; cv=none; b=BagolTRKz9j9QE/5qtQn1K6JsvBwmwvMsMoZyD+7BZUnaZEME32+WEb01Y1X2LDYNcTsfCV0PylwADe1WpdgEH/2x5rFm6WabaKUdEteb1NLaRZA6dZQkdKynkJr06nA8yn+5Qb7cVbhPZjSspw3Bc/Q9ISOQdWR6SQW2YOkeLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790657068; c=relaxed/simple;
	bh=X7B85Qmp4sZRLQWYL6Rhp/KPN4d3fFISZOA5yPD1ecs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Mrg8t59Sa4uVA8Iwpa+BO/fEmgxa0wE8ZApgsRWp50HerRhUOR5z0RY+oCcHnJizxSZ++vOEDpfENdDXG6JhBkHNMsXYh4VSiDnKpQ8yi1fCHIOE0GGawgermlj4DVbhzRQOQ6mQwtQPHEhYN03jZfhRQoiqdezXaAjA2T35c1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ddV/OAXq; arc=none smtp.client-ip=95.215.58.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ddV/OAXq"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=X7B85Qmp4sZRLQWYL6Rhp/KPN4d3fFISZOA5yPD1ecs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790657063; v=1; x=1791261863;
 b=ddV/OAXqUbQpIW1TdXDbbpiSQS8rI5F7kcgDOJqn+/l12s8PJj/eAGnuQidKQenpFcyuVXxH
 FhSCOI2O6U5zhf1+/JtyLRibdVW/GVbo+E6YKbguWzfCj50oAvBL3ZT+9OziDv5ZxS4D+sQk2B7
 iZESD2LVUaHD0eGfsJBNzoQE=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta11.migadu.com with ESMTPS id 0ad23fef2dbf8a35;
	Tue, 29 Sep 2026 04:44:23 +0000
X-Mizu-Trace-ID: 0ad23fef2dbf8a35
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Bartosz Chronowski <immersa.bartosz.chronowski@gmail.com>
Cc: sashiko@lists.linux.dev
Subject: Re: Request for patch submission and CLI access to sashiko.dev
In-Reply-To: <CAFsnwTcgWvGNTVn8q5cco1qTLqsQwg0T=eg=C4M+wDirCxAKmA@mail.gmail.com>
	(Bartosz Chronowski's message of "Mon, 28 Sep 2026 07:38:36 -0700")
References: <CAFsnwTcgWvGNTVn8q5cco1qTLqsQwg0T=eg=C4M+wDirCxAKmA@mail.gmail.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Tue, 29 Sep 2026 04:44:16 +0000
Message-ID: <7ia45wzoekf3.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Bartosz Chronowski <immersa.bartosz.chronowski@gmail.com> writes:

> Hi Sashiko Team,
>
> I work on Linux kernel fixes and would like to submit individual patches
> for review on sashiko.dev, including through sashiko-cli.
>
> May I ask to enable sign-in for the email address I am sending this message
> from and grant permissions to:
>  - ingest, for submitting patches
>  - review, if separately required to trigger or rerun reviews
>
> Could you please also advise the supported authentication procedure for
> remote sashiko-cli submissions?

Hi Bartosz,

sashiko is currently not providing such option. The recommended
alternative is to run your own sashiko instance. sashiko.dev reviews
only patches sent to public mailing lists.

Thanks!
