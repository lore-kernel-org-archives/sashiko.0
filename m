Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E5043D4F4
	for <sashiko@lists.linux.dev>; Mon, 18 May 2026 12:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779108873; cv=none; b=G3dlzrMNZiwQJvL3hSXQExSnL7NKXUKcLavx7kdUdcvUB2ri5whC/9qn+MNQzRb0s3wcdNBwl2qCsfCpDpnNnFUsL9lvrkQrGKl8CYMQ6h71+tW0sml8RQtLj1JK8W/jB2lK2Gv22SlI9LW3/8O9hS++WwMEmfSIyfDYgCddwg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779108873; c=relaxed/simple;
	bh=kzq6fXO5xH0JFrRrfpeplkkfdRb3ESDVhUgoGp4aY8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DpAuDeH2YZkJwnLjw8xRx/9n5yJuys83gIQGvG6qWnDEs47NSnVQ5MRLouAOdybbXGlFtbNfgQdCF3gU5bMp7HK2dTXyO2mCp8Laasx3EqSMlvb/jRQ+VaF9EnsTrak8lDN/RQBb0Bix9lcLiemuz/n6T7MEdYyXJwPH3Snqyug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-57516bb40b9so1776719e0c.1
        for <sashiko@lists.linux.dev>; Mon, 18 May 2026 05:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779108870; x=1779713670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kXfE2Lz48kTNKntKaUoznm2p2xW5+qum7mp86cRTvX8=;
        b=FCh4+7PDnMeqhudGdKLqDKI4nIVP77QnAvuVq+APmgfisqh6G5ihTB0QbazH/2qONK
         yuXS2KrOesP19xNQviDDym3gzRcDff4zA2/AXfNcy2eGZVbgB9Mh9R9DPRv58c5mrzk6
         myXR8LiXRQ1k6jApsqfcy5lLi11u76+rDXr327wovMAASA7owrDEJttJB1Y9M68kFWvU
         q4xuKj0SO8uldOnm9/zwyRk+NY+BjDF1rV+UEcGcDiuFgCBaDHUDqSLeO2R79EiiHBHV
         wiwe9gbPLylzLNCxl4orydPIP1QqFZljUM6MgjqYCruLfmhRi3ui6I4z6xUgXQ+2dwBf
         jifw==
X-Forwarded-Encrypted: i=1; AFNElJ+tf3g+W28sABkSCHJDyr4+bSa6Lkhza8FOO490rSOTCwXyXLl9rUPU+QKuF64YUNoqG6tn8fzW@lists.linux.dev
X-Gm-Message-State: AOJu0YwLe9DLwCxWZKXami0EQrIWdIqyDew8WUhZqlDb//qAqjPN220y
	qYlIOwlCC7AB5ueeFGKBFLa8hB9uPSvw+eaHdFDn7KiyAg9qaGZG7LZVBpPal8ie
X-Gm-Gg: Acq92OHQgdUR6sCj1PgWglAHW7qrznJyXC4inF1Jdf2E3ViPD2D+WyxAHm22sj0pAvi
	RkDO9mtpKQvx7I34dlTxaeoOvNug22UfyNgLgN0jzKUtQTiAzHk4xzSBi2x/7zc6bYP3JC4RMNz
	HR2i5np92N61E/Zs0apkP13ivx8xYMFn7dNHELf8Edzagrx61u6K743O1aFNPdH0DnCWRnktGmL
	ZeN4ekS+VG7p1bUHLa0CLGdB99vOYZ7xrl2J1a2qKZCtocpayqwVJYxSo4zRdg5UWDehKG8uj3M
	DCHL3WyxOPZYIePaJS++xoFp9iwmt90igKmxzzKde322hg5yS/DicYevkgX/AI2Eck87EnLct9A
	VoSLWTfaalrOhYEAe8hvTmXeSNsQbGxyxBM4BU4azlGIoefyH3QV/vBG8r306OeJfLicZDTUARj
	txbm0HI8NB2zWj1xfnvhDBeeaQChcuhCpoxq8nbweJpVTMkm1lZFVLFwhozZ+Y
X-Received: by 2002:a05:6122:4d0d:b0:56f:8f5:b135 with SMTP id 71dfb90a1353d-5760c09a8cemr7718762e0c.14.1779108870265;
        Mon, 18 May 2026 05:54:30 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5760f5cd08bsm6002403e0c.5.2026.05.18.05.54.28
        for <sashiko@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 05:54:29 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-6314287380bso1617680137.3
        for <sashiko@lists.linux.dev>; Mon, 18 May 2026 05:54:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+BjKLCHlAzxgSxR3sezOfqKAjIW86AEpyHCptjlFh+crM2/V8BvVM9RdoS05aKwz/+irKws8O1@lists.linux.dev
X-Received: by 2002:a05:6102:946:b0:631:ab8b:c348 with SMTP id
 ada2fe7eead31-63a3cf12325mr7789460137.8.1779108868589; Mon, 18 May 2026
 05:54:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4f3d7f48-5766-425b-91f6-0acdb5554584@kernel.org>
 <07602616-412B-4ED8-95D7-588C0D077EE3@linux.dev> <2e20badf27b6910d619329841e37d2961556056f@intel.com>
 <20260518121601.GA87957@macsyma-wired.lan>
In-Reply-To: <20260518121601.GA87957@macsyma-wired.lan>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 May 2026 14:54:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKONz_jCAedOWQ7Oqza8DDXt5hBqB1ZvO-1s2pvwsbUw@mail.gmail.com>
X-Gm-Features: AVHnY4JEQspflVlWQjqPB-ZT9trO0h2lQBDWUevKp9TlFoxeoXF1KrY6M5cCx8Q
Message-ID: <CAMuHMdXKONz_jCAedOWQ7Oqza8DDXt5hBqB1ZvO-1s2pvwsbUw@mail.gmail.com>
Subject: Re: Stop false review statements
To: Theodore Tso <tytso@mit.edu>
Cc: Jani Nikula <jani.nikula@intel.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Krzysztof Kozlowski <krzk@kernel.org>, debarbos@redhat.com, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Konstantin Ryabitsev <mricon@kernel.org>, Guenter Roeck <linux@roeck-us.net>, sashiko-bot@kernel.org, 
	sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev, 
	Linux Kernel Workflows <workflows@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, kfree@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ted,

On Mon, 18 May 2026 at 14:26, Theodore Tso <tytso@mit.edu> wrote:
> On Mon, May 18, 2026 at 11:04:29AM +0300, Jani Nikula wrote:
> > > Sashiko is supporting various LLMs, including open models - it=E2=80=
=99s just a practical
> > > choice: to my knowledge the quality of open models is not on par with=
 frontier closed
> > > models and it would require a non-trivial amount of hardware and infr=
astructure to run
> > > an open model at the required scale.
> >
> > In the context of the "Reviewed-by: Sashiko" discussion, this actually
> > makes it really hard to assess the quality of those reviews.
>
> Agreed.  There's a reason why the coding-assistants.rst specifies the
> model which is used:
>
>   Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]
>
> The problem is that (as Jon has pointed out) coding-assistants.rst was
> intended for use when the tool was beging used to help create the code
> --- that is, "Coding Assistants".  What we're doing here is more of a
> reviewer assistance.  Something like:
>
>   Scanned-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]
>
> Would be more interesting, but it doesn't actually tell us anything
> about what the results were of the scan.

Indeed.

Scanned-by: Geert Uytterhoeven <geert@linux-m68k.org>

Doesn't say much more than the RFC2822 "Receved:"-header,
and thus not meant to be saved for posterity in git history ;-)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
