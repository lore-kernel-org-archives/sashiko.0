Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAE14343E4
	for <sashiko@lists.linux.dev>; Fri, 31 Jul 2026 15:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785510184; cv=none; b=lPiRcUy/KZ/Hx0lZWrs/4okW+oxiv84RMUHAAu3hc2qetP8Ms+X53mVZrahz1xErT2FQMRvsXq8lvgLbQAL4MsTiLwT2B4tDfBcJ0wAwMV8GI/IA2dUonp0QtapWFnEYB/HYybWLE9ScKtRzVEPFanxDzlM1lTGejRA3tvnwras=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785510184; c=relaxed/simple;
	bh=S9FDqUPFQeYo0H94bXNsjIoUP0v+Rtm2f6ModFlBTvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=YRNjorlwLXXIpuTuy8q94z6I85WcRVzeGgOcut8s6EGPmVhOd7j2e4lYkOczeuuLfWqIA3Am5VYsawu8+I5P7aOhMWqjJw2CJ4ExyKNSMXVMp7P8U/3/WZyMhuuZw5Sg+igtofERtCGWEiKCKc1sUanoM6pBwlGfGC7HVz8OF4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LiBCq1fO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LiBCq1fO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785510182;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=ixpsv/53n+PUSGN24hukRVHTDjiUhkSowUwKrrDvIh0=;
	b=LiBCq1fOOlDf4mrNe1qVEjKuigrXhKS8CgzZqdiFZ6f8SkhTn5SJlg42K7yErkmg6FiPU3
	dYZkN5eybSbEUyJoYsvYWAxECUAGMU47GkUOZe8Mmv9t828UhAH2tPU4o60846sQVYmL8B
	KMnTimo8cHqXu1K35Ut43W41JFjCsLQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-204-ibu3DdtmOemg4u2WEo6yiw-1; Fri,
 31 Jul 2026 11:02:58 -0400
X-MC-Unique: ibu3DdtmOemg4u2WEo6yiw-1
X-Mimecast-MFC-AGG-ID: ibu3DdtmOemg4u2WEo6yiw_1785510178
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C12051956043;
	Fri, 31 Jul 2026 15:02:57 +0000 (UTC)
Received: from localhost (unknown [10.22.64.143])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 604E230002E9;
	Fri, 31 Jul 2026 15:02:57 +0000 (UTC)
Date: Fri, 31 Jul 2026 11:02:51 -0400
From: Derek Barbosa <debarbos@redhat.com>
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: sashiko@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Subject: Re: cover letter not considered Fwd: [GIT PULL 0/7] KVM: s390: Fixes
 for 7.2
Message-ID: <amy0kq7Dh2TzsWlj@debarbos-thinkpadt14gen5.rmtusma.csb>
Reply-To: debarbos@redhat.com
References: <20260727095720.9150-1-borntraeger@linux.ibm.com>
 <dd8d55fa-a42d-4f02-89dd-7eb6c587da69@linux.ibm.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <dd8d55fa-a42d-4f02-89dd-7eb6c587da69@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vomlxsgruwDeyj5YkmgKHFX4lgg_FavuuKSu7RabwtM_1785510178
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christian, sorry for the delay

On Thu, Jul 30, 2026 at 06:42:10PM +0200, Christian Borntraeger wrote:
> Folks,
> 
> I am a bit puzzled. Looking at https://sashiko.dev/#/?list=org.kernel.vger.linux-s390
> I do see  1,2,3,4,5,6,7 but not 0 for the PULL request above
>  Clicking on on of those mails then also has the 0 mail so its there
> https://sashiko.dev/#/patchset/20260727095720.9150-2-borntraeger%40linux.ibm.com
> 
> but during review this seems to have been lost. This is unfortunate as the cover letter might
> help to find the right tree and with 3 failed applies several already fixed
> things (in those 3 patches) are reported instead.

IIUC in the current code, cover letters are not considered patches in
the DB and therfore do not get forwarded to the reviewer processes.

I have been working on improving the concept of a "patch series summary" that
propagates a small snippet of "context" to all reviewer threads. Currently, the
individual worker threads only get a range from base..HEAD and use git log
--format=%s to get insight into other patches in a series.

So the cover letter never really makes it's way into the "working context" of a
single worker in isolation.

Is your concern not being able to quickly view the '0'-indexed mail? or that it
may help with review accuracy if it were to make it's way into the review
process?


Cheers,
-- 
Derek <debarbos@redhat.com>

