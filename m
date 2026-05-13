Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4720E43D500
	for <sashiko@lists.linux.dev>; Wed, 13 May 2026 14:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682743; cv=none; b=QYPjjhv4dlHbkxNtSA3A+bhzsYMjum4fIN7fNl3f9WFcGHy1Wsek3YZ6u2PGHecfWFkZt9YBxVmBadwU11EKcdaAB+wF+qtPqtJ6QZqfbu0S8JH54mUrSowHxcUEdO/7l1V41Ldt5HA4zYT3Rl4tNJG33n2G8U6pord0XxiikuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682743; c=relaxed/simple;
	bh=X9jQF87PVNNykcMR6yot+cIK48D4cwrRooUUxWYIqZk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W+ZElYMMi8zV3GzSA+YF3zv2QqjT7QPuArBZtCnrjUw+GBLkjis3lBf75sbTDHpZ07rSCtzJZHKR78nWDC0TatgqIT0IdPZexh490EQNCLaX7KO/DloxLHMW824t+pYSkza6FG3ONfl8kjvBxTMbmcdobSvkBr3abJqIhhsfWFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=G8inXWsE; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="G8inXWsE"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 99D524E42C29;
	Wed, 13 May 2026 14:32:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6ED2C5FE21;
	Wed, 13 May 2026 14:32:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 15FB711AF8D09;
	Wed, 13 May 2026 16:32:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778682738; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BeMxtiYSxnMuFpCibRJ1g3CISU5zbRRx7sxRDLcB54o=;
	b=G8inXWsEs+1Ba/mVWXum+eoY+VjSBs0VbRmakhkrfUG/faiJ2bpYhTpn5iIjMVRf8Ahhkl
	0DRr1BNNYb23YWzNKfcRPnsT60sCGsJesdJNZ/FlD1Yy/omyIU/OWVn6W/4g6MqIm5yFQ2
	eS06QlrdDrS45pKCzixCIBkIL6aVIzIinWjfsWu4irYWbttkuAmYknrQBqQ9pizAAxFra+
	SI/YTEXQU2vmpfZHyy5X1y+57b+JgJ8Vupvgj2nKan4bbaAPUlNSLoDh1owPKBHtxNENda
	Mq8Epgw952yOHSvxeQldkARaA2QBUneg4VKzRoy8qsHI7f01U+dh2dZY8WjKZA==
Date: Wed, 13 May 2026 16:32:15 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: sashiko-bot@kernel.org
Cc: sashiko@lists.linux.dev, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v7 2/2] bus: simple-pm-bus: Populate child nodes at
 probe
Message-ID: <20260513163215.509d8ce4@bootlin.com>
In-Reply-To: <20260512221231.2876FC2BCB0@smtp.kernel.org>
References: <20260511155902.34534-3-herve.codina@bootlin.com>
	<20260512221231.2876FC2BCB0@smtp.kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi all,

On Tue, 12 May 2026 22:12:30 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The patch resolves fw_devlink corruption for transparent buses matched via `of_match_table`, but fails to apply this fix to transparent buses bound via `driver_override`, leaving devlinks broken in that path.
> --
> 
> commit 428668c33cfe17b55dfc398a9e43567a082e1c3e
> Author: Herve Codina <herve.codina@bootlin.com>
> 
> bus: simple-pm-bus: Populate child nodes at probe
> 
> This commit modifies the simple-pm-bus driver to populate child nodes
> during probe for transparent buses matched via of_match_table. This prevents
> wrong or missing devlinks when fw_devlink assumes a bound driver will
> populate its child firmware nodes.
> 
> > diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
> > index 4b2a793dfbd90..d969bf19a4e95 100644
> > --- a/drivers/bus/simple-pm-bus.c
> > +++ b/drivers/bus/simple-pm-bus.c
> > @@ -42,14 +42,15 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
> >  	match = of_match_device(dev->driver->of_match_table, dev);
> >  	/*
> >  	 * These are transparent bus devices (not simple-pm-bus matches) that  
> [ ... ]
> >  	if (match && match->data) {
> >  		if (of_property_match_string(np, "compatible", match->compatible) == 0)
> > -			return 0;
> > +			goto populate;
> >  		else
> >  			return -ENODEV;
> >  	}  
> 
> Does this leave fw_devlink corrupted when the driver is bound using
> driver_override?
> 
> Looking at simple_pm_bus_probe(), there is an early exit for driver_override
> just before this block:
> 
> 	if (device_has_driver_override(&pdev->dev))
> 		return 0;
> 
> Since it still returns directly instead of jumping to the populate label,
> transparent buses bound via the driver_override sysfs attribute will skip
> populating their child nodes. This seems to trigger the same wrong
> supplier assignments from fw_devlink that this patch intended to fix.

Well if driver_override is used fw_devlink issues related to simple-bus can
be present.

The idea in the original driver was to do nothing when driver_override is
used. This idea has been kept to avoid any regression.

> 
> > @@ -78,7 +80,7 @@ static void simple_pm_bus_remove(struct platform_device *pdev)
> >  {
> >  	const void *data = of_device_get_match_data(&pdev->dev);
> >  
> > -	if (device_has_driver_override(&pdev->dev) || data)
> > +	if (device_has_driver_override(&pdev->dev))
> >  		return;
> >  
> >  	dev_dbg(&pdev->dev, "%s\n", __func__);
> > @@ -86,7 +88,8 @@ static void simple_pm_bus_remove(struct platform_device *pdev)
> >  	if (pdev->dev.of_node)
> >  		of_platform_depopulate(&pdev->dev);  
> 
> If the driver_override path in probe() is updated to populate children,
> should this remove() function also be updated to depopulate them?
> 
> Additionally, does checking device_has_driver_override() here risk unbalanced
> cleanup? If userspace modifies the driver_override sysfs attribute after
> probe() but before remove(), this check could evaluate differently during
> removal. Since of_platform_depopulate() safely ignores unpopulated buses,
> would it be better to call it unconditionally?
> 

Not sure that calling it unconditionally should be done.
The original driver behavior at remove() has been kept.

Maintainers, what is your feeling about this driver_override topic here
with modification and in the original driver?

Best regards,
Hervé
