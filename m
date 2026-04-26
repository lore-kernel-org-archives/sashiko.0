Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85572264A7
	for <sashiko@lists.linux.dev>; Sun, 26 Apr 2026 17:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777224726; cv=none; b=FpOteD1/6oVrNF5ztOodHGr3m9dbcSxGiRMpmVGqlSz7hhSugyWMOC+8DzRUWnS3psRBlBYwf5WjMeMd+QyaUmGrGTOoA7VArDtdu13n/RPQfc020ct5vULkyJdFlFSn8BnMyXAwY53LW0u4pwDUoc54Rqfy14SgtXs9fgzlXfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777224726; c=relaxed/simple;
	bh=yNMGPl5xhFEoRDDhrgF7/orvGl+yF82i/FnWXPmGkXE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=RR2ltDXjHeukJe33Bt0Dc/Dqo7c/ak0WLy0R0Jg5uBRaH8TES0xHo9E1L1Ttsa+7IplJ5Kjby1JJ/f2wELB07mo9I7qLeKAvjEdwWgS84uNiFK+zXXvDOGb3qTwkpUo4SUsLOtZrCk7bJM1lqhgN1GofK+TodXSgOY60IpIbenI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6OAMedH; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6OAMedH"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2d891442388so16983802eec.0
        for <sashiko@lists.linux.dev>; Sun, 26 Apr 2026 10:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777224724; x=1777829524; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1TYLpxjPS/N3HnWFKTLnYk9v/6QlMU+drDj/W9T448A=;
        b=l6OAMedHR8fmQKxOYbAxGIGQP0qe5bzTfxmhLPMiL7PLX93Tu4dXh82UiEnodcNAjR
         q+nTILCKTi5vMyNS6hn4S4oVIXNxk3DHK78a+jttFhzq/IqgnDsWALz7OvemSmUxhB4I
         khpZzhYpoduuwiz10Ujgm2Lu7UQ5/Q7dZgecSXVdOaC0YQc0Vdja49yHUrPpp5dJeaH+
         f7WP1RbGddwXlEf3XDb77kt3rKxdOssmjEfC9Dw1h7+uyvr4wHV9oaJKEbsorbcoEY8Q
         3PaMjrpFYbviAZiVuIKVhOi/AXo8XCt/xpnZ90vmiSALYOXcxOlsGNXhaGw5kqazDl6v
         /XeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777224724; x=1777829524;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1TYLpxjPS/N3HnWFKTLnYk9v/6QlMU+drDj/W9T448A=;
        b=J/C587GxS9Jnn1ez7WKok0NuErorJB37uIf63rEIt5I22YKxqN+jvGsp4HDg+D0//p
         9qXBFw+Ue1BcEO9rq1xR4ayFDjqfJOQ8z+JWTyGCmDU7OQ+W3wKLyQrkdiEe3Ycz3ZUa
         QANe8baSc5p9rzgAdrwt3qqz6bk6DXLyzG7Jzbr7m7miBqctgZFtKbX9UelXAnijG82V
         NwV2tX5+QUF0kvARePUb6u4a/yTtBuU8TJo6fOjcjMf90tXupkFetdfEJJ4+6xm0iXYX
         TPkLIGOq2+JsZosogxeso6pkFK8xLPe9NFXlzWv855LxhESZlg5k2/DOaCrusAf7otzx
         FtgQ==
X-Gm-Message-State: AOJu0YxknqBPMVEMOY/Y+zrqfBeEaWoKeYVe/jISKICPxLwQ2/athiA9
	CSU4js+px7S33tp9amfihqtJzHmlNjTzM2xceczTGDcKVtMSumpUAhYT
X-Gm-Gg: AeBDieuvf33n8sFVVzeoUa4/KKwYNeMVDm/cFeg+kySZvkvZ8PDoVRKilaWBxuX0qRn
	8LWm6dXTINY0O90vv4BElAvCZCcs0Q7badH7YiG9da8Bpv8w3g9c3P7c4hUa9lQpcrlTD69iBty
	OLgKSFdEuP1pPa5UU/14Lz7tI3QxL/XFPfJUPqB8A96Hb2sjZZ0z6Cm2IcVhY8txB4CVP5yAVSy
	n+xhcZ1Be4mB+o6nzx2QNggAoUASNcX2uxQwoeLcidJA1imz9xtY+Og9j6ZSXdr3e6Q3FbM4OnH
	TP9KCnjctVoLon2lc/lzytN3DD0kOfn0xgMHTu1XU/H/pcVOs+x45I75cREhTzMrTTwvhm+tsSW
	CUzKtYN/RN4w3m87703MWisvu3RAxzTbMIqFG0dm2JoHqTnuPHlzrdRGaWnUr64/qfmQCxwKi5l
	n02RrIZ5ypDgse+UKMfRIqXOmlYZ1fpRh47/rrwINVzjSo2jXvQ54mazwy3cmzYQ==
