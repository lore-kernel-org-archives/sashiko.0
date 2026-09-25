Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD244DB567;
	Fri, 25 Sep 2026 15:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351922; cv=none; b=YrsWisy4prGpuQgakmuYwfbpwd1rP3R/mdtmnQsmfWjgCDsKWR4+YYq+zOyHyLD4U+rpd1qkN5Jm1RPfmLruaOAKvaFSfoXEF+THmJT/yaUn5Sl+1d2OmvN2E+/NbTPCNURSjZF/+evEJDsY7vQnUzmu5ptQwuuUMBBjq7YChRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351922; c=relaxed/simple;
	bh=qR8azvgZfaRgE4wOVbNM1K5aJXx9TItF6h8M3YodUMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FyLn7jt4/QbN6+7aGvhCL9Xh9AXDMlMcm0WypATo96KeiYknCZt3p4cvcbDA8PUDCA7roP21U7Q/PITTyCAaU+YDlFu01qYEKp7Mj5zHz8in/85dCT+mw+xlZtYznajOcEi+V5KY6vXzyadUqLsIdfmhCc1UsHElBKKWoNMkI7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SgZQLK/Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SgZQLK/Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C781F000FF;
	Fri, 25 Sep 2026 15:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790351916;
	bh=qR8azvgZfaRgE4wOVbNM1K5aJXx9TItF6h8M3YodUMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SgZQLK/ZjTy0c1dNQAGHBfjxb6+BScZ4bBrLAmKMtrAjFjBCc474psP22+z9Q7xbF
	 DLvGeI0/5a86Cg111z8elU1nj9UDgNB9FgPIf+OtNj7PrPff30k1WdbFXon7D7eWNH
	 uZH5gkis5ea40x1CD5tlZTwvy/KMyX4c/1Ra+1/8g2N7h0fd9aNsjyYIypYwRhWeSI
	 Yb/ngp7yrqGrT8odRHzIJY0kwFKBVKHn20+desMT8QYhhMhFfu1wpraK1V/jsMRMIw
	 3oym+6bAQgvvUCIuC29xsJafd8BSCe+4/cyW7txTLiI/9gsjhuz3U1o8rugfeA0cEU
	 N5qKTjaS0cx8A==
Date: Fri, 25 Sep 2026 16:58:32 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	David Hildenbrand <david@kernel.org>, Suren Baghdasaryan <surenb@google.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	sashiko@lists.linux.dev, Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH v3 00/40] mm: make VMA flag semantics explicit, eliminate
 VM_SPECIAL
Message-ID: <araV69I3WLn9I_Nu@gremlin>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>

< Edit mailing list, +sashiko as I gather this kind of feedback is wanted? :) >

I usually don't report it, but here's an example of some false positives, which
sashiko regenerates on respin.

Specifically the 2/40 (high) report was valid, as raised by Gregory and now
addressed ready for v4.

The ones on 1/40 (high), the other 2 on 4/40 (medium, medium) and the one on
24/40 (low) were all just wrong.

The one on 8/40 is bit but had some semblence of logic, but still not something
I'll take action on.

So a false positive rate of 83.3% here, or 67.7% if you exclude the 'meh' one.

In general I've continued to find the rate to be 50% at best, and it has not
improved over time.

It also seems that low/medium reports (which I think were disabled before?) are
particularly bad.

(I thought those were previously disabled for being inaccurate?)

I realise everybody is busy, but it'd be nice to have a means of marking
individual reports as hallucinations.

Thanks!

--
Cheers, Lorenzo
