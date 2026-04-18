Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BA11A6819
	for <sashiko@lists.linux.dev>; Sat, 18 Apr 2026 17:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776534378; cv=none; b=fRqVYa8/BThyButFtTkWvTO4IKzX2gPr1u826retB+A6MAewi+WW8TKfgOYOQTT4qyptPz2IbmJ6CmC08/iiPj9s7x0QMAgdMM4gA9lA5zm7vOyAovF3c0d3+2EfLn7Ovy0gIgAQCCQWLZk/0kHWOVsGbR+dcyVBU231MzcGKEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776534378; c=relaxed/simple;
	bh=pwEpyWxUNhyf++442CYqRyBd+8oitYrvg4wDdDuRfHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CFZUMqcIANJQiMbXqK33WTzSJ9Fs7S7s2idkKPdAP/nGvvFYs9jMOHX8QKaDbJiWMygqJQ0cg/4vlQ4Zl4lmGVk+a/Rk7b8uZK0Zriza32WPQM/MQOah98Eqxn+pWAD4d7cS+E2tIRT8Tm5JxwieMPCF2fYdQU+3CZ+1gYS+VZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=U7G7niWA; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="U7G7niWA"
Message-ID: <d316bb8a-0695-4328-8b9b-22271003dc40@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776534375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I4kURySKSFiQkb98uHflQW6Sf+AoWjNwWg/b21JYApA=;
	b=U7G7niWAU0hATIZfAWuuGH0AGSVSEpz0zjrTTWQBUllEP6HndVofXAcec/5O3QZePwySds
	D43XFcA3JkFbcBmOlZXTK1k3OiDt8pbMWC7KKDfKx+osPVddLo9a81lWsMnUw/S7ubSC5B
	bSea2r/TWep5rphdVnpKP++BEaRh+kE=
Date: Sat, 18 Apr 2026 10:46:08 -0700
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v5 11/16] bpf: Support stack arguments for kfunc
 calls
Content-Language: en-GB
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260417034754.2630932-1-yonghong.song@linux.dev>
 <20260417044047.63861C19425@smtp.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20260417044047.63861C19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 4/16/26 9:40 PM, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 3 potential issue(s):
> - [Critical] Precision tracking (`mark_chain_precision`) is incorrectly bypassed or misapplied for kfunc scalar arguments passed via the stack, allowing malicious BPF programs to bypass verifier safety checks through state pruning.
> - [High] `get_kfunc_arg_reg()` fetches lookahead stack arguments without bounds checking, leading to an out-of-bounds memory read or NULL pointer dereference when resolving memory sizes.
> - [High] Overwriting `insn->off` in `bpf_fixup_kfunc_call` destroys the BTF file descriptor index, breaking module kfunc calls on architectures that use JIT far calls.
> --
>
> commit 15b2d48bd7c1080e972b83211cc9794ac2ba763f
> Author: Yonghong Song <yonghong.song@linux.dev>
>
> bpf: Support stack arguments for kfunc calls
>
> Extend the stack argument mechanism to kfunc calls, allowing kfuncs
> with more than 5 parameters to receive additional arguments via the
> r11-based stack arg area.
>
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index 739c3127520c3..a3f307909e401 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
> [ ... ]
>
>> @@ -11653,6 +11659,19 @@ bool bpf_is_kfunc_pkt_changing(struct bpf_kfunc_call_arg_meta *meta)
>>   	return meta->func_id == special_kfunc_list[KF_bpf_xdp_pull_data];
>>   }
>>   
>> +static struct bpf_reg_state *get_kfunc_arg_reg(struct bpf_verifier_env *env, int argno)
>> +{
>> +	struct bpf_func_state *caller;
>> +	int spi;
>> +
>> +	if (argno < MAX_BPF_FUNC_REG_ARGS)
>> +		return &cur_regs(env)[argno + 1];
>> +
>> +	caller = cur_func(env);
>> +	spi = out_arg_spi(caller, argno - MAX_BPF_FUNC_REG_ARGS);
>> +	return &caller->stack_arg_regs[spi];
>> +}
> Does get_kfunc_arg_reg() need to verify that spi is within bounds and the
> stack slot is initialized?

