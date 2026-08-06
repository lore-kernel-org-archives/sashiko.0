Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9093C2FD696
	for <sashiko@lists.linux.dev>; Thu,  6 Aug 2026 01:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785980904; cv=none; b=QL5wU+CQMNd/dwF7EqYmfBu/LyMFwcI3djBniPl7Ome9asYVQ4e8cZdXoOhVeQkkEfnlKJ1oZ+RuNX6Tu0LA0KDzgjTnepnoauh3BJ5Jc/BwairP96by5K64VlGE8SJOSU7h2Xl0vUdE/hryznhXvP8Z+o4ETkJu6UOXh4YwMmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785980904; c=relaxed/simple;
	bh=+3KtjUQfo8YXPtzMG31X+RAkj+7cnexu6P/twIdYdig=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Qlp0OHhd51zjRbDK2SebBwit5t+XkV4CUPJ8cWo7jMOevwi3SN8n9FaFFDpvS00jdRSf5ZsUghW4wtYuK0gQ/2gy7D+f6hVDsod/It6KB3C/fBv4yAODU22QjozdwBkpdh/Jh9/Hk36xvu5zldtfsXEciL/doSlhVhQf+qWmqVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=c777szgf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="c777szgf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B461F000E9;
	Thu,  6 Aug 2026 01:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1785980903;
	bh=ssRfPji/CW5PCTuWcz1fnuGHBQSD5WLtTCDKQz/Hej0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=c777szgfe8hCOXgM908PdG3YgkfXh0canWbUc7ENl1aQy2twAH1MIjkMrjsHY9+cw
	 MGmW7YOTPHBXRX7Au7mcGjBWW+0j1zlFLadvaYPA4V3pUVLZY4+aztsDtt4GzxjTEW
	 xepqTPdlbTDykBucOBePS5ugdY4RVXCoih26nF9s=
Date: Wed, 5 Aug 2026 18:48:22 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Phillip Lougher <phillip@squashfs.org.uk>
Cc: sashiko@lists.linux.dev
Subject: Re: [PATCH v2] Squashfs: check block offset is not negative
Message-Id: <20260805184822.36433a12a7c0df21e5d49874@linux-foundation.org>
In-Reply-To: <23ad1c7b-8b9c-4f81-ba17-129ae787ba40@squashfs.org.uk>
References: <20260805175900.600140-1-phillip@squashfs.org.uk>
	<20260805111526.18fad215e3bb29a254814256@linux-foundation.org>
	<23ad1c7b-8b9c-4f81-ba17-129ae787ba40@squashfs.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


(cc sashiko@, I trust that's OK)

On Wed, 5 Aug 2026 23:29:27 +0100 Phillip Lougher <phillip@squashfs.org.uk> wrote:

> 
> 
> On 05/08/2026 19:15, Andrew Morton wrote:
> > On Wed,  5 Aug 2026 18:59:00 +0100 Phillip Lougher <phillip@squashfs.org.uk> wrote:
> > 
> >> If a negative offset is read off disk (for example the offset into the
> >> decompressed fragment block), this will cause squashfs_copy_data() to
> >> perform an out of bounds access.
> >>
> >> Fix by checking if offset is negative, and returning 0.  This matches
> >> existing behaviour where an offset beyond the block returns 0 bytes
> >> copied.
> >>
> >> To trigger this out of bounds access requires a crafted Squashfs
> >> filesystem and CAP_SYS_ADMIN to mount it.  Unprivileged users will not
> >> be able to mount such a filesystem, but once mounted, an unprivileged
> >> user can trigger the out of bounds access by reading the crafted file
> >> with the negative offset.
> > 
> > AI review thinks we might have an information leak in there:
> > 	https://sashiko.dev/#/patchset/20260805175900.600140-1-phillip@squashfs.org.uk
> 
> Having done some more research, it looks like the AI is using an OLD kernel version
> dating back to before 2018-08-01.

Thanks for looking into this.

I'd be surprised if this was the case, but what would I know?  Perhaps
Sashiko trained itself on a seven year old kernel?

> The code in question was changed by Linus Torvalds on 2018-08-01 with this commit
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cdbb65c4c7ead680ebe54f4f0d486e2847a500ea
> 
> Specifically, that commit changed the following lines from:
> 
> 
> -		squashfs_copy_data(pageaddr, buffer, offset, avail);
> -		memset(pageaddr + avail, 0, PAGE_SIZE - avail);
> 
> to
> 
> +	copied = squashfs_copy_data(pageaddr, buffer, offset, avail);
> +	memset(pageaddr + copied, 0, PAGE_SIZE - copied);
> 
> So the issue the AI is complaining about no longer exists.

I've been wondering about this.  What kernel versions does Sashiko
attempt, and why?

I was recently surprised to see some MM report against the net/next
branch!  I assume it found the patchset applied so off it went.

Can sashiko peeps please clarify?  What is the algorithm for trial
applications?  What trees/branches does it attempt and in what order?

