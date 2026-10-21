Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792614263;
	b=0ZPH46354+wY32rGZWkxMxkRJgeO+/gz2ASWjnUyKzkJScwAWdjWSBCb+rmScJMtimLq
	 Z2imMvL2+7HoFwXhaeuWCmB0KloaX2wBZ88TgsuUCIZciAtAzYCk4L55JkYeyoO9uBcOq
	 gs5g9JYYzDbuFzKGKFJbNfUQIYqFK6iMrnd90B/SBje2k/wD5blVeN/Du8kjcvLplSFDo
	 hs8JoS8hZGc6gh4rr/7WggurxtHYD8qTqCzUwhVRQHHcJF4xfF525063kkBMT4C16unT8
	 2A/AkSWumfC5+lsudXWfcSCWaGSOqQXmTebIZ0gvmX+cRwI3dKWpfYwnL+a6OnzlnsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792614263;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Stat-Signature:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-Spam-Status:X-Session-Marker:X-Session-ID:
	 DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=qgdyEv28OeJ87DB/d10CbgPub3rLT6+VElk/uG7ChYw=;
	b=vsN5ncxMcquNTwLpZ6sv+dPLVdFZCaXO9uRHcoD/QQyvwLb+G2KfPGfwxh9MRpN+ep4+
	 hkbwQA8IlOc3ju3bFfpG/1gX/5Li71CfivTOhNenydMernr1zlcphE+MuCT3JSMWadOWl
	 Xuc385Lc56a5kaGQka+3vjx2hLnABtSDY8qkQL8edbA+2L8l7k/hZRscZcIx62FtBZGuF
	 rmdQIrHnw3ky6H30/qahNBGCIDsw+lXIa6hlohVFxnsd5sf9+RDvTY8+/W4DR5g+wtvAx
	 QlLvpUbJNWJKvMWVJWgWT6RwcDLkj3G+4tZ8LVVd1h2jsORfqIqhY89Jy9B6UPnhMUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=D+Wu2VHm;
	arc=none smtp.remote-ip=216.40.44.11
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACBB606A319;
	Wed, 21 Oct 2026 20:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ACBB606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=D+Wu2VHm
Received: from omf20.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 9913D12068B;
	Wed, 21 Oct 2026 20:24:20 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf20.hostedemail.com (Postfix) with ESMTPA id 71BB020025;
	Wed, 21 Oct 2026 20:24:18 +0000 (UTC)
Date: Wed, 21 Oct 2026 16:24:17 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mark Brown
 <broonie@kernel.org>, Theodore Tso <tytso@mit.edu>, Shuah Khan
 <skhan@linuxfoundation.org>, Bart Van Assche <bvanassche@acm.org>,
 johannes.goede@oss.qualcomm.com, ksummit@lists.linux.dev,
 sashiko@lists.linux.dev
Subject: Re: Patch pre-submission to Sashiko
Message-ID: <20261021162417.68c95d08@gandalf.local.home>
In-Reply-To: <r48q9oon-p943-7s4r-8n18-o9rp412o5pro@xreary.bet>
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>
	<atO3pCuUxI950ftN@mit.edu>
	<3354ebda-5158-489b-a577-5cb10e5d5fb0@oss.qualcomm.com>
	<atZ4J86j7CXF82HX@mit.edu>
	<2fef166e-088d-4ffe-8d0a-0143aebc1b26@acm.org>
	<ate8oESqneK-3sQJ@mit.edu>
	<7e473af8-2f7a-4a36-a926-e756873c9c52@linuxfoundation.org>
	<atic3bbDeyJI6MJs@sirena.co.uk>
	<atjlUoEmTagZjrYI@mit.edu>
	<atjpS__OwjZ-Q_Fh@sirena.org.uk>
	<20261021114524.4c2ea2a31a9d527b78e78768@linux-foundation.org>
	<r48q9oon-p943-7s4r-8n18-o9rp412o5pro@xreary.bet>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 4aojnwo9s3una5m6xwjkojscuyyzbm7u
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 71BB020025
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/FRH38HyGy566oAysKaAt3LbxqmDs3fYM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=qgdyEv28OeJ87DB/d10CbgPub3rLT6+VElk/uG7ChYw=; b=D+Wu2VHmPE8MjCZT73aLQX/m+P4WmgaD1hFpqNuvIVmrOiAv/qEoZhjFB7LLNYOIO4PqpE13eX+RCgmD5/0h4ht6G0D//oG+ADf8DSm0vzT4qjogj/pFAghKuSLc+0EbwdWbCYzlHUyHf/awGSMOv6CeGJ8l1s5FKWHH/SXEE4g=
X-HE-Tag: 1792614258-354079
X-HE-Meta: U2FsdGVkX1/nJPMLYb/ppwB3asdQoRPHVqf7OMUMngmaoMsPqycdIldl92aJJufBg6RED/BnpZI6tU1xIMKI4tTXisfG1CcEqH/V4CXMWeBVSTClNWUcrmmUcCJNbpTPmhyi4d49L83WlO1dbOTIB86jXth3+coedOCaONMoPONdzR1lAZ/XwY0V4hLv6lqYPluWFoV2dtzY3CHIhdULuNDB9bF9Em/WuOj0CCHVMbYvMyFRRKkkK+oXgqxtkaLJ1GXOxfpfUOx5HHhNnXSLQcg43b9SC0/K9C8vj6JOxqdqTBGZwPjLM+tMu64Kn6TWO6+YwQTCnvAkLc/ymlppjoxuGxqDcJH/

On Wed, 21 Oct 2026 22:10:18 +0200 (CEST)
Jiri Kosina <jikos@kernel.org> wrote:

> On Wed, 21 Oct 2026, Andrew Morton wrote:
> 
> > If someone's fixing something I don't see much value in
> > retaining/maintaining a test case for something we've already fixed.   
> 
> There are engineering methodologies which suggest exactly the contrary, 
> i.e. to make good use of the fact that we had a bug to add test for, to 
> make sure that we never ever regress on it again.
> 
> I can come up with quite a few examples where we broke something more than 
> once in a row.

I try to add tests to most bugs I fix to make sure the tests catch it the
next time. My experience, they catch something a few years later, because
code gets modified and old bugs resurface. Hence, why I want those tests.

-- Steve
