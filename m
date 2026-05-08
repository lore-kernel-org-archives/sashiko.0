Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154A639DBEF
	for <sashiko@lists.linux.dev>; Fri,  8 May 2026 23:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778281458; cv=none; b=Mrs1Td5/l/A8vJxcU6Z8fepu9Ee6RGUWN2pjD4MbpqJwYXOiqaua52c6wTrFjxlmNB1n5UscmgZUVTclfRZzjQCrttFOrbjFlOFkep8KGoZ8Al9U+TjQ68m3B15tWV3dyPq2Glt0XQz4AgM3kwf8ADLw7dOQxNKJcq0PhDQavUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778281458; c=relaxed/simple;
	bh=ZxW9oV4mSQXoLVz0dkwDl3+Ul0CcYs/G+6dWBZAgP8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lQ53qAlrzRTHygLxc3WDgvpFj56lX2lN1/0aqdiNK7bKpVvaaCwNnFPoeBbsTjLsy803otB9uHYXwz12wGhEDSVd5UNS6U5jOLVVggXNO+ucawr4PH6UajASXsOOcJ/r06HgIgxna0K1fOOp8AZgTHoRI/XMcUh6eC3TXiDOc7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKbeA17j; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKbeA17j"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-366087480d8so2231561a91.3
        for <sashiko@lists.linux.dev>; Fri, 08 May 2026 16:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778281456; x=1778886256; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ReDyhUz1ajWxrkK7iCREC2Yh5oQFngk3yx26HUt19Iw=;
        b=BKbeA17j2BoKi00xXg/ooVWWG710FqXn4lD2KUMQpww2OmoIu4oumpIA4JJOjVI4DU
         yFDOPugp07Xt7UfuzMPKqkMerzOFBxecnrh8B/AMmubcQi3hyvqBloKMKYBLzWlTT2Rh
         /DXho80evN70vqCF9ZTbBfVc1DSbU7G3oltQgKWxV6YCspdcFWgjj075F88/yHmFOcn1
         6bF8HcGw27CTVhc4PDQ95xyuOyhwU0EkJnOdnlf3wLZof08Ob2SwYwfzSbElSCj6Qw5o
         0mpmiJQMGxzOQVZ7tuxbNuDvhzBooKGmakAsKuu6v26NOVSfoi1f2pej84UWtKMsxS3y
         1cAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778281456; x=1778886256;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ReDyhUz1ajWxrkK7iCREC2Yh5oQFngk3yx26HUt19Iw=;
        b=oHH8FmBwEA6i/GUddSUyUd80lzgVjjQFCfQeCB/s6I9DtdDZOCcYAolUvAORb+tV8k
         PZ8fgJKe+T+nmbtTX3NfjuP4xWlgP1VYQx6VeOPpJ66UVNx/X/YOCQmqif3i6K8GWxCa
         NoLp4tOKZyEQl1glQzJp/rVG/T3oYNetNIqZRP1y2mre4c81VMfXwj0NA5yflgQAmi0S
         D6cM6HupKy09u61PKtEaOqGrSl6Ra07drnZWYiN+AQFXG8ZeZnknBAlYyHBY2HkoFUE1
         nfACTD+fhnMIj4EjlNpnMUWrULxUUItpSX+3xJrENp+mxpS555ui/fYyi1pI2C/IWhxS
         Aoig==
X-Forwarded-Encrypted: i=1; AFNElJ9kEZBzvPEn/9HFQCZEY1vfB3G9DccrXM5WeVBflnY+HK5/5W67s/g9iUsxKR9nD88sdo5WE/gU@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/V7ZGTRhKox7PMxCbz563tv1sUjXd7MRH0gs+tuJJy1SiUayx
	QOjNUvnd5yeMGSfh07VQrfBeQoJMhmKd/jOTt7Y9vbdZINpPrWZlnShI7jExCoLB
