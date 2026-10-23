Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792718811;
	b=Z92hJZln+jdAUL9VwXf4SLM7M0QBV96IWbHQrZRnprO8S9vbZdf+TXLSpXRmzqAScKXG
	 9ewAJOKrv37rZ8X7GHBDbbCISR/zVaIG30o2grFSoim5zKF23TXazSjaTzWxNnwnibs87
	 rgGhTO3z4pFELAjWkFZwqSuF1LuGM1ZbPXGrBKZhZ3dWILUNst3CoUJXdwzV6jmKGmu2O
	 e94FP5/3oic20XWACK7IMd4A/hF1Xf5nxamd4xylQs1nOFwvKHl3zpM41BTwRxIb0+Uf/
	 c6FuRHsKTrLJeIxkECiWweLijykvVUe/Htyvs8U0rwfDVbnFalFrGp7tEP0URGwo6EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792718811;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:In-Reply-To:
	 References:User-Agent:Date:Message-ID:MIME-Version:Content-Type;
	bh=i+Dq1xX2JbtRoMUy7uCTcT6LkM5lHWLzxOvHJKRtw9A=;
	b=lyNVim8GZv0EUdu0zlwJoA77dve6xTgU7mfR17kVANqkBOoMeuas4bwdiwjZE1lcbz7J
	 30J5UuF2KTRhzJn2J6rpP21SxaaQP8pZoVZ7TXKzCymvlLyImY3/LASqoHLO1yahwIoXD
	 LUdL3DKhHU3WhgKmw+kK7HwuE75Yg9zOa9ED37DrL9yBX6KIP9NM/M+41ZSrvEJ7VFUb3
	 SGBycIjnAsO9ujdooykmu/XcWKz7IgWW7uTb/So+FDI0YH4ANWsOYjqLm/X1lyS3KHe71
	 yTwSdXFVc3/aIvEM/4DrqURJ+pJTx0srjTrZpQLDwTehqjd4qWVLKWGMevt7AqKlqZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DfTnHtBV;
	arc=none smtp.remote-ip=95.215.58.20
Received: from mta1.migadu.com (out-20.mta1.migadu.com [95.215.58.20])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E80606A319
	for <sashiko@lists.linux.dev>; Fri, 23 Oct 2026 01:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90E80606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DfTnHtBV
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=ti0dvJggsUCNbPX0V/0ZNRHupni2ITrw84jVumw0Lso=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792718807; v=1; x=1793323607;
 b=DfTnHtBVLhhf7i6d90ZJ/oWisyDYTwCW6YX2v8miYlPRQF+Pa6e9leLAIxfqRef1d5hYCpYz
 uHB0azmwvNXtfR6ll3Lxp3Ldbr3012s1RIUqDr1qgfiEQONyL1jP9sG6qH76I8xyZGMkfqXGA/V
 TJ3SK1RJxY1Eyix4bjoJqbcU=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta11.migadu.com with ESMTPS id e7d5353381a3da34;
	Fri, 23 Oct 2026 01:26:47 +0000
X-Mizu-Trace-ID: e7d5353381a3da34
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Chih-En Lin <shiyn.lin@gmail.com>
Cc: sashiko@lists.linux.dev,  Chris Mason <mason@kernel.org>,
  rawat10@purdue.edu,  pfonseca@purdue.edu
Subject: Re: [RFC] new design of review prompts management
In-Reply-To: <20261023011616.GA6628@laptop01> (Chih-En Lin's message of "Thu,
	22 Oct 2026 21:16:16 -0400")
References: <20261021234442.136214-1-shiyn.lin@gmail.com>
	<7ia45wyty0ph.fsf@castle.c.googlers.com>
	<20261023011616.GA6628@laptop01>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Fri, 23 Oct 2026 01:26:40 +0000
Message-ID: <7ia48q3p2omn.fsf@castle.c.googlers.com>
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

Chih-En Lin <shiyn.lin@gmail.com> writes:

> On Thu, Oct 22, 2026 at 07:50:02PM +0000, Roman Gushchin wrote:
>> Chih-En Lin <shiyn.lin@gmail.com> writes:
>> 
>> > Hi all,
>> 
>> Hello,
>>
>> Thank you for the proposal!
>
> Hi,
>
> Thanks for the reply!
>
>> Many ideas here resonate with what I was working on/was thinking of
>> recently. I'm about to publish a big rework of prompts which separates
>> them in auto-generated part and subjective small part for maintainers.
>
> I wonder if that are:
>
> https://lore.kernel.org/sashiko/91e21331-ed6d-4ac0-b237-b01aeadca2d1@app.fastmail.com/
> https://github.com/masoncl/review-prompts.git subsystem-build

Not quite that, but to some extent a step towards the same direction...
I'll share it soon.

>> It's somewhat close to what you're proposing, but not fully. Let's maybe
>> restart this discussion after this?
>
> Sure :-)
>
>> I'm sure there will be a ton of room for further improvements...
>
> We actually have other more ideas (included and not included in [1]) to
> improve this type of patch review system, but most of them are based on
> the invariant unit. And, since the kernel community has one already, we
> are happy to contribute.

And this is great!
