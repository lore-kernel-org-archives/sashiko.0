Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792718180;
	b=L8H8EGyfILBboWez0cJsBXrk7U2O7A6QQxc360oBTQClANfWLrDaQ8I8u8vJJJkGKbbN
	 nIOBubwzd9k6FdBQNe73Ox4TQYJuhF5k344beI30RV8tugcx181usKRYyzKgYg5fdW6f7
	 UXZ00nYGVSq4twE7H/sM7mWKJ4+dGjVi/oTB4loWzA0Y0dSIge5v1uKbCxxT9Iawztsay
	 4ctIa2RsDj/SDSsYXFklPhEthxzLcToSM7utcN7kExhz8/UuYmsrT2B0xpDdLC9cTdssB
	 nUlKmr7msADsb0fiEzxvDngtevETwntC39J3VX/rQIJKLaAJGkEm6mGuOS6UK2LVFbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792718180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2HapOEWexndyRKjnvata6NJwZGi4u1g4sDf1cYEK7hg=;
	b=VMXWJjes0HGJTpsuar4xGj4Ai40n4tJxf2PDH9SIaj58QldRKIwgRTL8kedLmeyKRzRD
	 6B+feImQQgeUnFUF6FTvNj4R6ILo1q1vQVoXj2pNiyFOwmOiWbuWZMQ8ASGMpLkVGoYfz
	 tz9DEgiMQ1pgvDoQgywm5XPaat49e3k4RAB2mQjnhtAnojiOro4hR5xG4ayIvEVxt4TOb
	 WGgJw/aSwl1RlRH4Z99ABAi1uqkiGIN9EB/8XYfiQJHK8pKSblSJYgVPC422sQyapqjgw
	 f5QWOxebFkJp+pKdLWlAdXbaq6XHqmMOGJ61ar1o2c1HI5/Nwtb1kOh9uiepJIZx74w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QWe5zwjq;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85E0606A31A
	for <sashiko@lists.linux.dev>; Fri, 23 Oct 2026 01:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A85E0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QWe5zwjq
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b056d58f2aso3907537b3.2
        for <sashiko@lists.linux.dev>; Thu, 22 Oct 2026 18:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792718179; x=1793322979; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2HapOEWexndyRKjnvata6NJwZGi4u1g4sDf1cYEK7hg=;
        b=QWe5zwjqI3IuzOh22/ojD7rCDR2ehMYe25H3ghjGtp6ju0hdKTrmg9RDvZn1nkRQEw
         2PvC0yzo73M7Z4JttVjXJ/+4f1m7BMqpco2OveOtjeNfri2mgaVV/lPqvFlXDvivjjMd
         cCfRgFAzH1FHFpDNOxrE3TqBLt8tua97y6zojBJ/bymIDVjoSCPX4vFEnIUz0QsLSyuT
         uqdA52RdIIkuk6wmtboG2KQVC/F+hJkcgi6Zs4K2/ZvgHxKEoTrlopPRoZExCmsTLuYD
         8yfX8G+KgyCzmh0OIEPDDQv7x+mcuBDDTdfLEcssD9rhhx5XhVWXdPc/ZYuRmFojjr8N
         GTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792718179; x=1793322979;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2HapOEWexndyRKjnvata6NJwZGi4u1g4sDf1cYEK7hg=;
        b=zZiAGvwMOMDHXpTZbWWXPHghU24zbD+zYHHjQUT8Q2gytBVTZs1yp1m1mmF+ApOzWN
         PJbf5t2OzIRu6ehf6k4siXxWraLVx8pWCba4dnElQlxBoQ5JANljo99iiqxTTT/GHnWP
         RJji2Y5rWoSQ4MvoD0Bes/MBb+qtpdfmxpl0snIoriQ8a6ohJg+7RcPBNJq6qFjYrLbm
         y/z4jTtPgzYtHheGMWUrCJ3mDZL1+Uu8r/fzUCiul3UK8jiGXt8x/WIleOnrw5uue1KS
         q9q+F1w8JZLzdYpqKPlSZLr+ZlQ2nQR6HfmkImzxgxakwF8N8RANiyYGbJFr1tieKzhH
         qoGA==
