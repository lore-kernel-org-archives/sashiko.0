Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA4F3101B0
	for <sashiko@lists.linux.dev>; Sat, 30 May 2026 02:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780106664; cv=none; b=dSe8+PHcoO7kV6AVQaZuolWKI4DyEm1n0alHOiaZKUG7/tO41udWG1xPB79AGRh6a3VB4G+HJezWCOvZcOSXtVlo/tEmJchPvH3xjp7fqs9YS7FcFfIXJWy7Anq2VEzS9Ni+beLDnkotCErQGR4luHnEpRDnCtIUrPEnz1umCoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780106664; c=relaxed/simple;
	bh=Q5/8ElMLDJgNYwlQ2LGLb6j53lsW1p6vkcz7k1ddeec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rD1vAPGiLCGInLCMLNWdXfycylhgaNqJ5Vfz7TOcq6cU6YnoPo//BfaN8u/VWWwUD+oMagVoz50lnOx1CujHt9g7qPqBBBzfenIiaxn7tVJDgmD7Z00w536AESyokFUL+sS2t4Gb39g2/pposQj2y8afX0vOJLI6/XBIYoYuB78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=IA/WLhbR; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="IA/WLhbR"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51720674eb7so25772561cf.1
        for <sashiko@lists.linux.dev>; Fri, 29 May 2026 19:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780106661; x=1780711461; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RBgFnM5hRehl1dFk/oIpPjf+IKV6ZRSVJWJqumFIFU8=;
        b=IA/WLhbRbmefogluPO6xxn8DK6xd1auW/Lpzu+6ghCtQ3+aSJROd+QHvskWWUjPMGh
         b2XrjPU0zXPjMgRQYTFapCfbzLpe28kSELVvf84cRwPDKusv/YQezj2ZHDigp0hlzHee
         Bc9YbCBkLgCSgilPD2JFxszGte9HmDv0Sft3+AxlyessdgCyIwh+sSb/mAFcomPI60j5
         4Y5CjQ8SV0NJgjj+ABb6ZEe9pOtssJrsVTL8Tmv+sxWI+BT7ziViNuBCeILK0YVmt/yy
         FsX+tKNTdd92LeYCjuanl3cXGUMBxJccc6LSEvHYfTbeTP1Xt+SuAIiqmukQJeKMKGVK
         fWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780106661; x=1780711461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RBgFnM5hRehl1dFk/oIpPjf+IKV6ZRSVJWJqumFIFU8=;
        b=Efxgnp3y/f9MLnpkGi2Lo7pJj3vgacfG/C9BbF9tXqguinFrwLiRHo6dRKEPlm52mS
         B2Ems0ofQpvAaArDb+iix6WONLxt3rDR3MMu7Np7hiIdBZLpvrMVebKRQWaH3wogBAR2
         Jpf1MhDGomlbf1QBc/Je8QlmT+Wp4nRbzmdGIdMPQvJEyKYiAOBC/7sSn7Jr1VT4q79C
         bffd1ghxA/i9j7yZkslcn5GF4tlfQOs0QyB5WEbbsNH9+dMivnfT0Bg07F1iqs5m/D0y
         KoNeA4rwVLs24coX1/4V6YmrRIKcmNr03QrFgtXHQZ+Vui1zpd6RidgtSQ9dWF+1S/g+
         uSwA==
X-Gm-Message-State: AOJu0YzRrHvej2alUrY4EhCuxkd73L0gLW1oetQwRaaEWai9kjArcH/o
	TjPGfsWSo18IvAs/xk0eYuV9Qe+1jWfqr253UyqIMxOvJaNIwDXIqhh/HN+NF1dq+wxcP2+qygt
	KDDQj9q0=
