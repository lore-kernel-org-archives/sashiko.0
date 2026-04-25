Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844B1313532
	for <sashiko@lists.linux.dev>; Sat, 25 Apr 2026 21:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777152246; cv=none; b=A1ikeyFd3P67ARxaj6cGpBxRqFkgIda0qSaeA2iGe2Y1WOJ7LwRVpzmkQcSOKA82ETbqcHtlIzvMu9s8TKwRje83t+hDDHLR12d/q6g9MZxRnXW3fChU1OH2Im8x5C5LWEl8X5/pOFVCySmBwGp5sdSfCf77RwI9qqzk7CRXINQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777152246; c=relaxed/simple;
	bh=1oR1maHWr2VxA3bzm372xAgJuAsbHxTX80jv0ysGOuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r5OdzgSv7g0utkBkYCh6x4VclHUkXmRjckiBZnC23y/MjDowieyhxRF+Pir+298rMEk5FK3YpkYlkG1d+4n8dghmc1PB7HlK81AvCykKJUMKo8bOUti7IjgyBgApN/1uRw33MPaTNQuf1vQON6xlNp2zoOtohZ+sBn7y7yduDPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dAcckXEb; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dAcckXEb"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso92331225e9.1
        for <sashiko@lists.linux.dev>; Sat, 25 Apr 2026 14:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777152241; x=1777757041; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DQZKJCwTCaw4HCfH21SJ/CrBDJiSNTq7WQ9W8kxFMU8=;
        b=dAcckXEbYnXt1X0odTvJkHZvRz0cumSKY5QOVIqlFaBuyWXdttidJo3wNopPdmMuCM
         e6rrfCHTJ8ZcReZD6JO2WgdRCvP5ofpD1BJiTNbKrlxlP34LkUcQU1GC4KTef5k5hlyF
         RvgdcA+6WFMtzYPVPNZN1GcD9MSJnaI0MRK9UbaqMNbAj/P+sbo6b+pI7o5YnYB2+Wmd
         HFhbRvc2Qq9DfpXeL2jmlblD12IQRlVgvsU5KaNSOaiwH/4vp7wYaDgfHt1m5RByW1i4
         IXPFakDk6NvxpjWRX18fBB0dwH/QRBiB6bMnlGdxZZXcLoi093CDgLWNn46ylUJrZqZD
         EokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777152241; x=1777757041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQZKJCwTCaw4HCfH21SJ/CrBDJiSNTq7WQ9W8kxFMU8=;
        b=dM58F9RssbE35ovk+384qiT69vXtw6ikjI2ADU4y9f9GMohQXm+7TXKfOeNmaQ9K8+
         z20vFiRvyp0gQlHG4VQUVi2j0i8mvL9GsQkuZctQ9269a9a/+QuAd6oFIXy1tsss7kgo
         Rh91ei1NH0UOK748Vu4ZVV3a6FQv5FMVOXHCiHIVHzf1IbJOqZSM41Pm8iavckumaoLZ
         XgjinDR6AcjbquO+XKWRNkoNA2yepFtJyZmZEyJteuUF1JVNIVVg5tQADRzN3kuVRa1P
         qrRUR2MFTe7DgjKHrc/vo+5VU7SrIE0VKA5VOq+rvi/txlB9dO9vns+mhd+Q2y1hQWqI
         ZXlA==
X-Gm-Message-State: AOJu0Yxp5uMx8h+S+SbPfueyMGtuhpeAmXOQCXschZnctZbUBEAQvfEJ
	8AiNCEsAU2vXo9KLWTewHPQzbwLEcadcPdFmUKo/IHpYCbouaWtl5RsYFGhPKw==
X-Gm-Gg: AeBDieu9n0rH0bFhjkEi1Y7Qj4MPBiuvm9ZdHsluDKxBzqYiguWaO+d2BrhmQIXiEdm
	A1UlnG7v65yJJaGNClQMt9x39QL+rSLu3VDQEC25LRkHNAizTtBDhIOQYug1yAvnVCsYoDp7LIw
	Bixm0E6QEfJWDv7OlAthglIqhBXRNJ+y8j1jkrk8EVQXu4lXCuS4g+vN68pxlufc2fwR1FN41OD
	convPlmFomoo3d/2gF0xljSbevCkVFmYUboiWKEMD0tk8Q/4VJcJkMD1F3vgVIDnbGyQMYLnilD
	xOHXjkPc2Y48K01vM/mN1PwN0lF1XaYJSpMrXkmnYv6GQssQm36JqBX39Ds8NF/qeLUyTg4xESL
	YZ4AzEPo7VXozVtZqNjtnQ0z5xGnmM5oL2at2dTHbP8Y7AXwKamhwdi4TBOLIvyNKeVX8bNVcj1
	uDJXe7JgkLZDefc5sKkAzKMliwkIwnZdJ8hFyIp8L2MSg+BPZdBYh0KMt1u7Uilr+PdgM22dcYT
	rQjVZTNSXJz7QUPaASP0A==
