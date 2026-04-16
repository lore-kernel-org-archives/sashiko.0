Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660DA322B7D
	for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 18:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776362957; cv=none; b=Oe3/Mo6qwjZ3freqXa6V7fWkmd+7EVKDOYqAxPuhyNf4u/5iRsDuvK0BVRG8jrkfWIq5zAT0cjb2XBFdDbhQh/Jg+0dOgwqBqHLH01ii9UhizTSzN+opx/eWlEu5RRHDQcQd10kVDpfjfeag4U2bEtgbQZqXPbVzxthdpBCMFSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776362957; c=relaxed/simple;
	bh=8LLcBZxKbesEH65s0Q9hKBPrL8LJIDUga5qB2PH/PHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pV3vgQiS4ZRF90uIdyyMCFjZDylMAOGqrLQ9D6DtOlyXOoVuBvpGUs3lvHMyVdL9hFt/d6hmRG9p6Yi1CoC2B8sAgnwOIuxoUEtNqa7iREIm5qTZi+5nH1l9a1Od1WVzY136h4/uo/Xs15h/vAyFnQwqctEiUBzVWAJmztlzF3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPk9sLu6; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPk9sLu6"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12c555f886dso556299c88.0
        for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 11:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776362955; x=1776967755; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZye2vplKUU5LS4z/qlGroyCrHO1/xWXM8eiS2rVWx8=;
        b=JPk9sLu6BoG+Hj2Jzds0nYns6wBVBo40er7n1EsVnb3LtdZWC4zWE9dzqqwWUOzjCy
         B39lISPjkTSS9LyXq+zoKzc6tqKFy9Ge9LUgJymeF0E5+fKbNlDMhQu0URb7bJPO+Sd2
         dFHOXMRImysJAvFleuHMbjmKpD3R25OkpkUWLX+pA9ZV5BlVIx+/iS/l8N6RErodQpRB
         0X3Plwc9cV68DeEZ7wlQIhpx2EdA6yq8s2N4TeKIxcyrrk7kXtL4sf67cZIjxjTgjKap
         joo1mluf8ICbEIfeBoln0cct1dFdfKhz+y9hYQkP25TbD4W9kxm55MIK9AfChbG6PKWg
         6HXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776362955; x=1776967755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HZye2vplKUU5LS4z/qlGroyCrHO1/xWXM8eiS2rVWx8=;
        b=AE46QR2o7ymkBEHM9O7AJ4E2gTNoGbAeuts2KGYe687RkL3pLqihfRzNgCmDUAMBkH
         fdtDf9Yc413dorprRz8fnq2119PhiQrTqvDg49JOrtQOBouIrF6Fw1HSz1Yx1lDeLS3u
         k+DddHnl2ehZYsfRNVt3COCsuU5hbZy6mdb0v9Vp8lC5cIvZFzYWPg1pJiVrHwGbHM2U
         1DW6kiTZ4q1NwyDJtBr9PMrgtrvEssNS7n2jff02agc6CMCnGHOnF6TaFcoWENdKBugy
         GMN7xGrVAXzxCJN7ngNpHfLVKsHw4nSmTKjcrB0MKIqRQYjlMPb4iIQ2B54lheWuQQrq
         6EMA==
X-Forwarded-Encrypted: i=1; AFNElJ8zUb3QU/BNaxOA024vUgbPV25lqakIRfkFsVOzM2HUqHhteCUSQA6B2vyanhySNhR/4cknV3mg@lists.linux.dev
X-Gm-Message-State: AOJu0YzpQoDwZxea0Kh4L9d5RK6mkquJK0vpiFeyHHvGeyrK5fv7dK+0
	DPOCJpL2n1++0qj6Q0J7MHO7P7HHVN8H824zQMeE5XzvC4XzeLace4cx
