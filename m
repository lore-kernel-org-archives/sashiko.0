Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656283AD500
	for <sashiko@lists.linux.dev>; Fri,  8 May 2026 23:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778281436; cv=none; b=tltgBJvTuUjdQDHOKWJGxZgGsZk97KlOjpcRmQv/PrHCnHVLNAtB6mk0jLNCVM0MfHKMzLJN0iKPIEbSAd+G4REYYq99NQsU62BMqrRPLeNGpAtqADVpLMFQgY7TDUOhfxcDxbmzUU9Pczf0ISM3lDaLap19pBE7rBu+YlPLZjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778281436; c=relaxed/simple;
	bh=SHxByHZQmT4UGrzaS26bXhPeiR30fEZjj+wWb9WI66k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fq30asj7hrAwDb0L1jcDNHvJAZMPAR7Hh0Xpt5kotxg4/97IEIwP3fHXMldK4jrXNUQS/694LF0apr5UnYJ3+rFaWSNJhdQrm35g80PV+zpB3XNRH+z0LA2g29qwlYAVU+i/NMrxzBuowbAXdNxd02erYpl3ZdyrnkFBHvBU3P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIKY8Pif; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIKY8Pif"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b7d3ecc10dso24234265ad.2
        for <sashiko@lists.linux.dev>; Fri, 08 May 2026 16:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778281435; x=1778886235; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E5VVY1EE6OCfiIdGNty7YuXQqh1L1/YOFUIxh8m6Zvc=;
        b=XIKY8PiffA29NT7I8yvo8cdOSWo/tCPsw11jXmpvoEL1vq02BPA3tOjvnfCgDG1HUF
         UV8NwI1wwBkPJvhLwrY4DX/egSUZkrsTG9hC8SXaxkcQJzB9eYBT2RNs75JtERWXrfZo
         +q0P0tKCBhAJzjN79pT5DUNK8wBfkJSYxAPVDk+355hqAPg0lgTErlSel8e12BwlUiiX
         LixFjfKt2WLR9ZFz2X08iKOXI+uGGQe5HlQ2ySfwbLEozZqvHJCzdTIdz95kazozOQ6e
         X9F/NpGZBLOI9186TyHV3lluuEQY43kUf00dcFgLcX68Xd0rJLaOIvw3x8d5KeKItUiD
         fs4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778281435; x=1778886235;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E5VVY1EE6OCfiIdGNty7YuXQqh1L1/YOFUIxh8m6Zvc=;
        b=jXANYYr6Yw1ukbb1qUwqv6STJevU5ayRjlCkzcIWnNhSXvyxEWKzrIAWyCVZpxJQDg
         YLFbrCMHz7fjjBsljY1jzfduDqUaSkJT109DQpx15q1yTs3lNmiS7iNfkpIEiNbE58yn
         NWLRAg5K63XkoXKjbhrgpUnfEC54Iu4b91anm3K7yVu5LOmvvaJnTRpjSTL7Qe3vi4Hr
         edw5cPVUjQVp11/lHpOp/9s76qCytNL/O4PwGVh1PM5EHhG7P7HygIAyB46vLnSqJcdG
         v1dDtpH1fBINRg18quw0dCCX0tyWyfpSPDF6+TMxL80rWk+eER6D8IIccSacDcD7456y
         sg9A==
X-Forwarded-Encrypted: i=1; AFNElJ/nFRXX+pz47rnlvWyBYyru6lPfqUimUIZS9rphSj2R5DOYBELeynAX9syYv8TDV5WFe4gLwny5@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1r9O8K5hzi6Y1H6+rWxYL6mgS9yfU0/zARDfZwVp73Xva2+31
	tD/AWOQ9Vdc1OUyeBBc4XzaIb/+7XmegdXm8td43pkvc/OGY6j14SOsF
X-Gm-Gg: Acq92OFAgfcuBBpjpJQA2psAqG/S8c7lMI6NC1VxSR0w7pXTAsSz8A6qOqT37hBN9+5
	3a4tJPz888oQstg0P5WHrsoJmOCU0m7gbM+FCqGoqO1htFxC5VzaAMPp0HSR1Hj60FxyWhdEuHi
	ufTuDTL47s3XTbNkQp3aW3Fjz0NrFTJA4Abl3pSPaouWMzyCcvwSqrbUKTa7g7nKBK/kYCycHqa
	r32opxp5dDnmVmhJuPwR8FnTnx94knXFFOJL8y1mExzViLyEbkvzs2QHMpdaGDldgNdUHUq1yB+
	h3DDLP+TZBzD+W7YWEkU7yn+8f4zed/pW0NCQwillSOezm6Yb0o9+kbr0VzLWySN+TWRoVboy+6
	UyHWY8xhH+ewBdfLpLfQ1I6IeWbEOrs9BOLwREEJCK86jyv/vPotP5NbgbBsT7Wq59jIHUmP+YY
	0mHkQ3BIp6zOFTpeMwcoObIZ5DV7nw8s43Q1u8RA==
