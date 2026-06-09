Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C673B14B0
	for <sashiko@lists.linux.dev>; Tue,  9 Jun 2026 16:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022434; cv=none; b=Zqequva/COxb7YB1T5WzZ6gAbVSa5RPhbajol5xyY/tlj5JiGJ1wjKGo/8d4ZiV/Uf6n6c1kkG/OoYFtIhdngbzit3Div4qZ2o+1eL8wbuqTudib+X07ZgL55FevMpPVkBBWj5+QvlvKbVpGEnTVeG592HqvStfJQiJkME9fqDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022434; c=relaxed/simple;
	bh=ChZH/VU0yBKU40sgMeij+0XW6FlOlN97VMA0L7UiIqs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FG5Bf+7jAsG5Zx2gFTX3vJGIEfxJh8r57mdP3cfOowRI+STboLnMld/JRPFL2rH/xUMU47Tw1HQ6caa2wGEsF8rrxyF3FCeeVs6vA8TJY03G6Xtr6gry7e9M1u0VomR5yC/MIJy+8uBbATxyJ0CTmMgQEe93dils66o3TqzjN50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Pjiv7CGV; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Pjiv7CGV"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781022430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ChZH/VU0yBKU40sgMeij+0XW6FlOlN97VMA0L7UiIqs=;
	b=Pjiv7CGVMZH1uIqFpsMffaeqySqYkhscvoqtcgXLYr8NGTvVXlU3OeIYmkrwGl49tIeP3j
	VsUKeivtNJitpvlW6EpaVOI3gkr2ZjoPmsxkPT7zEHdUnewZ92oedTHCltzL6/UqDK9wpP
	B9ZC2CSkjQ4qdKPDopOH1/K6B5CsA3U=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>,  "Alexandre Courbot"
 <acourbot@nvidia.com>,  <sashiko@lists.linux.dev>
Subject: Re: Sashiko email policy precedence
In-Reply-To: <DJ3PO5LX7TQK.3BS0W5EV7NB7C@kernel.org> (Danilo Krummrich's
	message of "Mon, 08 Jun 2026 15:44:20 +0200")
References: <DIX8UX2TJP8E.4OAWKUUF5JG1@kernel.org>
	<CANiq72mSpur28Fz8YL7_-FJk_h008kt=sw6mLeSsRNmiy+ko1Q@mail.gmail.com>
	<DIXM8JL1CM5A.315I0YBSDJT5O@kernel.org>
	<DJ3PO5LX7TQK.3BS0W5EV7NB7C@kernel.org>
Date: Tue, 09 Jun 2026 16:26:54 +0000
Message-ID: <7ia4ecifd6i9.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT

"Danilo Krummrich" <dakr@kernel.org> writes:

> On Mon Jun 1, 2026 at 11:46 AM CEST, Danilo Krummrich wrote:
>> Flagging something as wide list seems rather simple [1], the tristate [2] would
>> work as well, but seems a bit more complicated and potentially requires
>> adjusting the existing policies.
>
> Roman, any preference on either of those or something else?

Sorry for being late to the party.

Yeah, the tricky balance here is that there are people who want more
sashiko reviews and there are people who are quite vocal against it.

And I don't want to over-complicate the setup, I'm afraid it will be
just a constant source of disagreement.

One option, is to switch from mailing list granularity to the
MAINTAINERS-entry granularity. Wdyt?

I don't think I have a perfect model in my head which will cover all
edge cases, tbh. I personally think that reply_to_author + cc the main
mailing list should work pretty much everywhere, but it looks like there
are other opinions as well.

Thanks
