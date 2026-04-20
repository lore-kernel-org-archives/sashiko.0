Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAEB40DFBD
	for <sashiko@lists.linux.dev>; Mon, 20 Apr 2026 07:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776671874; cv=none; b=uH+JdN9c0aUMJswAq7Paf821nVPGVbQDTKZTxPs68fv53dvUpX/ePvVDboMHiRT5CC7gg12gc0T9ZVqWVM4pByUYtZba6oReUCHKUR6TqZlt7XNgvDDkom8SI7Z8ejyhgiDy9XjUVg0TC5XekU+eoEcpfZFtz/zINIUSsk6n67k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776671874; c=relaxed/simple;
	bh=uqcXnkpiCXx3AIuoIba9VmBblLvUW/Cg0n5Cg8ykg50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zmz9OcrY4LPJ73Sp45hL4xM88NJMW7PODfHe4CeTCa3gLCPzj/hGEs8RLxLvnKY5L2q4hv6e/R9lDOXLKac9HXtLsot9HoExrXhkYJikwlbgoiDentNr/wBTTxEPXMrYlXRuL0LiM64lpZpKg/6kZWyzcK5WWUCqSSkAy55uK+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B70EVUsw; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B70EVUsw"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82f2766905fso1139544b3a.3
        for <sashiko@lists.linux.dev>; Mon, 20 Apr 2026 00:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776671871; x=1777276671; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqZKdQIUH7jTkvcMEPi7Hm7hAK7t3G5GOLUmrPxBDk4=;
        b=B70EVUsws7mZ//HJ4dkjpV7nMTHzwLVIyiPXImRA7tNS92PVE94XSrFX+lEC9yjpfw
         Vv14Szxqne3gxjklTBjFacFVqZBAXvgdQNvX85aax/r9NUJkO8uRct0vvMRyS4xq/2vC
         pwSxU6gI/jVMZiEcmaC7HKN8Zl+To2ToJxxsYH9MCvGGKxdTklEKitJkpK8TCiIzlSB6
         8L3NyowxLB8dgxjyICkaXnQHxKY4vLUqjg0djro+iAPbOU9320O8B1DzNXoxtwxkPis7
         SZRuu+9PvSCjAzsKJx0RV8MlucupNthG9Qk844P1ws0GZSdFlGV0080mx6hgTooUMer1
         K5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776671871; x=1777276671;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZqZKdQIUH7jTkvcMEPi7Hm7hAK7t3G5GOLUmrPxBDk4=;
        b=NDV0XbtjEDG9NOOG/fipP/rwqCp5ICn8iNJgidv3r/RJAlGKiDRbzv3bi6HD9C578h
         bUuxug38iU515QXWf7wJhIw4da4TTQ9WfsZ6yOtEA2oKzhiswjMmlpSvx+yRmT052BLI
         qtO6oGSKALxdLMXQuCCQQtwQybv7hTKXwQqm51sm64yxq3vbz+RQ6XIVrcC2P0JurlgQ
         fVjFx00FKAAvHS+3n991UnCcw2+RBKEn/ydJ5zIGBQQIsiNdyFV356mo/WcRiLP4zzS0
         dKq41qeNV1WBVrpB0PoEE0AKJ81ktiEuGydRzUPpMaLZ820dbZq+IiwfjVXHfF4jI15L
         Acqw==
X-Gm-Message-State: AOJu0YxWlMlrZu7jYNK5BvQSO0m92OOSXTpfTvV+6enE24k7nf8Diskk
	1B9eHrTUrc7h++TNDhfTqrM0WGEU+mlK8KisFRej7qFNXfGRfH2tx4UuOqarOLm92NM=
X-Gm-Gg: AeBDiesW6TTOtpQRr/GXrSG4wFFHzp/6AyJ/ZtL3vcrXH5PTHg7haWa9s6YFk2+fQjY
	Jk7AysVvbDizjQaNEduP552IVCjODybPfkhJJlp+WzD7xujehrxN5zxuc6aHwVhYZeDhxJMqb6m
	s0YgoJqa+EzwjJjJ/eloK/0+5vrIyvMb+ZMizhXENJYd8AfHFnb/7crYkYeEqpilYsuLr/WGd8G
	40zwNxCLZF+GdMtVhgX9B175NzB4/GvpS6eQD2ZiyroKwkYa4IyqZ0VQTCQ3irmshMEpDFEzzbJ
	l6eFzLG1kJBnIaG/Lu/kXURDNOwL2DdSt6nimIqi+ZxcQM+mUsrXsVLu8KLOjSVAgcBPYNhvw1e
	ftYjNg8pKaNFq5jywZvs7ogHrgUoDzPaTZ6MinkNQw+FQlE439VsQUTWZPIGfwUTWcTAhv5a5SP
	nDf65xmnE70hADf6NKmIrxmI5KovQ82pgM4FrgG9Cq5LHHadaIMkOVmQ3CwEVLssyXXjs=
