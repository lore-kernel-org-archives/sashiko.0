Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A03826F2B0
	for <sashiko@lists.linux.dev>; Tue, 28 Apr 2026 15:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777388920; cv=none; b=FBvIVqc78iZYUl5q9b1gVLFaJJsA2ooYP++no3b/YcKvVeXI+x48foyHIrXxqpiruBJtVCmId8Mq1Ko1oSIQ5el9i16s7bjN1N80qqVnUmsCnjP6nUy63XyA45cMa04E04YKBdwpaBwVFKYBvppi1/5TBtyWrBijmeDPquozywc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777388920; c=relaxed/simple;
	bh=JtyGqsVDl7zW6SOJGRrjCu+8onibXPyq5RTb48aetEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oerWbIhEVLCBimFsx0uFmLWVQeO9KBdYY3FiZ6jwUlG21dPBd+oJM0Erm5l7BzOgaUci9L2YDkhBKC3GSqMCf5RvDWpiVZSmNs6ewb69Veckb42q3IXbkrRM+vHomKhi9y6q9FVDaAgP/gvm2bE9sRJo49FxROZ/+2tGtBNDEpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HQKUzcuY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HQKUzcuY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777388918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sFqnZvcdau66R7AB6Ivw/ciSSy4tC+VuO3zU1lXmJIs=;
	b=HQKUzcuYGd++ybDfMamUmFe5f4Vw+yllftUtgA98zbP12SjhNXkX4u1P1zXhP5BU81YkBP
	ps/iVVIdsY6k+ppWkqbX8OGgqGjsyWwDmhSlQ/j9yD4RW/U/IweKmsmyHU9Whxa3cQtaVZ
	nFcTjG/7PzhabyHB2PCrdVMrVIkm6KY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-572-qv-X29FxNH6A-cu8TgWbNA-1; Tue,
 28 Apr 2026 11:08:36 -0400
X-MC-Unique: qv-X29FxNH6A-cu8TgWbNA-1
X-Mimecast-MFC-AGG-ID: qv-X29FxNH6A-cu8TgWbNA_1777388915
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 703301956056;
	Tue, 28 Apr 2026 15:08:35 +0000 (UTC)
Received: from [10.22.65.177] (unknown [10.22.65.177])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8D7E3180047F;
	Tue, 28 Apr 2026 15:08:34 +0000 (UTC)
Message-ID: <7df8b5c6-7098-4e0c-8d2b-0f3be1ce3f0c@redhat.com>
Date: Tue, 28 Apr 2026 11:08:33 -0400
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cgroup/cpuset: Creating or adding CPUs to partition not
 allowed without privilege
To: sashiko@lists.linux.dev
Cc: tj@kernel.org, mkoutny@suse.com, hannes@cmpxchg.org
References: <20260428033439.783246-1-longman@redhat.com>
 <20260428040304.E7A8BC2BCAF@smtp.kernel.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260428040304.E7A8BC2BCAF@smtp.kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XPAt7ha13i3VtzAXhpD3w-PrJKQkW0l-9aXvI6SF_dU_1777388915
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/28/26 12:03 AM, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 2 potential issue(s):
> - [High] Unconditionally clearing `adding` and `deleting` flags on partition error permanently leaks CPUs from the parent.
> - [High] Unprivileged users can bypass the new CAP_SYS_ADMIN checks and steal CPUs from the parent cpuset by exploiting auto-promotion during hierarchical updates.
> --
>
> commit 1214158b7ede4552eb3f704b911775642a66d632
> Author: Waiman Long <longman@redhat.com>
>
> cgroup/cpuset: Creating or adding CPUs to partition not allowed without privilege
>
> This commit restricts creating cpuset partitions or adding CPUs to an existing
> local partition to privileged users with CAP_SYS_ADMIN.
>
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index e3a081a07c6d..5fc8555f2046 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
> [ ... ]
>
>> @@ -1833,12 +1835,18 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
>>   					       parent->effective_xcpus);
>>   		}
>>   
>> +		/*
>> +		 * Taking CPUs away from parent is not allowed without privilege
>> +		 */
>> +		if (deleting && !capable(CAP_SYS_ADMIN))
>> +			part_error = PERR_ACCESS;
>> +
> Is it possible for unprivileged users to bypass this check?
>
> If part_error is set to PERR_ACCESS during partcmd_update, the function
> transitions the partition to invalid but still returns 0 to the caller. This
> means the unauthorized CPU mask is saved to cs->cpus_allowed and
> cs->effective_xcpus.
>
> Later, if a privileged user modifies the parent's cpuset or a CPU hotplug event
> occurs, update_cpumasks_hier() is triggered and calls
> update_parent_effective_cpumask() with newmask == NULL.
>
> Since there is no capable(CAP_SYS_ADMIN) check in the newmask == NULL path,
> and the update runs under a privileged context, won't the system auto-promote
> the partition and officially steal the unauthorized CPUs from the parent?
It is a good point. Auto-promotion should be disabled if the current 
error code is PERR_ACCESS.
>
> [ ... ]
>
>> @@ -1919,8 +1927,10 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
>>   	}
>>   
>>   write_error:
>> -	if (part_error)
>> +	if (part_error) {
>>   		WRITE_ONCE(cs->prs_err, part_error);
>> +		adding = deleting = false;
>> +	}
> Does clearing the adding flag here leak CPUs from the parent?
>
> When a valid partition becomes invalid due to an error, such as PERR_NOCPUS or
> the new PERR_ACCESS, it must return its exclusively held CPUs to the parent's
> effective_cpus.
>
> The pre-patch code computed the rollback mask in tmp->addmask and left
> adding = true so that partition_xcpus_del() would be called later.
>
> By unconditionally clearing the adding flag here, the partition transitions
> to an invalid state, but the required partition_xcpus_del() call is skipped.
> Are these CPUs permanently leaked from the parent cpuset and the system's
> scheduling domains?

Right the clearing should be done in the same place where PERR_ACCESS 
error is set.

Regards,
LOngman

>

