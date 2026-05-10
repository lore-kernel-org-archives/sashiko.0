Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2B534404B
	for <sashiko@lists.linux.dev>; Sun, 10 May 2026 10:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778407403; cv=none; b=T2mWwk/L9D6BYCJ4dw/y3oa5MVDq+XTi1CF8pQLLht0doM4Z1nKxClErhkPkxAacNTZ1fm6+rtnYQg8xpdNtysEAXmWpRfXJ2vf3tg1GwtNzn+r1R4g1wgCfcOHs0oNW7k1b/Kf1ssBxQN582113O7W2ew+o7XFbj4XevocGBog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778407403; c=relaxed/simple;
	bh=AIKNsVes3rWRoBK/EvJbEiUSU7avf2yp9DACGkcNjDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LTbMtQNZotxXl3KBmHWJImb6a2g4r6RBttNoF9jxMgG5AbOMOoD46HKInnSU9V0/CWRn9E60DSlEWJ6R25Ml0pRH+J1/IquVctDtYy8Ikg4nkCrHqC+tWPPNCyhVr4VXTWODIrRKmHT0QcBO/o8ALzSvHhpvr3niFgPwSlZncrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=EsvM3HQ7; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="EsvM3HQ7"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778407392; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=dvqSo8CpLOAdQsUVRdz4LYwyeHvenk4BWoS/9rLyoxU=;
	b=EsvM3HQ712HB1yz0dtyjMlrQVYipoTZaKQo3d6g9RqTAlmwdpRvyTXqHJiSG1B9dxE6P+emkUvHMJnSNIOemdRJ+MzbxoRTPGgoFEy6cuNzdrpnh74qV4vmWnZ0xHoFEEJobDAcf4HToLojfDnKweWzstHecKTf8pbMuHPqYPhg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=libaokun@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0X2cShZX_1778407390;
Received: from 30.43.150.40(mailfrom:libaokun@linux.alibaba.com fp:SMTPD_---0X2cShZX_1778407390 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 10 May 2026 18:03:10 +0800
Message-ID: <ab455ad7-0f4f-404a-a774-da4b32da1b7b@linux.alibaba.com>
Date: Sun, 10 May 2026 18:03:05 +0800
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 03/17] lib/crc: crc_kunit: add benchmark for
 crc32c_flip_range()
To: sashiko@lists.linux.dev
Cc: tytso@mit.edu
References: <20260508121539.4174601-4-libaokun@linux.alibaba.com>
 <20260508205415.8B843C2BCB0@smtp.kernel.org>
From: Baokun Li <libaokun@linux.alibaba.com>
In-Reply-To: <20260508205415.8B843C2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

在 2026/5/9 04:54, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Native 64-bit division (`/ 10`) and modulo (`% 10`) on `u64` values will cause build failures on 32-bit architectures.
> --
>
> commit d1411c693c30ea46d5821fc2f72f158dd0cea8d2
> Author: Baokun Li <libaokun@linux.alibaba.com>
>
> lib/crc: crc_kunit: add benchmark for crc32c_flip_range()
>
> This commit adds a kunit benchmark to compare crc32c_flip_range() against
> full crc32c recomputation for various bitmap sizes.
>
>> diff --git a/lib/crc/tests/crc_kunit.c b/lib/crc/tests/crc_kunit.c
>> --- a/lib/crc/tests/crc_kunit.c
>> +++ b/lib/crc/tests/crc_kunit.c
> [ ... ]
>
>> +static void crc32c_flip_range_benchmark(struct kunit *test)
>> +{
> [ ... ]
>
>> +		kunit_info(test,
>> +			   "bitmap=%zu: flip_range=%llu ns, full_crc=%llu ns, speedup=%llu.%01llux\n",
>> +			   buflen,
>> +			   div64_u64(t_flip, num_iters),
>> +			   div64_u64(t_full, num_iters),
>> +			   div64_u64(t_full * 10, t_flip ? t_flip : 1) / 10,
>> +			   div64_u64(t_full * 10, t_flip ? t_flip : 1) % 10);
> Since div64_u64() returns a u64, will applying the native division (/ 10)
> and modulo (% 10) operators directly to this return value cause build
> failures on 32-bit architectures?
>
> The kernel typically prevents native 64-bit division to catch performance
> issues, which results in linker errors for __udivdi3 and __umoddi3 on 32-bit
> builds.
>
> Should this use a helper like div_u64_rem() instead?
>
>
Yes, it should. I’ll update it to use the div_u64_rem() helper.


Thanks,
Baokun

