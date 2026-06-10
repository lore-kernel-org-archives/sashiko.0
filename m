Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB47729D281
	for <sashiko@lists.linux.dev>; Wed, 10 Jun 2026 05:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781071046; cv=pass; b=nEhBb2QTJNIZqRUBM5JBTaYjhUZt4qhrrthKW0omUMGLqZ8QzXzQc7/z8i+mAQZDT1+p7/OrvMd+Tc7GMWNOIWM2BuvdmKDIxiObkmm3R6m1PhnEwvrLrIFmzUNHCz+oUw8t3okRfmQEKCSNaxF9Uidt50ntdofMwy+a9cx2+wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781071046; c=relaxed/simple;
	bh=xOJleMJcG51SfjE6aNa4QqJE0gZ9y0m5XEgrIDOMbmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R6yL5qxa8KnJAFvMkuVp9pvNG/mRcpFO5cqbaFqjR2t0XbJbYiww13MZ9ZRhJmlBxlMl8LpUfbOM5hLFWYXGXdx/RABYPrHsQi45E2gk56xPcEoVaxMaR36V9EGhdqYUYWXZTo2eGJOPxdvBp1k4fVbSlxnTrL7BCFXpF2ki8IM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jf4LR7nc; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jf4LR7nc"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-304e86ecebfso394682eec.0
        for <sashiko@lists.linux.dev>; Tue, 09 Jun 2026 22:57:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781071044; cv=none;
        d=google.com; s=arc-20240605;
        b=lxYHulHVZdnoMDzlZnfiBAQiENwKe/TmJWmTcI2TjCXVAzu2r4pKmCP0Gc9yRv8nNH
         mQ1n5plltzA2Kb2gOTbsb+Q2wUIG0eo9CcWUiXhkd/u+BrxTF0U6MmJUMIKn/4hwhNAu
         ewDaP0jIKaO28gVWTMERB0jVI8gA9G7Xv/WeO9kpgMEJLCYuxUgWN8q1P5XNmvBWZd3V
         0lYEZ0L5CWSdHzWrHrdTDV3hcQzBUawabo3fkCx1q5WAIXHbsHqtgWMn62GpH/gtFaGr
         1MPMm2XjEshEyq4LKeCs9kr47TM15Wnv3SAE8Ea5UeqCqa98q3hGGNuiMmSf7+/wKzGo
         CJpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xOJleMJcG51SfjE6aNa4QqJE0gZ9y0m5XEgrIDOMbmU=;
        fh=L/Xv1UtTb3xsksk+YbLEODoqx9fidAsMPiGj6C6Of+Y=;
        b=h0NcNp0HxLAAH9DFxN99YRNu1mAhGFlVExHqki66w/5GQ8fQnYfiCGrNH6GG0qtRBf
         ohHMyWOB18p2VBhMnqW4KKLsBm1AhX4duwch9aa4FGmKbD5h3CBxLtOTOZdht8FE4ZRf
         Z5ERXurSY8N0ycMWpKYRH5GXREcCq6vGIhfD8ajscT8lklB8/a8kwaYlrY6M8fE//UT+
         CD0rEmikOCye5WH+9NThPJUE05ezXENfPqHbBrrfnokZ8LqW4KPVIWqc666Rq/ZlJW4K
         zDVEiuO3xOh8PfqUkqh3atsB0z16dlC9vONDqh9PjK0B2dO90bcKkQaMfTdwfDdU3FHe
         MuHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781071044; x=1781675844; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOJleMJcG51SfjE6aNa4QqJE0gZ9y0m5XEgrIDOMbmU=;
        b=Jf4LR7nc4oU47D1n6I4JV0zaqDxg+j4ET+w6jmmoNWkrFXOfGq6Fey7bix5cbHOn6n
         SvSt4zxUy9rpKeCAguQxOklH7YiRc4mynHmmiA08Noun56SDFdw42i8K3uWvUNUXlnEF
         8Bl0X7srkFuExyZIyHxelxHe7C2E1+rTd8ul7pHI/hioh9PLcfmHu1bnU1LVGLEX/I1e
         ll1SQl/rfBMDhd3NnHOqSODIfcuVK8RzAz3vFB1O4E/Tzr+BsvuP62Lz4xTbKwYfa4dP
         asSDYbTX7MKTbOMh0QpVHvGYCFT4mNSbjGUHBVoHBK1i+91+kjfzOew3u98hx6jsFjQ6
         HaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781071044; x=1781675844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xOJleMJcG51SfjE6aNa4QqJE0gZ9y0m5XEgrIDOMbmU=;
        b=OTv1/HCyXSWPnOEogMuf+nH9R9X1UrJjJTSdojak7/93kTm6I27N2Qp9u+rmuuQFSd
         srUjaMtxUkOB5Tjv2OnbceTyiQtSkYjsAlMq3UYWFXXIVYFCwo8ziiNuJpSj5mlsKHb6
         cfzXUWi056kFVuY/KHmJq3zxrdy/BCpfFh2icW8L6XssTsKjAQu32zdui+rDT4+FQZCv
         5oji+sXyZi7oZ4Jg6Ahq2E6c0G2w9sPencOIO/9aFCuJ5Ss02ijUk5jItTeXzZkDsH3T
         d+3cpjCSFqdVJCJwtUcK/L5lu8+wEaqSWD+Yggprfl9vv6lxBfFjJEszlux8paVvDfLF
         xWqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/RdxeFbZlowyK0XUvIewZyg0Gd+SJi78ZafWHs/fC8cfpwv0N9bU6mcBWKLHghsQakSG9pTqh4@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/E7GHyFbLPsg8Hp3x6C/hG5WkE679lQAruajcL5VP/WT3ufBv
	KU0Exp368at18YSJC/E9Cpdcao1+pdfE7ftpL0PmdHqeXx4GUlSSOxBtIXfkKjadzG/mgM6Z2/y
	lyO1yKydVkTXWLYhsTxMC5LD/+S5yc88j4p8N
