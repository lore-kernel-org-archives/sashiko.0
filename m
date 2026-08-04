Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA7F4BCAD5
	for <sashiko@lists.linux.dev>; Tue,  4 Aug 2026 20:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785873704; cv=none; b=Xh7m6K3VwDaoJ/vp5nkReo3CbMRVhkStOSy+RUcdiigTp96YCDkewWkhSuB4Xwt5+lXQ5LAYirYxI7IdyLMgXmbgT/1yQYIEmKkAxe1DFlcHix1dNKbme5+9I79/mxM0RTl3O5UXSbikZI1AmxQN0azJYxD1sLuyaDq/rUa+eaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785873704; c=relaxed/simple;
	bh=UkvzXTayA1fUriAfQxo/16fMOb0xVgxC0tCwLcXDecc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=N9w4eR8YRz/FlPbjx5nLOG6r17OO9LdEDQltUli+oyc26uqityDVL4UbeqHXeU0eFa91zebDNvvgfjD5wi6TVSi9abb8pI2EstKlP4dAebaiJHME27yECBbFIZiHe4I28DOcMfQT8MeOslZ3ZPw83dfgUCvC1hz1ULVep/ECRRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fhjVOUn4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fhjVOUn4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785873701;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=r2Mgmz7tVv8pB4yDoUMQJeieQZPseAyF7+rOAXGXrM8=;
	b=fhjVOUn4wXAeOCydPuDz6LBicprT0nC1m/sEuiT1rH1ATBWEmyn6u0+/JCpKtM5NoNZn8k
	+aWIxu1C4ZS/FKWZ/B1pf+kXzlPuYGJhw6dO+eXm2pBir5/MDdAos3UxiUEpfUFjpqSZLa
	9Po4Jb4jqvResUml0orrYqWOZ6QZQBk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-279-fWeqZqD0N56WB9O6yYQYhg-1; Tue,
 04 Aug 2026 16:01:37 -0400
X-MC-Unique: fWeqZqD0N56WB9O6yYQYhg-1
X-Mimecast-MFC-AGG-ID: fWeqZqD0N56WB9O6yYQYhg_1785873696
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 53554195608B;
	Tue,  4 Aug 2026 20:01:36 +0000 (UTC)
Received: from localhost (unknown [10.22.81.210])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CDCD91956087;
	Tue,  4 Aug 2026 20:01:35 +0000 (UTC)
Date: Tue, 4 Aug 2026 16:01:35 -0400
From: Derek Barbosa <debarbos@redhat.com>
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: sashiko@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Subject: Re: cover letter not considered Fwd: [GIT PULL 0/7] KVM: s390: Fixes
 for 7.2
Message-ID: <anJENHD-1EVDb-u9@debarbos-thinkpadt14gen5.rmtusma.csb>
Reply-To: debarbos@redhat.com
References: <20260727095720.9150-1-borntraeger@linux.ibm.com>
 <dd8d55fa-a42d-4f02-89dd-7eb6c587da69@linux.ibm.com>
 <amy0kq7Dh2TzsWlj@debarbos-thinkpadt14gen5.rmtusma.csb>
 <ed23ce9e-2cdd-472a-85e4-c0cdf81359b9@linux.ibm.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ed23ce9e-2cdd-472a-85e4-c0cdf81359b9@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Sl60mYJTv190Mxehc0Y3_-I99LF1OQC2Aw0kY0xUGFY_1785873696
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 03, 2026 at 09:34:37AM +0200, Christian Borntraeger wrote:
> Am 31.07.26 um 17:02 schrieb Derek Barbosa:
> > Hi Christian, sorry for the delay
> > 
> > On Thu, Jul 30, 2026 at 06:42:10PM +0200, Christian Borntraeger wrote:
> > > Folks,
> > > 
> > > I am a bit puzzled. Looking at https://sashiko.dev/#/?list=org.kernel.vger.linux-s390
> > > I do see  1,2,3,4,5,6,7 but not 0 for the PULL request above
> > >   Clicking on on of those mails then also has the 0 mail so its there
> > > https://sashiko.dev/#/patchset/20260727095720.9150-2-borntraeger%40linux.ibm.com
> > > 
> > > but during review this seems to have been lost. This is unfortunate as the cover letter might
> > > help to find the right tree and with 3 failed applies several already fixed
> > > things (in those 3 patches) are reported instead.
> > 
> > IIUC in the current code, cover letters are not considered patches in
> > the DB and therfore do not get forwarded to the reviewer processes.
> > 
> > I have been working on improving the concept of a "patch series summary" that
> > propagates a small snippet of "context" to all reviewer threads. Currently, the
> > individual worker threads only get a range from base..HEAD and use git log
> > --format=%s to get insight into other patches in a series.
> > 
> > So the cover letter never really makes it's way into the "working context" of a
> > single worker in isolation.
> > 
> > Is your concern not being able to quickly view the '0'-indexed mail? or that it
> > may help with review accuracy if it were to make it's way into the review
> > process?
> My concern is more that we get reports about issues that are fixed in a subsequent patch.

Got it. I've had something sitting on a local branch for some time. I will see
if I can push it up when Roman returns. [0]

> But maybe this is just due to random email delay that sashiko receives some mails later?
> Maybe we could delay review for 5 minutes or so if this seems to be part of a series.
> But I think we already detect that?
> 
I don't think that is the issue. I could be wrong.

[0] https://github.com/sashiko-dev/sashiko/issues/392

-- 
Derek <debarbos@redhat.com>

