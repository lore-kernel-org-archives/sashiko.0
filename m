Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E7230E84A
	for <sashiko@lists.linux.dev>; Sat, 30 May 2026 02:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780106689; cv=none; b=fJE0UyeefWWrRq6xAfIUhnV0Fgfy0zP4kXeHR9sBX/909piDMFjJbRliV5mnRmfTj3O5TCS9HU19UzR91A5+8jjIeBJjCLRm6sXnGlEyd95lvRH2EnrIKMETQeqrRZ+YsWHbSvqs5luBDzJzeLWYL6PzFA0XWH//WMOOvzfUv1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780106689; c=relaxed/simple;
	bh=OnpTnlxEiUqXcMcylKWkkd5I4N16ZuFEn9fnwLR/g6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kq3X2kdajhxBZ33cwvpoPp0qafglZAMz9CP/T+J0T4h8Dkw4nYKpbLtt+Q92SY8bwc4aMfmdC5b70JFNpYk4FqOUVBs2L9Hws7pDyginTmReKe68KgJVh2Q+pqNR+wc+V5Qk3ngEjRkuGDTZakUVsAZSWn8yo7X4OsN4P1nohhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=BizoJgl9; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="BizoJgl9"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8ccef25789fso5187086d6.3
        for <sashiko@lists.linux.dev>; Fri, 29 May 2026 19:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780106687; x=1780711487; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wt6HXLj2ou5XSQ5aBmhcWz/cgRBxPdzaJhAEbYPNpzg=;
        b=BizoJgl9YFdls8Wd8V0Xq9rGWldYfTIjMr7RlQmuvZkr7Q+hgqZjyQBktGTEXvTKzq
         mo23HkVK1tJLm21UcLe8WUp2/js83eZMT81FzvSTpkngIE0Lo7LCIRMY7i7RxGCEkj6M
         4WqTQeJGlMg73V/yXoOaAupabb9iyxP6HoEQC7nO4nMMnEauhZqgN4lGZEIPAZtNlGUg
         5oeb+o2n7oL0htxHBVEq8f/zCpupubYKcyi+V6C32l86iaovHRftO1SM7+AqRfF24los
         X8R0hnyf2qs5NvyBmUa3AkSyxtgOAWbnH7Zu1V+355xLgikF+3uO2ci3goJfXOW419bZ
         QZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780106687; x=1780711487;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wt6HXLj2ou5XSQ5aBmhcWz/cgRBxPdzaJhAEbYPNpzg=;
        b=HDdfGsDQ3pEe5+y1UuXdh6AqNpCc6OZ2mq8NbWyvxBONIoBpNlpI92x1L3fU4QgZ0K
         n2VBYODUYJV+tQGhOsN4QLPu24C9SH6gMrX0KpcyCzkTDQI/uu04eA1tNwt3c3+tmZvc
         jpdBRSHbNxSxd1P0sPFjKv+L3gFOZjhyp4IuIqLNpShh6DY4OEjonHB9RqdrJuGVCPcY
         oyRUzGZRpeWcidaZH2nlCv8/eo6s2oPdfy8bRGDLcQA4BiELtRmoj7esiK+ryp75VF6e
         G61IHzVmgBVcnN9QjeEF5A/LxinENs2Xpg37LXln4lyBbnwCC/BoUZyXIGvT2nOoLcTp
         /rug==
X-Gm-Message-State: AOJu0YzJFyeftOiwVhKiM7eumXR3/YycoQ9aJkO4rmYMJvfhXg6+sZme
	htwqK9FrFAQOIpR0xPcSOvKgsDwZXcuTcgPMKjaphJgp0oKiZ/ddwgP3DQKHnCL8Q7uT13lesyO
	IAxtOE9s=
X-Gm-Gg: Acq92OEYcPi+4LAtZSGb2nCKECdbjAI2WnFje05Na1eCtvhrbGwWJs/ezTMrd/TjOLz
	hxkad2MMDaC0Q81pJMrkYys+Cit1gQCrKG5kqaoKPDofFG98va24NigMZmevWL4TIMYnB05nzot
	tAZ05wRj7XeCjRmQEbBzPQ7qIDApwuGAW7txuiWcVk4HHe5V3dkFQpA/Eqs/woZ1L7N8r18/J7T
	eR21V28y4lsE3WZ3ofvcVj88Sg6JGsJG99U4zXBDjicz5VsfouDQW/8Ybsn1hkmqtITcCpExCff
	ixaNCYuS4oMz+aDdsgCv2DyGTluQLV1tJMJ6+OWf4A8bCKDfP+smmXagtUNiR6hcEUp5g2s53p5
	SJ9RhM3H5jEu5RJ90ZttJYAn+qLVVDCG0fxHbCfq1a6FOlPSxtuTIs2aBLm5gBbk9/faxcHZnoo
	8Cb9GK3a57tkdDBJ5Erd6EfGXiUwltFALHmQ==
