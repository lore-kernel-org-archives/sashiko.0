Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E93C4BF953;
	Sun, 18 Oct 2026 13:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792330941; cv=none; b=hJiZ5rD3yIjjY6rQ3XjKzXbQAolk6h2nQ5Cv/VE32L7D/X+jV1SPDWm5Gt2vX/VTJCwFv1+T0vsENGB+rq98tHvY/qHRwZtMWQOtMRzmN0KgAxvFh8wPBk+t7izYCEX422+T0uvaoRh9x6FRQoTpb8mG5mw9HhZ/Gd1WxsfPyGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792330941; c=relaxed/simple;
	bh=3nGLzqDHxScIKItq9ybfSkqsHksx/zcJd+7cji0aguE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MWnvT5lBpXQqHCxouupPiAfcVnBIMTsJB1LuTCwt43KAD0Cpf1uhf5CHSuyu0tHu/Glupk1O60So2AGZG0M/OmRCecwBxZXpDKoSqFRS+tbL4vY3dIy7O5MxMQF3rOnOt/b0pON4BSKwets7MTJxykZy4tJGFKHVzJwV9jAnYA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=G38CWdbY; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="G38CWdbY"
Received: from omf19.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 9F003120535;
	Sun, 18 Oct 2026 13:42:11 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf19.hostedemail.com (Postfix) with ESMTPA id 0156B20026;
	Sun, 18 Oct 2026 13:42:09 +0000 (UTC)
Date: Sun, 18 Oct 2026 09:41:59 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Jiri Kosina
 <jikos@kernel.org>, ksummit@lists.linux.dev, sashiko@lists.linux.dev
Subject: Re: Patch pre-submission to Sashiko
Message-ID: <20261018094159.09f9e99a@fedora>
In-Reply-To: <7ia47bjg141n.fsf@castle.c.googlers.com>
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>
	<CAHk-=wj24dSSRDQjvkmcw9LMC=K86d-Xys9=qX=gKoXgrQN1UQ@mail.gmail.com>
	<7ia47bjg141n.fsf@castle.c.googlers.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout06
X-Stat-Signature: 338w8qirgdztgn1mofj3gsyf4a6daejy
X-Rspamd-Queue-Id: 0156B20026
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18gbdR/3h7R+sou0ktSaadj4qqZnUiVIvg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=3nGLzqDHxScIKItq9ybfSkqsHksx/zcJd+7cji0aguE=; b=G38CWdbYJ5r/XksyPSALQdwIZYYQ1JC4EsoTf9XgKQDjIT7M5lBOWMr9Nmw04XUz7PDnlhkOgm/t3Cr+D7lr8LZQGLJ9QX3ot4sQ9k59DbI9RniaNgbx1y46MDLbHF+L3mjA4EhKxEbmqvxmHDwSfgWNwaO9eSMp95ko4ZGBhbA=
X-HE-Tag: 1792330929-106195
X-HE-Meta: U2FsdGVkX185iDMA7BR3t7h/EzhO/9PV3K+PS71aCCa0zfs3pJNhUokgFVBNh79S9ARYIVV1SuxiFz4zZdnM8GBUZDbW9OaY9TJeyMcL/KYAvaILPykKp+6zluUqX802cF0DAeYlUTk5BI+wVh1pCOKuXN8DWdxyR4gKqzN+zd8DJCneaNh2fIuqPym7BoOrPx4ZHv57DptpSYBVZvOsz9ba81J3lpC/VowG3B7n73yQrMhwtA1oNDvDb4NROfPB17zGrZC6DWvUSYNQ+8TAGsWmDPk5wYeOwlSW04satdBhxyU/bZHELhTLjNmdJ3JX

On Sat, 17 Oct 2026 20:10:44 +0000
Roman Gushchin <roman.gushchin@linux.dev> wrote:

> It sounds like maintainers have drastically different preferences here,
> so I guess a per-mailing list configuration is the only reasonable
> setup? I'm trying to be on a conservative side, so e.g. if there is no
> consensus between maintainers, I do not enable emails.

Right. I have no issue with spamming of sashiko and back. I use
patchwork which is pretty good at only giving me the last version of a
series. And if I see that sashiko made a comment, I would have them
address it before I begin to review the series. Until sashiko is done,
I don't care if they send 11 iterations in a day. It's 11 iterations I
can ignore. In fact, that means I can start looking at it sooner.

As for Andrew's point on testing. I would hope that they would have
tested before sending v1. But sashiko is good at finding things that
tests don't catch. So if they are just fixing sashiko comments, it may
be that their tests are not catching what sashiko is finding. As
sashiko finds new issues with pretty much every new version, I can see
them having to constantly send another version with new info from
sashiko.

-- Steve
