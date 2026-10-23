Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792790804;
	b=YqYBLVsDiWIew2NAso+Jn7HBN3ll80eDIbIzx4WGJ/hdSmB4mhyT3lmpfiFtfA2Farr/
	 mYmIpbkupK4j5ba9YjBPGmO9CppEQP4ziRz3AgWmTcZQuTUiN5gHhuzg+fdv97G/qcfGm
	 BPEoOhwrVvJPAo/jV34G6nCjW2lmEKlklXKRBx7kCShNy6WCViIlKpAuBKIJktjNdKqze
	 ExuEtKW10yCgnCEZJdsPpHMWoNqy1jsuVm1nGuVfgvlm+GY0zQnDpOJ5dT90I9wdUKrF2
	 1SfVJUWm5eS5G/zkUoJ04S12QuPetnSgwLZ4QIHdrBX4h7ZCr6JMkmmnoOHTRrN5KTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792790804;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=yMi17/MqNjP0MWioHfo8kgIuC2hzzI8pK0AqrIdQJYU=;
	b=DLLRPF8W6WvB/YR3xwyGFqaD4FZ8YcaRzXMspgTRTIl6KUpF/lVnqt2LbekrQcp8EpGN
	 ayebGGD0nx5CoUwm48nER+x8CRG6363T+Y0LK6txzG0TLLHZuFyeSve46UesZ1G7YQ15a
	 Zy/3eemfizLsMZSOUUQ96YmRpspq/qYrAD2HHFf0bf8vOCP7XZKNr4NKVtoQ7CHP0PdoX
	 LoGoakGgwgI1ySEgsb1vZmeJ7DonIC4Liwl2YCKrEZAMHN5hj1KPrmxkE4p1pgDXPrFEd
	 kodchqEASMVDYXruSHgkdwboaggAJr0SGvz9lV3oPE61BKyUcGUt9wn69TuedugVp6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=R+zPwgHR;
	arc=none smtp.remote-ip=91.218.175.121
Received: from mta0.migadu.com (out-121.mta0.migadu.com [91.218.175.121])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F10606A31B
	for <sashiko@lists.linux.dev>; Fri, 23 Oct 2026 21:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6F10606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=R+zPwgHR
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=hqiuokBG/jTzR0/fra60HM5YTJO2GY0DMkGtGA0/BBE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792790800; v=1; x=1793395600;
 b=R+zPwgHR/9aCAdzTjPUCuioykddReIRZZdAOD1aJoF8/7RExy7Zt1ufZhWxhFdJWskDjq2ty
 GbUef/YvA480YkIQPx9wbMtgRSAQwAO0tJIfYLGerp2mPUvlm0QVY254g5l3NXLk8VNbpAg/Mdg
 AQqZTtSpZyG3xk58s4OW1XGk=
X-Envelope-To: sashiko@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 7a376c29d8fb16a6;
	Fri, 23 Oct 2026 21:26:40 +0000
X-Mizu-Trace-ID: 7a376c29d8fb16a6
X-Migadu-Flow: FLOW_OUT
Message-ID: <a50c3d55-b5f6-4046-82b2-e583fce71077@linux.dev>
Date: Fri, 23 Oct 2026 14:26:37 -0700
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
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Chris Mason <mason@kernel.org>, sashiko@lists.linux.dev, ast@kernel.org,
 kuba@kernel.org, bpf <bpf@vger.kernel.org>
References: <91e21331-ed6d-4ac0-b237-b01aeadca2d1@app.fastmail.com>
 <f8295279-7af7-4b3e-bc9b-112bfc49816b@linux.dev>
 <69794757-5b55-4796-8388-35a074842708@linux.dev>
 <7ia4fqxwdv6f.fsf@castle.c.googlers.com>
Content-Language: en-US
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <7ia4fqxwdv6f.fsf@castle.c.googlers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/23/26 1:22 PM, Roman Gushchin wrote:
> Ihor Solodrai <ihor.solodrai@linux.dev> writes:
> 
>> [...]
>>
>> Some stats:
>>   * Same outcome (review posted vs clean) on 90% of commits.
>>   * Medium/high issues: posted on 7.4% of commits, vs 5.9% before.
>>   * Low/nit-only reviews: 10.3% of commits, vs 15.8% before.
>>   * Cost +6%, same wall time.
>>
>> Interesting findings:
>>   * Old vs new prompts differ about as much as two runs of the old
>>     prompts do: on an unchanged patch reposted in the next version,
>>     production reproduces only about half of its own findings.
>>   * The new guides are consulted in every review, but only 3 of 114
>>     new findings cite a guide answer, and the old prompts found those
>>     too. No clear wins attributable to the guides yet.
>>   * The new prompts no longer produce the "A subsystem pattern flags
>>     this as potentially concerning" items (mostly selftests style).
> 
> Thanks, Ihor!
> 
> Quick question: once it's merged, how kernel maintainers are supposed to
> change prompts or the idea is to completely stop doing it?

haha, I like how you said it's a "quick question"

Just speculating below, I'm not an AI expert by any means.

I don't think we should stop editing the prompts. They at least need
to be up to date matching both the source code, project development
process and maintainers' expectations. If we outright stop, the
prompts will rot and become stale, which will mislead the AI and burn
tokens even if it self-corrects.

At the same time, it appears that attempts to improve / fine tune the
prompts to improve the *quality* of the output or efficiency of the
workflow quickly hit diminishing returns.

The low hanging fruits in my experience are picked up fast by giving
an LLM samples of the real-world traces and ask it to improve the
prompts. It works.

Again, lots of salt here, but out of curiosity I looked at things like
GEPA [1]. While projects like this advertise significant improvements,
evaluations that I saw show only marginal gains. My guess is that a
new big LLM release would immediately eat all those improvements for
most use-cases.

And that's setting aside the problem that it's very difficult to
evaluate the results if the output is open-ended; and the fact that
it's costly to run. If we do all that, why not just build and add a
"Linux code review corpus" into the RLHF pass of the base LLM? I'd be
surprised if it's not happening in some form already at the big labs.

[1] https://github.com/gepa-ai/gepa


> 
> E.g. are they supposed to add new questions? Or edit the final result
> directly?

Maintainers feedback is essential to make the auto-review systems
work. They are the ultimate consumers and judges of the reviews.
The question is how exactly to capture the feedback.

The first versions of the review-prompts read like an algorithm
written in english: phase 0, step 1, ... step 13 - skip if X, etc.

IMO if you are using a frontier LLM + harness, this is now
unnecessary. The AIs can figure out the steps themselves.

What is necessary:
  - describe the desired outcome as precisely as possible
  - explain where and how to search for context and details
  - configure / explain what it can and can not do in terms of tool
    usage: e.g. don't try curl if you're sandboxed
    AI is prone to try hard even when it's deliberately limited. That's
    how it's been trained so far.

I think the most impactful and important part is steering the "desired
outcome" through the prompt. And that one is subjective in many cases.

Do you want only bugs that are reproducible, or do you want suspicious
code flagged as well? Do you want nits or nah? Commit message style?
How about a high-level design review for a big series? Would you trust
an AI to do that?

So, replying to AI reviews (even with "this is bullshit") is useful.
Adding {subsystem,project}-specific rules about what to look for and
what to drop is also very useful.

Obsessing over wording or writing prompts like programs - too time
consuming vs the value you'd get out of it.

Opinions are my own :)


> 
> Thanks

