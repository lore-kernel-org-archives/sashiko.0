Received: from mta0.migadu.com (out-130.mta0.migadu.com [91.218.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A4233FE33
	for <sashiko@lists.linux.dev>; Sat,  3 Oct 2026 20:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791058539; cv=none; b=SmV+wNhQCfmTrgzxO4AVYDj0Dtb+13LEHlHSAdrYwPB6wByK5LSQ5qYjpvPK94VJ+BVvqQdKIezm+HZKxMo5f+t80B2Y79k5haIHRXJNqhiaVApkdZf4F+/YEuCbWzOJdeHFT6zksljTjzkBNSWCwx/sDBlW2Y3nGcROjjhqKhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791058539; c=relaxed/simple;
	bh=WaLJImYqjC6ln9Y2pE0O/1/2FSgpww73dmBj9uRatcM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EPUy35SrnpxpxMoiw5rJT/WYaninxqehOvIPHe3bmRR96rMznPBNroNZx46opkQT8CUJvPrdhp/mjnqcs6Pl5mrOmERTtG0/Jg3seUzDydDyh5h6UG12aqK3ORF2eAffq9Nb41NHtlXEMRF1QpqgYU9tlw0ZGsrMhCQA3391hlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=H9ql7A33; arc=none smtp.client-ip=91.218.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="H9ql7A33"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=WaLJImYqjC6ln9Y2pE0O/1/2FSgpww73dmBj9uRatcM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791058535; v=1; x=1791663335;
 b=H9ql7A33VJI9M5ajMbUdQQEaYegvau8exO3E3MyrhQ7V4ad5S0CmqYDDjt84f1BkN+sKQFUh
 IA3D/p96SLYEWdi1M8AWLunBfWnimCBG8PrGEz68hzcbx8i5nwgPQnH/6tHWQBJopiVGjM/zL+Z
 6bTv5IdIHK85H571hUlkwhvI=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id 114ef27b16f4c11c;
	Sat, 03 Oct 2026 20:15:29 +0000
X-Mizu-Trace-ID: 114ef27b16f4c11c
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: SJ Park <sj@kernel.org>
Cc: Matthieu Baerts <matttbe@kernel.org>,  Alexey Gladkov
 <legion@kernel.org>,  oleg@kernel.org,  sashiko@lists.linux.dev,
  users@linux.kernel.org
Subject: Re: direct replies from sashiko
In-Reply-To: <20261003171045.33520-1-sj@kernel.org> (SJ Park's message of
	"Sat, 3 Oct 2026 10:10:44 -0700")
References: <20261003171045.33520-1-sj@kernel.org>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Sat, 03 Oct 2026 20:15:22 +0000
Message-ID: <7ia433umzgkl.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

SJ Park <sj@kernel.org> writes:

> Hello Roman and Sashiko team,
>
> On Thu, 01 Oct 2026 17:21:49 +0000 Roman Gushchin <roman.gushchin@linux.dev> wrote:
>
>> Matthieu Baerts <matttbe@kernel.org> writes:
>> Hey!
>> 
>> Several questions here:
>> 1) What mailing list are we talking about? There are per-mailing list
>> policies defining if and who sashiko is sending emails.
>> 2) Do you see findings in corresponding patches on sashiko.dev?
>> Sashiko previously reported preexisting bugs together with new bugs,
>> but now it's putting them into the database available to corresponding
>> maintainers ("bugs" button on sashiko.dev), so the number of emails
>> might naturally drop.
>> 3) There might be a bug somewhere :) I need more details to dig in.
>
> I also noticed Sashiko is not sending reviews as replies to patches that are
> sent to damon@lists.linux.dev.
>
> The last time I got the review reply [1] was 2026-10-02 07:14 (PT).
> Today I sent a patch [2] and didn't receive the review as a reply to
> the patch.

Hi SJ!

There was a regression introduced recently which made email delivery
stall periodically. Already fixed. Should work from now on.

>
> Also, from Sashiko web interface's subsystems dropdown menu, I show two menu
> entries [3,4] for 'damon'.  Given the URL, it seems the second one [4] is based
> on a wrong DAMON mailing list address.

I'll take a look.

Thanks
