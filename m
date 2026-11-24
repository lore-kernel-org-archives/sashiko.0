Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521196;
	b=kbDilIhLjz1Hqj/5HxXkqHr3FmZ9u2BY7BwxgkFdk2HmD8c6ipSMdUG/+ZJMJTfABcFP
	 9A6y0LNJS4UXplT1BvZ4X3l0aCibY9kamo4/ykGgmMo3756/z2vOv/Y5tS1NvC4wJW4Ha
	 aSQPZ8nVvckrbzydLYly6wtHVL3RUf0fH4QZk5aosX7X+49/lntXGrwtqJbjvNlybebsB
	 N/J7W1sE0jdJawJ25eGMxIUmVJRQf7M2cTjlQ7seGsPcgzMnAimuyNEOs7ey4z/9MiRuV
	 kGQ6Mj7ZX2izH3AhERuBNtRyO1vNBJ62obuucZFTyUpdiQOvQNgLvLXzC7wa8BU2ixw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521196;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=4x/opzmCKLDLqalwegOmNaCRghF/n++fO7bIxX1Whws=;
	b=2V6pCsBdSnXMvCHZRgk/FZ4N0GL1IOFVaYFKtuYgqGwFB0b6yiLgSLX2V6RAzx38bJ60
	 16zQZUYcekEMExgyKqGbDZF2wuK28PCBcV0DY3QEj2sX2PqF8ICD6K7Rdo9unY0XbJf7J
	 GO4+B+mfxM+CVXk/Nh1jo2P/eJ7uVwDbw1/EOZC6sEC5SAit8K9kLywRk2oPy8/xHCtmp
	 WVh0Qqfe58z2Cxgfn2mZOWB7PvuNC0M5RF6dAGO++22HCVouFqLEx1rX653g+ffXQ2dou
	 /6md7bRzjiiddUg+IGfnLuJ7FV/p8iD9xTQThujtX9WculT/EiJp6TtrUFOlJTJnPbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=CZ1ZWA+s;
	arc=none smtp.remote-ip=91.218.175.42
Received: from mta0.migadu.com (out-42.mta0.migadu.com [91.218.175.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13CE606A31E
	for <sashiko@lists.linux.dev>; Tue, 24 Nov 2026 11:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E13CE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=CZ1ZWA+s
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=qo85MlKtCmMC0JjdaYbkPAhBNVkldJBVvhtczSMKL+Y=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795521193; v=1; x=1796125993;
 b=CZ1ZWA+sPca4rD66utn2XYjRHlPZ8L0RfLeznD07nKjnz5BtnxJpV12xg1Nem7sOcHOxB2kg
 GcNWTD47SjsPJaCA2cSlvsDWqmp5CSn+cz70U20ooQKfP3aDwIfQZJrDbV1dupHT5N2rq6Hh+Qz
 fcpxbC1pwiaPEMhkVhy3ND2tT+LB0tA5oNODFnewVbL+9rO8I0UB6gf8CWC4iSYqW+5JiH7kIx8
 951lMuA9dmPxFPaxVpqPKYDk06YXfOveWxezCE3yATG+XMB5fwnyK8uLh055wnM2EP0dRqnDYWU
 MrJYfJKUK1ePnZ7GMCFsf9Aj1dEUWMbhEiFBzrGbMFyWw==
X-Envelope-To: sashiko@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 4ca747cca3ad5f57;
	Tue, 24 Nov 2026 11:53:13 +0000
X-Mizu-Trace-ID: 4ca747cca3ad5f57
X-Migadu-Flow: FLOW_OUT
Date: Tue, 24 Nov 2026 19:53:07 +0800
From: Weijie Yuan <wy@wyuan.org>
To: sashiko@lists.linux.dev, Roman Gushchin <roman@kernel.org>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: Request to enable Sashiko for zh_CN & zh_TW
Message-ID: <awV6oyzXeaisqvmS@wyuan.org>
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Roman,

With LKML no longer one of the default lists for Documentation
[3a198413bb71 (docs: submitting-patches: make LKML a list of last
resort again, 2026-11-13)], our translations directory therefore
sometimes will possibly lose reviews from Sashiko, as linux-doc list
does not enable Sashiko.

I've talked with Dongliang Mu about this and we agreed to keep
Sashiko turning on for our paths, without touching the whole
linux-doc list:

  Documentation/translations/zh_CN
  Documentation/translations/zh_TW

I'm not sure that whether Sashiko could be configured for specific
path like this since it seems that I didn't see any docs for this
use case. Roman, may I ask that is there any workaround?

Thank you very much,
Weijie
