Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E414A3D4A
	for <sashiko@lists.linux.dev>; Wed, 30 Sep 2026 20:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790798917; cv=none; b=hs9qlJ3iCaO1eovh1YOboQHekYxtsgFT570fGsxeOzJqJVZMa05P27yqWS+y186Z6a4L0Qy70UwgkcD2IEEU8DrybTe7+9PuHirZ54WZLz7LZhUh/o31yzoF5plnlifHPj2xCzIPkrUJgQuqH+uw2ubWii6Dm6qZc5tfykQ+Td4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790798917; c=relaxed/simple;
	bh=1t4F1CFd6vXqPnF9G2/597U+6Ls9Q1M4wCjtSYKhUEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TKpSscsFD1/TPEc+nmHkz4N33i+lC/LtLt3cssY2dK45rO/e1926onvZ8b0lxLm290SmVU3t4t1E9bRsHXBoe45jFlGSAU42xNjf/B9HWY9lJBRXq8IrYpiPJrSNP131vJWcNVU7ag8XGeuN4mC2/l26UlMiRCBiY7hWbLs7ETo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CwYe+o3r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CwYe+o3r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 144DC1F00899
	for <sashiko@lists.linux.dev>; Wed, 30 Sep 2026 20:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790798916;
	bh=1t4F1CFd6vXqPnF9G2/597U+6Ls9Q1M4wCjtSYKhUEs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CwYe+o3rFZFFAf4DUKHBfVsls42pUpUpTvtzn/nud+LQqLiSo+PSFW6ybGRZv+tEs
	 RiIrb88R5sf6hCq9Mdk/kvChZ1/G3vmoMQmPALRg1JPq+gHUZiFJLTVqelhGYgN14L
	 pzYiQNIt4g/CdqqBzoXEA480PuVW8ZcplmOowWI/izOKKZ5ru+Ez25KXo1bLa7xFvW
	 3gi1apsaokNfWlpK3bTtnTC69cjpKX3+lksQswIxBvnJC7wnejHQ71pxTSGYbGbWTj
	 Xhkg1zwzhAdALOCNRpGOmrzX+GeLEFAYOoNRXZcx9nTQvM8SwxFHrnlJXhsY5XTfQp
	 J1ihzucgHvXqg==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a652e2149aso51042651fa.2
        for <sashiko@lists.linux.dev>; Wed, 30 Sep 2026 13:08:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw0FYYSS9eoFxMHuCfB2ck8rDQaikFCXTJT0ve4JoVzVdCDV5A28x7m5n34m6wT4B/enAGpn6E+@lists.linux.dev
X-Gm-Message-State: AFq9FYKXiO222ymGeoutegNNEN4XXH0cahwFitk2uEYUd8ukijOuAG7/
	LDWbOg7pTvI2tT/oCvTBBHkJhbaSUqa4GlQTAntUsBR91egqT0E9zFQ6pSMWqqx57Rh9uzvQ+s5
	DcJr9xvlGPwMJcdUgoeOPBiFLMgPsyUo=
X-Received: by 2002:a2e:bc1c:0:b0:3a6:6831:6e28 with SMTP id
 38308e7fff4ca-3a77919076dmr8563261fa.6.1790798914467; Wed, 30 Sep 2026
 13:08:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJZ5v0iX2BkHujsyCHEeLQ44d-ZDvQ_dcwhrhOQ=u-5+6sZd-g@mail.gmail.com>
 <7ia4pkxz13x0.fsf@castle.c.googlers.com>
In-Reply-To: <7ia4pkxz13x0.fsf@castle.c.googlers.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 30 Sep 2026 22:06:49 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0isdifKyigi5E4qk_GQSNNRymZHN5HwrkdeGzUeessM4A@mail.gmail.com>
X-Gm-Features: AclHuK8WbNEmdwcQHBGQtByujsUI7tmdqS7Ds6S7gYtq1Giq_veLapgwFsswYG0
Message-ID: <CAJZ5v0isdifKyigi5E4qk_GQSNNRymZHN5HwrkdeGzUeessM4A@mail.gmail.com>
Subject: Re: Tracking request for linux-pm and linux-acpi
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, sashiko@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 10:42=E2=80=AFAM Roman Gushchin
<roman.gushchin@linux.dev> wrote:
>
> "Rafael J. Wysocki (Intel)" <rafael@kernel.org> writes:
>
> > Hi,
> >
> > I would like Sashiko to track the linux-pm@vger.kernel.org and
> > linux-acpi@vger.kernel.org mailing lists that are both archived on
> > Lore.
>
> Hi Rafael!
>
> Added.

Thank you!
