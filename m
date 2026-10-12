Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904304BC007
	for <sashiko@lists.linux.dev>; Mon, 12 Oct 2026 22:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791843102; cv=none; b=BBRft0eN6yXmkSj+AzK9o4q7FmPVct+sfwMy58Hmw2cXQV7tU0Z5TCC8uj8eJexrQVv7JpmfN16Vk3/1404n+/rpcGCnoBeeGU4dwPzRVAorbHbDSvqPh6Zs5MzgiQjdjiInU8ai3Nyhwv+/cYvIx0KTojusM0OnlYsVr3CnGeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791843102; c=relaxed/simple;
	bh=5F9Qh79QjzMkdjikkpHgt64hgobEhXh5qmXXFQLJSUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LwohUVZrus/pYmlZG/zed1+Wmir9yEYeLjR1oFVgXl/1u4iIOVeZkzhAPOyersYv6rzk8jdZlT8dSwdgKVte1DpRccUqRNMGY4Br0Xo+RTmT+k7AaqbFtnE2N3lJNPre3ROvBTjibza8rjJswINTqAdPDeRImWRklaydnUqlzk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eBV7yrjW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eBV7yrjW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F1A41F0089B;
	Mon, 12 Oct 2026 22:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791843096;
	bh=AU8K80hpmEmQFzWcbpPR8z1hmL1B9Euq8EAxZiUIqCU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eBV7yrjWklDrn+r+3cQtIN2bqaocj9hNMCMxqJLZpBGG8OgMl40ouIafCYMjUumhR
	 CLxzBCGZ3fhd3QBVfaaDZCGxIgu+DUcpYOnHoxFS9ohJ63RZKXFD9qfu7dX4rfJjZy
	 AhLTWUASAd/YtfiXiqoYJHBrHIUAywiIFPoH/xaXJ4wz2x9F/DdCJ9/f3MVLHDF2A9
	 js2rW4Qb+nBhpCY4eowfctVg0nU/KQ0R5EfTXlnrH2BVekf6Bzbn5I4C/KCUB5z8vM
	 LCIYL1a1ZXophGnp8M455qXmRSyg21PQtarnGfOUqXUMWILQ+NuK3x3NavMix3tY50
	 OJ4R+sgkWcn7Q==
From: SJ Park <sj@kernel.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	sashiko@lists.linux.dev
Subject: Re: email handling
Date: Mon, 12 Oct 2026 15:11:28 -0700
Message-ID: <20261012221129.375576-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <6355837F-7F0E-4C49-B1D4-223296508C18@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 12 Oct 2026 14:58:56 -0700 Roman Gushchin <roman.gushchin@linux.dev> wrote:

> 
> 
> > On Oct 12, 2026, at 2:25 PM, SJ Park <sj@kernel.org> wrote:
> > 
> > ﻿Hi Andrew,
> > 
> >> On Sat, 10 Oct 2026 15:06:29 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:
> >> 
> >> 
> >> Concerning this email:
> >>    https://lore.kernel.org/20261009-b4-mmap-prepare-vma-flag-sanify-v5-16-923b70125b1e@kernel.org
> >> 
> >> I discovered that some lucky duckies were receiving Sashiko emails:
> > 
> > Apparently that's because the patch is Cc-ing a few mailing lists that are
> > configured [1] to receive the review mails.  For example, the patch is Cc-ing
> > s390@ mailing list, and it is configured [2] to send the review email to the
> > author of the patch, the mailing list, and a few more people including Heiko.
> > To quote the config [2],
> > 
> >    ["linux-s390@vger.kernel.org"]
> >    reply_to = ["author", "list"]
> >    positive_review = "all"
> >    cc = ["Heiko Carstens <hca@linux.ibm.com>", "Vasily Gorbik <gor@linux.ibm.com>", "Alexander Gordeev <agordeev@linux.ibm.com>", "Christian Borntraeger <borntraeger@linux.ibm.com>"]
> > 
> >> 
> >> Subject: Re: [PATCH v5 16/38] mm/vma: add and use
> >> vma_[flags]_is_fixed_mapping
> >> Reply-To: sashiko-reviews@lists.linux.dev
> >> To: =?utf-8?b?TG9yZW56byBTdG9ha2VzIChBUk0p?= <ljs@kernel.org>
> >> Cc: linux-trace-kernel@vger.kernel.org, kvmarm@lists.linux.dev, "Vasily
> >> Gorbik" <gor@linux.ibm.com>, "Oliver Upton" <oupton@kernel.org>, "Heiko
> >> Carstens" <hca@linux.ibm.com>, linux-perf-users@vger.kernel.org, "Marc
> >> Zyngier" <maz@kernel.org>, "Alexander Gordeev" <agordeev@linux.ibm.com>, linux-scsi@vger.kernel.org, selinux@vger.kernel.org, "Christian
> >> Borntraeger" <borntraeger@linux.ibm.com>, bpf@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, kvm@vger.kernel.org, linux-s390@vger.kernel.org, linux-usb@vger.kernel.org
> >> In-Reply-To: <20261009-b4-mmap-prepare-vma-flag-sanify-v5-16-923b70125b1e@kernel.org>
> >> References: <20261009-b4-mmap-prepare-vma-flag-sanify-v5-0-923b70125b1e@kernel.org>
> >> <20261009-b4-mmap-prepare-vma-flag-sanify-v5-16-923b70125b1e@kernel.org>
> >> 
> >> 
> >> 
> >> But I did not.  How come?  I was on the To: line so why were certain
> >> people emailed but not me?
> > 
> > I think that's because you are not on the configuration.
> > 
> >> 
> >> I'd prefer to receive such replies.
> > 
> > Maybe you could add below change to get replies for mm patches?
> > 
> >    diff --git a/projects/linux/mailing_lists.toml b/projects/linux/mailing_lists.toml
> >    index e41f1aa..330d1d8 100644
> >    --- a/projects/linux/mailing_lists.toml
> >    +++ b/projects/linux/mailing_lists.toml
> >    @@ -313,3 +313,6 @@ reply_to = ["author", "list", "recipients"]
> > 
> >     ["fsverity@lists.linux.dev"]
> >     reply_to = ["author", "list", "recipients"]
> >    +
> >    +["linux-mm@kvack.org"]
> >    +cc = ["akpm@linux-foundation.org"]
> > 
> > My understanding of Sashiko is quite limited, though.  Please correct me if I'm
> > wrong, Sashiko team.
> 
> Thanks, SJ.
> 
> I answered Andrew privately, but you’re right, the second option you suggested will subscribe Andrew to all mm reviews.

Thank you for confirming, Roman.

> Sorry, I did not understand, what limitation are you talking about here?
> The only limitation here is the variety of preferences by various maintainers: some push for reply_all lkml-wide,
> some hate sashiko’s emails in general.

What I wanted to say is that I'm not fully understanding Sashiko code, and
hence my above 'mailing_list.toml' edit suggestion might be wrong.  It was just
for giving Andrew a warning about my suggestion.  Now you confirmed my
suggestion is not wrong, so no problem here. :)


Thanks,
SJ

[...]
