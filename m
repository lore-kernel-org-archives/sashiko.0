Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D530A3C09EE
	for <sashiko@lists.linux.dev>; Sat, 17 Oct 2026 18:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792260254; cv=none; b=cpSIhDZf/Dzql6sndKnsFg5LfeFXKoOvjmF/icAg8xSgSxyuW9hSLzZzqyDAn5/4Yuppk0zKqJ7Lft4P7mGBoTLPngXz/f8p0KTRuhS00U0WHeiA48pX74hzJpojchXU0ykTcFfr6FMT6r2IvUj3smnRzlOVykGoCdK0nyKwpmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792260254; c=relaxed/simple;
	bh=nsvFWzJreNgGiRp694xBMZzDpE+ugrA1dHXFiU9pIRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iP6UylgqmxczAdNdiA6qmYC/4XH9tA3U7kmVKKP/gBiYAuBBvaaHF1cVVVn3Rc68+SgptIxxUsksJl55pHNyp66BTZZhjROjL95qUfIF6J4myD5dW7Lcf8pXeFgzl+O+hjGSN//i/SpmKXMjD2DwrnCYt69d+5J7Zn8eoV9QX5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=UCSf44MN; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="UCSf44MN"
Received: from macsyma.thunk.org (pool-173-48-111-190.bstnma.fios.verizon.net [173.48.111.190])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 69HI3rZ3013060
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Oct 2026 14:03:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1792260235; bh=VLRBjjbMGL8eXUemniaJks9UPXo1eEsQUoQeI3w6Ro4=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=UCSf44MNe2ddwdtAn2ty2Qzqzg6s+9vwQ1zb1gZgToVYM1X2LOrZ5tfckiJvzcABC
	 jlnDbudNyBX4gA9x5KXUwpoRe7jGBT9qYi33tOcRHXmdkMI7fcPRl70enhLLvde41N
	 qcyCVhHWrxm8ZYWkzHu1SwPc963mI3s1gbM29e4FmWan0x/lW00cmuYd04RRo5Trlp
	 Ie6+zgW1wLYt8FRjEpmpKVz7kbcytYqT18IXAhbUuTQ3APfhLGp7ElHyIvWtu1GdcR
	 Cpgqsef+Urv86fAM57rQaI4xrk6vIqUg7Gli8Eg1cOq1/bctRhWqrU+ufxjJLog7qF
	 0QrkWq2vi/8zw==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 682B8215E605; Sat, 17 Oct 2026 14:02:53 -0400 (EDT)
Date: Sat, 17 Oct 2026 14:02:53 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Jiri Kosina <jikos@kernel.org>
Cc: ksummit@lists.linux.dev, sashiko@lists.linux.dev
Subject: Re: Patch pre-submission to Sashiko
Message-ID: <atO3pCuUxI950ftN@mit.edu>
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>

On Sat, Oct 17, 2026 at 07:28:48PM -0500, Jiri Kosina wrote:
> I have just received a v1 to v11 patchset submission within roughly one 
> day timeframe.
> 
> Neither myself nor anyone else did comment with any review feedback, 
> except for Sashiko. Which I believe is what triggered all the immediate 
> resubmissions.

What some subsystem maintainers have requested is delay sashiko
reviews from being sent out by some fixed time, such as 24 hours.

One approach which might want to explore is an exponential backoff.

> Another option I'd like to propose would be to introduce a way for 
> submitters to run patches through back-and-forth with Sashiko even before 
> properly submitting the Sashiko-polished v1 to maintainers and 
> mailinglists.

It's not that hard for people to set up a local Sashiko. and then use
either an local LLM, or their own cloud-hosted AI tokens.  Perhaps
that's something we can encourage.

						- Ted
