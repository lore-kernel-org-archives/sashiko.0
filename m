Received: from mta1.migadu.com (out-168.mta1.migadu.com [95.215.58.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFE647C110
	for <sashiko@lists.linux.dev>; Tue, 13 Oct 2026 16:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791908389; cv=none; b=kETiR5iWfpWLHvFYIu301e3jaHptC2Am4JwHN3V1BZZWWc+b747J7ytdk6Hc2UJ7jyZDrmjnjAAJlv8T41jElhNDbzwL7kkQy5F32J9gAyUdBOS9wyQbO/BO0C0/0EhuIaTWzhHOkJmGUVWQJ1bV+pYhNdHxTV4/sSFxjOFIeqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791908389; c=relaxed/simple;
	bh=4r8WD9Tkt6gF1ZHxi6vwg42UwuKi6a4Jz/eNhzMJFVM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aZGNETtAtShtwMz+DrQ7WAl1Wwe9sdlvuISfgz6YXGDiAbhTRMcPdWil2dYGlnXmskvWYcGa1L3qTD+5SnwvLl3DRVJo+71mBiwmdqDKPH5o8lchU/4BZ89v5VvIk91iit8iYqTlmxoFcT0Zx44eNO5ssgWaj2ycjAeKenf8JRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lSfbWVVW; arc=none smtp.client-ip=95.215.58.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lSfbWVVW"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=4r8WD9Tkt6gF1ZHxi6vwg42UwuKi6a4Jz/eNhzMJFVM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791908384; v=1; x=1792513184;
 b=lSfbWVVWH8VOrMRX4+UAnGJ9nebAOe0zopUQkvhGBGE0VDq7NmhUxtekxdlsC25U3/Lug4jr
 PPXUk23XHmXsor0yAqVQHgOoQSKtAwtQYZTZXA74P1btEEBX3s3eXtNX82rwL2tPXB7qF2mv/my
 6Je63d7iNkBTfNx0z80bddiw=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id e8501024ca6edd54;
	Tue, 13 Oct 2026 16:19:44 +0000
X-Mizu-Trace-ID: e8501024ca6edd54
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Keith Busch <kbusch@kernel.org>
Cc: sashiko@lists.linux.dev,  hch@lst.de
Subject: Re: request to subscribe linux-nvme
In-Reply-To: <as5G7HWh3TovdMOq@kbusch-mbp> (Keith Busch's message of "Tue, 13
	Oct 2026 08:57:48 -0600")
References: <as5G7HWh3TovdMOq@kbusch-mbp>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Tue, 13 Oct 2026 16:19:41 +0000
Message-ID: <7ia4h5ip8teq.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Keith Busch <kbusch@kernel.org> writes:

> Hi,
>
> Christoph and I maintain the linux-nvme driver and we would like to
> subscribe our mailing list to the sashiko review system. Our mailing
> list can be found on lore here:
>
>   https://lore.kernel.org/linux-nvme/

Sure, added, will roll out later today. Do you want email delivery or
just web ui?

Thanks
