Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA0A358389
	for <sashiko@lists.linux.dev>; Sun, 10 May 2026 17:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778434286; cv=none; b=KQ03L1LVi7aM60GiDpGjIAUlIp3RWm9GtcEjSEGqsK1T+KGud1OBsMPMc8itL5utZ3UWri+fusVujjR68nrAskRrmgUGCJXh+O966Ye2NF9LOzT0/HjxV9i2856wNOKH6xu4tWQPQt+d/51bb4TixhKL1G1Q2tVQo/SnReEaCr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778434286; c=relaxed/simple;
	bh=Q1+miDItDYoIPQRyhQvbjYTKNcViBA6upDES3mIaosw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ExCb0ozyBuo8ls1wvOGbJdLQQLiZTFHXbf1cXbViV2GljDNm9QcaZSEwUE/lsAIzRJBbEN85ojLkO/NljG8+/L00Q3oNQskZclQWXA4eXgExmybvfR9SGZC3vJ5kmxr2icmXqhURndRlRlgV76x9o7PECWipPicl21HLWqnhvTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=H/AH76IZ; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="H/AH76IZ"
Message-ID: <41677b05-8d11-496c-8112-96f5f5ba8e5f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778434273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p/uAmtu9wFLotT1QUutjSF/JVBtGK2HAvXU44vBx7TU=;
	b=H/AH76IZ4MVuBDkINQvcBrwrO2cWTKFtPF7t7XLSHt9OIkSxj2f0AsaNubVx08pmH1yEXk
	eA/EBlO0bcglv7OMoWxKKjxFgIMw9dQA+FaZyxRcQF+1tN/4GecqXzJGz9ZYKgseJS8myD
	1QB6AWlH9VJeihlvUK2rHIFSfsOeE9g=
Date: Sun, 10 May 2026 10:31:04 -0700
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2 20/23] selftests/bpf: Add precision
 backtracking test for stack arguments
Content-Language: en-GB
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260507213150.1139244-1-yonghong.song@linux.dev>
 <20260509015204.1324AC2BCB0@smtp.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20260509015204.1324AC2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 5/9/26 3:52 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Commit message and code comment incorrectly claim that the subprogram performs a bounds check.
> - [Medium] Non-deterministic branching in the test program can lead to intermittent flaky failures by returning 36 instead of the asserted 25.
> --
>
> commit 953824567df7ff801d99eb6df49d76d95736325d
> Author: Yonghong Song <yonghong.song@linux.dev>
>
> selftests/bpf: Add precision backtracking test for stack arguments
>
> This commit adds a test to verify precision backtracking across BPF-to-BPF
> calls involving stack arguments. The test aims to ensure precision propagates
> from a kfunc's size argument back through a subprogram frame.
>
>> The test passes a size value as incoming stack arg (arg6) to a
>> subprog, which bounds-checks it and forwards it as the mem__sz
>> parameter (outgoing arg7) to bpf_kfunc_call_stack_arg_mem.
> Is the description about bounds-checking accurate?

The description is not really reflecting the code due to code change
but commit message is not. Will fix.

>
> Looking at the inline assembly for subprog_call_mem_kfunc, it appears the
> subprogram simply reads the size from the incoming stack slot and immediately
> writes it to the outgoing stack slot without any bounds checking logic.
>
>> diff --git a/tools/testing/selftests/bpf/progs/stack_arg_precision.c b/tools/testing/selftests/bpf/progs/stack_arg_precision.c
>> new file mode 100644
>> index 0000000000000..c94905f07dcc1
>> --- /dev/null
>> +++ b/tools/testing/selftests/bpf/progs/stack_arg_precision.c
>> @@ -0,0 +1,137 @@
> [ ... ]
>
>> +/*
>> + * Test precision backtracking across bpf-to-bpf call for kfunc stack arg.
>> + * subprog_call_mem_kfunc receives a size as incoming stack arg (arg6),
>> + * bounds-checks it, then passes it as mem__sz (arg7) to
>> + * bpf_kfunc_call_stack_arg_mem.
>> + *
>> + * 1+2+3+4+5+(1+2+3+4) = 25
>> + */
> This isn't a bug, but should the comment be updated to match the
> implementation? As mentioned above, the bounds check seems to be missing from
> the assembly below.

You are right. Because there are two different values (4 or 6), there is
no guarantee that the sum of values will be 25.

>
>> +__naked __noinline __used
>> +static long subprog_call_mem_kfunc(long a, long b, long c, long d, long e, long size)
>> +{
>> +	asm volatile (
>> +		"r1 = *(u64 *)(r11 + 8);"	/* r1 = incoming arg6 (size) */
>> +		"r2 = 0x0807060504030201 ll;"	/* r2 = buf contents */
>> +		"*(u64 *)(r10 - 8) = r2;"	/* store buf to stack */
>> +		"r2 = r10;"
>> +		"r2 += -8;"			/* r2 = &buf */
>> +		"*(u64 *)(r11 - 8) = r2;"	/* outgoing arg6 = buf */
>> +		"*(u64 *)(r11 - 16) = r1;"	/* outgoing arg7 = size */
> [ ... ]
>
>> +__naked void stack_arg_precision_bpf2bpf(void)
>> +{
>> +	asm volatile (
>> +		"call %[bpf_get_prandom_u32];"
>> +		"r6 = r0;"
>> +		"r1 = 1;"
>> +		"r2 = 2;"
>> +		"r3 = 3;"
>> +		"r4 = 4;"
>> +		"r5 = 5;"
>> +		"if r6 < 2 goto l0_%=;"
>> +		"*(u64 *)(r11 - 8) = 4;"
>> +		"goto l1_%=;"
>> +	"l0_%=:"
>> +		"*(u64 *)(r11 - 8) = 6;"
>> +	"l1_%=:"
>> +		"call subprog_call_mem_kfunc;"
>> +		"exit;"
>> +		:: __imm(bpf_get_prandom_u32)
>> +		: __clobber_all
>> +	);
>> +}
> Could this lead to intermittent test failures?
>
> The test asserts a strict return value of 25:
>
> __success __retval(25)
>
> If bpf_get_prandom_u32() happens to return 0 or 1, the size argument is set to
> 6 instead of 4. In that case, bpf_kfunc_call_stack_arg_mem() will sum up 6
> bytes instead of 4, returning 36 instead of 25, which would cause the test to
> fail.

Yes, I will remove '__retval(25)'.


