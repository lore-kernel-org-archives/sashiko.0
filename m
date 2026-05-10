Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12981378D70
	for <sashiko@lists.linux.dev>; Sun, 10 May 2026 09:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406284; cv=none; b=Y5WT1Q1c9eZD9qde5BXTyi/0ipev8JOKSx+4kfXQJ3UZ5nDj5krJXVRFOt27uK5JJ/xKiyxtxLujxtuXX5QQEjuF+Bd4Bq870QImaeCxbJ446V97f7aDJiEs9lFdHUU5dg8eR2L16NNYJ3/3v6+oLbvjtkui3xdCD0zwnVn2UZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406284; c=relaxed/simple;
	bh=wkNZg53DlXRlT+CxxgRTGAOmwaZwY2AkcYihOzIllcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DPl9roEpBGBEmTE8IUIIx1RSuCxjE93d4hn+GSmA7AuxzwJbaEWwN/sogptoFtNEtMNGKh3tMtck0MsPnQU6bw3/zAil9PHUeIJdqb7viJThIa8K7QZdj8IU48XHuCZafghrpFScWkpaaJ4BeOnFHqvugjWhnFLx070Smz6fNn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=HOK32OB6; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="HOK32OB6"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778406272; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=kOWnmNp7Aj4p8oW2Ietdg9zcy366aUlnySjOKWihkuE=;
	b=HOK32OB6P14kHEBx3zwAk6ZlfWoyJD4aYeH8SUfb4Vxkm+W7FjfW0Wng+dW5iMJFg9G7goHBs9CV+vB3gsLsWrmyylmJ9ISmrfQX6IXhAxqANROIEB+AYsfzcgu+3A0HQhPqiEGbSJLzG9fWobXzUvp2fikXOF10WDb9uLJWRKE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R661e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=libaokun@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0X2cPgH4_1778406270;
Received: from 30.43.150.40(mailfrom:libaokun@linux.alibaba.com fp:SMTPD_---0X2cPgH4_1778406270 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 10 May 2026 17:44:31 +0800
Message-ID: <2763fc46-3342-48ac-bc57-3a46efd84844@linux.alibaba.com>
Date: Sun, 10 May 2026 17:44:27 +0800
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 01/17] lib/crc: add crc32c_flip_range() for
 incremental CRC update
To: sashiko@lists.linux.dev
Cc: tytso@mit.edu
References: <20260508121539.4174601-2-libaokun@linux.alibaba.com>
 <20260508204019.9E5A5C2BCB0@smtp.kernel.org>
From: Baokun Li <libaokun@linux.alibaba.com>
In-Reply-To: <20260508204019.9E5A5C2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

在 2026/5/9 04:40, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Integer overflow in `bit_off + nbits` bypasses bounds checks, leading to out-of-bounds kernel memory reads.
> --
>
> commit 23c49b9c6860184b707e1c64499ef573ebaa8332
> Author: Baokun Li <libaokun@linux.alibaba.com>
>
> lib/crc: add crc32c_flip_range() for incremental CRC update
>
> This commit introduces crc32c_flip_range() to compute a CRC32c delta for
> flipped bits using precomputed GF(2) shift matrices. It gives O(log N)
> complexity for incremental updates, which is useful for situations like
> bitmap updates in filesystems.
>
>> diff --git a/lib/crc/crc32c-incr.c b/lib/crc/crc32c-incr.c
>> new file mode 100644
>> index 0000000000000..b6258231cc0df
>> --- /dev/null
>> +++ b/lib/crc/crc32c-incr.c
> [ ... ]
>> +u32 crc32c_flip_range(u32 old_crc, u32 total_bits,
>> +		      u32 bit_off, u32 nbits)
>> +{
>> +	u32 delta, trailing_bits;
>> +
>> +	if (!nbits)
>> +		return old_crc;
>> +
>> +	/*
>> +	 * total_bits must not exceed 2^INCR_MAX_ORDER bits (64KB).
>> +	 * bit_off + nbits must not exceed total_bits.
>> +	 */
>> +	if (WARN_ON_ONCE(total_bits > (1UL << INCR_MAX_ORDER)))
>> +		return old_crc;
>> +	if (WARN_ON_ONCE(bit_off + nbits > total_bits))
> Could this addition overflow since both bit_off and nbits are u32?
>
> If an external caller provides a very large nbits (such as 0xFFFFFFFF) and
> a small bit_off, their sum wraps around to a small value, which passes the
> greater-than total_bits check.
>
> If this occurs, the function proceeds to call crc32c_incr_get_ones_delta()
> with the large nbits value:
>
>> +		return old_crc;
>> +
>> +	trailing_bits = total_bits - (bit_off + nbits);
>> +
>> +	/* 1. Calculate CRC of the flip-mask (all 1s of length nbits) */
>> +	delta = crc32c_incr_get_ones_delta(nbits);
> Is it possible this leads to an out-of-bounds read?
>
> Looking at crc32c_incr_get_ones_delta(), passing a large nbits like
> 0xFFFFFFFF results in __fls(num_bits) evaluating to 31. This would be used
> to access indexes in crc32c_incr_ones_lookup[] (size 20) and
> crc32c_incr_nibble_table[] (size 19), reading past the end of the arrays.
>
> A bounds check like nbits > total_bits || bit_off > total_bits - nbits
> might prevent this overflow.
>
>
Indeed, I will fix this issue in the next version.

Thanks,
Baokun

