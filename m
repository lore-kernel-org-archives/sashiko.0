Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E13387346
	for <sashiko@lists.linux.dev>; Thu, 23 Apr 2026 17:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776965450; cv=none; b=QxTlAFHbKLgwI9AwXuKOrYaoKAzHn/9Su03RjyG8KhZ+C1/jGRxWM92SrJ3zDHU7GZJ8bTElwHnzQuwBhNGdsoLPEZ4ZVI9UBgfJ9kCCP8CsHQnjTxScl+CpWIFL86HUP+7XMdL7GEfWaDwzDpFevw5SjlJ7pxgtABaogeVg+8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776965450; c=relaxed/simple;
	bh=djkoPQae8b+Z0ubtONe6+OTINj17bhWrWR28PNbm8TM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TT9ikjgSpvsaUsNBlEOuxSe9Izfhi8BMTfQAsQsdXKUmb8j8+TWhMTXz2xOCDMEYIM6sYvBaqCWJTsjw62kdtc+apz5iNIDL8+cw3hi028cAldRuFQai/L+QwjafnASfgqpL483OsHl4CQXa/mXlR3RZxhNy2Bdvtm08xcy/Fl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IiGSZnAp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IiGSZnAp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776965447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RLM7qF/8vrK39Ahe4/9w+UgSzffIhkUoXP/F3ILUvx0=;
	b=IiGSZnApax7NGUIsdP0klDxojMy12EM4nZFxn5GuE7BOPt+vvJNwQSXq4bE+OpF9zO/unZ
	WRr7zqmmbGGvossBL6ozjPCxZwTM4WGwZDiaTzYa9bl8jiePwn9GDjBCPa178P+Wr2JoyS
	eJISzyrmc2oSbUvU2SBYyRLopV8XUzE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-414-fk82J3ShOYKYQABIkvtcbA-1; Thu,
 23 Apr 2026 13:30:44 -0400
X-MC-Unique: fk82J3ShOYKYQABIkvtcbA-1
X-Mimecast-MFC-AGG-ID: fk82J3ShOYKYQABIkvtcbA_1776965440
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9B6481800464;
	Thu, 23 Apr 2026 17:30:39 +0000 (UTC)
Received: from [10.22.64.201] (unknown [10.22.64.201])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 91F3D3007572;
	Thu, 23 Apr 2026 17:30:38 +0000 (UTC)
Message-ID: <cf54839b-9327-4f24-a62b-e3e02ce5d7ad@redhat.com>
Date: Thu, 23 Apr 2026 13:30:37 -0400
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/23] sched/isolation: Extend
 housekeeping_dereference_check() to cover changes in nohz_full or manged_irqs
 cpumasks
To: sashiko@lists.linux.dev
Cc: hannes@cmpxchg.org, linux-hwmon@vger.kernel.org, mkoutny@suse.com,
 tj@kernel.org
References: <20260421030351.281436-18-longman@redhat.com>
 <20260422030904.B1CEFC2BCB5@smtp.kernel.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260422030904.B1CEFC2BCB5@smtp.kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: poYf9oS1xw1k5M6OxnHECeR_6RXwvuz7kVinOu12zTk_1776965440
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/21/26 11:09 PM, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 2 potential issue(s):
> - [Critical] Unprotected access to newly dynamic HK_TYPE_KERNEL_NOISE causes lockdep splats and Use-After-Free.
> - [Critical] Flawed lockdep exemptions mask genuine Use-After-Free vulnerabilities.
> --
>
> commit 7b12dcd17d401c6b135ee53ba4e8384a7bd3d867
> Author: Waiman Long <longman@redhat.com>
>
> sched/isolation: Extend housekeeping_dereference_check() to cover changes in nohz_full or manged_irqs cpumasks
>
> This commit extends housekeeping_dereference_check() to apply the same
> lockdep exemptions used by HK_TYPE_DOMAIN to HK_TYPE_KERNEL_NOISE and
> HK_TYPE_MANAGED_IRQ, preparing them to be runtime changeable.
>
>> diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
>> --- a/kernel/sched/isolation.c
>> +++ b/kernel/sched/isolation.c
>> @@ -38,7 +38,8 @@ EXPORT_SYMBOL_GPL(housekeeping_enabled);
>>   
>>   static bool housekeeping_dereference_check(enum hk_type type)
>>   {
>> -	if (IS_ENABLED(CONFIG_LOCKDEP) && type == HK_TYPE_DOMAIN) {
>> +	if (IS_ENABLED(CONFIG_LOCKDEP) &&
>> +	   (BIT(type) & (HK_FLAG_DOMAIN | HK_FLAG_KERNEL_NOISE | HK_FLAG_MANAGED_IRQ))) {
> Because HK_TYPE_KERNEL_NOISE is becoming runtime changeable, does this
> expose existing readers to concurrent updates and use-after-free?
>
> For example, housekeeping_show() reads this mask without holding
> rcu_read_lock(). Similarly, tmigr_isolated_exclude_cpumask() reads it
> holding only cpus_read_lock(), not the write lock.

The housekeeping_show() function is a known issue and will be fixed in 
the next version. tmigr_isolated_exclude_cpumask() will only be called 
from housekeeping_update() where the top_cpuset mutex will be held. So 
it is the same process that modifies the housekeeping cpumasks and call 
tmigr_isolated_exclude_cpumask() before freeing the old cpumasks. There 
is no use-after-free problem here.

>
> If housekeeping_update() allocates a new mask, calls synchronize_rcu(),
> and frees the old mask while these functions are accessing the pointer,
> could this result in a use-after-free?
>
> Additionally, does extending this lockdep exemption mask genuine
> use-after-free vulnerabilities?
>
> The exemptions below assume that holding cpuset_mutex or cpus_write_lock()
> protects the pointer:
>
>>   		/* Cpuset isn't even writable yet? */
>>   		if (system_state <= SYSTEM_SCHEDULING)
>>   			return true;
>>
>>   		/* CPU hotplug write locked, so cpuset partition can't be overwritten */
>>   		if (IS_ENABLED(CONFIG_HOTPLUG_CPU) && lockdep_is_cpus_write_held())
>>   			return true;
>>
>>   		/* Cpuset lock held, partitions not writable */
>>   		if (IS_ENABLED(CONFIG_CPUSETS) && lockdep_is_cpuset_held())
>>   			return true;
> However, housekeeping_update() explicitly drops cpuset_mutex and
> cpus_read_lock() before updating masks and calling synchronize_rcu().
>
> This means housekeeping_update() can run in parallel with readers
> holding cpuset_mutex or CPU hotplug callbacks holding cpus_write_lock().

housekeeping_update() must be run with the top_cpuset mutex held. So it 
is not possible for 2 different processes to run housekeeping_update() 
concurrently. I will add a lockdep assertion to clarify that.

Cheers,
Longman

