Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A7930675C
	for <sashiko@lists.linux.dev>; Fri, 24 Jul 2026 13:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784899038; cv=none; b=HqfGB5mrfyeR22i+TUdV60O+ZJ3lzbePKSL7uLODJJ4Uo2uFXSD+Of0irdJ1+knBu8X3+3eDA2XybE8q0DsGz1+7EJUz9Yshr2mkmKDd/p5xFW8yWJdJ4C3TpemSab4W4eNWdQwm46425g0lKywnudr6BnTz3fLBn1gbmnP4ao4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784899038; c=relaxed/simple;
	bh=f1IHujmpDDkRFYyZMLT5kHklpYZ0QrOESt6a9Q4GPxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=gn8lnxqgbXdDYI2ylYmxCvCIpwfSVsEX57r9GnBGflCmcRusZki+doutA+tXNie6inMvpalIzaohLMwYq9/Ho5ojHCA4Mn5bGglXUl8yAmZIK0IgAr8jzjbHKhQF5NvprmrrwCSS3p+w5UJK5MZSN/haPrbusNS76vQVfxgJLtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NxmH5N/N; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NxmH5N/N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784899020;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=n1M8OIlP5u69SsnDJmaOAaM6uS/n84lR00MMhD/pNag=;
	b=NxmH5N/NEPKLZ0lBaN+VJg7er8mEpKN1fMJdFE1IzkK2Yf2WzUQDygvqY660NVOo/2xeuJ
	xSHv4iINi1H1ALBWTyZyDvSjChFZ3ue2Wffdh47pmZyacmAiWLUmdhruvLJ3kJ8sW53OsJ
	tzbzYxVA1UvnUESl4uSp5s/KEOY25Vg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-378-uBPtc5CJOnmZ7xyfXPHBTQ-1; Fri,
 24 Jul 2026 09:16:56 -0400
X-MC-Unique: uBPtc5CJOnmZ7xyfXPHBTQ-1
X-Mimecast-MFC-AGG-ID: uBPtc5CJOnmZ7xyfXPHBTQ_1784899015
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C4EA71955D57;
	Fri, 24 Jul 2026 13:16:54 +0000 (UTC)
Received: from localhost (unknown [10.22.89.12])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EBF4F30002DE;
	Fri, 24 Jul 2026 13:16:53 +0000 (UTC)
Date: Fri, 24 Jul 2026 09:16:53 -0400
From: Derek Barbosa <debarbos@redhat.com>
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: sashiko@lists.linux.dev, Roman Gushchin <roman.gushchin@linux.dev>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: linux-integrity@vger.kernel.org
Message-ID: <amNlJJELzzT8tPkG@debarbos-thinkpadt14gen5.rmtusma.csb>
Reply-To: debarbos@redhat.com
References: <a517e05580a5f2c0d1db874aa2e9e4fd41bdc564.camel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <a517e05580a5f2c0d1db874aa2e9e4fd41bdc564.camel@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: I3eMIb6NGRHVxSfBgcH7kBtsYEKzE5UYP8dbreR4bSM_1784899015
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Jul 24, 2026 at 06:44:56AM -0400, Mimi Zohar wrote:
> Hi Roman,
> 
> Please add the linux-integrity@vger.kernel.org mailing list.
> 
> Mimi
> 

See [0] -- Roman is out, so it may be a while until it is enabled.


Cheers,

[0] https://github.com/sashiko-dev/sashiko/pull/371

-- 
Derek <debarbos@redhat.com>

