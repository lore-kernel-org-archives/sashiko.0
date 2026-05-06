Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B672D63F8
	for <sashiko@lists.linux.dev>; Wed,  6 May 2026 15:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778079697; cv=none; b=jAbXmfzpICo4mqcveZDmbhczbcE5olxga382UR+tDUBqjj/Mfohj4qXqctzW92imIDXdbWL6RD5hPi2ZZth9qSA5+ETi2jXYjG+KHQM5oP3lPd7/+SpyZV70h7GVte8Nf/9Zmw1EW7IXGehjGOiIRetkJOBN6015qoKCg6ZlSQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778079697; c=relaxed/simple;
	bh=97D+2KHVfIQtZnF/BiA1aQSJIGdLjAtMFhlOAFZiK14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LELhCCA41+2TU2s6OkIc8xccet6HVSgHfqtdBFQHj/ZTtdLdaL7JnyGcVrMbQ78pc/wVN5rZvy5qmiAmS+7JFOvRa9XWIDW2B6IAaoiUELQN+zoUjEKYHwFwpcT7Y76Sq+zq5qfgZcxO9VFyVRVL3IWj6/0AqpEv2AbtU1elIbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fB558Anl; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fB558Anl"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8eae9229110so1041138385a.1
        for <sashiko@lists.linux.dev>; Wed, 06 May 2026 08:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778079694; x=1778684494; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gLAHKjPfNYNOn213evw/K14liXEUXmu1VrX7uQeQpoc=;
        b=fB558Anl/zrJtwkVrALJYjjBEPcqo9gXgwI/TmSJLutLtVge75z611mpatXg5O2sHn
         ppTks64ly1oi8aWOtB73j7aGp4aeKSScNWjFJuE23qT66oi7K+NI8xPiCWstT8aDcacM
         twZPM5rPRIEmlcC3dAnFAOkOIHXcZS9rSOkWDLLu0xl25nTLyE80DMy5DONgjMRwbYcD
         P/0Qv//YlI2TsymJltYAb8ZFb9goZStXxD6H+z6wln+nyne/fpTbtVKLIHkFr64KTdHX
         06jWZeeQwxhliTWkXjhK0J6ldtNQbtl82h/M6XE5rWDraVjZRM86TJxHwI+z0Fz1BiAc
         oHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778079694; x=1778684494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gLAHKjPfNYNOn213evw/K14liXEUXmu1VrX7uQeQpoc=;
        b=VfuaLAseXQd7kll4EzWghJwACzzh12o9iGopDXMgCs72jg6LRdb4edCPBtQoDx+HHs
         GVjAHDwzF+GvfWUKWFY9seVnHNzq/QXIEK1bxVAg0hk0RY1wJo5kKHY8Qoh5TNx8fX/L
         buTzNdTUXkyiW5kDcT/0ODyUADnV/Rz5q+JJw+h85hHlpOKUtFjaljIsqAhD532ABrZO
         UQwc73QOG4PS+fXm2nlo7KOm6VvoQ4VuQC+yEaB1Rq+A88xJ2S8zKvIgSjauN/AhVvwf
         kDZq/w4QCNCTDTljlUjAM4ybxVg2ZO9gZ97fPqkKXewOjGz9ci2i1qAOrttj7BPMfP9x
         x2rw==
X-Gm-Message-State: AOJu0YwNI/9fBCSUOtMtV7yz5JmXiHDAMMgFfLYT0keVmsJpmoPaNJBX
	Z5DACCD8cgpQx7O+Tq0yz6FjXfUGCHHpjqSH1lAC1RfkMTxTB02puUVwh5L8xg==
