Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94591E4BE
	for <sashiko@lists.linux.dev>; Sun, 26 Apr 2026 17:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777225811; cv=pass; b=RodOOiuiSzqRSdbdXqBgY0ak3wHN9TDrvmvPpvsANzmpGgdAjZrYN1ISR57FBBVvBFvZmJmlxZqQKQjE6oa919B4maE5qilUif3xHi2KMjB+/DDD3i95MPm9h/RQoxK/96j6MuiJJ1FeYDy5cHyArCw4a7kIg6bg6Vj6J75N1Ho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777225811; c=relaxed/simple;
	bh=7y3pqPrW0OYFbqlQedSAYg2w6cF4H1cRVc5pkM+0ZgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BmAXDLjWy/Qh2i3OEZDykDkIvyy9UThNLV9FehYiwt5T5qaBG3MSScMw4cn3Y88O9fL1TxystuHoPo16HRervYZZgs3pVorMhNSQinp9gBpC8Z5kfWS37WUU/UfW06ppG0Y12wJbdlEKGymY5yFZPzorUHnrU5E5ZZP56ZJwLMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ro6M0rcD; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ro6M0rcD"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2bda3b4318dso1160356eec.1
        for <sashiko@lists.linux.dev>; Sun, 26 Apr 2026 10:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777225810; cv=none;
        d=google.com; s=arc-20240605;
        b=RR3YTb39fLy8U9IaAQR4UoWRbnvwux+TOk4q0hrMiXrUQ1t1N6L6shN5hDJxr8w4KA
         pf2Fex9AmDS39m/XfEOlfSFn3pntzR2yOKv/EdMdj62jgs8VmvLQ7k/cJKipRhB1EHa6
         iIWWYper256ABI8Dhv/GhPEYSe0yNZ/qfEJVPLdm4zzF2hHvy7UhADlg8621eTKEGZUJ
         mQgYcBd1k1iYc2/Q+t8eC71fVACfP6XwzqW5SPA6fYxUNxAsNo7Mfd8I1uofuWwQahrX
         ulYQjkoRTYp0yyOG10TWVpPwAqEczXFNs9pXPJEKF1cO7QmihfNqCX/tUQLgnSqAgXZ6
         fDOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7y3pqPrW0OYFbqlQedSAYg2w6cF4H1cRVc5pkM+0ZgA=;
        fh=yFTIHQJn/CAkKac4ndSZJJEc6xtMZ+w+nOvh/l+7Mvs=;
        b=j7F9T3bW5eYazRLy0P++UYsBCmDG/DLNpsA+3Ihj9Qrc2pFZdCYfk+YVvzK95AeHlL
         wncs9ykhUrQtlMsP8neIESHjf9KNvbLG7PwqDsjZ1SWzrPyu6URJZDfmRqOf7WXQoV34
         gTTauBBY44Er5qt6s1LIX1jdjdO8MhXZNLCL/MrMq7y+GpXMxMl/S6xmdraAnXW3/xZl
         ngDa5n06qsD9RL2DQMup9uQUw2YPZFnlRWARXqfem/epX/0aiVvqsVyMAUr0FsHYqbNY
         aRO/tpZTHvsMAaa0Xvv+/td1bl+vQgUc2Hpoh+NLKpuGLQQGLWhAMNLCoBQt5vRIBU36
         7iDg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777225810; x=1777830610; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7y3pqPrW0OYFbqlQedSAYg2w6cF4H1cRVc5pkM+0ZgA=;
        b=ro6M0rcDMg+kZTvhpNS8nMXFPn9sqrZ9f4GxWpNPPyebv+UuGp8J8kYsH//bZqiKDL
         k9GPUnHC9MhZUVXOG+Py7ZzFFB4VIn6rSiokh8VqGSH1Oy27c+YovRkDqn6Vj85aVAJw
         lAzk0wryCnxnc3wG/buvZCb1KwWWxe7fPa7EehwbfdBj8MGI31edW7SfhZ5yfhxlce6g
         5Ag9u7IEEynk/BRoLvYjamQmXkobA+mDVRoJ3R/PuHKPqkR6qBycH0FMi+7Y4jKFtdAT
         F5D2/HZJ/pxe/u2ig/ff2xjPohwmuaIvbMLFALWqwlmCgPwscSqQLzF2iSnvbn00hfPS
         8+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777225810; x=1777830610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7y3pqPrW0OYFbqlQedSAYg2w6cF4H1cRVc5pkM+0ZgA=;
        b=c79ymME9DYXUpNweKQpjSTmTSyNmUsDX/PcbLDSdILn9no6kCwERqRqNRyjmcRKGU3
         /mSuhoEB1eZ5FG2Uuv2cY3bvVRg6Lkl66OXeFA/fQ4ewqsrBqDL/BmQou4bcRlpe3cXR
         Wsyz2JOrUxpqf0XS7iVMQ/NQSlyq/aunINFXeU153ReEVdo6g6tcMrFbpCgER4eTHWMM
         pAh2GxOWThAiGGCS0zXUxOJPVhYbjqdx+6jg/gwe4DdDv3coiVUhpvQXmeqCvL8aKlTT
         lu//JTopkwE/a+IessBwv1qd3cuZAQxuw8VtZBiEl0oevIfWtE/RubhU1xQCqx4Jy3ZS
         tokw==
