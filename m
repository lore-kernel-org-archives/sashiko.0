Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC004485516
	for <sashiko@lists.linux.dev>; Mon, 19 Oct 2026 05:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792389171; cv=none; b=T7NUWLBg26rfut3XbNj6IrUZnYnxbOHrlKxtp6PlZdPdwlF39WxMqxqLI4+Vjdj/6KcI7gvwulBB+rDitDkhOI1rQ8zB0yyCVL0OrBNZyUaV6/JCfLW1DGtgtR/RWcfMts/5dNTHh2b3OimqozcuLle8KjHZD4MDTJBrpdGc/HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792389171; c=relaxed/simple;
	bh=xDnm4WNryP4BQ81AAwrNKVfTd0TkxlHrQShbbMmMkZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KnUzaZpPLrKHsct4AKwd8YcmCiY49xh0V6QRtc+YEnvBu+ly5iIpawA+l0l9O/yM0p7Jv8vGh6FoMyazQ7x+zWD+Rql/ojXuaCj3diFNy9NV7QRyJrSdHVfGc/Al/ENoc4TZHATAd3VjTW4XmCJ9kw8n7rqx/ikKHjPk5Z3va6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gw/DHpNe; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gw/DHpNe"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so1500069a91.2
        for <sashiko@lists.linux.dev>; Sun, 18 Oct 2026 22:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792389048; x=1792993848; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xDnm4WNryP4BQ81AAwrNKVfTd0TkxlHrQShbbMmMkZs=;
        b=gw/DHpNeIwIBaUnW/XPj55AOxhG9D/08keQV8TYpBwRRm7WVvNaHgUZWaIPYMWmBem
         vymlIZNcJjxtfIb6kdYEJ71tUYPoTxdGy4hE4ZVk5kbwj/06k/7FuiVPVbeXJ5BEoger
         +CHhCMfcCgBgDXklicZqKwg3KG5Dye0TzemIDcaut7W6yz1FqU+wIXZwtG3YVVQX64xx
         QiRq094a9ZPp4gYYKspn6Xr45BfayMi9oDYdzldCRMZMWUE8A+YgqC0dNeWi2n21wSTE
         6JqZr0o+NceMrzZ0sIzATOQw+igB/74X0nCDhpoSAPiXkexDZwVEHXwny30+pezLMh7g
         Y/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792389048; x=1792993848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xDnm4WNryP4BQ81AAwrNKVfTd0TkxlHrQShbbMmMkZs=;
        b=WHtlggC9KXDk/fI7dOPZicuQO2SWFgMOEhsnjqFIKIt5azkIxG7k/wNv0SMxQomvfe
         DezCQc4PYY6tArvBau3TdlkD/ZouZeOzXSh1oXJvTIIO84rSHhBCZ0ntyFtDxA3/on08
         HusjLby7cmim7trWeglJPccg0cUZPeDoHEAHd+spHsdeclHDYqXM1Yd6xjVL535AH0O9
         zz918+dkWteUqs4qFe3meQqWN9aK293+F4vuFO1XRphESGNl+SJT3JOw8SArWTTfy2/s
         dukgo2SVH4i3d7uJAHTw3Ho4BZt3xi7BVliInfwkVG61PcJAeGvSeF0qNqW7UiMpzj3H
         H85g==
X-Forwarded-Encrypted: i=1; AKwUvBzA2OFonX8dOJDL+KD8qOi7EGJqt6EU1uh8nO7lZ2KL7KFkNnhZZlIOgq+aUnuTeKdWsWZTptru@lists.linux.dev
X-Gm-Message-State: AFq9FYIqSVnL5sPOkFTt7rO+YceyXJ9hsYkdBaoOJYg6pq9S+9XaxMMm
	PE61sdhCvIFRPiy/PO8df79SPQu8bd0W0lUmIdBOBdisN18vWdgoPHZ1vnF+6WLf+PI=
X-Gm-Gg: AYBFou0+DeCEbi3IMc6P3ixfx9UZio7/0Ame+tR7NkKPL35iB2r6vSqoihEIwJ0s8/P
	6Cwv/1OsuUIamRJbx/TnFVjxQ1l0vn6j6WmJwtcZT/K7T4iHOHWExMMTZCXkGmQNKzJuQ7s90XE
	RdJ4uRg98XsIBmKX2XKzNXVK0FjPnDzQNr5oa5pFBUSotw7Xm++awvC4l9h6jTIosQPTDJNjIU5
	jPYn7S31kmLjYBzk6BwmlrCfB3sOWQyrHEI7DEr/TTljzIZsAs+G/KClTYNSyLEUSPwPtkk6fwT
	o0bwgHT+NCMWY5+G+hVzueI9EOlsJTMGNRnhQJyv6wS009/cyA9Kui9InO+9Aa/byts6pPgTOcj
	uQwG6i/nCDDX3QDXMjNV20+6OHxrxbdtyLan67hEVhTGT9JS99LZYfb3UC8gKojqi9AzwcyqKzN
	c3VA+TNITr3RfdeKDEJjxOUI+Z8rzDjijRLQCWYL5Iq+Ebr4lAt2b1Sbyjkk8OlAwhmWpezIumh
	UaaiXOqMqPFKLW7oTi14N2XR4d/H1lIp2ssKN17oj8KsMUQdpJK7ntLebMgkbBlglVAem3Qie0=
X-Received: by 2002:a17:90b:2ec3:b0:3ac:80dc:f41d with SMTP id 98e67ed59e1d1-3acef134d71mr5687470a91.32.1792389047942;
        Sun, 18 Oct 2026 22:50:47 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94798212sm19337520a91.14.2026.10.18.22.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 22:50:47 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	sashiko@lists.linux.dev
Subject: Re: addressing sashiko's false positive rate
Date: Mon, 19 Oct 2026 14:50:43 +0900
Message-ID: <20261019055043.3128725-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261003112707.679125-1-sammiee5311@gmail.com>
References: <20261003112707.679125-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Roman,

Just a gentle ping on this, in case it got buried.

On the review-prompts thread you mentioned generating prompts from
feedback and checking them by re-reviewing the original patches. That
sounds close to this. If the next-version signal would help there, I
would be happy to send it as a small PR under scripts/, run by hand and
not in CI.

Thanks,
HyeongJun
