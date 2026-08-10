Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABABE3C37B3
	for <sashiko@lists.linux.dev>; Mon, 10 Aug 2026 11:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362652; cv=none; b=TUN7KTPEUywBiLcEPs6R8QsDYiagoBYI5TY2KK8RVkWdsJE7sSe/ptWdD4FJxtpi3+Pj0VPqF/mWOaNmeuZEoZeFhpTartv2r7iLNXR0756Y/1feoSSNCUjBT1KE1pp4gmGWKIFwaZp4KlFGX1ftCCi3ynxjauWD1S71zgu0XW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362652; c=relaxed/simple;
	bh=3Iw6+sQiZq+iA1knDtI9Tdgc8X3HrDJsRxLsNULZ6uA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=qJWK+qRW2Rlj6U3RXIKE/olj3hwQ9N6tbcpff77ivNUd+1RGgtXOSFdoRelMQtT0zObM/lbQNRJ8FMTa+OiHKDjf7EOGNPAomG6ZB5uUBcSj6E6eH6I5+q6L1E4I8ka+QGuAwVPRjaOkdgrjVi48adeHtLLWyjOyic5bkyAOdow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TDlno9OM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TDlno9OM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786362649;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=AP9Y4DDSCReluUWRtTZJyxoBYW0umKNm4+IlsTot8vo=;
	b=TDlno9OMwJd0gRICWoWSFUIAgC1KsK09wY/iv4BO95z3yNud2Iz9bMMFYvkjTmbGk8NtDb
	Nq8RRb28iMUNrPPwob5fKhoKUHjh+V7obxOo9o98V64hNz6m08urckqVsQdbV6s18BKmIf
	IBbJ42RaSaAcE3peBR43GzXaM6NcTtU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-513-4ARAJlWwPYim550OBOE6jg-1; Mon,
 10 Aug 2026 07:50:46 -0400
X-MC-Unique: 4ARAJlWwPYim550OBOE6jg-1
X-Mimecast-MFC-AGG-ID: 4ARAJlWwPYim550OBOE6jg_1786362645
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C8A321956080;
	Mon, 10 Aug 2026 11:50:44 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 07C81422;
	Mon, 10 Aug 2026 11:50:43 +0000 (UTC)
Date: Mon, 10 Aug 2026 07:50:39 -0400
From: Derek Barbosa <debarbos@redhat.com>
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, sashiko@lists.linux.dev, 
	Roman Gushchin <roman.gushchin@linux.dev>, Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: linux-integrity@vger.kernel.org
Message-ID: <anm65Q01HoJCv9d8@debarbos-thinkpadt14gen5.rmtusma.csb>
Reply-To: debarbos@redhat.com
References: <a517e05580a5f2c0d1db874aa2e9e4fd41bdc564.camel@linux.ibm.com>
 <amNlJJELzzT8tPkG@debarbos-thinkpadt14gen5.rmtusma.csb>
 <amQXY9PhaZGIQVow@kernel.org>
 <8748b85855de93d307e1a6715336de860cbbfeda.camel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <8748b85855de93d307e1a6715336de860cbbfeda.camel@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XBGEcGw7uantvJ91ygNkjYQVG4YzlqqTkf5F3pb3-gg_1786362645
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Aug 03, 2026 at 08:41:10AM -0400, Mimi Zohar wrote:
> On Sat, 2026-07-25 at 04:54 +0300, Jarkko Sakkinen wrote:
> > On Fri, Jul 24, 2026 at 09:16:53AM -0400, Derek Barbosa wrote:
> > > Hi,
> > > 
> > > On Fri, Jul 24, 2026 at 06:44:56AM -0400, Mimi Zohar wrote:
> > > > Hi Roman,
> > > > 
> > > > Please add the linux-integrity@vger.kernel.org mailing list.
> > > > 
> > > > Mimi
> > > > 
> > > 
> > > See [0] -- Roman is out, so it may be a while until it is enabled.
> > > 
> > > 
> > > Cheers,
> > > 
> > > [0] https://github.com/sashiko-dev/sashiko/pull/371
> > > 
> > > -- 
> > > Derek <debarbos@redhat.com>
> > > 
> > 
> > In the meanwhile, what does it mean in practice, when it is enabled?
> > 
> > Just catching up with the topic...
> 
> For now, we're just requesting that Sashiko be enabled for the linux-integrity
> mailing.  Sashiko's review results will be published on https://sashiko.dev/.
> 
> Mimi
> 

I forgot to ask -- would you like for the Sashiko bot to reply to patch authors
on the mailing list?

Cheers,

-- 
Derek <debarbos@redhat.com>

