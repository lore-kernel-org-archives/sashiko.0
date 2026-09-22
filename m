Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64234F4CEB
	for <sashiko@lists.linux.dev>; Tue, 22 Sep 2026 11:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075406; cv=none; b=qKwK2uhIf8iIzADlg4RVs8WOdb1aPVCrbs2/nczU+8Lz1hBYd9OxZJDsQ37aSrRcwqaasw6B3xEv0XCTbpvlSiH3qF+vJFTj78Lp7Ip1VgzIsZKcF4sn/CHIMUhj89JJFrrRZPHnEh4CBRB2zUFgo8/ZPi52r4Q8CV8B7Fjw1RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075406; c=relaxed/simple;
	bh=bYpJJ+QPQeFH4zMz595ZvV9UVklYLe+cKkKS1GBDhWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VZImqmVlOcfnm9iLr2Hu12dtsIv9zfRu4leLTBn22LrGWpVZdxMvT58YEQEOonDzBhAzVVoRZ0ncrjJc3jdimQvmG8RFc8flnEzNqJ1MUSbhq42jAUHLlY/rzcFZtWrCYAsG87EsqTRRtjXlkGsWOun0lDQw2gi1MiuuLC0nmH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JyOUEBAz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JyOUEBAz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F781F000FF;
	Tue, 22 Sep 2026 11:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790075405;
	bh=c2SGeTP3YlSKx8d/Pp1EHGCUtvQGdcThRWK3eWOtbKg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=JyOUEBAzMq0l7DvQdqK3lTv93ZnZncYYBfsVh3HfAYaboPPl9aEedajHN780xWSWm
	 xyW3K2PyvI8E6G0xswIqGV3ktbD1z6JdQB0XqVoddZ7Gj3PdzI1XnT6ljlDgF30Eow
	 WurfihdNM/kI5UJK1Mf7P3RhURD7ck2V/EsKF/fHhpA4vCoaLx6yU7ypk5LkJyxSxp
	 mQWsUbC6dD4IG8HzLXt9hAecMyFwyv8qiKwK+MF4rmYikg2diBEH52jd1lhn4ihClY
	 nrV/nSZePZavZzqt/d4uoVyd7udMHZjYSkXl4V4d36h6uH+/zKNmQ+t2PdU/lIGbiO
	 Du9XhoWSxBOlQ==
Message-ID: <f0f8e249-e4d2-411c-9bc2-a0321290b9b2@kernel.org>
Date: Tue, 22 Sep 2026 06:10:04 -0500
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Enabling sashiko for amd-gfx M/L
Content-Language: en-US
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: sashiko@lists.linux.dev, "Deucher, Alexander"
 <alexander.deucher@amd.com>, Mario Limonciello <Mario.Limonciello@amd.com>
References: <9e1ca7ef-a1c2-4e0b-a8f6-28989d0896c6@kernel.org>
 <7ia4mrt93bcg.fsf@castle.c.googlers.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <7ia4mrt93bcg.fsf@castle.c.googlers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/22/26 04:05, Roman Gushchin wrote:
> Mario Limonciello <superm1@kernel.org> writes:
> 
>> Hi,
>>
>> Can we get Sashiko enabled on the amd-gfx mailing list?  It should use
>> the drm prompts.
>>
>> https://lore.kernel.org/amd-gfx/
> 
> Sure. Done:
> https://github.com/sashiko-dev/sashiko/commit/d17454117abc5ec00f335c4d8e84059120b307c4
> 
> Thanks

Thanks!

I just glanced at lists in https://sashiko.dev/ and it's not immediate.

When should it be effective?
