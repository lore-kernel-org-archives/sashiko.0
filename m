Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFA23E314D
	for <sashiko@lists.linux.dev>; Wed, 15 Apr 2026 15:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776268112; cv=none; b=Af3YPWNAgBqQY16Yj8hw8ky5xhpg1jekffurcr21iCLa6Ku5naEzOP8SF1I16J5bffqfUmB0uexwYi3XE7hamV4FzB2lWDkDAj+X/HKqmnhdL62d5FL1iyN5JF+u/0avQrbBu9kU7EHNt4i12WHdSzB1l/kN9TwXP6mOk6kV/58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776268112; c=relaxed/simple;
	bh=4U+lGXzdrqaxB/1sHdVpDCnsS8PBYriLa1JgIX2Uijw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AHmYGQ2XVULhcVMo3pfRBtzNsyNeAqWc7hrhWQb6ihd7ueNGfp0/d7qq0sQgLgdpogIOIsHpwzfeZQBmmAY3Ui4xZRWbrbEr6SAU9wkHl7HsJwcypfJv73apjWTJbyW3iH/JYsrlecwVM/m+4Xp0jxLeX/8lhP1WUF88ZgVQl64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JU4Nj2xw; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JU4Nj2xw"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso84508275e9.1
        for <sashiko@lists.linux.dev>; Wed, 15 Apr 2026 08:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776268106; x=1776872906; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HynLTqHYNy+686QPoe/hx3nOpHjVAP0O5bTsZ35kxyk=;
        b=JU4Nj2xwMj3XTsIjCqQbpnr5CP3WMaSlOOmPz4xGxStGgIPRnk6x/ldV7ZUPy4U96Y
         5Fkqi5BHZDnnrSAiUVsk9gYuItmDDt4nu/JR8pR8n/mB9HPH4R7VaG9JHMNwOKuub1v/
         Cq/Psul+LvmlhgntdWpsqsoUNKNa1xSj00Ar6Oc25nggQH3KNYj3CKgi9CclnDNbW1+q
         0RCjpzXh7Cji+/pMC7O7aZBVIzJiIIQa9U2hcQ6EGGhvMrkFWUO7ztUS67YtwUzddxjm
         w/WCshNkUbDdEubglxK1G7OX1P/8+xs8P3TaPQDTCjLe/2PqeKejRL9R4n5twstliIM4
         Psrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776268106; x=1776872906;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HynLTqHYNy+686QPoe/hx3nOpHjVAP0O5bTsZ35kxyk=;
        b=MxM5ayOLC3Sz0VBbwhBRE/z0n/+y4B583PV779GVmMUgBTva7LgeuqJXG85yO/3Ur1
         SOyicEd/m5ko3qFxKCpO9xZV7kbKplgPpA9owTnSequZRrsgFuHj5Fh7zndzBSF/P5ww
         Lpg2OloHFW29CR4dVtUxtrPqZav1rT75RkO9OMHUvW+THckhOD3V3PWVZWxM36Fmbv9/
         z1Pi1XxmdvsqdIWSuI4zQEhCzOSPGwhzfGNdxtXly6ZhZQ5IMnkTwZV2VtO2J6b0Sef3
         RcwGNNDvZgBqtkfu7VTgGaIH9sgQDikNBqJIDH1F0iJ9/IzAvIHlFlKYuRuH42iypcA4
         pu9Q==
X-Gm-Message-State: AOJu0YwjimZOJND5O2Y8Ju2h2TSKtHClZQnTwjzUwt/H3veJ8hT7a1wr
	CrcobIJbbsjIeexwy+QV0uh7BOXaKT2rNnTmCHbn3TpWC4QVPKZnSzpIxfTCPk96+/Q=
X-Gm-Gg: AeBDievXP0A5xUCespeJN04IvOE4oPgOHvIS2pIErR3X+FrIMolTITdvKHAP0iy2JPx
	lIeDYkL76H5UMn14Q3MB19bAkS6A2Jb25Aj9B62dCsAHJNkgf6m+z0ICa+I1B5BqNWgXSa1ssWa
	mdwFOuU2Af8dOESLmXXzAiOIBVNKsNDyaLOEEE3sGXMJL3GJVchKg0Sl8Ng9xKF7IwT5SQVbcU0
	/zCn25tASHbTfcDF8oZG36JjG97x+pZuhncTMsGMxrf6NSv0wNLUs9haE+fxLJkLmgXSonMxe58
	hq+TIRXD5hpT8q09N6nq+9C/HAKLNaasKy/s8SQY+X77AnnGJVMwXvmx3rtR12ETtbawBrwiVFf
	UoSb16gBfjg4Xm01MOx0mb7l/jH0vDGuSZ7i0c137r2g85XeW9cnLcaExiCUcHFmvHXfJr0qock
	zJwyGXZDsYBA9Uvxsa1abaXrQWRrOleBN61z6exXPkanEoRYvEwXF2RlH2Jtis
