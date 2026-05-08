Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18423E51CD
	for <sashiko@lists.linux.dev>; Fri,  8 May 2026 14:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778251018; cv=none; b=EMLPiiwRcC+DGyL0ZF/jOuqbO8ISh3IGPX/XBazE2pTYkbyBekprzDOa8nRHaaEr6/PgJkk0uywNUucoKnGQWPsmGmrfVUH1PI0MdLUzxbeJcFrkYcuYP49HVXDljCYAiINrBV1Dlhq/1TFF9uFxP0Of5XGAZATDWD8ew93f1aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778251018; c=relaxed/simple;
	bh=E5BdW2FcgH1ffGpN/yDvwtsYgsCucJdUnVpqN2OQpsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f9KOFcPHzLlH9Ad7SJ302mSdvhg62fUhTUDieDlpYMVS/w7ELeqACV2TSkR2nSsu88CIq2WJl73NbTtuwaUkzyFJmgTQsbzjDeY2yMX3eufw9OrCDkGPMbGIWhV85IB8DNg4KL7nPSi0b6NR8a6nm3puIV7I8MFXJQKjXEeHiFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=fNU3jpsS; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="fNU3jpsS"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8b3d6b215cfso35486916d6.3
        for <sashiko@lists.linux.dev>; Fri, 08 May 2026 07:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778251016; x=1778855816; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I1eXzQgjFRPPJxicE/qQ6c85q3aMd0C62Q7xrxPUUZ8=;
        b=fNU3jpsSCduzeF5cS0zY3DrRLt/GRGjwIs2s+W6n++3XewiH8vMI0zd4SNlxL3oK7Z
         SVL30td460oUleMiDce7AY52Xi2eMy+wvVtR2jaQCFXtDKA21hMYFiD1Z70orJktBIhy
         Qmm+ku01/YL6ZG/ktzz0RubZUPiwdZ51gHvDQbg79RoFKk3efd/5G0rEXYYbO7O4VjMr
         6gIy0QaB23NOniTDzdmboY7MSUjv6ssLEuZ5wSInZmDP64AAebdYAq52RqgizM33APM2
         6zcNLhd7f/RTyFFnb3u9GgsA1YM9cIdHd1RUA8cDKfnbx4rMk9rwCl4oN7sc9QNHcri+
         q0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251016; x=1778855816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I1eXzQgjFRPPJxicE/qQ6c85q3aMd0C62Q7xrxPUUZ8=;
        b=FZyrzy+tK14pRjRSmIpA9UEcIXa/EGe7QiKtR5jImXrut1mqxYv4MJEYmkh+uAlNUV
         Myb6tklJqwdC5bqRMaii1LWn4qi60QIDOgJ3arLVK/r+GAdxOJm1S3Wa1ZJEhcBE6u0/
         lBUjbUiIKwG/+i184HphQkWM5OOVu3C0A6H25j9ncbgbhUQxBOHjl4gWvBtwuZtxefk0
         SB96wdKHm8KWulugujvE+VdlkS1g9bE/72Ca7vm2FZu6ZaiajRLJumLkS5xvizDsypxl
         PlZ27nfyEjrlpz83SfSLqqrSkeovvOmY3NxZMphjsq/GH/V+WlLTKVLCrwehpXC4Szlv
         RFsw==
X-Forwarded-Encrypted: i=1; AFNElJ9uCD1KD6CkgDDx0XKG/jMuuxqSl6supNy+2ILbjpwYH+JTDhqeuQDcDQatRZnt89qrDHBrLv7w@lists.linux.dev
X-Gm-Message-State: AOJu0Yxmg4t1V7+w+9qwPm+s+2hyuJwsgQzA1vRhZqb14H8dMLK/lG+O
	6/QlZQIPqdCeR+wIhCLTVsoWoKEF1pZskL/Fg98n/iBwiTXR1dqGJGYQOQYMPRkSy9w=
X-Gm-Gg: AeBDiev91y4MCQl3RVUZozc66NvN/xq9sPcZGUfS/Fv4RFbiK8aKxRPzZs3uyQ3fIX/
	ZPqG5ZwyC5SGZi0zwfpMImQrsz+V5XxZALfv9RYjqTX+lhM9Pd9PXsS6ZTyEQ2tH14RNzvWSNdH
	8uO+dCyqrRR0NrB6rx35aToq1dLrgTiy+SF39xKTpJWj7Cz6tZwW3k032gAQnaT78PDh9MNbUVw
	iIlTWjoSl3pFj8bWg4X1GG2Bhf2BRrdmiPtdLYVRjsBMCMKH86XjI5uXSNTabfNUrQP6KRombkE
	ro/uUZ8lyKzDO5ASMEYk1wC/0MuvKEWg5Wa+/n3FbMX6MB15bQ7gdffxm4ydmIbi3ABDeyiVv3I
	RYdDvTdn1KfN4JeQTN+pAALhVJzhqqIbmJTgO5rktYSA+LSBzIlewNPaQceXlHtNrA6AuzrslM/
	mijzGkQ7JObw1UFMrKTeVCm0JjJp/u5S682pfJoVMwdoNclM3skL4y+q5kC3+I2t4=
X-Received: by 2002:a05:622a:1145:b0:50d:2a98:2571 with SMTP id d75a77b69052e-51461e72ca8mr170662291cf.26.1778251015806;
        Fri, 08 May 2026 07:36:55 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148e814c7asm17553001cf.23.2026.05.08.07.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 07:36:55 -0700 (PDT)
Message-ID: <b301a613-a8f7-4d18-98db-aeac1201b902@riscstar.com>
Date: Fri, 8 May 2026 09:36:54 -0500
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 08/12] dt-bindings: net: toshiba,tc965x-dwmac:
 add TC956x Ethernet bridge
To: Rob Herring <robh@kernel.org>, sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260501155421.3329862-9-elder@riscstar.com>
 <20260502155615.AF378C19425@smtp.kernel.org>
 <20260507190215.GA2243588-robh@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260507190215.GA2243588-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/7/26 2:02 PM, Rob Herring wrote:
> Please answer sashiko reports because if maintainers are, it's just more
> work for us. While agreeing with maintainer comments don't need a reply,
> I think we're still at the point any AI review does. Though sashiko is
> 2/2 here.

I plan to.  I've been responding to maintainer/reviewer things first,
but I fully intend to treat sashiko as a "proper reviewer" and will
respond to those as well.

					-Alex
