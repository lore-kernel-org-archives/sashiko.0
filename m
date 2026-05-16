Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9A937DE81
	for <sashiko@lists.linux.dev>; Sat, 16 May 2026 22:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778968802; cv=none; b=HDm4t/tyOQgVtW+z3LV7otYE0Zm/ytCLlMfx5qNOuSG2vQqwJHXxsSaLOV9bqB3Bv45hgGbzDTFXZC0G8ebv3jGTrWXsntJRLvzrh4z0nRZ7EiyScVMBxhBgQvGjiejNZpnCJgFYCl7N/FoV5tMJr8KSoaI7mSYuauVJ6q7FaEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778968802; c=relaxed/simple;
	bh=evs3SefPe7zmlbL4lVVeXN67p+GYCKzfw1GIeNqfdj0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=jO0C3C1rj/OqlraRG51K2CL8XD/NGVyRdUpmOyRFhmBOSjilDI90s5GavTmVODPUaY5JKOfHzxiqACyWMOLkV06CHaD2hsnyu9b+yEYFfvW54cg6DUxJRwttnLvcGpnFcQJZEGobZpzoAKeeVRZ4tAgqyppB0i8gLGguM7dcWJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xZeIi0Tl; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xZeIi0Tl"
Content-Type: text/plain; charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778968798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=evs3SefPe7zmlbL4lVVeXN67p+GYCKzfw1GIeNqfdj0=;
	b=xZeIi0Tlqux/y6Id/ouEyJDMMhs36HofgMSFjOtY0uH4H4dxN41BM4AnUOW92emR28d267
	Re4XK8X2mj204JOpqLoKGt+8+ruYqMebIs+F6UJY+ZBPcUR4oSeeKJBGOXepyIvyg321Tj
	IKjuJqjLqx9cJaxmy5uNcr7mD2wLgmI=
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: Stop false review statements
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Roman Gushchin <roman.gushchin@linux.dev>
In-Reply-To: <4f3d7f48-5766-425b-91f6-0acdb5554584@kernel.org>
Date: Sat, 16 May 2026 14:59:44 -0700
Cc: debarbos@redhat.com, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Konstantin Ryabitsev <mricon@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, sashiko-bot@kernel.org,
 sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev,
 Linux Kernel Workflows <workflows@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org, kfree@google.com
Message-Id: <07602616-412B-4ED8-95D7-588C0D077EE3@linux.dev>
References: <4f3d7f48-5766-425b-91f6-0acdb5554584@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On May 16, 2026, at 2:33=E2=80=AFPM, Krzysztof Kozlowski <krzk@kernel.org>=
 wrote:
>=20
> I find it opposite: clogging commits with useless information, because
> some arbitrary and completely closed-source tool did analysis means
> nothing to me one year later when I look at the commit in the Git history.=


This is simple not true: Sashiko is fully open-source, under Apache 2.0 lice=
nse
and the code belongs to LF. Yes, the instance behind sashiko.dev is using
Gemini 3.1 Pro LLM, which is not open-source, but it=E2=80=99s not a fundame=
ntal limitation -=20
Sashiko is supporting various LLMs, including open models - it=E2=80=99s jus=
t a practical
choice: to my knowledge the quality of open models is not on par with fronti=
er closed
models and it would require a non-trivial amount of hardware and infrastruct=
ure to run
an open model at the required scale.

Thanks=
