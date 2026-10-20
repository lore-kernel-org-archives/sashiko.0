Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506059;
	b=gMw+3bQQIJYI5QpD8FFQ+mmuk8tyVk9TQrMnqTaTX0EhdKfCJ3pAto67vLAKpOhsB8oy
	 vIy2XDmRTPv4c5CGITOUHmnf/CdXCzyz/SodvCb6BaWxEMp/f2t2pB2ORo+2qKG/FqIKk
	 ic5No26QPHcoymyoGHgrOvpxdaap+5092rxcvpHsVbZ3q4AgPwc3lLrZO4otq98OGEPvO
	 J9XUTafliTSDSIW60ydYZoxXfVP4BFFRWF3iX2JJI87d94ZCPZrOVMVZ3/a23HdOFzgH1
	 ld1cuxQnlLy036YncEMJBTZ0bJXggxvaaQvfdhi9c1AqvMB7TeRiFtIdz8rzZOVNvGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HceqZTMO1xgG8tL+I11wcK4gHSJ0kl/MBzzbOif+1Kg=;
	b=QAp7DlFHAUn24fBlBHkzbb9Y/lu7WNAW5PtHTW2HsKsBFREELzB91IF0UgXur8HJ4S2z
	 ZHUfwqUNwRpSzVsVMw5R1IlQKhJu7Ko3uxF+M9WyP2lj4jT4Bm+XEXIAe/jeC/DT8n6TS
	 lUkSx4BEb7P8o3+8Vfpxk3HbaBOpxHhgIl0bysX4zlP0XzxdVCB7D2FMwVghRyTBgtZZh
	 H1YXy9zQYY8IrwRxJUftoz/RYMzclL/V7J2AA/XzAJ4lK/M74VuwzbwQfl+n1zrsdoIf5
	 AiyXt1a+LwzWYLArnamnq5BpMd21z3LN7LNslmudR+j92OtJje1gXbGHHq/sDmAcb+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=JTXYZDdU;
	arc=none smtp.remote-ip=199.89.1.16
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3F3606AA28;
	Tue, 20 Oct 2026 14:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D3F3606AA28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=JTXYZDdU
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4j8F2L64mdzlfvpn;
	Tue, 20 Oct 2026 14:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1792506056; x=1795098057; bh=HceqZTMO1xgG8tL+I11wcK4g
	HSJ0kl/MBzzbOif+1Kg=; b=JTXYZDdUUrlYgXbh/T8LAQIjZdPjKgXGH+DTyS0C
	EfdbJPMe8aoS6y6aNHww65Cp+5akkw/pjeBpx/l6XzlSGhGH9CXmj21iM1p9z4vN
	hXJGVkm+Xc/nFRxM15V8om6qqAbMaZj7yR/Q3jMeSTUxAMclTD4t7etR+VaSl4Vc
	oLwnma6ti2+tEB96gna8pj6f6UblEC+U+GtuGJBbl/bsPz9DwI5ZPMfyzNvzkQIM
	58UKyeR6PXHpMDYDGcgTRzSw5Kfn23e2fO+0dO8vi4PcNqoM2p2TFMeNbQk6N5/x
	eEL8W+bwjDPft7/rKxZvpQfylH4fztjhtnzHa5MAdTc7AA==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 8sStQKipwe_M; Tue, 20 Oct 2026 14:20:56 +0000 (UTC)
Received: from [192.168.51.14] (c-24-6-239-25.hsd1.ca.comcast.net [24.6.239.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4j8F2J03fPzlfvpK;
	Tue, 20 Oct 2026 14:20:55 +0000 (UTC)
Message-ID: <2fef166e-088d-4ffe-8d0a-0143aebc1b26@acm.org>
Date: Tue, 20 Oct 2026 07:20:53 -0700
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patch pre-submission to Sashiko
To: Theodore Tso <tytso@mit.edu>, johannes.goede@oss.qualcomm.com
Cc: Jiri Kosina <jikos@kernel.org>, ksummit@lists.linux.dev,
 sashiko@lists.linux.dev
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>
 <atO3pCuUxI950ftN@mit.edu>
 <3354ebda-5158-489b-a577-5cb10e5d5fb0@oss.qualcomm.com>
 <atZ4J86j7CXF82HX@mit.edu>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <atZ4J86j7CXF82HX@mit.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/26 1:27 PM, Theodore Tso wrote:
> As someone else has pointed out, students / hobbyists just use
> OpenCode with the review prompts with one of their free models, such
> as "Big Pickle".  That or a local quen3-coder-next (my current local
> LLM, when I'm not using my employer's cloud hosted models) might not
> be as good as Sashiko, but you can find a lot of the obvious issues
> first, before you send it to the public list.

Does the requirement to run a local LLM raise the barrier to start with
kernel coding? The following approach is not as good as running Sashiko
locally but can help those who can't run an LLM locally:
* Open the website of your favorite LLM.
* Enter the prompt "Create a prompt for performing a Sashiko-style Linux 
kernel patch review. In this context Sashiko refers to 
https://github.com/sashiko-dev/sashiko"
* Copy/paste the generated prompt. Do not submit it yet.
* Copy/paste the patches that should be reviewed into the LLM web
   browser session, e.g. with git format-patch ...; cat *.patch | wl-copy
* Submit the review prompt + patches to the LLM and let the LLM review
   your code.

Bart.
