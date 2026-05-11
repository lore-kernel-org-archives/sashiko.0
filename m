Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108923B0AE3
	for <sashiko@lists.linux.dev>; Mon, 11 May 2026 07:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486308; cv=none; b=cgj0Yjyi/S2952NcVrqnj5BMKvvTon7gzXwD4MVcCU/s7A25UDoM+VJ+7obkhwNtasI/8/KrcvfMuTZh6Npf5FHlJGd4bRSuyC+UpocRDq0A3HEyunodmjzHx98atTzDNup8I03s/Pi7pourRQb+E6KqmYZEQZZXAsYazJOC3fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486308; c=relaxed/simple;
	bh=NHINMhePipL6di/Xy3QjK+QPqwRRwkkW1FBNY5lZ7+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IYnqNUmZ/kRH1FOLYih+o/qTWuWZjQGyA9OeT5+phtrqAqY8kitWKB5S7Fw9npfteYiDIeU8GPhSn9rjrbSItYNuo9y7RTFkX/IIHbyEI/IwtWWKrP1Dg9W9jtwYPLGrKgDTl6HagHrTEJIshhkTnIaK89CJ72NvoMGFaWZcVsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CqHEKTMc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iceGL9l/; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CqHEKTMc";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iceGL9l/"
Date: Mon, 11 May 2026 09:58:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778486296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V/Nkvvpjzjm2CXLb6CLpgFLo/CSGkb6emSH8TChcJpA=;
	b=CqHEKTMcq65xkno+cmy6FH7Luvs3xft09KnauqWahKPsT3hikh+ZMDFRmAXnt1Ho08zntn
	SAOPcBrqHF3wqW0CeBVnCIUfdDbwqSZMJgyHdV667Gbxh37YK8dTDQ1MaLa48E8LAOIQGI
	fmIYl9AGT6OTixrT2kFlcZJBKGiQiRPWLoyqFAbpoqlaDYAZPLksw3pm4tMCAk9tG1Rwl1
	ihAW7QdHvcnIGoay2Xf2WVstoxNlYloShhm78icQXgD/KD80rYQTz6gMaN/ND7oaj17Dm6
	FXR4Eiqgizx/9d5wo0N/79CxMH8NDIt1K0rA5wYCeJtjPe6hCUmNxXTJXJbIuQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778486296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V/Nkvvpjzjm2CXLb6CLpgFLo/CSGkb6emSH8TChcJpA=;
	b=iceGL9l/UZc75q8gUaIRiFV9G/j+XA1lc6iOfxOnRfqm0AeXjq7I3Zpjvu+tsJMTH8+/z8
	yCk392NT80nVr1AA==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: sashiko@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	krzk+dt@kernel.org, Srinivas Kandagatla <srini@kernel.org>, 
	florian.fainelli@broadcom.com
Subject: Re: [PATCH v4 2/5] nvmem: Add the Raspberry Pi OTP driver
Message-ID: <6s6aaokvdawgdnm4htun5ghyg355vjrk2ctm63qvvjqr5segkr@ivfhd2r3s3s4>
References: <20260508-rpi-otp-driver-v4-2-cf8d725d8821@linutronix.de>
 <20260508214522.E09BCC2BCB4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508214522.E09BCC2BCB4@smtp.kernel.org>

On Fri, May 08, 2026 at 09:45:22PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Critical] The driver exposes sensitive OTP memory (including device-specific private keys) with world-readable sysfs permissions.
> - [High] Unchecked firmware response size modifying `fwbuf->count` under `__counted_by_le()` annotation triggers a fortified memcpy panic.
> --
> 
> commit a8dbaf078fc585c391a3307f1adbf25d7433260e
> Author: Gregor Herburger <gregor.herburger@linutronix.de>
> 
> nvmem: Add the Raspberry Pi OTP driver
> 
> Raspberry Pis have OTP registers which can be accessed through the videocore
> firmware. Add a nvmem driver to support these OTP registers.
> 
> > diff --git a/drivers/nvmem/raspberrypi-otp.c b/drivers/nvmem/raspberrypi-otp.c
> > new file mode 100644
> > index 0000000000000..393640cb9e32b
> > --- /dev/null
> > +++ b/drivers/nvmem/raspberrypi-otp.c
> > @@ -0,0 +1,130 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> [ ... ]
> > +struct rpi_otp_header {
> > +	__le32 start;
> > +	__le32 count;
> > +	__le32 data[] __counted_by_le(count);
> > +};
> > +
> > +static int rpi_otp_read(void *context, unsigned int offset, void *buf, size_t bytes)
> > +{
> [ ... ]
> > +	fwbuf->start = cpu_to_le32(offset / 4);
> > +	fwbuf->count = cpu_to_le32(count);
> > +
> > +	ret = rpi_firmware_property(priv->fw, priv->read_tag, fwbuf,
> > +				    sizeof(struct rpi_otp_header) + bytes);
> > +	if (ret)
> > +		goto out;
> > +
> > +	memcpy(buf, fwbuf->data, bytes);
> 
> If the firmware performs a short read or encounters a partial error, does it
> update fwbuf->count to the actual number of words read?
> 
> If fwbuf->count is updated to a smaller value, the __counted_by_le() attribute
> will dynamically shrink the bounded size of fwbuf->data. Could this cause the
> memcpy() to trigger a fortified memcpy panic, since it uses the original
> requested bytes size?
> 

The firmware does not update the count field [1]. There is an extra field in the
tag header req_resp_size which is used by the firmware to indicate the length of
the response. If the response is longer the it gets truncated to fit into the
provided buffer. So I see no need to change something here.

> [ ... ]
> > +static int rpi_otp_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct nvmem_device *nvmem;
> > +	struct rpi_otp_priv *priv;
> > +	const struct rpi_otp_driver_data *data;
> > +	struct nvmem_config config = {
> > +		.read_only = false,
> > +		.word_size = 4,
> > +		.stride = 4,
> > +		.reg_read = rpi_otp_read,
> > +		.reg_write = rpi_otp_write,
> > +		.id = NVMEM_DEVID_NONE,
> > +	};
> 
> The commit message notes this driver supports the "device specific private key
> OTP (BCM2712 only)".
> 
> Does the nvmem subsystem default to creating world-readable sysfs attributes
> unless explicitly restricted? Could this expose hardware private keys to
> unprivileged users via sysfs?
> 
> Should the config set .root_only = true to prevent this?

That's a valid point but I am not quite sure about this. From a hardware
perspective it seems the two otp regions are identical. That the 'private-otp'
is used for a private key seems to be purely conventional.

Also looking at the other nvmem drivers that set this to true (nintendo-otp,
rcare-efuse, qoriq-efuse and apple-efuses) seem to be drivers that all set the
read_only and seem to be drivers reading some preseeded keys or hardware
information.

I tend to set it to true for the bcm2712 private-otp and leave it false for the
customer-otp but would like to hear some more opinions on that.


Regards Gregor

[1] https://github.com/raspberrypi/firmware/wiki/Mailbox-property-interface
