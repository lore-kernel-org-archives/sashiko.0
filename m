Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB57C47F786
	for <sashiko@lists.linux.dev>; Fri,  2 Oct 2026 10:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936961; cv=none; b=UlWpJqUcPUskrxLpR1NuTaRiPhGx0UvlHgkryQzqbFh3Oy+IGmluLGFa3CJj8/zDNL8f8SmQ2+PtLdvf9QrGPIxjEXBVQgJK81eYkccPn/tBkheoyB8UO25Y0qeGTXyeYrXuR4hYZbRe0vFuqJGxq27auwV90tsz4Q0aqJgknQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936961; c=relaxed/simple;
	bh=pdhE/7hSXG7gDMAiHDoyRLcOF8GDqsaE5N1g7zitizk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=K4FS6+ia54CM6IrGp2YM+tvR5f8nfYH6UkBzTMa9B6BkAQnnq23AKEZHJwKBrWaNcYxojfOU6IHPAMwLHb7azTdO5cWdZ9iLemQPqQ1m1+bEsMfGfUyGnRVDWi86tyO0+dAE31bV/FCvcJbOJOuAneLpfdz6x2dNP/XyR8iU/Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OzMnCQ5+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OzMnCQ5+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790936958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+7vm0VnUyXAkUBY6qk91+3AJ2QcRdB2gKqGop2g4dtk=;
	b=OzMnCQ5+Is0n+nxQuTf4c0dPR9eJPbP+f0wLwOr24Qhsq3yk0ZyZssBfr8w5H1LMKq1Sav
	1prErmiyz4buBDG2IC1ZGqY2yCRDrWBkQv7CCPGE0fy3x9jvIl553bWkXYxWAZO/oPSTpC
	ox9RMmr5EC7KR9SUjXtkO8oyYUypezQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-207-O7rEFQfWON63vohYpPicGA-1; Fri,
 02 Oct 2026 06:29:13 -0400
X-MC-Unique: O7rEFQfWON63vohYpPicGA-1
X-Mimecast-MFC-AGG-ID: O7rEFQfWON63vohYpPicGA_1790936952
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 287F21809C8F;
	Fri,  2 Oct 2026 10:29:12 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 857481956095;
	Fri,  2 Oct 2026 10:29:10 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Fri,  2 Oct 2026 12:29:11 +0200 (CEST)
Date: Fri, 2 Oct 2026 12:29:09 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: Matthieu Baerts <matttbe@kernel.org>, sashiko@lists.linux.dev,
	users@linux.kernel.org
Subject: Re: direct replies from sashiko
Message-ID: <ar-HdYtpdDzVLsqg@redhat.com>
References: <ar47HvytXrbOiwTO@example.org>
 <15f15153-d19e-4a3d-9d7b-847109ebb96f@kernel.org>
 <ar98N7kvFD7Qxi0K@example.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ar98N7kvFD7Qxi0K@example.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ccwYbinw6VoOQ4hWtjDKwKn2VnUeKmTiaPXkMTOQwQY_1790936952
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 10/02, Alexey Gladkov wrote:
>
> On Thu, Oct 01, 2026 at 04:56:50PM +0200, Matthieu Baerts wrote:
> > Hi Alexey,
> > 
> > (+cc Sashiko ML)
> > 
> > On 01/10/2026 12:51, Alexey Gladkov wrote:
> > > I noticed that sashiko-bot stopped sending me reports about its reviews.
> > > It was very convenient and meant I didn't have to keep checking
> > > https://sashiko.dev/. I thought it was just me, but Oleg Nesterov also
> > > told me that he doesn't receive those reports either.
> > 
> > Do you know when it stopped? It looks like there is some activities on
> > the 'sashiko-reviews' ML.
> 
> I don't send patches very often, so I can't say for sure.
> 
> Oleg, you're sending more patches. When did sashiko stop sending you
> reviews?

I've never received any emails from sashiko. Fortunately I can read the
reviews on sashiko.dev.

Oleg.

