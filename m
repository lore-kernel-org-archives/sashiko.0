Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169773CBE7D
	for <sashiko@lists.linux.dev>; Fri,  8 May 2026 16:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778258928; cv=none; b=V9Y1KLiEJ6CHB/QRKprtCjNQjkpA2BbF+YSkBxeE/h0Z12Crms5tYHcIrRenJ4rSy3mvt5p6P2vF9PAa6r7+hYqMGWMmR4O9HXfF3XymEWFCQ5ani1alS+le7UjpI8fItSFjbLiR3D60aGLZN6i3nXu3qfFYABd7x2u159mDu+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778258928; c=relaxed/simple;
	bh=PdH0hDI6V3wgIVfGFwvIY573iPEtSzRi+ChIcbs+L30=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Kgby6b1/o/gll11Z4AI1+tHqjcSTO5quEL6XHsycBZM6bI+9HoLMXzW2kGK0L2QHZPm5a7+8VlayxgpW/EUmqjN4cDNKf04bDkrTsy0vcLC3f+qYiF427NncR0UAihJs2la4gsgzpkGQoyTBYr03c3wpcbCLeByRWbKPBhq5+Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ieJzY9Ry; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ieJzY9Ry"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778258923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PdH0hDI6V3wgIVfGFwvIY573iPEtSzRi+ChIcbs+L30=;
	b=ieJzY9RyU9YjnVFrhoAbdQSyYeJN/H1SW7jWYTAB/sazwAUHVjr/AOXgHcJA34wVhdf1qV
	KVbjy53FQBiQVeN7nZapxYbCWahqBb2QqU9QJhtT44owxJgFScP3HYqlg+zOnryOdntblt
	7gQkuA1ppSSA7Y9Aj+E+Lic/p6bT87c=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: sashiko@lists.linux.dev
Subject: Re: Please add linux-s390 to sashiko.dev
In-Reply-To: <6d2bebec-4bcb-46d2-b9b0-c1a83e087477@linux.ibm.com> (Christian
	Borntraeger's message of "Tue, 5 May 2026 13:56:23 +0200")
References: <6d2bebec-4bcb-46d2-b9b0-c1a83e087477@linux.ibm.com>
Date: Fri, 08 May 2026 09:48:39 -0700
Message-ID: <87lddt6e54.fsf@linux.dev>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT

Christian Borntraeger <borntraeger@linux.ibm.com> writes:

> Folks,

Hi Christian!

> thank you for the great work with Sashiko. We highly benefit from the
> results.

Thank you!

> would it be possible to add
> linux-s390 <linux-s390@vger.kernel.org>
> to the sashiko patch review?
> The archives are at
> https://lore.kernel.org/linux-s390/

Sorry, missed your email while was at lsfmm. Just added, will roll out
later today.

Thanks!