X-Gm-Gg: Acq92OFe91tU8igqbGjc1b9ov5VR1MInPvI4B7etzj9dWZ1HZVmzPivn9Wn3Ohxd75+
	OolPSrhIU8Pfi5UrnnEHFuTYTxirr0qpcgBU6aukpyDe8iKjcBLF1nZ1OYVQ2yRIFZF8Sexqw+I
	3ooiVKDq8eEQWftMj7J30fGbET3kuOISlkuU/NYYaGw2NdMs87u7oPxHllXlL3ZcQhh9uoCv2Uf
	+pKyGhE61NrLAAGpqoB/aV7gUAO9yZhPxJqJQ8iEPPWKGZnv5s6jPBIDTSFfj+4z9tU1AeBWdRH
	4CcY835J9cULRyIudPeBTJMHzhtlBMPp/y0YDYW48GLEkuaUntRwyL171kWJ8DIkd3Na/wuibr6
	uoL857Vzj2M1M0GT5YgR6NNJ76v4/k8pAxg==
X-Received: by 2002:a05:7300:23cb:b0:304:8361:a8a7 with SMTP id
 5a478bee46e88-307d5feda83mr2077575eec.4.1781071043799; Tue, 09 Jun 2026
 22:57:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <DIX8UX2TJP8E.4OAWKUUF5JG1@kernel.org> <CANiq72mSpur28Fz8YL7_-FJk_h008kt=sw6mLeSsRNmiy+ko1Q@mail.gmail.com>
 <DIXM8JL1CM5A.315I0YBSDJT5O@kernel.org> <DJ3PO5LX7TQK.3BS0W5EV7NB7C@kernel.org>
 <7ia4ecifd6i9.fsf@castle.c.googlers.com> <CANiq72k5n2yci3Qt=D9WbT2+yCU7V0AVe3UmUvsmQTcdJG0pDw@mail.gmail.com>
 <7ia4a4t37hp7.fsf@castle.c.googlers.com>
In-Reply-To: <7ia4a4t37hp7.fsf@castle.c.googlers.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 10 Jun 2026 07:57:10 +0200
X-Gm-Features: AVVi8Cdo1sZUw9Baf0hD1eLH0Z2sCEMCG1GHR_w9GCFKygr3zjtvPEv5hVQscSc
Message-ID: <CANiq72kVXwvAfhkjpiZ6SooHXT+dSn1=nwTJ-SU2Tej2+JZgBw@mail.gmail.com>
Subject: Re: Sashiko email policy precedence
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, sashiko@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 7:21=E2=80=AFPM Roman Gushchin <roman.gushchin@linux=
.dev> wrote:
>
> Very vague idea at this point, but: for each patchset sashiko can
> determine the main MAINTAINERS entry it covers and apply it's rules.
> That would help with the case when large mailing lists are cc'ed.
> Now if e.g. a patchset is sent to e.g. bpf@ and netdev@, sashiko
> tries to find a combination of the rules and it's kinda tricky...
> Maybe the better approach is to decide which subsystem is primary here,
> e.g. by the subject prefix or diff stat, and go with the corresponding
> rules.

Thanks for clarifying! Yeah, finding somehow the "main" entry would
work well in most cases, though it will still be ambiguous in certain
cases of course.

If you mean using an LLM to determine what is the "main" one (since
you already have spent tokens reading the series into context) and
then using that as input for an algorithm that decides (still taking
into account wide lists etc.), then it could work fairly well. I guess
-- people may prefer a "fully deterministic" approach though.

Cheers,
Miguel
