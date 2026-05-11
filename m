Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F7D3BBA1A
	for <sashiko@lists.linux.dev>; Mon, 11 May 2026 08:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778488524; cv=none; b=i4wW1xMLM+RRmq8eUexevXYtgfT02vVqAeCDGgjmx8lrsnqptq0Kyn5+QYzOi4Sa8AYEh03BDwHB+PMBKQT/3zscY3YxC7Et9mVqZJEQibvaa25RBGisC3b0T+BGNZotxx+CWoMMxF2syljXmbCYaoMFP98W4tTRIPDC9mzhV58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778488524; c=relaxed/simple;
	bh=7S/wKuEMdfMM710HoP7WqFLX2ejLhD/ZXod+YctkoYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LFMv3S3eThKp6qYy9S5dOUbF+lMytDFqnajK/V/hV2Sau/YpYsZfUuiLnp8opRXXBshW1ZjmcItg4aNAQDBYfAr17ALCHPr5d/vjDZHKWKgrRTka1pC2ooTHx5kN+gsoMpXg4l7GLKsWkiTwjsQ55CQXbN8+bZjHJ3/csQgrNU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=yB4BytVU; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="yB4BytVU"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778488508; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=aGJAKvRdq+d25AnJMExS7NxvgcoR+bLth/x3CnfrPCs=;
	b=yB4BytVUIMSDf/r1eN60GQ+y+yiYo4gyOR53pQSpA5DbD6KCtBQ5qnfPIy1fJKu54AuWCj248F9vtRrWA+jPEgcQnbsMqum4/vDZG9gOFJ85SWFREQTsgecZgb4pQvqi0gb7t9Gx8QqArGlqGpRW4/h/EOQcCRWR7+HEGm8lqa0=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=libaokun@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0X2gi3hr_1778488506;
Received: from 30.221.130.252(mailfrom:libaokun@linux.alibaba.com fp:SMTPD_---0X2gi3hr_1778488506 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 11 May 2026 16:35:07 +0800
Message-ID: <8fd8ab9b-a4e9-4857-90f5-55ba7e5b9070@linux.alibaba.com>
Date: Mon, 11 May 2026 16:35:06 +0800
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 09/17] ext4: add ext4_inode_bitmap_csum_set_fast() for
 incremental checksum update
To: sashiko@lists.linux.dev
Cc: tytso@mit.edu, libaokun@linux.alibaba.com
References: <20260508121539.4174601-10-libaokun@linux.alibaba.com>
 <20260508225807.71D9FC2BCB0@smtp.kernel.org>
From: Baokun Li <libaokun@linux.alibaba.com>
In-Reply-To: <20260508225807.71D9FC2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

在 2026/5/9 06:58, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Mismatched checksum calculation size in ext4_inode_bitmap_csum_set_fast() for filesystems with s_inodes_per_group not aligned to 8.
> --
>
> commit 5850c42dcf8baa647b659620b26a9dfeda77192c
> Author: Baokun Li <libaokun@linux.alibaba.com>
>
> ext4: add ext4_inode_bitmap_csum_set_fast() for incremental checksum update
>
> This commit adds a helper function to incrementally update the inode bitmap
> checksum using crc32c_flip_range() after flipping a single bit.
>
>> diff --git a/fs/ext4/bitmap.c b/fs/ext4/bitmap.c
>> --- a/fs/ext4/bitmap.c
>> +++ b/fs/ext4/bitmap.c
> [ ... ]
>> @@ -71,6 +71,29 @@ void ext4_inode_bitmap_csum_set(struct super_block *sb,
>>  	ext4_inode_bitmap_csum_store(sb, gdp, csum);
>>  }
>>  
>> +/*
>> + * Update inode bitmap checksum for a single flipped bit.
>> + *
>> + * Use crc32c_flip_range() to incrementally update the checksum after
>> + * flipping the bit at @offset, avoiding a full bitmap CRC rescan.
>> + * The csum_seed cancels out in the XOR delta, so it is not needed here.
>> + */
>> +void ext4_inode_bitmap_csum_set_fast(struct super_block *sb,
>> +				     struct ext4_group_desc *gdp,
>> +				     ext4_grpblk_t offset)
>> +{
>> +	__u32 new_csum, old_csum;
>> +
>> +	if (!ext4_has_feature_metadata_csum(sb))
>> +		return;
>> +
>> +	old_csum = ext4_inode_bitmap_csum_get(sb, gdp);
>> +	new_csum = crc32c_flip_range(old_csum, EXT4_INODES_PER_GROUP(sb),
>> +				     offset, 1);
> Does this code properly handle filesystems where s_inodes_per_group is not
> a multiple of 8?
>
> Looking at the full recalculation path in ext4_inode_bitmap_csum_set(), the
> checksum is calculated over a byte-aligned size:
>
> fs/ext4/bitmap.c:ext4_inode_bitmap_csum_set() {
>     ...
>     sz = EXT4_INODES_PER_GROUP(sb) >> 3;
>     csum = ext4_chksum(sbi->s_csum_seed, (__u8 *)bh->b_data, sz);
>     ...
> }
>
> Since ext4_inode_bitmap_csum_set() effectively truncates the length to a
> multiple of 8 bytes, while the fast path uses the exact EXT4_INODES_PER_GROUP
> value as total_bits, could this mismatch cause the trailing_bits calculation
> in crc32c_flip_range() to shift the XOR delta incorrectly?
>
> If a filesystem image has an unaligned s_inodes_per_group, it appears this
> could result in a checksum mismatch on subsequent verifications.
>
> Additionally, if the offset falls in the unaligned bits (for example, if
> offset >= sz * 8), would this fast path apply a delta while the full rescan
> ignores those bits entirely?
>

When formatting, it is ensured that EXT4_INODES_PER_GROUP is a multiple
of 8, so this is an implicit guarantee, and there are no explicit checks
in the kernel or fsck.

To be safe, in the next version, I will, like ext4_inode_bitmap_csum_set,
align it down to 8.


Thanks,
Baokun


