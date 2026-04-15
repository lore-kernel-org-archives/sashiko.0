Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541C527F75C
	for <sashiko@lists.linux.dev>; Wed, 15 Apr 2026 16:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776269003; cv=none; b=naUI1AyciJBpgI/66WNZ7AUue73b0tCgsxt21rwaZbnkW+V73JbgiuOjH0ziRLhRme/pwYIztKvCIEWCeQ0n1byfTll4Dhs56W+cGokMYE+vC4fH9Qykt9kYNE3GGndEWLxagwnSV9XZ5kage7zS5mmjfVaDbrLeWEI4ct2x7jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776269003; c=relaxed/simple;
	bh=RERTq8I3MIF1yMkiB6wZkHJkgJHv+ltcECYK8aKlT20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PGno1Qx65F6WvZQfSodAnXGr3JJXucV6+ey101G7EBK4fpUfpiCTr3QwP5jPKRk8j27hJhvjTqp6Vnr2eKH2BBwnM+S8RjhtklfabypeXF9/KPrvE5XfXOEhI6DxcPsGRnXXoKnEGZFHm1EBZUB+ZE9eFG/YFPfKlkj+7amgKNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PjgnEiD3; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PjgnEiD3"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d734223e4so2488649f8f.0
        for <sashiko@lists.linux.dev>; Wed, 15 Apr 2026 09:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776269001; x=1776873801; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6aoMj0PyvdjaOSOF6R9+rApmF70RjoEgTTBHQu7dCmw=;
        b=PjgnEiD3Ut0hdgs7Reh4OyLRPquwHO+S763SxvLffWMep9jRKjnfw7LLSuwDdEPU0S
         3Y2Je+EeHGn268a8mFBlonmMPUps+LCKCBHuy6h3yOfFngV0Zxt2pTIG71zRqTMYUTXt
         2RCXr0d3iiAlMNLuT7rmgllZT1Ix53mpaN0+P+KtVu40mbZd/IQHM3BMQ1RpiEFnAiKb
         1hXr69ZroOkEaQLC6MiKIbqhFe1bD+KHsxCHH2wAjLfi790q2duiDsv7cDcxwiggHVwq
         rcCH+DA7RnK51OVSIe7X2w1VnP1mgfjMNoTntZWn41bJ8qAmImcJPl1dtSuXl7cIz7oH
         PULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776269001; x=1776873801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6aoMj0PyvdjaOSOF6R9+rApmF70RjoEgTTBHQu7dCmw=;
        b=TEy55heb72IxEH+wkxRZN56/WvAyy+XmPiKv/djLUnNmPXWODtb5UdI3ygkoKfbK3L
         u0sAHU16z7dD3ke2HrHA9sFZCHs3lIaHG9EILLn90G4XdCUECPv4DDfRVlGUfBjoZyBV
         iOINpWZzfZbMmXs1Jqy8JgUeCD1NttTG1CUDQLIINRAgC+fkg5IqqoZdrTm0hyhjOBEI
         xSBEryYVs9W7H7jJbFk+3SLM/X2kHwC4AOO2ibHZ0b0gBT8FvQ4kflRD53R7ZC0aT3Yg
         ta9Wt/s8t4gEBGcjgQ9jRl5PjHfoce/CxntnD0KH3/qI/IMHXR75fH0es+OlItITaBlh
         OKdQ==
X-Gm-Message-State: AOJu0YxscBGK6yaSUIbyts6HDc4MywMGgHjsQkj25kQS5u8MAJ9qOjh0
	XPjYgIoEnxcm0ELNl7xNgekAIEDR7mF19j1akiNwuhmP4CqSUWzo1iaCa1iDC+47KEA=
X-Gm-Gg: AeBDieuEBTKMkqp75xIVLFcsRjuyXtG9Fm18fRscZCojvHFasktEqs7pNj16SdWRDtl
	3u83DbNnZXnLOrSRzCS56UvmS3uolFawcsv9zpPF+7Ebsh55StUWfi5bsbtN/V+Osf7tGHXRG5g
	ojo9r6an6Ul8JyPRCXEzUeBMnLBEKi38m9RrYzLaGHlz8tP/3ydTj4b+JGcFz4d7L8Nz1J7+qd7
	Kn0nQzs3CmXRh1jX+4u8p/tv5oj4BnKhWca3pHTBJfIXyoqI65jsZsWqGGAR/B6ks3Gv9b5iHiC
	HHRK+CZogtvnL8RhkFpJ9NU+aNxeQ7nHwZKgV7lQ7MyJniHtPbLUuCQczGanLemTghRgKhYKAZk
	ZIBqYRz9jcpzrz9nc1AtP/Mn+M0auejrfhgHHMV7TZPRvdvK4ixU1brI4vaYn+UD8dG1nboAh1J
	IGigy414UDLqqMpxrmwOxnUibGDDfEE8F4aywLBJ2dTfuGfsIDCYmQi4PlTBv5
