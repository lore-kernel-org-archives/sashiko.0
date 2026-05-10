Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBEB39F19C
	for <sashiko@lists.linux.dev>; Sun, 10 May 2026 17:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778434349; cv=none; b=YeAwNgmGaJaz+76mQEeUwfwrkHrnAxA2sqfREyV9Bnw/Gdzyk6U0KBITTMLVBXqpMRfS/2PITyQYEGSYPu//J+e/cfyHeQgQuKWn+NgryqjL4l2lYLLhHdR4T8H9jlGu/6Nc9EeaEf66z/ww3IqM+/b3F87BWdgtAmBI3Cp5dX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778434349; c=relaxed/simple;
	bh=7GMnzWSaDNhd6/EV0b8rV2T4tn+XiXwnUD0komXA3ik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rhl4OwjIUWFyd50MncJFb7ugnuqqPbsFHUekMbVhIPUbJZVsAUowxfTMaDOqofDQcBBaouF+c+jkMiKNFVvl4/3jUFByu3+7JzncSJJBrUiGZuaj55fpR3CfONOGYt4579yY1dhvs96QVvkfpaAUuL+rUtYbeadLeVNPigmoCMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vKSrh0fU; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vKSrh0fU"
Message-ID: <03b6017c-b3a5-42ea-8b07-55b60d841d5d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778434346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2ml0BL4tw3ctbkSHF3iuPJfu2VttE/KYGtFWvRp3YGU=;
	b=vKSrh0fUu7+Py5D7jIIZSoyCodYa4QBhkj/ZZRdNtP/ynFWYQV2knlO3w4Th0Wn4fMRZxN
	3R2ws5OHWjMAvfIT9qffxiAu4C/KwBM8dph9sEHErpVj+2TSd68Ybhh63w/GG0umeSvdr5
	F8IeV3QJeqJfIuwTMme6DV0sJhprWkM=
Date: Sun, 10 May 2026 10:32:22 -0700
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2 22/23] bpf, arm64: Add JIT support for stack
 arguments
Content-Language: en-GB
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260507213201.1140284-1-yonghong.song@linux.dev>
 <20260509021523.D4469C2BCB0@smtp.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20260509021523.D4469C2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 5/9/26 4:15 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] In `emit_stack_arg_load()`, `bpf_off` is not negated, causing a negative index that fails array bounds checks and results in the JIT embedding an invalid instruction (BRK), leading to a kernel panic.
> --
>
> commit 6ccf042549a3902757c6335313c905e99fb41292
> Author: Puranjay Mohan <puranjay@kernel.org>
>
> bpf, arm64: Add JIT support for stack arguments
>
> This commit implements stack argument passing for BPF-to-BPF and kfunc
> calls with more than 5 parameters on arm64, following the AAPCS64 calling
> convention.
>
>> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
>> index 085e650662e3d..9b9d2501d2d36 100644
>> --- a/arch/arm64/net/bpf_jit_comp.c
>> +++ b/arch/arm64/net/bpf_jit_comp.c
> [ ... ]
>
>> @@ -1191,6 +1207,41 @@ static int add_exception_handler(const struct bpf_insn *insn,
>>   	return 0;
>>   }
>>   
>> +static const u8 stack_arg_reg[] = { A64_R(5), A64_R(6), A64_R(7) };
>> +
>> +#define NR_STACK_ARG_REGS	ARRAY_SIZE(stack_arg_reg)
>> +
>> +static void emit_stack_arg_load(u8 dst, s16 bpf_off, struct jit_ctx *ctx)
>> +{
>> +	int idx = bpf_off / sizeof(u64) - 1;
> Does this missing negation for bpf_off lead to an invalid instruction being
> emitted?

For stack argument load, the offset is positive number and it is multiple of 8.
So it should be okay here.

>
> Since BPF stack arguments use negative offsets from BPF_REG_PARAMS (such as
> -8 for arg 6), the calculation bpf_off / sizeof(u64) - 1 will result in a
> negative idx.
>
> Because NR_STACK_ARG_REGS uses ARRAY_SIZE, it evaluates to an unsigned
> size_t. Comparing a negative idx to it will result in a false condition,
> falling through to the else block.
>
> In the else block, the negative idx generates a negative offset for
> A64_LDR64I. Since A64_LDR64I expects an unsigned 12-bit scaled immediate,
> could this cause the instruction encoder to fail and embed an
> AARCH64_BREAK_FAULT into the JIT image?
>
>> +
>> +	if (idx < NR_STACK_ARG_REGS)
>> +		emit(A64_MOV(1, dst, stack_arg_reg[idx]), ctx);
>> +	else
>> +		emit(A64_LDR64I(dst, A64_FP, (idx - NR_STACK_ARG_REGS) * sizeof(u64) + 16), ctx);
>> +}
>> +
>> +static void emit_stack_arg_store(u8 src_a64, s16 bpf_off, struct jit_ctx *ctx)
>> +{
>> +	int idx = -bpf_off / sizeof(u64) - 1;
> For comparison, emit_stack_arg_store() correctly negates bpf_off here.
>
>> +
>> +	if (idx < NR_STACK_ARG_REGS)