X-Gm-Gg: Acq92OHvZpCmiZnlMy4kPpR4BA7tSjzPPTp0LdrtxKyuKW2Ytxhjf3Fee3xlN86dI1R
	os0eJ5yC2ZYFSy2C5E1iUoGrsmQ66geuBLoSJxCE0pnkuZnVZWhuSGrlRwXHJpHw7wi1iWledOz
	Z6ZY/hMuNwbVECoZsjs4PEkJkr/+uu0F+L7gu0HRgHxF8qU+PjTAewv6XqScVSSEy5NzQZaZiRH
	oNJoYfFZYgSF+CvooiUvo9wULJEuIGhs4l4Tel27jmOMRDsfqwBbrrnqOm5hjXPhoPFGtNhkA7/
	uhvxL9UE5C85T99mOzKFiqffqCtuaP2ZP0Tqb0Le1heuUOV1F4lj3oGMrJV8gebC6dddL2thI8N
	UQTuj5OzaoQieZuXfWmtrlOWD1xu/SNfhkd/0B0YaEDGPy+0rvNsNRg/Hozw3lWrpQRnGNoKLfp
	oqQ+4GXhvzEUdN2b/+3Y7RuY0xt7k0Wcb4CSZAaA==
X-Received: by 2002:a17:90b:254d:b0:35e:57cf:c0ae with SMTP id 98e67ed59e1d1-365ab9c8160mr15448255a91.7.1778281456340;
        Fri, 08 May 2026 16:04:16 -0700 (PDT)
Received: from ?IPV6:2604:3d08:9582:1100::c7c9? ([2604:3d08:9582:1100::c7c9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d64de478sm97524a91.13.2026.05.08.16.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 16:04:16 -0700 (PDT)
Message-ID: <da6d4a68-99ef-468d-b175-8c6dd164bfb7@gmail.com>
Date: Fri, 8 May 2026 16:04:15 -0700
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
 <20260506110142.7b2943d7@fedora>
 <3158dc1a-26cb-4942-b05e-6c60c092e588@linux.ibm.com>
Content-Language: en-US
From: Indu Bhagat <ibhagatgnu@gmail.com>
In-Reply-To: <3158dc1a-26cb-4942-b05e-6c60c092e588@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-05-08 02:49, Jens Remus wrote:
> On 5/6/2026 5:01 PM, Steven Rostedt wrote:
>> On Wed, 6 May 2026 16:34:34 +0200
>> Jens Remus <jremus@linux.ibm.com> wrote:
> 
>>>> If a malicious user provides a large fre_len in the header, fres_end
>>>> (calculated as fres_start + shdr.fre_len) could wrap around the 32-bit
>>>> address space. This would bypass the bounds check in sframe_read_header(),
>>>> allowing fres_start and fdes_start to point into kernel memory. Later, when
>>>> __read_fde() and __find_fre() use unsafe_get_user(), this could lead to
>>>> arbitrary kernel memory disclosure.
>>>
>>> SFrame is currently only supported on 64-bit architectures (i.e. x86-64,
>>> arm64, s390 64-bit).  So unsigned long fres_end should always be 64-bit.
>>> Do we need to add the following to the header parsing?
>>>
>>> if (fdes_start >= fdes_end || fres_start >= fres_end) {
>>> 	dbg_sec("inconsistent FDE/FRE start/end address\n");
>>> 	return -EINVAL;
>>> }
>>
>> I guess this wouldn't hurt.
> 
> Reviewing my suggestion again I realize that this check would be
> superfluous.  The existing computation and check already ensures that
> the FDE table is within sframe section, the FRE table is within sframe
> section, and both tables do not overlap:
> 
> 	num_fdes   = shdr.num_fdes;
> 	fdes_start = header_end + shdr.fdes_off;
> 	fdes_end   = fdes_start + (num_fdes * sizeof(struct sframe_fde_v3));
> 
> 	fres_start = header_end + shdr.fres_off;
> 	fres_end   = fres_start + shdr.fre_len;
> 
> 	if (fres_start < fdes_end || fres_end > sec->sframe_end) {
> 		dbg_sec("inconsistent FDE/FRE offsets\n");
> 		return -EINVAL;
> 	}
> 
> - fdes_start and fres_start are computed from header_start and thus must
>    be larger sframe_start
> - fdes_end and fres_end are computed from their fdes_start and
>    fres_start and thus must be larger than sframe_start
> - fres_start < fdes_end ensures that the FDE table and FRE table do not
>    overlap
> - fres_end > sec->sframe_end ensures that fres_end (and fdes_end and both
>    fdes_start and fres_start) are smaller or equal sframe_end
> 


Yes, I too think the existing check you note above suffices.

