Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDA01552FD
	for <sashiko@lists.linux.dev>; Sat, 25 Apr 2026 01:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777080345; cv=pass; b=rfbqvxO1x++VJ0ok4Zrzgf5mtQ6X5JM3OXyWOLNGQJ1oDFBzGFS52iafC2RCY+ti8VYawBB6ITMkk0eSz6BXi7JHvBIGwJ86JTjt3pU40tTcEDwPHX28jNrR+tZXxGcvKldD2sfR9M38xbDe1ntIsztQGPKyeWsLLnHhRw9OpEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777080345; c=relaxed/simple;
	bh=f3WxHZbtknKcGnI7MqHVjqNi+RSh4xlbtwQn4qUCcbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Db5ewJ9r9557qceGea9Viui7zx57Pqq4MwGdraSoEZ0MbZKpeQziKPVEUXanvJxcR737WcmdwTGIP76KI0lFC456XwmJ4/N0/vCamblJjfprGXZrXVQcNkBSlUf5lRHVxgkYXOqWPJDrXS86LmrKWoXgM2vwTrdboZWe5DuP3KU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mtvv9+53; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mtvv9+53"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so107851105e9.0
        for <sashiko@lists.linux.dev>; Fri, 24 Apr 2026 18:25:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777080343; cv=none;
        d=google.com; s=arc-20240605;
        b=YELtgvzuhgnYNNSZHF9jpag9W2QKCAS0mSxVHlqby1tktJjb8R8bxf97AqFr1hEN9L
         DsDFkcUQbcdjk89KT8DBe+1tfqJnGJEJIWsvKVg4WTFs2CfBOzvsshyGegDIMZ5K/4V7
         8leN9ueDbR1LWJ+izFPbj2AmNpVC9qruUFq6iTmjKICnMYlX2l6NdD0VSrwUg2tnCvUv
         avgtMPYDz2fCAH4BlIU3MlEQlTD/snj5Loq8Aod/AkmdWfDKq1w3S1gtam9OGrYu/dA7
         fj5hi73C+SUrfACbru9/2lkmH2YmlsMyNXWEtm9Q5TenawJNbsSYI4QMKkRUJ92kPVBv
         vxrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ca/F5kJ24z9kaZckQtyAE58YWNbnN15FN51lqLQH+dg=;
        fh=6jAZCwCb0wk0XryB5IsHORzFHzZnUZ44mjzC+X7gNx8=;
        b=Bd3lbgJZD54po2IRJV05Zfd/iL/Vt3On2ojFyzwp/E81QtbtyfyCIUZflOzJfUcJJG
         fMhb8Rs7aaX8zwwmczjWFZ3yZSOe21/K87bxaLb/U2QgNsLv9JrmhBOqXWKqEuUooPKg
         zAQM4fceTJ+0sAecqLBqA8EV/NCRdsiQtJSZdv0pxVR5Qxu8WHdVRlmgQfpEGKdK7oFe
         AWRmDbp7GAzbLdlev+xXImF6/6iDA2jipmfGgPpTy5DKIbAeGNJ/D8IOp31MO0LXavl9
         NKCFmeOXUvtV02bWoknGmWlUN5ZAijTbUtsmj20nfANOOO4P+74YEa/3o7xvkdcdHAn/
         vR1Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777080343; x=1777685143; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ca/F5kJ24z9kaZckQtyAE58YWNbnN15FN51lqLQH+dg=;
        b=Mtvv9+53QqBju9+NZZ0golSIOul8TVEE3MpKKTvyjuegtT2bRTlJ5R8j5uoAyZS8uP
         y1I/7/+TVlVSC7JfcvvMdCfizeaYb1WkCm9uAIsOasqhMDzGUIwKtQoKvJq+kZuw7Gce
         eHmKxzggJl5kUVYku1U77LHH4fKXBhY4npd6pWBBMpKmj4vKBCsYwvRMBP8+dQkYzl/H
         6UnJ3P0rO4bikSqvFxIHBT3WOIqSEs188e1Spfj/p97mFqOp2kOag82VDQswVYRjgE9z
         f4MgsHcpjFlPkjaQRsmg0zZm9w4TXV5ee1lJM38o1ayr/Am8TaKYgm6HE1r4ltBKnPP5
         wY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777080343; x=1777685143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ca/F5kJ24z9kaZckQtyAE58YWNbnN15FN51lqLQH+dg=;
        b=nj20FTKowKmDh81DIfOr2QPYUrDuykFMoP1EyFZ08IkLa1vT+faox1i+KwbNgBtm49
         f3Wa+I9fNTs8i+Fpl1uZ7j7CYEL8cwwBjq5WaW+WYic76L9lhfxjVxFtY06vwTT1gNPN
         deVvMX4mo0FQ52NuqDkLPEzk20Pi3VniJWHrPVXbmHc22DNpauZOsZEAJuQOA+z5UQvc
         r0zjlFo03PzOdPJ23m69qO5UED9Q/zcUL6OxBOftEX/3+ostG0gKRLmQzhjnCJbVQ3Te
         b1xI9lKLiwUSjbWc7IIE6SmM7D7+n8e0LOhrGhPiU0+BlG3nAMgaMEbex1pd20bT4QLk
         d1Ig==
