Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3FE26ED40
	for <sashiko@lists.linux.dev>; Wed, 13 May 2026 16:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778688747; cv=none; b=HM1YkG7SW+bT0ssx2B0QMo1vM43QJdMtD1I0OF7NXa170tR+UdUtgGtD+wsJO5LBqTcsc6u24TaPLV8QCZ3EjI8j+Hvl8QGQBPKQWdXKZM0C7NJDobSugBhvpjyZZ2PQx+shOzu+NxeBtEimbbRPOak5GrcmeWf4PHVgjFWjF58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778688747; c=relaxed/simple;
	bh=Wl6t+8nJqW3f/rIpNjV94uwi59P/Kjsnwpu2+AzJEd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fmM9uwu1hJHUuUOJ3JwDbz4S8zLwbqc/M+lMdE9TJgcYPzDEVt6kwN5sQ1L14HKmCmxE97Dp7+E3X3r0ozfYbvKrm6UFz29BnQbfEKKdTP0n15ZrKaOJ5HKTRHleM/Ss7IloL/cGKEUO4+8qC5gFNeneNCqA67nVmjI/vj3tqIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ABPFSg04; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ABPFSg04"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778688744;
	bh=Wl6t+8nJqW3f/rIpNjV94uwi59P/Kjsnwpu2+AzJEd0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ABPFSg04CkWJtSgV6fO5t9yiwKD/Azj1w/rvEkBfXcFr3/wbUH5wMccVj5vcfMTaC
	 3BkvoF5V7DRSCcGGYtU86PDDRKb2QcBQ2obwiWWc4JPpvmcQbIfXCjpv9DMR7Ag2Zn
	 SdO+C3ZIL+wRM3SBnB0fuMkXhDJkC9AdoS868S8AYxgWYusZaMxSqcxUyk3Nx6vi+/
	 COhj8WLWKdRkHPoDuCRIsFl6dEEynarNaE7WlyPQsouSN7wkgo7buR1thpkiz+Y2ao
	 mf7tvbULaUtPTZcXCUWiRe5d/lV/GISmISFwuHSewYit0rxlYfcr9pu0GE5SY4g2Rc
	 d0QlhFcl4facA==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6643C17E04F2;
	Wed, 13 May 2026 18:12:24 +0200 (CEST)
Message-ID: <340a4781-356c-406c-89e0-68b72df9e95f@collabora.com>
Date: Wed, 13 May 2026 19:12:23 +0300
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] phy: rockchip: samsung-hdptx: Fix rate
 recalculation for high bpc
To: sashiko@lists.linux.dev
Cc: neil.armstrong@linaro.org, olteanv@gmail.com, vkoul@kernel.org,
 linux-phy@lists.infradead.org
References: <20260511-hdptx-clk-fixes-v2-1-664e41379cab@collabora.com>
 <20260512225155.EEA3AC2BCB0@smtp.kernel.org>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260512225155.EEA3AC2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/13/26 1:51 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Clock rate calculation drops a rounding step, replacing DIV_ROUND_CLOSEST_ULL() with truncation via div_u64(), which can cause a 1 Hz clock rate mismatch.
> --
> 
> commit f013b4b7bc1d4ae235d28b10cad3143d009d131c
> Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> phy: rockchip: samsung-hdptx: Fix rate recalculation for high bpc
> 
> This commit fixes the clock rate recalculation in the HDMI PHY probe path
> by directly reading the bpc value from hardware registers instead of
> relying on uninitialized configuration struct members.
> 
>> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> index 2d973bc37f076..7fb1c22318bbf 100644
>> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> @@ -2280,7 +2281,7 @@ static u64 rk_hdptx_phy_clk_calc_rate_from_pll_cfg(struct rk_hdptx_phy *hdptx)
>>  			fout = fout + sdm;
>>  	}
>>  
>> -	return div_u64(fout * 2, ropll_hw.pms_sdiv * 10);
>> +	return div_u64(fout * 2 * 8, ropll_hw.pms_sdiv * 10 * bpc);
>>  }
>>  
>>  static unsigned long rk_hdptx_phy_clk_recalc_rate(struct clk_hw *hw,
>> @@ -2288,19 +2289,13 @@ static unsigned long rk_hdptx_phy_clk_recalc_rate(struct clk_hw *hw,
>>  {
>>  	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
>>  	u32 status;
>> -	u64 rate;
>>  	int ret;
>>  
>>  	ret = regmap_read(hdptx->grf, GRF_HDPTX_CON0, &status);
>>  	if (ret || !(status & HDPTX_I_PLL_EN))
>>  		return 0;
>>  
>> -	rate = rk_hdptx_phy_clk_calc_rate_from_pll_cfg(hdptx);
>> -
>> -	if (hdptx->hdmi_cfg.mode == PHY_HDMI_MODE_FRL)
>> -		return rate;
>> -
>> -	return DIV_ROUND_CLOSEST_ULL(rate * 8, hdptx->hdmi_cfg.bpc);
>> +	return rk_hdptx_phy_clk_calc_rate_from_pll_cfg(hdptx);
> 
> Does this inadvertently change the rounding behavior?
> 
> By moving the * 8 and / bpc math into rk_hdptx_phy_clk_calc_rate_from_pll_cfg()
> and using div_u64(), the result is now truncated instead of rounded.
> 
> For example, if the exact calculated value ends in .6 or .8, the truncation
> will yield a value 1 Hz lower than the rounded value.
> 
> Since rk_hdptx_phy_clk_determine_rate() still calculates the expected rate
> using DIV_ROUND_CLOSEST_ULL(), could this truncation lead to a 1 Hz mismatch
> in the Common Clock Framework?

I couldn't notice any change in the functional behavior, but for consistency we
can stick with DIV_ROUND_CLOSEST_ULL().  I'll make this change in the next
revision, if any required, otherwise it will be submitted as part of the FRL
TxFFE level control series:

https://lore.kernel.org/all/20260328-hdptx-ffe-v1-0-53ebd5dea20a@collabora.com/