X-Received: by 2002:a05:6a00:4085:b0:82f:38df:681c with SMTP id d2e1a72fcca58-82f8c7dd179mr12207976b3a.6.1776671871389;
        Mon, 20 Apr 2026 00:57:51 -0700 (PDT)
Received: from [10.4.95.172] ([139.177.225.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebcc9easm12633109b3a.39.2026.04.20.00.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 00:57:50 -0700 (PDT)
Message-ID: <6687ecc5-fa35-446e-801c-ff737a4c967c@gmail.com>
Date: Mon, 20 Apr 2026 15:56:32 +0800
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iomap: avoid memset iomap when iter is done
To: sashiko@lists.linux.dev
Cc: tytso@mit.edu
References: <20260420061630.62077-1-changfengnan@bytedance.com>
 <20260420073254.996FAC19425@smtp.kernel.org>
From: Fengnan Chang <fengnanchang@gmail.com>
In-Reply-To: <20260420073254.996FAC19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/4/20 15:32, sashiko-bot@kernel.org 写道:
> Sashiko AI review found 1 potential issue(s):
> - [High] Early return paths in `iomap_iter()` bypass `folio_batch` cleanup, leaking page references.
> --
>
> commit 20686db0394fe5c92c4d207b4ec3987147d0e1ab
> Author: Fengnan Chang <fengnanchang@gmail.com>
>
> iomap: avoid memset iomap when iter is done
>
> This commit splits the cleanup logic in iomap_iter() to avoid wasted memory
> writes by skipping the memset of iomap and srcmap when iteration finishes,
> while extracting the folio_batch release into iomap_iter_clean_fbatch().
>
>> However, we MUST still call iomap_iter_reset_iomap() to release the
>> folio_batch if IOMAP_F_FOLIO_BATCH is set, otherwise we leak page
>> references. Therefore, split the cleanup logic: always release the
>> folio_batch, but skip the memset() when ret <= 0.
> Does this actually always release the folio_batch?

Just skip memset, always release the folio_batch.

>
>> diff --git a/fs/iomap/iter.c b/fs/iomap/iter.c
>> index c04796f6e57fa..e4a29829591a7 100644
>> --- a/fs/iomap/iter.c
>> +++ b/fs/iomap/iter.c
> [ ... ]
>> @@ -102,10 +98,14 @@ int iomap_iter(struct iomap_iter *iter, const struct iomap_ops *ops)
>>   		ret = 0;
>>   	else
>>   		ret = 1;
>> -	iomap_iter_reset_iomap(iter);
>> +	iomap_iter_clean_fbatch(iter);
>> +	iter->status = 0;
>>   	if (ret <= 0)
>>   		return ret;
>>   
>> +	memset(&iter->iomap, 0, sizeof(iter->iomap));
>> +	memset(&iter->srcmap, 0, sizeof(iter->srcmap));
>> +
>>   begin:
>>   	ret = ops->iomap_begin(iter->inode, iter->pos, iter->len, iter->flags,
>>   			       &iter->iomap, &iter->srcmap);
> If ops->iomap_begin() populates iter->fbatch and sets IOMAP_F_FOLIO_BATCH
> (for example, via iomap_fill_dirty_folios() in
> xfs_buffered_write_iomap_begin()) but subsequently fails, the next lines
> in the function are:
>
> 	if (ret < 0)
> 		return ret;
>
> This returns directly and bypasses the iomap_iter_clean_fbatch() call.
>
> There is also a similar early return at the start of iomap_iter() before
> the new cleanup logic:
>
> 	if (ops->iomap_end) {
> 		ret = ops->iomap_end(iter->inode, iter->iter_start_pos,
> 				iomap_length_trim(iter, iter->iter_start_pos,
> 						  olen),
> 				advanced, iter->flags, &iter->iomap);
> 		if (ret < 0 && !advanced)
> 			return ret;
>
> If ops->iomap_end() fails without advancing, this early return also skips
> the cleanup.
>
> Since callers like iomap_zero_range() allocate the batch on the stack and
> rely on iomap_iter() for cleanup, could these error paths leak folio
> references when transient I/O errors occur?
>

