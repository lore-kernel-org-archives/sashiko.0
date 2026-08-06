Received: from sxplsmtpa04-14.prod.sxb1.secureserver.net (sxplsmtpa04-14.prod.sxb1.secureserver.net [92.204.81.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2D448C412
	for <sashiko@lists.linux.dev>; Thu,  6 Aug 2026 18:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.204.81.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040615; cv=none; b=DZ5E/O1/3IgLZqoLUi+IMR//4WcW5wqPXLl8Qi/8z3wSOvoW0avMovywH+3s0+x+HlOmQ3+HnJ1AzgBwneZlfzb39Hg1Qmf4ynxnP4yRtmUsgytGXOmMAqZxxZ3Hgns5TBtFnM6ITMWnBW/Zlir5zwAg6RcphC8H5/xpyml26h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040615; c=relaxed/simple;
	bh=GZSxQtt7JIiXgAaUeVf746sFvEe8+1P82wUEOONHiMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oHcj3roYhF7qQS3zITTdkGUKyjyfLkCZr5ION48WqDriZ0ihuyfsukHBAaevPsHOVmU84db+EFKrLDqIElUVaNwiUN0wBA/VljQDsfYfKyb91Mxk8wuynDvaMeLmGyy/rx3Ntj/EOaDziZrOT4jvzqxItJ2XFoZHxIVvpYsGwr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk; spf=pass smtp.mailfrom=squashfs.org.uk; dkim=pass (2048-bit key) header.d=secureserver.net header.i=@secureserver.net header.b=vOigX8Cx; dkim=pass (2048-bit key) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.b=NOakwsga; arc=none smtp.client-ip=92.204.81.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secureserver.net header.i=@secureserver.net header.b="vOigX8Cx";
	dkim=pass (2048-bit key) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.b="NOakwsga"
Received: from [192.168.178.95] ([82.69.79.175])
	by :SMTPAUTH: with ESMTPSA
	id s2RzwheIJwSdFs2S2wSjEt; Thu, 06 Aug 2026 18:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1786039461;
	bh=SAzr8hnjzRxify/FuDWf95ZSC9uH5j4Y5RrcBuCvxhQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=vOigX8CxovjglJcilMxGyIvkDr0QmKFyEJTMgr+fezV7w1p82yNfRYrXIbmn2Kguf
	 pGDiYxgWucHOsRz0yyVjNWMzpUz+qPOUEEDkAwQPL+0Oy6UbjJp2U8ipYXFQWB9TxO
	 DqhNrDDNRg+dn+sN87OKyVgD8wDItD7LpYucm/kILO4wvJ0hXeAUllYZ7uIEJhfj7P
	 hGIB6wEBWlvbjQUTjm4jxCcqYynOf7dlgQ6cPb3rUjpSrUUKhKf/lwoUvZQMXXRFXs
	 a5H7e9ral+S8Kd9o0UdACFHdNwgLO9JW6Qil78oxdI2BiUUNvYRwSO4P0GehV5Dq98
	 UdvDhRRgE2kdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1786039461;
	bh=SAzr8hnjzRxify/FuDWf95ZSC9uH5j4Y5RrcBuCvxhQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NOakwsgaIaqoY2XXnMenrB8LAYNXhy6hprhLvQvXGQG4Gu1j2kYsRIzxbwGEHp2wX
	 +AJ8DQA+H+4rcZjtrjOScVNyC8KKSKaqpWxaETVVTdqM6MGwcFeR6JIjzSflGMgrEG
	 hfeIbnh2J3TGNTJfHmoXLxHSxAHMvEZENc5va3TovZzvZgWjJL3XGl0QbZKmNvyZqW
	 u9XQeEzrTPjrcb0pxEGGYsN/BR5luVeyMgxIMwsmY/nmv7GvEKVlolg2DO7AIwjnVZ
	 1l4hozsaSxDTcyltdAd8AB6mPHS+Zt49naRbk/TuKdyt9M16ytfXcrNExdBH+nt8Gp
	 Km7DpUaQYZ7ag==
X-CMAE-Analysis: v=2.4 cv=MfXGfZ/f c=1 sm=1 tr=0 ts=6a74cca4
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=FXvPX3liAAAA:8 a=FP58Ms26AAAA:8
 a=QyXUC8HyAAAA:8 a=Z4Rwk6OoAAAA:8 a=wGL8h_JeXLvnNHO2eOoA:9 a=QEXdDO2ut3YA:10
 a=UObqyxdv-6Yh2QiB9mM_:22 a=HkZW87K1Qel5hWWM3VKY:22
Feedback-ID: 9ad4ae725fcf121e8f62595ab4704b0c:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
Message-ID: <267938f6-8212-4ddc-9055-452f9d166010@squashfs.org.uk>
Date: Thu, 6 Aug 2026 19:09:10 +0100
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Squashfs: check block offset is not negative
To: debarbos@redhat.com
Cc: Andrew Morton <akpm@linux-foundation.org>, sashiko@lists.linux.dev
References: <20260805175900.600140-1-phillip@squashfs.org.uk>
 <20260805111526.18fad215e3bb29a254814256@linux-foundation.org>
 <23ad1c7b-8b9c-4f81-ba17-129ae787ba40@squashfs.org.uk>
 <20260805184822.36433a12a7c0df21e5d49874@linux-foundation.org>
 <411520ff-cc9f-4563-8d46-9fc1044f8b46@squashfs.org.uk>
 <anTGjto5EmCpW68T@debarbos-thinkpadt14gen5.rmtusma.csb>
Content-Language: en-US
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <anTGjto5EmCpW68T@debarbos-thinkpadt14gen5.rmtusma.csb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfP1kToNmUuGo3uUb3Fkq57ijULoTQNaPyymX8eapEh5o1naL7Jx8EgCPo8pRTBtdti98bt8enAbUWuX8N4lnraKKhHTqXpZ3Ssne2j3iweCI9R7OGsy7
 VkPi8Ly5sQBVe1nnc6UEdw7tsLEfLRsuJ5//FkTYwFTY6FIvL0+xFvcOqKDvGJKRiAdrXGX9jq4u6Qvn41TJFFgAmh+VK9jJfLi12GMpWvRor8XUGd0UlOVq
 utdLGUA4yqB9Fj/5DiRgVZNpuVCHidYWA4Jk4pFnSJk=



On 06/08/2026 18:44, Derek Barbosa wrote:

> Yes. It seems like Sashiko is selecting the incorrect baseline here. However,
> from what I can see in baseline.rs, Sashiko pulls the mainline MAINTAINERS entry
> and parses it to find whatever "matched" subsystem it could detect from the
> patches.
> 
>  From Torvald's tree (remote:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git) with HEAD at
> fcaeecb8b0cd44f77d03b28de0671258d4db18f8
> 
> SQUASHFS FILE SYSTEM
> M:	Phillip Lougher <phillip@squashfs.org.uk>
> L:	squashfs-devel@lists.sourceforge.net (subscribers-only)
> S:	Maintained
> W:	http://squashfs.org.uk
> T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pkl/squashfs-next.git
> F:	Documentation/filesystems/squashfs.rst
> F:	fs/squashfs/
> 
> I may be mistaken, but maybe updating the "T:" entry would resolve the issues
> you are seeing? Is this the same tree that you described as "purged"/unused?
> 

Yes, the git URL (the T: entry) is out of date.

But, until you mentioned it now, I didn't know it existed,
because I never added it.

It was added in commit https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9f273c24ec5f4

author	Fengguang Wu <fengguang.wu@intel.com>	2016-01-20 15:03:25 -0800
committer	Linus Torvalds <torvalds@linux-foundation.org>	2016-01-20 17:09:18 -0800
commit	9f273c24ec5f4a6f785bb83e931b3808a07b459e (patch)
tree	7bc0126edb6ded71bec82e4c057768d76928b2f5
parent	b2807f07f4f87362925b8a5b8cbb7b624da10f03 (diff)
download	linux-9f273c24ec5f4.tar.gz
MAINTAINERS: add/fix git URLs for various subsystems

@@ -10217,6 +10242,7 @@ SQUASHFS FILE SYSTEM
  M:	Phillip Lougher <phillip@squashfs.org.uk>
  L:	squashfs-devel@lists.sourceforge.net (subscribers-only)
  W:	http://squashfs.org.uk
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pkl/squashfs-next.git
  S:	Maintained
  F:	Documentation/filesystems/squashfs.txt
  F:	fs/squashfs/

I will send a patch to remove it.

Thanks


> 
> Thanks,
> 

