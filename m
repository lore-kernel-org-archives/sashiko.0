Received: from sxplsmtpa04-02.prod.sxb1.secureserver.net (sxplsmtpa04-02.prod.sxb1.secureserver.net [92.204.81.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4203D8121
	for <sashiko@lists.linux.dev>; Thu,  6 Aug 2026 16:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.204.81.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786033478; cv=none; b=VtPQvmOOhFpZ5Dn09T8g9TwO7bCXjfJQibKi7SnxOuyTES4shEZGyrthIp6yq3DAD8fNmimwpjjjz+/j/rMhzqR5etaqrCLiWE9tXt1sJi1F9Q21E7wBjgBc1RxB6bTdaNFtiDyAUatxYS/+NYkjXYsKfdOHIvB8BXW/oBI/zWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786033478; c=relaxed/simple;
	bh=mSEM06BH9xZKY4yvCiWJE7fj13PjcQLioivg4e6kn1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UzH2dO2DFAhrhllGuz9z8vFdxLbNlkBIgX9y5E+oXOdcZOK3/+QkecAItS0uU/Us82/SUsgiO42iD1LiqxR/rbOMV97HSVuYMl0kKTKIi7FS2jeUs5pyDdWv9Dp7G133q9R/nyrSUAqdGEw/nBYlBYubVtDFyRmbX4yP13+0QfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk; spf=pass smtp.mailfrom=squashfs.org.uk; dkim=pass (2048-bit key) header.d=secureserver.net header.i=@secureserver.net header.b=EKAekOIw; dkim=pass (2048-bit key) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.b=rHz2N2MU; arc=none smtp.client-ip=92.204.81.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secureserver.net header.i=@secureserver.net header.b="EKAekOIw";
	dkim=pass (2048-bit key) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.b="rHz2N2MU"
Received: from [192.168.178.95] ([82.69.79.175])
	by :SMTPAUTH: with ESMTPSA
	id s0auwI7sKGv9xs0axwJJN3; Thu, 06 Aug 2026 16:05:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1786032327;
	bh=y3gG437nD9p/095JuA56kGTtre7Eaw4rbBDicRoNMK8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=EKAekOIwbklPJSrtSenmSV3snNITtINoWAx08FfwG0qSNoQRiVNmdrul+W2rYyHZZ
	 V0BlrtipyWlFKRYPXV4BPtFlNLr7UldsdJtW6pmtrgMPB6c7mgB014cEhngiF49fev
	 8FqzwZZ5Q5aHZFF1HAejhlZ38p5WgH2t6o2CWeHZCeZlLK6ElpwXoF8uv4R/EKFtBT
	 XtWSl2+/gvmF6dqeFg83UMWn/SFUG64i6CT6D6H2ELvRe4bPkNiDhI7g+ggUm8hLDh
	 ANfQfTne5nukTXmWQCwYU6VdUGFSWu32ox12PNx0oMxxdIXYBwbj5k1UgQvye7EwTO
	 Yw5MP8D/xx88g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1786032327;
	bh=y3gG437nD9p/095JuA56kGTtre7Eaw4rbBDicRoNMK8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=rHz2N2MUVeVu7CDeYp3V6o3F6X+gEbUlCLzAQk2hOX7M+kslQu8z9vJipopfM3ars
	 QSYNO0NfSE2fqfjNLPc1ICFyvcs4BoyjLb9SEPV0L/hhEVlmPwAWQ7nvhknIviL4kl
	 5BJShfPq/IFAUbi3JGOi4tZ/AkgGgD+8R4B8/n1stSS2HHy1ABy+3ZoX2Ld/vTvUSu
	 JtJvZ4PgdZAkSo8rdIQmvXeGVHjul2Vy8E3Zxk/2mNvVO1nZSj0uf3gUsE5lJQaiyW
	 p1rr4MhuuI573zh+EBO+wFYlFok61Uy+afmgbjroQbETfmSXm/2Vse4oZM9DcogxTh
	 75A1auNz4NBsw==
X-CMAE-Analysis: v=2.4 cv=de85NXXe c=1 sm=1 tr=0 ts=6a74b0c5
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=IkcTkHD0fZMA:10 a=c92rfblmAAAA:8 a=FXvPX3liAAAA:8 a=VwQbUJbxAAAA:8
 a=WNsrnOehiCxbJ6mSG2cA:9 a=QEXdDO2ut3YA:10 a=GvGzcOZaWPEFPQC_NcjD:22
 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 9ad4ae725fcf121e8f62595ab4704b0c:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
Message-ID: <411520ff-cc9f-4563-8d46-9fc1044f8b46@squashfs.org.uk>
Date: Thu, 6 Aug 2026 17:10:12 +0100
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Squashfs: check block offset is not negative
To: Andrew Morton <akpm@linux-foundation.org>
Cc: sashiko@lists.linux.dev
References: <20260805175900.600140-1-phillip@squashfs.org.uk>
 <20260805111526.18fad215e3bb29a254814256@linux-foundation.org>
 <23ad1c7b-8b9c-4f81-ba17-129ae787ba40@squashfs.org.uk>
 <20260805184822.36433a12a7c0df21e5d49874@linux-foundation.org>
Content-Language: en-US
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <20260805184822.36433a12a7c0df21e5d49874@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMiM81ayei4kAwueyXebtDA68jI6Zacf+waas5TVzJXun7MGqeDipRCaN/c1Bh0jNDgi4YdXme+W/Yzv//9xe/LYfm13AmI2hS7JtwDjI0bR5QogA0oP
 8+Smq0SmUD0V9ZzwAhkdfAbxzX8hyIkuCKhB63l+IO9LGo72KgXC80GJfBJucQof1dyQ78LsXWMhplNs9oDhgmyfPzgYNVQ0SvZ9dBocI4Ertg3s4B30Tfte
 T36n+nCu0/nm6pO9enSnHA==

On 06/08/2026 02:48, Andrew Morton wrote:
> 
> (cc sashiko@, I trust that's OK)

If it gets Sashiko to fix their problem then no objection.

> 
> On Wed, 5 Aug 2026 23:29:27 +0100 Phillip Lougher <phillip@squashfs.org.uk> wrote:
> 
>>
>>
>> On 05/08/2026 19:15, Andrew Morton wrote:
>>> On Wed,  5 Aug 2026 18:59:00 +0100 Phillip Lougher <phillip@squashfs.org.uk> wrote:
>>>
>>>> If a negative offset is read off disk (for example the offset into the
>>>> decompressed fragment block), this will cause squashfs_copy_data() to
>>>> perform an out of bounds access.
>>>>
>>>> Fix by checking if offset is negative, and returning 0.  This matches
>>>> existing behaviour where an offset beyond the block returns 0 bytes
>>>> copied.
>>>>
>>>> To trigger this out of bounds access requires a crafted Squashfs
>>>> filesystem and CAP_SYS_ADMIN to mount it.  Unprivileged users will not
>>>> be able to mount such a filesystem, but once mounted, an unprivileged
>>>> user can trigger the out of bounds access by reading the crafted file
>>>> with the negative offset.
>>>
>>> AI review thinks we might have an information leak in there:
>>> 	https://sashiko.dev/#/patchset/20260805175900.600140-1-phillip@squashfs.org.uk
>>
>> Having done some more research, it looks like the AI is using an OLD kernel version
>> dating back to before 2018-08-01.
> 
> Thanks for looking into this.
> 
> I'd be surprised if this was the case, but what would I know?  Perhaps
> Sashiko trained itself on a seven year old kernel?

The solution to the mystery is to look at the Sashiko output, to
see where they got the kernel.

*********************
Selected:
squashfs-next/HEAD / 62421645
*********************

So the kernel they used is my squashfs-next tree.

There are three problems with that.

1. I have not updated the squashfs-next tree in at
    least twelve years (2014 would have been the latest).

2. I lost access to git.kernel.org in about 2015.

3. Having had a look on git.kernel.org, the squashfs-next tree doesn't
    seem to exist anymore anyway (purged due to disuse?)

So the fix here for Sashiko is to use the latest kernel tree, and not an
ancient squashfs-next tree which doesn't exist anymore.

Phillip