X-Received: by 2002:a05:7300:d516:b0:2db:2089:460f with SMTP id 5a478bee46e88-2e478c1ee94mr21431175eec.19.1777224723778;
        Sun, 26 Apr 2026 10:32:03 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2804:2bf0:60e7:ae00:6177:add8:847f:2afc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d4bdaf7sm39224791eec.25.2026.04.26.10.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2026 10:32:02 -0700 (PDT)
Date: Sun, 26 Apr 2026 14:19:56 -0300
From: Arnaldo Melo <arnaldo.melo@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Markus Probst <markus.probst@posteo.de>,
 Roman Gushchin <roman.gushchin@linux.dev>
CC: sashiko@lists.linux.dev, ojeda@kernel.org
Subject: Re: [PATCH v9 2/2] platform: Add initial synology microp driver
User-Agent: Thunderbird for Android
In-Reply-To: <CANiq72kF5Ka_DZfJZgzs31Sc2y7gg8K+FvCFXb9NKKuYa3MzPA@mail.gmail.com>
References: <20260423-synology_microp_initial-v9-2-4a8533f87e07@posteo.de> <20260423215810.3516CC2BCB2@smtp.kernel.org> <9c4cd34c8ba47f1cb432dff521382c0dc4717476.camel@posteo.de> <CANiq72mHAByf1E--Tqt1hbDQe2i4xtD0g_q4osX1ucGARTCkKw@mail.gmail.com> <ffc3c129b69992bc7be91ad56d5b3a13d760ea95.camel@posteo.de> <CANiq72kF5Ka_DZfJZgzs31Sc2y7gg8K+FvCFXb9NKKuYa3MzPA@mail.gmail.com>
Message-ID: <CAC2333A-D7BC-4F4A-A892-2CAC8A011AB2@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On April 26, 2026 11:04:55 AM GMT-03:00, Miguel Ojeda <miguel=2Eojeda=2Esa=
ndonis@gmail=2Ecom> wrote:
>On Sun, Apr 26, 2026 at 3:44=E2=80=AFPM Markus Probst <markus=2Eprobst@po=
steo=2Ede> wrote:
>>
>> On Sun, 2026-04-26 at 15:37 +0200, Miguel Ojeda wrote:
>> > On Fri, Apr 24, 2026 at 1:59=E2=80=AFPM Markus Probst <markus=2Eprobs=
t@posteo=2Ede> wrote:
>> > >
>> > > Since this is an AI reply, I am not sure if I am supposed to reply =
to
>> > > it=2E Anyway, the answers:
>> >
>> > Up to you -- some people is just fixing the patch and providing a
>> > changelog in the next version=2E But it is great that you are taking =
a
>> > look at the report! I hope it is at least somewhat useful=2E
>> >
>> > We may eventually just send them to the mailing list like other lists
>> > in the kernel are doing (in which case replying may be more useful),
>> > or we may disable Sashiko completely if it is not worth our time=2E W=
e
>> > are trying to see how people feel about it=2E
>> It would be an improvement if the bot had previous replies as context=
=2E
>> So If I reply that the found potential issue is a false positive, that
>> it won't appear in the next patch revision review again=2E
>
>Yeah, that could be nice -- not sure if there is such a feature or if
>Roman et al=2E (Cc'ing Roman) are thinking about a feature like that
>(especially for lists that send the report to the mailing list)=2E
>
>To avoid using up a lot of context, perhaps it could be a single-line
>"command" in a reply, rather than sending all the replies to the LLM=2E
>
>For instance, if someone writes:
>
>    > Some lines written by Sashiko=2E=2E=2E
>    > =2E=2E=2E
>    > =2E=2E=2E
>
>    @sashiko: false positive
>
>then Sashiko could grep for that, pick the lines above that line (i=2Ee=
=2E
>the quoted report from Sashiko) and give just those few lines and a
>note that that it was considered a false positives into the context=2E

But if the AI is unconvinced that it is a false positive?

Replying with a reason justifying why one thinks it's a false positive see=
ms reasonable=2E=20

I'm trying to avoid the, sometimes long, back and forth by using a local s=
ashiko instance, using corporate keys (will try with local models soon) to =
reduce the traffic in the mailing list=2E

Plainly stating that's a false positive seems to harsh and potentially har=
mful, no?=20

- Arnaldo

>
>> > From what I see here, there were at least 2 non-trivial true positive=
, right?
>> Yes=2E
>
>Thanks for confirming! I hope it was (is) useful=2E
>
>Cheers,
>Miguel
>

- Arnaldo 
