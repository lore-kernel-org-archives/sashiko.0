Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1121330ACE6;
	Sat,  3 Oct 2026 17:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791047451; cv=none; b=fIknFLYsDKZpXNIniTdVVBHrM82EAt3OGW0V8z2izv/iJSFqTBkGvRnkPb0gR+7cUCJyKoj48MbrEuV0oxRDKl1AcU6FCh1nuT9+fVWGElRSYd1Q0FaVKhUIj8LKa0/nrMJtn19n1Zm9ucjVVN+s09uHFkAckMV+O3nDToCPu1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791047451; c=relaxed/simple;
	bh=fG9x9Yic6dnt4k/NZ4cEWsC9WYO8RGtMzKRyPJ0TOr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BaUgQ2sTRu3L+Wu+0M1gPBdaLH0m7zTwUeCRsH2kG7pJHWiBaS9N+5Gz1vqd97R583AhHi7z4Z5s1yyofEmr15RQaEQk8yKhUwEjp+PbU+9cpFTB9AevR9pJ6W0bJMmCGcuC1oNZr3MgdImhXZfEYX5jIh1G5zSB7Iwg91S79Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DIHcAq8C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DIHcAq8C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A671F0089B;
	Sat,  3 Oct 2026 17:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791047449;
	bh=NcN2Lruc3i69B5WEBweK5SI52X4GVY5yEzu/E91o6Vo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DIHcAq8C/dlztl1RX7b61NVDzIvNKxOvdd52SdVbhK0qD6P6y+/3LMzlnQzhaXTMq
	 ogwlSBxGysyMUnnMkcPw5qg048SvktW+G51nH6Eu6NxSuYAaw4dRxxjO44LnBdlJFO
	 a2Ur2sZhNwKJk366m4hPTppHggtpt+P0fyEENNHlh6QWqPfBvrQLOlPnA+sX1VwxMM
	 Nler/E5RXlmR/1jSFxq5F5Nfn1rZMOVulQ/00y085gN4n6edN7mICen9CnLUUNV92H
	 xKONM0okjHk8PvKgk+I5u1Bfzdqf2Tcd2MewVP4SS3OxShiuoUkRRwL7pPYPn1LBvu
	 havhj9d1jSXRw==
From: SJ Park <sj@kernel.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: SJ Park <sj@kernel.org>,
	Matthieu Baerts <matttbe@kernel.org>,
	Alexey Gladkov <legion@kernel.org>,
	oleg@kernel.org,
	sashiko@lists.linux.dev,
	users@linux.kernel.org
Subject: Re: direct replies from sashiko
Date: Sat,  3 Oct 2026 10:10:44 -0700
Message-ID: <20261003171045.33520-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <7ia4pkxt5ob6.fsf@castle.c.googlers.com>
References: 
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Roman and Sashiko team,

On Thu, 01 Oct 2026 17:21:49 +0000 Roman Gushchin <roman.gushchin@linux.dev> wrote:

> Matthieu Baerts <matttbe@kernel.org> writes:
> Hey!
> 
> Several questions here:
> 1) What mailing list are we talking about? There are per-mailing list
> policies defining if and who sashiko is sending emails.
> 2) Do you see findings in corresponding patches on sashiko.dev?
> Sashiko previously reported preexisting bugs together with new bugs,
> but now it's putting them into the database available to corresponding
> maintainers ("bugs" button on sashiko.dev), so the number of emails
> might naturally drop.
> 3) There might be a bug somewhere :) I need more details to dig in.

I also noticed Sashiko is not sending reviews as replies to patches that are
sent to damon@lists.linux.dev.

The last time I got the review reply [1] was 2026-10-02 07:14 (PT).
Today I sent a patch [2] and didn't receive the review as a reply to the patch.

Also, from Sashiko web interface's subsystems dropdown menu, I show two menu
entries [3,4] for 'damon'.  Given the URL, it seems the second one [4] is based
on a wrong DAMON mailing list address.

Could you please take a look when you get a chance?

[1] https://lore.kernel.org/20261002141421.AF3431F000FF@smtp.kernel.org
[2] https://lore.kernel.org/20261003163101.32739-1-sj@kernel.org
[3] https://sashiko.dev/#/?list=dev.linux.lists.damon
[4] https://sashiko.dev/#/?list=org.kernel.vger.damon


Thanks,
SJ

[...]