X-Received: by 2002:a05:600c:2d47:b0:488:dfbc:490c with SMTP id 5b1f17b1804b1-488dfbc4b2cmr143916905e9.16.1776268106031;
        Wed, 15 Apr 2026 08:48:26 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:cbe8:6434:118f:886d? ([2620:10d:c092:500::5:3ecd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f4352af8sm4364775e9.0.2026.04.15.08.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 08:48:25 -0700 (PDT)
Message-ID: <e41d94d4-bbef-4d04-a6ef-8f885aab9b72@gmail.com>
Date: Wed, 15 Apr 2026 16:48:24 +0100
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 1/6] bpf: Extend BTF UAPI vlen, kinds to use
 unused bits
To: sashiko@lists.linux.dev, Alan Maguire <alan.maguire@oracle.com>
Cc: bpf@vger.kernel.org
References: <20260414195019.684531-2-alan.maguire@oracle.com>
 <20260414211101.59F73C19425@smtp.kernel.org>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20260414211101.59F73C19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/14/26 10:11 PM, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 2 potential issue(s):
> - [High] The `env_stack_set_next_member()` helper takes a `u16` argument, which truncates the new 24-bit BTF `vlen` and causes an O(N^2) infinite-loop-like CPU lockup (Denial of Service).
> - [Medium] UAPI Source Breakage: Converting `BTF_MAX_*` macros to `enum btf_max` removes preprocessor macros, breaking existing userspace compilation.
> --
> 
> commit d88c0688f1be53ae1871dacf198a4a18b2e56ae0
> Author: Alan Maguire <alan.maguire@oracle.com>
> 
> bpf: Extend BTF UAPI vlen, kinds to use unused bits
> 
> This commit expands the BTF maximum vlen from 16 bits to 24 bits, allowing
> up to 16 million members. It also extends the BTF kind encoding from 5 to 7
> bits, and converts the BTF_MAX_* constants to an enum to expose them in
> kernel BTF.
> 
> Link: https://lore.kernel.org/bpf/CAEf4BzZx=X6vGqcA8SPU6D+v6k+TR=ZewebXMuXtpmML058piw@mail.gmail.com/
> 
>> diff --git a/include/uapi/linux/btf.h b/include/uapi/linux/btf.h
>> index 638615ebddc22..618167cab4e61 100644
>> --- a/include/uapi/linux/btf.h
>> +++ b/include/uapi/linux/btf.h
>> @@ -33,20 +33,22 @@ struct btf_header {
>>   	__u32	layout_len;	/* length of layout section	*/
>>   };
>>   
>> -/* Max # of type identifier */
>> -#define BTF_MAX_TYPE	0x000fffff
>> -/* Max offset into the string section */
>> -#define BTF_MAX_NAME_OFFSET	0x00ffffff
>> -/* Max # of struct/union/enum members or func args */
>> -#define BTF_MAX_VLEN	0xffff
>> +enum btf_max {
>> +	/* Max possible kind */
>> +	BTF_MAX_KIND =		0x0000007f,
>> +	/* Max # of type identifier */
>> +	BTF_MAX_TYPE =		0x000fffff,
>> +	/* Max offset into the string section */
>> +	BTF_MAX_NAME_OFFSET =	0x00ffffff,
>> +	/* Max # of struct/union/enum members or func args */
>> +	BTF_MAX_VLEN =		0x00ffffff,
>> +};
> 
> Could replacing these #define macros with an enum break existing userspace
> applications?
> 
> Programs using #ifdef BTF_MAX_VLEN or evaluating #if BTF_MAX_VLEN == ...
> for conditional compilation will fail to build without the preprocessor
> macros.
> 
> Would it be better to redefine the macros alongside the enums
> (e.g., #define BTF_MAX_VLEN BTF_MAX_VLEN) to maintain UAPI backward
> compatibility while still exposing the constants to BTF?
> 

Looks like this is done on purpose and we don't expect anyone actually 
use #ifdef BTF_MAX_VLEN, so it's an acceptable change.

> [ ... ]
> 
>> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
>> index a62d785812076..1663970fc1bf6 100644
>> --- a/kernel/bpf/btf.c
>> +++ b/kernel/bpf/btf.c
>> @@ -289,7 +288,7 @@ enum verifier_phase {
>>   struct resolve_vertex {
>>   	const struct btf_type *t;
>>   	u32 type_id;
>> -	u16 next_member;
>> +	u32 next_member;
>>   };
> 
> Does the env_stack_set_next_member() helper also need its next_member
> argument updated to u32?
> 
> Looking at env_stack_set_next_member() in kernel/bpf/btf.c:
> 
> static void env_stack_set_next_member(struct btf_verifier_env *env,
> 				      u16 next_member)
> {
> 	env->stack[env->top_stack - 1].next_member = next_member;
> }
> 
> Since the argument is still u16, won't this silently truncate the i + 1
> index for any struct or datasec member beyond 65,535?
> 
> If this happens, when the verifier resumes resolution of the struct, could
> it restart from the truncated index and redundantly iterate over
> already-resolved members? With a very large number of members, could this
> cause excessive CPU usage or soft lockups?
> 

