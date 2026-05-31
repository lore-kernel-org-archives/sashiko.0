Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410EE374E64
	for <sashiko@lists.linux.dev>; Sun, 31 May 2026 23:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780269477; cv=none; b=JBbclcV9Ee2Zf1t1Sm/sDh+OBwDt44ApaC3VPsIlbxl/mZz9jva7X7PTWgeJD5FN4GJYiMQdDQNF5ZElqZUOeD6l87RSb7+R5MOHWAAE7weVxl7TG4VB4kH0iux7/hSpKAzgL31uoJmsymZjw6zbpwvhneaM0WYtBqg1vvqMAsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780269477; c=relaxed/simple;
	bh=JKMWi8YEtJgK0gezmc1y/SBWxr7NIzzY9Gm5NmIvnIw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc; b=P91vabF1+Z5vfo6qQThJ7UGXGyLHtIYs/GC6IzBCXvJvoSQzvChqAoRMO/6/mQmjeoMHeWzqi3kaAHuaQjul/Vwk/YfRFJvT0SrO8penuo9vwIO89/1gy4SvDpc18YXYn8N1ho/ReFjy6hYQUOh8Sbau3CGvhSdTh3ul0Rppp7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PpXsUuyV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PpXsUuyV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF75F1F00893;
	Sun, 31 May 2026 23:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780269474;
	bh=JKMWi8YEtJgK0gezmc1y/SBWxr7NIzzY9Gm5NmIvnIw=;
	h=Date:To:From:Subject:Cc;
	b=PpXsUuyVx7MZsNb5SgoHz6F8JVqdixyrT4IofMYrZySbrhLLXPMyZ9BvshSW7v0HH
	 h/RKhB7gVpeyKzvG8fmUdNrYeT6VWTDiM//At1T75ohqY1LNk6VyxnLwqq1K+AEbmT
	 lYtd0qwl6Uqo54Tso+KBD0bja8mchAdhDpn+xJRkhss+/rg4qODVaeXGEhUjlQ7WnW
	 t6XM/8s53xcWWSaHrjNQuwJgLh+CFMGsIsejOz5k6fgyYawOUenU7L3jBuK5pPLF16
	 p1npJZjTuRmQ01ve4iS6TL/BPz9KZ4B8MU7IdUG+4MvkIGtQJIdfSZL2lAbw3v6SGL
	 4pwn3r9ozJiaQ==
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 01:17:52 +0200
Message-Id: <DIX8UX2TJP8E.4OAWKUUF5JG1@kernel.org>
To: "Roman Gushchin" <roman.gushchin@linux.dev>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Sashiko email policy precedence
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>, <sashiko@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2

Hi Roman,

We just enabled nova-gpu with the reply_all email policy and I noticed that
sashiko does not actually send any such replies.

I did dig a bit and it seems that the logic here is that if there is anothe=
r
mailing list Cc'd that is in the sashiko email policy, but does not have
reply_all set, reply_all is removed (while reply_to_author is always honore=
d
regardless).

In contrast, if another list that does not have an email policy at all is C=
c'd,
reply_all is not removed.

For nova-gpu that means that the only way currently to get the reply_all po=
licy
would be to never Cc the rust-for-linux list (which only sets reply_to_auth=
or)
in the first place.

In fact, it seems to boil down to any subsystem list that handles Rust code=
 is
stuck with reply_to_author, regardless whether it wants more (e.g. reply_al=
l) or
less (no reply_to_author).

Given that the rust-for-linux list is like the lkml, I think we should spec=
ial
case it, so it does not mess with the policy from other subsystems too much=
.

One low-hanging fruit to improve this a bit would of course be to add
cc=3Dnova-gpu, but I'd still prefer to be able to get reply_all without dro=
pping
the rust-for-linux list.

Maybe adding a separate flag to be set by "catch all" mailing lists could b=
e an
option?

E.g. when 'passive=3Dtrue' is set and a passive list is matched with a non-=
passive
one the passive one won't impose its restrictive defaults (e.g.
reply_all=3Dfalse) on the non-passive one.

- Danilo
