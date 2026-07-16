Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA5DBE63
	for <sashiko@lists.linux.dev>; Thu, 16 Jul 2026 00:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784160488; cv=none; b=IQKrMU4XrsbnIwGUM6MlUh5Q1GqxtK3nog+CEWK2SZKm3KjX/mO0qVXnUVF1SUv5jwBiQZelAtTGbs0UbmXsKtOMl/sJSzKFkaaAidYJsvFXTfVSa0dPM1Jq1M+kGOmzd57BtyZqOBMYMrqFjpqrdB2Zxa1KaV1wNg/fJI2if3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784160488; c=relaxed/simple;
	bh=41XlKymodw/i8GxhvzSY4pn6MfBwBZUWZYOBLOYhlio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=euR6bN2ScUVOb8Ity0Q1iT27Cyt+6QWSw4AxgdJ6HFYxkpJ6+TJeRThhSp33MshpovV9G3gtiuYOdRV+uNqCANey8tS5K+kslQMDRKfE/gfvlcpSwYW6v2ajuEZUbWeQ9fv8CrBJ2ZXBmskdsxwHKcDE6oTbzakN5loSsoOTOJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ETUygJW3; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ETUygJW3"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so7001542b3a.2
        for <sashiko@lists.linux.dev>; Wed, 15 Jul 2026 17:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784160486; x=1784765286; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NcNyVzUPrsACHYb5qivhq4OOQaF/bi1jwcrfJkx833I=;
        b=ETUygJW3vxZuTLc5/7CqUh6ru4VDIy9fHBsIaQ0tbtbIH0WqLZHP3khvTmTZ2IOTxh
         +46DM2dppHpIKVtBe34jiKyEde3hWSqxooxFSZVJAxb8M04xB8cz+0yK+8Gun/b6L9x3
         KbMg0GokCietxg3+JdbeWPojNVgUCi767SIzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784160486; x=1784765286;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NcNyVzUPrsACHYb5qivhq4OOQaF/bi1jwcrfJkx833I=;
        b=ML6lujGTQ9BXjRtXzD5vRTsHKUypRzL6FtKPcKM+jttM+l/EjujWQeoRpzjdfXPGw4
         WzlMas7CYG+rrcAQkOqD6gQqgWFDuYzDqs7m3dlD0uQjwNyal7AQzpLJ6zql+7To/JEL
         w38Gr2A7YPAluZeIaTd1yvPVpBvYwBJDqisvdmkX9tQIvDnjYydQ79A3XWlN1Brz4Qf0
         9rXcsbk2wcI5oTDX8l8ctGBI8fS3pTZyvbJXH2ZAY6vlK9S09LtUIFS3RfT+COTUc1xH
         lQmv2voj5yKsQxShoq1dOiLxchUkXRTAQPLy6fquV3Jz2aNTO2eesIHaE4wuGusmL/s6
         rqDA==
X-Gm-Message-State: AOJu0Yz7kge2IDFjZGvaq1xVfYb+GMXi8z0lrQFEDKbH9ab4L/Cp3khn
	AHEKP8msRdWVi8qr+gCZ3FdMLm1riY0DQIsWv4BRGsdFQf0Kg4ybugrlGcurDxtIDQ==
X-Gm-Gg: AfdE7cnEWO26YJnZ8zlQjFTVt2PWG/VfiQ/bHptWhBD9a9OOrv9jUsmewJZpQZ5iG1B
	T/JWyuXqjaNdEuPhtUW7MYHeL03mH7FPalcCFgoAeBirxwM1UAkBaNHcKocRVK5sr80lEXEn4mK
	8OUHC/dFuZyw/kkW4rRq/2mENKJHX5B3nnMYZeO0mIZGQcxegGx/BAMq2EklCOIBTpabJtvSgR3
	ZDpkAM8dLIbaLB4P5TcEd8KNv29pDRQ1+BbploMzG83mlk6+nHqOB74k7OXOmiSyPnYtLZSYl1B
	+yj3f7d7y5hzAzuwnJXp7BUio6iPXL7K3eU6048rePc0e7MiD54KG4Ai4GyVhwHnWiZoDyA+Gm9
	QQnJ5t8zHPP4InkyqtQYklumxwQv/cx6dg0YHBPGtX2JjpnI0ZP9vZKNxHvmGFRc3HuerSUptOJ
	JBhPIrGQv+3mxVgvw/uaAvtMMTANE51/KfoLUituBhO1UUt3ICNdU=
