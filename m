Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6601F23ABB9
	for <sashiko@lists.linux.dev>; Sat, 25 Apr 2026 20:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777149700; cv=none; b=N2B3DKjTK0gC5NnJ7MQDGnWjObJRotMAD9DFlhjHX8lKL6278SWkrrTYQmlz3uTAReoCX3rsdn237F5hBM05fWTL/LO4vakGHxuV2uYadCRJPSFTnqsfvqd/i8rOnIKthKfvFnqkxDkEcw+P9dApU9E2BfPQcoCZ/IkuK7gZQpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777149700; c=relaxed/simple;
	bh=FXBxGvBl06ZlcKUDyZV2TZHtOpngPHeaJHwdnWkwd8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i7OaoEdBObrE+PJaxmz8w+hjxHEtX2zCyNbLjx97G1loGwiHnjXv7+m/5HZRpBHSm9zIfPyD6Q2P6BokpKAwTEVlCrqeUbmeEMkSU/+2Qzts6x+77FbTKelqRC0YYSzxs356rtDT0bLFoBf5oGPnc/6zg2BRcbMMjdywbqDMghY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HfwryMwq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HfwryMwq"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so74581625e9.2
        for <sashiko@lists.linux.dev>; Sat, 25 Apr 2026 13:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777149698; x=1777754498; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LikAQzNP+mJgI6rYkKWWaPcezC8tu0NiBOArYumtAVw=;
        b=HfwryMwqP7U13evmYEgqAwJVZGydsjqWK+PIBZ+QJ8wfIHcYj/SNMcJid5FD8RpuEs
         l83HB/NNF0CRxLTn5FtmMvtfjHLIiesKlBv2u0wN2fMzd3NoSFMxoKE9//Ep2XawBFkO
         vBMXoTTsrtUqt1aOBbXctTA8yLMRLcjSDUfUUE7QFEADCJ1YMA0YhDB+j9TzcV5tF8kj
         ToSFt/V6DvJLC0xqbWioPnZFJaSRN+G8MbFtMnh1wqe5iZ0eWTiQkEUM7ZNwrmLHwb5j
         GbaaZG02anQ5SmyPE74ftg3MgqKPbdOXYSp34+HQsNod68biAnOa/Tkw5Yr67kY4Cd5z
         QP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777149698; x=1777754498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LikAQzNP+mJgI6rYkKWWaPcezC8tu0NiBOArYumtAVw=;
        b=AiuxOaTi8HNchs9TlValbUS1T8Q8b0OWnJU5VZkVOYPFiZZdJp7ixPKpR8vi97jmCI
         OHeDH8q1bkfWLj+wpoZe5sp2TIMu9bxrThUBDq1Ia/4/wQTrRH8IHbP93w9821VAJCCn
         k89qkJ405OmVjR0qlRrNa3sh3GrbiJHnJ7YXLTg7KPi/X39ubi5Z+DBbmJxGJldYwBb8
         blVQwbEo5mdfqBB5cQdkgOJfCrsMPGIk2fJe3UQ2IFSTiklKkVKJ38qLNzyT48Awu4Vx
         AVhRLuSwRXzaVjLgJCf4pH5IvSqEX9/05jI7/vudpXLclxEQDY7GYJfN9l0aPh9xUlsV
         9PWg==
X-Gm-Message-State: AOJu0YwQSbp3pQIMlYLcRWxEPSR/aIBhH/459ylM0iU2mT76/ikRNCgs
	7TxI3ZuXJJvnjE3noy4xBw7juuNnJn0fVspbdiMQAjbgAUpBvZpLraiwRZNUdw==
X-Gm-Gg: AeBDieuX+8ptquUdWiTJJffPvGpUKePa65Q/fH/iF8LlRNpK+9Fb+bzBeTegnAnFeYS
	grYNP0bi1LJ/fp23CIife+HToTkxHAkqWfDLQ0Vaq+b96f9oB23UvufRTZq/BmvRx25KAuODy2m
	dmGkSRbQSKQIHoZaEvvQMXzCllCS/vVwFCu8F+nJX5e6ljGyXCX4G7P6eZRwE3XtozuBvFQgXlN
	TQG+l02YID93BzDUTgKMHuCVOIEPeRmxSlooEZIyBmk5+gYg5zEqr6GH2TCdmgykNHfqZhhwHeq
	t7uK5JKW60wniP1+SSFXNvMWCcA8r8/ajeeMdvP8iPeJ/dyLYiraCufo72q2TuzVRrcGEQJsPoO
	i3CA5FYW6VfZqkj/20eVyRzX4oDXtek0zuCpQrs93h1o3H48KsaLkyg/p+Gv5I4U5+NQzkl7DlJ
	VzhgAwk3YZcUQf7ezCxUqZepDxNMe07sA0Sjeb41fe98Sc9d4aerB04ZsGL6/u6TfYsvEW46BtE
	1lqMul7vuug5eEP9KaxLA==
