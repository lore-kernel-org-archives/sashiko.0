Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792423622;
	b=wgN08OXztCNAMuhzodM/74klWIYycehjsIvExXbpxiEIuK7VBaxW10g7E30dwmFhiEU6
	 9FGElm1AaujuQOMxSVVL2QFtNFUOQEeFKKShEN09b2R0ML20ER1EarB/mmY1YmWj7F6k/
	 iGU1jJCYELSh0fFXi33m4268fzw+T7Ste985r672YnpeFibH1suoqmh9pp4+LT1weeNwf
	 UfFnp2EYzVeCN9k07Z8PF/ptUcVQ3vrrku4rmNNWWZIoIUe2TNffIpXMfxak/S46v/zhY
	 f/g5IGpskBSt9NI4O9kdjX1mwFe3UFFVjZXmJszEFQNkxADytMM0gXm2ALFo4SpPQAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423622;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:In-Reply-To:
	 References:User-Agent:Date:Message-ID:MIME-Version:Content-Type;
	bh=kXSqSBde1P+QK5HIxwKx4t5VQa4qFO/oc09Gkrsu20M=;
	b=EPRS+X8S7fjdMML4whVjyB8pXsMhMaY5pqzegBMq/6JHsvFC6UJIzMnibU+AaD4ADLv9
	 9QwCuDqaRM7uggU5Pnpyd9pMxzFk8qj/zKEX55ksGR+yeGsaexgxODbOmAxT2G9g7iiBQ
	 LIh7mfmbCIhFF7baPfjve+fHj9w2befOU7SziqQI5zWVbgaSRZ8Ll8oo7IL2tpAqgvvmz
	 mNWC1djKqBR3GWk7/fr2M/iojv0nWdexXwg68Sja5dMUAMsieR3gNMBQjS0bI1H2WB8bu
	 wE6KyWudNODTufNnEa8HeqCWdTjuxkHMealsFwQ0ywkuat/Cij880sdnWkmqvT8lvJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gTXTT2kl;
	arc=none smtp.remote-ip=95.215.58.218
Received: from mta1.migadu.com (out-218.mta1.migadu.com [95.215.58.218])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86A960B39AF
	for <sashiko@lists.linux.dev>; Mon, 19 Oct 2026 15:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C86A960B39AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gTXTT2kl
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=kXSqSBde1P+QK5HIxwKx4t5VQa4qFO/oc09Gkrsu20M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792423618; v=1; x=1793028418;
 b=gTXTT2kldtoyzUcnvPwXiPSy2CVDhSXxg3yDtmT5vVKyBnaxSOdocP1VZIGx9ODFaZAawqNy
 UYVdRAVoCFb/rWjV+JWGP+4awrRlPXuD+kruSCgJ99Z+1HKiqhN1aUru1dCbunmR65QejCeFyMg
 a5HPo91CKWw/HGV/zLc9LoiI=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta10.migadu.com with ESMTPS id 5f0e5d3339823ab6;
	Mon, 19 Oct 2026 15:26:58 +0000
X-Mizu-Trace-ID: 5f0e5d3339823ab6
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>,  sashiko@lists.linux.dev
Subject: Re: addressing sashiko's false positive rate
In-Reply-To: <20261019055043.3128725-1-sammiee5311@gmail.com> (HyeongJun An's
	message of "Mon, 19 Oct 2026 14:50:43 +0900")
References: <20261003112707.679125-1-sammiee5311@gmail.com>
	<20261019055043.3128725-1-sammiee5311@gmail.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Mon, 19 Oct 2026 15:26:50 +0000
Message-ID: <7ia4se21aeyt.fsf@castle.c.googlers.com>
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

HyeongJun An <sammiee5311@gmail.com> writes:

> Hi Roman,
>
> Just a gentle ping on this, in case it got buried.
>
> On the review-prompts thread you mentioned generating prompts from
> feedback and checking them by re-reviewing the original patches. That
> sounds close to this. If the next-version signal would help there, I
> would be happy to send it as a small PR under scripts/, run by hand and
> not in CI.

Hey HyeongJun!

Over last few weeks there were significant changes deployed:
1) full rework of the deduplication/verification layer
2) sashiko.dev switched to Gemini 4 Argon

which should improve the false positive rate.
There is also a big prompts rework in the process.

Thanks
