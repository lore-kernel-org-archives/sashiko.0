Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A7950AC19
	for <sashiko@lists.linux.dev>; Thu, 15 Oct 2026 20:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792097921; cv=none; b=ripNkogHo8YpwP3YbtL9AAhrWHvm/JDeO3rUgPGFRW4opiBrgU8eraMdHn1y7g/Wzea48VYXl61O/6MmlVLIJ2T3Y38yXzSNaAqpMy2VF+l5/QiD3VvatokT8Nplp3LzZCQQpEOD/c1+dmUr6/eZIwCQQqBy742e2rMPBEPeYZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792097921; c=relaxed/simple;
	bh=F8Y3svEh/ZyoLXdFdPHMhE/a7klS9TYRoyFzvehP9Q4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=T+YZxqm7CZ4wI4SqLvhp1zbsp1KoDB/ol2SDsO79vUJ1COtvdComZNgXkV3rgGcFY7Z/PxRsqw/z/xolRBUJcKcTpswLEfKleAFJpMN8vWRZloyQWtladWQjHJfaV5a8/ybZHwSN1qMt4arSWfBkdRevRbIeEsqkBd2c6isOTw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=2EMhD7rX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="2EMhD7rX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2151D1F000C4;
	Thu, 15 Oct 2026 20:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792097919;
	bh=F8Y3svEh/ZyoLXdFdPHMhE/a7klS9TYRoyFzvehP9Q4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=2EMhD7rXtH0pi28AV5U63AK1vEj6KltYEYggwUwoi08oGyP1sWRwfkWa1soBz15p9
	 ytFR1ghSakxSfVA9ER19QGQoM/+O6zoiS58cGP637w8RjeLqcSnMDGr7yEcKJI52fy
	 1crT4ROSGsy8S2RIlz1AKEaH74FQrOoE+UOF5nyQ=
Date: Thu, 15 Oct 2026 13:58:38 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: sashiko@lists.linux.dev
Subject: Re: Sashiko change proposal
Message-Id: <20261015135838.d504eae263696370ee4d4ac9@linux-foundation.org>
In-Reply-To: <5eae44a6-06c3-445c-9508-58b372c01b2c@kernel.org>
References: <5eae44a6-06c3-445c-9508-58b372c01b2c@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 15 Oct 2026 10:38:14 +0200 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> (CCing all people attending the mm-next call)

there was an mm-next call?

fyi, there's a sashiko@lists.linux.dev list for stuff like this.
