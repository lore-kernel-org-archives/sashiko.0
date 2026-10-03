Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F79B2D7DF1;
	Sat,  3 Oct 2026 18:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050845; cv=none; b=CMGphzWgDKkn3hMmd6iHo300cxxibTk+AKjX+TFpi485gikNX0IgjvX9U3gtQrAGxe0klsmH+9OAYfPt/OQ4smCn2wrjiGB4B9wjdjQ48OkICqsE1fpoPboFxq++UmxJErFk8dKxWx1xtl4mOLOZnSYbDVZ8rKna+lkSSfdMRTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050845; c=relaxed/simple;
	bh=3apdDdmaWidZqzkbmLJZ/E8wqK4LiOT6Gag/qBoEIlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uBvQQ8J9miFDL3Hrqvc3kVkWCJEdtzv/MFApL6H3bMy1w9TJ36UhzcwSYNSnO5m5twZkRwOxH/YlYujLnWZvzvMd+VpIs0z4y0NpOOOC3OEJnIqHM16XJ9PiZLFf2aycKFCEll+g//kknSTPunsfB9o9gHxceiE70rnzj2UiX4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jvBarstw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jvBarstw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B44A1F0089B;
	Sat,  3 Oct 2026 18:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791050844;
	bh=zxQsW4lNjayl9MqsLcSVU14C7+aEJeV7gQIETWFy8mU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jvBarstwdjoErVZnAxQVRZ0xPvpTnw32e0UtMoVLemNrFeKM9O+95nkb0qt6lQpYT
	 e9g3YiRAJgWFSAptbtEE4bICBbssjvEMMeQsqHJz38fNetJ/1hoNfth6w1MuYCa5PN
	 LLZk3d1nX7ZDhJK3z99Y/JaAUn/LF2Wk0vOyKX7M0EKuOpkQX7SV1Gng9zEqzfdpIj
	 4su+gqfhhro02yH5XhjG8ackFz6mZxYo+4ntZhM66Rj8gAjCcFyR/WlU3maYfxD/HK
	 2sxprHKEGySONqZoRx4IWzpJPLki1MLXvKjuKOlEk9tkjVrzD5lG1Ev2CBKTRAJxf5
	 LJrqm++XEIKqA==
From: SJ Park <sj@kernel.org>
To: SJ Park <sj@kernel.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	Matthieu Baerts <matttbe@kernel.org>,
	Alexey Gladkov <legion@kernel.org>,
	oleg@kernel.org,
	sashiko@lists.linux.dev,
	users@linux.kernel.org
Subject: Re: direct replies from sashiko
Date: Sat,  3 Oct 2026 11:07:19 -0700
Message-ID: <20261003180720.35281-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003171045.33520-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat,  3 Oct 2026 10:10:44 -0700 SJ Park <sj@kernel.org> wrote:

> Hello Roman and Sashiko team,
> 
> On Thu, 01 Oct 2026 17:21:49 +0000 Roman Gushchin <roman.gushchin@linux.dev> wrote:
> 
> > Matthieu Baerts <matttbe@kernel.org> writes:
> > Hey!
> > 
> > Several questions here:
> > 1) What mailing list are we talking about? There are per-mailing list
> > policies defining if and who sashiko is sending emails.
> > 2) Do you see findings in corresponding patches on sashiko.dev?
> > Sashiko previously reported preexisting bugs together with new bugs,
> > but now it's putting them into the database available to corresponding
> > maintainers ("bugs" button on sashiko.dev), so the number of emails
> > might naturally drop.
> > 3) There might be a bug somewhere :) I need more details to dig in.
> 
> I also noticed Sashiko is not sending reviews as replies to patches that are
> sent to damon@lists.linux.dev.
> 
> The last time I got the review reply [1] was 2026-10-02 07:14 (PT).
> Today I sent a patch [2] and didn't receive the review as a reply to the patch.

Maybe I was impatient.  I received replies after ~1.5 hours.

> 
> Also, from Sashiko web interface's subsystems dropdown menu, I show two menu
> entries [3,4] for 'damon'.  Given the URL, it seems the second one [4] is based
> on a wrong DAMON mailing list address.

This is still same, though.

> 
> Could you please take a look when you get a chance?
> 
> [1] https://lore.kernel.org/20261002141421.AF3431F000FF@smtp.kernel.org
> [2] https://lore.kernel.org/20261003163101.32739-1-sj@kernel.org
> [3] https://sashiko.dev/#/?list=dev.linux.lists.damon
> [4] https://sashiko.dev/#/?list=org.kernel.vger.damon
> 
> 
> Thanks,
> SJ
> 
> [...]


Thanks,
SJ
