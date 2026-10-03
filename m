Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555AB43175
	for <sashiko@lists.linux.dev>; Sat,  3 Oct 2026 11:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791026833; cv=none; b=M6aFCJXfDThv2yAvd71x7nC/8M6SF7tzY+pTCBrb1+Y3enp4ypnnJsuF+yV4v3Nk7nLwuZXEcBFXpH4O19628vnBwgvUj7TPnWFG3cqnzuOpyd9sXfS0i0Ml85a8KbnjfH0NF8wklX89Jt5Cc0GnkvbChuOwJwBKvCajUSAzvuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791026833; c=relaxed/simple;
	bh=6Wa2i5n+B9tLxI0x9ZFxzdIczNRe+YMzUpoVph7ZT9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V1MRO0wEU0hlWOF/6rEl0QmNsNoYeWFkSCCwDR/sdnUmeHLkV1ynXn0srpD3rjhNB85KnIdqYPIWzoDtvzXjZJlhDkU97ZVnv/spzA6xDyZhCB9nyu6q6td7l8/qRBSGvZdvyoHQiolqQxgobb4J5cb+2zEItsnJzZkzfpIHYO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QR1c6fhh; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QR1c6fhh"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e2e064b932so1963025ad.0
        for <sashiko@lists.linux.dev>; Sat, 03 Oct 2026 04:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791026832; x=1791631632; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkWsvXqg+iVLcNRqW5mM7r4MTg+mR95MpYarvKuCuvk=;
        b=QR1c6fhh+vmxemh4ii++WorUXdW9g/FzcU9skzl/7oan9tEGfZGsKtc32bpIHF5TJp
         eXUzqU68lf3njTaf0KYHIREiV7v6yz4/nsz8c/RcYrP0rkciD+mtpQeU3JD2+rZ3oXkV
         HI+xOKY6M7qD0jfXrWXC3q3M8jDo1veQCiTjyT+/xZq0+1kDjVvLmMdw6f3jzr5cDfPA
         XR87Q6A0xbp4pqjpoO1kFQAHSpXzxMuHaBgXTR1aQCueWxQAirlIqoL6SOJJb70ZZMpt
         q77bkkZPM83v7Zv0plvPZLEz9tPJhAP60m1E9qqdBIGMZeToaCB04OcMFFGcYKF7jjsy
         w8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791026832; x=1791631632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QkWsvXqg+iVLcNRqW5mM7r4MTg+mR95MpYarvKuCuvk=;
        b=IGVJ+6lKe4X4bxCo6o8OvoCd6zorzVE316EeCCkrV6joWM5Wf0PVJqZso+gCIkDSo0
         cxbeAIt+kM6zpqYkiYlswF6u2ccf9S3+FXf3gpSzxWg7gDH7w4APW9w8HDqxN0dOZQch
         yWaVoXAqCun36BGv1KOILkn4AnnJ+UKe4nhw54suCN4FNOi3YiqINswecqv1g5+On7NR
         Eo3dyp0CyKYo51ayI1p+aIt0I08qtSsWUsRcdxnMNHyB9nZLrQEzoHXzgT420ZMVnDFQ
         rE0hcmvYhlX8+rFLqJn+mXxX6SBICWobEW/5fcMcBivSiSTyGDp6G43fLE6zZKK4tOY8
         dnYw==
X-Forwarded-Encrypted: i=1; AKwUvBxPXwaRsWEsXYj17xlkH0WJd2ac5uJfTKriulbnYmXvgYe4dWzo695R8SaXdHsiVFDmCZrIYd6I@lists.linux.dev
X-Gm-Message-State: AFq9FYIPIF/4pZbZNQCTtbboubQwAdqAAsGPfmceexQsuLewFka6R2iy
	Ma+3smkYyZsvk7By3U8O+HqiB160EPOL3qig1/N5YegaJHUI6lxsHeRL