X-Received: by 2002:a05:600c:8b38:b0:487:59c:2bb8 with SMTP id 5b1f17b1804b1-488fb7925dcmr521703365e9.27.1777149697632;
        Sat, 25 Apr 2026 13:41:37 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd1f:f500:f867:fc8a:5174:5755? ([2a01:4b00:bd1f:f500:f867:fc8a:5174:5755])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1176sm70465389f8f.3.2026.04.25.13.41.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2026 13:41:37 -0700 (PDT)
Message-ID: <c2db26e6-b6d2-4f5f-8b8c-0ad8a1e24865@gmail.com>
Date: Sat, 25 Apr 2026 21:41:34 +0100
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 01/10] bpf: Implement resizable hashmap basic
 functions
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260424-rhash-v3-1-d0fa0ce4379b@meta.com>
 <20260424204011.E6C7BC19425@smtp.kernel.org>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20260424204011.E6C7BC19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/24/26 9:40 PM, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 1 potential issue(s):
> - [Critical] Using rhashtable for BPF map updates/deletes is unsafe and will lead to hard deadlocks from IRQ/NMI/softirq contexts.
> --
> 
> commit 47c235933705172d3a36c4339c754282500161f1
> Author: Mykyta Yatsenko <yatsenko@meta.com>
> 
> bpf: Implement resizable hashmap basic functions
> 
> This commit adds a new BPF map type BPF_MAP_TYPE_RHASH backed by the kernel
> rhashtable implementation. It provides basic map operations like lookup,
> update, and delete using rhashtable APIs.
> 
>> diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
>> index 3dd9b4924ae4fb..a37bd2a7b30f4b 100644
>> --- a/kernel/bpf/hashtab.c
>> +++ b/kernel/bpf/hashtab.c
> 
> [ ... ]
> 
>> +static int rhtab_delete_elem(struct bpf_rhtab *rhtab, struct rhtab_elem *elem)
>> +{
>> +	int err;
>> +
>> +	err = rhashtable_remove_fast(&rhtab->ht, &elem->node, rhtab->params);
> 
> Can this lead to a deadlock when used by non-sleepable BPF programs in
> interrupt or softirq contexts?
> 
> The verifier permits BPF_MAP_TYPE_RHASH to be used by non-sleepable BPF
> programs, such as those attached to XDP or TC, which execute in softirq
> context and do not check bpf_prog_active.
> 
> Map operations like rhashtable_remove_fast() and
> rhashtable_lookup_get_insert_fast() internally use bit_spin_lock() for
> bucket-level synchronization. This locking mechanism disables preemption
> but leaves hardware and software interrupts enabled, unlike the
> raw_spin_lock_irqsave() approach used by the standard htab.
> 
> If a syscall updates the map from process context and acquires the bucket
> lock, and is then preempted by a hardware interrupt that schedules a softirq
> on return, the softirq will execute the XDP or TC BPF program.
> 
> If this BPF program attempts to access the same hash bucket, wouldn't it spin
> indefinitely waiting for the bit_spin_lock held by the interrupted process,
> causing a system deadlock?
> 

This is right, I forgot to add if (irqs_disabled()) return -EBUSY 
pointed to in v1: 
https://lore.kernel.org/all/CAADnVQKvp2tnQSWW4Kh3ofGLvaEYJ47kyZeNUscAH_DShw8XHw@mail.gmail.com/

I'll add it in v4.

> [ ... ]
> 
>> +static long rhtab_map_update_elem(struct bpf_map *map, void *key, void *value, u64 map_flags)
>> +{
>> +	struct bpf_rhtab *rhtab = container_of(map, struct bpf_rhtab, map);
>> +	struct rhtab_elem *elem, *tmp;
> 
> [ ... ]
> 
>> +	tmp = rhashtable_lookup_get_insert_fast(&rhtab->ht, &elem->node, rhtab->params);
> 
> Does the same deadlock mechanism apply here as well, given that
> rhashtable_lookup_get_insert_fast() also relies on bucket-level locks?
> 