X-Gm-Message-State: AOJu0YxLaFpuhZ7A82Snuvbq2xa5lsCLnzoV2x4goEwwSUeeV9hFCxmw
	KwHVOdgAuO4GSvvoqtfLflrlT7V3ZeOPn2I9AdwularRBa2fFyq6/AMBZ/JMt/uu85RaXT3Vsx0
	XhV+FjEtkJuwUYRYKAolKEVBwxchcwGw=
X-Gm-Gg: AeBDievVBs2hx+/ny4TCcpIcfuzVr2bEVTpUITJTYpzF+t2pNMq+xMo8yWtTrMXh14O
	o2m42K1sjiC7V3nBaeRk9seu9sAHCY0ZTmVEuNeetpn8oXaliiyMnVHHYNhRzPlh6d3cVnanyIi
	mDkLgvaWnaulHO/dyZaYCGPuxnttHlXg//qIqZtG+0G4b4BElG8pa9JxLH4MZ+hPSUYCi+yYg2N
	P4J8cp05Xx0uHLU7BSqGaigPc2tDLUCBgvoGPh38Tj0ahiCQAVoK++vMyHaFLIBBhAm04yjzzLG
	VJUyUs220itQbTcfDeFsgye7tyeYk9/9bb0pkXAfDB2DGjQyXGfLKM1fBqgmz6idSn+6bDqqu9W
	Omtr6C+OGvnXSGsXCfEOuEJGzfauhneWNVuR2
X-Received: by 2002:a05:600d:10:b0:489:1b0c:8b43 with SMTP id
 5b1f17b1804b1-4891b0c8c48mr292125135e9.1.1777080342596; Fri, 24 Apr 2026
 18:25:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260424192252.695240-2-utilityemal77@gmail.com>
 <20260424195958.AED4EC19425@smtp.kernel.org> <aevOssMWH_Vm9CPG@zenbox>
 <CAADnVQKFtuX48V9Yy88GHGVbQyY30M3b3YBvZ2PmYt_-jbohpQ@mail.gmail.com> <aev6zU2vj6wmaRMG@zenbox>
In-Reply-To: <aev6zU2vj6wmaRMG@zenbox>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 24 Apr 2026 18:25:31 -0700
X-Gm-Features: AQROBzAPgjjGtM28-9ZKZEA39SZlZvWxxoiVowyRrqrHZ6VM3m1ED2bg5H_9P4A
Message-ID: <CAADnVQJEXDh6=rKfUjuR_zjCcXfMAXUaXcXTWgUAx1-mWe_e-w@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 1/2] bpf: Implement dtor for struct file BTF ID
To: Justin Suess <utilityemal77@gmail.com>
Cc: sashiko@lists.linux.dev, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 4:20=E2=80=AFPM Justin Suess <utilityemal77@gmail.c=
om> wrote:
>
>
> So either:
>
> 1. allocating memory for a new irq_work on the fly, which is an
> operation that can fail. So if we're under memory pressure the
> element never gets freed.
>
> 2. preallocate an irq work for every element ahead of time.

obviously that's not what I was referring to.
irq_work is rarely used directly like that.
The common pattern is:
defer_free()
{
        if (llist_add(head + s->offset, &df->objects))
                irq_work_queue(&df->work);

but before going there.
Please enumerate "other dtors broken in NMI".
What exactly is broken?
What is the sequence of events?
All map types with kptrs? or particular ones?
