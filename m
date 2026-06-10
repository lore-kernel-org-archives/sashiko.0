Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F62331ED7
	for <sashiko@lists.linux.dev>; Wed, 10 Jun 2026 22:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781131241; cv=pass; b=B0IWOaJtIsclcKb9oo5sHupMpRKe0/RLfMlRqXgwQKfn6pieSAoOEF8DbArLeczmv5Ko9XeeyKRoJd80pZDhSp6rQzbEqDSWujboevauGECsYeVRE15V6hZQF5I74Htl2OPisdAGwlRmh+MUWOKE8HRBiW+AmmM1H+1XPUkCw44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781131241; c=relaxed/simple;
	bh=18ou5X1KOh5LEQnMxnbQ1ANcfhwNcv8WLmqs+Hql40k=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=SeBAEmKRHRmWud8iMqTynU+QIjJCfglhzEMTFxv/R1cSe9BxCRTO3JYJn8gAMRXn64XRZy7WWtHOLwHpLQ2DMg3Hk78AQthFhVZT4c7lFl5wTqpsXHUHWL+XJsT4QdqST9WESqiaB4MSEMspO1p9/IoNpARB4fSYlNfAU0EJOS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t1QXjRFB; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t1QXjRFB"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bf2911f93cso18535ad.1
        for <sashiko@lists.linux.dev>; Wed, 10 Jun 2026 15:40:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781131239; cv=none;
        d=google.com; s=arc-20240605;
        b=ZQp5DdMQ8lSUoNUSogVHt2nVUi527/i+mjzrrHhk89TFg/9wAaf2+wK+T4Nb2+xFVN
         h30vi0Kr46wBwejpTHlFTl5DW0yY9EhW/hs1w4x6PwwLqAMSuPJYF7iFh4bVDX+umNqd
         IgU+ep5OTdunJwi9BpTeG/c8r0ybVK+0Vi1qIgAOdn0cz+FtYSsBzbNp+jZJEKSQHF7w
         LOrn7in/NRooiZoFf0VO7E6zB8YLBGyLnoh6t3EkLp5nJBshFf5+sJnWFimFf9zi8tvx
         h6cYfe23Ao3gHjniyJiQxyOZ5CpYrrUlaoWkPt9Du0ijQVZvRsIRVuCNYDVmooRD2QAb
         boSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=18ou5X1KOh5LEQnMxnbQ1ANcfhwNcv8WLmqs+Hql40k=;
        fh=f4752awmNObrvpfNRW8A1hmCXdqwMcSumbWvefch2N8=;
        b=i+nn11gyUUlSZjuKSDg7Y2Abt6S5q7IftVMPbTWPkGfc1LLpMBmSvpCAHB1VT9EdMY
         OlWm6gRnp+Lmu+9Mq3By54xw+/elyyJ6g0+uby255ixFkcH+xye5Oks/0/7OYYV1jqW5
         5zKseXlN2lUYzbYKtGfjM2Dea44wt1WdNFAglMEh3KRD3IRiYXZT7WZwVBE2x8IODaQ5
         MDLSZAtxRe87dpVUn20JRFt9EhXwby42fkclK74qt6GLDSofWB7+zCztZ7bzgZsm3qGd
         cQI3wuGyy9fe/lxUXjRnxUpCV/SfyrqP01qbm7T8lpp0HrSenWrtklcvHQlVy3RyoK7K
         P0NQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781131239; x=1781736039; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=18ou5X1KOh5LEQnMxnbQ1ANcfhwNcv8WLmqs+Hql40k=;
        b=t1QXjRFBIg4KzU71WlhjRI1KgBcR5NI3tDMscwRJSQv16TPBLpiekpGTTWxDSvopa2
         oHJNV1drCV2s7Sk58lqVlXoXvG4ZtXMGGL+RmLezkYpeY44bHBJhKOhUXibivGDg0vVd
         5PGU3xpjiL+VWw6nYYGXT3keK9grk64lXV2XCUbcLvpFxWkRCXl+sAESiqjkQr4NvpzY
         np2RCxmxKGLYdrJpyY+jbVQJ4iA7MvpTQv1gnpacpWESoVG4IcjI514827RZ5/AGKwc4
         LpmbxbpUXd/kO97jDDPtH9YlG36gc0Ree5FSHMOIle9HlYsuEfqGVDNTBVN2wTHl9LLn
         Z68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781131239; x=1781736039;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=18ou5X1KOh5LEQnMxnbQ1ANcfhwNcv8WLmqs+Hql40k=;
        b=lu+52mBqTPs06SZy5ZFk9fP7YL7YdNt3yNv30Vv5H7A1MNGIcNSwN2Ts7bBZDWphR8
         LIwY2atHGSLTiZ8KWeNs9e3sbfBqY2KOvOrC6KOyVR2+sI9KGjrSJK/74XL3VNv7R2xM
         2pxT7NsS8fspgWXsml+wPFCvCohA4AcgQGZ5FGaP4LPucAjKG7mf0MD2FtFsC+95euC6
         DSRTfc3D/fYS6aP84aAL4hfGfnbC63U5yj0rVEvceJCc22dQJJIz696tyHGI5n2GDfOl
         BGuJDol9WgdpbDjJBuNEYGh8l5dX22mNTSI/pA48T2o6fcuNdPWMVQGkZyZlkLH3ZtiM
         ajQg==