X-Received: by 2002:a17:903:2c0d:b0:2b2:42da:25cb with SMTP id d9443c01a7336-2bc7aa11bc7mr1368075ad.19.1778281434605;
        Fri, 08 May 2026 16:03:54 -0700 (PDT)
Received: from ?IPV6:2604:3d08:9582:1100::c7c9? ([2604:3d08:9582:1100::c7c9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d52ef9sm33484415ad.35.2026.05.08.16.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 16:03:54 -0700 (PDT)
Message-ID: <8bd97ad9-5b28-47d2-9e84-5be4adea481e@gmail.com>
Date: Fri, 8 May 2026 16:03:53 -0700
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 05/19] unwind_user/sframe: Add support for reading
 .sframe contents
To: Jens Remus <jremus@linux.ibm.com>, Steven Rostedt <rostedt@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>
Cc: bpf@vger.kernel.org, sashiko@lists.linux.dev
References: <20260505121718.3572346-6-jremus@linux.ibm.com>
 <20260505185932.C708CC2BCB4@smtp.kernel.org>
 <4e5d51f0-8f4c-4a07-9141-8b26d2c90fc6@linux.ibm.com>
Content-Language: en-US
From: Indu Bhagat <ibhagatgnu@gmail.com>
In-Reply-To: <4e5d51f0-8f4c-4a07-9141-8b26d2c90fc6@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-05-06 07:34, Jens Remus wrote:
> On 5/5/2026 8:59 PM, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
>> - [Critical] Division by zero in `__find_fre` when `fde->rep_size` is 0.
>> - [High] `mtree_insert_range` is called with an exclusive end boundary, preventing contiguous SFrame sections.
>> - [High] Unbounded linear search over user-controlled memory in `__find_fre` can cause hard lockups in atomic context.
>> - [High] Integer overflows in SFrame header parsing allow bypass of bounds checks on 32-bit architectures.
>> - [Medium] Generic SFrame unwinding code uses `unsafe_get_user()` for unaligned accesses, breaking strict-alignment architectures.
>> --
>>
>> commit 159c92acf3c961aecc6383f6c3f35a955591abf3
>> Author: Josh Poimboeuf <jpoimboe@kernel.org>
>>
>> unwind_user/sframe: Add support for reading .sframe contents
>>
>> This commit adds support for reading .sframe section contents to facilitate
>> user space stack unwinding. It introduces the sframe_find() interface which
>> uses user_read_access_begin() and unsafe_*() accessors for performance.
>> Support is included for SFrame V3, internal FDE representations, and
>> PC-relative offsets.
>>
>> Link: https://lore.kernel.org/all/77c0d1ec143bf2a53d66c4ecb190e7e0a576fbfd.1737511963.git.jpoimboe@kernel.org/
>> Link: https://lore.kernel.org/all/b35ca3a3-8de5-4d32-8d30-d4e562f6b0de@linux.ibm.com/
>>
>>> diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
>>> index fdb2a49085638..c60aa527984a1 100644
>>> --- a/kernel/unwind/sframe.c
>>> +++ b/kernel/unwind/sframe.c
>>> @@ -15,9 +15,338 @@
>>>   #include <linux/unwind_user_types.h>
>>>   
>>>   #include "sframe.h"
>>> +#include "sframe_debug.h"
>>
>> [ ... ]
>>
>>> +static __always_inline int __read_fre(struct sframe_section *sec,
>>> +				      struct sframe_fde_internal *fde,
>>> +				      unsigned long fre_addr,
>>> +				      struct sframe_fre_internal *fre)
>>> +{
>> [ ... ]
>>> +	if (fre_addr + addr_size + 1 > sec->fres_end)
>>> +		return -EFAULT;
>>> +
>>> +	UNSAFE_GET_USER_INC(ip_off, cur, addr_size, Efault);
>>
>> Will this cause alignment faults on architectures with strict alignment
>> requirements?
>>
>> The .sframe format uses packed structures and variable-length datawords. The
>> cur pointer might be unaligned here, and UNSAFE_GET_USER_INC() performs
>> 16-bit or 32-bit reads via unsafe_get_user().
> 
> IIUC this should not be an issue for x86-64, s390, and arm64.
> 
>> [ ... ]
>>
>>> +static __always_inline int __find_fre(struct sframe_section *sec,
>>> +				      struct sframe_fde_internal *fde,
>>> +				      unsigned long ip,
>>> +				      struct unwind_user_frame *frame)
>>> +{
>>> +	unsigned char fde_pctype = SFRAME_V3_FDE_PCTYPE(fde->info);
>>> +	struct sframe_fre_internal *fre, *prev_fre = NULL;
>>> +	struct sframe_fre_internal fres[2];
>>> +	unsigned long fre_addr;
>>> +	bool which = false;
>>> +	unsigned int i;
>>> +	u32 ip_off;
>>> +
>>> +	ip_off = ip - fde->func_addr;
>>> +
>>> +	if (fde_pctype == SFRAME_FDE_PCTYPE_MASK)
>>> +		ip_off %= fde->rep_size;
>>
>> Can a malicious user provide an SFrame section with a rep_size of 0?
>>
>> Since fde->rep_size is populated directly from the user-provided
>> _fda.rep_size without validation, a 0 value here would trigger a
>> divide-by-zero exception and a kernel panic.
> 
> Good catch!  I would add a check in __read_fde():
> 
> diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
> @@ -67,6 +67,7 @@ static __always_inline int __read_fde(struct sframe_section *sec,
>          unsigned long fde_addr, fda_addr, func_addr;
>          struct sframe_fde_v3 _fde;
>          struct sframe_fda_v3 _fda;
> +       unsigned char fde_pctype;
> 
>          fde_addr = sec->fdes_start + (fde_num * sizeof(struct sframe_fde_v3));
>          unsafe_copy_from_user(&_fde, (void __user *)fde_addr,
> @@ -82,6 +83,10 @@ static __always_inline int __read_fde(struct sframe_section *sec,
>          unsafe_copy_from_user(&_fda, (void __user *)fda_addr,
>                                sizeof(struct sframe_fda_v3), Efault);
> 
> +       fde_pctype = SFRAME_V3_FDE_PCTYPE(_fda.info);
> +       if (fde_pctype == SFRAME_FDE_PCTYPE_MASK && !_fda.rep_size)
> +               return -EINVAL;
> +
>          fde->func_addr  = func_addr;
>          fde->func_size  = _fde.func_size;
>          fde->fda_off    = _fde.fres_off;
> 

Yes, I think this is good to add.

>>
>>> +
>>> +	fre_addr = sec->fres_start + fde->fres_off;
>>> +
>>> +	for (i = 0; i < fde->fres_num; i++) {
>>
>> Can this loop cause a hard lockup in atomic context?
>>
>> fde->fres_num is a 32-bit value copied from user space without validation.
>> Since sframe_find() is designed to be called by unwinders in NMI context, an
>> attacker could provide a very large number of valid entries. Executing
>> billions of iterations and unsafe_get_user() calls could stall the CPU
>> and trigger the hard lockup detector.
> 
> Please advise.
> 
>>
>>> +		int ret;
>>> +
>>
>> [ ... ]
>>
>>> @@ -120,8 +449,10 @@ int sframe_add_section(unsigned long sframe_start, unsigned long sframe_end,
>>>   	sec->text_end		= text_end;
>>>   
>>>   	ret = sframe_read_header(sec);
>>> -	if (ret)
>>> +	if (ret) {
>>> +		dbg_print_header(sec);
>>>   		goto err_free;
>>> +	}
>>
>> Can shdr.fre_len cause an integer overflow on 32-bit architectures during
>> header parsing?
>>
>> If a malicious user provides a large fre_len in the header, fres_end
>> (calculated as fres_start + shdr.fre_len) could wrap around the 32-bit
>> address space. This would bypass the bounds check in sframe_read_header(),
>> allowing fres_start and fdes_start to point into kernel memory. Later, when
>> __read_fde() and __find_fre() use unsafe_get_user(), this could lead to
>> arbitrary kernel memory disclosure.
> 
> SFrame is currently only supported on 64-bit architectures (i.e. x86-64,
> arm64, s390 64-bit).  So unsigned long fres_end should always be 64-bit.
> Do we need to add the following to the header parsing?
> 
> if (fdes_start >= fdes_end || fres_start >= fres_end) {
> 	dbg_sec("inconsistent FDE/FRE start/end address\n");
> 	return -EINVAL;
> }
> 
>>
>>>   
>>>   	ret = mtree_insert_range(sframe_mt, sec->text_start, sec->text_end, sec, GFP_KERNEL);
>>
>> Does passing sec->text_end directly as the last parameter to
>> mtree_insert_range() break contiguous mappings?
>>
>> mtree_insert_range() expects the last boundary to be inclusive, but
>> sec->text_end represents the exclusive end address of the executable segment.
>> If user space maps seamlessly contiguous text segments, the insertion for the
>> second segment might overlap with the claimed end of the first, causing it to
>> fail with -EEXIST.
> 
> Addressed in previous patch.
> 
>>
>>>   	if (ret) {
>>>   		dbg("mtree_insert_range failed: text=%lx-%lx\n",
>>
> 
> Thanks and regards,
> Jens