X-Gm-Gg: AYBFou0Ri9CpQWoaBwslgrHDOUJwr1909hC4SfZkA7RWjlJvLB02xAP7y6w0Qc6FPEz
	ITMSN1alM098GCIYvElBms59WlljhmJmRmK23olSmN2nF+8KL13n2V2yY563pldRUnEfitgydLv
	QqcwONFODPh22SGtozO7e2z4vqcPRa0iGkwf9EOtzETKN+tWacgm0h2qXXTdbWkFTVzzGSAjAoR
	Vu0kP4G+BDk+5635diORuRGtlmMMShvqLFuwgu4rzFXMKHRt0j9mG/IF91n+jKdryTJqch8vRBG
	i0rH1sk2FOhjcWLUNWWTb2GB0yI1IHUH1B2BvyqQ4GUUtkxipe88S0z3n+5wLpprCWPXnZOzBQT
	lL32x5NTZbeTPU5pl2LpV/BA3Gz0Wrx1Nv2HvIj2GL2EYtvLREHgDFpmznejZH7dFz3mvYTx4LK
	LWwerKkJvOSBXAynEEESTXV+mrfHcJs4VKveAkcLyO2n7T2luQoOSOaXjpJR3YiG+bKCYlsFa3s
	k/ZD/L1ZPas2SsP8rj9WRYye97dIZ1uJc/AgjqRQhBjv6KfLuNre5XHKkcTkdym7rwb0injy5A=
X-Received: by 2002:a17:90a:d88d:b0:3a6:e985:5631 with SMTP id 98e67ed59e1d1-3a787749a8amr1515319a91.62.1791026831465;
        Sat, 03 Oct 2026 04:27:11 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a5150sm2652012a91.1.2026.10.03.04.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 04:27:10 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	sashiko@lists.linux.dev
Subject: Re: addressing sashiko's false positive rate
Date: Sat,  3 Oct 2026 20:27:07 +0900
Message-ID: <20261003112707.679125-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ar-QOL_Wk6oWe_G7@gremlin>
References: <ar-QOL_Wk6oWe_G7@gremlin>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Oct 02, 2026 at 12:23:08PM +0100, Lorenzo Stoakes (ARM) wrote:
> It also means repeats inflate your 'ignored' count so de-duping would
> likely move your 'acted on' number up a bit.

It does, by a little. Merging findings repeated across versions of the
same patch moved the automatic rate from 56% to 58% on input, 54% to 55%
on bpf and 42% to 46% on netdev. The merge is strict and misses some
reworded repeats.

> For 2. I included .csv reports for sashiko's 112 findings in my original
> mail which could be used as seed data?

Thanks, they were very useful. I fetched the same 11 postings from the
API and matched each finding to your rows. One thing I noticed first, in
case it helps. Your 112 are the emailed inline comments, and the API
holds 88 findings. It looks like the renderer posts one finding as
several comments, one per location, so up to 24 of your duplicates may
be one finding split up rather than a repeat.

38 findings had both your verdict and a next version to compare against.
I checked them two ways.

  An LLM given both versions of the patch, without your verdicts,
  agreed with you on 37 of 38. The one miss was fixed only in v4, which
  it was not shown.

  My automatic label, which checks whether the quoted lines changed,
  agreed on 27 of 38. In all 10 disagreements you sided with the LLM.

That corrects what I said about the label last time. Its misses were
mostly bugs in my checker, not authors fixing things elsewhere. It did
not notice lines inserted into the quoted code, it read only the first
location of a finding, and a duplicate line earlier in the file could
hide a change. It also had the reverse problem. Run against the
unchanged reviewed version, 34% to 56% of its "acted" labels on input,
bpf and netdev still came out as acted.

I fixed those, with a test for each. The label now agrees with you on 32
of the same 38. The fixes came from looking at these misses, so that is
not a clean test. On the LLM-checked samples from the other lists it
does about as well as before. The rates above use the fixed version. It
is still only a way to pick candidates. The LLM-checked numbers from my
last mail are the ones to use, and this supports the LLM check behind
them.

On seed data, one finding in your series is a useful example. The
vma_close() before unmap_region() finding was dismissed as unreachable
on v2, confirmed by a human reviewer on v3, and fixed in v4. So a
rebuttal does not make a finding wrong on its own. Each candidate needs
a check against later versions before it goes in, which is why I would
keep a person in that step.

> It's important to avoid overfitting to the data though - so you'd want to
> use different subsets of scored data in each candidate dataset to avoid
> that.

Agreed. Of the 38, 8 are repeats within the set, so there are about 30
distinct issues, nearly all from two series. I think that is too few to
split yet, so it would need more scored series first.

Thanks again for the data and the pointers,
HyeongJun
