Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BA74B0497;
	Mon, 17 Aug 2026 21:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787000442; cv=none; b=r4IYlEwaEI+dV24Ax3haTanE9+3P4LVQfz/ZqfHq8htzUzD3PM75JLIf3DQuaz2SrGB8/q0+FvJF/BuVch6m3olDJMpicQeaNnA4fnuNvB6vt5EgAfGktKOeVAm6QnFeqWPYSzvCSbgh0EQe87J/I5XhZbFYgSIflgMg9GAFMis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787000442; c=relaxed/simple;
	bh=YW37hDplmp2viwh/PN8b8F3Dmp6VSAk53TI9k1ZoE8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WLJBVhRC/VaxKaHHIbewfm9WUZun8SlQ08Fp9KxDdaAEPeplB3kX8x5EWEk76PLb5YkJuaGGScrVWEd1Trqm8ltRALLUvIB+kxQCWT/kJegcZ2lFKqHgpWsqZr1cgntEQ8zPWRQcdpbquY0Aa2DxQJsNmHbwaQsOn1EPemsKhSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PcoPJjxx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PcoPJjxx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECCC21F00A3A;
	Mon, 17 Aug 2026 21:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787000441;
	bh=EiH/e7nezjEzMyLNOQUgUCy4Kq7EycyTmZmVvtOWk4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PcoPJjxxGXfAgLjZK3c+/GjzA+k4CPKyvnGzKZf68JiOy3WAanQp8b879in46m9ef
	 fO2h7Y7fJLM/tYuxJ33xbo6cjHvt0qfxPNLBJh/rmOVOxm8m6a9danOb+fjGQVkGOe
	 b3CzGUXwBvaqF/nCWB1dHJbG60YPmb36AaFQuR9sUQeT2U60JDV/0/JyYTNrLPdS1P
	 MlMJtiF4TT8jtr5Liu4YwJDK0ZAGljTcyRops0Slis+Zn+95fxOS82sDOsdpKv8obN
	 Jb4rVhClP9Anc8I55zbSRAw46Br92NwmDvOPKHlnx+5VUr7dEiiGuhgGQ9b8uT8l5t
	 BOChCVtG3wpRQ==
Date: Mon, 17 Aug 2026 16:00:38 -0500
From: Rob Herring <robh@kernel.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Saravana Kannan <saravanak@kernel.org>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	sashiko@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] of: property: add i2c-parent to fw_devlink supplier
 bindings
Message-ID: <20260817210038.GA1775252-robh@kernel.org>
References: <20260815-b4-of-property-add-i2c-parent-v3-1-c22588b6482a@nexthop.ai>
 <CACRMN=cXSy0ZYH78sQ88QKkwYtbE768kh=KzRhkYYCO4SX2m-Q@mail.gmail.com>
 <20260817145906.GB579285-robh@kernel.org>
 <7ia4tsosfsj5.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ia4tsosfsj5.fsf@castle.c.googlers.com>

On Mon, Aug 17, 2026 at 07:36:46PM +0000, Roman Gushchin wrote:
> Rob Herring <robh@kernel.org> writes:
> 
> > On Sun, Aug 16, 2026 at 10:17:08PM -0700, Saravana Kannan wrote:
> >> On Sat, Aug 15, 2026 at 8:33 PM Abdurrahman Hussain
> >> <abdurrahman@nexthop.ai> wrote:
> >> >
> >> > Platform-device i2c muxes (i2c-mux-reg, i2c-mux-gpio, ...) reference
> >> > the bus they multiplex with an i2c-parent phandle and hold a reference
> >> > on that adapter from probe until remove. Unlike muxes that are clients
> >> > on the parent bus, they live outside the adapter's device hierarchy,
> >> > so nothing orders their teardown against it: if the adapter's device
> >> > is unbound first — e.g. while reverting a device-tree overlay whose
> >> > changeset attached the mux nodes before the controller nodes —
> >> > i2c_del_adapter() blocks forever in
> >> > wait_for_completion(&adap->dev_released), waiting for a reference that
> >> > is only dropped later in the same teardown sequence.
> >> >
> >> > Teach fw_devlink about i2c-parent so the core creates the
> >> > corresponding device links: consumers are unbound before the parent
> >> > adapter's device, and probe ordering no longer needs -EPROBE_DEFER.
> >> >
> >> > A plain DEFINE_SIMPLE_PROP() cannot be used because the property has
> >> > two incompatible layouts: the i2c mux bindings hold a list of bare
> >> > phandles (i2c-demux-pinctrl takes several), while toshiba,tc9563 holds
> >> > a single phandle followed by an i2c slave-address cell. The two forms
> >> > are indistinguishable in the flattened tree, and a 0-cell parse of the
> >> > tc9563 form would read the slave address as a phandle, linking the
> >> > consumer to whatever node happens to carry that phandle value. Use a
> >> > custom parser that only takes entry 0 for toshiba,tc9563 nodes.
> >> >
> >> > Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> >> > ---
> >> > Changes in v3:
> >> > - Fix the tc9563 compatible check: match "pci1179,0623" (the actual
> >> >   binding compatible) instead of "toshiba,tc9563", which never matched
> >> >   and let the bare-phandle parser misread the i2c slave-address cell as
> >> >   a phandle (Sashiko AI review)
> >> > - Link to v2: https://patch.msgid.link/20260815-b4-of-property-add-i2c-parent-v2-1-239c6da9e097@nexthop.ai
> >> >
> >> > Changes in v2:
> >> > - Use a custom parser instead of DEFINE_SIMPLE_PROP: toshiba,tc9563 puts
> >> >   an i2c slave-address cell after the phandle, which a 0-cell parse
> >> >   would misread as a phandle (Sashiko AI review, Rob). Kept the full
> >> 
> >> A bit of a tangent, is this a bug in Sashiko bot?
> >> It just dropped me from the reply in the v1 patch set. Any idea why?
> 
> Hm, can you, please, clarify, what do you mean?
> https://sashiko.dev/#/patchset/20260813-b4-of-property-add-i2c-parent-v1-1-a2487e920ce1%40nexthop.ai
> has your email in to according to the email policy.

It has mine, but not Saravana's. The problem is Saravana only gets 
drivers/of/ emails and not all the bindings.

Saravana, If I enable your email, then you will get all the 
sashiko binding replies. Is that okay?

Rob
