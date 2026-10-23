Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792786928;
	b=1VDEmwDg4JNmSwzhKBZvtnZ7fpSrrLmJtecxNUMWHS6XyEoay6wb/5Da8iG3IFi7YpTw
	 tht2BsR5KKjSsVwfr+1XkoQki/hqyYkVqQCxLGFV1NdaGbjtm1N1RfljdoNnSeHIiFmoW
	 yM6Zdire1IuQqxH5aDMXV63M0ykTc8HsTmDNq0E8NxciCORl8d9VGyYroTGvXfPx0RhVu
	 LqsZmL2yuZYotHgGzyFRyJlpp57EMj+VE2umhFbq0iSB2qKiSSBxGSInD6+lmCVfdkepj
	 SJJXi3OBjFk0z1gPYacLnxsGzEHYfr4oz5cUgUtXIByzR4b/uJ7jWf6LBViJ0cmFLIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792786928;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:In-Reply-To:
	 References:User-Agent:Date:Message-ID:MIME-Version:Content-Type;
	bh=m2cl4p0OiI4GWURELyUeshMexEX4FT3wPDGBzRMNuQ0=;
	b=QUmZxaf8Vj/aGFR3MoeGK67j52xtYT9jkac/cIaIdernVQB59y/g7lLY09nVdnOHzEx1
	 EdzRiXLeKQZseubkwGz9NBHVhDLosbY6WiXopzVlIDSC5+sCUz+Bswg8LXZ2e1yHqz4Ya
	 gcKXkhPhSnQiSAXmZ84nysADFyb4WQdRnwcx19k0PpTv7xhALCqV7JDzq3g7fokdFgQ2T
	 CnnpmJ9fD/GxEm+34B6cC2wZXfX15G+nXTdp9wmMAQ/xE71IrnfMnhX1p4vs3QINWeOBG
	 Cn4GZN4hRPAzfMkTESIhx1Yt+x7KXISShrGLjrjVdK/m9P2dWrC3MPOo5fOu4hTkD7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c4rx5bw+;
	arc=none smtp.remote-ip=91.218.175.199
Received: from mta0.migadu.com (out-199.mta0.migadu.com [91.218.175.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CCD606A31A
	for <sashiko@lists.linux.dev>; Fri, 23 Oct 2026 20:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4CCD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c4rx5bw+
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=eHKrcZFQkMtBg2vYUqGZeWSFDEqsfNTeBRasW4rg928=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792786925; v=1; x=1793391725;
 b=c4rx5bw+WCE0iYxoOCsJWHXAusMUlK4vkxOUHMZIkN6hiVsbCfXCaI4ksb+XJKM/ilg21kmr
 YAypOwoqd9ULLB1BlSI392kuQQkL9TWy7OdPwnMxS/2eIMwDoSTwTA77d9Ej+quFXkAMQIS7Vw0
 vyow6FXs9QJeUtGHDdlEqRWM=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta11.migadu.com with ESMTPS id 6e128d443dc02445;
	Fri, 23 Oct 2026 20:22:05 +0000
X-Mizu-Trace-ID: 6e128d443dc02445
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Chris Mason <mason@kernel.org>,  sashiko@lists.linux.dev,
  ast@kernel.org,  kuba@kernel.org,  bpf <bpf@vger.kernel.org>
Subject: Re: [RFC] reworking the review-prompts subsystem guide
In-Reply-To: <69794757-5b55-4796-8388-35a074842708@linux.dev> (Ihor Solodrai's
	message of "Fri, 23 Oct 2026 12:27:42 -0700")
References: <91e21331-ed6d-4ac0-b237-b01aeadca2d1@app.fastmail.com>
	<f8295279-7af7-4b3e-bc9b-112bfc49816b@linux.dev>
	<69794757-5b55-4796-8388-35a074842708@linux.dev>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Fri, 23 Oct 2026 20:22:00 +0000
Message-ID: <7ia4fqxwdv6f.fsf@castle.c.googlers.com>
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

Ihor Solodrai <ihor.solodrai@linux.dev> writes:

> On 10/6/26 2:22 PM, Ihor Solodrai wrote:
>> On 10/2/26 12:04 PM, Chris Mason wrote:
>>> Hi everyone,
>>>
>>> I've been updating the review prompts, and you can find my current work here in the subsystem-build branch:
>>>
>>> https://github.com/masoncl/review-prompts.git subsystem-build
>> 
>> Hi Chris,
>> 
>> I've set up "shadow" AI reviews for BPF, taking advantage of our
>> existing bpf-rc infra. It's a copy of the entire BPF CI pipeline that
>> we occasionally use for testing of the CI itself.
>> 
>> [...]
>> 
>> I just pushed, it'll take a few days before we get any real samples.
>
> Hi all.
>
> Got results from a couple of weeks of running the subsystem-build
> branch prompts on bpf list: 272 patches in 50 series total.
>
> TL;DR: BPF bot will switch to the subsystem-build prompts. There are
> no regressions in findings, and overall the results are quite similar.
>
> Chris, IMO you can just merge subsystem-build into main.
>
> Some stats:
>   * Same outcome (review posted vs clean) on 90% of commits.
>   * Medium/high issues: posted on 7.4% of commits, vs 5.9% before.
>   * Low/nit-only reviews: 10.3% of commits, vs 15.8% before.
>   * Cost +6%, same wall time.
>
> Interesting findings:
>   * Old vs new prompts differ about as much as two runs of the old
>     prompts do: on an unchanged patch reposted in the next version,
>     production reproduces only about half of its own findings.
>   * The new guides are consulted in every review, but only 3 of 114
>     new findings cite a guide answer, and the old prompts found those
>     too. No clear wins attributable to the guides yet.
>   * The new prompts no longer produce the "A subsystem pattern flags
>     this as potentially concerning" items (mostly selftests style).

Thanks, Ihor!

Quick question: once it's merged, how kernel maintainers are supposed to
change prompts or the idea is to completely stop doing it?

E.g. are they supposed to add new questions? Or edit the final result
directly?

Thanks
