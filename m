Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DD0359703;
	Sun, 17 May 2026 10:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779012766; cv=none; b=mvolQ2U31M++OdlRhsVLnNYioHjiAlQR+LIl8L7d3nOlqzQUttFJkoc13IyIKNyYBH2dyYLkHky4h4hSPggmEgOY5TT+qkiZs+RUm23DL3OluBFeD15rtFil+HDiA5LpweW+E159arX4pwnMhUVGxe9rrhrehpwUYgbvl/TnTes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779012766; c=relaxed/simple;
	bh=iUYLHQY3uWeVAxMEfj+NOh/d+kYdwRIWjApEH09TTBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q4TehmOSv2N3alTyO/oSNTtlT8aoQJKulLtwHloXEpuCXqYOc8DXNWSaF5hkr64r3YftmnqqDYdyA+i6CSumMXzZ1Myqgcv3Ms2pb78QrfSagCrnQ5FGPYZ1jh64+xoKnnfjVAI6bXxbj5c/0V3cPgUCpzh5HdWGyXITsmddXWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yLLHXpfr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yLLHXpfr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B003BC2BCB0;
	Sun, 17 May 2026 10:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1779012766;
	bh=iUYLHQY3uWeVAxMEfj+NOh/d+kYdwRIWjApEH09TTBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yLLHXpfr/OESwdoqabAlvrm93iSx2OpiPgiTB9Q+OONko5U5elVHx41X0ryIlkZZw
	 1nzyrdexgXUrkYREIx0jr3SxuOslNh2uHGT9F/yqu5y5lbxLEnTnQ6Pdz1E3q2+LWe
	 2qll5oWHQiqGqeUTdPi0qewHup7qdp/l6YH2/uaA=
Date: Sun, 17 May 2026 12:12:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	Krzysztof Kozlowski <krzk@kernel.org>, debarbos@redhat.com,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Konstantin Ryabitsev <mricon@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, sashiko-bot@kernel.org,
	sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev,
	Linux Kernel Workflows <workflows@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	devicetree@vger.kernel.org, kfree@google.com
Subject: Re: Stop false review statements
Message-ID: <2026051758-superbowl-baritone-2705@gregkh>
References: <4f3d7f48-5766-425b-91f6-0acdb5554584@kernel.org>
 <07602616-412B-4ED8-95D7-588C0D077EE3@linux.dev>
 <20260517120556.248852d8@foz.lan>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260517120556.248852d8@foz.lan>

On Sun, May 17, 2026 at 12:05:56PM +0200, Mauro Carvalho Chehab wrote:
> On Sat, 16 May 2026 14:59:44 -0700
> Roman Gushchin <roman.gushchin@linux.dev> wrote:
> 
> > > On May 16, 2026, at 2:33 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > 
> > > I find it opposite: clogging commits with useless information, because
> > > some arbitrary and completely closed-source tool did analysis means
> > > nothing to me one year later when I look at the commit in the Git history.  
> > 
> > This is simple not true: Sashiko is fully open-source, under Apache 2.0 license
> > and the code belongs to LF. 
> 
> > Yes, the instance behind sashiko.dev is using
> > Gemini 3.1 Pro LLM, which is not open-source, but it’s not a fundamental limitation - 
> > Sashiko is supporting various LLMs, including open models - it’s just a practical
> > choice: to my knowledge the quality of open models is not on par with frontier closed
> > models 
> 
> I would very much prefer using an open source LLM, even if not in pair 
> with latest paid models.
> 
> > and it would require a non-trivial amount of hardware and infrastructure to run
> > an open model at the required scale.
> 
> IMHO the best would be to have them running on some infra that would accept
> open source models (*). If there aren't enough resources to have our own
> infra, there are offers out there which allows running open source models
> like https://ollama.com/pricing (I never used myself).
> 
> (*) For instance, Qwen3.6 is brand new and licensed under apache-2.0.
>     Not bad on my tests running it locally.

You can run the tool locally, with whatever model you want, if you want
to.

But for now, let's just take the free credits that Google is willing to
throw at this thing and let it give us reviews IF the maintainer of the
subsystem feels it is something they want to do.  No one is forcing
maintainers to do this.

The netdev, bpf, and drm developers have been doing much the same for a
while now, with who-knows-what model behind the thing.  The model
doesn't matter, we aren't advertising for them, we just want the results
that they can provide us.

thanks,

greg k-h
