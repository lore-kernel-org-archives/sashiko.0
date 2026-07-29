Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9202D3B71B4
	for <sashiko@lists.linux.dev>; Wed, 29 Jul 2026 20:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785357265; cv=pass; b=rl2Fjf9XVxpIBmR8/0EJqHs89rHFVD0YoDbFb9znLA04xPhHhG+9cOFqhhcYEOI+99qP4CcGId06DXzbUh3i+P1CxmKfUFRBf+MI/NzyfkAh1KxI9s+zhFm7tJeU06VLDB7POvPFjrGqJVMcQcKaxvPDfMerCVSO9E53BhCjiJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785357265; c=relaxed/simple;
	bh=99DvLem5MZjBfp3g2RSpyvvljB5TopZcUh8TBL3YzIc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=iMJrWLxYUTNsJ48bKDOHK9nkYwxfHAT3DNZ4UM6ZTH7m1FF5zbT1R+hxOR76RoYSKX4wycPRGC15FULcHbDrhKsQtctZzQ79We3mLvPXgIpqVDu22HoA7yQvbTH5NHVaKFYFfGEICpHMAhxF4oCPfJSTTBjexA7xx072MCVFCoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nwsl6bZM; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nwsl6bZM"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f84023916so1333385f8f.3
        for <sashiko@lists.linux.dev>; Wed, 29 Jul 2026 13:34:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785357263; cv=none;
        d=google.com; s=arc-20260327;
        b=gJKMHUh5sRfE2SkCh2waJXc5SWd5rATPvMfZa8EhdgEV7reH0ZBLH35gDAoqDQuk4T
         53DA/7WST7A79lMMYaU9R/zTpLcKBrDbT1cE9lP5JSIZDnoSLVq46aRjBd7f6k1puYVd
         V+7pfutgZjxzCWLsxhvckS23wNv/pQ8VTW7Ffn5RYmUYmFteCIvosTHs5c4yCWQGsVEp
         3ig7Q26YqI1iPjUoDIBkAmTp0NmcSiKxuxhNrZZEUrRYY2PnsTAm/9x+WKBFSkZMsPV6
         2JRocYpe7UXfkB6O8OKx+8WNgfKdReUad2saOZv/pRGmK+nnrGF4Ml4GnH5kQOwo5cTG
         MVtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=99DvLem5MZjBfp3g2RSpyvvljB5TopZcUh8TBL3YzIc=;
        fh=yQGxEJTa78/KV/xJNx7ZRb2dBgkDLUHHm1xrAMWcERg=;
        b=CmK+eMz9ya2Rct+SUdxjnv8ETRlPMkdiWETNf1BvfzstFjpp8PGINaCX/laXh1PIk5
         Yr+ZM7JhS3jlRdxsm8bqVPbEZRLQZfesP8oYVog1jUqlVix+HIjpVd6cu9aY9l2j2sAZ
         KwRuVZjOL/Sexqj/NnYJSiQMXBGjMKOcP5FhVm26yxlHrSPLzDjourkqJf2JuEHauGWK
         Al1suNAEgtqdVUSPCO5Ai+ZDMPSW96sFeVatkdUDleoawtFVLg7mnc9htxydFVWSDl3j
         wLkSQgV9KIs7sQU4TBii9ESKeOT6csEqaxPwRwG1W2mqT7U/th+CoerQkh3PJ6uSilOh
         esHg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785357263; x=1785962063; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=99DvLem5MZjBfp3g2RSpyvvljB5TopZcUh8TBL3YzIc=;
        b=nwsl6bZMIsoH31owKzDKLUQWMEmwU4w/FGaZH+QSTWehoU6jxFDhztCRGcR427ETaz
         KLiXc4O/ysdaQkvI9FWZKRNX9ITF5pOXcN7nHhVIlc7vSduV8UuTd7fG8czSBtMMhBvP
         vlDOT4DdYFOlZ1KuGMXqJ7C3Bmb5R/KHpRGcTYAV6SAde5VD4ckz2E1vgM0GO0EVxTTY
         7BHdnZ7z0vO7K5cKH80LtETpnCJFrtfz2LaOabwqfTOPtD68ab3yy7sD82eGw6zskd7r
         bFOOxMVtR5TWh2f446b0V24FNLISnYeNwU7Z+u1/BxeANLBXfEHwZMTBQ0fFv3sHgaYq
         sFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785357263; x=1785962063;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=99DvLem5MZjBfp3g2RSpyvvljB5TopZcUh8TBL3YzIc=;
        b=VbO0oQ0/FdRexS32zLUjTof0oHo8XTfozaySAB+HssSO7Ldu+S9KZg0Fv0mnEq+udX
         hrZUe5JEKKnKYDiD+g+Pj3Z1NxYDqZvUSJiGiTp8qmJirqjkxeOu0iBKHjZHsV9JKaYp
         Olnp76cXb95fU9tIv8sLZSrQOW/mBP23/3tnYTvH0Ww6JzZLFC7m3hhFS7bhFrQR+Y1Y
         UoK2bpBvIHCfRc2bgq9gyEfF2HKrB8ENZZj0t9S+3W3dSxCiFQ3iPdr90kJIt/or1ivT
         jY98l/gBGFBhOJcc5aehbF1YoNyz78jc4yGkM7vxhYOixAOkQYNgLTOkbmvlQ7sNlpDN
         l0ew==
