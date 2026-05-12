Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908B83C8C44
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 15:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778601428; cv=pass; b=XBwFx1dHtp9TW33/F3CmNylcglpLZd9uAlZd2ZFhoHub0PM0y72IqkMrvD7NsrnexxRXBYf1bCLoo0Z0WUUuNU/kdgCsn9WciGaKwpnst426O6s8sMvSxw+ZAU0RmcsLQVLYHqUi9Ks3COXNGCHB0npYUpyKMXuWal63mXSCFGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778601428; c=relaxed/simple;
	bh=OiUDnYlleRj1MNp6lxh/sO5JdhE2TPPANeiz60ilAog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d6NJrm86Q+SwSUSddwtu1G9z8E5+WGm2XpQDd42l9xQgPHO+QFIBZ/in0kf0Ho6nRcelwP/zDlJWXHpur620NwyVrRtR6rzvi8w2Ta+Fl+9/kNnA+w7XhjCLWvdpyu+HFRWLNEahV6PAOYddFbWMI4ssknuScWpG9wTQ9OAbIy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2tEe0kd; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2tEe0kd"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso10414521eec.0
        for <sashiko@lists.linux.dev>; Tue, 12 May 2026 08:57:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778601427; cv=none;
        d=google.com; s=arc-20240605;
        b=DvKifPlUiUQveFUZ9+Ur3pCh4WA4yv94/prSajF/cuM9NOHBqdVyHCe1t04Y5GPV4Y
         BX3heJf+S+7Dc9W4Zl+RKwZMsy9KGzFBpveimAYPcFqPr9o6XfQ7xesc4b7oZgqPM2xs
         yOGQFo0dSV0fsBTxpeECtHyUjOeDQ9OqHSgr+tswFuSM8yl1C6+Ym+DzzIjuysRlDeZ7
         6ishd18JhFqzIMxAiJtOG4yUdWtTZhbmb9hYnmr+HIoSpLrPifQfSbeY+iD7KRBDsXgh
         5r8MfKPIzRoL7RJNIwSCGIbUsLBhyPLGml8j8o4b1pcbEODGO7Dmai+jV4bXklXw7u2C
         MN/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NnpQQY7Y/t+b3M0jToCnMX8MShNq6yNuCOdG7w4CVro=;
        fh=jwOSEAHLG8b2VNV0QpzkD8FIQ/F+Bo2rr6OoXatxGXs=;
        b=hZ7UQGiaWJfFIqE95U9KbOE7uVgAIxZ6qCGIw3DcTgWc2Vgrb1mqyQzeIc8dX4K8ug
         18TTpBfqC+UmMwEJW1q4qVhutFcdV4yIB8YehxLgIAF6TQ4l3vOw2m98qCv2auT4ebW6
         B5vfcAKFozjuulU7pcs5I/KXoxckJwZ+m85nviCVjzlR6nOChZtkGPJVBch7H5ANmR99
         j79Q4YAwl/u4B3gacnvIkz5xibU5NdlcS4Qh1mkzfkk4MiMMCMEV+9bqiy3ltc1ta848
         XgRInEVdDM6qAn/iuDnCP7J5C8+PXacEHE+PQuT0We+lKKYQOjCI+gfC4JCfE3KILBBq
         9l9g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778601427; x=1779206227; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NnpQQY7Y/t+b3M0jToCnMX8MShNq6yNuCOdG7w4CVro=;
        b=g2tEe0kdm7Q/EL5EtBVKl63DwqZIMPS74KUIN5sS5Yq5Xjwby6zRXCq4II6Pzdup9n
         FuTqwNwod2ASKcb55eywA5fjJmMGTqgT/O1luOcj//4AM1w3zrLcW8SMrrw3uAChWtQ/
         19TEdi6OrjRg1Z5VXDiX4VSuODw3EuA2tCT04DqCvrf6dwE9xYJn9r77kcu8owTH2Dkv
         REYQCJx/8aMzpcrGMsqopSpQg38lADTfIjCFVnhXBmMILtHwoXXKJW7oXxUqkk/fXfpw
         pBCnX5RvmugbfWQeqXUK8rXK7LmYP0MWJz6Iq6/yTjOrtQfOW1YUsaDkQtjRQJd3lNCo
         mp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778601427; x=1779206227;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnpQQY7Y/t+b3M0jToCnMX8MShNq6yNuCOdG7w4CVro=;
        b=QI/DsX9gTG3nnx2YIlfzy5raadU9FpWt4O+eB7adCAnPimNXkFviHmzI5OMHYiH6H0
         ckFeFGncsaA55zN2R03/BuAThnAyvv+FWsCpGAPCOUDmIKiAwEuRQQUW8TpAhMHVNQeu
         FHmaF4k1Co4/6EVs3iSTRUGWgjItEQB8mzO9MP4shpZsPWZ/n+lCYC9DSJsEKPlThGne
         p2oLgbS6y9AQMKJxZhx7aIIAJ0xor+LW60qh8MiXXu9Q50F/hj67N3EMJjJbHzD2gcN5
         bTAD3QiTmZKYwvZSgJwhNEKA6Ilux1vixL773hO/dPGXbXg5uLHUa8JIcU2GiMo/9IoC
         ntdQ==
