Received: from mta1.migadu.com (out-215.mta1.migadu.com [95.215.58.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941C4559C8A
	for <sashiko@lists.linux.dev>; Tue, 22 Sep 2026 14:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.215
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089131; cv=none; b=h7YbfV30zQYjmGbqjPxiVSKDDnfz2Bv3Vf5yoHvTP5xe/o2wxK+V7oe4oYhxWkz7AGw/OE3A6iKczjZJ+oHaUU7xwXD/NPpBa8i0yRx51xhm21LSlefN5Yk8ZhXMrA81ATCFbvslkRbFF4otzy6Id8Arvy/FaUi76hzAMcVU/zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089131; c=relaxed/simple;
	bh=ggi1invL/ie4bvedHRspI5zljO8TUHPhybLV3qphyYQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kgOUIKeQEpBJ5VnOYwfL/sAIsEAOXtXCeKx+b9jD6HRUhXyrhvXJ4kgZoSgT0GoID32+UOGixsTqQe1XXtxJMmudTT4tSZ9KU07y307+TcDX4trenW+9BQZ1Ea8+MdhONJ3Y7zn3/vUc3cjKJ5exOOj3I6ebn7mJFIAymUSe6G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=l0HKh4qX; arc=none smtp.client-ip=95.215.58.215
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="l0HKh4qX"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=ggi1invL/ie4bvedHRspI5zljO8TUHPhybLV3qphyYQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790089126; v=1; x=1790693926;
 b=l0HKh4qXEHZ7MAbT1ynlD92moX1nI2ADPjg9z0Y+L3xl2j+W9BtUYq5LkLtX0AFrPmxBW2yP
 +bkf9eKElelQfenbWOtGkpiPlPCFqqM8i28Z33dHGmjVz2qXodyxCEvgkZV4IPN9oguv2+HQagP
 B7f31i5/gWENSqNjBB8HRtLo=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta10.migadu.com with ESMTPS id 37c07413a5aeab30;
	Tue, 22 Sep 2026 14:58:46 +0000
X-Mizu-Trace-ID: 37c07413a5aeab30
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Mario Limonciello <superm1@kernel.org>
Cc: sashiko@lists.linux.dev,  "Deucher, Alexander"
 <alexander.deucher@amd.com>,  Mario Limonciello
 <Mario.Limonciello@amd.com>
Subject: Re: Enabling sashiko for amd-gfx M/L
In-Reply-To: <f0f8e249-e4d2-411c-9bc2-a0321290b9b2@kernel.org> (Mario
	Limonciello's message of "Tue, 22 Sep 2026 06:10:04 -0500")
References: <9e1ca7ef-a1c2-4e0b-a8f6-28989d0896c6@kernel.org>
	<7ia4mrt93bcg.fsf@castle.c.googlers.com>
	<f0f8e249-e4d2-411c-9bc2-a0321290b9b2@kernel.org>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Tue, 22 Sep 2026 14:58:39 +0000
Message-ID: <7ia4ecel49k0.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Mario Limonciello <superm1@kernel.org> writes:

> On 9/22/26 04:05, Roman Gushchin wrote:
>> Mario Limonciello <superm1@kernel.org> writes:
>>=20
>>> Hi,
>>>
>>> Can we get Sashiko enabled on the amd-gfx mailing list?=C2=A0 It should=
 use
>>> the drm prompts.
>>>
>>> https://lore.kernel.org/amd-gfx/
>> Sure. Done:
>> https://github.com/sashiko-dev/sashiko/commit/d17454117abc5ec00f335c4d8e=
84059120b307c4
>> Thanks
>
> Thanks!
>
> I just glanced at lists in https://sashiko.dev/ and it's not immediate.
>
> When should it be effective?

Once I'll deploy a new sashiko version, probably today/tomorrow.

Thanks