X-Gm-Message-State: AFq9FYIjS8lxLyrAWnRz9yK0yf/fneTS9/gnHL2xeFS95Dd+RZqn1Jxw
	iWdncEUlKEf3OL1bDxbr7Ke170X4nF/ngNb3OHeVf+9oNomc7Wb8X/VVC87ziA==
X-Gm-Gg: AYBFou0vvByVuABuIhoh45J2fspM88izozC0mUSYG6r4epx6QxgFupMpT4yCTdDcisY
	jFAu+/VeocPvZrfJAMECzCrq7McaDaPh1Pg0iHJBOodCrP1zeRDnquLFzFlqOvgY4BP5Af0kVVX
	qsSNMCXX7eZLoH1TPoRvfon9Q/CH1R0mv3GoAUa+mELde5Nq15qNa90vXIqwzd3S6ZCPUh0efaP
	eqKGHhLmTPw8DXj/YEx4f8HD0YsXJ63yoGQlPcJm4IpssE3+H6GEMdp2bkOU//UD1G6P5gG5kyx
	/ZyK51VQJf9QVuvlrmqf6Y4/Fwx3jUhjYoeZloSg3Jz0Yo+qm9xx6r4BmJeDscFjyWtSKkkPTD1
	0Fe5jyzLLoRjrUEa3W3a888ORMfbavqgCfU8JEH/LVGLuCxtEXkSli7WH9RToa+AeUSIFL5qag0
	HeHI4HE+ybHu5DuACCgXkr/CukGthnUxWOL8sVn+iWjurHUm7PxvQUbXgiIqrfWVoiQ7SqzNCBJ
	tK+m4xEgZbTGLcXLx4BGSeTFnFw5U+CFJ/c59hkypPQTD3ZtbN6o3pvASRjlYj9uWnLPscHqmXI
	e359fNFYdtCU9JjVs/uDjhkriEs=
X-Received: by 2002:a05:690c:91:b0:8b1:1dd8:1d74 with SMTP id 00721157ae682-8b157e37c8fmr5356437b3.65.1792718178486;
        Thu, 22 Oct 2026 18:16:18 -0700 (PDT)
Received: from laptop01 (2045061-002-static.lfytina2.metronetinc.net. [149.154.21.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b156183032sm6552567b3.34.2026.10.22.18.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 18:16:17 -0700 (PDT)
Date: Thu, 22 Oct 2026 21:16:16 -0400
From: Chih-En Lin <shiyn.lin@gmail.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: sashiko@lists.linux.dev, Chris Mason <mason@kernel.org>,
	rawat10@purdue.edu, pfonseca@purdue.edu
Subject: Re: [RFC] new design of review prompts management
Message-ID: <20261023011616.GA6628@laptop01>
References: <20261021234442.136214-1-shiyn.lin@gmail.com>
 <7ia45wyty0ph.fsf@castle.c.googlers.com>
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ia45wyty0ph.fsf@castle.c.googlers.com>

On Thu, Oct 22, 2026 at 07:50:02PM +0000, Roman Gushchin wrote:
> Chih-En Lin <shiyn.lin@gmail.com> writes:
> 
> > Hi all,
> 
> Hello,
>
> Thank you for the proposal!

Hi,

Thanks for the reply!

> Many ideas here resonate with what I was working on/was thinking of
> recently. I'm about to publish a big rework of prompts which separates
> them in auto-generated part and subjective small part for maintainers.

I wonder if that are:

https://lore.kernel.org/sashiko/91e21331-ed6d-4ac0-b237-b01aeadca2d1@app.fastmail.com/
https://github.com/masoncl/review-prompts.git subsystem-build

> It's somewhat close to what you're proposing, but not fully. Let's maybe
> restart this discussion after this?

Sure :-)

> I'm sure there will be a ton of room for further improvements...

We actually have other more ideas (included and not included in [1]) to
improve this type of patch review system, but most of them are based on
the invariant unit. And, since the kernel community has one already, we
are happy to contribute. 

Thanks,
Chih-En Lin

---

[1] https://arxiv.org/abs/2603.24825
