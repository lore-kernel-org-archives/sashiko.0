Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F523A544B
	for <sashiko@lists.linux.dev>; Mon,  4 May 2026 11:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777893044; cv=none; b=Ss6vcNLvT1UMREaXYXRfYyXgDyHgf1ODg4k4sqmlCpOWUkeIwiIldFop4GD+1icYr8MvnUzWruB/Bdfbv8seqzOdhtfMOyJ7QYVmlJCBd5LVcKB3hY3UFjBkw5lG41gTKyoXcrlklMgBySez2srkgnCrU8NDXTjfXUo/C/Hy+U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777893044; c=relaxed/simple;
	bh=hvIkUcGplTr0pRBj7FPS35gKKC1V+FL/vIDr6oudE3s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=WqDvrVhKKDx8Nwpox2DJX8gwChn02GEzAKRT6Cxtyah4Nlv6hrPVYUKWb0cPCeD4FnmDuB5KQGr91rfSyCKMcvis4wSxTELmLODXSNabLUWg46bfXqjpiqR+UHOUavA9TImzhHuWw1XLopgFGQdJFaQpRvE6dKbOXZ7moB69aak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RBfxgtOA; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RBfxgtOA"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso45052715e9.1
        for <sashiko@lists.linux.dev>; Mon, 04 May 2026 04:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777893040; x=1778497840; darn=lists.linux.dev;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1neqE2LfHfnexRseyojdeVHubjDEvUEc2J6H5swOBYE=;
        b=RBfxgtOApm4sL4j6aFlkHwHOxQ/3iqyXWWhwJtwz6qvyrsL64s7sOJlFPk+QOOSXJ9
         iRWMYdmdR2Bx9J0Si9o4zSWyv6Mb7ELDNIbEJT6rJWoaubxrAmZrFcs2KR1jxSJTTn5J
         PbNtIfV4bkoqb+xnV/a5LjqWlfFf/pnRf7MN3EvjQng3dke8m3VIxgxRumAckTCi8PdV
         8cbqKtgs+9HjCGnG8ndbhGS8RknXbHevyP8adPIFuXd1ifCX5IfNwNPwnRurgzRyv21C
         7ES1scmMvUcXFBb5FCGZSGSGS2BXu08i3ZDNepyRZbHtOxwpw/PRrJlykBVz7htpbIuR
         oZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777893040; x=1778497840;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1neqE2LfHfnexRseyojdeVHubjDEvUEc2J6H5swOBYE=;
        b=kRZJHawqnJBiG7vyac4AzUupzL2ayFXXGp082LhkYc1d5qbgHwd5hIsUkOtmSApwAz
         7G8qoe0/aLr52m/MEb+yY7F49v6H5SbmvGz6s4PxP5Gf/E0CPNXYTfXGDhra9Vs4IKpy
         56A/JTVLMBEviw8QmO+u1GYEB5lbl6ZeEo2Zp5T3dqFx7UbLP0Bt7B+W8FDSiTA4NCgH
         GhotCS5hg2qxbzkih0qadHhVUd9DaJR4+UbpMG1VziqzSMi0nPe8zOBwLiSY7EyuEf0J
         W9zSzBBrcsSf1SAS0nvjou+qlpU86fWTSGyfTpQKoNXSUI+IG0rw/s8B0jLOsgDq218P
         msSA==
X-Gm-Message-State: AOJu0Yxqd21Ipylmpblpp77fZDHOVc1nzrLotFF0rsQAc8/FDWXxksER
	BcIXroOsa7Vd1MFahITP0AxNxU762NZza6P/LasZWyXxRmzWWx0lYbBH3yBv6lDZ22cNMk3lH/n
	X4zRJ
X-Gm-Gg: AeBDiesGSiwbk+Y8xwA8I7AVx4FcTHde0XrFCiP6C2yokBqWhOw2QGB5n3uKY7/yf5R
	NZckiEoD9YERyEl5qS96ziROLvWgYxmdJ9DgQGsIbPdIhsLCSOx0FaJ6Trv+s9AphGOfWXbulcx
	IMwnwUO8BJIGGR62bxb8U8i94oASwuzLZw/esyDWNkMZNlYbOsXPLcC8DHQMw/dV9N9Ur1yOfYI
	MT5T0SItKfFJKU7totJSS9bpi4BI6SUlFP/9FB4GaHYY2jxOZ2i1YRt88YvAoZs5dMeCaJEO+bv
	qg1PMxt8Gk6Px5bioEZQMbLPxoCvG09194nMSalGwHISP9ZJjSAXnCGt+6fKppFmBb4qNTYw6kL
	1xxjGCWfD5PBIkkP2U0CNfrEYgIHOj4hWt1A+EBE+ZDpf7cO8TUXml2GPcoLMOAP62dqUBEeKMX
	FjnFod5ifhpxMDkzdQ7MM+Qg==
