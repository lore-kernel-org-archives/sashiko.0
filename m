Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF0C2727F3
	for <sashiko@lists.linux.dev>; Mon, 11 May 2026 06:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778480258; cv=none; b=ZMcspeUlnlQ1o24f1eekp4oSsHKxwYjafeu+mh09gcfcHWeWi6s8ZYp0ZMvuuZEevwGlKvlQAebBYRmH567IztImlu74sA27wlfp795aCoeGY6j7EO1kU1eDisQSeXmvewN+zEZZUm3vU2ETizzE+MtWNvfS0z/5k7THJ+5mhBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778480258; c=relaxed/simple;
	bh=bjpqWqZBTv86Wgi+M3Ef4MSvvQGLglLW3264wQHaDqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eHA1xJ1VZWpcuJs0epUXrCbpeJ58qfAVQE0S15YL8sL3OuRt0j5isCL0Nj4qI7Y37ScBxT8gKUoXaR7o24PP8/1g2zZqF5K1irzR/9p4TTNRGaOlPA76ViaXD4bmdtyq6r5Sio0kLI8pkySVwhQJpocgJGq5KkxHgKbdow6TGjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=DbM3pzfQ; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="DbM3pzfQ"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778480248; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=T12/0ptAxHHW4CrvUbfORcdeWQo2656/KlT3CV8cDlA=;
	b=DbM3pzfQPS7QRlgAqrNgh5PXVfovVTkOCVQBgySeV6QF+eama/mzHwnG+weC+hYgAophiYLtRfmMaK7vTetZacRVe7CMnpunLLSH6EV1PmUDYo4ZH5JOf9keV+mgdCRQxQHonXFN9cjiWqk73GBES3BzilV63iLY8q72buusg10=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=libaokun@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0X2evw3e_1778480246;
Received: from 30.221.130.252(mailfrom:libaokun@linux.alibaba.com fp:SMTPD_---0X2evw3e_1778480246 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 11 May 2026 14:17:26 +0800
Message-ID: <a1fc6424-9d62-4540-9b6a-8afb9fb64972@linux.alibaba.com>
Date: Mon, 11 May 2026 14:17:25 +0800
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 04/17] ext4: fix incorrect block bitmap free clusters
 update on metadata overlap
To: sashiko@lists.linux.dev
Cc: tytso@mit.edu, libaokun@linux.alibaba.com
References: <20260508121539.4174601-5-libaokun@linux.alibaba.com>
 <20260508211732.E50B4C2BCB0@smtp.kernel.org>
From: Baokun Li <libaokun@linux.alibaba.com>
In-Reply-To: <20260508211732.E50B4C2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

在 2026/5/9 05:17, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Incomplete Error Recovery / Buddy Cache Inconsistency
> - [High] State Inconsistency / Global Counter Desync
> --
>
> commit 3b816cdf85c67263b3c35b6097c935d14091d27d
> Author: Baokun Li <libaokun@linux.alibaba.com>
>
> ext4: fix incorrect block bitmap free clusters update on metadata overlap
>
> In ext4_mb_mark_diskspace_used(), when the allocator detects that the
> allocated blocks overlap with filesystem metadata, it enters an error
> recovery path that marks these blocks as used in the bitmap via
> ext4_mb_mark_context() with flags=0.
>
> [ ... ]
>
>> diff --git a/fs/ext4/mballoc.c b/fs/ext4/mballoc.c
>> --- a/fs/ext4/mballoc.c
>> +++ b/fs/ext4/mballoc.c
>> @@ -4228,7 +4228,7 @@ ext4_mb_mark_diskspace_used(struct ext4_allocation_context *ac, handle_t *handle
>>  					   ac->ac_b_ex.fe_group,
>>  					   ac->ac_b_ex.fe_start,
>>  					   ac->ac_b_ex.fe_len,
>> -					   0, NULL);
>> +					   EXT4_MB_BITMAP_MARKED_CHECK, NULL);
> This isn't a regression introduced by this patch, but by passing NULL for
> the changed pointer, the global sbi->s_freeclusters_counter is not
> decremented for these leaked blocks.
>
> Because the group descriptors are decremented to reflect the leaked blocks
> but the global counter is not, does this cause the global free space counter
> to permanently overestimate available space?
>
> Could this allow ext4_claim_free_clusters() to succeed when there is
> actually no space, leading to delayed allocation ENOSPC errors during
> writeback?
>
> Additionally, if ext4_mb_mark_diskspace_used() returns -EFSCORRUPTED, the
> caller ext4_mb_new_blocks() will handle the failure by invoking
> ext4_discard_allocated_blocks().
>
> Since ext4_discard_allocated_blocks() calls mb_free_blocks() to clear the
> bits in the in-memory buddy cache and/or restores them to the preallocation
> space, doesn't this completely defeat the attempt to leak the blocks here?
>
> Will the next allocation request for this block group find the identical
> overlapping blocks in the buddy cache, allocate them, and hit the same
> metadata overlap check again?
>
> Could this be fixed by clearing ac->ac_b_ex.fe_len and ac->ac_f_ex.fe_len
> before returning the error, to prevent the rollback function from freeing
> the blocks in the buddy cache?

Indeed, there are some issues with this error path handling itself,
and I will add a patch to fix it in the next version.


Thanks,
Baokun

>
>>  		if (!err)
>>  			err = -EFSCORRUPTED;
>>  		return err;


