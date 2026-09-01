Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9574933D6E6
	for <sashiko@lists.linux.dev>; Tue,  1 Sep 2026 00:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788224077; cv=none; b=NuYDNWC2diA2HYUImA48Lj4il/aIbhqLqMWrnwmUcuN5688YMzyusWuRaE27BhlRPTHQflbflmqps8j0WTuJVYEJy1/2Cit4/k898w5iJ9HxgSPnd7dAuMlnmMlh9jZodn+zS2ry2Ep0jNyUkfTYHvNYy7WSreopKi7InvDmqJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788224077; c=relaxed/simple;
	bh=luaZBxYP9CFbhKRXh9obTxwVDrikdV9ilB0v8ZcnUKs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=b16vzJbpsdOgWiKwuuf5PTrlTtneI9AF1/e0HzJpplr1bPi5mvDJHjfDvJxlOIQnLSxwwpMPyEkiyBOjXp5iOdJAuRDjl5XyOxZlQfZXNNvM7c4KyuNPxwV9wbzN/2UAZ8qeTTDioonRihCp7O2iWQB0yrAXTlOTFwGEvByO7Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XPQdSnMz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XPQdSnMz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE1F1F000E9;
	Tue,  1 Sep 2026 00:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788224076;
	bh=m5uDNeskKfSvfH1M/k6rgMexv3cruDbMvHxz7YUe7U4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=XPQdSnMz8LsJR1tBL8OUuX+1W6MpYj6HVFEl6is9CmqjWE2gjlZQSDcyOyLPrsZE6
	 +cG3PFdgFNeXyvfqiqbKtKXVezo2vSypp8dVvA9igwfjxHqwWzI8QoxHaabS6On/uN
	 SwL8a9dWMtq1+t953rTYjAbAuCKRkLFoHD0Vt9e+rl0InovoUN7AI9J5jaldClmPs3
	 xiCGf6OL97qYfoGywbasJWlHPdVSmFQmkHnvoLd/6SmSonNpZ6SOx/RcxyHJb20kFp
	 5jyUVJkxRo2cxRCV0Dcl60AQ/cMq2YR8Q0yXvVTP6oKgqionnZVdo4D+08SF+cr3qG
	 fdVqWcHF1vhhg==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 058ABF40066;
	Mon, 31 Aug 2026 20:54:35 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Mon, 31 Aug 2026 20:54:35 -0400
X-ME-Sender: <xms:SiKWavC_fE5pVhIFWW605tUmSoXvStlMlic7bJnYnF7KNjUilRa0bg>
    <xme:SiKWagUtXmyeOqYzNntaeB7_AEpRb1I1ApAa9u2hrn7nkkgEN0r_UR5fZ9-T3aExY
    Nrb97QnuXRKelh1JUJ9SP4NqGIz7DF4bBzR1dQuYrOzXuENqadeKME5>
X-ME-Proxy-Cause: dmFkZTFVzS1gPHLcBjD2Qh7i66AeiOKQzrH0/SGIFRmqoCDMnHyPVhKyG+Wf1gwOaa+VR7
    e5SO4xmArm7/r18hgheVZnjy7jDCQjnGQFjkyL47D9zGu7Yyju9C+YPnpYj6FQpl4sibLh
    eA6oLC1chjXHtlqbUeMeEuUfG3c9kgyMXbzm9YrVahp79jSh1yPUz/KMzKyisjtMifPchn
    ApL9PjVKtS9rx9/z8fJ1GX1VfZc+aMVR2CChkpLEpivT1PXsSYsSkiiuQTrSbK4bLL/7Uo
    Xscg6ANHpMXx/CeyprlPrb3Rhl/ivgkPeahhRq+eIdXUpIXLumHs0ZklcjGr1uYM+fphNz
    iRUs4iTzo9ykvfANYLrJw1WlixSxyReLwDS7al/C18ADao47aylM//Q37BP5cZ/9LtnpSr
    52lJh+ppVP3f5FOVfiJwGWk87MdNcYcpGfva/y0xLJQs/B7nGuL9gmRaF+gnQBgbtQgsju
    gt5lWVkxr5NhTaD5bZDIoUZK2NvW6CZBdSphb0w+RMT15XiQ30Qk3cemDs3pdMzOpk5kPW
    BEQAWt3dP2fhAJ1ur2oLY/CDE9SlxJEdIjyZgosvMdCF9J3B5Q/D2jxwirkBRkeNlsmcZY
    v9KTLfMwqn0giftawQZ25mVUwsfTU2seu40MVWVrvDclFnA06AoEnV9EtwZw
X-ME-Proxy: <xmx:SiKWahsDN9sAvQQi8JfU4Cyn_fj4aITQfdzTwivjl5B9qMX9HWj9sg>
    <xmx:SyKWaobd9DGX4pKq25gZyY45g5eCQsUH5eUaU4mjdl73ebzfd6jvTA>
    <xmx:SyKWasUzl5kVfE888XHUzdjXCW8eU_pkeXKcBMkR3BaYlDtGRR4N1w>
    <xmx:SyKWak70F2vCkL53PwqfD3XZaTX1ZvuYBsdt-HIUw1MaFVMD_FvUQA>
    <xmx:SyKWavjLLdYm2CjDWUKpG3FxcDv6_fAV6EUefr4gyBOSll_ZpBfGaftU>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E2B067811F0; Mon, 31 Aug 2026 20:54:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AQhxyBnQh7pN
Date: Mon, 31 Aug 2026 20:54:18 -0400
From: "Chuck Lever" <cel@kernel.org>
To: "Roman Gushchin" <roman.gushchin@linux.dev>
Cc: sashiko@lists.linux.dev
Message-Id: <190e6da8-fc22-4a28-8948-58fdf3ea0098@app.fastmail.com>
In-Reply-To: <7ia45x0q80zx.fsf@castle.c.googlers.com>
References: <e0a5f515-0292-443a-a0a9-1b505ed6e36b@app.fastmail.com>
 <7ia45x0q80zx.fsf@castle.c.googlers.com>
Subject: Re: Ingestion of patches to linux-nfs@vger.kernel.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Aug 31, 2026, at 4:54 PM, Roman Gushchin wrote:
> "Chuck Lever" <cel@kernel.org> writes:
>
>> Hi -
>>
>> I've noticed since August 27, sashiko.dev is not ingesting and
>> reviewing mail from linux-nfs@vger.kernel.org.
>
> Hi Chuck,
>
> Thank you for the report, I fixed it, should be ok now.
> Please, let me know if it's still a problem.

Looks like you shook it loose. Working now, thanks!

-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
