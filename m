Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C36D224F3
	for <sashiko@lists.linux.dev>; Sun, 26 Apr 2026 18:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777228028; cv=none; b=TSOzGJQlC6ybN8lszISRjYbYu9lyXKOnhyq78Mfskd1TMvF0zPyfOGtqVGDPkytdB1CVTqpKZrG/EbeLxsCOdtgJtHwLWkQF1YrnuCpSzdsRP6fP9uidsmE77ByTuCRYd/t+S5LU06Iv91IGY8RBXO/TK7uebE+yxsmxnvZH6CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777228028; c=relaxed/simple;
	bh=ejmM0MTfwnFSrZf9ICwBc0jJzudL2BFEOTO2F3X+M+Q=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=tZmtXuFcrSCAAoTNBLMv2YsP52NsiDB3bmq2Y11ZNOanQJRCBH3M+NgyGt62SS8M3KH5q9U73LapGUQjnzhbON3KPuqxp55Hf0lbooj25iljqn1/N8rF5mWwx7Z3p5sXGGKigRVyGKSqBA7yv3LHNSmoyBTorRppOBiC+8MSETo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWvv8vDF; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWvv8vDF"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-610e2e8f57dso3408748137.0
        for <sashiko@lists.linux.dev>; Sun, 26 Apr 2026 11:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777228026; x=1777832826; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rwKsfkCSDDLlPneMLKNl0nsDp5L5siabP0Rm2oSKeBo=;
        b=mWvv8vDFAuxL6k5pNdi4Pw67LU4UfhDZpsxQYtqlSK4T1q1Q+QMwg+WeKGhPushFQu
         BZD7dpmpjRY/bdHURTE/upvvOCRJmZ0/ktUKbQ6NABTg0PInlU0xWeF1+OoX9sB4ILKY
         KZv6gPUBwf6gdtVR8Z8hcfd47jbT/5cY5E4Kta1oRj2eH5XcZ+V0WeVUj3mXVde3YdEq
         J3rJYAsfJZXkd34yEXHkAhnAwXLIgIYCP1ldfMbADdHy79MvIHqFpt4AurTHMuouBARU
         K7/N7ZKnhSImQ/8xksF37PFwO9aD8KNcMrMKC65ZwKaRuWN1AOQy/M4E3MXM32kEUYKK
         WNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777228026; x=1777832826;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rwKsfkCSDDLlPneMLKNl0nsDp5L5siabP0Rm2oSKeBo=;
        b=BKdpzUq8/Vl5t8WJy1C5LufZGHVC2jMEKycGoBU5lL0BZ6IRfPGoeIArn6Zbnnj2gz
         RaYA7l4QSibxq4pDkTBqtRH3PnKi1TSb8hqQ5+OngdAfbfanZ7OdDRVPtqZNfAQbjUQE
         qdO0hFO2jeN0BbXnYLj8rUceb49C2SgQnojlQR5Amc4pcQ2pZ8+tc8lOjyzYxV5XNR0D
         qSD+wu5Kx9gxuGeiWYt4m906cQt/XMKq0TDp92SoOT9hx3ZgvM3JybjDGBgRbkHFNk8l
         Xr9xUJZUDsbOonV4Jl45NIVwRhy0rXeIgDzBkSF/eF3YPep6sXoUYY4HjQAxYofIr3I3
         0p+g==
X-Forwarded-Encrypted: i=1; AFNElJ9fWsrlXkW4VZx3kf4OPyQKNZ11A4JMEopqObFckhAcVMKq1qs9E8FgPpO9MmSt2FcS1rooHJpv@lists.linux.dev
X-Gm-Message-State: AOJu0YyQrBT7K2mWv2uLkfT1N/deundBZ5iQjwbo5Y2HXinr4OHCi2yF
	cek8Dl3VXiL1dQzJ+wNkH+6OWLUU1m0zwP7r6H5o4TSI9UliuH7PnFs8
