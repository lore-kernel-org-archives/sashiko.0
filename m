Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDED39FCA7
	for <sashiko@lists.linux.dev>; Fri,  8 May 2026 23:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778281650; cv=none; b=dRaJZu8Ml9XwvOd6+Mbdn1H6KxiOvXSzHICDMLOZSmmLEUxW5pe7oaikPMDK9Oqv4abYxZETCBNnNfpaYn+ncUV8vYM7PKY1f5VAJh9dCaLmFfhdlim/mdSdzfFFQS/jA4XmxpY4o2Pxm6+2vRgsdrrwCNMMyTuIQ26sx844Q08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778281650; c=relaxed/simple;
	bh=O66MVGU3QDL+Cy3akNBxytOM3P+XmOPScObecOW3hrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oNpssJ/MRyhmLc/ovPm1Ee0Ys468bWyjp68CHYjVnTaw66uVU69f2FCzXVgTi6l0q5zDIk90IhBc2BVt45gmemnwiw4BMHv+rskwDXVpG4Fd803eKxEu4edolhRGYU6djL5umM1yEDytcOCmPsuCQItm+2CxeHNaJfREmYuR7+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pzg5m973; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pzg5m973"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-837c09d2268so1135571b3a.0
        for <sashiko@lists.linux.dev>; Fri, 08 May 2026 16:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778281649; x=1778886449; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J/InWrOUOchm9lydjp+lzNN+EzfH6qLQxojHmTQooTE=;
        b=pzg5m973ZkMx25ab7tzfKlQ2LaClDEtxNKXrlRDRAkFN8cFJUokVpCHoXSDiWm66nK
         oRAHlyu0Tt6fSb+JEr6Pr7L31Q22D4R/FSFELSe8HHrzKXmMXDNnQt2EFWIEDjmEPpEE
         AoL6nF3xCn14Fvo9PN7XAnsu7wO7dnG6HUo1S+eEtCx+l1b2SyuF5kvY0IDYklPHdTNC
         Ah1KS9eb4IfzdzYv7euHpaknMwoiqQ16HHbqxAnricFAd5Vo3R+LAl5rONg89L/1x8VR
         uN640GwcwR0mwqwmj3o1u4KiUEKziin2kBPX2rTGhlpttijqHRefQtNJfXJkMLRIffYP
         7LNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778281649; x=1778886449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J/InWrOUOchm9lydjp+lzNN+EzfH6qLQxojHmTQooTE=;
        b=LbeJ9ir0gKZRVLEO5QmJadWNC7zYf3FARrhrIHS2Tt6SoQZ9h548d3bkHYCNzRDHde
         k3XjIq7yK4uWLZXwmLDVGVPcEWXBO5d6zBtNYFvVBhOVhEFTy1zVWkFfg8wtdeuHAvL1
         3S7qI/bgRaD56c+/QK3i7SNJxubXKpkCmEpZOoznHRsPjogStUiGvi47thxhR5vVIs8x
         SSjw+DktHdEszSs4r7UbQSuRPNOn4Cv1+ZLIXsFONv17Xq628mzcxSxcEdgWR6sJJ27x
         kVPgSDIpaLCk4RoGJutBUG2JKWlVrvgwEiG7XGFNwXLaMgYEhrvTQK+OHu4MNSJ5BoAx
         z+Fw==
X-Forwarded-Encrypted: i=1; AFNElJ9cb5WBGtm/ZH30gsMWH4KWdRBY7gUApPDNpxACi24BevnjSKzLvG5JBNvnr2nirNWpAn2Pi9Qy@lists.linux.dev
X-Gm-Message-State: AOJu0YzQ/5KV5oy/RyYZDiX4+96yYayFhdEIr7tjzP5zL0zSRiYL+9Zn
	PNXeSV6A02gI3Bw/wj05tk38FQuov3fQgZjKDRXsolkSimR8CfezsRsm
X-Gm-Gg: Acq92OFZUW9Dao4mpazRymEOEaNIrglWOe5aTfFKOAL6cu9RTND5V9ugqQVZk1C4fl2
	WSQRlk6Gh7pTCo6xr0Y9bXY3kXsTf8CkkZbuDKqH7N2pmTp8jxTTJewiya8jckBKcpOl3E6CYna
	7Pfejk8GNZwMXaIXcQmd7lwxp9fWg9gU1LHEQlBwu+dhC9Ck7I76/kObeA5ntmW4KCo9O1qttTl
	OW9oJkvSvvnnaaBA3n58j0MqWORH2jy9m4M/0gKf3nM7XinQm8ZNTdO8H3ixOc93qi+VpqGXBNj
	LBBaDhYc/NiQf6VdDyzn8VlE1Yl9GQtvDjK6c1PzelWVSRgpWuOnW6aOURHQNnaV4J9dyZFuCNS
	BvUzatW4ZTeJwP0G3QFbIfV+RBxO3rSVhJ9A7u/hD1XlH6BJDba3Xiubu2IqNgZTxszmPvMWdyn
	jdr/1hfGRPjAz+aFETiJETIHXWMLy1wPpP728ktA==
