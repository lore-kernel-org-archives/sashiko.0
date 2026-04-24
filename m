Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A2B33C194
	for <sashiko@lists.linux.dev>; Fri, 24 Apr 2026 06:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777013622; cv=none; b=njHzD3uHwGoWulfSuedtELJGpyO2GNsOD8knFRzvmg0bVf2gIflqgL9V5S+8e3tJfcDb4qKq6UK2flqoWT1cXg601ZEXII+T4xUFeW4nvwx+5DWj5GsO4M94i2sekwUcT6O+NXem5N3ChORfF5eLIiTYofSp04+iFsG6xmB0Is0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777013622; c=relaxed/simple;
	bh=CmLN8wf0K3pyC15x2NJrtsv5bFYbEcltLiizr2/7yHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sjqoBsjiZlhdxKC1DI9sXQMgQIU0u7Bj6z1Tgyy+Z85lq3UfUzORu8q1me7XUNt2uGiLS5uLLOVBrNAlzcoqIFgVK1SbBypqxfxCMTfhvhZ6ssrsBzLoh8v6sLIPp+W5UEwws2fqvuQ/lbxJkQNnKfVrk5NuXe+NAzkc8MiiXjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=H0GB0wxY; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="H0GB0wxY"
Message-ID: <84b9cd8e-1d9e-4773-9f52-5a9eac42d7d6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777013618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T2w2VGhCXjLH2tCb0+Xl6iCJ2Gtyo0My4f0pPV/1z0k=;
	b=H0GB0wxYQhaQrIzUn00gAsa02/5QfDWyRbWgg5L1YT3k6NO5KpznTVmd/6YUPO25hH0RpD
	eGW16SGlDBNLEzJDw94ZCCmCDuTJ3JzjCzkZ2XqzEu5wel5t3R+OIIdpsLMSuD6BsnZXp4
	JZizfatF4ofhrAWDKJ1h89OCb9FG3So=
Date: Fri, 24 Apr 2026 14:53:29 +0800
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH bpf 2/2] bpf, netkit: reject offloaded programs on attach
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260423033609.252464-3-jiayuan.chen@linux.dev>
 <20260424033752.1F76BC19425@smtp.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20260424033752.1F76BC19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 4/24/26 11:37 AM, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 1 potential issue(s):
> - [High] The patch prevents attaching offloaded programs during link creation and program attach, but fails to secure the link update path, allowing a complete bypass of the fix.
> --
>
> commit 4b4a6a3785c138df3a0a76f92652aa68a0ea77d6
> Author: Jiayuan Chen <jiayuan.chen@linux.dev>
>
> bpf, netkit: reject offloaded programs on attach
>
> This commit rejects offloaded BPF programs in netkit_prog_attach() and
> netkit_link_attach() to prevent them from triggering a WARN in
> bpf_prog_warn_on_exec() when executed on the software path.
>
>> diff --git a/drivers/net/netkit.c b/drivers/net/netkit.c
>> index 7b56a7ad7a496..d845a24c5915d 100644
>> --- a/drivers/net/netkit.c
>> +++ b/drivers/net/netkit.c
> [ ... ]
>
>> @@ -1000,6 +1003,9 @@ int netkit_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
>>   	struct net_device *dev;
>>   	int ret;
>>   
>> +	if (bpf_prog_is_offloaded(prog->aux))
>> +		return -EINVAL;
>> +
> Is it also necessary to reject offloaded programs in netkit_link_update()?
>
> It looks like a user could bypass this fix by creating a netkit link with a
> non-offloaded program, and then using BPF_LINK_UPDATE to replace it with an
> offloaded program.
>
> The netkit_link_update() callback directly passes the new program to
> bpf_mprog_attach() without checking bpf_prog_is_offloaded():
>
> static int netkit_link_update(struct bpf_link *link, struct bpf_prog *nprog,
> 			      struct bpf_prog *oprog)
> {
> 	...
> 	ret = bpf_mprog_attach(entry, &entry_new, nprog, link, oprog,
> 			       BPF_F_REPLACE | BPF_F_ID,
> 			       link->prog->aux->id, 0);
> 	...
> }
>
> Note that tcx_link_update() in the earlier tcx fix appears to suffer from
> the exact same omission.
>

You're right, will fix netkit_link_update() in v2.


>>   	rtnl_lock();
>>   	dev = netkit_dev_fetch(current->nsproxy->net_ns,
>>   			       attr->link_create.target_ifindex,
