Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792517765;
	b=Lo6cDH767tflYwg6q8UpIEn3TVwvrADgaXRU2F0R3X8980hbYlTAVCvXfRYuwTb+Fa6x
	 vS4Gpde0VrKvzsWwTfmXvLOMj1e5uCwla8VANzSdW/SqfODBHjIntlgxr9SX1f6sk4Cjp
	 DfIyHPtB74H/Ifd+6qo+uZVtzLD2Qao40v7lUwONNwcU/mvTZbUebqu9FeiRXVesZgBL3
	 u4N1JHKORAHhJGXOXa//VfRg+bVjvmrJYJEEv+1/13gCVTowFMQqpo8zpBJywckkkIqeZ
	 0ub8aI7uh4IPRI8D34TBlpkOPMiFHqdDZjEZSKAtOYXo9VOObYcMNmapq4OyATliKXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517765;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:In-Reply-To:
	 References:User-Agent:Date:Message-ID:MIME-Version:Content-Type;
	bh=MKlAVf8pJTxm7y+S0FoVuXl8SacRXsLs8tmOYBmHBos=;
	b=CPuAK/P9+1NT4QdfAUYdhgTfs9J200qBSpRX/n3SthPnSm+cP1fIOndGBw2ln95zG2B8
	 S4nPtn0OXkDBXLWTIU5FUlD6za9o93vbv10PsPuBVF+QZrTmfecm3WYGcWtlVrgigKBiW
	 JyHl9/v9CEni8xtp6PL1346yi/HTHHWK6uy7lFD2GhxjO/X5ZJ/CP1dH1rGW05Udnoyir
	 7lWAEAdaZ8D5vX8EwhrT2JmiUNth0ozgjhcwbXbCG1NUvNlkHQHDt0rzTJSI6ZqoMWafm
	 OjUvLwmhcwcwSruI0or7lN0Wi0Aqp6RrhnRELdIoMdADHYKJIPvmV2bpzmY94gUSvKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xphcqVEU;
	arc=none smtp.remote-ip=91.218.175.1
Received: from mta0.migadu.com (out-1.mta0.migadu.com [91.218.175.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9040A606A31B
	for <sashiko@lists.linux.dev>; Tue, 20 Oct 2026 17:36:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9040A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xphcqVEU
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=MKlAVf8pJTxm7y+S0FoVuXl8SacRXsLs8tmOYBmHBos=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792517761; v=1; x=1793122561;
 b=xphcqVEUlw+HA6OnaTr/OMLv8yY6edL4IOXQXypiu46gaB1DENL11UFao4xp9QXR9kSTsXn5
 rlqzQele0lTQYhnAVoM6dOAk+FZesXrGDnMZjMi2dD4jgg2+WIooeeNHKwRsoZg0pdK2fY8fy3n
 E/gzouyYTENuqE8LRk4BUQwU=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta11.migadu.com with ESMTPS id 85271f9f13e6b2e8;
	Tue, 20 Oct 2026 17:36:01 +0000
X-Mizu-Trace-ID: 85271f9f13e6b2e8
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Takashi Iwai <tiwai@suse.de>
Cc: sashiko@lists.linux.dev,  linux-sound@vger.kernel.org
Subject: Re: Enabling Sashiko for linux-sound ML
In-Reply-To: <87bj8oh7wf.wl-tiwai@suse.de> (Takashi Iwai's message of "Tue, 20
	Oct 2026 14:29:52 +0200")
References: <87bj8oh7wf.wl-tiwai@suse.de>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Tue, 20 Oct 2026 17:35:52 +0000
Message-ID: <7ia4cxt48ebr.fsf@castle.c.googlers.com>
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

Takashi Iwai <tiwai@suse.de> writes:

> Hi Roman,
>
> could you enable Sashiko reviews for linux-sound@vger.kernel.org?
>
> In the audio BOF at the previous LPC, it was discussed, and people
> agreed with the enablement of Sashiko.
>
> The preferred configuration is author+list.

Done!

https://github.com/sashiko-dev/sashiko/commit/b063c144377b569c39eb3c7d2f689478062fc4f1

I'll roll it out later today/tomorrow.

Thanks
