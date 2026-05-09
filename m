Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813FE1C695
	for <sashiko@lists.linux.dev>; Sat,  9 May 2026 00:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778285546; cv=none; b=heAVrqoY9Nobd/vctK8B0DvnAmO49B9lPur71xuKGH2eBlUX/DkM9SQdVq83znV4Y8UQSQgSMn5jjpEV5swNSiF3qWrrsx4mortsUqgVAEvRi/TNcW7AI8snOig7kCYCLFJBEB0cfQvI6TtSUfnSqpfSM+KtmmRg9DavOwxb5c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778285546; c=relaxed/simple;
	bh=Cy7rshjd8p6YCEq83eNoVKZRQF6Dcg4yV7x7i4ezH3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gk1Dv/0QROH24tq4FFx/JYjpo9a/IyfE97ghp5kx1aqZJ7Catr+FHrYbG5RMR+I7EfhjME+dPs4+wS6vF6cbbGIwm7GYUxh5wgCP9ZrJmfmIpisTR3pOkSEsU9qLiJCtmTV3ZLf4nt3RHWyGCtbf+sdQvojheYBHIxD5QGhr+go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AE7ZjN5l; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AE7ZjN5l"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c156c4a9efso3460266eec.1
        for <sashiko@lists.linux.dev>; Fri, 08 May 2026 17:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778285543; x=1778890343; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1MnanzWx/jcShdplf1MiPPMpO2mdcB+yybqSDTBHJrM=;
        b=AE7ZjN5lkoQcvliyvNZQ3q+j7sWs4ntdiWJ0I0L7yp/aHzAGeX/pKTMKsg7iJUbM47
         dWA/8y5RWu7K8wgTmgEcaZ/0KE4ry69ugRieVjMiXy46QHHjpF30Xofi5xziTWm8O9Du
         7pfQ5wTsD4dhMQUKyZZENtm3noiQyyG3DbfJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778285543; x=1778890343;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1MnanzWx/jcShdplf1MiPPMpO2mdcB+yybqSDTBHJrM=;
        b=eMd5WTPX1GF5uR/ds/cPrPfTi8oFTtCbxI4LtUMs1Yu1xkIfSxBal7mFK4spbzEm5l
         KumV/nPxJGCy2xqjJ/T2XU6pVsb0/TEol9SNyi1qv0PT7o3kEUNPB2hMfoLdhJ6quZ/I
         3fWMhFnWvvMxwlubEkM3ryIoUQp0kcIuqMmowyBYg68nQjjsq6macKwThgfW52AR1wvp
         Ors9bGNwGw4iLOfElB4oqpWeBKJaXs7CJZM4LTTEvBSSn8KKhxERWafrOoL/ZTZTe/O1
         c+fu+KLJIabEmN2mKxVImcgrNeZxUGV9jdeosDeTRIwvOis0nG3zMcCY9ho/h1h88Htt
         FdSg==
X-Gm-Message-State: AOJu0YwjaseAgOqDnuaMHcHBZGVAxMbO0ufyn8GxkUVLT7wKffy0f0qt
	vKLYWTNSaRKI2mfOz61Ey7eW/PyZKiq+RH3d2a1MwUuWUBFV5HNBTQ9TXWg0UGhIpEZfdydPjQE
	Sep8=
X-Gm-Gg: Acq92OGhFNIZ7Kd7WjP5BJ6dRNS3qwgnObxGwr24Y7waIf7L5Vw3Gb0d2c8jQZr9rCH
	kvX0/kV6Ij7uqszgRFe502AvnwXwkduDx6DadZZnmbW08izvcyA/7DYsKdVTfKTOiQuYiEWR8C1
	PXrOSDj4EXn2CFufaqbgy0t4NB34rxcW5UK+ZC5df3mWR1Ea95MjpzVfIZRelAWmC5k30ZLI96w
	hnRb0osXuekJbT8DU4l+9gPz2vGff/o1pziqG6CkJcVIHTyOyRmOZJRIJMonYzK/960uJ3DbNRl
	t8WrXpzOSZGN5KKu96RCWqM17UXhV6Dtc7mxnJl7K90EzK/T9vUrEKa8nAdYTEg9kaOS5M++Ah1
	SUrfimoKNCMtdCF7crIs5Qf/VhYNsjTuIXpTc5C1w8zq4NfL7mKZnYdr2uMSsDLOFlulo1Y5iyL
	o7sazUG1t/vvH6RJR8ifi+bvqXX5Tv+mwJy7A=
X-Received: by 2002:a05:693c:2c01:b0:2de:c5ca:c1e8 with SMTP id 5a478bee46e88-2f54d696d50mr6840495eec.4.1778285542959;
        Fri, 08 May 2026 17:12:22 -0700 (PDT)
