Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B8E3A9D8C
	for <sashiko@lists.linux.dev>; Fri,  8 May 2026 23:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778281545; cv=none; b=oeoRLXZD2E8CTJEZ2EoVMEiaVCBZV8QfxqC3SnhcTMYUNtdkc8kkt6y2bjhRb2gPR9oHciKolSLvcTmLhABi4wEL0l889QtWi73JwWPrVogWO8r98O825vtVoguvkmDJLRdG1nGxc6hqJTfCPrT9aAC/j4D4HfnHDSAfOBCwt8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778281545; c=relaxed/simple;
	bh=BIZ2DEmxQNMSyJO0c3JrhwGrmW3VPJQHd2yM8ypX9H0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZNaoiRCEutTdW2u8wU3J0g8RKmjKf8GJYK4Mxl238ot9j8WQIaMOGb1T5p5Y38HwGq5LK3ROBV0rVbrITWY/mCl/ismZ49jFbDBZMDsR94ZV6QHMPARHoUhOnUZMgh/yDry0JzMqkox3Ano3kTKCLoE4RdMJqpnz9sLZ5qSJ8f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZzXVOrI; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZzXVOrI"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c8173b2af32so1792233a12.0
        for <sashiko@lists.linux.dev>; Fri, 08 May 2026 16:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778281544; x=1778886344; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xeg4ZJJWFuOVqx92VARGZStirf6XOw1xwpYmdyHRQSw=;
        b=XZzXVOrIVmt5XW5DvpEch0xOg2Ig6efi9COzKiy0qyKqBMf5WbaK07XRuzDFX0UXkx
         f4p0Go/EyLJPiDIQGe1/l927DO9oc8Aag0p9UiZl3nkxC8CWEIrXHJD72p1e4zYANkFN
         T70gL9gWMGGen+1tjenSNXkuFuYMlLvUtPZLERhrC9VarVfhXN7bUwcwIwQ5az4XqDJX
         pZLgb4pnM/Cg4b6mxLCXJMPkY5z+VvGnSelu+bLUDq8GsXjXc9OcJ61l44zLBu4SOp55
         aojYmYlK2ZJvupEy78hSwnkdgIJ657zc/2fo408OpDisVKZ/XozgGRR+x/muxFVLPYZn
         hVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778281544; x=1778886344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xeg4ZJJWFuOVqx92VARGZStirf6XOw1xwpYmdyHRQSw=;
        b=RF1gipW52dAP6ppSIlJIFw/wtohHfQDz1CvHksT+TnQfBkxON/Vy30u0kSjwq9ohNM
         8Wd64LB/kXBKp/gqOlJDIsGwxqEC3Nq05jq527WdHmvcT8zYZ0cjzem0cNnK1NaCwwL9
         5GoPtrjrKeiWZcTOZJpTUdFpUuovU3WA6Wv+3z2Y/9pqwOYfVG11YBMrLnc/VKNNDboh
         rAMMs6AVRzaBS+4k6/U3jiExHvXz71I8Ml9H0LvyZGgg4Hu2R9yNYXj0MYih0u1fB2t4
         UKwynLKoV4awLobsYDDllseEcI9M5EH4MElunGvBZXHFSHPl+b/+B2TMFAv9xIld861U
         rNmg==
X-Forwarded-Encrypted: i=1; AFNElJ+pnEzXppoHp2onW9Y1tUot8rjKOCEbtYhoFVSZ5ZNns/7PD7LfYVhnKZCZ0ByJ/mYCHp3fFpNP@lists.linux.dev
X-Gm-Message-State: AOJu0YzOuWI9S0ZL2kZ4ZxIHUApt8SlMvAFTeRYPBjyo7nVyw85B9KY0
	SRIzPHDf6hya+EPHvU64e6wa2OPyig/mfGDFBd/xP+nQNlk9ZckT+bWv
X-Gm-Gg: AeBDieskk1/9U6qnd4YRnZj0wUKrPSKDCCO5/MDAGB7KX6h0cS5p05BQ38CA2hAl03X
	qyKofbK4lLiSBpS40zf+2o5Y/9SRfeYmTloV8Hw1Hgq9UU9tno0NYlWf3eK2rr8AYO65BUfNn2e
	FY4tdgzSjDMS7E1E1gHQmzTnrwYNcb+9py7mqhJSSDdwMTO5v/hdrCCYuNOOcQBWrw7Uv6S/WbB
	mAbk0aIBeDc6szzsNFyZgoYtY1qkr4TGv5VZJMAQA4TYrjMuhplr36f7PBFAoF2Xz7/AU8zrkoH
	y3KpHLRn/I3bYEYzeh/GJxWQlIX7mp5rEOLE5oiKHN1aLcMN/82A8h8QuxWHdh8it3uTSrDX2dE
	YuwGDBjc7t/xseOrw6JOj8pP9Gu/VyMEMVYUgIP0XFbwmCl+DPIOHs7HS8DvmzIRoBmIZ5FL+r5
	e0v/rYCaXuE69piUz484JbucaY6T8J2JmMYwOWUw==
