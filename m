Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D705E30FC03
	for <sashiko@lists.linux.dev>; Sat, 30 May 2026 02:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780106694; cv=none; b=mtHWRK6mwlWxDbQ5wd5urgrAXxFqtgxGYxE/6hlS86UEudWadvoJH/mZilRrp0io9h+KDR18yYoQfEnERC0vikss2Upn8nx+YVdAhkPJ8TIFulJ+poaFpUO6U0nBi7A8FWQsKZIJWjdGGhW6eIdlpToPYAxQFHucs278Qf8p3zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780106694; c=relaxed/simple;
	bh=NQVLMiGOXlaYEHPVCpYriED4c3IJceu54nBYoBfxes8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BN3WQ01eXl/gTDClleMQ3ATQmPFCxh49ySMcjF4KyGRs4JdToL9at03lBCk6ZX3rIdsty8Sy6soBb9HMwT0AHioiCIdWGcRG0D1JZrmesoeKRqgBaJMOZpJrHwKTSjvEfG2ZfTZMzD7yrytbEIdT3QAx+t/Hbc0/404MW6jvvFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=uZB6JCye; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="uZB6JCye"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8b4eb1fd5d0so174739186d6.0
        for <sashiko@lists.linux.dev>; Fri, 29 May 2026 19:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780106691; x=1780711491; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3i1oyBiurpko1znXNZZKAdYDCNtEHVcNnoLsM4FfGuo=;
        b=uZB6JCyeyLnsoGVmxUXYbT3Xpbdy1Znzo6VNX29yrg5lF/GoMAw8AoDtI/FXnDfCYv
         1ew5mSfewU//iCHmKxXLds9OYdZS7PIuINtv6U1eKBs4jyyCieV6q2PuV3de2lqRUoDR
         8ncVaP9s4tCSDhNs1o7X8mo+53SKnS2kB6MNo77YDKDpmlzJU9oGjzAc86fqeeIhI0AA
         mte+DCmF4EYXEGFw5qGe1GzJ/hPIBxwR8fVCs3my/hgOcv18Q7gwQh7tOaIIw/U/xsFE
         Rzf/Nwl/ffDWo9+RUwd3RIULoDCtkxvelLfCLJpQSyRpIdNl9tDz/P5wiO6TdfQg6qHO
         KBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780106691; x=1780711491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3i1oyBiurpko1znXNZZKAdYDCNtEHVcNnoLsM4FfGuo=;
        b=MkYaKwap57EKu4LKN4958gNrFZ1huDz3C9wr5Txha8B3U3mkLacToELsXCYHdulVgv
         LOpSRrbd+8os563H1Wt5mwBIm2OHPqQTA6IaAmjMkckuiw3tN4iRPr57pKn3TWrFl4YK
         t/g0OqnfaTEy9RXQnH0JcyC0TtQWMcGnj8Py+Av0VY4yv1p/GL+KiVP12HWvCnEQnXTW
         VW40fTziUGCKPXeXKFvcYyVpL3vV3ar6LXKI0YBdDFK7/vSMQ1F71suNv11UZl1Getjd
         ssWNd+TmGMfckt/SZQUH2arhhrfqz1Y08kb+CeBBaBCf2hmqk85gxgj6TUq46PuVxpZN
         tnjA==
X-Gm-Message-State: AOJu0YzgJOCoEHz7+b2NrJLxB8mDFbePoRAAfPvslVhyLHS8ibMKQwZh
	Wb7jfMXZ+Js6E9XTGwu1NtNSq7d5oqhVe+pWRiMA8stH1yRasgWoqHLBHuRI8xBhV5JFzZ4XYki
	ismpxDo4=
X-Gm-Gg: Acq92OGLGsYe5NPAHCF5hOM12jucW9EdoWYnWCVsGOjq2IEv9gh/RVsyJAg3ECiIx/M
	Tm4aulFLa3IuAd8lUyXcHAr4XxFYmAqvkbdyHvi1OFxC1RUtEhoOY0VpTzdmbfMtp3jQ5mv+k43
	ag8CTSCtH330GbqTHPVxFnE7w43NjhFrS13mo4k2DwjH7BeN3wsm9M7FsatRqquDwyj8TFbn1mS
	dfr+bSizq4ejFl2fcPB4TZMEQ4JH91KuB8CiDupF7lVB6Xj5O555d5St0XvXLpKs3dBveX4bfS4
	6IAa5hyo8Qyt0Jmd3eardUQu7uJm4U8eFuKSUBG7J5HgGK3qaYW+I9C6m00H9U9Dl5kzbkE0ZTC
	HsUPcTyy3HYlCJSQSxCBmoIc2w7JO0AVNG71duPfYJZrVqo1GcDCvlYZao4BbvTC9ivmAieE16j
	bElHRpvnQleF0pdfjRi8Pcv0r1/s/xt0GDBA==
X-Received: by 2002:a05:6214:484a:b0:8cc:f3bb:e15c with SMTP id 6a1803df08f44-8ccf3bbe567mr11957526d6.41.1780106691014;
        Fri, 29 May 2026 19:04:51 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea06d4casm32658206d6.16.2026.05.29.19.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 19:04:50 -0700 (PDT)
Message-ID: <af4bb6db-acb5-4489-9757-75d53d678680@riscstar.com>
Date: Fri, 29 May 2026 21:04:50 -0500
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 11/12] misc: tc956x_pci: add TC956x/QPS615
 support
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org, Daniel Thompson <daniel@riscstar.com>
References: <20260501155421.3329862-12-elder@riscstar.com>
 <20260502155619.BCDFDC19425@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260502155619.BCDFDC19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/2/26 10:56 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] Dangling `platform_data` pointer and stateless device link lead to Use-After-Free