X-Received: by 2002:a05:6a21:320b:b0:3c1:d78:6450 with SMTP id adf61e73a8af0-3c34d8bc7ccmr11995899637.66.1784160486218;
        Wed, 15 Jul 2026 17:08:06 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:6749:92c4:a95f:a937])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3140e538368sm8158635eec.12.2026.07.15.17.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 17:08:05 -0700 (PDT)
Date: Wed, 15 Jul 2026 17:08:02 -0700
From: Brian Norris <briannorris@chromium.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: sashiko@lists.linux.dev, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>,
	David Matlack <dmatlack@google.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v3] PCI/portdrv: Allow probing even without child services
Message-ID: <algg4sOk0YM1TpXa@google.com>
References: <af574zaysKnXjx15@google.com>
 <20260715221526.GA117606@bhelgaas>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715221526.GA117606@bhelgaas>

Hi Bjorn,

On Wed, Jul 15, 2026 at 05:15:26PM -0500, Bjorn Helgaas wrote:
> [+cc David, Mani]
> 
> On Fri, May 08, 2026 at 05:12:19PM -0700, Brian Norris wrote:
> > On Fri, May 08, 2026 at 11:30:22PM +0000, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > - [High] Moving `pci_set_master()` after child device registration causes child drivers to probe with Bus Mastering disabled, risking permanently lost MSI/MSI-X interrupts.
> > > --
> > > 
> > > commit 9b851bf8faf271ab0b2daad51bfd51f89a1e87d4
> > > Author: Brian Norris <briannorris@chromium.org>
> > > 
> > > PCI/portdrv: Allow probing even without child services
> > > 
> > > This commit modifies the PCIe port driver to allow probe to succeed even
> > > if no child services are available. This ensures the port can still be
> > > configured for runtime PM and low power modes on systems that only have
> > > certain port services available or lack legacy INTx interrupts.
> > > 
> > > Link: https://lore.kernel.org/all/nyada24tqwlkzdceyoxbzitzygvp4elvj5oajnqdwb33xkcdwk@76vnrx45fsfd/
> > > 
> > > > --- a/drivers/pci/pcie/portdrv.c
> > > > +++ b/drivers/pci/pcie/portdrv.c
> > > > @@ -343,7 +343,6 @@ static int pcie_port_device_register(struct pci_dev *dev)
> > > >  	if (!capabilities)
> > > >  		return 0;
> > > >  
> > > > -	pci_set_master(dev);
> > > >  	/*
> > > >  	 * Initialize service irqs. Don't use service devices that
> > > >  	 * require interrupts if there is no way to generate them.
> > > 
> > > [ ... ]
> > > 
> > > >  	/* Allocate child services if any */
> > > > -	status = -ENODEV;
> > > > -	nr_service = 0;
> > > >  	for (i = 0; i < PCIE_PORT_DEVICE_MAXSERVICES; i++) {
> > > >  		int service = 1 << i;
> > > >  		if (!(capabilities & service))
> > > >  			continue;
> > > > -		if (!pcie_device_init(dev, service, irqs[i]))
> > > > -			nr_service++;
> > > > +		pcie_device_init(dev, service, irqs[i]);
> > > >  	}
> > > > -	if (!nr_service)
> > > > -		goto error_cleanup_irqs;
> > > >  
> > > > -	return 0;
> > > > +	pci_set_master(dev);
> > > 
> > > Does moving pci_set_master() after the pcie_device_init() loop
> > > risk dropping MSI/MSI-X interrupts during child driver probes?
> > > 
> > > The pcie_device_init() function calls device_register(), which
> > > synchronously invokes the probe routines of child service drivers
> > > like pciehp or aer.  During probe, these child drivers configure
> > > the hardware and enable their interrupts.
> > > 
> > > Because PCIe MSI and MSI-X interrupts are memory write
> > > transactions, they require the Bus Master Enable (BME) bit to be
> > > set in the PCI Command Register.
> > > 
> > > If a hardware event occurs immediately after the child driver
> > > unmasks the interrupt but before pci_set_master(dev) is called,
> > > will the hardware attempt to send an MSI and drop the memory write
> > > because BME is 0?
> > > 
> > > Since PCIe interrupts are edge-triggered messages, could these
> > > dropped interrupts result in permanently missed hotplug events or
> > > cause hardware error handling regressions?
> > 
> > Ha, that's funny. It's all a great question I think, and that's
> > pretty much what I asked Bjorn here when he suggested moving this:
> > 
> > https://lore.kernel.org/all/aZfIfn9viQRj4uy4@google.com/
> > 
> > He seems to think it's not a problem:
> > 
> > https://lore.kernel.org/all/20260220164046.GA3528004@bhelgaas/
> > 
> > but I'm frankly not very convinced. I think it's perfectly possible
> > that a child service will try to enable MSI, the device will try to
> > write, and those writes will be dropped, producing a missing
> > interrupt.
> 
> I think you're right that if we move the pci_set_master() after
> pcie_device_init(), there is a window where MSIs could be dropped.
> 
> If pcie_portdrv_probe() is called after pcie_portdrv_init() registers
> service drivers (which would certainly happen if a port is hot-added)
> the service .probe() will be called inside pcie_device_init(), so BME
> must be set before that.
> 
>   pcie_portdrv_init                   # device_initcall
>     pcie_init_services
>       pcie_aer_init
>         pcie_port_service_register
>           driver_register
> 
>   pcie_portdrv_probe
>     pcie_port_device_register
>       pci_set_master                  # current location
>       pcie_init_service_irqs
>         # set generic PCI_MSI_FLAGS_ENABLE
>       for (i = 0; ...)
>         pcie_device_init
>           device_register
>             aer_probe
>               # set PCI_ERR_ROOT_CMD_COR_EN interrupt enable
> 
> > Bjorn, what do you think? Personally, I'd go back to something
> > closer to v2, where we enable mastering before initializing
> > children.
> 
> Yes, I agree.  What do you think of the patch below?  It's fairly
> similar to your v2.

