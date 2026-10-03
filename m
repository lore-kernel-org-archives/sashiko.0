Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBC43A1696;
	Sat,  3 Oct 2026 18:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050989; cv=none; b=qBveR4hULkJmcgCOvpxkJr3uLTsaIemQsMtO9JAiT7Y4OZtC2w1f+Yv5ixnYFvxcdnFY1MakT5uH1Jq+GPzWMNuRllFLrEc1F6LryPrYocnaVlObyRQxnjPdtTTYVJ/tfi1YarFaFS/9jqYCOdrSHA91fN3izBeXYvUQ6sMfNwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050989; c=relaxed/simple;
	bh=/qmt3CNEJWwyIuoRZ23CiDjaZq0YKPxlrTakCYLnLEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UhJDSeMi9OBtLeO+Ms/PtARTIq1v0G/pEpOOHS2VYjyvJenbdPZZfy92FJGEvO7n3iy6Kyjn9fgMKmklmsvbTAZA4MHOQQvShYSkxpPNMD2djEqb5fvPpDzlfE8xXqEyOvPSsJTwT49vIlaIz6E4SFkjA6aqSv2ohrGkI4E2OPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UBaG3IYV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UBaG3IYV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27AAA1F0089B;
	Sat,  3 Oct 2026 18:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791050986;
	bh=tuM+fGebDz5NPQNM5t/o9O9Do0PZlyIBvNuHcCv4Hok=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UBaG3IYVU9lQtptjcOhmTHodatpnY+gNVf5hLNI2oEqUUeiIdYfkkrBrHkpfhyUX5
	 lEW4XdrW9pmtsAbII4GD3oora1Y5JELIsIEzgdNoAuzy/Ks80YFaoU/PSFVo5q1lFA
	 05/q5RxAwBsrm8yvUQ4QpIEDzPd0eXeBJtyVlHO9l7tZ0fWSL5joh4LKIFBw+VstlJ
	 BwrJMAZ6RQ4vXkPSvvB7UfErNMive01uvsNkbbgLnaUsgBwSNpptwmVMbkhbr3kYtv
	 jatMSNDnRUVbNW+ZE+Ihf6s99K0M5TB5ws0dXa4B+/CIL1Sz8T2NQHXh4ByBsTpcFx
	 D1eSTcLQyb1+Q==
From: SJ Park <sj@kernel.org>
To: SJ Park <sj@kernel.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	sashiko <sashiko@lists.linux.dev>,
	LKML <linux-kernel@vger.kernel.org>,
	Chris Mason <mason@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: sashiko & pre-existing bugs
Date: Sat,  3 Oct 2026 11:09:41 -0700
Message-ID: <20261003180941.35452-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003172449.33985-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat,  3 Oct 2026 10:24:49 -0700 SJ Park <sj@kernel.org> wrote:

> Hello Roman and Sashiko team,
> 
> On Thu, 17 Sep 2026 23:30:23 +0000 Roman Gushchin <roman.gushchin@linux.dev> wrote:
> 
> > Hello,
> > 
> > as some of you might notice, a couple of days ago sashiko stopped to
> > report preexisting bugs together with not-yet-introduced new issues.
> > Instead, it started putting them into the database. All M: and R: in the
> > current MAINTAINERS file have full access to corresponding bugs.
> > 
> > There is a new "Bugs" button in the top right corner which is the access
> > to the database. You don't need to create an account, invent a password,
> > etc. It's all stateless.
> 
> I asked it to send the sign-in link for sj@kernel.org.  But I don't receive the
> link.  I waited more than 10 minutes and checked spam folder, but nothing is
> found.  The last time I tried to sign in was a couple of weeks ago, and it
> worked at that time.  I wonder if this is also related with my previously
> reported issue [1].

Maybe it was a temporal issue, or something is just fixed.  I tried sign-in
again, and this time I was able to get the sign-in link within a minute.

> 
> Could you please take a look when you get a chance?

So, please ignore the above request.

> 
> [1] https://lore.kernel.org/20261003171045.33520-1-sj@kernel.org

Thank you again for making Sashiko always great!


Thanks,
SJ

[...]