Received: from localhost ([100.119.51.253])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2f8862d43b4sm4285662eec.11.2026.05.08.17.12.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 17:12:22 -0700 (PDT)
Date: Fri, 8 May 2026 17:12:19 -0700
From: Brian Norris <briannorris@chromium.org>
To: sashiko@lists.linux.dev, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v3] PCI/portdrv: Allow probing even without child services
Message-ID: <af574zaysKnXjx15@google.com>
References: <20260508133629.v3.1.I5fd5d83f518681b3949d8ab2f16ba8244fd3e774@changeid>
 <20260508233022.D20A8C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260508233022.D20A8C2BCB0@smtp.kernel.org>

Hi sashiko-bot and Bjorn,

On Fri, May 08, 2026 at 11:30:22PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Moving `pci_set_master()` after child device registration causes child drivers to probe with Bus Mastering disabled, risking permanently lost MSI/MSI-X interrupts.
> --
> 
> commit 9b851bf8faf271ab0b2daad51bfd51f89a1e87d4
> Author: Brian Norris <briannorris@chromium.org>
> 
> PCI/portdrv: Allow probing even without child services
> 
> This commit modifies the PCIe port driver to allow probe to succeed even
> if no child services are available. This ensures the port can still be
> configured for runtime PM and low power modes on systems that only have
> certain port services available or lack legacy INTx interrupts.
> 
> Link: https://lore.kernel.org/all/nyada24tqwlkzdceyoxbzitzygvp4elvj5oajnqdwb33xkcdwk@76vnrx45fsfd/
> 
> > --- a/drivers/pci/pcie/portdrv.c
> > +++ b/drivers/pci/pcie/portdrv.c
> > @@ -343,7 +343,6 @@ static int pcie_port_device_register(struct pci_dev *dev)
> >  	if (!capabilities)
> >  		return 0;
> >  
> > -	pci_set_master(dev);
> >  	/*
> >  	 * Initialize service irqs. Don't use service devices that
> >  	 * require interrupts if there is no way to generate them.
> 
> [ ... ]
> 
> >  	/* Allocate child services if any */
> > -	status = -ENODEV;
> > -	nr_service = 0;
> >  	for (i = 0; i < PCIE_PORT_DEVICE_MAXSERVICES; i++) {
> >  		int service = 1 << i;
> >  		if (!(capabilities & service))
> >  			continue;
> > -		if (!pcie_device_init(dev, service, irqs[i]))
> > -			nr_service++;
> > +		pcie_device_init(dev, service, irqs[i]);
> >  	}
> > -	if (!nr_service)
> > -		goto error_cleanup_irqs;
> >  
> > -	return 0;
> > +	pci_set_master(dev);
> 
> Does moving pci_set_master() after the pcie_device_init() loop risk dropping
> MSI/MSI-X interrupts during child driver probes?
> 
> The pcie_device_init() function calls device_register(), which synchronously
> invokes the probe routines of child service drivers like pciehp or aer.
> During probe, these child drivers configure the hardware and enable their
> interrupts.
> 
> Because PCIe MSI and MSI-X interrupts are memory write transactions, they
> require the Bus Master Enable (BME) bit to be set in the PCI Command Register.
> 
> If a hardware event occurs immediately after the child driver unmasks the
> interrupt but before pci_set_master(dev) is called, will the hardware attempt
> to send an MSI and drop the memory write because BME is 0?
> 
> Since PCIe interrupts are edge-triggered messages, could these dropped
> interrupts result in permanently missed hotplug events or cause hardware error
> handling regressions?

Ha, that's funny. It's all a great question I think, and that's pretty
much what I asked Bjorn here when he suggested moving this:

https://lore.kernel.org/all/aZfIfn9viQRj4uy4@google.com/

He seems to think it's not a problem:

https://lore.kernel.org/all/20260220164046.GA3528004@bhelgaas/

but I'm frankly not very convinced. I think it's perfectly possible that
a child service will try to enable MSI, the device will try to write,
and those writes will be dropped, producing a missing interrupt.

Bjorn, what do you think? Personally, I'd go back to something closer to
v2, where we enable mastering before initializing children. But maybe
you know better than this bot and me.

Frankly, this is all a distraction from the actual goal of my patch, so
I'd rather not make arbitrary changes to the ordering if we're not sure.

Brian

> > -error_cleanup_irqs:
> > -	pci_free_irq_vectors(dev);
> > -error_disable:
> > -	pci_disable_device(dev);
> > -	return status;
> > +	return 0;
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260508133629.v3.1.I5fd5d83f518681b3949d8ab2f16ba8244fd3e774@changeid?part=1
