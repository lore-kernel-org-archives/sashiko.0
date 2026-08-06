Received: from sxplsmtpa04-01.prod.sxb1.secureserver.net (sxplsmtpa04-01.prod.sxb1.secureserver.net [188.121.53.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0AF3A7F46
	for <sashiko@lists.linux.dev>; Thu,  6 Aug 2026 16:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.121.53.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786033377; cv=none; b=r4JG4fQ7ujH40hdoL/N8lDK6QWMkpqt9B1TCqXNsaomOR0nPIZbE1f9q49XWW2KTGOKrz5LPosyGFo6GiyqcSi0fcGiROqwftSkOSfep/1+OXWezQrUhc9IY/zYBiR4/4KaSKN1V1ae2xiD13Ag3VVflBcERdUB80TT+ah7+EG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786033377; c=relaxed/simple;
	bh=ZXbpPXBX9DUQwdHHz9ztRaC2Z6qZ7R0gRaGHOtoUSHM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=gK/vpiiFcKmHd6nFTuCVcoQ0ybRPwqFlSKyu0cGbUAv3amZTehPnZ/z3SY8Jja7ZexkXJkN7bRBLtokL84MjYr+wcvSP/VpH+2ewaLqrhQWGdqKquFTNcAEJ0SJmBfQPB64UzSEeQ89dQeqqIncrogw8FarEiBO+8T6GJayiZg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk; spf=pass smtp.mailfrom=squashfs.org.uk; dkim=pass (2048-bit key) header.d=secureserver.net header.i=@secureserver.net header.b=tOAHaWCK; dkim=pass (2048-bit key) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.b=QW5EgVpG; arc=none smtp.client-ip=188.121.53.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secureserver.net header.i=@secureserver.net header.b="tOAHaWCK";
	dkim=pass (2048-bit key) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.b="QW5EgVpG"
Received: from [192.168.178.95] ([82.69.79.175])
	by :SMTPAUTH: with ESMTPSA
	id s0pIwm56ygiPgs0pMwvnkv; Thu, 06 Aug 2026 16:20:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1786033218;
	bh=NxKDC6Wbk3XXxDfsw8A7M7iW6daC9Fjh1AmwoNh0VIw=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=tOAHaWCKVRrWAGuiw1aT7mf7c0WJ/Z+SUitOyixesqatGn3qJPvVEMaKKUJtS8Y2S
	 jazhdbL+dKODiwsZCZ4iw6fM7Qg7xEmugqq87ttD20eKZ7vo6X6zlH7EONQEbnpoke
	 +9MIXanF7gQCE4jJHbc5vR/IlNuXptltKu0x9M0yIjb2ulzNjHCHMhbVSNqvlyGWyP
	 0wKCDOOcUD7MB820rmlwOMm2xdWzyv6ivB0dSpXv69ZzKVVfCbYSXxUDpecJds+Bf4
	 4FGBK4jwehGp72vslJHWAnsTtaFVDskthszAlaxLIbOT5HhTRXykmA9XqHuvIyB5dn
	 ViXDLrbc/d4/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1786033218;
	bh=NxKDC6Wbk3XXxDfsw8A7M7iW6daC9Fjh1AmwoNh0VIw=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=QW5EgVpG6VmU0VakSHGWeZEe/1fZ987VVFTCdDqGlc479Ns+m0xIsFGVUHi8Qz5mc
	 ZfPRPEjRH5fiADoslce2n1TGPsy88u10huU+n8xnQthiWebfGqLSvYI4SJ0Gnms8C6
	 I0Z+ew0ZyqV+u8h9rd5rCu5nYDSV+ovEiLIgvh8+s45/BvFbc6vpM0RQu3/vI4aIy3
	 nG9L8qN5hiOE2uGXCwMZvjhDRB6BKcwHuuFAaw8h6WVJOByfveHA8n/TrNG8PD4rVQ
	 SKfAoNyPjWNDpU5W8jwWggLpKIUVyy/BWaBfZQ5Fszg21UosKDEpXAmw92pwkRuYUG
	 GWSJevSfD8a6Q==
X-CMAE-Analysis: v=2.4 cv=XLyJoQhE c=1 sm=1 tr=0 ts=6a74b441
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=IkcTkHD0fZMA:10 a=c92rfblmAAAA:8 a=FXvPX3liAAAA:8 a=oxwd6GwiUieZuYK6bCYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvGzcOZaWPEFPQC_NcjD:22
 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 9ad4ae725fcf121e8f62595ab4704b0c:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
Message-ID: <3dee4d8e-ee37-457b-abba-4a2087983cb3@squashfs.org.uk>
Date: Thu, 6 Aug 2026 17:25:05 +0100
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Squashfs: check block offset is not negative
From: Phillip Lougher <phillip@squashfs.org.uk>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: sashiko@lists.linux.dev
References: <20260805175900.600140-1-phillip@squashfs.org.uk>
 <20260805111526.18fad215e3bb29a254814256@linux-foundation.org>
 <23ad1c7b-8b9c-4f81-ba17-129ae787ba40@squashfs.org.uk>
 <20260805184822.36433a12a7c0df21e5d49874@linux-foundation.org>
 <411520ff-cc9f-4563-8d46-9fc1044f8b46@squashfs.org.uk>
Content-Language: en-US
In-Reply-To: <411520ff-cc9f-4563-8d46-9fc1044f8b46@squashfs.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfFrxCj8XJIVkwAT474vZOjaokuL3egfmK7VhEVH2jLePS2Tt+1nQeQ1bnbHsYztyDrPjxHsnlvTOL6VpYy9WDC98vhZJbnsAEE6ezZJfnFsa1bb8ss2N
 HtkeaXu9rMIzeejU6Fq3KpFBP54o1i6hzT5h8KFV3wTkCiwehOE6w1rdjjKu7rHf+9+GFadPGIZYxlQBLGpnQLWMyG4uX4e82A2T/x+Omq6jjRZeskJAWTzt
 nRB0z2eUtNwco82hewiCMg==



On 06/08/2026 17:10, Phillip Lougher wrote:
> On 06/08/2026 02:48, Andrew Morton wrote:
>>
>> (cc sashiko@, I trust that's OK)
> 
> If it gets Sashiko to fix their problem then no objection.
> 
>>
>> On Wed, 5 Aug 2026 23:29:27 +0100 Phillip Lougher <phillip@squashfs.org.uk> wrote:
>>
>>>
>>>
>>> On 05/08/2026 19:15, Andrew Morton wrote:
>>>> On Wed,  5 Aug 2026 18:59:00 +0100 Phillip Lougher <phillip@squashfs.org.uk> wrote:
>>>>
>>>>> If a negative offset is read off disk (for example the offset into the
>>>>> decompressed fragment block), this will cause squashfs_copy_data() to
>>>>> perform an out of bounds access.
>>>>>
>>>>> Fix by checking if offset is negative, and returning 0.  This matches
>>>>> existing behaviour where an offset beyond the block returns 0 bytes
>>>>> copied.
>>>>>
>>>>> To trigger this out of bounds access requires a crafted Squashfs
>>>>> filesystem and CAP_SYS_ADMIN to mount it.  Unprivileged users will not
>>>>> be able to mount such a filesystem, but once mounted, an unprivileged
>>>>> user can trigger the out of bounds access by reading the crafted file
>>>>> with the negative offset.
>>>>
>>>> AI review thinks we might have an information leak in there:
>>>>     https://sashiko.dev/#/patchset/20260805175900.600140-1-phillip@squashfs.org.uk
>>>
>>> Having done some more research, it looks like the AI is using an OLD kernel version
>>> dating back to before 2018-08-01.
>>
>> Thanks for looking into this.
>>
>> I'd be surprised if this was the case, but what would I know?  Perhaps
>> Sashiko trained itself on a seven year old kernel?
> 
> The solution to the mystery is to look at the Sashiko output, to
> see where they got the kernel.
> 
> *********************
> Selected:
> squashfs-next/HEAD / 62421645
> *********************

This isn't a one-off, Sashiko also used squashfs-next for the following
patch.

https://sashiko.dev/#/patchset/20260724190556.1950693-1-usama.arif%40linux.dev

Here it complains that the patch won't apply to the ancient squashfs-next kernel version.

This is probably going to happen to every Squashfs patch until this is fixed.

Phillip