X-Gm-Gg: AeBDieu8DIvzbg3KpshikeOgzOBN9BtwVDqciJAg5joWWObIAPr2Uv+Gz4ItiyvaTQo
	Y36oZ/nFlneiHRlmOQTQE+fV64slO4wprsRUX0XHS7dber0tyxd1MxFbhoxXvXxnI5oJij9bQPb
	aWBPqEbP5p6/K4e6p0zaPsC+DHAdt0keiyZfayYbo3/GEhQOLisxar6xzmS5aAPMWKqCV/llAPT
	jMnc5Uao1BjohbIplbIypswTwqcXcePKQfnxT0VM1u+V8Sto+EfP/8KPhHOjEueNl0c+6CzMZXe
	rZAPpnPyOFacos+Sg31ekThuXOW6Ld6A2VYQHn3tn03VPwy5gyDVpP0c6aA8BImNMcVhdqL1cm4
	fhPPbsG+S4NZ2JepGqXB6F0JBeJcYQdASZrcQ6W+/EtXvXN+CO6er+gaXet/Vbajde62H8/19F6
	CKeoMIWQ3vxwol4A7udg2UwE+ShAsRULHBHEDThbohCMY=
X-Received: by 2002:a05:6102:3584:b0:607:a151:819 with SMTP id ada2fe7eead31-616f53a91fdmr18850590137.5.1777228026052;
        Sun, 26 Apr 2026 11:27:06 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2804:389:8100:f32f:1:0:843f:4fa3])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-621983b414asm4989151137.2.2026.04.26.11.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2026 11:27:05 -0700 (PDT)
Date: Sun, 26 Apr 2026 15:26:59 -0300
From: Arnaldo Melo <arnaldo.melo@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: Markus Probst <markus.probst@posteo.de>,
 Roman Gushchin <roman.gushchin@linux.dev>, sashiko@lists.linux.dev,
 ojeda@kernel.org
Subject: Re: [PATCH v9 2/2] platform: Add initial synology microp driver
User-Agent: Thunderbird for Android
In-Reply-To: <CANiq72mMrReSR5_9NyFy6r2T7csw-EMbZQT_k9mjYgrRQSj1FQ@mail.gmail.com>
References: <20260423-synology_microp_initial-v9-2-4a8533f87e07@posteo.de> <20260423215810.3516CC2BCB2@smtp.kernel.org> <9c4cd34c8ba47f1cb432dff521382c0dc4717476.camel@posteo.de> <CANiq72mHAByf1E--Tqt1hbDQe2i4xtD0g_q4osX1ucGARTCkKw@mail.gmail.com> <ffc3c129b69992bc7be91ad56d5b3a13d760ea95.camel@posteo.de> <CANiq72kF5Ka_DZfJZgzs31Sc2y7gg8K+FvCFXb9NKKuYa3MzPA@mail.gmail.com> <CAC2333A-D7BC-4F4A-A892-2CAC8A011AB2@gmail.com> <CANiq72mMrReSR5_9NyFy6r2T7csw-EMbZQT_k9mjYgrRQSj1FQ@mail.gmail.com>
Message-ID: <CC521D25-BB9E-4EDE-B051-CB9E414FCDEC@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On April 26, 2026 2:49:56 PM GMT-03:00, Miguel Ojeda <miguel=2Eojeda=2Esan=
donis@gmail=2Ecom> wrote:
>On Sun, Apr 26, 2026 at 7:32=E2=80=AFPM Arnaldo Melo <arnaldo=2Emelo@gmai=
l=2Ecom> wrote:
>>
>> But if the AI is unconvinced that it is a false positive?
>>
>> Replying with a reason justifying why one thinks it's a false positive =
seems reasonable=2E
>>
>> I'm trying to avoid the, sometimes long, back and forth by using a loca=
l sashiko instance, using corporate keys (will try with local models soon) =
to reduce the traffic in the mailing list=2E
>>
>> Plainly stating that's a false positive seems to harsh and potentially =
harmful, no?
>
>Yeah, authors would ideally still mention in their reply near the
>"command tag" why they think it is a false positive=2E If they do so,
>and Sashiko considers it still to be a false positive, then Sashiko
>could still add it again in the new version=2E
>
>I was mainly trying to provide an "as-minimal-as-possible" option for aut=
hors=2E


Right, and I understand that we need to be careful now and tune responses=
=2E

My current pet peeve, that I'm trying to adjust to is sashiko pointing out=
 unrelated pre-existing (potential) bugs=2E

I think it would be great to separate that from the per patch analysis and=
 leave it to a suggestion for a follow-up series provided as a end of revie=
w email=2E

Otherwise it's too tempting to do just this extra fix and postpone finally=
 sending a series for review, which ends up being sashiko again=2E=2E=2E

Some sort of help on making progress in actually merging fixes while helpi=
ng suggest further following work seems advisable=2E

Best regards,

- Arnaldo 
