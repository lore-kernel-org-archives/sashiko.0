Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE633DEAC3
	for <sashiko@lists.linux.dev>; Mon,  4 May 2026 15:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777908409; cv=pass; b=pEyg1t2fDIwmq9h7hNFS7ChBRO4Lbytc7rpzbuTzhltBx3Ez6/6TxVruUD3JaaBa2W2ucgECHhLliN96+eJaau6cNU5q4MUUau7SswGWQEKvKgYaGMVq3+3LjBZ6My5y0IR8p3EM4MVaqpuQ53unmXBXh3B7YplwrRtsDKoOxoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777908409; c=relaxed/simple;
	bh=9kuhRo2FzyDeDB/f2HIMKjEN00Oze4XF5EsTLm2QQXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=acCsNd0P/ZioVLwGT7752+c5nIytGmiGW8uqsFPVy+ii+pwXBIA/Yu7J66Zh22QPFKqMHBfcUi0CIEwhdNwTJ1+qV3VzEJrPRued15VJTow1sV0Q4uauKB/dU2tBZvw+s07Pmj1ZHBqHECtfZS9nP2fjoZlQUU2hnOLzrXNzDPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YAOJ9VBs; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YAOJ9VBs"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso141035ad.0
        for <sashiko@lists.linux.dev>; Mon, 04 May 2026 08:26:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777908407; cv=none;
        d=google.com; s=arc-20240605;
        b=McU+AE+kGnMYzWMeEoUNXsTIO/FHIfA587Ahp+4+njkgRireFyx6Ur3pyCxD1ORsIc
         SRFB55/1F8HOh+MOifOGAPVyKMyGMNKzC0V9KSTO9JnFm88aOzbj9hWVK1MP2Fjw9Ybp
         Ug00WW+mKpCsitjSSSVLitD4+iinVTpm+9Dw5Ipk5Ohq4mO/kud6zduQcxAy2mAGC+88
         RnTVgFAZbCqOpNFqfTRB9REZtuHDxiH7gvS9BhQSX24pPSKSqf+8NnXoKS8jL+URdxJ1
         ZTYqGrDN6A/WipXJm7b6xkzDRv68OSbV3t4D0XdVgYqe6Yw77TSCWvQg30AUAMw64zaf
         38tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MVNGYuyQwowloAjO2LdpR0sLjaPkeXfjsZQ2ODRZb7Q=;
        fh=RAx4EYoAEHQX8CREJ/n5iCXuFT3ssl6UaSz9YrEw66M=;
        b=S2zZ+KRpITdqdLIeCjdGamdVhtHAnB/u0eJDlkvF6WSe8lJ57fP3tjr1hEu917kz5O
         VwLZ5gAz/KEHZpYMYr/6db8aOh3sbvXUHxw/tyikgLaU8qE1vc6M6//NzRxrmtfpXHsP
         hYkTV4rCgBsiDsQhYJZHn+A/joaejYVD2+UWsQDU2F4Tc8Rwj6Dq2/GHfVrvJ0SJ+rZa
         YAPP3SgoUAL1Eezy0iFK+CzLzpoSepDZpY8svAsv9KZX7hFLQyQkE1ShlFTrWTlafAof
         xRyPy5DnPvpu7xLkxU1SroZkLOaP2Wp0POqyGmxjFMoptgJr55fPe+jyCRgSrFtND0hS
         OmOQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777908407; x=1778513207; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVNGYuyQwowloAjO2LdpR0sLjaPkeXfjsZQ2ODRZb7Q=;
        b=YAOJ9VBsJgAE6S7eAGdcPrAwvkKEfDYHoIi0s01jQ/1IyPiXTZTlJMHX8PTqTGyTp2
         rnfrEhk+sgDX0TrQV80oSIeO0abuoKaSQOqrt8Y4StFMGT3LRkzfXcNlHgkyTBb6Cln3
         5E9fVSEr5yur3xiQrw14jq2ciR7IuxXzpqY2io7FDepWlYDQaPwEN1gbwNJwuYT/8Xy5
         GFJ9Ss276N8KIy9QYB7pCDWIa30pwtTEoeCxY9oBtYtl/FeXMSskVFSj/W7wvqJBIeJ+
         /Ph8/E2ZHLzSpm2u5Z8ePXt01Q0b7kcHbo8xB4zszY+aqLlF59bv2KtKvwgbYVgQiiNp
         ZF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777908407; x=1778513207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MVNGYuyQwowloAjO2LdpR0sLjaPkeXfjsZQ2ODRZb7Q=;
        b=CBalicgdHZtKqC/jXq2/0YVzv77ZBvBIh5ZiOZVhNRxysu73SqH+XSQUVjQRSQhLbN
         KeUkmbYYqLX6ezz7iO1b0mYpIBbaQWWvyS4t0/p0O5oelbPET5oJpIRQLXpiEiNA59kc
         vtEg7/o3sk8vTlb1wIznIw8la0GlavZmHG0yzIlL645V9RWsnNmpKKQnfZnD8ct41Qj9
         x/oy/n4WCQYzCm4ADFrxKYmZJv6Ua2TZKs5N8Wpbcz9L0RuZ1ifUT5Mgc7y0VVISFojl
         ehGnm0BdQ1hXNDjoXNM5sMmQnFcTWn8oDX8Rv4kiVoi6ThN4R6MIqIkPACWNkB/0k0UU
         fe4A==