X-Received: by 2002:a05:6214:1c4d:b0:8ca:1390:7fe7 with SMTP id 6a1803df08f44-8ccefe0b533mr39364876d6.43.1780106686827;
        Fri, 29 May 2026 19:04:46 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea06d4casm32658206d6.16.2026.05.29.19.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 19:04:46 -0700 (PDT)
Message-ID: <8c5402c5-93ee-41af-b16b-da87e3d020e6@riscstar.com>
Date: Fri, 29 May 2026 21:04:45 -0500
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 10/12] net: stmmac: tc956x: add TC956x/QPS615
 support
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org, Daniel Thompson <daniel@riscstar.com>
References: <20260501155421.3329862-11-elder@riscstar.com>
 <20260502155618.EC605C19425@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260502155618.EC605C19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/2/26 10:56 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] The RX queue IRQ mapping loop incorrectly checks `res->tx_irq[i]` instead of `res->rx_irq[i]` for failures.
> - [High] DMA address truncation on 32-bit architectures leads to corrupted hardware DMA programming.
> - [High] Mapped IRQs are never disposed, leaking descriptors and causing a WARN on device removal.
> - [Medium] Hardware clocks and resets are leaked on `probe()` and `mac_enable()` error paths.
> - [Medium] OF node reference leak for `mdio_node` on probe error paths and device removal.

All of the reports here are valid, and all will be addressed
in the next version of the patch (as described further below).

