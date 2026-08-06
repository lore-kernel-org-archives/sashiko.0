Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E26938DC53
	for <sashiko@lists.linux.dev>; Thu,  6 Aug 2026 17:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786037898; cv=none; b=Z/hwMoYjkJlbGCFObR7vjuw6CrsLaF4La/Pl7ADbgmlr2Pez1xiYERltIJLjGzIi1lwducLGEMPQrLeF91V6SOOdnR6NudhjpRkpkQYWYzCOYCYETK0+3+KVPVowd6RGCtmqfS4IUj7eoV8Ji1LGxNve1/WAEJ1JBKaQdhsgoJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786037898; c=relaxed/simple;
	bh=r8Wke+nIuewtjOPNlX6rjOrjAObiuYfSC7GYcoX6VZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=UJKxDKFivNQ/jVq3CzGFz6IoSM5lvFawJyS20Rf6711H/tg68rJmbCUnNXdeRkVyJR71wSTtFt+TSYMyxrtS6VxeLtgEtQ+SFy8ELV25xz8KzhB1KID1TgT1xyYRtyG98i5kcpofZOO/Sj6y2wrSUhM8ROz9AI+1QhMikgfI8yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T9qBatu6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T9qBatu6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786037895;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=amk8U5mvp5bVvBAZCycLFwjLgJxfluJFW068g8uYBEU=;
	b=T9qBatu67YOVMVmI8hZqKohV/7wc61nbthoU5NRDVqN8luO9HJQ3JuVBdqOkK6mDuQwSPY
	z/EIj0hCJD67Lb4hhxiSC2A2ROaJiyU4t66eCLOtF6FHISCPWELp88IJo0yygkwpT4T1Xz
	tM7MHP8dZ1mDq4V5wI9AUYFd5/qlcVY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-295-KUf1RFV2PrSGc7MnuiTQ0g-1; Thu,
 06 Aug 2026 13:38:13 -0400
X-MC-Unique: KUf1RFV2PrSGc7MnuiTQ0g-1
X-Mimecast-MFC-AGG-ID: KUf1RFV2PrSGc7MnuiTQ0g_1786037892
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 78D741800145;
	Thu,  6 Aug 2026 17:38:12 +0000 (UTC)
Received: from localhost (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1095B1956094;
	Thu,  6 Aug 2026 17:38:11 +0000 (UTC)
Date: Thu, 6 Aug 2026 13:38:11 -0400
From: Derek Barbosa <debarbos@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Phillip Lougher <phillip@squashfs.org.uk>, sashiko@lists.linux.dev
Subject: Re: [PATCH v2] Squashfs: check block offset is not negative
Message-ID: <anTE5KIMbd8UMOcE@debarbos-thinkpadt14gen5.rmtusma.csb>
Reply-To: debarbos@redhat.com
References: <20260805175900.600140-1-phillip@squashfs.org.uk>
 <20260805111526.18fad215e3bb29a254814256@linux-foundation.org>
 <23ad1c7b-8b9c-4f81-ba17-129ae787ba40@squashfs.org.uk>
 <20260805184822.36433a12a7c0df21e5d49874@linux-foundation.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260805184822.36433a12a7c0df21e5d49874@linux-foundation.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: urJJdR6RpRyR_pHTRFra8GOWoelteIZI0lzb6cLxtKY_1786037892
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Aug 05, 2026 at 06:48:22PM -0700, Andrew Morton wrote:
> > >> To trigger this out of bounds access requires a crafted Squashfs
> > >> filesystem and CAP_SYS_ADMIN to mount it.  Unprivileged users will not
> > >> be able to mount such a filesystem, but once mounted, an unprivileged
> > >> user can trigger the out of bounds access by reading the crafted file
> > >> with the negative offset.
> > > 
> > > AI review thinks we might have an information leak in there:
> > > 	https://sashiko.dev/#/patchset/20260805175900.600140-1-phillip@squashfs.org.uk
> > 
> > Having done some more research, it looks like the AI is using an OLD kernel version
> > dating back to before 2018-08-01.
> 
> Thanks for looking into this.
> 
> I'd be surprised if this was the case, but what would I know?  Perhaps
> Sashiko trained itself on a seven year old kernel?
> 

There really isn't any training happening within Sashiko itself. Unless you
count the guidance/instructions located within the prompts (which are sync'd and
modified from Chris Mason's repo).

It's more likely that an incorrect baseline is being applied (noted in the
followup emails from Phillip in this thread).

> 
> I've been wondering about this.  What kernel versions does Sashiko
> attempt, and why?
> 
> I was recently surprised to see some MM report against the net/next
> branch!  I assume it found the patchset applied so off it went.
> 
> Can sashiko peeps please clarify?  What is the algorithm for trial
> applications?  What trees/branches does it attempt and in what order?
> 

src/baseline.rs are where baselines are defined, it is selected from
base commits, patch subject line, MAINTAINERS file, etc. There is a hardcoded
linux-next in there that the logic can "select" from, so to speak.

-- 
Derek <debarbos@redhat.com>

