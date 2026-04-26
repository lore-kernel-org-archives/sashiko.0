Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CE3361DDC
	for <sashiko@lists.linux.dev>; Sun, 26 Apr 2026 13:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777210646; cv=pass; b=J3WcOx1YJxreoi8suKAorxhEbJjFDp1Zq5JEbKQ0fTdljClSOffj1hGR1DAHsiDDMEV5AZrmjGDelrKStGuhT2Y16xabp21kWwGhdZ4bE5steTB+4w8k3kjzpLuvUVkAd18ZnSTkdZDYUlAfYDD0G2eDO5OhvfjotknK7tNxTEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777210646; c=relaxed/simple;
	bh=2scgfetZ3qc9pIdbDJyHHdMzPMGZQsIVyA11ZKVDqPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BmmV00osWWbEO/DGn3jqNHXoFrNtFM6WorNd8jP9Moqn26osyNwIouTPaIFsa73238IJDnIEY9AxCVsPPYKek2CKPX3VDIpEPTOrGx6yguGnSpL8v8xR5IPYq5jW+jGvoo7XQGRHBb6tBhUJY1dzTsBwrrTjmlLJXRNTdICFh4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ue4EmSmg; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ue4EmSmg"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2bda3b4318dso1146990eec.1
        for <sashiko@lists.linux.dev>; Sun, 26 Apr 2026 06:37:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777210644; cv=none;
        d=google.com; s=arc-20240605;
        b=VhNFNsSXsDpHvtCCxbWPAlWre1ovsHHRwDYMasefQ8XIzSfso+06LuUM9j9C+qH5gD
         /H/EjROC6Q2G0COaXZcJRUO8C20YotaXXSeSacANl1mxTyGEJ6I2zgvyQ6EULwh9jT94
         3cBYJbYK7doaKgH3ecAlrTgcuySrABPmV7LL5rzZSCnmKSf+VVET5cQZ84QJqot88D49
         JJgfL5kukSt2zsCz2EzkxYRFLvS4aH4TgS0YPITHzm10yaTYV6ZQA2ugrzHWhvhrO2gY
         IdzJU4SZa+LPIPUXrYRnbR+bxh/NyFNB8pM/Jizrk35Gyj55UCh6x2jeG4+DTR9t/jAG
         NnqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2scgfetZ3qc9pIdbDJyHHdMzPMGZQsIVyA11ZKVDqPg=;
        fh=+GlR1flvvAW/6W9Wu1UQLdDiT3t9Upvx9GjLrfGuF2Q=;
        b=QsCR0AX2tMjucE7yrlQv/DHc1RPzVrzK4WVFou7GMcQaYzYj0obs8cxcJOU+KB4In4
         +XLB9jEB/pE780iFhopZLRDwm6f9yF1M9CU35Ghn+234vVVzdFwaTP17n3rHiOo9SWU+
         RxWAgWmXrdXNZWpEMVp7HrWpzguHDGpgJKEQ5ofeAbSX5qKdJaHrzeSRdo2S/jgCe6h6
         lQD9vmeiocx7IlGu4+wWq3BblY55XoiDqgGVkiSADWIEIHUd1b0dEjK9SFF4GGUs76aE
         I+rJRY29rToP9i7stfMNiJqHHA67Cqx1UtcZYew8xr3XG9IJkYG0DrkxF0qWSx1HjEWk
         V8tg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777210644; x=1777815444; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2scgfetZ3qc9pIdbDJyHHdMzPMGZQsIVyA11ZKVDqPg=;
        b=Ue4EmSmgw68ZtUq1QKEDj/ftodrjPx5jRdpqbIvJDHFmbLiNlKqnXDAj/57ypGUBYa
         EF1lpXBnkdKjlbnX59E0n2r659peWb8/bhPT5nEXITdfOZxR1qYkOKYNT6l1zwmAYTne
         1xkw7i7seu4dsHSG/53sfoEiXmt+h+UI5Vwz9a+Ql+wrMCPCY7nXKI3FYKoGiJ05pazn
         MKb85fVtM7YrYcH9AQ2SK5YX3wnmJnvoRAXp9xiZDZCre1u18bmvQCTRCIZTEXwzX8sm
         3/EnvUis3llEIshHYNuvHkkYKK9/ZuvzOcbIm3LjO3iRIohOz70Wu8p8KJeoicXDTE/O
         SVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777210644; x=1777815444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2scgfetZ3qc9pIdbDJyHHdMzPMGZQsIVyA11ZKVDqPg=;
        b=RZGoYeoE7jIFFm6geOEA9msRDez924zqEpYUF2MsZyNu8OLiTEp6f50kVMXd5LZk/h
         P4cTN/BCdqrUBfezt31mpjwi8y4SnVzvrfvTKncywWxyDc0yEE6dofdgS6AsHYddINAv
         xfWdkYGg332Y6Wz66OcsXP9srNgFIo4j6qSI0N8fKhPp8BxBZwjZ8LptIermpao3M09Q
         X/M3M34ZnsWrqlBJ3A6jjHwpyc+4QsYEr5ppgZiQSLOZDdQ69R3ygIYL6TW6zundU6xc
         BmqbZ3BkGOUjnf+c6O6J8QNjoZBYo/T7y0p5T9Y/IxTVxEBLLtVam6hDuX5THWXWxAs8
         aTJg==
