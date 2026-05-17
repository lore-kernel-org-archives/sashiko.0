Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00AE25782A;
	Sun, 17 May 2026 21:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779053148; cv=none; b=EC6Ca0IQkMIWQ75EckCt6s+H45ZlKHiiUomg5veVsWKQe4aNrlsvyhFtpUgjA7d5S0W4jQiFjcadSv7r3ZijAvt1fs4xz5VZxp4ASW95UlOZa/806yWvZxl4kZtGWq/KJpM61x5UFsEiT93xrJ06H0UZk3QS+7TNtn13be0kTok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779053148; c=relaxed/simple;
	bh=HQ84orPF3kpwQr2CgjHzTUFj/GeuAVv6q8tZllwotG8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Q+uiy3IARfi07EyDtKHxIGbBaVx3nRC/RFVFiTJDHJ4DfqBhYPzF+LSD2SRRsmPtX+dImr0zERhQLPuXWO2D7GCDwYI5mtdRkomGShkvHjiSOI6c0W47afGU1z3Qiy+f1G3tzfs6DaJYzp6GUsiciobEhcu+pZloj3P02bOzzkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UBb+g8ta; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UBb+g8ta"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D002C2BCB0;
	Sun, 17 May 2026 21:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779053147;
	bh=HQ84orPF3kpwQr2CgjHzTUFj/GeuAVv6q8tZllwotG8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=UBb+g8taiuoaS5NIna6pU1N4R8ZM9fEzWbDPw0OeDSBCfyowLAa+QgAFf0Xr2RwAC
	 V/UJF2RFYkkbl1cpW0mQip/JezSEFr4ZXLM4TulvKSfcC1/x04piWv3BA740vMfOc7
	 WqzGC4O3V766qd/hFC0I5w5QqWfkcSUq71ep2HurbwKNp5s35+yz0CmLTsmdH82ChG
	 XGWxDjhSgqT3DKrtMTYdRl/J3lggGUK3lv7B2kwME4EuGNrTvz867Co77/16e7jSmP
	 I5JBSXadb/Q3KULfs7xx4EGkl/CwvD6Zovxt3v7pYB24bzmgJsp1MTqwJAb08RRc/m
	 WTKzp3cZaJ/SA==
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 17 May 2026 23:25:43 +0200
Message-Id: <DIL9PFAQQYBE.13POFL6NMQAX6@kernel.org>
Subject: Re: Stop false review statements
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Greg KH"
 <gregkh@linuxfoundation.org>, "Konstantin Ryabitsev" <mricon@kernel.org>,
 "Guenter Roeck" <linux@roeck-us.net>, "Miguel Ojeda" <ojeda@kernel.org>,
 <sashiko-bot@kernel.org>, <sashiko-reviews@lists.linux.dev>,
 <sashiko@lists.linux.dev>, "Linux Kernel Workflows"
 <workflows@vger.kernel.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <kfree@google.com>
To: "Roman Gushchin" <roman.gushchin@linux.dev>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <b5989c0f-90da-42cc-a623-3b60df077848@kernel.org>
 <FA45D2AD-1135-4480-8423-63C0D37FE78D@linux.dev>
 <DIL2P8CHKVZD.2WVQQRN0FM28N@kernel.org>
In-Reply-To: <DIL2P8CHKVZD.2WVQQRN0FM28N@kernel.org>

On Sun May 17, 2026 at 5:56 PM CEST, Danilo Krummrich wrote:
> However, I still have the same concern I raised previously when it comes =
to
> email delivery: I think that when sashiko sends feedback to contributors
> (without Cc'ing the mailing list and all other recipients), it should act=
ively
> ask the contributor to raise things on the list with all other recipients=
,
> reviewers and maintainers before acting on them, such that changes subseq=
uent to
> the first submission on the list are aligned.
>
> Can this be added please?

I'm also happy to send a PR of course.

Thanks,
Danilo
