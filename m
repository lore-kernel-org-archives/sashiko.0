Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F15426D33
	for <sashiko@lists.linux.dev>; Wed, 13 May 2026 13:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778679069; cv=none; b=sgLeTMmTGL9l1Wr22IVaRJjN6W5oie5vCHkQDR5efqf18ZiTZvMmVPKSDWUO/srW+pp00rS0JIPb2O06OHt73uUqIN4kp6hFhmy4DxezL1B3vjn3goHkrak0go9g0ehNz83WlsNBfRJs1B/hH/VIbwRJ1vg8C9q3zcILwLTnElw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778679069; c=relaxed/simple;
	bh=pY6if7sag2rowWpqoG3Pn5jU/aynIE8iDDlq/ZoX690=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nRxScdSJBKbqhMUgoep1KH+mqPe4TL6pqp0B4qElqnAcOLz6MdJkao1FIlLvgJhd1Pqa0TE/DbWdu9aOtHVes9cLZ+wMik2BSqHBOtAtsa/W+Z7UpNN3vS8veUGp6CNF07EhxGncGvSHRbCPY7X3K4OgIVy2E/mDgjGykhl/AYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LLPr5r7G; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LLPr5r7G"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3E9371A357C;
	Wed, 13 May 2026 13:31:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0A4A05FE21;
	Wed, 13 May 2026 13:31:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7E58211AF81C6;
	Wed, 13 May 2026 15:31:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778679064; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cD2qweMEedlXR19pqoseBytIAmkuIkwSUtyWqEiRCtY=;
	b=LLPr5r7GnSIaasziblHHuI37uRhFM9YpJ77pem9iVvoY4sH02FvNwxPM74djiGD857LwK4
	SY4plEYKOC3wNzP3L1lOiCioITbyZCoHkhlAnjauv7PByagvtv4BE9vj2iUBFM78h2Mstz
	LZfbb5Jy2xspkO+Tq1B/oBLO5VHMjIstaBJX9YTPSRfmyKjUgmw138FnRfLCIcn69cKrGB
	n9hTglAPlcDAq9/sRGbLtCnmSx7UB7j9OoSvu+LEtLOGvZF/4zEn5zh1gXP2PS0Jt6ea/f
	x1fKziz3D9LB3ppHMQLdZf0v630mTpDZYN18eubYuCmUVrQ7EmbWB83P8jMqSw==
Date: Wed, 13 May 2026 15:31:00 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: sashiko-bot@kernel.org
Cc: sashiko@lists.linux.dev, conor+dt@kernel.org, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev,
 robh@kernel.org
Subject: Re: [PATCH v7 2/3] of: dynamic: Fix overlayed devices not probing
 because of fw_devlink
Message-ID: <20260513153100.1b499fae@bootlin.com>
In-Reply-To: <20260512211643.EB5A6C2BCB0@smtp.kernel.org>
References: <20260511155755.34428-3-herve.codina@bootlin.com>
	<20260512211643.EB5A6C2BCB0@smtp.kernel.org>
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

On Tue, 12 May 2026 21:16:43 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Missing `dev->fwnode` validation in `fw_devlink_pickup_dangling_consumers()` leads to a kernel panic if the device's fwnode is NULL.
> --
> 
> commit eebf7e6f50a0aa0439d5a1099141444a70ec8219
> Author: Saravana Kannan <saravanak@kernel.org>
> 
> of: dynamic: Fix overlayed devices not probing because of fw_devlink
> 
> When an overlay is applied to an already probed device, fw_devlink logic
> is rerun. This allows newly created dangling consumers of overlayed device
> tree nodes to become consumers of the target device.
> 
> Link: https://lore.kernel.org/lkml/20240411235623.1260061-3-saravanak@google.com/
> 
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index bd2ddf2aab505..478aa3fbf1e83 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -235,6 +235,79 @@ static void __fw_devlink_pickup_dangling_consumers(struct fwnode_handle *fwnode,
> >  		__fw_devlink_pickup_dangling_consumers(child, new_sup);
> >  }
> >  
> > +static void fw_devlink_pickup_dangling_consumers(struct device *dev)
> > +{
> > +	struct fwnode_handle *child;
> > +
> > +	guard(mutex)(&fwnode_link_lock);
> > +
> > +	fwnode_for_each_available_child_node(dev->fwnode, child)
> > +		__fw_devlink_pickup_dangling_consumers(child, dev->fwnode);
> > +	__fw_devlink_link_to_consumers(dev);
> > +}  
> 
> Is it possible for dev->fwnode to be NULL here?

Well dev->fwnode is checked for NULL in fwnode_for_each_available_child_node()
iterator.
  https://elixir.bootlin.com/linux/v7.1-rc3/source/include/linux/property.h#L175
  https://elixir.bootlin.com/linux/v7.1-rc3/source/drivers/base/property.c#L840

Adding an additional check for dev->fwnode is not needed.

Best regards,
Hervé

> 
> The original logic in device_links_driver_bound() was protected by a
> dev->fwnode check. The newly added caller fw_devlink_refresh_fwnode() 
> appears to call this without checking if dev->fwnode is still valid:
> 
> fw_devlink_refresh_fwnode()
>   dev = get_dev_from_fwnode(fwnode);
>   ...
>   if (dev->links.status == DL_DEV_DRIVER_BOUND) {
>       fw_devlink_pickup_dangling_consumers(dev);
> 
> If dev->fwnode is NULL, such as when it is cleared by a concurrent
> device_remove_of_node() before device_del() runs, the nested call to
> __fw_devlink_link_to_consumers() will dereference it:
> 
> __fw_devlink_link_to_consumers(struct device *dev)
> {
>         struct fwnode_handle *fwnode = dev->fwnode;
>         ...
>         list_for_each_entry_safe(link, tmp, &fwnode->consumers, s_hook) {
> 
> Could this lead to a crash when &fwnode->consumers is evaluated? Would it
> make sense to add an explicit check for !dev->fwnode at the start of
> fw_devlink_pickup_dangling_consumers() to mirror the structural safety
> previously provided in device_links_driver_bound()?
> 
> [ ... ]
> 
> > @@ -1312,16 +1385,8 @@ void device_links_driver_bound(struct device *dev)
> >  	 * child firmware node.
> >  	 */
> >  	if (dev->fwnode && dev->fwnode->dev == dev) {
> > -		struct fwnode_handle *child;
> > -
> >  		fwnode_links_purge_suppliers(dev->fwnode);
> > -
> > -		guard(mutex)(&fwnode_link_lock);
> > -
> > -		fwnode_for_each_available_child_node(dev->fwnode, child)
> > -			__fw_devlink_pickup_dangling_consumers(child,
> > -							       dev->fwnode);
> > -		__fw_devlink_link_to_consumers(dev);
> > +		fw_devlink_pickup_dangling_consumers(dev);
> >  	}
> >  	device_remove_file(dev, &dev_attr_waiting_for_supplier);
> >  
> 



-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
