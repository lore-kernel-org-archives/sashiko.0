Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3043313E34
	for <sashiko@lists.linux.dev>; Sun, 26 Apr 2026 14:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777212309; cv=pass; b=jwIAc/mGgneCuC2EBgKAfrocTAIGuDtOnSNnGX8ekvJZ7DlGleYityaT8sWxYbdJtC5+STOtB4dVXhixCcqeIt6WjwRUU7N4uzJozX6TVxITOjrHRgJEci0L6tmbi5oc4DbQObdrffMog/iy3J7GfirI9SqCr49lXdyDeRKCMm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777212309; c=relaxed/simple;
	bh=nFTdWmXK7QWJuXTNYUBxrEkx33TZprs7izWgPTTdO3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Blf3klwLauX27Tc7enLg75M/+1t0h7NIu5qlsAhAn7XQZRJTUOr/1ltvvkYBbnlhCtrTdcFj6A1VWMhcGEThGX+pKIpkala+5EnvvbuNtrI44I3uQTkl7fD1Op6g0ybTljapkWKgTnzlqBNzCBDQRM1yUArZ1Cpm4pyH3QD0yEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=czZpZJQp; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="czZpZJQp"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12714f01940so681244c88.0
        for <sashiko@lists.linux.dev>; Sun, 26 Apr 2026 07:05:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777212308; cv=none;
        d=google.com; s=arc-20240605;
        b=hyWbsvx++AX0hYXHLqCNFUPcEQRXZ+2NKXdAckPR4tMgymJ5kzBjOUPDV7Ijd/f+76
         H9Hvc3Oqk2OjC+ASRc/eaFFwpxVG2t6N0DIdnXkzNdaiqu8d/QKKPBpChNfR5NJsFu1i
         Sgo0Tu452vu2/TKVCi2KNSE12ic6lsw0nZbdnnnNHrZ6Jo4UfmiMRV/5KBZFh/XMetqK
         yZvl1a6WVMblO5JBPfy/VlcGlrCvEkHfbRK7aKHkX9BmZao4u1j6nBhP+96O13OBFewK
         uRUPzNSvPCHKl0uCShNKZkq+FRYlnnvFwGqFvVk7gkVBmJ/dy8tOejDZRyRWMNWj0XvL
         PG8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jo+1bI6XuiLTXgwfNDEoczu1PCjUQLKPC1K8AUhZzs4=;
        fh=FLYZYJxOLPvsv96D72y5dEadSCW/WyB2QE/ihogt70U=;
        b=eRWCJM1BjiFJRgGHFpxNOKccHd40R2aWc4EP3/RA3+1iXZpI6bUctDhJQzUhhv6m0L
         LmUsffx7YZWdiFpVY/7Dro5VLGQaEDPsStxP3XBZp6V1AHg6mm8xK9KD3Z6PkPZER4mb
         /hNNWbeIUyOPDDmNmIAYjhIMkASpKbIM5kqnjMGejtDQx+qXfDXl1w5n6ky9usKujpTG
         b5ku2IACGAxcSdXT5VriGX7wVr70rjpnBE+rH74QmDnA2+9mJw31zGGnjNJ0PKr+TXJA
         18Y9i2LWxbY4bRqO/lpFc4HoK/MolgP2xE2oGqTxS+XQ7svf+g5wZt9m0x9UVtxV2BXR
         L/Jg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777212308; x=1777817108; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jo+1bI6XuiLTXgwfNDEoczu1PCjUQLKPC1K8AUhZzs4=;
        b=czZpZJQpDRLhmz//KMKGU9nFrFgqn0FHusz6ESINsqKspcI1GcXnGE/bzZqPxn9Ekg
         WrRb60qa+iEUYp0jzMmfsoY2tUt0Af0/93u0cPG31vQ6EqHu1FIlJJyyCO/eGtqFTc+z
         55anq8TdHnRozBkkRWc/E13/SaIuarA3D8K2NcWkjqIl32RBE/pi4mFWm9qObCoGrKl+
         PtjlOGhIrUu0LDLRj6PkD4OCwwXuStBkf+joTraOMDEzoK3yCeioSlktej1f7pKD83rm
         hXmbt1dZtGdfzAvuSn89Top3gpKAEEN1+IBaGsViX/70+cXLtiZqpRq4EFUJkesJJg8Y
         JgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777212308; x=1777817108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jo+1bI6XuiLTXgwfNDEoczu1PCjUQLKPC1K8AUhZzs4=;
        b=oOEq1e8t31auJ2qkKshfH/wFdAcHVATq+YF04Be0IOr5qNgo1fTXurWdKHgAEGV69v
         zepyVdvVkRo/BbadJ6NVpCk/f5h/twjNT8KxivRFVw8maS7pQJkJgeESh+2iMnVWh2NN
         SFB3Z5PM+Rlzn/HLyF79reqED/cAscTaO+pLGE02rqywHDY2R4zETp3/na9w5BZxBeMS
         O6qFMmMdQ9Q/h0xkTa++OjswZaRvKCbdAbJUrw1RIQT5fGLT5ZSzTHi/yOCeo6nA9Jai
         I3HKRX++Gq8tkYg0Y+f+q6nEQn/lPeJg3VvwC0B5Mw3nHQnchKGeyWwAFlFYjuU1Hgwo
         tFIQ==