X-Received: by 2002:a05:6a00:9a6:b0:837:e9cc:d474 with SMTP id d2e1a72fcca58-83e391509c7mr227285b3a.2.1778281543986;
        Fri, 08 May 2026 16:05:43 -0700 (PDT)
Received: from ?IPV6:2604:3d08:9582:1100::c7c9? ([2604:3d08:9582:1100::c7c9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396594645csm13979079b3a.14.2026.05.08.16.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 16:05:43 -0700 (PDT)
Message-ID: <03b20e60-3249-4f6d-80a6-d21566b6f75f@gmail.com>
Date: Fri, 8 May 2026 16:05:42 -0700
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 06/19] unwind_user/sframe: Detect .sframe sections in
 executables
To: Steven Rostedt <rostedt@kernel.org>, Jens Remus <jremus@linux.ibm.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, bpf@vger.kernel.org,
 sashiko@lists.linux.dev, "Jose E. Marchesi" <jemarch@gnu.org>
References: <20260505121718.3572346-7-jremus@linux.ibm.com>
 <20260505125336.72A36C2BCB4@smtp.kernel.org>
 <29d28c6e-2909-444e-b22a-7429464056dd@linux.ibm.com>
 <20260506113605.5df32968@fedora>
Content-Language: en-US
From: Indu Bhagat <ibhagatgnu@gmail.com>
In-Reply-To: <20260506113605.5df32968@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-05-06 08:36, Steven Rostedt wrote:
> On Wed, 6 May 2026 16:56:01 +0200
> Jens Remus<jremus@linux.ibm.com> wrote:
> 
>>>> --- a/fs/binfmt_elf.c
>>>> +++ b/fs/binfmt_elf.c
>>> [ ... ]
>>>> @@ -637,6 +638,21 @@ static inline int make_prot(u32 p_flags, struct arch_elf_state *arch_state,
>>>>   	return arch_elf_adjust_prot(prot, arch_state, has_interp, is_interp);
>>>>   }
>>>>   
>>>> +static void elf_add_sframe(struct elf_phdr *text, struct elf_phdr *sframe,
>>>> +			   unsigned long base_addr)
>>>> +{
>>>> +	unsigned long sframe_start, sframe_end, text_start, text_end;
>>>> +
>>>> +	sframe_start = base_addr + sframe->p_vaddr;
>>>> +	sframe_end   = sframe_start + sframe->p_memsz;
>>>> +
>>>> +	text_start   = base_addr + text->p_vaddr;
>>>> +	text_end     = text_start + text->p_memsz;
>>> Should text_end be calculated as text_start + text->p_memsz - 1?
>>>
>>> Since the maple tree API strictly expects inclusive ranges [first, last] for
>>> insertions, passing the exclusive text_end would cause the inserted range
>>> to cover one byte beyond the actual segment.
>> Shall we keep the text_end and sframe_end is pointing past the
>> respective section end semantic and just adjust the value passed on the
>> call to mtree_insert_range()?
> Let's keep the end exclusive, and add the "- 1" to text_end before
> passing it to the mtree_insert_range(). I did that to get it working for
> me.
> 
>>> If an ELF binary has adjacent executable PT_LOAD segments, could the first
>>> segment's inclusive end overlap with the next segment's start and fail
>>> subsequent insertions?
>>>    
>>>> +
>>>> +	/* Ignore return value, sframe section isn't critical */
>>>> +	sframe_add_section(sframe_start, sframe_end, text_start, text_end);
>>>> +}
>>>> +
>>> [ ... ]
>>>> @@ -712,6 +729,19 @@ static unsigned long load_elf_interp(struct elfhdr *interp_elf_ex,
>>>>   				error = -ENOMEM;
>>>>   				goto out;
>>>>   			}
>>>> +			break;
>>>> +		}
>>>> +		case PT_GNU_SFRAME:
>>>> +			sframe_phdr = eppnt;
>>>> +			break;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	if (sframe_phdr) {
>>>> +		eppnt = interp_elf_phdata;
>>>> +		for (i = 0; i < interp_elf_ex->e_phnum; i++, eppnt++) {
>>>> +			if (eppnt->p_flags & PF_X)
>> 			if (eppnt->p_flags & PF_X && eppnt->p_type == PT_LOAD)
>>
>>>> +				elf_add_sframe(eppnt, sframe_phdr, load_addr);
>>> Does this need to verify the segment is loadable (eppnt->p_type == PT_LOAD)?
>>>
>>> If non-loadable segments like PT_GNU_STACK have the PF_X flag set, they
>>> typically have p_vaddr and p_memsz as 0. Processing these segments would
>>> compute bogus text boundaries and bypass VMA validation. If a legitimate
>>> PT_LOAD segment overlaps with these bogus ranges, could its insertion fail
>>> silently and break stack unwinding for the executable?
>> Do you agree?
> Indu or Jose?

I think checking for PT_LOAD makes sense as we want to detect the 
executable text segments.
