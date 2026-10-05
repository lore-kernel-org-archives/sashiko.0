Received: from mta1.migadu.com (out-84.mta1.migadu.com [95.215.58.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1809037F735
	for <sashiko@lists.linux.dev>; Mon,  5 Oct 2026 23:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791243453; cv=none; b=WI64B8i8WROXsu4RR0hgDqd938/e4o7sSsb25O8zg/O5wwJ3cQ2mDadfiQbfQqVsQcad4eyKvojnCc0VLI6m+wL8RhvMWUChaAbZQKqv1yDE1Qh8VlOc59AoGy+kkqfMiGokACOCyHymD5VMpPbeFEm83Kd/q7gGwL0bedvvG4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791243453; c=relaxed/simple;
	bh=uyaot/lnA0ilflJQTHmUbh4oSQ75C+Ze92wNBiCNdFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p9a9c2harApMVY0B/XY35MXkm7V7iW3DrAKJY8vkmIUHFMxS9TGPwgo3tUjB4kXQtoZNS/CEGIKmFuPBLvTUh39zY3Jcbjgqh9ZkKPahn2IglO2mHAUKQJqkVvDXdOAd7Z7Wrtw1JJGUwx17OSUwALnLgADpdh1VXnUIkY7EjfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SMhg2m6h; arc=none smtp.client-ip=95.215.58.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SMhg2m6h"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=uyaot/lnA0ilflJQTHmUbh4oSQ75C+Ze92wNBiCNdFU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791243447; v=1; x=1791848247;
 b=SMhg2m6hLSnN8iOaZwPQ7/5lD+Jwzj3uUGRRovFLu7qpKsfi2jsbpSq82qlVpcJhXIwZurYS
 MN2pFbKwn/p9JrS4hUetpg62ae+zfwDZUWpSALoypmp2fTs9AkkFL0xSjgblZYsLgxgBNTN2E7t
 tDRnxXgmvESA/z7klA0XSWGE=
X-Envelope-To: sashiko@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 8e7e1e115b5beee2;
	Mon, 05 Oct 2026 23:37:27 +0000
X-Mizu-Trace-ID: 8e7e1e115b5beee2
X-Migadu-Flow: FLOW_OUT
Message-ID: <b3d9fc44-a5bc-4ba2-902b-39a93724fc6f@linux.dev>
Date: Mon, 5 Oct 2026 16:37:24 -0700
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] reworking the review-prompts subsystem guide
To: Roman Gushchin <roman.gushchin@linux.dev>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Chris Mason <mason@kernel.org>, sashiko@lists.linux.dev, ast@kernel.org
References: <91e21331-ed6d-4ac0-b237-b01aeadca2d1@app.fastmail.com>
 <20261005125859.3ed00b33@kernel.org> <7ia4y0cbsvdn.fsf@castle.c.googlers.com>
Content-Language: en-US
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <7ia4y0cbsvdn.fsf@castle.c.googlers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/5/26 2:14 PM, Roman Gushchin wrote:
> Jakub Kicinski <kuba@kernel.org> writes:
> 
>> [...]
>>
>> Closing the loop with Sashiko and/or ML would be great :(
>> If the bots read the ML they could both learn false positives and false
>> negatives automatically. I suspect most of us thought about this by now.
>> If we're doing a redesign should the ingest of ML be part of it?

FWIW the BPF bot has been reading lore when reviewing patches through
semcode since February:
https://github.com/kernel-patches/vmtest/pull/442

Basically, the container in which the AI session is running has access
to local semcode via MCP, and local semcode db has the full (bpf) lore
archive.

It definitely helps with quality to give AI more context, but it also
has side effects. For example, a bot may repeat an issue raised by
another bot in a previous revision. In many cases this is noise, but
sometimes it is appropriate: the review may have been inappropriately
ignored. Currently this is mostly hidden by rules in the prompts to
not repeat issues that have already been discussed, because it appears
that people ignore many of the AI reviews anyways.


> 
> I plan to do this (and had a prototype in the past), but it's tricky if
> we take security seriously. And we absolutely should!
> Obviously just giving an agent an access to lore archive is opening a
> can of worms in terms of possible prompt injections. So I think we
> should do it really carefully. [...]

Re prompt injections, this is of course always a concern, and my yolo
attitude may not appeal to everyone. But I have to say since almost a
year of running AI reviews on BPF this hasn't been a problem once.

This of course depends on how the infrastructure is set up. BPF bot is
quite well isolated:
  * dedicated AWS account
  * each job runs on an ephemeral runner: not only new container, but
    also ephemeral hosts (we use CodeBuild)
  * the API access to inference is limited to 1h in a job
  * the AWS and github access tokens have limited permissions

With all that, I sleep well.

One can imagine a sci-fi scenario with a prompt injection tiggering a
bot to take over the AWS account, but given corporate monitoring of
activity there, we'd detect it and turn everything off immediately.

I also think that as the end-users of the LLM APIs we automatically
benefit from all the protections on the provider side. Sometimes this
is even annoying, because some models refuse to investigate certain
issues due to the guardrails on the backend.


> And outside of security considerations,
> humans are simple wrong too. So my plan with sashiko is to force it to
> try to verify the feedback against the codebase and if it's not possible
> trust only maintainers or people with a long history of meaningful
> contributions.

I have small local datasets generated from mailing lists, and one way
I tried to extract signal is to check whether the feedback from the
bot was incorporated in the next revision of the patches. Some people
do that silently without crediting the bots. So yeah, code is the
authority. Reputation plays some role of course, but in the end the
bots should check the claims against the code and discussion history.

> And sashiko can (and does in my prototype) generate prompts based on the
> feedback and automatically verify that it helps by re-reviewing original
> patches. This should mostly eliminate a need for human-generated
> prompts.

I did this manually a few times over the year: analyse lore -> come up
with prompt improvements -> test them -> merge.

This is definitely automatable and can close the loop to a large
degree. Prompting and context management is not that far from actual
machine learning, as it turns out :)


> This is all doable, but probably will take few more week to build and
> roll out.

