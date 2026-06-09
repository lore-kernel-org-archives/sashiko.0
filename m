Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A364B4014A5
	for <sashiko@lists.linux.dev>; Tue,  9 Jun 2026 16:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781023137; cv=pass; b=ap3ZPG003PJ8PKS7hK6Gwoua8f2JHvDIDhrzqqnLC0fJv8O6RqiMVpIUK0yy1OXZ3Qc78d26M7tuJT/3fHPCWJm3Etwhdcki2NU/F41mg0os+o/n44g7dJ1arwdl7SJ/z5sZjW6QH+rNhcQff6F/l/5v0t3uUMmvAzgAXrqazac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781023137; c=relaxed/simple;
	bh=fRg2HKu2SDvqMYWKz7P0eqMTfs9SqewxljzuV+atltg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z/1IwQrFTZSHhpoqm5Xds3xwmeUO90xxcL3WB4lIAZkMbGjZwXUpgm1ZhbrRST275mhXzbJ1Jexm73ZG3OV8eX2v2bM5F3OclAQxT6o/A+E5Cjyj7O2OX/FOBobxWDvW9OYeSyCIw+ZqjtnWDSX63t5HKn5jB3Mttkyc/5z+f2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNhf7bKt; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNhf7bKt"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-304d3d3d8f8so380447eec.2
        for <sashiko@lists.linux.dev>; Tue, 09 Jun 2026 09:38:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781023136; cv=none;
        d=google.com; s=arc-20240605;
        b=g32D97YgB15bF99meJ5/efjbpNW5XTjrspYT9jQ2tzpff6gs9n/i5qFaGPp5Kvajy6
         /ZIC39MJO2DlVi6cJ4V8s3J9TIaWl9y+kUu4iQpFZ/I8qWYdTaQumehntB/Egj1B5OJ/
         lE15RLpJgJ+xnJfHkzhq+bpFq1qVYu46T9IfUi9u7IwqoEQELbqxz6PP7oFe4cXiZITH
         XYz3KbTWjjPk1Dk14ko7MquGob5DKQ2D95CuqiHlJp6oxMbDhYs5h/PRL5MU7AAHP+3I
         lZr8kamMNt0i0MqOx1z3rKiw7JunRfP6FUjTatfKQvoaf8RBGJCDdSYqeZfayqyePspX
         rgmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fRg2HKu2SDvqMYWKz7P0eqMTfs9SqewxljzuV+atltg=;
        fh=b0QEZmMC7+BuSwmNf5QGi05y2fowL0kzadIMdiWtDU4=;
        b=I+6tHAknLQpmSMLjwpzaLV8EiA8fkymMtWTvwLbqL+1lKsYajptJhDC3MWpo38j23s
         P10gdpjMqo8XTKdlrOQkKV1W+8JMu87CrioOZsJhVOyu6rWbmwrUfa7wRSHfjIPvpUE4
         nTMSkVR5Rqy5wDAnr61zq+J3YLPGwSdlqdpCDfLLDfuyk2X23QSHsFkbKaIQbNock6ar
         HshOC9kAn8VSO1mtONUyPUPBuuouQeED+akBxdJNrGDPiw2GBMTjs/YBviAYzHnk8GuH
         ikBg1UE3xPKOnl4PLJ5SrmGyRiXT6/cbwq+9VAnMUNmanaHAnlCa21I4FPA9hezeJFip
         uFFQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781023136; x=1781627936; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRg2HKu2SDvqMYWKz7P0eqMTfs9SqewxljzuV+atltg=;
        b=WNhf7bKtjIYgElJpSzDKx6z/PWPviuDhFH7dI/tBV5BnkxvBIG5KBecpBijZ8iuU1G
         F3/rbQTV6THtq14lbjwE5J2zKs+y4kB8PDgUaUthZjKoFHgKBFjorq0e0VJKqQF2wHgw
         9OsiVMMEz/kgxBiSSMObz7bD3RadM6NTSsgi6JBjcUJxgtNRLHTcNkiX4qhe/kzBUtOb
         q1HdCLOfRUJGpfYljRhPNUaCF11aZshJNNl6AgfbdVObNcl2y1YcIosAaE1mfNkmx1uQ
         EKm9oFSGr6e75wX0TL+UA3uLXe7HZfUflm8HHC6oqHVIlxaQhXGe/PrCK6iNf+/GzH6u
         iUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781023136; x=1781627936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fRg2HKu2SDvqMYWKz7P0eqMTfs9SqewxljzuV+atltg=;
        b=HowfeBAOpTYONglsDkvWF2ai6WOgfdIuPpR2fq9dDwrquyV21h2kaGDg9g6ogVMLq7
         l4Bhw6Jai21V73J2OReTdsN/6YDuhlFlcJnXfc3S8mX4OOOYmN9zHTIadAlgPZ3PR7/n
         OcLx0j+p3pYYQNQ69LM5uwf3mwDSK+N7SqFFX8PLP5+2toW4BZzCHJhP0+66fXYZxMsa
         5007gKvMFNTSaAs3BweOHzHfHiNcBqvsoRQTgiephLQVuwWB7xLCcVuonIKSKcIijOBk
         R82luz+zyPhzIR7MdW704C+4WGYztVqX3wTJZzE5/xM3GZBsqyFosIkIIM+jNU6RZMm/
         0zTA==
