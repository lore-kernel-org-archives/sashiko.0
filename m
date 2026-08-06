Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1533238B7A6
	for <sashiko@lists.linux.dev>; Thu,  6 Aug 2026 17:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786038270; cv=none; b=ldX+EIE11ToX9zf99oLb+ThgbP7IuHng6y0zpUdxdpwdEleIhN6s1THhx6WB4HlhaEEvVSaWiasVo27jFHx7HY/TAux6oew+zxAdvh02a+Bc0a0YK/72fro0ycgB7GgrhkEF7RhsXJPAh3ev6i3uyGrYeN6y4cWfEHBKnTLcEbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786038270; c=relaxed/simple;
	bh=h7CzqOYkWqRYV6h4mApgZUt6EFHOlCb7+wGsFc6fXqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=XOJlfw61+nipupp2Jf6NAo2jxltoZ3dyBoHQwG5diVX4Awk74+y9+vb7p9EvCQdM+fP4eIzYixGjwpD1Y5+b+OwMzSpg3IYEgnlgm6bLRd1KBtnPa6YxUzc/oG/uOV0Im3FPwqyMyeuonaD/EzSUQSjzgGWG8UGm+AYOmIRif8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DJRNYjc7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DJRNYjc7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786038266;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=VTD9CvRuTYI7rLHAfx/CErQHRDcVdaq6J8FM3MlagqI=;
	b=DJRNYjc7vFFDix4B+cybPq9js4pJR94tUbj89MhZhJzx1Fhysqw9Cvo7ckhDOKi0B3Z7Eo
	dVm2qRvsS++FTYCixnb6I/bks70R9wfWvU4dtZiJbdA6k4f1EWSIumxDaBQULN9W5kLG/V
	cApv+9cy5VwDRh3ObAdufC3am7ijfIc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-557-abha76qsOyScaxxn4QgB9g-1; Thu,
 06 Aug 2026 13:44:21 -0400
X-MC-Unique: abha76qsOyScaxxn4QgB9g-1
X-Mimecast-MFC-AGG-ID: abha76qsOyScaxxn4QgB9g_1786038260
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DCAE219560B2;
	Thu,  6 Aug 2026 17:44:19 +0000 (UTC)
Received: from localhost (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 480DD30001A2;
	Thu,  6 Aug 2026 17:44:19 +0000 (UTC)
Date: Thu, 6 Aug 2026 13:44:18 -0400
From: Derek Barbosa <debarbos@redhat.com>
To: Phillip Lougher <phillip@squashfs.org.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>, sashiko@lists.linux.dev
Subject: Re: [PATCH v2] Squashfs: check block offset is not negative
Message-ID: <anTGjto5EmCpW68T@debarbos-thinkpadt14gen5.rmtusma.csb>
Reply-To: debarbos@redhat.com
References: <20260805175900.600140-1-phillip@squashfs.org.uk>
 <20260805111526.18fad215e3bb29a254814256@linux-foundation.org>
 <23ad1c7b-8b9c-4f81-ba17-129ae787ba40@squashfs.org.uk>
 <20260805184822.36433a12a7c0df21e5d49874@linux-foundation.org>
 <411520ff-cc9f-4563-8d46-9fc1044f8b46@squashfs.org.uk>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <411520ff-cc9f-4563-8d46-9fc1044f8b46@squashfs.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lDB5E898yY_lRBG4ol0-l1mPeyuWStTkLQaO0WHWmnk_1786038260
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Thanks for the report :)

On Thu, Aug 06, 2026 at 05:10:12PM +0100, Phillip Lougher wrote:
> > > > 
> > > > AI review thinks we might have an information leak in there:
> > > > 	https://sashiko.dev/#/patchset/20260805175900.600140-1-phillip@squashfs.org.uk
> > > 
> > > Having done some more research, it looks like the AI is using an OLD kernel version
> > > dating back to before 2018-08-01.
> > 
> > Thanks for looking into this.
> > 
> > I'd be surprised if this was the case, but what would I know?  Perhaps
> > Sashiko trained itself on a seven year old kernel?
> 
> The solution to the mystery is to look at the Sashiko output, to
> see where they got the kernel.
> 
> *********************
> Selected:
> squashfs-next/HEAD / 62421645
> *********************
> 
> So the kernel they used is my squashfs-next tree.
> 
> There are three problems with that.
> 
> 1. I have not updated the squashfs-next tree in at
>    least twelve years (2014 would have been the latest).
> 
> 2. I lost access to git.kernel.org in about 2015.
> 
> 3. Having had a look on git.kernel.org, the squashfs-next tree doesn't
>    seem to exist anymore anyway (purged due to disuse?)
> 
> So the fix here for Sashiko is to use the latest kernel tree, and not an
> ancient squashfs-next tree which doesn't exist anymore.
> 
> Phillip
> 
> 
> 

Yes. It seems like Sashiko is selecting the incorrect baseline here. However,
from what I can see in baseline.rs, Sashiko pulls the mainline MAINTAINERS entry
and parses it to find whatever "matched" subsystem it could detect from the
patches.

From Torvald's tree (remote:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git) with HEAD at
fcaeecb8b0cd44f77d03b28de0671258d4db18f8

SQUASHFS FILE SYSTEM
M:	Phillip Lougher <phillip@squashfs.org.uk>
L:	squashfs-devel@lists.sourceforge.net (subscribers-only)
S:	Maintained
W:	http://squashfs.org.uk
T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pkl/squashfs-next.git
F:	Documentation/filesystems/squashfs.rst
F:	fs/squashfs/

I may be mistaken, but maybe updating the "T:" entry would resolve the issues
you are seeing? Is this the same tree that you described as "purged"/unused?


Thanks,

-- 
Derek <debarbos@redhat.com>

