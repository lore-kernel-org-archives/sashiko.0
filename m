Received: from mta1.migadu.com (out-159.mta1.migadu.com [95.215.58.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BBD529408
	for <sashiko@lists.linux.dev>; Tue, 22 Sep 2026 09:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067927; cv=none; b=UDdqnb7kozmU3NSZjWoXSEjm607CQgfH/aisK24a30BDD9+ygHnMT6aSJa8FFdKAmlHf1QadDwa/nd16M1dkVpd2IE7dgT0lmsufKwnW+14vkCZgSbSbwaBCt4V6Z29jBpUyH8RBt0z+55LT/wl0BIOgUUms15qLR5JusB1WQWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067927; c=relaxed/simple;
	bh=EOK9HtB9jUh0hJVk3WWpIYAVP426PwSeDh8qfg1ntlA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Wy2O8pMDVkaQlac5V8uJK6HU0iVHhdDFLVyOSDNXqnWFAgdlzG4kx+BccLc8wvdyXChGTZK/3uics4Ck6Kv+mAr3ueBw5iDzt70wvm9bD+EptWdfSlkESFsuJ1P2JzoZ+iqFbys9aCt02PmgqonfWyntUboDD6TNtIZAHjTOz8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BjZC/VrX; arc=none smtp.client-ip=95.215.58.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BjZC/VrX"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=EOK9HtB9jUh0hJVk3WWpIYAVP426PwSeDh8qfg1ntlA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790067922; v=1; x=1790672722;
 b=BjZC/VrXVszEkMi/Bisz41TH9Y4sweV4iJha8uvk2CcWG2Z4USByOJbo1LCOurrbM/ftHaGA
 pRhse4+4H0L7aRvWgi/H58L2DsoppKwct02DU94ERaMEhnVQQErBCmEini4xUisy0K6wz25pvRG
 tlOXdqR4YG1iW33qyaiIhaJ8=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id d106772f445b269b;
	Tue, 22 Sep 2026 09:05:22 +0000
X-Mizu-Trace-ID: d106772f445b269b
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Mario Limonciello <superm1@kernel.org>
Cc: sashiko@lists.linux.dev,  "Deucher, Alexander"
 <alexander.deucher@amd.com>,  Mario Limonciello
 <Mario.Limonciello@amd.com>
Subject: Re: Enabling sashiko for amd-gfx M/L
In-Reply-To: <9e1ca7ef-a1c2-4e0b-a8f6-28989d0896c6@kernel.org> (Mario
	Limonciello's message of "Mon, 21 Sep 2026 10:52:30 -0500")
References: <9e1ca7ef-a1c2-4e0b-a8f6-28989d0896c6@kernel.org>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Tue, 22 Sep 2026 09:05:19 +0000
Message-ID: <7ia4mrt93bcg.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Mario Limonciello <superm1@kernel.org> writes:

> Hi,
>
> Can we get Sashiko enabled on the amd-gfx mailing list?=C2=A0 It should u=
se
> the drm prompts.
>
> https://lore.kernel.org/amd-gfx/

Sure. Done:
https://github.com/sashiko-dev/sashiko/commit/d17454117abc5ec00f335c4d8e840=
59120b307c4

Thanks