X-Gm-Gg: Acq92OFptrE67oKjl0NN/Dglm83rbe8qLwwxdIr/AAz3CT1wD5NWLSau2IUzQdIyLTH
	psXqHEDtLhrX7Mi6RfV0JnEj1aRDLulvpk+cp/oROzcBYkBEkTjJvdHjF7/o+3hUlQsZdF9TtUJ
	KlOomPcIIQxjvlZKEnpQwHemD9lHWrD1up1rmbBni7s7AIvWxD7cjLKg1UbcmnSJWVc6F0XwlAd
	oT9Y8STbf+7vunYAuGMgeIf6Pt4aGIiZMVG0WRo5i7mShv1zpwUFecpty9hlaVbC8eZ3XadGVG/
	ZB7nVE1gu/DZqKwkJiq2iLkMMbWtMb/VQgrk/9hsV9J8F9nOG6W71zVCqWul2x/8jHPF/rHgpOQ
	rxba6c0Ike7Lrt9rYMDBIqWwq2sjgKpUjk80+iGzAJRsB+x8ykmOF+hNpfX1Rn7frPdoXtEriM2
	OD2JGQutCPOyl5eWhU/wRZczy50WBiJXOHeA==
X-Received: by 2002:a05:622a:6843:10b0:516:ea2d:7c5a with SMTP id d75a77b69052e-5173a8232d8mr24645891cf.41.1780106661510;
        Fri, 29 May 2026 19:04:21 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea06d4casm32658206d6.16.2026.05.29.19.04.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 19:04:20 -0700 (PDT)
Message-ID: <b41e4246-869d-41ef-ab30-44c29e10efdf@riscstar.com>
Date: Fri, 29 May 2026 21:04:19 -0500
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 01/12] net: pcs: pcs-xpcs-regmap: support XPCS
 memory-mapped MDIO bus via regmap
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org, Daniel Thompson <daniel@riscstar.com>
References: <20260501155421.3329862-2-elder@riscstar.com>
 <20260502155613.5E6D5C19425@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260502155613.5E6D5C19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/2/26 10:56 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] devm_xpcs_regmap_register violates devm lifecycle semantics and causes a resource leak.
> --
> 
> commit 0a11082b5acea20f4d45fbd6df8fb9ec06db752d
> Author: Daniel Thompson <daniel@riscstar.com>
> 
> net: pcs: pcs-xpcs-regmap: support XPCS memory-mapped MDIO bus via regmap
> 
> This commit introduces helpers to allow a driver to register an XPCS using a
> regmap for the memory-mapped MDIO bus. It adds the devm_xpcs_regmap_register
> function to manage the bus registration and interface abstractions.
> 
>> diff --git a/drivers/net/pcs/pcs-xpcs-regmap.c b/drivers/net/pcs/pcs-xpcs-regmap.c
>> new file mode 100644
>> index 000000000000..20a54a360595
>> --- /dev/null
>> +++ b/drivers/net/pcs/pcs-xpcs-regmap.c
> 
> [ ... ]
> 
>> +struct dw_xpcs *devm_xpcs_regmap_register(struct device *dev,
>> +					  const struct xpcs_regmap_config *config)
>> +{
> 
> [ ... ]
> 
>> +	ret = devm_mdiobus_register(dev, pxpcs->bus);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to create MDIO bus\n");
>> +		return ERR_PTR(ret);
>> +	}
>> +
>> +	return xpcs_create_mdiodev(pxpcs->bus, 0);
> 
> Could this cause a resource leak on driver unbind?

Yes it could.  This will be fixed by checking the return value here,
and if it does not indicate an error, setting up a devm action
to call xpcs_destroy() on the dw_xpcs structure created.

					-Alex

> The devm_xpcs_regmap_register() function uses the devm_ prefix, implying an API
> contract where the returned dw_xpcs object will be automatically managed and
> cleaned up.
> 
> Internally, it calls xpcs_create_mdiodev(), which allocates the dw_xpcs
> structure and increments the reference count of the underlying mdio_device.
> These resources normally must be explicitly freed via xpcs_destroy().
> 
> Should this function register a devres cleanup action (for example, using
> devm_add_action_or_reset()) to invoke xpcs_destroy() during unbind?
> 
>> +}
>> +EXPORT_SYMBOL_GPL(devm_xpcs_regmap_register);
> 