X-Gm-Message-State: AOJu0Yy2JqjcTzL86+5t97pexX9qBYzFNPurtuD7yI1hY+jujJ2j0n/i
	Q/5LP8zrORjXiXbl+OvIacA+XNhlAaUwCsZpasu3tlYEmv5kBs8gKB/5N5XiSJjnWbXZOlopao6
	PpRfJGi5Liq66YUeUi7AlkR5p6/6pZo/e+RLX
X-Gm-Gg: AR+sD117FlQOD+8ccJY6aUqrF1dJc2hQENWwZDDgrnCZv00snjfV58A2RAHIc+XFaq4
	v6TAsUuffnyreYlBDM5ECx2ARieqG1Zo1Xli7JcSS4S63ahOCBvKwxjfTx2KqKMqDUk+PPcRLK5
	Jd4M16aC9v2ugPQsUcPWw9Vx3Wds1MV7M1Vb4UReCa2pbJ5NkZN9fx+IslAIMJaoQ52soQJRmRq
	SaK0ZnTP0+Fy0jmOO4e0A0BOjGtx8EZtk7cDXyTzYidMS2824AtMvVGr2i7P+kGaa8QKAN6T7h8
	OvnZgeb1zALJLYCjRFIMegt5jM1TfIYPbdbF+nCrcu9jIyvkCvjcBYJgy+bxurBT84AlsY5DBCH
	DMRzy+aZxmNrdmMveNrqjhbVz
X-Received: by 2002:a05:6000:41c7:b0:47f:ade6:6791 with SMTP id
 ffacd0b85a97d-47fc66550f5mr483516f8f.21.1785357262644; Wed, 29 Jul 2026
 13:34:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 29 Jul 2026 13:34:10 -0700
X-Gm-Features: AUfX_mz0l56zZFRIw5LTD9IsaZFGE0w8yQbBToXOnVK9Z7pCzphPAhgQfVyx5wM
Message-ID: <CAJnrk1Y6twWcXfFesbLMNfMavg5RWgQ07pGJ1BM98V4o+FYcBw@mail.gmail.com>
Subject: Full subsystem codebase scan for identifying pre-existing issues?
To: sashiko@lists.linux.dev
Cc: Christoph Hellwig <hch@lst.de>, "Darrick J. Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

Is there a way for Sashiko to run a full scan of a subsystem/tree to
identify all the pre-existing issues so that they can be fixed
proactively? Currently, they're flagged on patch reviews, which can be
a bit frustrating for contributors who didn't introduce the problem,
and adds a bit of noise for maintainers/reviewers looking at the
Sashiko report.

Thanks,
Joanne