X-Received: by 2002:a05:600c:8b64:b0:48a:56de:d62a with SMTP id 5b1f17b1804b1-48a56dedb1emr282778415e9.11.1777152241064;
        Sat, 25 Apr 2026 14:24:01 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd1f:f500:f867:fc8a:5174:5755? ([2a01:4b00:bd1f:f500:f867:fc8a:5174:5755])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c773fsm761739425e9.12.2026.04.25.14.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2026 14:24:00 -0700 (PDT)
Message-ID: <dd0057c1-e0b2-4559-afe9-2bf19760f68b@gmail.com>
Date: Sat, 25 Apr 2026 22:24:00 +0100
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 04/10] bpf: Implement batch ops and iterators
 for resizable hashtab
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260424-rhash-v3-4-d0fa0ce4379b@meta.com>
 <20260424202858.7DD0FC19425@smtp.kernel.org>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20260424202858.7DD0FC19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/24/26 9:28 PM, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 4 potential issue(s):
> - [High] Cursor invalidation in batch and seq_file iterators causes O(N^2) complexity and infinite loops.
> - [High] Unbounded RCU read lock duration in batch operations allows user-triggered RCU stalls.
> - [High] Map iterators and seq_file dumps spuriously abort during normal background resizes.
> - [High] Deadlock risk in `bpf_each_rhash_elem` due to acquiring `spin_lock` from atomic contexts.
> --
> 
> commit 9f7ce51619eb27e8a4a65df12f862e12e34bc285
> Author: Mykyta Yatsenko <yatsenko@meta.com>
> 
> bpf: Implement batch ops and iterators for resizable hashtab
> 
> This commit adds batch operations for resizable hashtab maps, using
> rhashtable_walk_enter_from() to resume iteration. It also wires up
> seq_file BPF iterators and implements rhtab_map_mem_usage().
> 
>> diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
>> index d37f3d548d3658..000caa2c7f4cd9 100644
>> --- a/kernel/bpf/hashtab.c
>> +++ b/kernel/bpf/hashtab.c
> 
> [ ... ]
> 
>> @@ -3066,64 +3066,330 @@ static int rhtab_map_get_next_key(struct bpf_map *map, void *key, void *next_key
>> +static long bpf_each_rhash_elem(struct bpf_map *map, bpf_callback_t callback_fn,
>> +				void *callback_ctx, u64 flags)
>> +{
> 
> [ ... ]
> 
>> +	/*
>> +	 * The rhashtable walk API uses spin_lock in rhashtable_walk_start/stop,
>> +	 * which is not safe in NMI or soft/hard IRQ context.
>> +	 */
>> +	if (in_nmi() || in_hardirq() || in_softirq())
>> +		return -EOPNOTSUPP;
>> +
>> +	rhashtable_walk_enter(&rhtab->ht, &iter);
> 
> Does this adequately protect against deadlocks when called from kprobes or
> tracepoints in process context with preemption disabled?
> 
> If a thread currently holding ht->lock (e.g., during map insertion) is
> interrupted by a kprobe that runs this BPF program, attempting to acquire
> the same spin_lock inside rhashtable_walk_enter() might cause a deadlock.
> 
>> +	rhashtable_walk_start(&iter);
>> +
>> +	while ((elem = rhashtable_walk_next(&iter))) {
>> +		/* rhashtable_walk_next returns -EAGAIN on resize, abort */
>> +		if (IS_ERR(elem)) {
>> +			num_elems = -EBUSY;
>> +			break;
>> +		}
> 
> Is it expected to abort the entire iteration if a background map resize
> occurs? 
> 
> rhashtable_walk_next() returns -EAGAIN to indicate the table was resized and
> the iterator was rewound. Since resizable hashtabs automatically resize
> during normal workloads, returning -EBUSY here could cause
> bpf_for_each_map_elem() and bpftool map dumps to randomly fail.
> 
> Should this handle -EAGAIN by retrying or continuing the walk instead?

No, resize is not handled automatically.

> 
> [ ... ]
> 
>> +static int __rhtab_map_lookup_and_delete_batch(struct bpf_map *map,
>> +					       const union bpf_attr *attr,
>> +					       union bpf_attr __user *uattr,
>> +					       bool do_delete)
>> +{
> 
> [ ... ]
> 
>> +	/*
>> +	 * Use the last key from the previous batch as cursor.
>> +	 * enter_from positions at that key's bucket, walk_next
>> +	 * returns the successor in O(1).
>> +	 * First call (ubatch == NULL): starts from bucket 0.
>> +	 */
>> +	if (ubatch) {
>> +		buf = kmalloc(key_size, GFP_USER | __GFP_NOWARN);
>> +		if (!buf) {
>> +			ret = -ENOMEM;
>> +			goto free;
>> +		}
>> +		if (copy_from_user(buf, ubatch, key_size)) {
>> +			ret = -EFAULT;
>> +			goto free;
>> +		}
>> +	}
>> +
>> +	scoped_guard(rcu) {
>> +		rhashtable_walk_enter_from(&rhtab->ht, &iter, buf, rhtab->params);
>> +		rhashtable_walk_start(&iter);
>> +	}
> 
> If the key stored in buf was already deleted, will this iteration restart
> from the beginning of the map?
>

 
yes, if cursor is deleted, iteration is restarted.

> Looking at rhashtable_walk_enter_from(), if it fails to find the key, it
> leaves iter->slot at 0. Then rhashtable_walk_start() and walk_next() will
> start from bucket 0 instead of where the previous batch left off.
> 
> Since lookup_and_delete_batch deletes the elements returned in the previous
> batch, the cursor key will always be deleted. Could this cause the iterator
> to repeatedly scan over all emptied buckets, resulting in an expensive
> traversal?
> 

If too many elements are deleted, the table will be resized, so the
number of empty buckets traversed should not be very big. But this is a
good point, we may not need to store the cursor at all.

> Similarly, for lookup_batch and seq_file dumps, if the cursor is
> concurrently deleted, could this trap userspace in an infinite loop of
> duplicate elements?
> 

This should not cause infinite loop, if cursor is deleted every time,
we'll run out of elements. Table resize exposes any iterators to the risk
of duplicate elements, it's up to user to make sure table is in steady
state when iterating.

>> +
>> +	dst_key = keys;
>> +	dst_val = values;
>> +	total = 0;
>> +
>> +	while (total < max_count) {
>> +		elem = rhtab_iter_next(&iter);
>> +		if (!elem)
>> +			break;
> 
> Can this loop cause RCU stalls or soft lockups if max_count is very large? 
> 
> The max_count parameter is controlled by userspace. Since
> rhashtable_walk_start() acquires the RCU read-side critical section, this
> loop might iterate, copy memory, and process millions of elements without
> ever dropping the RCU lock or calling cond_resched().
>
 
Existing htab does handle this situation; maybe splitting big batch into
smaller chunks with 
```
rcu_read_unlock();
bpf_enable_instrumentation();
```
in between will help.

> [ ... ]
> 
>> +static void *bpf_rhash_map_seq_start(struct seq_file *seq, loff_t *pos)
>> +	__acquires(RCU)
>> +{
> 
> [ ... ]
> 
>> +	elem = rhashtable_walk_next(&info->iter);
>> +	/* rhashtable_walk_next returns -EAGAIN on resize, abort */
>> +	if (IS_ERR(elem))
>> +		return ERR_PTR(-EBUSY);
> 
> Similar to bpf_each_rhash_elem, will returning -EBUSY here on normal hash
> table resizes cause userspace map dumps to fail spuriously?
>
 
This is by design.

> [ ... ]
> 
>> +static void *bpf_rhash_map_seq_next(struct seq_file *seq, void *v, loff_t *pos)
>> +{
> 
> [ ... ]
> 
>> +	elem = rhashtable_walk_next(&info->iter);
>> +	/* rhashtable_walk_next returns -EAGAIN on resize, abort */
>> +	if (IS_ERR(elem))
>> +		return ERR_PTR(-EBUSY);
>> +
>> +	return elem;
>> +}
> 
> Again, aborting on -EAGAIN here might interrupt the map dump when a resize
> happens in the background. Is there a way to handle -EAGAIN without failing
> the entire sequence?
> 

