Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2642FD681
	for <sashiko@lists.linux.dev>; Wed,  1 Apr 2026 06:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775025402; cv=pass; b=PlePe7nY0jz0I9HOEynxGoRbcCjfkRk0nrHMl6oj/s4lUlV4mUb5LurBC7AYTo5IZromTMRjQwnu35km6azNIYiZ7XOJR+TcViqs2Bj/VCafKFXeqi7gE+ka1xvDIrtk4qGCOye67p76NiM15Na+qhs+/zSwkKDIpav3WjE9wx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775025402; c=relaxed/simple;
	bh=5SJC8jEtYk4/+sQecQfOsXWs1pH+jkryl1gFeAsTB5I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=kFriLnkDZdbO4s9IEfadvEXBzOWDJn0yl/EpLYZfrEw28i0Df+D5LUPhuPrSXnG8qPbxLw5pCCPLnln109fMUXx0GCWyRzZsXottIt1KxFoaZRp1F5OVzL6Gr0e3LaMBKJAmWwOvmKHbKvArEvcBv+OlUNsWrVqKfj4/sNgqFq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Rsl76Syi; arc=pass smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Rsl76Syi"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7d7f09aa39fso7991897a34.0
        for <sashiko@lists.linux.dev>; Tue, 31 Mar 2026 23:36:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775025400; cv=none;
        d=google.com; s=arc-20240605;
        b=affEEbl6j4k5Vph4x4xKmyplnF9Fm4dfTBlCYpofptbGZ7mBi5A6D2vJfLdj30Qoln
         +9C9OPkqiF6th5AAndgbR9pB1sDfu5HGih05euUw+jfOkzYGG0MayKRuGWckzt52eRpu
         Cid95F0rw6u5XXSsSM/xP55rs/u90NdgVNoRrLsN5QWkv8n2IDlJOLEBROCoqyQiwB4d
         x+4LjD2gC8Xl8brfS9Gyc7xj657+2v7u1Bzv+ehF3p3Yjfi0dxL8ng51yePcJK7nINBc
         hPmqR+60j8ey8YG9+EBOK2yOSjJrB5iX6GBSiFbEXLYnIKJp7RFGtcYuGt0QCpFLErpA
         TdxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=5SJC8jEtYk4/+sQecQfOsXWs1pH+jkryl1gFeAsTB5I=;
        fh=HcGdhGcItcW9GSXstMW/vRjM1pLZ2hS7bNLN/OlwQ0k=;
        b=haAeqWSdkoIOCdbIcL54zboGkqaQYRXJIf355R3bHu4lODDcpG0yTO5ES6oPZDvqFB
         FpyjEKnsowWSzg52Bt4+Ylqb4mKD5hkGyy7Tw2gKjpqcCvOi9WSdnbJCZR8qPdJT9lYw
         UuvBjbIT7zFFNQenTmuc+rh0i/mGTbEkeNN92I1sjFQfJ4pMyek9lahHm82jNVLw7kdR
         EYAMA0JNUTLZGdMYXblDWj/U+px6FKae+KeVhI1uNPpb+Styz7+tPd4Dz+MCdGU2SmhX
         NMTYOPBzfovt00LkrTMPo3iuGvGEbYAlTbqUVJrGeV0ZR/HBsHl3hiFV97qnBiR2a+Ab
         F/jg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775025400; x=1775630200; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5SJC8jEtYk4/+sQecQfOsXWs1pH+jkryl1gFeAsTB5I=;
        b=Rsl76SyigjKEnB9sFEmdER98IFQlWA18tSMQ73ZwoC0EQf4MUN3+lHf+ZKZgW2dtXT
         ltXfery9EKkIV4WjzYNITpZHspnwLd+wnwDcEkC/dCKFxtExUDpgzYCLE5uzXyHdnNhk
         UerMlAE8VSYNTxO0TJqkmTlUhvktDqzzsUwqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775025400; x=1775630200;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5SJC8jEtYk4/+sQecQfOsXWs1pH+jkryl1gFeAsTB5I=;
        b=RGGV7FAwa4n0yCENgU/LydxQ0ysBv6ex+heWCTEeEaDHnb1JKw8K7Zn06Bxxj1KeCg
         bHONvEJfgbDbIBI91NfUgzQYeZXJQpfg0RTieGexdZ2C9Poa5TMfOtZOa2WymzubbCEe
         ef71/suzOBy+lP0TgQxYfGYb3yR4hBY2kCgaBlgO+YojdTVS/wsfCJGDkcwRUXiuYidz
         ren7G8sQHnVDS91SICdJScYv3f6n7wTSVxIQtO34E/VqdzEHdD2HM2FcLI6e8SMuEO8a
         Mcu3ep9bStumOtm+lvAro2dYqNHiV+oXwkCbH3FdsD2lsUnjj4Yc33E1KwZOTdKHEVkD
         1wBQ==
X-Gm-Message-State: AOJu0Yx2XTfkua0o6B6zKBw2bu4VZ9/8osSY6Roih/B4LwpkAPTWYSZp
	X0BRvv51lkRfvxMxM96YZ4E+istePjpBFWQK3dbrX1saf9y7nVzUBO4vdj1guJGL+WRnqlk445/
	JHq1aI7HAS3WFm8Wge0v7+PTzuOsS9os0FCdmQTUO6QbWY+t5o/50pRg=
X-Gm-Gg: ATEYQzx5o3qGbJYifEx520pMjHOXASXfgwo2Pv0zPNpXV9JMEsIXffu+m2gBlUAlomu
	MCAUaU25dsd5AYE9zkFhkFGC2gc1zer5mKtY9n5zw/OqaK/5pEfkrwHDPjjLvpk8pUzYwI8bHRm
	B6PJo3MR+gFrZAn4oUKI4GLrsIpH+AvsJSjP+V4dB+HsDIQaDZO2RBsN5tn/aYlNs8Gj9TzUn45
	uveGj5m5tBqVKZBKkY8dI1Lbm692Hk4wcHBAeARGpjdpLQNaIImVyP15A/i6wJDWlLSv2e/H2my
	CoGnzBT7lkQZ9XPBxeoAfLpYHSkRndKHg/3JuyHQV8RW9WAd
X-Received: by 2002:a05:6820:4b98:b0:67d:e836:2e32 with SMTP id
 006d021491bc7-67fabca3119mr1279601eaf.35.1775025399925; Tue, 31 Mar 2026
 23:36:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Christopher Hoy Poy <choypoy@linuxfoundation.org>
Date: Wed, 1 Apr 2026 14:36:29 +0800
X-Gm-Features: AQROBzCRlqVn0yjOqKCfvD5KjZcYp1d47UxYRV2Q16xVCVvSaRK-QkNWegSIWu8
Message-ID: <CAKkv+gy22MDTr9qHGahoiurLKDk6+Bsz5R38umwi_AnYoRXA0A@mail.gmail.com>
Subject: first post
To: sashiko@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

test post for sashiko@lists.linux.dev


Chris Hoy Poy
Senior Systems Engineer
Core Projects
The Linux Foundation
Perth, Western Australia (GMT:+8)
