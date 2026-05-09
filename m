Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034BC2F49F6
	for <sashiko@lists.linux.dev>; Sat,  9 May 2026 17:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778346558; cv=none; b=ZuPu95zaGTprzojajOOmAH+9/m21ehIx6JATKiD0+7eiUnOsnWpz94UEr3Fr4CStXm2vLaoDjw2BuidFDpv4Ub7kHaOpE0iAhV5PY2YeeP8Sly5X8Kh2eqDzlz8wMzQ/m++VQ+tGb1U1vx6vTSUVQtrD8CwXf+g4IMx6Sk1f8Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778346558; c=relaxed/simple;
	bh=aydzMJxboQYjq4+DyPvIdNpHPvziBZTyKnP98v6CeXw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=iEMJSxaVpAzDXqxtobwLmJv27iC882EfEe89/XKCUWK1tHdz5lwmUgFlfiX0ai+0+Z48KYKT/b5cVRADLdWQQkcbERTNBXUYy6qw+GuoTE+LIhfua+cx/C1YQnUt2Sih9zeV1n7IJIMLoQsXpktdprm9KwhbhDWPVnqzCQdClXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bXQu6a5p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bXQu6a5p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82E01C2BCB2
	for <sashiko@lists.linux.dev>; Sat,  9 May 2026 17:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778346557;
	bh=aydzMJxboQYjq4+DyPvIdNpHPvziBZTyKnP98v6CeXw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=bXQu6a5pg5i6kKOiNmLTHozb6qabUarVVeZtmLkdyXwwvNsxMv/9caBoDK8s+ajLn
	 llEDlk/rTMtk7siQ7GjwQHnWiCN8Cbvo56003n3ze3mRx4jpUL+t+TjgDcDX0F2pnX
	 J8k2Oq9oswAqWmLO2Go0dwOF8+c4XuknVqNFNWNun27hUZBg67bJ5gEx36GmZuTzOL
	 RMiZyvP9El8psB/+K4OKDW2Nji2URtQDAWWMvtmMRX9gJmMVqp9ltc1G7ul/21jI6E
	 eemIkwoSOZ1HqPqZulfM1qJxgsAtf80+rW6U1+UifOuCPv8ZMVygB7oL91g+RiF7Vp
	 Ywa23aJBRLLww==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 874D0F40080;
	Sat,  9 May 2026 13:09:16 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-04.internal (MEProxy); Sat, 09 May 2026 13:09:16 -0400
X-ME-Sender: <xms:PGr_aUOthYmC8A6RWcVdBBQQdckhiDI32zo30fM55UXL4Kq7roNGWg>
    <xme:PGr_aVzL51YGUI43vmcCu7EX0QwZFGG6TSNkO63FAQunKWe088uBOA1XJm-RPjeIb
    A5RTLFfoJq9U21ChQUL4pIbB39GD8gedn7KzypYRV-WHDE_SuHAbJLE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudefjeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnhgvlhdrohhrgheqnecuggftrfgrth
    htvghrnhepjeejffetteefteekieejudeguedvgfeffeeitdduieekgeegfeekhfduhfel
    hfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdekhedujedtvdeg
    qddvkeejtddtvdeigedqrghrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrdguvg
    dpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptgho
    nhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepshgrshhhihhkoheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhope
    guvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:PGr_aWb1L66282Sgg2ci13sgtBZnOOLPNYfzC8PNMEnqeCTL1zFTQw>
    <xmx:PGr_aSV66fIiVVETk_yN1oQyulR_GipuDnV2IKrqAC4cU8o-EnjFag>
    <xmx:PGr_aciHezfKRt9GtnkZn_1s4erP522qHBDMbyGWRyZvTPVAwkp_4g>
    <xmx:PGr_aYvBZy-N-uK030DOWg27r5lTkjYlfv7JGUN4LTPidvrNMYn7Hw>
    <xmx:PGr_ad6k96UlMg2VkKaSm3mSCppn2sUkEmbZcluHtd0YrszLDjQ8nwWy>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 141391060065; Sat,  9 May 2026 13:09:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Ap_j1q_rtJ4F
Date: Sat, 09 May 2026 19:08:55 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: sashiko@lists.linux.dev
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org,
 "Rob Herring" <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
Message-Id: <936b128b-37cf-4674-82dd-fb5708b2e1e6@app.fastmail.com>
In-Reply-To: <20260508213256.45BE6C2BCB0@smtp.kernel.org>
References: <20260507212451.3333185-3-arnd@kernel.org>
 <20260508213256.45BE6C2BCB0@smtp.kernel.org>
Subject: Re: [PATCH 2/3] [v5 net-next] p54spi: convert to devicetree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, May 8, 2026, at 23:32, sashiko-bot@kernel.org wrote:
>> -static int p54spi_gpio_irq = 87;
>> -module_param(p54spi_gpio_irq, int, 0444);
>> -MODULE_PARM_DESC(p54spi_gpio_irq, "gpio number for irq line");
>> -
>>  static void p54spi_spi_read(struct p54s_priv *priv, u8 address,
>>  			      void *buf, size_t len)
>>  {
>
> This problem wasn't introduced by this patch, but I noticed a pre-existing
> issue in the context here. Does the p54spi_spi_read() function perform an SPI
> transfer using a stack-allocated buffer?
>
> Looking at p54spi_spi_read(), the addr variable is allocated on the stack and
> passed as a transfer buffer to spi_sync(). The SPI framework maps transfer
> buffers for DMA. Passing a stack-allocated buffer is illegal, particularly with
> CONFIG_VMAP_STACK enabled, because stack memory resides in vmalloc space and
> cannot be safely DMA-mapped.
>
> Could this cause memory corruption or a kernel panic during the transfer?

In theory it could, as passing long buffers on stack is not
allowed for SPI drivers. In practice this seems to work because
all SPI drivers that perform DMA check for short transfers and
fall back to MMIO if possible. In this case, the spi-omap2-mcspi
driver uses DMA_MIN_BYTES=160, while the on-stack transfers are
only two or four bytes and will always be done through MMIO.

The driver has other flaws that I'm not trying to address either.

>> -
>> -	ret = request_irq(gpio_to_irq(p54spi_gpio_irq),
>> -			  p54spi_interrupt, IRQF_NO_AUTOEN, "p54spi",
>> -			  priv->spi);
>> +	ret = request_irq(spi->irq, p54spi_interrupt, IRQF_NO_AUTOEN, "p54spi", priv->spi);
>
> Is there missing validation for spi->irq before calling request_irq()?
>
> If the device tree node lacks an interrupts property, the SPI core may set
> spi->irq to 0 or a negative error code.
>
> Passing this directly to request_irq() without validation can successfully
> hijack a core system interrupt like the system timer on some architectures,
> leading to system instability or deadlocks.
>
> Should there be a check like if (spi->irq <= 0) to fail the probe gracefully?

request_irq() fails with -EINVAL in this case, which is an appropriate
return code. This is again the same behavior as before, if an invalid
GPIO, or a GPIO that is not connected to an irqchip gets passed.

     Arnd