The checking is below:

static bool is_stack_arg_slot_initialized(struct bpf_func_state *state, int spi)
{
         if (spi >= (int)(state->stack_arg_depth / BPF_REG_SIZE))
                 return false;
         return state->stack_arg_regs[spi].type != NOT_INIT;
}

                 if (i < MAX_BPF_FUNC_REG_ARGS) {
                         reg = &regs[i + 1];
                 } else {
                         /* Retrieve the reg state from the outgoing stack arg slot. */
                         struct bpf_func_state *caller = cur_func(env);
                         int spi = out_arg_spi(caller, i - MAX_BPF_FUNC_REG_ARGS);

                         if (!is_stack_arg_slot_initialized(caller, spi)) {
                                 verbose(env, "stack %s not properly initialized\n",
                                         reg_arg_name(env, argno));
                                 return -EINVAL;
                         }

                         tmp_reg = caller->stack_arg_regs[spi];
                         reg = &tmp_reg;
                         regno = -1;
                 }

spi has to be valid. Otherwise, verification will fail.

>
> When verifying pointer arguments that have a trailing size argument
> (KF_ARG_PTR_TO_MEM_SIZE), the verifier looks ahead at argno + 1. If a BPF
> program maliciously omits the stack size argument, could spi exceed
> caller->stack_arg_depth and lead to an out-of-bounds memory read?

If the bpf program maliciously omits the stack size argument,
btf_check_func_arg_match() should catch this and reject the program.

>
> [ ... ]
>
>> @@ -12394,9 +12435,11 @@ static int check_kfunc_args(struct bpf_verifier_env *env, struct bpf_kfunc_call_
>>   						reg_arg_name(env, argno));
>>   					return -EINVAL;
>>   				}
>> -				ret = mark_chain_precision(env, regno);
>> -				if (ret < 0)
>> -					return ret;
>> +				if (regno > 0) {
>> +					ret = mark_chain_precision(env, regno);
>> +					if (ret < 0)
>> +						return ret;
>> +				}
> Stack arguments use regno = -1, so it seems mark_chain_precision() is bypassed
> for scalar constants and size arguments passed on the stack.
>
> If precision tracking is bypassed, could the verifier's state equivalence logic
> consider states with different scalar values in these stack slots as equivalent
> and incorrectly prune them?

In this particular case, we know reg is a known constant, we can do
reg->precise = true.
Will fix.

>
> [ ... ]
>
>> @@ -20145,6 +20209,16 @@ int bpf_fixup_kfunc_call(struct bpf_verifier_env *env, struct bpf_insn *insn,
>>   	if (!bpf_jit_supports_far_kfunc_call())
>>   		insn->imm = BPF_CALL_IMM(desc->addr);
>>   
>> +	/*
>> +	 * After resolving the kfunc address, insn->off is no longer needed
>> +	 * for BTF fd index. Repurpose it to store the number of stack args
>> +	 * so the JIT can marshal them.
>> +	 */
>> +	if (desc->func_model.nr_args > MAX_BPF_FUNC_REG_ARGS)
>> +		insn->off = desc->func_model.nr_args - MAX_BPF_FUNC_REG_ARGS;
>> +	else
>> +		insn->off = 0;
> For architectures where bpf_jit_supports_far_kfunc_call() returns true
> (such as s390x, loongarch, and powerpc), they resolve the address later
> using bpf_get_kfunc_addr(), which requires the BTF file descriptor index
> stored in insn->off.
>
> If insn->off is overwritten here, could it destroy the BTF file descriptor
> index and break module kfunc calls during JIT compilation?
>
The JIT implementation has changed and the above is dead code. Will remove.

