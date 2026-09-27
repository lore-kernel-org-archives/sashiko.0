Received: from mta1.migadu.com (out-162.mta1.migadu.com [95.215.58.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D102A1BF
	for <sashiko@lists.linux.dev>; Sun, 27 Sep 2026 08:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790498547; cv=none; b=bLjfyypdyFwhVbfJ+NBgim0E1CStDXODP9h0WMGczN4lMDylrotJ/fPQtXBQSxDvA+nATDxqBYbDuYyBDuCHso+3FPttWyycCX08fm0DGC1pc7cwyeMTYRGG8A/R9oV6QX6xpvfhv4ExMtLG3uMkHl8VoNtxZjHEQufoKKVk1bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790498547; c=relaxed/simple;
	bh=wUQZoGQI4RzZjIJUMRCSeFrZr4+/58bt0XkRJ388I3A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VUgBOx+I8bH714QEF6ZAK+INmLhjqSWV59Bcyt26v1eGuqLP4kvzQ6MM4ZrC7HevlWWYI6ffCsjbQBoC7XzxScCiLzIfb99mwhz4dIPtPvbyU4cE5EsCdxfFweNlNB5qpKx+FnE41nXopXijPvdUB6FwpmfC6BDK1XKlylj4QUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=V28z2YxD; arc=none smtp.client-ip=95.215.58.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="V28z2YxD"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=wUQZoGQI4RzZjIJUMRCSeFrZr4+/58bt0XkRJ388I3A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790498543; v=1; x=1791103343;
 b=V28z2YxD95RTga8TmLQwxFhstKLTI+LDMijSX+8NtjeFekSZFOmcNP+sEmiwqRmJw/6EML1E
 /CKhZXX2bHJS3C1jFZBxr6gA+7AFwJE2zFBtS/h4E72xb84x6aHhuw31YhOO2tepsnVr1+7MJnz
 BI/H++XZmIuXw8+p2PJB5hpw=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta11.migadu.com with ESMTPS id a11b3b16b19d0300;
	Sun, 27 Sep 2026 08:42:23 +0000
X-Mizu-Trace-ID: a11b3b16b19d0300
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: sashiko@lists.linux.dev
Subject: Re: Tracking request for linux-pm and linux-acpi
In-Reply-To: <CAJZ5v0iX2BkHujsyCHEeLQ44d-ZDvQ_dcwhrhOQ=u-5+6sZd-g@mail.gmail.com>
	(Rafael J. Wysocki's message of "Fri, 25 Sep 2026 21:09:52 +0200")
References: <CAJZ5v0iX2BkHujsyCHEeLQ44d-ZDvQ_dcwhrhOQ=u-5+6sZd-g@mail.gmail.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Sun, 27 Sep 2026 08:42:19 +0000
Message-ID: <7ia4pkxz13x0.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Rafael J. Wysocki (Intel)" <rafael@kernel.org> writes:

> Hi,
>
> I would like Sashiko to track the linux-pm@vger.kernel.org and
> linux-acpi@vger.kernel.org mailing lists that are both archived on
> Lore.

Hi Rafael!

Added.

Thanks,
Roman