X-Gm-Message-State: AOJu0YyHBZqP9Q247JSnisU/qZ3ccMFqIRrdK7+y4SdS7vVli8PGDPqR
	nPi4Skrk1RkXQZN4OAdY7DInngXwdt4bsSuKXYW1F6Aq+0FNm6giEd7vpFMKAISH7+nGH6oPL3C
	Tw1UN4V0/WqBdI3oF7WhVEfqdBCqZtco=
X-Gm-Gg: AeBDiesyDalNI42RiRQdmSObvUd81pQDouAbuO7RSS4PkGAibeTaWyHKPRrj8uNaDGk
	1XuoHGXe+cGI/U8Lj2BzadKvCdOk1Eu/8PyZTI9NRlhQd3e32zIRQqXZ/dQ3nNhEaA3/8PdSbJu
	hX3v69thd9TfT+m0H4SPvWEThq03cHp+oDuOjQ5JTARRZD7YvfWVW9AJb0aQi6i4qlm4UlBxBCS
	bPOtV7yx5D1EToP/SaTkLjzW2wMPjD9JIY/ZR10Z2Xm9g6m3eIQ8oYAaFg904Ev5JrbT5+rfLQB
	kn0RuOddg/TpfX02I67YCOW/A35Dp0cNF3XytbpGkGxkbMacwiKynKu3P9FEIKLrwAp2x1zmNGS
	Z0fBVr7NIXkID5IZAVNURgSPA9Yu2KSr4wo05x6Q9TW/a
X-Received: by 2002:a05:7301:3f07:b0:2c6:7f49:a840 with SMTP id
 5a478bee46e88-2e4650a1dcfmr8414269eec.1.1777210644108; Sun, 26 Apr 2026
 06:37:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260423-synology_microp_initial-v9-2-4a8533f87e07@posteo.de>
 <20260423215810.3516CC2BCB2@smtp.kernel.org> <9c4cd34c8ba47f1cb432dff521382c0dc4717476.camel@posteo.de>
In-Reply-To: <9c4cd34c8ba47f1cb432dff521382c0dc4717476.camel@posteo.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 26 Apr 2026 15:37:11 +0200
X-Gm-Features: AVHnY4K59Ee1b-ifgU-pcpSpv_f_DKLqMZQqJDrQ2SSmHybxf66hQNHxkbrevnM
Message-ID: <CANiq72mHAByf1E--Tqt1hbDQe2i4xtD0g_q4osX1ucGARTCkKw@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] platform: Add initial synology microp driver
To: Markus Probst <markus.probst@posteo.de>
Cc: sashiko@lists.linux.dev, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 1:59=E2=80=AFPM Markus Probst <markus.probst@posteo=
.de> wrote:
>
> Since this is an AI reply, I am not sure if I am supposed to reply to
> it. Anyway, the answers:

Up to you -- some people is just fixing the patch and providing a
changelog in the next version. But it is great that you are taking a
look at the report! I hope it is at least somewhat useful.

We may eventually just send them to the mailing list like other lists
in the kernel are doing (in which case replying may be more useful),
or we may disable Sashiko completely if it is not worth our time. We
are trying to see how people feel about it.

From what I see here, there were at least 2 non-trivial true positive, righ=
t?

Thanks!

Cheers,
Miguel
