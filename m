Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F503B8920
	for <sashiko@lists.linux.dev>; Mon, 11 May 2026 08:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486999; cv=none; b=FCnlkRQ6rgJ/uIj/+rokPRtrLmwKC3OJleMXo3AvgYK2a82tMRetR3HVicyXrJf18X/jkNPNmffpjcUvH1QckfZetbxzmDJoFh4UbJpZHON+6Qrpos2HITsyAA6vpuTL7L6F4ODks0fBI+Qd8NmH5k1beldZ7ioftfL/uEyAXiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486999; c=relaxed/simple;
	bh=3apolpNw/Uot1Mew/dfntezwhcHoTTsyXV7Xv39xeyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iA9VJ7ArIjNjzjW2EKZlBeLKq9ovfsSylDjYjFz6CoG07oklUB7mxCKVdHZGCFNBB5a0XFYxYzD1Uv5PxSbF90uKXlyBx32PfsgRjz3FO6CtX4trqQSv+WLOB0SIesn1EUk+3tu7yp4azFxX+pyrAuQA9DQJf3wJMI3F5B9R+Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=C5ChmlH0; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="C5ChmlH0"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778486984; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=26U6XQqkytPzWwcpRZHHBwYf3uM7hp6Nk0BAiW6aV0c=;
	b=C5ChmlH02RV+dDOkkkuXb02Y2MK95/cQecHuH+ijF5rOkgUHvIhKwzJQxNyTcRgBOasR0IGLYf6ds3gRm/YrpMjT1YYpEyyrqQq6z+BLX9/TEYgCNG12tcBgpZ4ATMOzdSv61Aqo3OaDDDbfNz+4snqqk8Xh7m7HQtCVKn7zTVg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R991e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=libaokun@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0X2gsYFS_1778486982;
Received: from 30.221.130.252(mailfrom:libaokun@linux.alibaba.com fp:SMTPD_---0X2gsYFS_1778486982 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 11 May 2026 16:09:43 +0800
Message-ID: <6176eb67-3f64-43a1-a18d-db5d93fd26d4@linux.alibaba.com>
Date: Mon, 11 May 2026 16:09:42 +0800
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/17] ext4: add ext4_block_bitmap_csum_set_range()
 for incremental checksum update
To: sashiko@lists.linux.dev
Cc: tytso@mit.edu, libaokun@linux.alibaba.com
References: <20260508121539.4174601-7-libaokun@linux.alibaba.com>
 <20260508214640.B3A74C2BCB0@smtp.kernel.org>
From: Baokun Li <libaokun@linux.alibaba.com>
In-Reply-To: <20260508214640.B3A74C2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

在 2026/5/9 05:46, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] ext4_block_bitmap_csum_set_range() passes an incorrect `total_bits` value to `crc32c_flip_range()` when `EXT4_CLUSTERS_PER_GROUP(sb)` is not a multiple of 8, leading to corrupted checksums.
> --
>
> commit 49b9ace366232b1d340c2393c53c09a694007211
> Author: Baokun Li <libaokun@linux.alibaba.com>
>
> ext4: add ext4_block_bitmap_csum_set_range() for incremental checksum update
>
> This commit adds a helper function to incrementally update the block bitmap
> checksum using crc32c_flip_range(). This efficiently computes the CRC delta
> for a range of flipped bits without re-scanning the entire bitmap buffer.
>
>> diff --git a/fs/ext4/bitmap.c b/fs/ext4/bitmap.c
>> index 46affc9e80ca3..00b0a3c748596 100644
>> --- a/fs/ext4/bitmap.c
>> +++ b/fs/ext4/bitmap.c
> [ ... ]
>> +void ext4_block_bitmap_csum_set_range(struct super_block *sb,
>> +				      struct ext4_group_desc *gdp,
>> +				      ext4_grpblk_t offset, ext4_grpblk_t len)
>> +{
>> +	__u32 new_csum, old_csum;
>> +
>> +	if (!ext4_has_feature_metadata_csum(sb))
>> +		return;
>> +
>> +	old_csum = ext4_block_bitmap_csum_get(sb, gdp);
>> +	new_csum = crc32c_flip_range(old_csum, EXT4_CLUSTERS_PER_GROUP(sb),
>> +				     offset, len);
> Does passing EXT4_CLUSTERS_PER_GROUP(sb) here cause a checksum mismatch if
> the clusters per group is not a multiple of 8?
>
> In ext4_block_bitmap_csum_set(), the full checksum is calculated over exactly
> EXT4_CLUSTERS_PER_GROUP(sb) / 8 bytes, ignoring fractional trailing bits:
>
> fs/ext4/bitmap.c:ext4_block_bitmap_csum_set() {
>     int sz = EXT4_CLUSTERS_PER_GROUP(sb) / 8;
>     ...
>     csum = ext4_chksum(sbi->s_csum_seed, (__u8 *)bh->b_data, sz);
> }
>
> If crc32c_flip_range() uses the unaligned bit count as total_bits, the
> trailing_bits shift calculation will use the wrong baseline length. This
> could result in an incorrect checksum delta being applied for bit flips
> within the byte-aligned region.
>
> Would this also erroneously apply a CRC delta if an allocation or free occurs
> in the fractional trailing bits that the full recalculation ignores?
>
When formatting, it is ensured that EXT4_CLUSTERS_PER_GROUP is a multiple
of 8, so this is an implicit guarantee, and there are no explicit checks
in the kernel or fsck.

To be safe, in the next version, I will, like ext4_block_bitmap_csum_set,
align it down to 8.


Thanks,
Baokun

