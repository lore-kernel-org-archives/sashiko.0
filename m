Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97633B8958
	for <sashiko@lists.linux.dev>; Mon, 11 May 2026 08:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778488281; cv=none; b=DwsjKPj9qlFL43fH5RGhr7i9gMhncpBSVXEi+LCnx2puYusqJmBO1eU6n+4NnuGVtNLZbDpEcjKbdHi/p0gBeUtzip3eRwEV4JiPacX5rH0HpKxzR6QopH/P1u+Lig2MFOv9lalSWoKgTsb5CSVak3H/pOfsCd4IBnV6yGyQeB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778488281; c=relaxed/simple;
	bh=QKgChCUUFeYfod8q6sKLVgSE2IHQMOBNY9pexxiNrXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Evpmj2roZOvan9r1Mmx+4wBkZAQnrycGebYPGlzLuI80iaBMvPzmRFnq2MIVVJ1IIkiRKW9ARvP+TTgGSZPJsBtQ8xLJav+oKxK0hT8rwgw4vmCT8qdfOmTSUJf7LfQ9DH9MDYVOE2IEUxEC3ik2+Pbb5FyF0x7RnPj65LtaZCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=fnKPSIAa; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="fnKPSIAa"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778488266; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=c9rNL5vQYJbXkqM4jxAKRnpXbGOKhnD1IHPwIMRzWZ0=;
	b=fnKPSIAawVuE6AbegQ6OCv83G2HHk7NKsoS4ZEtlqZMhtMmDH5XpilS6QyASJSDVHL9VrXjLeieKVcgJAZ5euirhKThK8b62I8vk06ACtH6hAL1wpPRQn96OoVJQNhhfcTdmQB3uzzStaStTndRZmCZ4NhcYdfUpUTf2LHClQZA=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=libaokun@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0X2gi2Ss_1778488265;
Received: from 30.221.130.252(mailfrom:libaokun@linux.alibaba.com fp:SMTPD_---0X2gi2Ss_1778488265 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 11 May 2026 16:31:05 +0800
Message-ID: <bb3ffe68-8b0b-4fca-be74-f3a398746015@linux.alibaba.com>
Date: Mon, 11 May 2026 16:31:04 +0800
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
>> +
>> +	ext4_block_bitmap_csum_store(sb, gdp, new_csum);
>> +}


Yes, I missed the case of errors=continue. In the next version, I will
revert to full calculation when EXT4_ERROR_FS is set.


Thanks,
Baokun