Thanks for looking! Can you describe what your goals are here vs my v2?
I'm curious what you're aiming for.

I also think there are a few problems, notes below.

> diff --git a/drivers/pci/pcie/portdrv.c b/drivers/pci/pcie/portdrv.c
> index 69283cd04a78..6912743df767 100644
> --- a/drivers/pci/pcie/portdrv.c
> +++ b/drivers/pci/pcie/portdrv.c
> @@ -328,7 +328,7 @@ static int pcie_device_init(struct pci_dev *pdev, int service, int irq)
>   * Allocate the port extension structure and register services associated with
>   * the port.
>   */
> -static int pcie_port_device_register(struct pci_dev *dev)
> +static void pcie_port_device_register(struct pci_dev *dev)
>  {
>  	int status, capabilities, i, nr_service;
>  	int irqs[PCIE_PORT_DEVICE_MAXSERVICES];
> @@ -336,12 +336,12 @@ static int pcie_port_device_register(struct pci_dev *dev)
>  	/* Enable PCI Express port device */
>  	status = pci_enable_device(dev);
>  	if (status)
> -		return status;
> +		return;

Are you purposely ignoring pci_enable_state() failures now too? That
wasn't part of my original proposal. This also means you have a
potential underflow in remove(), because now a port might get through
probe() with an enable_cnt of 0 -- then we still call
pci_disable_device() in remove().

>  
>  	/* Get and check PCI Express port services */
>  	capabilities = get_port_device_capability(dev);
>  	if (!capabilities)
> -		return 0;
> +		return;
>  
>  	pci_set_master(dev);
>  	/*
> @@ -359,7 +359,6 @@ static int pcie_port_device_register(struct pci_dev *dev)
>  	}
>  
>  	/* Allocate child services if any */
> -	status = -ENODEV;
>  	nr_service = 0;
>  	for (i = 0; i < PCIE_PORT_DEVICE_MAXSERVICES; i++) {
>  		int service = 1 << i;
> @@ -368,16 +367,16 @@ static int pcie_port_device_register(struct pci_dev *dev)
>  		if (!pcie_device_init(dev, service, irqs[i]))
>  			nr_service++;
>  	}
> +
>  	if (!nr_service)
>  		goto error_cleanup_irqs;
>  
> -	return 0;
> +	return;
>  
>  error_cleanup_irqs:
>  	pci_free_irq_vectors(dev);

I didn't look at all the implications, but now we might run
pci_free_irq_vectors() twice in a row -- here, and in remove(). I think
it might be safe, but it's not trivial to ensure that.

>  error_disable:
>  	pci_disable_device(dev);

By unwinding this here, we have another potential case of inducing
underflow in remove(), similar to the pci_enable_device() failure case I
described above.

Brian

> -	return status;
>  }
>  
>  typedef int (*pcie_callback_t)(struct pcie_device *);
> @@ -698,9 +697,7 @@ static int pcie_portdrv_probe(struct pci_dev *dev,
>  	if (type == PCI_EXP_TYPE_RC_EC)
>  		pcie_link_rcec(dev);
>  
> -	status = pcie_port_device_register(dev);
> -	if (status)
> -		return status;
> +	pcie_port_device_register(dev);
>  
>  	pci_save_state(dev);
>  