X-Gm-Message-State: AOJu0YzLcdLLNaI4RyJyYEHHemD8Tydi5pfeHIty8UsqbCkcfZRB0R82
	sPfZuvDTQ1pGCYXgmhqHUtbyjNnicgXIqfq/sOJj9RB3nrwMV+9pVGKdjxgzGjKqCnbyWh3PX3D
	qbi5kwPIZ03Abuw+ym3E5LYmKOIuVVcU=
X-Gm-Gg: Acq92OE0LTULorpIbw22aBNLi4xPg1mb48nTTsu/VeYfzDb0FIXS+5t3lWcfMD7i7Hp
	x8oWb3Eigq0WI99RYQmsiBb+VsJ9Mywn90Ww6nN6DKUuA5iByVJRGGgAJq0wmzSg29PzUJ+nqYz
	/QhLvC4mdlDnCzNgTBnuCLu/xZdevB74bmLgGoEQlqESWxe4Kc4l1ddVmsMxu+N5l1ApTtG4nqa
	d97klKwgcmWE3rnV/CTm+/hJ8i9ITM6z/6pj0wvG+eb9TQSGhbryPwe2gaFs9dG2nWraurBLExE
	xSbCflvziu8/XUPAw6g8n6D4VIZg0VuyAHse8wA=
X-Received: by 2002:a05:7300:724b:b0:2e2:a64b:63b5 with SMTP id
 5a478bee46e88-2fb4b733e77mr7141702eec.18.1778601426596; Tue, 12 May 2026
 08:57:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFGhKbx53f0Y4XPpTcpqaYbXVd+Gu7c8L1pWKnEfVLxG-Aktcg@mail.gmail.com>
 <87tssd51c0.fsf@linux.dev>
In-Reply-To: <87tssd51c0.fsf@linux.dev>
From: Charlemagne Lasse <charlemagnelasse@gmail.com>
Date: Tue, 12 May 2026 17:56:55 +0200
X-Gm-Features: AVHnY4LR-nRW9f3wGkQ4jep6jcICQ-Axnp3IKvfp6UNecTmq6O8TrR5GVrNV96s
Message-ID: <CAFGhKbzB3UmuHsh_7i8p42Csd3kKx0bgtf0GF-7emxo=vu_jMw@mail.gmail.com>
Subject: Re: Sashiko.dev webview not getting updated
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: sashiko@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> Thank you for the report. It's a known issue, actually caused by some
> issues with the LLM provider, nothing sashiko-specific. We're working on
> fixing it.

Ah, I misinterpreted the problem. I thought it was a frontend display
problem because I saw no actual change on the page. I would have only
interpreted something like the current state ("nothing finishes the
review anymore and the frontend shows more and more pending patches")
as an LLM provider problem. It is always hard to tell  from the
outside - but this is often the case when only observing from a
distance :)

Thanks for all your work. And I wish you good luck with the LLM
provider problem.
