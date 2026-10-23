Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.234
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792783673;
	b=jTslxy26L4jhHV6ZurwTQ3c6kFveqKN9w4wfq0grYG/8dLo/4mW4ltNeXaiqjywQggsy
	 74YF5P2NezcmtrrCYAMcpbAiScNf0SRqUtHAu5Sq37lMORuxDBdc/FjEJgRorsZGEG3+0
	 qeUapcmgpkNt/D1SMxHcNBAITF/yVvsEhio7U2/xepCaFMf1/ZGH/lArVWR5VQJ4lY5dp
	 IY7h0KkIATHWwaisBqp7ErxqXIqV6rNWe4erb+6IIicWfdz7/yUAxGrAQQzNvU61RNHU1
	 0zDgq14qe5k9COanIcwsAuRJ4MqGnu0UqGA20ZDzEheGS8cFq9OUzSuJ1iZThAw0VuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792783673;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:Cc:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=rmNL7EwrRaslbfYEi5j/mAu2eKu9jULT6loXYTduEYQ=;
	b=gl5z/x5CypU34sZuu3pZJ+h5/amG3XSrsHIGwEtgINi9ExYwPLSWoQccBDFlZVuqZzib
	 s4bAI65WlFfwVanrp1Ug0Wth+S8CG8EBLwp6mOwTAqWvYPZK6S05PJ3LOTE2hQJ0+axll
	 lSvsGAT3hNY+ZC632NryeqblfbsWlZ53VVMCWdfG6w/U3iN+G1/ZhNbZuoRlPksnOxVCz
	 MNmKFx69gIaA584Ntxkftk3/WNMYVpoS3Ae6C2AZ5/tUR+3YUL2Dj5QUYPLugF09iPq/9
	 r2sNlARxhenEszSIFd2EzGU5vTipbIyNrRk/9V40VDAs7SedhZ0sxvMKl4TG7UJ/6mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="I9C/ON8b";
	arc=none smtp.remote-ip=95.215.58.234
Received: from mta1.migadu.com (out-234.mta1.migadu.com [95.215.58.234])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30428606A31A
	for <sashiko@lists.linux.dev>; Fri, 23 Oct 2026 19:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30428606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=I9C/ON8b
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=lc7mBRhsQeQEvtaX14L+4Bmvql5UNc3XbLUHtlVST3Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792783668; v=1; x=1793388468;
 b=I9C/ON8bcXAz8cUEO6EOXt/A+lWiNEvPwjUMk8kPOsvnlqWYHoG07hiPAUtvs+wQDkFb0DLX
 1uKqRZZ2vN2gsj5qWpTyIyPLAKvf1W0IJ3EPRxRv5I5j3qXBdUSad2wXKDA8WWWxGAelmAzmLlN
 P7PVCnG2wicU7gXsNvGmtuKM=
X-Envelope-To: sashiko@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id ae4ea0f91ec5008a;
	Fri, 23 Oct 2026 19:27:47 +0000
X-Mizu-Trace-ID: ae4ea0f91ec5008a
X-Migadu-Flow: FLOW_OUT
Message-ID: <69794757-5b55-4796-8388-35a074842708@linux.dev>
Date: Fri, 23 Oct 2026 12:27:42 -0700
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] reworking the review-prompts subsystem guide
From: Ihor Solodrai <ihor.solodrai@linux.dev>
To: Chris Mason <mason@kernel.org>, sashiko@lists.linux.dev,
 Roman Gushchin <roman.gushchin@linux.dev>, ast@kernel.org, kuba@kernel.org
References: <91e21331-ed6d-4ac0-b237-b01aeadca2d1@app.fastmail.com>
 <f8295279-7af7-4b3e-bc9b-112bfc49816b@linux.dev>
Content-Language: en-US
Cc: bpf <bpf@vger.kernel.org>
In-Reply-To: <f8295279-7af7-4b3e-bc9b-112bfc49816b@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/6/26 2:22 PM, Ihor Solodrai wrote:
> On 10/2/26 12:04 PM, Chris Mason wrote:
>> Hi everyone,
>>
>> I've been updating the review prompts, and you can find my current work here in the subsystem-build branch:
>>
>> https://github.com/masoncl/review-prompts.git subsystem-build
> 
> Hi Chris,
> 
> I've set up "shadow" AI reviews for BPF, taking advantage of our
> existing bpf-rc infra. It's a copy of the entire BPF CI pipeline that
> we occasionally use for testing of the CI itself.
> 
> [...]
> 
> I just pushed, it'll take a few days before we get any real samples.

Hi all.

Got results from a couple of weeks of running the subsystem-build
branch prompts on bpf list: 272 patches in 50 series total.

TL;DR: BPF bot will switch to the subsystem-build prompts. There are
no regressions in findings, and overall the results are quite similar.

Chris, IMO you can just merge subsystem-build into main.

Some stats:
  * Same outcome (review posted vs clean) on 90% of commits.
  * Medium/high issues: posted on 7.4% of commits, vs 5.9% before.
  * Low/nit-only reviews: 10.3% of commits, vs 15.8% before.
  * Cost +6%, same wall time.

Interesting findings:
  * Old vs new prompts differ about as much as two runs of the old
    prompts do: on an unchanged patch reposted in the next version,
    production reproduces only about half of its own findings.
  * The new guides are consulted in every review, but only 3 of 114
    new findings cite a guide answer, and the old prompts found those
    too. No clear wins attributable to the guides yet.
  * The new prompts no longer produce the "A subsystem pattern flags
    this as potentially concerning" items (mostly selftests style).

Overall, it appears that prompts tuning becomes less important vs base
model improvements, at least in the context of searching for
regressions on patches. As long as the core intent is expressed in the
"root" prompts.

The analysis was done by AI, of course, so grains of salt everywhere.

If anyone's interested I can share the dataset and analysis details
separately. Let me know.

Thanks.

> 
> Thank you for working on the prompts!
> 
>>
>> [...]

