Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33E339935D
	for <sashiko@lists.linux.dev>; Fri,  8 May 2026 23:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778281328; cv=none; b=nd50wtdVN6Ga62AjUetm33wn5w8RNLZcu4XJLV+1g4Q/kGK3rxAX2DCX/NsBvnOoYhRuX36VGpSf8MKwOE4elZ7GwsGAlU3hyuGsbKtsRt7XqYRn7L9tMjUyh3K1MM2oPxfZ4EqhW5aZW7vA3GnfCPGzc7t6uTCmlg45JEYcAnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778281328; c=relaxed/simple;
	bh=WqTEr6P7SFgnQakT6JXZbfbGPNMww6j9VukxRby8an4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rwUOHNyTPd6n/sEsta8Nec9gKi2oW0OUBUKBNfPDu2mseVTZaZdeOrBLp8DvReIQvcelqH/VhVUnER+mK66trrzHvT84SVcWv2UzQVHpTf/NVEiFjffpE1LWTQG+eZqobIOxoAnB8y4rTpfekGMpVlDpN3OsbTNHxgDSIApb9rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MOCruHDh; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MOCruHDh"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ba1e9d3687so15933515ad.3
        for <sashiko@lists.linux.dev>; Fri, 08 May 2026 16:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778281326; x=1778886126; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z6rNXzaWvzDqJsK/a0lBi5Sn7tj+GWzVcJ62JnTUubY=;
        b=MOCruHDhRo6mBpkvuoAw6AHI4frmVWmD1Btwc/nzuLMljMfOdNAnJyA/GDKRLyrwx6
         wjR5h2MJyFv1opYE3fUJeexbFB/BQi8lFIry50hMl5R0568Gz7mmfQDBAWYj7iftc4ip
         /Nx/HalWIMo1mNGW2EjYecop0NEVAU9vpbWGzmiZtOmUZ1meMu/lThQkjMHzcSOcirjd
         pMMjABTF+dFHL9D8ICx2VgUdtCfDA2/4CBQj9ALoAN1GBN34KCINFQ1cCASl1SZadL1T
         1JTXeluOdqpNk1nUjTFE+omowKyk4zjr/Od5ae3rf/EiGgp/7d3yYwUFKzJXZ4HzgGXq
         q5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778281326; x=1778886126;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z6rNXzaWvzDqJsK/a0lBi5Sn7tj+GWzVcJ62JnTUubY=;
        b=OxyVzZ7HSted1kxBdKJ8FE++pFgy6+gT+sZ26HtFwQQ1+qRUNBjfyVQanZ+hv4BSWW
         wLJY/wXsyiCxe3ZzlLshZyhc2H2q+SLTWUPzJmlNYPi2cKP20alvBX4sJujSE8TdQg9T
         CwBFETLMbLUZz0Fd513ZE63HGz/RvakgutJPY1dnrzVdIFWmDsRd+8y0Z1jG2TNpOohF
         /unlVPJ2ljihft/rRIBC9xaOXDapu+BdpGkI88fsasX3X+prwMnrKWTUEPuX9/bxZj9N
         D1jVvrgWAwWlcdFN0SmI5/CDYg/MAdSYcbauzmFFK4URBfhORag5uT8Bq+C1nDZjgaeK
         zHyQ==
X-Forwarded-Encrypted: i=1; AFNElJ/GrUFbreA2fguPcOs8FmN7mzWfRfEo7k+ptxhZUvjTx/R5JtenLAx11KRJ3iLUCUUox5bWviJV@lists.linux.dev
X-Gm-Message-State: AOJu0YwHyDwN/6SUVgkL+IINicRFaZ42VTqDjoFUF98eAWDpjw30DEob
	s2rgYr4nI1vZtw4XyM0HL+5SKbRzZrBExChf+cqqP8ZNm7FaXNrsndKZ
X-Gm-Gg: Acq92OEfxS+wBqLQVXrSXTYalpxHJjcqsK4dIQ0Se/0dZkDFHwv81O9IbJ/DMkFfsc4
	umKgxPvuqC18Q2XFY3ZC1zcd3b0UDB3rfPVMESitAqDE+g7ta9M4ZHR05O5caibyS9RKJg7hsmb
	gRjoHOqMuVZZfJACwYMvshfRzL6BZnWR1U0ZDTKjZPDE1kLBPX1qkO1iEVRBLGLy8qiCN/NzmAH
	nXRxHtD4KckTxbynI22ThxChe7jQjCoQVVZH79g1gI/NvE6tOv585E0TGrJpSAUXHxc6DuOCSi2
	LIL2Gg8iGBz/7YZ59dX4JcP1mNVRXSeJGHFZK9XrkIDAWx6LvPwUo4ws/rYQqwVd1mY32S3B46Y
	Rt87dSFQBvTFRiUFppmIP2u+kHzDsyB3KYKlC3F8D43oHUZEKEyC2S7+8RJfXJO+2i/bufSQ9E/
	EoHFFcvWEnHYgReXjw/1DTwLGFhHCPbwpGTpQx3g==