X-Received: by 2002:a05:6000:4205:b0:43d:772d:2b61 with SMTP id ffacd0b85a97d-43eb10ceeadmr19592f8f.15.1776268999156;
        Wed, 15 Apr 2026 09:03:19 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:cbe8:6434:118f:886d? ([2620:10d:c092:500::5:3ecd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5f06sm6539936f8f.17.2026.04.15.09.03.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 09:03:18 -0700 (PDT)
Message-ID: <235f4a5d-c5fc-4980-a075-284e966c4fc6@gmail.com>
Date: Wed, 15 Apr 2026 17:03:17 +0100
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 5/6] selftests/bpf: Test BTF sanitization
 rejection for invalid vlen
To: sashiko@lists.linux.dev, Alan Maguire <alan.maguire@oracle.com>
Cc: bpf@vger.kernel.org
References: <20260414195019.684531-6-alan.maguire@oracle.com>
 <20260414222624.A722AC19425@smtp.kernel.org>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20260414222624.A722AC19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/14/26 11:26 PM, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 3 potential issue(s):
> - [Low] Leaking the BTF object on unexpected success of sanitization.
> - [Low] Lack of error checks for BTF construction calls.
> - [Low] Using `BTF_MAX_VLEN` as the `byte_sz` argument in `btf__add_datasec()`.
> --
> 
> commit 9c5af444155b34aa840793bf185bc0c0aaa04f3f
> Author: Alan Maguire <alan.maguire@oracle.com>
> 
> selftests/bpf: Test BTF sanitization rejection for invalid vlen
>      
> This patch adds a selftest to verify that BTF objects with extended vlen
> are properly rejected by kernels that do not support the extended feature.
> It simulates the lack of support using the feature cache and checks if
> sanitization fails when the vlen limit is surpassed.
> 
>> diff --git a/tools/testing/selftests/bpf/prog_tests/btf_sanitize.c b/tools/testing/selftests/bpf/prog_tests/btf_sanitize.c
>> index 652b51efafc27..f41cea5a769a2 100644
>> --- a/tools/testing/selftests/bpf/prog_tests/btf_sanitize.c
>> +++ b/tools/testing/selftests/bpf/prog_tests/btf_sanitize.c
> [ ... ]
>> @@ -95,3 +95,65 @@ void test_btf_sanitize_layout(void)
>> +static void test_btf_sanitize_extended(void)
>> +{
> [ ... ]
>> +	btf = btf__new_empty();
>> +	if (!ASSERT_OK_PTR(btf, "empty_btf"))
>> +		goto out;
>> +	btf__add_int(btf, "int", 4, BTF_INT_SIGNED);
>> +	btf__add_var(btf, "var1", 0, 1);
> 
> Are we missing error checks on these btf__add_*() calls?
> 
> If any of these allocations silently fail, the test might proceed with an
> incomplete BTF object that hasn't actually surpassed the vlen limit. This
> would cause the subsequent bpf_object__sanitize_btf() call to unexpectedly
> succeed, failing the test for the wrong reason.
> 
>> +	btf__add_datasec(btf, "datasec1", BTF_MAX_VLEN);
> 
> Is it intentional to use BTF_MAX_VLEN for the byte_sz argument here?
> 
> BTF_MAX_VLEN is a bitmask representing the maximum number of items, not a byte
> size. Using a proper calculated byte size like 0x10000 * 4 might be clearer.
> 
>> +	for (i = 0; i <= 0xffff; i++)
>> +		btf__add_datasec_var_info(btf, 2, i * 4, 4);
>> +
>> +	/* Sanitization should fail here as vlen surpasses unextended limit. */
>> +	sanitized = bpf_object__sanitize_btf(skel->obj, btf);
>> +	if (!ASSERT_ERR_PTR(sanitized, "bpf_object__sanitize_btf_should_fail")) {
>> +		sanitized = NULL;
> 
> If the first bpf_object__sanitize_btf() call unexpectedly succeeds, sanitized
> will hold a valid pointer.
> 
> Doesn't setting it to NULL before the goto out path leak the memory, since
> btf__free(sanitized) will be called with a NULL pointer at the end of the
> function?
> 

This is no leak, but setting to NULL is not needed, because btf__free() 
checks IS_ERR_OR_NULL(btf).

>> +		goto out;
>> +	}
>> +	/* Now switch extended feature on and ensure success. */
> 