X-Forwarded-Encrypted: i=1; AFNElJ/x8nKVZgXQCW1QM+klCb3ysREZtzzCK4leauzWjtksrB4fkcPl8OrkLow/LFib11GsV2rJae/k@lists.linux.dev
X-Gm-Message-State: AOJu0Ywe8XaAyyskf+EtsZR3YR6R/3wJKqC4WDzA+VvR/VYj2f9Z+pTz
	oOQAobjv1JZiKKT92ZaPkM61aIMUkMXbDDl47vDKPW3v/Kmhv9fM5NgJ9oB9cih3qbEceQykqcW
	OP/4ol4aHG8jl2gmpsmcn/bQpEiingX8=
X-Gm-Gg: AeBDieviIlEPZM3t7yEYJmFvJjPrItpz5riu41SvQFmKWLZLaxlPFXi/PN+OK29OUG8
	lN9k0oSRLqJws0ZJ4r3yfIfAXD2pfHMTjSEnXVPoiIIh8mxp9fsMloMF3bUsfXVp69H+CutED7F
	Hpm0WjM7mld0m4jucnepFvWd1Ek1uGUQ5OEBTdvepyqOqvbKww0YGXdU+fghd6gBOWKUo8yCuZZ
	b4xQpJdnLUkCj5e/ShZZGVlH6fwlF34Jh2hAVVwdDKvkjqPBvg/WmxYY1RCGfiZ0dQwV6708Kms
	edan1aDShMk4tAxenUIfLV2bb7mcb+jF4naNsYNcfuvTgnT94wQcfg6w+9sIpa3kBlmVfP+b/MW
	osRnl6q8WRHbssHN5k9uH8OFMC2Gz/MDE6A==
X-Received: by 2002:a05:7301:1984:b0:2d9:94b4:a1bc with SMTP id
 5a478bee46e88-2e479517ab5mr8317101eec.8.1777225809710; Sun, 26 Apr 2026
 10:50:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260423-synology_microp_initial-v9-2-4a8533f87e07@posteo.de>
 <20260423215810.3516CC2BCB2@smtp.kernel.org> <9c4cd34c8ba47f1cb432dff521382c0dc4717476.camel@posteo.de>
 <CANiq72mHAByf1E--Tqt1hbDQe2i4xtD0g_q4osX1ucGARTCkKw@mail.gmail.com>
 <ffc3c129b69992bc7be91ad56d5b3a13d760ea95.camel@posteo.de>
 <CANiq72kF5Ka_DZfJZgzs31Sc2y7gg8K+FvCFXb9NKKuYa3MzPA@mail.gmail.com> <CAC2333A-D7BC-4F4A-A892-2CAC8A011AB2@gmail.com>
In-Reply-To: <CAC2333A-D7BC-4F4A-A892-2CAC8A011AB2@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 26 Apr 2026 19:49:56 +0200
X-Gm-Features: AVHnY4LKnQMOckAx3wyGtw3FwJIecV_tf0t36oGoXWdwaKFOc2_cNhzqZgQmqGs
Message-ID: <CANiq72mMrReSR5_9NyFy6r2T7csw-EMbZQT_k9mjYgrRQSj1FQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] platform: Add initial synology microp driver
To: Arnaldo Melo <arnaldo.melo@gmail.com>
Cc: Markus Probst <markus.probst@posteo.de>, Roman Gushchin <roman.gushchin@linux.dev>, 
	sashiko@lists.linux.dev, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 26, 2026 at 7:32=E2=80=AFPM Arnaldo Melo <arnaldo.melo@gmail.co=
m> wrote:
>
> But if the AI is unconvinced that it is a false positive?
>
> Replying with a reason justifying why one thinks it's a false positive se=
ems reasonable.
>
> I'm trying to avoid the, sometimes long, back and forth by using a local =
sashiko instance, using corporate keys (will try with local models soon) to=
 reduce the traffic in the mailing list.
>
> Plainly stating that's a false positive seems to harsh and potentially ha=
rmful, no?

Yeah, authors would ideally still mention in their reply near the
"command tag" why they think it is a false positive. If they do so,
and Sashiko considers it still to be a false positive, then Sashiko
could still add it again in the new version.

I was mainly trying to provide a "as-minimal-as-possible" option for author=
s.

Cheers,
Miguel