X-Received: by 2002:a05:600c:c093:b0:488:a9c3:44a3 with SMTP id 5b1f17b1804b1-48a93d94566mr156970375e9.2.1777893039791;
        Mon, 04 May 2026 04:10:39 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:1294:2ecf:67ff:fe81:9da0])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62bfd8b5886sm5469429137.8.2026.05.04.04.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 04:10:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 May 2026 08:10:34 -0300
Message-Id: <DI9UHCRWR7LE.13J5GTVBCCDZ8@suse.com>
Cc: <bpf@vger.kernel.org>
To: <sashiko@lists.linux.dev>, =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?=
 <rbm@suse.com>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>
Subject: Re: [PATCH bpf-next v11 05/11] selftests/bpf: Make skeleton headers
 order-only prerequisites of .test.d
X-Mailer: aerc 0.21.0-120-g22b95d38161f
References: <20260430-selftests-bpf_misconfig-v11-5-e11f7a8c4fdc@suse.com>
 <20260430162921.0829BC2BCB3@smtp.kernel.org>
In-Reply-To: <20260430162921.0829BC2BCB3@smtp.kernel.org>

Addressed in https://lore.kernel.org/all/DI6KY4J2N2UB.39XQW4ZLTT1VV@suse.co=
m

On Thu Apr 30, 2026 at 1:29 PM -03, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Making BPF skeletons order-only prerequisites of `.test.d` pre=
vents the generation of newly added skeletons when they are included via ex=
isting local headers, breaking the build.
> --
>
> commit c609958fbea63ac5aab9bea46f3e2a6881af6a94
> Author: Ricardo B. Marli=C3=A8re <rbm@suse.com>
>
> selftests/bpf: Make skeleton headers order-only prerequisites of .test.d
>
> This commit changes the Makefile to make BPF skeleton headers order-only
> prerequisites for .test.d files to prevent unnecessary recompilation. The
> BPF object file is kept as a normal prerequisite.
>
>> Note that adding a new BPF skeleton via a modified existing local header
>> still works correctly: GNU make builds order-only prerequisites that do
>> not exist (the order-only qualifier only suppresses timestamp-driven
>> rebuilds, not existence-driven builds), so a brand-new .skel.h listed in
>> TRUNNER_BPF_SKELS is generated even when .test.d is otherwise up to date=
.
>
> Is this assumption about GNU Make accurate? According to the GNU Make man=
ual,
> order-only prerequisites are never checked when determining if the target=
 is
> out of date.
>
> If a new BPF skeleton is added and included via an existing local header,
> the normal prerequisites of .test.d remain unchanged. Make will consider
> .test.d up to date, skipping the order-only prerequisites entirely.
>
>> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selfte=
sts/bpf/Makefile
>> index 9a4d8bea0c184..608e6dff03926 100644
>> --- a/tools/testing/selftests/bpf/Makefile
>> +++ b/tools/testing/selftests/bpf/Makefile
>> @@ -726,11 +726,11 @@ $(TRUNNER_TEST_OBJS): $(TRUNNER_OUTPUT)/%.test.o:	=
		\
>>  $(TRUNNER_TEST_OBJS:.o=3D.d): $(TRUNNER_OUTPUT)/%.test.d:			\
>>  			    $(TRUNNER_TESTS_DIR)/%.c			\
>>  			    $(TRUNNER_EXTRA_HDRS)			\
>> +			    $$(BPFOBJ) | $(TRUNNER_OUTPUT)		\
>>  			    $(TRUNNER_BPF_SKELS)			\
>>  			    $(TRUNNER_BPF_LSKELS)			\
>>  			    $(TRUNNER_BPF_LSKELS_SIGNED)		\
>> -			    $(TRUNNER_BPF_SKELS_LINKED)			\
>> -			    $$(BPFOBJ) | $(TRUNNER_OUTPUT)
>> +			    $(TRUNNER_BPF_SKELS_LINKED)
>
> Could this break incremental builds? The old .d file would still track th=
e
> dependency on the modified local header, causing .test.o to be correctly
> identified as out of date.
>
> When Make runs the compiler for .test.o, will it fail immediately with a
> missing file error because the new skeleton was never generated?
>
> Furthermore, if a subsequent patch tolerates test file compilation failur=
es,
> would this result in tests being silently skipped?

