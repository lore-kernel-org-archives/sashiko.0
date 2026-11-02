Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661406;
	b=RBbpJ/DNWCJqwBjigwEWxmq49NpRQ4v7SCm7N4K1ETRA6OSKDcrey9Q5AKCROzfqr69t
	 OfJ2u2en2NZR0Ronxzq16qAQupxtpuV7OFDY3ln11zsJ09njm196V03ss3EcFYPvZf5SI
	 KmzITLNovD28cOI979GSKEOElomGv+ohdasv8L9GYVCwKW32CosCtn9ZkfPGyyQmDzrIS
	 se0ZKCpIybcLW7v9T9ZNb02H8AWGIjK7NhhJGAN/ES4HH1dEec7JqYvlldl3jUrL6TwOI
	 XRA/qTR/2XNIhogIAb5ZYGmpR56LGvNPnukU6oBAmGNQ66c0A6////hIejyqv8x1hXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661406;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:In-Reply-To:
	 References:User-Agent:Date:Message-ID:MIME-Version:Content-Type;
	bh=MqlnNAl4jerebXGftIz6w4bWXZV2qt3uB50RCwgbS1U=;
	b=y6nlh6++41ocffHz4M1ru6DL+xrY9hetC2pCDXsBHSjA3swK6tYncQ706YYPBgCRXchJ
	 8SFbKe5K08YX4fS3cbLS2htZegB59U6lX97Qun+cyv+pAwVEOf4pna+Wxc1EB16EzZh+o
	 K4tsdOp84sAKHNtRnzXWdLjr0keVSuGqSMVoB+6qQzecjvCMd/6RWo3FLPaTmUDNLL9OY
	 C1zAQ6VQd8vkfyHav87n6/ESIbER5WJc7n3T0SR+tTrgRVBdfVATos6FtPmQiPv25nT9X
	 pHy38cBeA0ZnYZkECtySLCa8OjJSxu4ENzttEYDJOVctYiGuYEJQF3j7RNGRPf5Yk+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wpFXBYZi;
	arc=none smtp.remote-ip=95.215.58.200
Received: from mta1.migadu.com (out-200.mta1.migadu.com [95.215.58.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C692606A327
	for <sashiko@lists.linux.dev>; Mon,  2 Nov 2026 23:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C692606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wpFXBYZi
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=MqlnNAl4jerebXGftIz6w4bWXZV2qt3uB50RCwgbS1U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793661403; v=1; x=1794266203;
 b=wpFXBYZiRajCbbCbGEqa+Ry1hHvYENX4FAM4UCX7vT+rP48lA4aOoiRRiVjiChe+zADTrzJv
 /odmRSGpWRj2xyAwvh61/3K9nNbBjv0qaVrcWUdJKw4pEOLr1DTB9nOWrcOeSYlBifaz8GP1cLO
 2zLiT3H3vfrkjtWvugc7LLrY=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id cac907bc31a3b5d2;
	Mon, 02 Nov 2026 23:16:42 +0000
X-Mizu-Trace-ID: cac907bc31a3b5d2
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: sashiko@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>
Subject: Re: netdev-ai Sashiko instance has no record of net-next series v7
 (present on sashiko.dev)
In-Reply-To: <f5d2828e-53f6-4d3d-9656-8def5548d014@yahoo.com> (Mieczyslaw
	Nalewaj's message of "Mon, 2 Nov 2026 21:06:37 +0100")
References: <f5d2828e-53f6-4d3d-9656-8def5548d014.ref@yahoo.com>
	<f5d2828e-53f6-4d3d-9656-8def5548d014@yahoo.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Mon, 02 Nov 2026 23:16:40 +0000
Message-ID: <7ia4a4nqddt3.fsf@castle.c.googlers.com>
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Mieczyslaw Nalewaj <namiltd@yahoo.com> writes:

> Hi,
>
> The netdev-ai instance of Sashiko does not seem to know about a recent series, while sashiko.dev has it.
>
> Series: [PATCH net-next v7 0/10] net: dsa: realtek: rtl8365mb: add support for RTL8367S-VB
> Cover letter Message-ID: 3bf4dd70-9771-497b-8c27-e925e0ef81eb@yahoo.com
> Sent: 2026-11-02, between 14:34 and 14:45 UTC (all 11 messages are present on lore, netdev list)
>
> What I see:
> - https://netdev-ai.bots.linux.dev/sashiko/#/patchset/3bf4dd70-9771-497b-8c27-e925e0ef81eb%40yahoo.com returns "not found"
> - Earlier versions of the same series (v1-v6) are visible on the netdev-ai instance
> - v7 is visible and reviewed normally on sashiko.dev
>
> So this is not a "Failed To Apply" status, there is no patchset record
> at all, which suggests the series was not ingested or not
> assembled. Note that net-next only reopened today, so I wondered
> whether the instance's baseline or its net-next open/closed handling
> could be involved, but I cannot verify that from outside.
>
> Could you check the ingest logs for this Message-ID? Happy to provide
> more details if needed.

Hi Mieczyslaw,

netdev instance is a fork which Jakub (cc'ind) is running, I have zero
visibility into its operations, so I can't help unfortunately.

Thanks
