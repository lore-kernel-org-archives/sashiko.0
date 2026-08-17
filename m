Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0270F43C7C1;
	Mon, 17 Aug 2026 14:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786978750; cv=none; b=PTE84/xYrZ3zEUWbSmkmVdK5x3AC2CEsM+8U5r+agSHdtBl5VO7GrTpuheb6hrhyQTH5wKF8JLqhQMv1JO8adr7/igoWGjTeQW58q+1VHML1E77jSr9rqODb5qSckDW3YfK+9V5OyXIhhZZHKudvKGRb5gMp+4IsX5JxPlDUCOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786978750; c=relaxed/simple;
	bh=XM81E2jRpLvBanF8k+WjEK3UoWVt1hvhoxv/+K7btT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXuvkwU2CAL9bA8M5cjz+SkCMEC/PBUle1c0KHJWqRFNlk0CRGNd+JK6nJOKhdEpg9ZchS68geSH1PkXN3a3y+iuZ0rE1XmHY/ROTRFt5k/cpu8IluqBNv/OWGkLtmE9Zl0cuMB/NZED/0bwvSp17AqTW5I7a7HK2WBsxDY1ph4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N4a0oPFs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N4a0oPFs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 740091F00A3A;
	Mon, 17 Aug 2026 14:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786978748;
	bh=SmPfPD04PiLgxtgqUHxM80gX96uZJmDTM6hLC34nS1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N4a0oPFsqt9IWGfSpZ2uR1QUtrl58qeFmEBMwLThjOfqoS4FXN7uIOe3lNEt5a4yU
	 ll/l1rc1sexAI/P8OeqtE4yhhoDmq/SCBecQ/U9AJi1gOOSpWc8a/MYCLAUjMPtibA
	 tS/LlYc6l93clPLT0JC6ogg586ppOP8eBlSsfn4vOb43qCWHYv+nwpqu7pkD9Zpcw/
	 CafRp3VnSsrqtXNOZ2WLwj4iBEcfX9lXNsK0wvditpvUGb/5r/p//lQwkITN3i0nrm
	 b0EQDf+7QqyNnw/TC0IKgmecgFVhY9GIBxrZdFI91ateGbTAFVPVM6xbPGzktkHOUi
	 aLrDKh1IL8Ajg==
Date: Mon, 17 Aug 2026 09:59:06 -0500
From: Rob Herring <robh@kernel.org>
To: Saravana Kannan <saravanak@kernel.org>
Cc: Abdurrahman Hussain <abdurrahman@nexthop.ai>, sashiko@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] of: property: add i2c-parent to fw_devlink supplier
 bindings
Message-ID: <20260817145906.GB579285-robh@kernel.org>
References: <20260815-b4-of-property-add-i2c-parent-v3-1-c22588b6482a@nexthop.ai>
 <CACRMN=cXSy0ZYH78sQ88QKkwYtbE768kh=KzRhkYYCO4SX2m-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRMN=cXSy0ZYH78sQ88QKkwYtbE768kh=KzRhkYYCO4SX2m-Q@mail.gmail.com>

On Sun, Aug 16, 2026 at 10:17:08PM -0700, Saravana Kannan wrote:
> On Sat, Aug 15, 2026 at 8:33 PM Abdurrahman Hussain
> <abdurrahman@nexthop.ai> wrote:
> >
> > Platform-device i2c muxes (i2c-mux-reg, i2c-mux-gpio, ...) reference
> > the bus they multiplex with an i2c-parent phandle and hold a reference
> > on that adapter from probe until remove. Unlike muxes that are clients
> > on the parent bus, they live outside the adapter's device hierarchy,
> > so nothing orders their teardown against it: if the adapter's device
> > is unbound first — e.g. while reverting a device-tree overlay whose
> > changeset attached the mux nodes before the controller nodes —
> > i2c_del_adapter() blocks forever in
> > wait_for_completion(&adap->dev_released), waiting for a reference that
> > is only dropped later in the same teardown sequence.
> >
> > Teach fw_devlink about i2c-parent so the core creates the
> > corresponding device links: consumers are unbound before the parent
> > adapter's device, and probe ordering no longer needs -EPROBE_DEFER.
> >
> > A plain DEFINE_SIMPLE_PROP() cannot be used because the property has
> > two incompatible layouts: the i2c mux bindings hold a list of bare
> > phandles (i2c-demux-pinctrl takes several), while toshiba,tc9563 holds
> > a single phandle followed by an i2c slave-address cell. The two forms
> > are indistinguishable in the flattened tree, and a 0-cell parse of the
> > tc9563 form would read the slave address as a phandle, linking the
> > consumer to whatever node happens to carry that phandle value. Use a
> > custom parser that only takes entry 0 for toshiba,tc9563 nodes.
> >
> > Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> > ---
> > Changes in v3:
> > - Fix the tc9563 compatible check: match "pci1179,0623" (the actual
> >   binding compatible) instead of "toshiba,tc9563", which never matched
> >   and let the bare-phandle parser misread the i2c slave-address cell as
> >   a phandle (Sashiko AI review)
> > - Link to v2: https://patch.msgid.link/20260815-b4-of-property-add-i2c-parent-v2-1-239c6da9e097@nexthop.ai
> >
> > Changes in v2:
> > - Use a custom parser instead of DEFINE_SIMPLE_PROP: toshiba,tc9563 puts
> >   an i2c slave-address cell after the phandle, which a 0-cell parse
> >   would misread as a phandle (Sashiko AI review, Rob). Kept the full
> 
> A bit of a tangent, is this a bug in Sashiko bot?
> It just dropped me from the reply in the v1 patch set. Any idea why?

sashiko has configuration for who to reply to rather than reply-all. 
Probably something not right there. 

I think it should be reply-all, but the sashiko maintainers are 
reluctant to enable that and some folks don't want to get the reports.

Rob