> --
> 
> commit e138cc3787ee995063c093b9ca94f6ca453bbcda
> Author: Daniel Thompson <daniel@riscstar.com>
> Subject: net: stmmac: tc956x: add TC956x/QPS615 support
> 
> This commit adds support for the Toshiba TC956x eMAC/MSIGEN combination,
> implemented as a driver for an auxiliary bus device that bridges TC956x
> level interrupts to PCIe MSIs.
> 
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
>> new file mode 100644
>> index 000000000000..27ff83dd3bd9
>> --- /dev/null
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
> 
> [ ... ]
> 
>> +static int tc956x_mac_enable(struct tc956x_data *td)
>> +{
>> +	const struct tc956x_chip *chip = td->auxbus_data->chip;
>> +	struct plat_stmmacenet_data *plat = td->plat;
>> +	u32 id = td->auxbus_data->mac_id;
>> +	int ret;
>> +
>> +	tc956x_clock_enable(chip, id, MAC_CLOCK_TX);
>> +	tc956x_clock_enable(chip, id, MAC_CLOCK_RX);
>> +	tc956x_clock_enable(chip, id, MAC_CLOCK_ALL);
>> +	if (id)
>> +		tc956x_clock_enable(chip, id, MAC_CLOCK_RMII);
>> +
>> +	/* Set the speed related registers */
>> +	ret = tc956x_mac_configure(td, plat->max_speed);
>> +	if (ret)
>> +		return ret;
> 
> If tc956x_mac_configure() fails, will this leak the clocks that were just
> enabled since tc956x_clock_disable() is not called?

This is a legitimate issue.  However in the next version
of this patch, the call to tc956x_mac_configure() is no
longer necessary.  As as a result, the issue will no
longer occur, and in fact tc956x_mac_enable() becomes a
void function, simplifying callers as well.

> 
> [ ... ]
> 
>> +static void tc956x_dma_init_rx_chan(struct stmmac_priv *priv,
>> +				    void __iomem *ioaddr,
>> +				    struct stmmac_dma_cfg *dma_cfg,
>> +				    dma_addr_t phy, u32 chan)
>> +{
>> +	dma_addr_t translated = phy + TC956X_SLV00_SRC_ADDR;
> 
> If dma_addr_t is 32-bit on the target architecture, will adding
> TC956X_SLV00_SRC_ADDR (0x1000000000ULL) to phy truncate the result and cause
> the upper 32 bits to be 0?
> 
> Should translated be explicitly typed as u64? The same pattern appears
> in tc956x_dma_init_tx_chan(), tc956x_desc_set_addr(), and
> tc956x_desc_set_sec_addr().

Here, the translated variable (in all four functions) will be
converted to a u64, which avoids the problem even if the
size of a dma_addr_t is 32 bits.

> 
> [ ... ]
> 
>> +static int tc956x_dwmac_parse_dt(struct tc956x_data *td)
>> +{
>> +	struct device_node *mdio_node;
>> +	struct device *dev = td->dev;
>> +	struct device_node *np;
>> +
>> +	np = dev_of_node(dev);
>> +	if (!np)
>> +		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
>> +
>> +	/* Find the MDIO bus */
>> +	for_each_child_of_node(np, mdio_node) {
>> +		if (of_device_is_compatible(mdio_node,
>> +					    "snps,dwmac-mdio"))
>> +			break;
>> +	}
>> +
>> +	/* Pass the MDIO bus (if there is one) to the core driver */
>> +	if (mdio_node) {
>> +		td->plat->mdio_node = mdio_node;
>> +		td->plat->mdio_bus_data->needs_reset = true;
>> +	}
>> +
>> +	return 0;
>> +}
> 
> Since the loop breaks early when a compatible node is found, does this leak
> the reference to mdio_node?
> 
> Is a call to of_node_put() needed in tc956x_dwmac_remove() and on probe
> error paths?

Yes, this did leak the reference to the mdio_node.  The
next version of this patch addresses this in the caller,
dropping the reference on any error, and dropping it also
in the driver remove function.

> 
> [ ... ]
> 
>> +static int tc956x_stmmac_resources_init(struct tc956x_data *td,
>> +					struct stmmac_resources *res)
>> +{
>> +	struct irq_domain *irq_domain = td->irq_domain;
>> +	u32 i;
>> +
>> +	res->irq = irq_create_mapping(irq_domain, HWIRQ_EVENT);
>> +	if (!res->irq)
>> +		return -EINVAL;
>> +
>> +	for (i = 0; i < td->plat->tx_queues_to_use; i++) {
>> +		res->tx_irq[i] = irq_create_mapping(irq_domain, HWIRQ_TX0 + i);
>> +		if (!res->tx_irq[i])
>> +			return -EINVAL;
>> +	}
>> +
>> +	for (i = 0; i < td->plat->rx_queues_to_use; i++) {
>> +		res->rx_irq[i] = irq_create_mapping(irq_domain, HWIRQ_RX0 + i);
>> +		if (!res->tx_irq[i])
>> +			return -EINVAL;
>> +	}
> 
> Should this be checking res->rx_irq[i] instead of res->tx_irq[i]?

Yes, Ayaan mentioned this as well and it has been fixed.

> 
> If tx_irq[i] was previously set during the TX mapping loop, this check won't
> catch RX mapping failures and uninitialized IRQs could be left in the
> resource structure.
> 
> [ ... ]
> 
>> +static int tc956x_dwmac_probe(struct auxiliary_device *adev,
>> +			      const struct auxiliary_device_id *id)
>> +{
> 
> [ ... ]
> 
>> +	ret = tc956x_mac_enable(td);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to enable MAC\n");
>> +
>> +	ret = stmmac_dvr_probe(dev, td->plat, &res);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed stmmac probe\n");
>> +
>> +	return 0;
>> +}
> 
> Does this error path need to call tc956x_mac_disable(td) to unwind the
> hardware state if stmmac_dvr_probe() fails?

Yes, and this will be addressed in the next version of this patch.

> 
> [ ... ]
> 
>> +static void tc956x_dwmac_remove(struct auxiliary_device *adev)
>> +{
>> +	struct device *dev = &adev->dev;
>> +	struct net_device *ndev = dev_get_drvdata(dev);
>> +	struct stmmac_priv *priv = netdev_priv(ndev);
>> +	struct tc956x_data *td = priv->plat->bsp_priv;
>> +
>> +	stmmac_dvr_remove(dev);
>> +	tc956x_mac_disable(td);
>> +}
> 
> Are the IRQs created by irq_create_mapping() leaking here?

A new function tc956x_stmmac_resources_exit() will be created to
release the mappings created by tc956x_stmmac_resources_init().

					-Alex

> 
> There appear to be no calls to irq_dispose_mapping() on device removal or
> probe error paths. While IRQ_DOMAIN_FLAG_DESTROY_GC frees the generic
> chip data, the descriptors might leak and trigger a warning in
> irq_domain_remove().
> 

