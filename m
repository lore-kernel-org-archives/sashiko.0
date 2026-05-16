Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7938A191
	for <sashiko@lists.linux.dev>; Sat, 16 May 2026 19:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778959924; cv=none; b=gQfSVlDINrXXjZQGRYqeaQLlINyzGdNwhLvEPhORe8c48lcGCFHm5PIFdjdER3G/3o2UBhTDRCOUS4ilzJ6gYTBxs0PVIXlB4pQEV22zpaD01mAZcrfQJkz5u2GMdp3+pBzsGY1BEPZmcbDTxKUWY6i0hWB2Zytyf0z0RZq+eSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778959924; c=relaxed/simple;
	bh=wGafJKXVeeh3eHIVWZYBUuw/0VxBZqh+Hz15CTz/G84=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Dw15/wjs3vMzE9sooLLEZOT9rG9/625kqd/oIF/ISrXytV7KL1xLk+yL6gKL+TFIb/EEwgdyglA4v/7Mk9LiFGLcJtNg/sQF/yYc7+PjPSqU6Eax+IbChClC9fv4j6app+2Sr3gW3f2f58zS3wZf15gPSp8nVY6vYFyH2hD4hbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YQg+qqiI; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YQg+qqiI"
Content-Type: text/plain; charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778959918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wGafJKXVeeh3eHIVWZYBUuw/0VxBZqh+Hz15CTz/G84=;
	b=YQg+qqiIfsu1HN0PREcp1B6XpXlqbBA+iwoY0LvX+DC5l6jN8bt9KPGpWt5JaJqgfxU3kw
	LZnV8OMIx3mkXv6vrzhZ88TmiDaFt8q+8VwpHYjPaJr+dPQg8wsR85PXDzlzgApq8Rkb9c
	2kD++9jldIhEUMsZxITSiPtS0CpwqZk=
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: Stop false review statements
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Roman Gushchin <roman.gushchin@linux.dev>
In-Reply-To: <35412149-282f-4272-ba47-136caeeb5c1b@roeck-us.net>
Date: Sat, 16 May 2026 12:31:39 -0700
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Konstantin Ryabitsev <mricon@kernel.org>, sashiko-bot@kernel.org,
 sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev,
 Linux Kernel Workflows <workflows@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org, kfree@google.com
Message-Id: <2227AA25-CB7B-4B20-AD99-55C07571BAC9@linux.dev>
References: <35412149-282f-4272-ba47-136caeeb5c1b@roeck-us.net>
To: Guenter Roeck <linux@roeck-us.net>
X-Migadu-Flow: FLOW_OUT



> On May 16, 2026, at 12:25=E2=80=AFPM, Guenter Roeck <linux@roeck-us.net> w=
rote:
>=20
> =EF=BB=BFOn 5/16/26 12:13, Guenter Roeck wrote:
>> On 5/16/26 12:00, Krzysztof Kozlowski wrote:
>> ...
>>>> It=E2=80=99s opt-in on per-subsystem basis, as well as all other email-=
related features.
>>>> I do rely on corresponding maintainers to decide if they want it or not=
.
>>>=20
>>> The trouble is that subsystem is mailing list, thus I still got all of
>>> them via b4, which is used to get the discussion.
>>>=20
>>> Send them only to the maintainer, for example. Or maintainer + authors.
>>>=20
>> For hwmon and watchdog I most definitely want the response sent to the
>> mailing list and to the patch author. That was the original configuration=

>> for hwmon. Roman took it out because people who were copied on the
>> original patch complained that they did _not_ get Sashiko's reply.
>=20
> Actually, turns out he didn't, he just moved it.
>=20
> However, it turns out that Rob added krzk+dt@kernel.org as explicit
> Cc: target for the devicetree subsystem. I would suggest to drop that.

I already did.
I haven=E2=80=99t changed the hwmon configuration.

Thanks=
