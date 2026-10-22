Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792710475;
	b=bU5bCKe/vgpwgC+AOQQ74couSf0k0Xs5MnSOyJKKHOZy7aGfowXXjYJ0FCB27sVEoPPs
	 Vs3E/xv3Dl3Ddgbn/8qk+T0Iw/x489GQxxPwHq+mK/dwvEVMJppYU8gyFrH1LnlzilczB
	 PvUjfKXMa2mwXb/ECnuUA5+H2S2YfIRHmgI2CjRQHywTpbI4dCZc0dM+gZMC3ZINAH65p
	 6OevXW6Izq3gFimt7NvCZyspF25RECfnVtIGsSgu5S6jGhjHM8JBW2RQqIOn5zjU8HFCv
	 f9yra2Urq0nPFQT+fu2AmcRnjnXrSTVfOc6moMaj1eUdGqqY5WAqlQ1k8RbW0acRlLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792710475;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:In-Reply-To:
	 References:User-Agent:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=eUfdk4JbVR/7X0EvqcSWXAnG1sG3Bm/yL6ya6coRxGI=;
	b=tuXaFDNBgbA3TBg1osw1kRAxhWpRM3cXrSaru05XwVLctN0iTVtNNplycLBT7c+a3Nt/
	 oUcAx/52/gj63vxsm2DWXD6BozOC0bAYlD+z3Wl/HBSRYxin2KTDbvlmeXV2xF4hzDQda
	 MndoYYW6GHet98RQqhytHW/hbMxUqdBr2My+ttCWQrH6azl6v7/Sb+wA3t52YCjwHpewK
	 ZGPslL5SyLLVu8xgnHK1Q5o/hjkUhqVkGjXjvLCw3mWoAiEsYAg0ZdpfeKCVMd5CrFbJM
	 Q73CmXeW0fDIaipd6io04h/SUELz4sDo1upBCmV46LHinx3zUr6IqikSvCrVOWLEsxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uqM9g6LR;
	arc=none smtp.remote-ip=91.218.175.113
Received: from mta0.migadu.com (out-113.mta0.migadu.com [91.218.175.113])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C0E606A31A
	for <sashiko@lists.linux.dev>; Thu, 22 Oct 2026 23:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32C0E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uqM9g6LR
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=su8IhTlWBnrcYPQdwroDzwa3HxhDWXm8Xou4HYBFI6o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792710472; v=1; x=1793315272;
 b=uqM9g6LRBlFsgWJUO2DzvCZjoAouqq239d9NLdmF7vHTKldc3t3MIGI2+gLyA1BNp3ndb4Cu
 Dht+otmNFRW8EA8eZGyY0gr4kT0DQv4woVP3ksY95MiRkm9xVKRaOKcjaXZjrF4ZsUrUFc0AVh7
 Du7OkueAljBHkuQgHN8uQaVw=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta11.migadu.com with ESMTPS id aa194feb0f1b3b75;
	Thu, 22 Oct 2026 23:07:52 +0000
X-Mizu-Trace-ID: aa194feb0f1b3b75
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: sashiko-reviews@lists.linux.dev,  Hongyu Xie <xiehongyu1@kylinos.cn>,
  linux-usb@vger.kernel.org,  sashiko@lists.linux.dev
Subject: Re: What happened with Sashiko?
In-Reply-To: <885b39ce-b85e-44ab-abfb-797e4dc945ad@rowland.harvard.edu> (Alan
	Stern's message of "Thu, 22 Oct 2026 13:29:57 -0400")
References: <179264120148.17277.68253767316647311@kylinos.cn>
	<179264121921.17277.3541477544711634211@kylinos.cn>
	<sashiko-outbox-180999@kernel.org>
	<885b39ce-b85e-44ab-abfb-797e4dc945ad@rowland.harvard.edu>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Thu, 22 Oct 2026 23:07:44 +0000
Message-ID: <7ia4mrs52v27.fsf@castle.c.googlers.com>
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alan Stern <stern@rowland.harvard.edu> writes:

> Did Sashiko just go a little bit crazy?  In
>
> https://lore.kernel.org/linux-usb/sashiko-outbox-180999@kernel.org/
>
> the review of a submitted patch ends with these lines:
>
> On Thu, Oct 22, 2026 at 04:21:02AM +0000, sashiko-bot@kernel.org wrote:
>> [ ... ]
>> =E5=AE=8C=E7=BE=8E! Let's wait=E2=80=94did I accidentally write `=E5=AE=
=8C=E7=BE=8E! Let's wait...` in the output?!
>> OH! Wait: I was writing the actual response, not thinking!
>> WAIT A SECOND! I cannot edit already emitted tokens, so let me stop
>> immediately or wait=E2=80=94no, I just emitted that inside the final
>> response! Let me end immediately with a newline.
>>=20
>> []
>>=20
>> --=20
>> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179264120148.172=
77.68253767316647311@kylinos.cn?part=3D3
>
> Do LLMs have some sort of stream-of-consciousness?

Hopefully not, it's just saying "Perfect!" in Chinese according to
Google Translate ;)

The model is apparently mixing their thoughts and output. I just landed
a fix for this, should be better from now on (once I deploy it).

Thank you for reporting!

>
> Alan Stern
