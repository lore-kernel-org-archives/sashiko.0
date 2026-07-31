Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB923EFD30
	for <sashiko@lists.linux.dev>; Fri, 31 Jul 2026 12:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785501740; cv=none; b=gEpbvPuT36K5QjeRbFxTzUaV80sjmnXHjy47m/8A9NnhuOnTod79c1Qx7hpBND0gl+2pXVkBxOhZQW6LJhOxZojqCGVusFEkrg5ntOPSwMFvub8EyQnJ59ITUb+EzrW0myyxQRCLK2gCS8b11Nu1DNeMbLYhimGljYLVo+1dP2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785501740; c=relaxed/simple;
	bh=KYLWvEq5IjDRFb0pvy3DkoJKLlJDc9u9rUOoHDdHa64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=lTqnaak72FF5EFk2LzeXTn46HTzC8aaJfgUvds56jWM3C/o5A36Spmg/gIUaU4qJs89uw39KvH1UNq+L/vlo6mq9nmV8DXScaz9bEF29S7lpIjEKjm3WU+tDXTinCofYoIGTXRXaZxj1u2kQEPMnGXZJ1XzdiB+97gqn19vuIGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cAPGcC3i; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cAPGcC3i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785501737;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=HdszRvqtqnahy0yGPysz211kBk4UfIkZTFYB3MZ6Y5I=;
	b=cAPGcC3iTkvZlwMBDob1xTI2pEeLMAm2FS+uUxaIlASGZMCUuiE1bL4/k6kehS+Iua9LaV
	srd86A/ketgRKtI4Rt8DkfvuCG4GJ7mdIH38iXEe84TBsscuxf51NWj8M/sAWjOWaMk9iX
	kDztAg6uyQ0dwsvMzUDLjMOQlFQUf+s=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-283-wMrZNxKJPYuvxFSHpDRBpA-1; Fri,
 31 Jul 2026 08:42:13 -0400
X-MC-Unique: wMrZNxKJPYuvxFSHpDRBpA-1
X-Mimecast-MFC-AGG-ID: wMrZNxKJPYuvxFSHpDRBpA_1785501732
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C6387180057C;
	Fri, 31 Jul 2026 12:42:11 +0000 (UTC)
Received: from localhost (unknown [10.22.64.143])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 517D31956089;
	Fri, 31 Jul 2026 12:42:11 +0000 (UTC)
Date: Fri, 31 Jul 2026 08:42:10 -0400
From: Derek Barbosa <debarbos@redhat.com>
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, sashiko@lists.linux.dev
Subject: Re: [PATCH] email: add Christian Borntraeger as cc for s390
Message-ID: <amyX26L0KIXR2WAu@debarbos-thinkpadt14gen5.rmtusma.csb>
Reply-To: debarbos@redhat.com
References: <20260730144458.286663-1-borntraeger@linux.ibm.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260730144458.286663-1-borntraeger@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N82B76TJaadkd1PeqTbF73yAvJVXueuOSqPg0QkCAok_1785501732
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Jul 30, 2026 at 04:44:58PM +0200, Christian Borntraeger wrote:
> I am a reviewer for s390 and want to see sashiko review.
> 
> Signed-off-by: Christian Borntraeger <borntraeger@linux.ibm.com>
> ---
>  sashiko.dev/email_policy.toml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/sashiko.dev/email_policy.toml b/sashiko.dev/email_policy.toml
> index 26a6665..7e32532 100644
> --- a/sashiko.dev/email_policy.toml
> +++ b/sashiko.dev/email_policy.toml
> @@ -236,7 +236,11 @@ cc = ["linux-target@vger.kernel.org"]
>  lists = ["linux-s390@vger.kernel.org"]
>  reply_to_author = true
>  send_positive_review = true
> -cc = ["linux-s390@vger.kernel.org", "Heiko Carstens <hca@linux.ibm.com>", "Vasily Gorbik <gor@linux.ibm.com>", "Alexander Gordeev <agordeev@linux.ibm.com>"]
> +cc = ["linux-s390@vger.kernel.org",
> +      "Heiko Carstens <hca@linux.ibm.com>",
> +      "Vasily Gorbik <gor@linux.ibm.com>",
> +      "Alexander Gordeev <agordeev@linux.ibm.com>",
> +      "Christian Borntraeger <borntraeger@linux.ibm.vom>"]
>  
>  [subsystems.kvmarm]
>  lists = ["kvmarm@lists.linux.dev"]
> -- 
> 2.55.0
> 
> 

Please see [0]. Roman should be able to merge it once he returns from his leave.

[0] https://github.com/sashiko-dev/sashiko/pull/386

-- 
Derek <debarbos@redhat.com>