X-Received: by 2002:a17:903:1b07:b0:2b9:eb6a:68b5 with SMTP id d9443c01a7336-2ba7a36022amr140432425ad.38.1778281326002;
        Fri, 08 May 2026 16:02:06 -0700 (PDT)
Received: from ?IPV6:2604:3d08:9582:1100::c7c9? ([2604:3d08:9582:1100::c7c9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3ff52sm32984075ad.26.2026.05.08.16.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 16:02:05 -0700 (PDT)
Message-ID: <68676204-ba32-446d-a0fd-c2f39cea775e@gmail.com>
Date: Fri, 8 May 2026 16:02:04 -0700
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 02/19] unwind_user/sframe: Add support for reading
 .sframe headers
To: Jens Remus <jremus@linux.ibm.com>, Steven Rostedt <rostedt@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>
Cc: bpf@vger.kernel.org, sashiko@lists.linux.dev
References: <20260505121718.3572346-3-jremus@linux.ibm.com>
 <20260505124948.669E2C2BCB4@smtp.kernel.org>
 <f106e4a1-4f60-4c65-97bc-2257005765e5@linux.ibm.com>
Content-Language: en-US
From: Indu Bhagat <ibhagatgnu@gmail.com>
In-Reply-To: <f106e4a1-4f60-4c65-97bc-2257005765e5@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-05-06 06:42, Jens Remus wrote:
> On 5/5/2026 2:49 PM,sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>> - [Medium] Missing validation of shdr.abi_arch allows parsing SFrame data from mismatched architectures.
>> - [Medium] VMA addresses are incorrectly evaluated as boolean flags to check for zero-length inputs.
>> - [Low] Mixing goto error handling with scoped_guard scope-based cleanup.
>> --
>>
>> commit afe7c9eb6f0e6fc3f73d0b6a555f8d3926cf6ccf
>> Author: Josh Poimboeuf<jpoimboe@kernel.org>
>>
>> unwind_user/sframe: Add support for reading .sframe headers
>>
>> This commit introduces basic infrastructure for unwinding user space stacks
>> with SFrame. It adds support for parsing the .sframe section header.
>>
>> Link:https://lore.kernel.org/all/ 
>> f27e8463783febfa0dabb0432a3dd6be8ad98412.1737511963.git.jpoimboe@kernel.org/
>>
>>> diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
>>> new file mode 100644
>>> index 0000000000000..c128c1eeaca20
>>> --- /dev/null
>>> +++ b/kernel/unwind/sframe.c
>> [ ... ]
>>> +static int sframe_read_header(struct sframe_section *sec)
>>> +{
>>> +	unsigned long header_end, fdes_start, fdes_end, fres_start, fres_end;
>>> +	struct sframe_header shdr;
>>> +	unsigned int num_fdes;
>>> +
>>> +	if (copy_from_user(&shdr, (void __user *)sec->sframe_start, sizeof(shdr))) {
>>> +		dbg("header usercopy failed\n");
>>> +		return -EFAULT;
>>> +	}
>>> +
>>> +	if (shdr.preamble.magic != SFRAME_MAGIC ||
>>> +	    shdr.preamble.version != SFRAME_VERSION_3 ||
>>> +	    !(shdr.preamble.flags & SFRAME_F_FDE_SORTED) ||
>>> +	    !(shdr.preamble.flags & SFRAME_F_FDE_FUNC_START_PCREL) ||
> 	    shdr.abi_arch != sframe_abi_arch() ||
> 
>>> +	    shdr.auxhdr_len) {
>>> +		dbg("bad/unsupported sframe header\n");
>>> +		return -EINVAL;
>>> +	}
>> Should we also validate shdr.abi_arch to ensure it matches the expected
>> architecture?
>>
>> If malformed or foreign-architecture SFrame data is passed in (for instance,
>> with an unexpected endianness or register mapping), the kernel might interpret
>> it incorrectly and generate invalid stack traces.
>>
>> Furthermore, accepting arbitrary values here could risk ABI calcification if
>> userspace starts supplying invalid values that we later want to reject.
> I could introduce an architecture-specific sframe_abi_arch() and update
> the SFrame header validation as above.  For x86 the implementation in
> in unwind_user_sframe.h could look as follows:
> 
> #ifdef CONFIG_X86_64
> #define sframe_abi_arch()	SFRAME_ABI_AMD64_ENDIAN_LITTLE
> #endif
> 
> Given sframe.o is only linked in if CONFIG_HAVE_UNWIND_USER_SFRAME and
> that is only selected if X86_64 this should be fine.
> 
> Do you see any value?

I dont see much value.  fs/binfmt_elf.c has done some admission control 
for the user binary already.  For bi-endian systems, this doesnt add 
value (wrt checking correct endianness).

For addressing the concern of a compromised SFrame section, we need to 
ensure checks at SFrame information read/validation time (which the code 
is doing already and additional checks that can be added are currently 
being discussed).  Checking for the abi_arch value does not necessarily 
safeguard much.