> - [High] Devres lifecycle violation causes memory leak of device links
> - [High] Reference count leak of PCI peer device
> - [High] Missing `pci_free_irq_vectors()` in error paths and remove function

All issues highlighted here are legitimate, and will be
addressed in the next version of the series.

> --
> 
> commit 7eab7fd4b209226034d88bc445ad71c833dda6b7
> Author: Alex Elder <elder@riscstar.com>
> 
> misc: tc956x_pci: add TC956x/QPS615 support
> 
> This commit introduces support for the Toshiba TC956x Ethernet AVB/TSN
> bridge, configuring its PCI functions and creating auxiliary devices to
> support the XGMAC interfaces.
> 
> diff --git a/drivers/misc/tc956x_pci.c b/drivers/misc/tc956x_pci.c
> --- /dev/null
> +++ b/drivers/misc/tc956x_pci.c
> 
> [ ... ]
> 
>> +static struct tc956x_chip *chip_get(struct pci_dev *pdev)
>> +{
> 
> [ ... ]
> 
>> +	/* Function 1 has to get the chip structure from function 0 */
>> +	peer = pci_get_slot(pdev->bus, PCI_DEVFN(PCI_SLOT(devfn), 0));
>> +	if (!peer)
>> +		return ERR_PTR(-ENXIO);
> 
> Does this leak the pci_dev reference count?

Yes it does, and this will be fixed in the next version of the patch.

> 
> pci_get_slot() returns a device with its reference count incremented, but I
> do not see a matching pci_dev_put(peer) in either the success path or when
> returning -EPROBE_DEFER below.
> 
>> +
>> +	/* If function 0 hasn't set up the chip yet, try again later */
>> +	chip = dev_get_platdata(&peer->dev);
>> +	if (!chip)
>> +		return ERR_PTR(-EPROBE_DEFER);
>> +
>> +	/* Mark function 1's device as dependent on function 0 */
>> +	link = device_link_add(dev, &peer->dev, DL_FLAG_STATELESS);
> 
> Is DL_FLAG_STATELESS safe to use here?

We believe this is safe to use here.  If it is created successfully
a devm action is set up (for function 1) to remove the link.

> Stateless links do not enforce unbind ordering. If function 0 is unbound by
> the user, its devres will free the chip structure and unmap the MMIO regions
> while function 1 remains bound. Will function 1 cause a use-after-free if it
> accesses the freed chip state or unmapped MMIO space?
> 
>> +	if (!link)
>> +		return ERR_PTR(-ENODEV);
>> +
>> +	ret = devm_add_action_or_reset(&peer->dev, chip_link_del, link);
> 
> Should this cleanup action be attached to dev (function 1) instead of
> peer->dev (function 0)?

Yes, this was a very good catch.  The name of the peer
variable will be changed to be "slot0" to emphasize which
device we're dealing with.

> 
> If function 1's probe fails downstream, its own devres list is rolled back,
> but this cleanup action remains attached to function 0. Will this leak the
> device link and accumulate duplicate devres actions on function 0 each time
> function 1 defers its probe?
> 
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	return chip;
>> +}
> 
> [ ... ]
> 
>> +static int
>> +tc956x_function_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>> +{
> 
> [ ... ]
> 
>> +	/* We called pcim_enable_device() so this will be freed automatically */
>> +	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI);
>> +	if (ret < 1)
>> +		return dev_err_probe(dev, ret ? : -EIO,
>> +				     "failed to allocate IRQ vectors\n");
> 
> Is this comment accurate?

Looking at it now, it appears the comment is not accurate.

All error paths that follow will free this IRQ vector.
And the driver remove function will do so as well.

> According to PCI subsystem guidelines, pci_alloc_irq_vectors() requires
> explicit manual cleanup. Should the error paths below and the remove function
> call pci_free_irq_vectors(pdev) to prevent leaking system IRQ resources?
> 
>> +
>> +	ret = pci_irq_vector(pdev, 0);
>> +	if (ret < 1)
>> +		return dev_err_probe(dev, ret ? : -EIO, "failed to get IRQ\n");
>> +	msigen_irq = ret;
>> +
>> +	ret = chip_init(chip, pdev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to initialize chip\n");
>> +
>> +	/* We're ready; the other function can now probe */
>> +	dev->platform_data = chip;
>> +
>> +	ret = function_xgmac_adev_add(pdev, chip, msigen_irq);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to add xgmap device\n");
> 
> If function_xgmac_adev_add() fails, devm_kzalloc() will automatically free
> the chip structure upon exit, but dev->platform_data is not cleared.
> 
> Will function 1's chip_get() retrieve this dangling pointer via
> dev_get_platdata() and cause a use-after-free when it probes later?

This too was a good catch.  The platform_data for function 0
will not be assigned a non-null value until it has completed
its probe successfully.

> 
>> +
>> +	return 0;
>> +}
>> +
>> +static void tc956x_function_remove(struct pci_dev *pdev)
>> +{
>> +	struct tc956x_chip *chip = dev_get_platdata(&pdev->dev);
>> +
>> +	pci_clear_master(pdev);
>> +
>> +	if (&pdev->dev == chip->dev)
>> +		chip_msigen_disable(chip);
>> +}
> 
> Does this function need a call to pci_free_irq_vectors(pdev) to clean up the
> allocated IRQ vectors before returning?

This will be added, as mentioned above.

					-Alex