X-Gm-Message-State: AOJu0Ywo+un8g4C+HNkZaSIUScxHRA6CDgReFhWtGTI3uhlSUMqUaY/w
	lNm51jtSrr6aN3Dd6nT/mInCcOZaObMIqGPkx5CivWUyrtwySlcsK2LuKBfjugpDpjnTdFwb/Hq
	mIaecrNZ9vo2M1gJimYPpjGO0RwpfjY7sW/cV
X-Gm-Gg: AeBDiet8g25UUeuNis8xM/DjDiP4xBdG3f0utQJKOk6ob6V1mv52XLGLNoKQ6gDAUPd
	YO1TAqcXTuatKoTJuFBbrRvVu/TwnzGqMMXv1SpueK2ObBe6N3Ug8QYAQV972EWILARbCAHlDKH
	c1/tK/vhbwOGZoNjJy5AXdb1st2f4C5QR0+HZ6Yfq5Jgk+S23ELrDuKDdllzUWwKA+g6nVfOl9h
	Q7R2lx313rWlXNz3wrdT0HHq9QUgBWC0I0HQF1lDBLmj2CVS9JK2iPPs+Vhwno6i5pL1TQrRCnW
	acqVAr7ffZ57BhsDj8LHvsFPogi5B8SUMkQBEjXSRMtQ81Ry4fiFofctkletKgm4Y1YuzGFHORm
	t6CR64MkXlQdM12aw9WS6N2eeohhmdRN7Yi2Nb7T4TDrU
X-Received: by 2002:a05:7300:bc0c:b0:2d9:6373:ace6 with SMTP id
 5a478bee46e88-2e479e0cf48mr8008813eec.5.1777212307629; Sun, 26 Apr 2026
 07:05:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260423-synology_microp_initial-v9-2-4a8533f87e07@posteo.de>
 <20260423215810.3516CC2BCB2@smtp.kernel.org> <9c4cd34c8ba47f1cb432dff521382c0dc4717476.camel@posteo.de>
 <CANiq72mHAByf1E--Tqt1hbDQe2i4xtD0g_q4osX1ucGARTCkKw@mail.gmail.com> <ffc3c129b69992bc7be91ad56d5b3a13d760ea95.camel@posteo.de>
In-Reply-To: <ffc3c129b69992bc7be91ad56d5b3a13d760ea95.camel@posteo.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 26 Apr 2026 16:04:55 +0200
X-Gm-Features: AVHnY4LC_pK-F61sx5jO9oAFR1mvrktsqc2Xxr-5l_j44KJcQUExv2s9p0D_h-A
Message-ID: <CANiq72kF5Ka_DZfJZgzs31Sc2y7gg8K+FvCFXb9NKKuYa3MzPA@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] platform: Add initial synology microp driver
To: Markus Probst <markus.probst@posteo.de>, Roman Gushchin <roman.gushchin@linux.dev>
Cc: sashiko@lists.linux.dev, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 26, 2026 at 3:44=E2=80=AFPM Markus Probst <markus.probst@posteo=
.de> wrote:
>
> On Sun, 2026-04-26 at 15:37 +0200, Miguel Ojeda wrote:
> > On Fri, Apr 24, 2026 at 1:59=E2=80=AFPM Markus Probst <markus.probst@po=
steo.de> wrote:
> > >
> > > Since this is an AI reply, I am not sure if I am supposed to reply to
> > > it. Anyway, the answers:
> >
> > Up to you -- some people is just fixing the patch and providing a
> > changelog in the next version. But it is great that you are taking a
> > look at the report! I hope it is at least somewhat useful.
> >
> > We may eventually just send them to the mailing list like other lists
> > in the kernel are doing (in which case replying may be more useful),
> > or we may disable Sashiko completely if it is not worth our time. We
> > are trying to see how people feel about it.
> It would be an improvement if the bot had previous replies as context.
> So If I reply that the found potential issue is a false positive, that
> it won't appear in the next patch revision review again.

Yeah, that could be nice -- not sure if there is such a feature or if
Roman et al. (Cc'ing Roman) are thinking about a feature like that
(especially for lists that send the report to the mailing list).

To avoid using up a lot of context, perhaps it could be a single-line
"command" in a reply, rather than sending all the replies to the LLM.

For instance, if someone writes:

    > Some lines written by Sashiko...
    > ...
    > ...

    @sashiko: false positive

then Sashiko could grep for that, pick the lines above that line (i.e.
the quoted report from Sashiko) and give just those few lines and a
note that that it was considered a false positives into the context.

> > From what I see here, there were at least 2 non-trivial true positive, =
right?
> Yes.

Thanks for confirming! I hope it was (is) useful.

Cheers,
Miguel
