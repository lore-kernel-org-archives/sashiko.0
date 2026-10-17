Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269EF3BB690;
	Sat, 17 Oct 2026 17:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792258132; cv=none; b=eJxdElImo+ELs1o1aYzJYxdcUq6YTdEWn4B6JRqPd6psnvgq8dsLEx8jhAeO5HZi0WFOi/GD77tRGFnkSAHH+A30yOw4SLaV6p3vrkYHMN4ODK2znWnrXlU79jbcd7GPUlkaBxCMZNmYBYAkmtwHLV2xl9sQ1OrJIyIxpS5AdBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792258132; c=relaxed/simple;
	bh=oQamr2SaX+J/IlFeizv1BDwMNoEvkNxfGP5uJX9R+p8=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=oP0qUUA5W4G9js2C1xtA7miFFX9jKu/oCBgrckLzQ0ReowgXp2xjWplxda9TdOGHa7yiXoO5hV3H6UUQN0QknHMmPbBbIXctNeWHKxHKU0mwJ9juVGU07Ya8Lsc90SuRyX2MFh/I09miXGPlkAjIwcnstHMHV2CJcXdNwSidOzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iN7TvZ54; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iN7TvZ54"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E2F81F000C5;
	Sat, 17 Oct 2026 17:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792258130;
	bh=gcwOR9FUtF7LUnaye7Fu/VRP0G82zS91qEbvSfaX54s=;
	h=Date:From:To:cc:Subject;
	b=iN7TvZ54bbPrDl8ruFK3JnrNldS3lc6mdZSMnYBksrm8p2ZfSIwREJ8cLo8cFVMuM
	 cMoQQFLKrD7dCEqybqs0VTafDUm0n1oiWaG9JnRtdzT9iYZQEiDAMj2u/5b0raJRpW
	 cVc0hD+ud3VXvOFjKNy2HynRxMmZv7WDNeJ3wy7hnFwTktoa8QtiaN2TRxBKsmgA9y
	 Uo27j8FyMbRImjqoZdGi7/0CzBCeSrFB5aVHFv0cG39SqZm4smS7PjY1xs+dhIfoga
	 PsDKOFU2mIY1JTvMY3J/xBqaO+2khXkQsMbCMJX5HwkEX9eEcrssoBBWUlWOpeIHtZ
	 09wMD8YV8gjaw==
Date: Sat, 17 Oct 2026 19:28:48 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: ksummit@lists.linux.dev
cc: sashiko@lists.linux.dev
Subject: Patch pre-submission to Sashiko
Message-ID: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


[ in the spirit of the concluding discussion at this year's maintainers 
  summit,  I'm using this list outside of actual maintainer summit 
  planning :) ]

I have just received a v1 to v11 patchset submission within roughly one 
day timeframe.

Neither myself nor anyone else did comment with any review feedback, 
except for Sashiko. Which I believe is what triggered all the immediate 
resubmissions.

I don't think this is sustanable.

The idea of throttling Sashiko's responses was gently nibbled at the 
summit, and might be one of the options how to deal with this.

Another option I'd like to propose would be to introduce a way for 
submitters to run patches through back-and-forth with Sashiko even before 
properly submitting the Sashiko-polished v1 to maintainers and 
mailinglists.

Would that be possible and reasonable?

Thanks,

-- 
Jiri Kosina
SUSE Labs

