Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD54301717
	for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 04:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776315091; cv=none; b=bM9q3N3RQ1EnFY3bYFNiySaaqlHGsY1pnqUbSK9nzlndbXMxFIHQJ7jz/iFs28s8OygDbPAvpv+pnu8jgYuIc+ZozJD3FduwstkzxJqAc0gqQGz1NMsSjmUejUcU+IoRqig7krRU7QQutx6DZ7786H6AmGONKaOSpy6YaK97FHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776315091; c=relaxed/simple;
	bh=UCajn+9EV3V8fL1geKXufd72TATvD5WPpF9SbkbsQsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LybkHmwVNzsk8gmxDved2s7Hu9cEHMu6EVdNmmLwiuAhT4fG4e+k3ujlyu8C3de9ZGaAimAaY5d9+2DiHFO9lVGhf6P/1cRcFC6KuwyOGClA6JpfeznHrVeIigRdx+q7rz32VxQyqabMAd1aZ0e/cu9Yi+xfd59nT9Uf/VTgPzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FmTlC856; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FmTlC856"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12732165d1eso18858090c88.1
        for <sashiko@lists.linux.dev>; Wed, 15 Apr 2026 21:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776315090; x=1776919890; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3+k2pnRQP7eHbEwO6Gxr96/yH0gBJp4sY3rx6d7V0tU=;
        b=FmTlC856YRjYowSTgacDqfzuxbx5TKPZgoDOYU8fNxKMN7zhk8WRzkKT7A8eA9evZP
         50meRtwzpJ6/9aEo0V80f4498gNtEx7yH+EzMvRW46jPdWou9O2F/VP0y0WCL5FF8uHi
         LI4e4TJfAzprJE79kx/g/PFddbC/PPFtWzwcEmFh/WqUnWRj/K+4O2TEyg1H/dJheiM7
         HRYSjo4DHt38RxKhxYw8vTYc/ywUJ95rFyvVP3VSbuotd0s4u43brUiwf7q99D/VNk4N
         vVTOHD1Hqpu0UsiJItngwx5vyBhLP7mLRhe+HTJjcduA+DRBtklFiiWy0ZzzxmPow52X
         wftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776315090; x=1776919890;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3+k2pnRQP7eHbEwO6Gxr96/yH0gBJp4sY3rx6d7V0tU=;
        b=BllFdbNPDBd3zMrE30rSZTe9s4A3K9/N9LHpWzq53kal5LbPuwPK3eZl2Ly9ejGxCU
         DgFKhtmSKiY222OsKcFMdenTCNRSPSSrPGpGip5JJu/QDQyoHn0OMPzSLpVrwAKQVUi3
         sZ5rTVC4MNsPCeLpP/6IeTnIxGYvaFCdhUyO1quuwl6ajmljcIZElTJ95dvymW4/JLxU
         Vyow7Jmtqd9xrS3rkSkN1KKYH0XVbQe6BGyj+fHho/yzvPAkIx2Z9gY1WpAudXeDtGR3
         Y38zTrKXO4LHgoa+MUpwHpc6LWaVTqT2tlcOMYHclWa6Sc1jA4uSCf0TwW7Tzc83ryYv
         9iaw==
X-Gm-Message-State: AOJu0YyOksG1fhFh+b7S/tA7SiEV/TwiUo2tkpkZqP/ZyD2hoBuFK/CC
	6D9h+OoCu8RGMx4BYqJRCI/m+5rZsbvqHbeYiXGURtuY0XmyMDPtZe05vQJfQQ==
X-Gm-Gg: AeBDieuD8tg8FW4IkagZ/pA/jUVm12N/yU6P3ZkctAodpTePY5LFtiwQF5KhJ5RI0Hz
	5jSLWO1RAP1vkQyTCTU7CcRHbKOD4lB9IK7EGPbB1IY9wsDAlUChTwlWgrXDYiuT07QqNWYVKLG
	VayUPQoF9RTGOnSJ3yxwqFzpsiws/voFx3AeOrEJgZoFxBqs8713i2BVTpF6v7NCUo/9X5Mm4QO
	DFKl1tm3pUqZoqY4GPp2HjiucVYMNkdDgyP7efCeNlCMPyeFbXHa741SGSeOC7afkV5FHa2RGe7
	rQhQG+o12/k8GGEYyqbdZgLG0YcCIW5a7cbJfEO/YUWf0hNXDn4pIe1lONlya1SSrp8gILfT3i1
	x2UXMEYd5POdKtNBZvK2Ze8TU6ELvoXChtV8rzpkzrlx9ygPJXcMjxcwJX3jLpZnBPeqFGVCgKy
	5EFYAncF/zh/grpZ3MhaBVnalAAQzYH7QeYqsvSWqXizIwzMzQQlh9OeiKYI+IpgDi
X-Received: by 2002:a05:7022:6b8d:b0:129:fe5:117e with SMTP id a92af1059eb24-12c34edd87dmr13371418c88.26.1776315089576;
        Wed, 15 Apr 2026 21:51:29 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:d5d3:8a61:7d0b:71c9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8fe4ea2bsm5804115eec.31.2026.04.15.21.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 21:51:28 -0700 (PDT)
Date: Wed, 15 Apr 2026 21:51:26 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jason Xing <kerneljasonxing@gmail.com>, roman.gushchin@linux.dev
Cc: sashiko@lists.linux.dev, bpf@vger.kernel.org
Subject: Re: [PATCH RFC net-next v4 06/14] xsk: support dynamic xmit.more
 control for batch xmit
Message-ID: <aeBqnMc9whoFKOgB@google.com>
References: <20260415082654.21026-7-kerneljasonxing@gmail.com>
 <20260415093539.4A4BFC19424@smtp.kernel.org>
 <CAL+tcoDUa=MpXSEtweT0LvkBEM2hcYnrjn4FK-ntU3WNMbLEWQ@mail.gmail.com>
 <aeBp7gJSEIYRfS2K@google.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aeBp7gJSEIYRfS2K@google.com>

+Roman

On Wed, Apr 15, 2026 at 09:50:10PM -0700, Dmitry Torokhov wrote:
> On Thu, Apr 16, 2026 at 11:43:53AM +0800, Jason Xing wrote:
> > On Wed, Apr 15, 2026 at 5:35 PM <sashiko-bot@kernel.org> wrote:
> > >
> > > Sashiko AI review found 1 potential issue(s):
> > > - [High] Stalled TX queue due to missing hardware doorbell ring on early loop exit
> 
> Does sahshiko bot have reply-to set to "sashiko@lists.linux.dev" by
> chance? And can it be changed? I am subscribed here for discussions and
> news about sashiko itself, not for replies from all different kernel
> subsystems to reviews of their patches...
> 
> Thanks.
> 

-- 
Dmitry
