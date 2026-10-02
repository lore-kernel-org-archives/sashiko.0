Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C964C3AAF54
	for <sashiko@lists.linux.dev>; Fri,  2 Oct 2026 21:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790975920; cv=none; b=TPheIWkPJ7okD8Fj7IUUPIaXudfTS68GwsXnnyFcB4GWFlRkO0T79COyNfwkTs5IMUUptX/nuGsERxhoB+jOY1WnqWaq0gyvATf6qGy8OL/lMXI1bSxviMXXTFnhHsySCOLUaAMIZxmmgJlg5pGWboLttNG4TXXh30WbeaGLoKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790975920; c=relaxed/simple;
	bh=s1+KdSiMyG5ZQQ+lmRic2ATBUAo6MzZJAwFvo20nUns=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=A+ZffT189T1dNnAsX4euPqcuzmQSd8UqWizF4fPU2ly07Pb9OJRvQIoVe8LRmaVEZF9CliMYMbl1fvDxQOd4wO9LnfdxfDSAL6Bs6lp7qSMKr3cphNhOJkAUP/ANx37onzXfOCcIs17vge3kbMziTNF7J479Bt7PH+BinN952hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UAWixl/E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UAWixl/E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2286A1F000FF;
	Fri,  2 Oct 2026 21:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790975919;
	bh=u9+Wu5DXofsWYru0qxmymCK/b8y6GKFPHSyOOt5RdZg=;
	h=Date:From:To:In-Reply-To:References:Subject;
	b=UAWixl/EOZ3XdCO8NdNoKx6Qyz8UsmG4Kw8YDaUX0bzK9GjyqeEAHtGxneinlLrco
	 RJ6/9wbzpyZvRRCm1zzgb34Tq5XeVTMkC5DO5fZM9OyVveUCypU9Yo35y4XLd0Wl+O
	 vyN5R12BILf/FmtKzm+L2M+RCBZuYoF26BzdwK6wlx0Isqsql3JzW13KCJfdXa+LfS
	 Wos9hmQB/s2Abns9kme1umTgtf1UOzcr99QNWilURnuJKM7OA7qvzbwo65Oyk1Y+vk
	 veKmI8nl4K9lnUd7J/+8upuS321+25AQ+hmHEPoXi67zfK+JAJZP6spvbrdbjxCIbz
	 8Vbq5A/f9DMqQ==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3A0D0F40069;
	Fri,  2 Oct 2026 17:18:38 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Fri, 02 Oct 2026 17:18:38 -0400
X-ME-Sender: <xms:rh_AanlaBuV0fQmE-XaIFs-3WtT5KblzK_ELjdvFfVHrkVye0n59lQ>
    <xme:rh_AaloPGGpP229ITLWKYoBg2BRgKDaEYzKzvC8OP8F9lSgqUjPXbkcX8ZzB5neDW
    qGkapVDB3fAxQGQuGa0GOMBXGObEvNstmqkJDIlztnmyqW_HKTvqF1ABg>
X-ME-Proxy-Cause: dmFkZTErmHCy/ojKKe6dIWLgkBuiXnH4hSjPBuL1Sj9L2ojLObQLQCBshLFNjtB6kRSuhD
    dE+7yHokEAUhl4x/rPdluisBV+VNoXznLJv1R8m7Hwvs+e/GLDc13Ss61sYH9FEHRIeJeV
    7KXqUPiJtNNsmEYX7XCkT1kOtZmmpi2yr2G2bWq/aaBzBGMs7/1TZySjH/VPE40Tpqnw49
    JI0VZrZO1UzkD2oP+eg8StVx7zVq0/zL7PZM/71pEahTBHukSu7eJ8GyAeRPy5K2E/K/He
    fXLlKSPbjjHNy+XKN9ELzQPR8kaslyAVLEY3hv74AagJh5hKEjhVug1J3KYelUqQtHwPOc
    MlARc7wxe5h6Yb4yZyTQVXU4o9tC+IB3/fKHeUDRBZ67tuIemAx4+X/UGyv6F/U3goAkgV
    ozsLBo2aj544m2R1tcf27KI6vWm7kHSXMVe6+GXq8Shh79B00nFOujZZ6lMqgzQcPpBdOr
    JiP+Zn2A2zucTu3l+zJQvSzDZgns5oJrXtnJQ+AtMZv4j4EtTBM/qPKI1NRcZM6+bVfl7b
    md2xJqJUWv2XEIavttCkZq5qapexpsFKbJKwybeMpvH16vIUjPY/nIPXW1KmreqCU+nm5P
    42tHswGcZ/vmUF2xNTgTZ9GIRtl+pP6vxb3+7aWUW0v94ekCg0D1TymhZu3A
X-ME-Proxy: <xmx:rh_AatS1dPbA27G2xIvj63Dzqpy-A-84icOCLeudbpfpkvkqWkiXWA>
    <xmx:rh_AagFTayYgUKeIFfbDJXcL2-slGKr1RQprn7l4kjyPvJasDmwtLg>
    <xmx:rh_AaqEMp5Emgg8YSqibTHwwY7PUYCJtzl0kisNy6o-qEoJwyUThgg>
    <xmx:rh_AamQlFes8pewyyUMc7SJWQgMBN684HrmzWMkVdEaR6I6s8Inwug>
    <xmx:rh_AajI60VWN-Xhwy-o5yCsVv3_HeR8-g0nWTUVxMQpFMoHNfAyHw7iz>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1B149780075; Fri,  2 Oct 2026 17:18:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: APmmihJX-AWN
Date: Fri, 02 Oct 2026 14:18:17 -0700
From: "Chuck Lever" <cel@kernel.org>
To: "Chris Mason" <mason@kernel.org>, sashiko@lists.linux.dev,
 "Roman Gushchin" <roman.gushchin@linux.dev>, ihor.solodrai@linux.dev,
 ast@kernel.org, "Jakub Kicinski" <kuba@kernel.org>
Message-Id: <314d038f-4f81-447b-a3e6-0fdfc37d130c@app.fastmail.com>
In-Reply-To: <91e21331-ed6d-4ac0-b237-b01aeadca2d1@app.fastmail.com>
References: <91e21331-ed6d-4ac0-b237-b01aeadca2d1@app.fastmail.com>
Subject: Re: [RFC] reworking the review-prompts subsystem guide
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Fri, Oct 2, 2026, at 12:04 PM, Chris Mason wrote:
> The subsystem-build branch was built with both sonnet-5.5 and opus-5.5. 
>  It's the union of all the things either model got wrong, and the tree 
> is setup so we can add builds for other kernel versions (ex: stable 
> kernel series).
>
> I started down this path convinced that I needed to get the subsystem 
> guides into the kernel git tree.  My idea was this was documentation, 
> and it should land somewhere in the kernel for that reason.  I ended up 
> with something that probably shouldn't be in the tree...different 
> models need different things on top of different kernels, and so I'm 
> trying out the build idea.

One thing that has been wiggling around in the back of my brain is
the review findings delta between the different models. Different
issues are found, different issues are skipped, different false
positives.

I'm sure some of that is unavoidable, but even in the simpler cases,
some models are simply blind to certain types of correctness issues.

Is there any way to compare the benchmark results between the models
(say, between gemini-3.1-pro, gpt-5.6-luna, and claude-sonnet-5) and
prompt one of the more advanced models (eg, gpt-6-astra) to figure out
why the review prompts should have guided these models to disparate
review findings? The goal being to achieve better consistency between
sashiko results for each model.


-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
