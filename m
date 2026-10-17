Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E543A48E2
	for <sashiko@lists.linux.dev>; Sat, 17 Oct 2026 18:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792261250; cv=none; b=uuQRUk7kBdDPcnY0ws+l83fcGMscRGILOlQRYPjjYNHkH4KzxwdY4CuSPN7EO1gCGTzkWO4rFbU2zc2sTIhpDb9gesqEq+2YMVYJY6OIJNpq8c1xNfheqwoaX+B45Lqp0nR3beJ4bBGv2yn8ycjVvjKWvHFvRJnDKco1XsemFQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792261250; c=relaxed/simple;
	bh=Vx0sLcKxI+wdL/8+ejLdglSxEP7File0MPygogAR3FI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=HD3PmVZoqBiul1mtoE2a8a73U4yhGY9K+trdXr84QEMUmCmNSB/lDyS+cBRwjSYniDMqySVT88XV3GNLBcaBbJobZP4/Ohz4h5dRvObRHcYT4hOvoBVhLzTXKyAoBB47FaOkGvwkJzKCTfuX3JbivAeYxeQ0L+saTTYejoZoVeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EEswQQlo; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEswQQlo"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so724560a91.2
        for <sashiko@lists.linux.dev>; Sat, 17 Oct 2026 11:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792261249; x=1792866049; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kv/Rond6Hfrg9YdL871/kyjngk238SfhghDSvEBnF0g=;
        b=EEswQQlojIBux3bgXLZPiSAzSZeel2i822MRIWrLUFApwUxxe73rMXwv9PpHFL6Lv0
         ZSxrX4tedKQBBRN7RHsO6HHGfZPjC+vavpB0wNx71jLtKPTPxnKz31dUxvnsJYa7vLBv
         Pm54wOilMK9C/sToARToeKHGqvHlx3zAzrm6JcVfPcTSHyIzCVO4bLpJd/YgkvWueCOw
         lXFaPfmup4OCpdMk8ysT/QWW7OJeEcO+6GhaNk5+i0Fk6ZwXGNJpRMiA2EbA4rdKXQ7g
         5cb+BPG7izMxPaeoQnFfPDvvBopkV3KNmMoZHNdY9aY70w0EQM0M13JSHE7Rc5wCA0pc
         AomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792261249; x=1792866049;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kv/Rond6Hfrg9YdL871/kyjngk238SfhghDSvEBnF0g=;
        b=oqKdKAyblYKcW/568IhYlcwUNSgxroYC57G/aXsrJ9b2/XJexL/b9FHPzuSkDABOyu
         9N79GZUmUkQ6CuiFHTUpGvHDQQ/8JFuaq5BlHR/CEm35DqptTLe9zRe3KLF/9UJrGXv/
         YgBY0D82CKO7rS9QQc99x8xM9aNI6pti1HONQpgv/ZCRMHyqU2HERuh4BVtvYpGAth/L
         7w7VgUnLQDEiCPtUEoH/TQa6syTHOphJj7YMbzoUKWErGwASFcDSdOfb6RTGzlP9HbOV
         xG8NcIQdomGS/DE74ihSXxz+lA0dbFqnRlebZjLD2XixrWn8q+BkBttpjTrAFUUlkiWX
         carQ==
X-Gm-Message-State: AFq9FYKU880424BYIdptNTDZl08LDOW41PyhLU3+rNpZ4Jhyfp8oqlhg
	4gkF1ViSbqp5XLXfTPJs9Xq71OFWAssKSwjeR/4S+p5lOMzKFcBYKyLx
X-Gm-Gg: AYBFou1blqRZ2B1Cbm4kCaVYdC0Ti4LYnDgoNdRZLdwE2s0zClUfY0d20brDeN0Dtt5
	gV2VI4W97SaeL5CF38WYJDwAn82F6ze8pfDJUX3OW+Iw74JBvv1c/ggJfbuRmiRQL4P3DQOZB4W
	oEogjtgHfCiJ4GANBQtDnp0ojDPD90q8qmIukXSl3M29n1FnFZpDuY38LrtHBMjiv2CQKmH+7Ua
	oe9urnEDKSvOMJiEpHepsb6Zn86CcxarpbYS078KsRD5UgM0JA8LLhdEit0GVPdYk+Z8SFN4uwh
	AvhlRBnWcl4GFTcrxXqkIujtH43ytx0DAIJBNkGina1O83+afNyYMTMKCVZA3twWlIgeqZzCC4k
	x5TMhImbp5P+NvQvW6iKfpqiUjP957afQanIDeOYS+rP8jOSYZQFjIt25ttIEcmZd/UuuUOMNjp
	UGMeBVhvWIowzgsbZuep22w/Y18CptdpUR/5x6Qfua1ygYa1Hkthx+hNczxwAVIW8PFSYwWsK+W
	bjvexhM6veMEc/o7m9WFledM+YoLkN0R/99clveb/qlqNMXryryEP+QufuZf73/kS9rulSofwNn
	Md7J
X-Received: by 2002:a17:90b:3b91:b0:3ac:bfa7:b079 with SMTP id 98e67ed59e1d1-3acee97ab0amr2903428a91.7.1792261248855;
        Sat, 17 Oct 2026 11:20:48 -0700 (PDT)
Received: from localhost ([153.61.198.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947d2706sm14054526a91.16.2026.10.17.11.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 11:20:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Oct 2026 18:20:47 +0000
Message-Id: <DM7BL6J0WCXU.1I38BKL4RJLFI@gmail.com>
Subject: Re: Patch pre-submission to Sashiko
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jiri Kosina" <jikos@kernel.org>, <ksummit@lists.linux.dev>
Cc: <sashiko@lists.linux.dev>
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>
In-Reply-To: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>

On Sat Oct 17, 2026 at 5:28 PM UTC, Jiri Kosina wrote:
>
> [ in the spirit of the concluding discussion at this year's maintainers=
=20
>   summit,  I'm using this list outside of actual maintainer summit=20
>   planning :) ]
>
> I have just received a v1 to v11 patchset submission within roughly one=
=20
> day timeframe.
>
> Neither myself nor anyone else did comment with any review feedback,=20
> except for Sashiko. Which I believe is what triggered all the immediate=
=20
> resubmissions.
>
> I don't think this is sustanable.

I think it's just fine. I encourage developers to keep the spam going.

You can simulate github style squah of v1->v2->v3 in your inbox.
Ask your agent to monitor inbox, archive vN when vN+1 arrives
and summarize v1->vN discussion. Then you'll always have the latest
patch set to look at and a summary of what happened when you were away.
Then sit on it for a day or a week to see whether respin
cycle has ended (and bots stopped talking to each other) and then
do a human part of maintainership.