X-Forwarded-Encrypted: i=1; AFNElJ8WZ5POogeoR0v5WJcI058MxUJbI96gij0f8k3FNsZ2kg08U4nYmEWqZDY5zJpe1R4xSLZZB1ny@lists.linux.dev
X-Gm-Message-State: AOJu0YwBlSbLsUE+l1ydkMRmnqgt+b9DcwdBfU0U+RtJU6Lp+2Ocz7Ix
	2VV/Y5UZZlUVBYfx2kQqUbNMmPkgMVJuAWLNTeoH3WZV9Y6i1rnGWO/fhsiuFhrwWArAFBeQJ4A
	+eb4r5/IySzccHdkQLsTsBcKNZrWc298=
X-Gm-Gg: Acq92OFSLhLQiUPIi2SIcyqjYpvTSfI0cr4a3SGY/3qw0BbZKWeM3R5VqUDCWljm/1H
	Jl8dP7Gi4BgNeEwIV5kBncF2nPKD85+WIeHpTVIHexpFZhZfxAq4LuPT4OjsJPFyz+hLzbsdZVH
	u+wbB/qTb5uI/ft+1E7eQSn8txXkcG8+xk12qo13v3GQqPkAmL2pGb4Y2hEcN1+0v7rizHpZoKf
	96pFd1zuiivIHURCuEy8OzDTCRMxOOIqGRTTQ/JYWDcabKPXP5ErUttzZ796ewhe7uq5XGTMMSW
	0hi0jiTfsjIkRrRsVPpECOLqlNedc2WPV7PqcWLeYKyX/RM2wZctyGto6Q8CHTg65zqAoWLat8M
	xB89oAJ9Pp4mjAPp6G5Ww68ALf3FwS4ImPw==
X-Received: by 2002:a05:7300:1352:b0:304:c73b:79ea with SMTP id
 5a478bee46e88-3077b576885mr5515792eec.3.1781023135656; Tue, 09 Jun 2026
 09:38:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <DIX8UX2TJP8E.4OAWKUUF5JG1@kernel.org> <CANiq72mSpur28Fz8YL7_-FJk_h008kt=sw6mLeSsRNmiy+ko1Q@mail.gmail.com>
 <DIXM8JL1CM5A.315I0YBSDJT5O@kernel.org> <DJ3PO5LX7TQK.3BS0W5EV7NB7C@kernel.org>
 <7ia4ecifd6i9.fsf@castle.c.googlers.com>
In-Reply-To: <7ia4ecifd6i9.fsf@castle.c.googlers.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jun 2026 18:38:43 +0200
X-Gm-Features: AVVi8Cfwb2_Sga34LUjai9po21ajVmzJWcx2wboW6r0jviIIazargAq_wnz5qqk
Message-ID: <CANiq72k5n2yci3Qt=D9WbT2+yCU7V0AVe3UmUvsmQTcdJG0pDw@mail.gmail.com>
Subject: Re: Sashiko email policy precedence
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, sashiko@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 6:27=E2=80=AFPM Roman Gushchin <roman.gushchin@linux=
.dev> wrote:
>
> One option, is to switch from mailing list granularity to the
> MAINTAINERS-entry granularity. Wdyt?

Hmm... What does this mean / how would it work?

Cheers,
Miguel