X-Gm-Gg: AeBDietvtCyT+AV48t9Z6tPeMxHkYn/58/WswxXJwXPRuWzyGgUkeTE2nxptBQmgvyI
	H32q3CJCmsOco7Ff9fj1xjuBRXA+AKM0FchNG4NPGK6Jn4rnn7iA7B9i11MD7ene0zjrO4w7SNB
	xZHovupLLIACZf5omn9cZkJSObLCEbFa1szpLNt0PDrYzjSRKpDlifwSwK5C6gmXiRWuIWBeTTN
	KK+aNyMc+WLYoF1jvZQie1MZRFqO+2lY5CZHm5LSATpFYe4Eo8cehbJHDAm3mbz8xiEyZMspWXq
	nD0j1k7RnNItLwH6LRfP++sPgRtW7tqU0Iee00IKyaJtpDLeHp4nqlx5Rbda2PaGak/RBqVopTp
	pu1dzn3MPuWE2PsfiuD+Leq67cX4D/TX3e8LR7zDaQWHmXfLJ/J8xlOezwjd4WaHYOioIg/r7o6
	QDR7XfMJyycDzDrSGkpOV2qHYCHEUN/EY+J66+4qdjfKlxe6w=
X-Received: by 2002:a05:7022:438d:b0:119:e56b:c75b with SMTP id a92af1059eb24-12c7287baeemr96092c88.32.1776362955194;
        Thu, 16 Apr 2026 11:09:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c641d18a7sm3423039c88.0.2026.04.16.11.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 11:09:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 16 Apr 2026 11:09:12 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, sashiko@lists.linux.dev,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: add max20830
Message-ID: <cb47e2b5-5da8-472f-9c4e-7414b6cddf84@roeck-us.net>
References: <20260414-dev_max20830-v1-1-210d3f82c571@analog.com>
 <20260414043841.1ED2AC19425@smtp.kernel.org>
 <20260416-winged-ivory-mandrill-f1e8b3@quoll>
 <7ia4mrz2ssrz.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ia4mrz2ssrz.fsf@castle.c.googlers.com>

On Thu, Apr 16, 2026 at 05:45:52PM +0000, Roman Gushchin wrote:
> Krzysztof Kozlowski <krzk@kernel.org> writes:
> 
> > On Tue, Apr 14, 2026 at 04:38:40AM +0000, sashiko-bot@kernel.org wrote:
> >> Sashiko AI review found 3 potential issue(s):
> >> - [Medium] Incomplete Regulator Schema
> >> - [Medium] Missing Hardware Capability (Interrupts)
> >> - [Low] Devicetree Best Practices Violation (Node Name)
> >> --
> >> 
> >> commit 20a4d8dcd2f3344ac22d7d2e974bae1ef57874ed
> >> Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> >> 
> >> dt-bindings: hwmon: pmbus: add max20830
> >> 
> >> This commit adds device tree documentation for the MAX20830 step-down DC-DC
> >> switching regulator with PMBus interface. It allows monitoring of voltage,
> >> current, and temperature.
> >
> > Sashiko devs,
> > Can we drop such comments? They are useless - we know what the commit is
> > doing, no point for reviewing tool to say it again.
> 
> It's the format which originated from initial Chris Mason's prompts
> and as *I understand* it's purpose was to make sure the llm is reviewing
> the right patch and more or less understands it. Idk if we still need
> this, but at least some find it useful: e.g.
> https://github.com/sashiko-dev/sashiko/issues/90 .
> 
> I'm planning to do it configurable in UI, but for emails I can
> only make it configurable on per-subsystem basis.
> If there is a consensus amongst hwmon maintainers, I'm happy to remove
> it for hwmon (in several days).

I find it useful. Please don't take it out. Maybe there is a means to drop
it from devicetree patches if that is what devicetree maintainers want. Fine
with me to drop it for those, or to drop devicetree feedback entirely if
that is what devicetree maintainers want and if it is possible to separate
devicetree patches submitted as part of a hwmon series from the actual code
patches.

Thanks,
Guenter

> 
> >
> > Please send only useful feedback to mailing list, otherwise this will be
> > just noise and going to be ignored.
> 
> Agree, but there are many sometimes conflicting opinions on what's
> useful and what's not. So I'm trying to make it as flexible and
> configurable as possible.
> 
> Thanks
> 