X-Gm-Message-State: AOJu0YwNBl+WYESR1FKpuHO6uaqbbX0GZ5tHgNTKzZzs1omHKyR6dwfk
	nFVYyyUL7qMAwzmRD+dXo3A60OxMDRWuorBaCVCjyeCSt8sTNdsml1OPw00K5nJjGKYkB2FCce5
	WbEUY9WQvm1XFYrgzhefU2mmDDwpD//ID3orORp4r
X-Gm-Gg: AeBDieseXDoi/cn6uEBC8XjcENsKgD8lODW/iM78v857XkEbnoNdCcTHLDJb0R2gPDO
	xnisoB4j9/swpe3ww+SJRln+07C/cQHDYL5B3pPEn8v0aWf575P53PtNK4uJrGnEL8BHOn6EVZr
	NDhplzkB+q4ztGo4LO8wRZcW1x0tquBVEt8dIIH/80Kr87EamMIzWoMXqZN7nsm4pwLMHe7QUPk
	pkQOTSYA/Mij+poQb4kpGND3A1Go/arQVtL3iPdAmILrlDM5WOZBA/NoeslrlOI5Kwhb4pAIdsF
	CZFJi7QqgbhRCwqRDVxxD4YWLS/Hww==
X-Received: by 2002:a17:903:1a86:b0:2a7:87c2:fcde with SMTP id
 d9443c01a7336-2b9f5892686mr4609735ad.15.1777908406371; Mon, 04 May 2026
 08:26:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260504081227.2203848-10-irogers@google.com> <20260504105301.29676C2BCB8@smtp.kernel.org>
In-Reply-To: <20260504105301.29676C2BCB8@smtp.kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 4 May 2026 08:26:34 -0700
X-Gm-Features: AVHnY4IHluG7YJn6wbIzJuthvTjQOKDjQwRxZDYKQywpOY6yeP3FnIHR8raHaq8
Message-ID: <CAP-5=fUuqcGCgpZApHbqpP8hxs2Y+FYU2W=h1T0D4qgdhOfdBw@mail.gmail.com>
Subject: Re: [PATCH v5 9/9] perf debuginfo: Fix libdw API contract violations
To: linux-perf-users@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: sashiko@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2026 at 3:53=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] This problem wasn't introduced by this patch, but the open()=
 call in debuginfo__init_offline_dwarf() lacks the O_NONBLOCK flag, exposin=
g a local Denial of Service (DoS) vulnerability.
> --
>
> commit a6e339ae66465b909762a437f958cdaed424b666
> Author: Ian Rogers <irogers@google.com>
>
> perf debuginfo: Fix libdw API contract violations
>
> This commit adds return value checks for dwfl_report_end and
> dwfl_module_relocation_info to prevent potential segmentation faults. It =
also
> fixes a file descriptor leak in the error path of
> debuginfo__init_offline_dwarf() when offline initialization fails.
>
> > diff --git a/tools/perf/util/debuginfo.c b/tools/perf/util/debuginfo.c
> > index 0e35c13abd04..84a78b30ceac 100644
> > --- a/tools/perf/util/debuginfo.c
> > +++ b/tools/perf/util/debuginfo.c
> > @@ -42,6 +42,7 @@ static int debuginfo__init_offline_dwarf(struct debug=
info *dbg,
> >  {
> >       GElf_Addr dummy;
> >       int fd;
> > +     bool fd_consumed =3D false;
> >
> >       fd =3D open(path, O_RDONLY);
>
> While this wasn't introduced by this patch, could this open() call cause =
a
> regression by hanging on a FIFO?
>
> If the path originates from user-controlled sources, opening it without
> O_NONBLOCK can cause the perf record session to hang indefinitely. Using
> O_RDONLY | O_NONBLOCK would prevent this.

So this review is bad and based on this prompt:
https://github.com/masoncl/review-prompts/blob/main/kernel/subsystem/perf.m=
d#file-io-safety-on-untrusted-paths

I'm trying to get the bad prompt removed. The prompt was automatically
generated from fixes commits when we added O_NONBLOCK to address build
ID reading hangs, particularly for data mmaps during perf record
synthesis. We now avoid those hangs by checking for a "regular" file
with stat. Therefore, the advice regarding O_NONBLOCK and EINTR from
the prompts is incorrect and does not reflect what the code base does.

Side note: this is the only Sashiko feedback on this series:
https://sashiko.dev/#/patchset/20260504081227.2203848-1-irogers%40google.co=
m

Thanks,
Ian


> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260504081227.22=
03848-1-irogers@google.com?part=3D9
