Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B2936F433
	for <sashiko@lists.linux.dev>; Mon, 11 May 2026 12:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503186; cv=none; b=HG+TT/hZdgPPtEIyS4W0lYA4cQfqKeCM/X40xu/UFBs+dtVCEe2worPIOLaoNxUFSX+pVZ6m+4Jvk4scCWF3idJ966lf8fYNuZ6ATZghgLDYtx/sa0Kcs1eZ3a6ce023nkIRGd1f4bNzylfKR2aRZDGvZUN7UUK+dD/DpjAO/yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503186; c=relaxed/simple;
	bh=UFxhVuW7PktYl7Z4nHne1a/r2at4I42QxVrHucXXlFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=c5UU+36ETubIENQgXpXTmTU65kLQg+7k2xyQi1QafdoOOSS8118WRlHCBHK9t+5r+ecsqMwlqiH3ZZ2uqMMg632zq0ky7KQ4Nb21o9978akNjQpsLnYJL1KS7O3/SlLfk4neJK11C8dBqxorDb2+fSC/LjoL4qfa6ZXz5n/nnYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=evA/8rqE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="evA/8rqE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778503184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W+uzeB2TWyHqeVEg3gXTWX+TcZGf/bfhh/rl7wHhoBc=;
	b=evA/8rqEENIn1Q2SBv/E1px5xsbqDTwF4sfWPGPQNmJQ5B0MihkXiwLG/EvwxsU53j0HR6
	ueOvdgMa8sFCbYOvycyHydMjM3ti/tyvu2AnFcIWrCKKahYPVsZcPGc700KpM83LoJVr7N
	ABPfOq/zYhbcEWBdYrZ+V+tqAD5hKgQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-382-xmsCzfSUNRe6Uy79AIozUA-1; Mon,
 11 May 2026 08:39:40 -0400
X-MC-Unique: xmsCzfSUNRe6Uy79AIozUA-1
X-Mimecast-MFC-AGG-ID: xmsCzfSUNRe6Uy79AIozUA_1778503179
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 52552195609F;
	Mon, 11 May 2026 12:39:39 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.32.142])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9ADBD18004A3;
	Mon, 11 May 2026 12:39:37 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: sashiko-bot@kernel.org
Cc: jtornosm@redhat.com,
	linux-pci@vger.kernel.org,
	sashiko@lists.linux.dev
Subject: Re: [PATCH v2] PCI: Disable broken FLR on MediaTek MT7925
Date: Mon, 11 May 2026 14:39:36 +0200
Message-ID: <20260511123936.36054-1-jtornosm@redhat.com>
In-Reply-To: <20260508212208.2544FC2BCB0@smtp.kernel.org>
References: <20260508212208.2544FC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: hIHwX6jdSv7gWKNK8a8z6JB6mRgR2vQ00HMKGStrEo0_1778503179
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

While device ID 0x0717 is in the same MT7925 family and shares driver code,
I don't have hardware with that device ID to test whether it exhibits the
same broken FLR behavior.                                                                                                                                                                          

I prefer to be conservative and only add quirks for hardware that's been
tested and confirmed to need them. If users report the same VFIO passthrough
issue with 0x0717, it can be added in a follow-up patch.

