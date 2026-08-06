Received: from sxplsmtpa04-07.prod.sxb1.secureserver.net (sxplsmtpa04-07.prod.sxb1.secureserver.net [188.121.53.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F75340EBB0
	for <sashiko@lists.linux.dev>; Thu,  6 Aug 2026 22:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.121.53.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786055544; cv=none; b=b4aK6Q8LpdtmnTEZZkX67ZBCpjvG46dRGxs6F1T5ZSb5PQhxnI1mmwIiG3ME+NAUrZBQwV7QpRabgBm4SeJndvhGgLKCxqmBlR0IvS3u08Iw1ArY98U5GYmjyufX/ApqNxNnFCs/U79CJ2qZhUHXflVKADjzdlsTfOEkB0uBt/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786055544; c=relaxed/simple;
	bh=q3/KKsabIzVcX4/uZYvTPZuSBAqoVjZX9YoBD+wWPZo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=IaBf8UZK4mdvGYvlPCST0vV6mHnJ5S2TQLzlJWfxhpcwuew6AMB9WYLepU7Js/hpu4ICSCu/knY+1qFLB/XwLgxbCEFMAa0w4uj6BXMqt6/kpBER4TByU4zZ1OfZw3xtMj8IRWjy0ttmGcPG2bawCX19aWNtnJw1AjEWzfzWgI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk; spf=pass smtp.mailfrom=squashfs.org.uk; dkim=pass (2048-bit key) header.d=secureserver.net header.i=@secureserver.net header.b=BhCp1yUr; dkim=pass (2048-bit key) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.b=BE6ALQ2m; arc=none smtp.client-ip=188.121.53.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secureserver.net header.i=@secureserver.net header.b="BhCp1yUr";
	dkim=pass (2048-bit key) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.b="BE6ALQ2m"
Received: from [192.168.178.95] ([82.69.79.175])
	by :SMTPAUTH: with ESMTPSA
	id s45fwxP1HSAxAs45iwvi5O; Thu, 06 Aug 2026 19:49:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1786045771;
	bh=NwPFR6sk44qujnyzqh6dMvWsvIOBE4nrGsP1Y+Bxh+s=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=BhCp1yUrg2GlEEDxzg3ct1xrBENl5iHu5Fa9qjwA1H83Eq6YNRFaGXROILXXZgvOI
	 xoEZIs1Bi0QFYuO+1ru/FdrgI/H2T9x0w/bNVEasWKY5rKIVWIZMYkNcXhJ5GyITwt
	 3CepxLbFDUUfIY5wdd5j9YYBmt5GsYrYFT60WIa3t1oQvgFH3RWA8O8dyCJvjzcw7U
	 Hn7ntH7MdFWgs5zxfzJtG55aF/nISk60ZpVeff/nRE45hGRHj8Ssofyi8L6R5MGN8u
	 b1kpp2SWsENhI0iB0nE63i69ilwqSt8SS7l0GP/Yv77RDacRWPz1OOcv0eHeppF5T1
	 3r+X93DevxC+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1786045771;
	bh=NwPFR6sk44qujnyzqh6dMvWsvIOBE4nrGsP1Y+Bxh+s=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=BE6ALQ2mPDHB/DQOTcLLYj0MWdcQQ/IbfE4O3U+iXTHuN2DKUvHDSBbRIfFXQ5ZdW
	 59jHCfDl4+vkaakY/1Bdp27FGF4tUp5C39Ar2sRVaXGub2DPFGMNxSUfogn9oPdR95
	 FpsJdfYSd9Rg6Xm7ZBZ6jURLv+1W5NQKLt3c5857bEK1j7aUj3I6w3G9T3zp6qDYsZ
	 vcPkYIzCNAm9q31wwAhZulhmyZ8XmIZPuZe/QggmvgHxXVxNuCNiKtGaD6zPTAdipT
	 ZVnsv+TI/VQfwBVf+Bvco+uIpt28rOBznmOHxpMg2oH2qtRZCb9weLaIUlmO60FUCj
	 +yqdJ+w3J8tAA==
X-CMAE-Analysis: v=2.4 cv=McjVU5/f c=1 sm=1 tr=0 ts=6a74e547
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=FXvPX3liAAAA:8 a=FP58Ms26AAAA:8
 a=QyXUC8HyAAAA:8 a=Z4Rwk6OoAAAA:8 a=-D5zdyjjsp_drTYBKxkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=UObqyxdv-6Yh2QiB9mM_:22 a=HkZW87K1Qel5hWWM3VKY:22
Feedback-ID: 9ad4ae725fcf121e8f62595ab4704b0c:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
Message-ID: <d066d78d-52c3-4224-ad50-f87e0ad8595a@squashfs.org.uk>
Date: Thu, 6 Aug 2026 20:54:14 +0100
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Squashfs: check block offset is not negative
From: Phillip Lougher <phillip@squashfs.org.uk>
To: debarbos@redhat.com
Cc: Andrew Morton <akpm@linux-foundation.org>, sashiko@lists.linux.dev
References: <20260805175900.600140-1-phillip@squashfs.org.uk>
 <20260805111526.18fad215e3bb29a254814256@linux-foundation.org>
 <23ad1c7b-8b9c-4f81-ba17-129ae787ba40@squashfs.org.uk>
 <20260805184822.36433a12a7c0df21e5d49874@linux-foundation.org>
 <411520ff-cc9f-4563-8d46-9fc1044f8b46@squashfs.org.uk>
 <anTGjto5EmCpW68T@debarbos-thinkpadt14gen5.rmtusma.csb>
 <267938f6-8212-4ddc-9055-452f9d166010@squashfs.org.uk>
Content-Language: en-US
In-Reply-To: <267938f6-8212-4ddc-9055-452f9d166010@squashfs.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfIEVvcVpEMb/yW1qMis8aGNVUFR3ElUepdOvoobItDNDgxj+D69TKVe/fWABRLLHma71bnVcuuEDjg/hGrI65i4WUGejOcXQQ0aO83isM7jpu6auKHL4
 uG3nSGjDfIr0JVI00B4rt+m/LbXeYG19KDGuakUULEzw5uJ5xXrwe0ylC78HZSoV5hAGwI7w6G1QSbqsXBapsoO5wx57iDnRlR8bOmKLd5x665CxUUz8mJTI
 6j/eXKne4w+7wzcIHFBCi0TljfRuz175QMCmIQjz7mg=



On 06/08/2026 19:09, Phillip Lougher wrote:
> 
> 
> On 06/08/2026 18:44, Derek Barbosa wrote:
> 
>> Yes. It seems like Sashiko is selecting the incorrect baseline here. However,
>> from what I can see in baseline.rs, Sashiko pulls the mainline MAINTAINERS entry
>> and parses it to find whatever "matched" subsystem it could detect from the
>> patches.
>>
>>  From Torvald's tree (remote:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git) with HEAD at
>> fcaeecb8b0cd44f77d03b28de0671258d4db18f8
>>
>> SQUASHFS FILE SYSTEM
>> M:    Phillip Lougher <phillip@squashfs.org.uk>
>> L:    squashfs-devel@lists.sourceforge.net (subscribers-only)
>> S:    Maintained
>> W:    http://squashfs.org.uk
>> T:    git git://git.kernel.org/pub/scm/linux/kernel/git/pkl/squashfs-next.git
>> F:    Documentation/filesystems/squashfs.rst
>> F:    fs/squashfs/
>>
>> I may be mistaken, but maybe updating the "T:" entry would resolve the issues
>> you are seeing? Is this the same tree that you described as "purged"/unused?
>>
> 
> Yes, the git URL (the T: entry) is out of date.
> 
> But, until you mentioned it now, I didn't know it existed,
> because I never added it.
> 
> It was added in commit https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9f273c24ec5f4
> 
> author    Fengguang Wu <fengguang.wu@intel.com>    2016-01-20 15:03:25 -0800
> committer    Linus Torvalds <torvalds@linux-foundation.org>    2016-01-20 17:09:18 -0800
> commit    9f273c24ec5f4a6f785bb83e931b3808a07b459e (patch)
> tree    7bc0126edb6ded71bec82e4c057768d76928b2f5
> parent    b2807f07f4f87362925b8a5b8cbb7b624da10f03 (diff)
> download    linux-9f273c24ec5f4.tar.gz
> MAINTAINERS: add/fix git URLs for various subsystems
> 
> @@ -10217,6 +10242,7 @@ SQUASHFS FILE SYSTEM
>   M:    Phillip Lougher <phillip@squashfs.org.uk>
>   L:    squashfs-devel@lists.sourceforge.net (subscribers-only)
>   W:    http://squashfs.org.uk
> +T:    git git://git.kernel.org/pub/scm/linux/kernel/git/pkl/squashfs-next.git
>   S:    Maintained
>   F:    Documentation/filesystems/squashfs.txt
>   F:    fs/squashfs/
> 
> I will send a patch to remove it.
> 
> Thanks
> 
> 

I have sent a patch to remove that dead URL from the MAINTAINERS file.

But, the point is, is that enough to make Sashiko default to using Linus
Torvald's upstream development kernel for Squashfs patches?

As I said previously I lost access to git.kernel.org in 2015 (if you ask
why I will tell you privately).  So I can't put a kernel tree on there,
but I could on Github (the kernel is already on Github and so it will be a
simple fork).  But it seems a PITA to do that just for Sashiko.

Phillip
   >>
>> Thanks,
>>
> 
s
