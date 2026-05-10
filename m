Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEE2CA4E
	for <sashiko@lists.linux.dev>; Sun, 10 May 2026 16:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778432388; cv=none; b=qD93WRj9lBBnpyF39VDrF+nYhwMvLORcLwuazvXF0D3qJqkvQS86ug94bQiaZrJ7a8sJPBOyXVBvD5x9UBz5AFcvA2MvDd3cnRR+Ec3zx7rXm2gRr9zfzUF1kWvnZMDDXkvmhNAjFYfMWgEjo5kkGCDgu5w5tz9svvTXZfnuEAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778432388; c=relaxed/simple;
	bh=wETI/iYqob9fkIb4mHhKxEcnenADbiMO06v2rPRjRAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k4HRERkEZwAVa6ZgDkL1gOK3Q8dzGCW/hGhWATQf5iO/z2UxMLjEsozezXev39hNVSy/fFalp+dMJMHTHHhgzmnvioYXHQ4B9c2ejzE86TWXoBXCmoZ3XixqGD6HVtWLSJR4V7l0Oe9Bs/EpeT8Cbrbb19zZPX+e1THP5f2F6Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wEpgjdO8; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wEpgjdO8"
Message-ID: <53bab373-86dc-4f53-8b24-2ec41b356988@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778432384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q0kcWZjEYBFdgGc4FOP6W2OOOGdOOxeLvCH+TOr0OGo=;
	b=wEpgjdO8VYCThj1o3+yl34vkgSYM/GgLthGWppDtI7lp3VaxNYychi+LYDYtXuG8TnSbi3
	QSspHzkM2A3Z5CSBTT+rBPnNNzYbi58YokEKkLGCNHK6164VNdBChMHWr6b94hqP3j9daj
	5iDE6TC2oMc5XcESY9NoHmryJ4tuw2c=
Date: Sun, 10 May 2026 09:59:39 -0700
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2 10/23] bpf: Reject stack arguments in
 non-JITed programs
Content-Language: en-GB
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260507213034.1130443-1-yonghong.song@linux.dev>
 <20260509021019.9F580C2BCB0@smtp.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20260509021019.9F580C2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 5/9/26 4:10 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The BPF verifier fails to reject the interpreter for a main program (i = 0) with stack arguments, leading to an uninitialized memory read of R11.
> --
>
> commit 4a48796d8e4e4607bc163fc6b59a84f3495c3d5c
> Author: Yonghong Song <yonghong.song@linux.dev>
>
> bpf: Reject stack arguments in non-JITed programs
>
> This commit aims to prevent non-JITed programs from running if they use
> stack arguments, since the BPF interpreter does not populate the register
> used for stack arguments (R11). It updates the runtime selection and fixups
> phases to reject such programs.
>
>> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
>> index ae10b9ca018df..6f94b0ef3659f 100644
>> --- a/kernel/bpf/core.c
>> +++ b/kernel/bpf/core.c
> [ ... ]
>> @@ -2599,7 +2599,7 @@ struct bpf_prog *__bpf_prog_select_runtime(struct bpf_verifier_env *env, struct
>>   		goto finalize;
>>   
>>   	if (IS_ENABLED(CONFIG_BPF_JIT_ALWAYS_ON) ||
>> -	    bpf_prog_has_kfunc_call(fp))
>> +	    bpf_prog_has_kfunc_call(fp) || fp->aux->stack_arg_cnt)
> Is fp->aux->stack_arg_cnt guaranteed to be initialized at this stage?

I would say yes. The main program is coverred in bpf_jit_subprogs():

         if (env->subprog_cnt <= 1) {
                 env->prog->aux->stack_arg_cnt = env->subprog_info[0].stack_arg_cnt;
                 return 0;
         }

For >= 2 number of subprogs, the stack_arg_cnt will set up in jit_subprogs().

>
> If JIT is disabled system-wide (e.g. sysctl net.core.bpf_jit_enable=0),
> bpf_jit_subprogs() is skipped, leaving the count at 0. Furthermore, even if
> JIT is enabled but the program has multiple subprograms, bpf_jit_subprogs()
> only populates the cloned subprograms' auxiliary data, leaving the main
> program's prog->aux->stack_arg_cnt as 0.
>
> Could this allow the check to be bypassed for the main program?

If JIT is disabled, we have

         for (i = 1; i < env->subprog_cnt; i++) {
                 if (bpf_in_stack_arg_cnt(&env->subprog_info[i])) {
                         verbose(env, "stack args are not supported in non-JITed programs\n");
                         return -EINVAL;
                 }
         }

So for any subprog having >5 arguments, interpreter will not run.

For main program, the above env->prog->aux->stack_arg_cnt later will
be used in core.c to decide whether interpreter can run or not.

>
>>   		jit_needed = true;
>>   
>>   	if (!bpf_prog_select_interpreter(fp))
>> diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
>> index 0ff8cdf4394f4..4c630d97eaade 100644
>> --- a/kernel/bpf/fixups.c
>> +++ b/kernel/bpf/fixups.c
> [ ... ]
>> @@ -1412,6 +1412,12 @@ int bpf_fixup_call_args(struct bpf_verifier_env *env)
>>   		verbose(env, "calling kernel functions are not allowed in non-JITed programs\n");
>>   		return -EINVAL;
>>   	}
>> +	for (i = 1; i < env->subprog_cnt; i++) {
> This loop explicitly starts at i = 1, which skips checking the main program.
>
> If an extension program (BPF_PROG_TYPE_EXT) attaches to a function with more
> than 5 arguments and has BTF_FUNC_STATIC linkage, it will inherit the incoming
> stack arguments. Since the check in core.c might fail to catch the main
> program due to the uninitialized stack_arg_cnt, can this extension program
> bypass both rejection mechanisms and fall back to the interpreter?

Currently, BPF_PROG_TYPE_EXT programs does not support more than 5 arguments.

>
>> +		if (bpf_in_stack_arg_cnt(&env->subprog_info[i])) {
>> +			verbose(env, "stack args are not supported in non-JITed programs\n");
>> +			return -EINVAL;
>> +		}
>> +	}
> If the main program bypasses these checks and is run by the interpreter, it
> will attempt to read incoming stack arguments from regs[11]. Because the
> interpreter's setup in ___bpf_prog_run() only initializes R1-R5 and the frame
> pointer, would reading regs[11] leak uninitialized kernel stack memory or
> cause a crash if the uninitialized value is dereferenced as a pointer?

In the new revision, we will have

@@ -18160,8 +18347,11 @@ static int do_check_common(struct bpf_verifier_env *env, int subprog)
                  */
                 if (env->prog->aux->func_info_aux) {
                         ret = btf_prepare_func_args(env, 0);
-                       if (ret || sub->arg_cnt != 1 || sub->args[0].arg_type != ARG_PTR_TO_CTX)
+                       if (ret || sub->arg_cnt != 1 || sub->args[0].arg_type != ARG_PTR_TO_CTX) {
                                 env->prog->aux->func_info_aux[0].unreliable = true;
+                               sub->arg_cnt = 1;
+                               sub->stack_arg_cnt = 0;
+                       }
                 }

In this case, stack_arg_cnt = 0 means incoming stack argumnet cnt is 0, so
any reading incoming stack arguments will cause verification failure.

>
>>   	if (env->subprog_cnt > 1 && env->prog->aux->tail_call_reachable) {
>>   		/* When JIT fails the progs with bpf2bpf calls and tail_calls
>>   		 * have to be rejected, since interpreter doesn't support them yet.