X-Gm-Gg: AeBDievFF6ZlOHj0htSQltg/5vgJCkL+6JEOqCvRrp/tKPAafFeM0ehlN3gh8aEWXH9
	H3OKxB5TXvnrTulUxeJaX8Sr3WO1hqjHhCWKjmfhrf9dWkYMiZnUByFCFxJiQrMXwzg+aHaralJ
	5heZYBlccf7pZZjhdnwQubYlGPMhJLqw/6ZrkzWc3yTkqHxagPkepTAaMzAKHMcwW+hxI/Ht2Rw
	C4/eXFujS7KjegPzeeSZEeJl54US6bi/iuhDQOXP34Wf8d/SYXBfyn1HE4yyklsVIEGaWuFIIco
	5gXPmDSq1ZKmgMwhw7sIPMpr0GfGhgmsIsV4pmux2nK0NvJiu7tvOt9Ac+uEG7/PkM4ExbTh7PH
	L/tR1pMmU4C568U2kmpuC5AaNZlTdaUs6BdGBsL4VUe2NgU3aCuLoqbjpbv72s3kd8+cUq/DlVk
	QkPvP1xKtg7d4sN/5wHxt20+WUs8GhvVoTYUHZiFUHDLmZyUSsgw+xmx3+1w==
X-Received: by 2002:a05:620a:458f:b0:8cf:d9a8:561b with SMTP id af79cd13be357-904d1081bacmr573794385a.0.1778079657410;
        Wed, 06 May 2026 08:00:57 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:f800:11::])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c34a0d4sm1635460285a.25.2026.05.06.08.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 08:00:56 -0700 (PDT)
Date: Wed, 6 May 2026 08:00:53 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/6] net: devmem: support TX over
 NETMEM_TX_NO_DMA devices
Message-ID: <aftXpXLupAnYh27M@devvm29614.prn0.facebook.com>
References: <20260504-tcp-dm-netkit-v2-2-56d52ac72fd4@meta.com>
 <20260506002905.DF681C2BCB4@smtp.kernel.org>
 <afqXAKj4fJbTd4tL@devvm29614.prn0.facebook.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afqXAKj4fJbTd4tL@devvm29614.prn0.facebook.com>

On Tue, May 05, 2026 at 06:18:56PM -0700, Bobby Eshleman wrote:
> On Wed, May 06, 2026 at 12:29:05AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> > - [High] Double lock lockdep splat and potential deadlock in netdev_nl_bind_tx_doit()
> > - [High] Use-After-Free of dma_dev pointer in netdev_nl_bind_tx_doit()
> > - [High] ABA vulnerability and pointer aliasing due to untracked vdev lifecycle
> > --
> > 
> > commit fea3266a76d31b8278bf86dac679860b442a5bea
> > Author: Bobby Eshleman <bobbyeshleman@meta.com>
> > 
> > net: devmem: support TX over NETMEM_TX_NO_DMA devices
> > 
> > This patch enables devmem TX bindings on netkit virtual devices by routing
> > the binding to the underlying DMA-capable physical device. It extends the
> > skb validation and binding lookup to support the netkit architecture.
> > 

[...]
> 
> > > diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
> > > index b8f6076d8007..0e296c3bb677 100644
> > > --- a/net/core/netdev-genl.c
> > > +++ b/net/core/netdev-genl.c
> > [ ... ]
> > > @@ -1164,16 +1197,30 @@ int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info)
> > [ ... ]
> > > +	bind_dev = netdev_find_netmem_tx_dev(netdev);
> > > +	if (!bind_dev) {
> > > +		err = -EOPNOTSUPP;
> > > +		NL_SET_ERR_MSG(info->extack,
> > > +			       "No DMA-capable device found for netmem TX");
> > > +		goto err_unlock_netdev;
> > > +	}
> > > +
> > > +	if (bind_dev != netdev)
> > > +		netdev_lock(bind_dev);
> > 
> > Will acquiring netdev_lock() on bind_dev while already holding it on netdev
> > trigger a lockdep warning? Since both are struct net_device instances, their
> > locks belong to the exact same lockdep class. Without a mutex_lock_nested()
> > annotation, acquiring them sequentially might trigger a possible circular
> > locking dependency splat, and introduce a potential deadlock if locked in
> > reverse order elsewhere.
> 
> The tests passed with CONFIG_LOCKDEP=y and CONFIG_PROVE_LOCKING=y. Since
> they take the bind_dev != netdev path, I'm not not sure if this is
> needed. Though I admit I don't fully understand mutex subclasses...

Thinking about this more... I think the cleanest approach will be to
just release netdev after looking up bind_dev and then
netdev_lock(bind_dev) immediately after and hold until returning, which
covers both cases bind_dev == netdev and bind_dev != netdev.