X-Gm-Message-State: AOJu0Yx2outZUS9eZ09IK8L028mI/SX4z/MopgCgsWwohe99DHm4gg3W
	jdDK31q+vvxM0bUlEmB/sGPVEwSo5pO8XsCLZzHDXub5qYmdfXXz0am4Fh6B9pO3c8An+eawmJv
	7ymyMOCQJ7ss5u3NsO+eWK/SLURPgomkfzhlYGJ5SIK5RSCNxDRDP9JmpSsg=
X-Gm-Gg: Acq92OExIVQz7WRI7URBrockr1Saa9Ts6i4TZlZPef21YCk7PqVhJ2ymVPO99K/Lj+l
	6qEjuMtNaa8u4guFzxQWLYKATjsTeEaTSNk2gMcch3p6NcdOQCPSxBlcThyx7faEwu/tYZfFZ3l
	X7zWnZih9RRGHz9FlKg6dNd83VNaSNXZyVoj32NFfloL+j4DwrX7nahXvKehuPgdKOlEUjF2ECW
	HR03mQqxUpVBDuX31AtsWrTcakPNio3moPMklLTT1CyfolLBNfPyJWsOwrbI6bx4Zm7VGhvnqhU
	Gd9HS8PSeaYaeY+10JqmjWCz4WuubHhY9AjVClSo0KVBP8Iq
X-Received: by 2002:a17:903:3847:b0:2c1:ee6e:4e4c with SMTP id
 d9443c01a7336-2c2dfa8ed76mr195845ad.29.1781131238894; Wed, 10 Jun 2026
 15:40:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Ian Rogers <irogers@google.com>
Date: Wed, 10 Jun 2026 15:40:27 -0700
X-Gm-Features: AVVi8Cc3LdIyfP66YnITtxkQFFwH-HY2bE18Wooi0I2rlGntrFv-M2Bpafe8uM8
Message-ID: <CAP-5=fWmn9+LT-4VeAm6JwTM=FB071w-Oa2QXDROLK7VDXcfow@mail.gmail.com>
Subject: RFC: patch size analysis prompt
To: sashiko@lists.linux.dev, Chris Mason <clm@meta.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

I sent an RFC PR to add patch size analysis to Chris Mason's prompts:
https://github.com/masoncl/review-prompts/pull/73

The proposed prompts aren't subsystem specific but maybe they should be?

The prompt itself:
1) Shows what a decomposition analysis for a patch should look like.
2) Categorizes the patch size, ignoring small ones.
3) Recommends decomposition when multiple subsystems are involved, or
when bug fixes, features and refactorings are mixed together.
4) Establishes an 80% rule: if any of the decomposed patches is sized
at 80% of the original patch's size, then the original patch was
appropriately sized.

Using the prompt locally I find the feedback useful and the approach
doesn't feel specific to the perf subsystem I largely work in. I could
imagine that if someone is say dropping a new device driver, getting
feedback to break that apart may be unwelcome. Perhaps people have
extra advice on how to determine if a patch is appropriately sized. I
think the feedback would be useful for both reviewers and
contributors. For reviewers it would let them know if asking for
decomposition was reasonable. For contributors it would give them
quick feedback that their code should be broken apart to make it
easier to review. However, these are just my thoughts and the RFC and
this email is intended for others to provide theirs.

Thanks,
Ian
