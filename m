Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFC23B1B3
	for <sashiko@lists.linux.dev>; Fri,  7 Aug 2026 00:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786062656; cv=none; b=gt6ggMVqOnC9g7PbklWBl52Igwz8tgZprausax17B8ndBbX/bKtULXFeexEO0uZ9yN9hSZcVfP82wLu3IWKY/n/CbPQ6JmdaG5/Sg5CVes5Uy6UnYkKs8bmWkPVoo5UAhHPozNizIY3UcxvfI+s6wFmIx130734YsSMLl1ftFKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786062656; c=relaxed/simple;
	bh=fPUEFMaLL1WkXj7NSAdZ8ES2hKxLuJdKltnkGZ7RQ8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=tq6W5BLU7UOBIsNXHntVDaMnET/FNpce6Rp/GWs1qYHYzn509xkiPlS36faIgV0Kk3ByVQ2RgJEd89VLW8aET1H2NzGvqZ5YLkvr27Dig87zcnW+bkSX/VrmfChsP42SmKiTAb4C+Ym9pkqUC6OaAIq+BZ4YSW4Wu1Sitlnvtw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=boIJzCWb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="boIJzCWb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786062653;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p07gHCso+bjqFtvWgeY3sOYpjIIOKbiKj2iTskomWyw=;
	b=boIJzCWbKvRJB/1NkjkLG7XDYKdfKwD11rRQIjRynpkm60bCBGcMdIRM9l8fEBp2pQoHjh
	tAO2rpxAumuXnnPpXKGyIewCNVbytVb1h57Oc5y6x2i33KknB3VZq+LNwPbs4R3f65MSg/
	fkqgDIXnsl9siRP1F3JvB0hujqS6824=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-411-FV16ug8mNvSVB8Z6de3Q4Q-1; Thu,
 06 Aug 2026 20:30:44 -0400
X-MC-Unique: FV16ug8mNvSVB8Z6de3Q4Q-1
X-Mimecast-MFC-AGG-ID: FV16ug8mNvSVB8Z6de3Q4Q_1786062643
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B63401956089;
	Fri,  7 Aug 2026 00:30:43 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 25F9F434;
	Fri,  7 Aug 2026 00:30:42 +0000 (UTC)
Date: Thu, 6 Aug 2026 20:30:42 -0400
From: Derek Barbosa <debarbos@redhat.com>
To: Phillip Lougher <phillip@squashfs.org.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>, sashiko@lists.linux.dev
Subject: Re: [PATCH v2] Squashfs: check block offset is not negative
Message-ID: <anUi3bkwfM8teo_R@debarbos-thinkpadt14gen5.rmtusma.csb>
Reply-To: debarbos@redhat.com
References: <20260805175900.600140-1-phillip@squashfs.org.uk>
 <20260805111526.18fad215e3bb29a254814256@linux-foundation.org>
 <23ad1c7b-8b9c-4f81-ba17-129ae787ba40@squashfs.org.uk>
 <20260805184822.36433a12a7c0df21e5d49874@linux-foundation.org>
 <411520ff-cc9f-4563-8d46-9fc1044f8b46@squashfs.org.uk>
 <anTGjto5EmCpW68T@debarbos-thinkpadt14gen5.rmtusma.csb>
 <267938f6-8212-4ddc-9055-452f9d166010@squashfs.org.uk>
 <d066d78d-52c3-4224-ad50-f87e0ad8595a@squashfs.org.uk>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <d066d78d-52c3-4224-ad50-f87e0ad8595a@squashfs.org.uk>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zwxhoGYh5TyUr0sOn3GteC11eV8nfDP8TSVTp7ojT-Q_1786062643
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Aug 06, 2026 at 08:54:14PM +0100, Phillip Lougher wrote:
> > > I may be mistaken, but maybe updating the "T:" entry would resolve the issues
> > > you are seeing? Is this the same tree that you described as "purged"/unused?
> > > 
> > 
> > Yes, the git URL (the T: entry) is out of date.
> > 
> > But, until you mentioned it now, I didn't know it existed,
> > because I never added it.
> > 
> > It was added in commit https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9f273c24ec5f4
> > 
> > author    Fengguang Wu <fengguang.wu@intel.com>    2016-01-20 15:03:25 -0800
> > committer    Linus Torvalds <torvalds@linux-foundation.org>    2016-01-20 17:09:18 -0800
> > commit    9f273c24ec5f4a6f785bb83e931b3808a07b459e (patch)
> > tree    7bc0126edb6ded71bec82e4c057768d76928b2f5
> > parent    b2807f07f4f87362925b8a5b8cbb7b624da10f03 (diff)
> > download    linux-9f273c24ec5f4.tar.gz
> > MAINTAINERS: add/fix git URLs for various subsystems
> > 
> > @@ -10217,6 +10242,7 @@ SQUASHFS FILE SYSTEM
> >   M:    Phillip Lougher <phillip@squashfs.org.uk>
> >   L:    squashfs-devel@lists.sourceforge.net (subscribers-only)
> >   W:    http://squashfs.org.uk
> > +T:    git git://git.kernel.org/pub/scm/linux/kernel/git/pkl/squashfs-next.git
> >   S:    Maintained
> >   F:    Documentation/filesystems/squashfs.txt
> >   F:    fs/squashfs/
> > 
> > I will send a patch to remove it.
> > 
> > Thanks
> > 
> > 
> 
> I have sent a patch to remove that dead URL from the MAINTAINERS file.
> 
> But, the point is, is that enough to make Sashiko default to using Linus
> Torvald's upstream development kernel for Squashfs patches?

It should be. I'm adding a docs entry in the MAINTAINERS_GUIDE for more clarity.
[0]

It will most likely be merged when Roman returns.

> 
> As I said previously I lost access to git.kernel.org in 2015 (if you ask
> why I will tell you privately).  So I can't put a kernel tree on there,
> but I could on Github (the kernel is already on Github and so it will be a
> simple fork).  But it seems a PITA to do that just for Sashiko.

Let's wait and see. Please feel free to continue to forward/cc errors here. If
changing the maintainer's entry doesn't work out, we can add some escape hatch
for squash-fs (like we do for MM) in baseline.rs.

<snip>
        // Check for Linux-MM special handling
        // If the top candidate is akpm/mm or linux-mm, OR the subsystem is MEMORY MANAGEMENT
        let (top_url, _top_branch) = candidates[0].0;
        let is_mm = top_url.contains("akpm/mm")
            || top_url.contains("linux-mm")
            || matched_subsystem_name
                .as_deref()
                .map(|s| s.eq_ignore_ascii_case("MEMORY MANAGEMENT"))
                .unwrap_or(false);

        if is_mm {
            // For linux-mm, we prioritize specific branches: mm-new, mm-unstable, mm-stable
            // We use the discovered URL (likely akpm/mm)
            let mm_url = top_url;
            return vec![
                self.resolve_url(mm_url, Some("mm-new".to_string())),
                self.resolve_url(mm_url, Some("mm-unstable".to_string())),
                self.resolve_url(mm_url, Some("mm-stable".to_string())),
            ];
        }
</snip>

> 
> Phillip
>   >>
> > > Thanks,
> > > 
> > 
> s
> 

[0] https://github.com/sashiko-dev/sashiko/pull/398/changes

Cheers,

-- 
Derek <debarbos@redhat.com>