X-Received: by 2002:a05:6a00:a8d:b0:82f:cfd2:6ca0 with SMTP id d2e1a72fcca58-83a5dd57ddemr13693442b3a.40.1778281648593;
        Fri, 08 May 2026 16:07:28 -0700 (PDT)
Received: from ?IPV6:2604:3d08:9582:1100::c7c9? ([2604:3d08:9582:1100::c7c9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563ac51sm13518919b3a.2.2026.05.08.16.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 16:07:28 -0700 (PDT)
Message-ID: <a51c45c1-852b-41a6-ab59-9da186350e36@gmail.com>
Date: Fri, 8 May 2026 16:07:27 -0700
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 07/19] unwind_user/sframe: Wire up unwind_user to
 sframe
To: Jens Remus <jremus@linux.ibm.com>, Steven Rostedt <rostedt@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>
Cc: bpf@vger.kernel.org, sashiko@lists.linux.dev
References: <20260505121718.3572346-8-jremus@linux.ibm.com>
 <20260505185528.8E529C2BCB4@smtp.kernel.org>
 <05adaec0-c2cc-4a16-b2da-ba3ed7437e7d@linux.ibm.com>
Content-Language: en-US
From: Indu Bhagat <ibhagatgnu@gmail.com>
In-Reply-To: <05adaec0-c2cc-4a16-b2da-ba3ed7437e7d@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-05-07 09:18, Jens Remus wrote:
> On 5/5/2026 8:55 PM,sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> - [High] Unbounded linear scan of user-controlled sframe entries can cause a CPU hard lockup in NMI context.
>> - [Medium] The commit message claims to refactor `unwind_user_next_common()` by removing an unused `pt_regs` parameter, but this change is entirely absent from the code modifications.
>> --
>>
>> commit 2e1e17bbaa1c0426d41d66ce7930a944f3e86ae7
>> Author: Josh Poimboeuf<jpoimboe@kernel.org>
>>
>> unwind_user/sframe: Wire up unwind_user to sframe
>>
>> This commit hooks up the sframe infrastructure into the unwind_user interface
>> to support user-space stack unwinding via sframe. It adds the
>> UNWIND_USER_TYPE_SFRAME type and updates the unwind_user_next() logic to
>> attempt sframe unwinding when available.
>>
>>>      [ Jens Remus: Remove unused pt_regs from unwind_user_next_common() and
>>>      its callers.  Simplify unwind_user_next_sframe(). ]
>> This isn't a bug, but does this commit message match the changes?
>> Looking at the diff and the code, there are no modifications to
>> unwind_user_next_common() or its callers to remove a pt_regs parameter.
> Sashiko AI review failed to understand this commit message comment.
> 
>>> diff --git a/kernel/unwind/user.c b/kernel/unwind/user.c
>>> index 90ab3c1a205ef..1fb2724197332 100644
>>> --- a/kernel/unwind/user.c
>>> +++ b/kernel/unwind/user.c
>> [ ... ]
>>> @@ -82,6 +83,16 @@ static int unwind_user_next_fp(struct unwind_user_state *state)
>>>   	return unwind_user_next_common(state, &fp_frame);
>>>   }
>>>   
>>> +static int unwind_user_next_sframe(struct unwind_user_state *state)
>>> +{
>>> +	struct unwind_user_frame frame;
>>> +
>>> +	/* sframe expects the frame to be local storage */
>>> +	if (sframe_find(state->ip, &frame))
>> Can this sequence cause a hard lockup in NMI context?
>>
>> Since this unwinder is often called from NMI context (like perf), sframe_find()
>> eventually calls __find_fre() to search for Frame Row Entries. If __find_fre()
>> performs a linear scan over an unbounded, user-controlled number of entries
>> (fde->fres_num), it could spin for a long time without yielding.
>>
>> If a malicious userspace program maps a large VMA and provides hundreds of
>> millions of FREs, would this loop calling unsafe_get_user() on every
>> iteration tie up the CPU long enough in NMI context to trigger the hard
>> lockup detector?
> Please advise.
> 
> A user could craft .sframe with a large number of FDEs (up to UINT32_MAX)
> and large number of FREs per FDE (up to UINT16_MAX).  Each FDE could point
> at the same FDA and FREs to save section space.  Each FDE would require
> 16 bytes in the FDE table. All FDEs could share a single FDA of 5 bytes
> and share FREs of minimum 5 bytes each (when using the 16-bit start
> address offset to have UINT16_MAX FREs) in the FRE table.

For the case of malicious .sframe with large number of FDEs, wouldnt the 
existing checks of the various offsets being less than sframe section 
size suffice and the following in sframe_read_header suffice:

    if (fres_start < fdes_end || fres_end > sec->sframe_end)

For malicious num fres, should we add a check that a function's num fres 
is less than or equal to func size (available in the FDE index entry)? 
It is an approximate check, but should provide some boundary check.
