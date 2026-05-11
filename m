Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2881B3B7760
	for <sashiko@lists.linux.dev>; Mon, 11 May 2026 08:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778487357; cv=none; b=JEJDnL7N7A4LwGQIFqq6uzxNJcBQTccfBLrwaP7RYZ/pO74qIGzCdy3qKAfnMrBmUpjjHkx91RVFCVgvnqwqBfe22HNev36C3VUzvnqh5CjHsOt/J2xSVdu08EdnorkUbX0r5LGDiV4JBbwyyqcDAFf3+37e8vUNJjC9SEEj7xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778487357; c=relaxed/simple;
	bh=xnXZ0uLr7S7SI2QyJwJmBux1+SSZJWg1LBvM+oP+7U8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MjMoBtTDXPlSVh6fC819Tweb1aj0i4yZGlkLFeHn8R8d+gO5ETyD0nrQyb9K1uw/Qx9cTwixuExCSrB3g+kOvS49RbyivM2AzabQcx6w346P0qVGGsvjTRbogtUFNFrFDx6fquKQiJPS5CQIJJl9gkXOfH1JAFS4OLPYgfLCpj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=FB/Sad0c; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="FB/Sad0c"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778487339; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=UJzZwa/FJOPht8x0ggVOfGkosBRAlmhlBAhqMQk4ppo=;
	b=FB/Sad0c5dMuZHkZAw7xRmkhhLqjsgHss7bndiOctY99cHOM6+t55sZ2mnWQXZL4poreXU3HSiQjziojYwgj4f8mHPi9UC4Vj6MSXPxE+ux+Q1dEmPRKTokhzEyaSuwuKj1DZ2BXFLnCjNG7iY/boVGO11Bx/wUyw3QHK0VhFlQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R991e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=libaokun@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0X2gsaIY_1778487337;
Received: from 30.221.130.252(mailfrom:libaokun@linux.alibaba.com fp:SMTPD_---0X2gsaIY_1778487337 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 11 May 2026 16:15:38 +0800
Message-ID: <bb60b44b-2527-4994-99cf-0757eabfeccc@linux.alibaba.com>
Date: Mon, 11 May 2026 16:15:37 +0800
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 07/17] ext4: use fast incremental CRC update in
 ext4_mb_mark_context()
To: sashiko@lists.linux.dev
Cc: tytso@mit.edu, libaokun@linux.alibaba.com
References: <20260508121539.4174601-8-libaokun@linux.alibaba.com>
 <20260508223130.20E7AC2BCB0@smtp.kernel.org>
From: Baokun Li <libaokun@linux.alibaba.com>
In-Reply-To: <20260508223130.20E7AC2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

在 2026/5/9 06:31, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The fast incremental CRC update in ext4_mb_mark_context() corrupts the block bitmap checksum when a double-free or double-allocation occurs.
> --
>
> commit 09892d15c378eafad6a406a3bb75ec38cfead08f
> Author: Baokun Li <libaokun@linux.alibaba.com>
>
> ext4: use fast incremental CRC update in ext4_mb_mark_context()
>
> This commit introduces a fast incremental block bitmap checksum update using
> ext4_block_bitmap_csum_set_range() to avoid re-scanning the entire bitmap.
> It falls back to a full recalculation only when EXT4_MB_BITMAP_MARKED_CHECK
> or BLOCK_UNINIT are present.
>
>> diff --git a/fs/ext4/mballoc.c b/fs/ext4/mballoc.c
>> index ff2023c9f52c6..77f6309916d1e 100644
>> --- a/fs/ext4/mballoc.c
>> +++ b/fs/ext4/mballoc.c
> [ ... ]
>
>> @@ -4127,12 +4128,28 @@ ext4_mb_mark_context(handle_t *handle, struct super_block *sb, bool state,
>>  			goto out_err;
>>  	}
>>  
>> +	/*
>> +	 * fast_crc: Use incremental CRC update via crc32c_flip_range().
>> +	 * This is only valid when all bits in [blkoff, blkoff+len) are
>> +	 * guaranteed to be in the opposite state (i.e., every bit will
>> +	 * actually flip). When EXT4_MB_BITMAP_MARKED_CHECK is set,
>> +	 * mb_set_bits/mb_clear_bits are idempotent, so some bits may not
>> +	 * change and incremental CRC would produce incorrect results.
>> +	 */
>> +	fast_crc = !(flags & EXT4_MB_BITMAP_MARKED_CHECK);
> Since EXT4_MB_BITMAP_MARKED_CHECK is typically not passed during normal
> operations like ext4_free_blocks() (unless AGGRESSIVE_CHECK is defined),
> fast_crc defaults to true.
>
> If a block is double-freed or double-allocated due to an earlier filesystem
> corruption or bug, mb_clear_bits() and mb_set_bits() will leave the
> already-modified bits unchanged.
>
> Because fast_crc evaluates to true in this case, does this apply the
> incremental CRC update assuming the bits flipped, resulting in a bogus
> checksum that no longer matches the block bitmap data?
>
> [ ... ]
>
>>  	if (state) {
>>  		mb_set_bits(bitmap_bh->b_data, blkoff, len);
>>  		ext4_free_group_clusters_set(sb, gdp,
>>  			ext4_free_group_clusters(sb, gdp) - changed);
>>  	} else {
>>  		mb_clear_bits(bitmap_bh->b_data, blkoff, len);
>>  		ext4_free_group_clusters_set(sb, gdp,
>>  			ext4_free_group_clusters(sb, gdp) + changed);
>>  	}
>>  
>> -	ext4_block_bitmap_csum_set(sb, gdp, bitmap_bh);
>> +	if (fast_crc)
>> +		ext4_block_bitmap_csum_set_range(sb, gdp, blkoff, len);
> While the buddy allocator might subsequently detect the double-free (for
> example, in mb_free_blocks() via ext4_grp_locked_error()), it appears the
> block bitmap buffer has already been dirtied with the corrupted CRC here.
>
> Could this cause the entire block group to fail checksum validation on the
> next mount, unnecessarily escalating a localized error into a metadata
> corruption that requires fsck?
>

Yes, I missed the case of errors=continue. In the next version, I will
revert to full calculation when EXT4_ERROR_FS is set.

Thanks,
Baokun


