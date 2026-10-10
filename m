Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734C032B130
	for <sashiko@lists.linux.dev>; Sat, 10 Oct 2026 22:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791669991; cv=none; b=inleX7m7rmtn2UZ4EgkftSnCeYBOg75OHe4Pw1YMU70N30sO8UQsn/oof0tJ7z4mQV5FWBfPPG/sNflWfVqGj8/KVBSKlNFVZUFov7uR8iPZo8cn/O7ltdMd5byH0KSCi19DPzSROQcAxxSuykF/88tsdAdjkND6r8msOUFz+X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791669991; c=relaxed/simple;
	bh=EgN5JOe63KLZs2JDwC1MEA4v8sFf2xMT1OQLx38n3v8=;
	h=Date:From:To:Subject:Message-Id:Mime-Version:Content-Type; b=j2EkkwaFk8mUGr6+QkW3TsswB5S5khRt0XOCHbOHeyws6WugeD/gwJlUKjimmeSdoDPgEWDLlT9eQCSIdMmSV19lkjfRAfNqmY5SMYu6X3PROuGChC1N/pZ14QBt9YpPWo038aaxIMjt95zXsLWkJIgBsqmzwX/f1P4NhgGPkog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=EqakYhFK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EqakYhFK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D83A61F000FF
	for <sashiko@lists.linux.dev>; Sat, 10 Oct 2026 22:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1791669989;
	bh=OwO1yDTUeATaLrk/xF60TinakRP1+AAEQ99AxEuTM/4=;
	h=Date:From:To:Subject;
	b=EqakYhFKr428t1zvf5BmyRhk4cPM/qhboi5pIJEwazIfVySUAqNi9edlbOKXqUlI5
	 zXDgFOXonF67R7+z/XrVIvQ9NRC0EZ+w0Zqp/3kVYUNMOZYwQOAFgzrQkz5cJOVrSr
	 yL3Znt+Guio9zUB1NrP/StSbZYjjh/3fgqfCQIaM=
Date: Sat, 10 Oct 2026 15:06:29 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: sashiko@lists.linux.dev
Subject: email handling
Message-Id: <20261010150629.0c00e0a4282eac9aa247cca3@linux-foundation.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Concerning this email:
	https://lore.kernel.org/20261009-b4-mmap-prepare-vma-flag-sanify-v5-16-923b70125b1e@kernel.org

I discovered that some lucky duckies were receiving Sashiko emails:

Subject: Re: [PATCH v5 16/38] mm/vma: add and use
 vma_[flags]_is_fixed_mapping
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TG9yZW56byBTdG9ha2VzIChBUk0p?= <ljs@kernel.org>
Cc: linux-trace-kernel@vger.kernel.org, kvmarm@lists.linux.dev, "Vasily
 Gorbik" <gor@linux.ibm.com>, "Oliver Upton" <oupton@kernel.org>, "Heiko
 Carstens" <hca@linux.ibm.com>, linux-perf-users@vger.kernel.org, "Marc
 Zyngier" <maz@kernel.org>, "Alexander Gordeev" <agordeev@linux.ibm.com>, linux-scsi@vger.kernel.org, selinux@vger.kernel.org, "Christian
 Borntraeger" <borntraeger@linux.ibm.com>, bpf@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, kvm@vger.kernel.org, linux-s390@vger.kernel.org, linux-usb@vger.kernel.org
In-Reply-To: <20261009-b4-mmap-prepare-vma-flag-sanify-v5-16-923b70125b1e@kernel.org>
References: <20261009-b4-mmap-prepare-vma-flag-sanify-v5-0-923b70125b1e@kernel.org>
 <20261009-b4-mmap-prepare-vma-flag-sanify-v5-16-923b70125b1e@kernel.org>



But I did not.  How come?  I was on the To: line so why were certain
people emailed but not me?

I'd prefer to receive such replies.

Thanks.
