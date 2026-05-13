Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562253ADB97
	for <sashiko@lists.linux.dev>; Wed, 13 May 2026 21:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778706984; cv=none; b=K+xtz27q+fgVwEVNHLZSoc0wcfFUSMUelJ14ES6CkNmLQwZUv3a+QDU9wTcfbeOwN8yghVwJ7qHmU5LQWe58THD4QbZnTVd3JV0X7YbFCUt8Bvrhc9i5e93XnmfcAOXYecXv3tmfjFYzvJ/cVWozD814lkpHyaJ1RReZQk/j5BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778706984; c=relaxed/simple;
	bh=ljEvff4Fj1HIyQomzecLNqIOeHT59iTeI4l3OgOpLmU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=RpeKFgpiNecMBXxxJmjko5h2bN6hf9aaV35uW2XRyiels4WrXN7Heq+At9QJFf8aIrX1realtWOsT213eZNlvuJdyOEo1Dcb5W4VMBF7iBmZaVtQkmonmgTXkSek3W+SHCF2LpBG+x0NjkB+U/ny4zZ1U5CnvdwdoGZNDMHmtRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rR6Ksu0y; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rR6Ksu0y"
Content-Type: text/plain; charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778706977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ljEvff4Fj1HIyQomzecLNqIOeHT59iTeI4l3OgOpLmU=;
	b=rR6Ksu0y7Me2DJZgk59VC4pSKuqNsuyXGQ0FoeboownQqT1pcCuxJHvtN1lUPa8eXST03N
	HN2O0MaYBvWCcy6hrWbIqdSY8LrFVJJzwb87CVootqiY/LLsfo7KBYgCO7thSoJgAStU8v
	cAsz8RzrHhsdMxNdWGQR1BOSlMni+9I=
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: Sashiko.dev webview not getting updated
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Roman Gushchin <roman.gushchin@linux.dev>
In-Reply-To: <CAFGhKbyLpcnKw+owas31umGsaiYd7op2gWbEFpViWG3vfmxjww@mail.gmail.com>
Date: Wed, 13 May 2026 14:16:02 -0700
Cc: sashiko@lists.linux.dev
Message-Id: <573D9952-FD22-46FC-A48A-071CC2ECCBCD@linux.dev>
References: <CAFGhKbyLpcnKw+owas31umGsaiYd7op2gWbEFpViWG3vfmxjww@mail.gmail.com>
To: Lasse Charlemagne <charlemagnelasse@gmail.com>
X-Migadu-Flow: FLOW_OUT

Yeah, I know and I=E2=80=99m working on it. Should be better now, Sashiko is=
 actively clearing the accumulated backlog.

Thanks!

> On May 13, 2026, at 1:36=E2=80=AFAM, Charlemagne Lasse <charlemagnelasse@g=
mail.com> wrote:
>=20
> =EF=BB=BFAm Di., 12. Mai 2026 um 17:56 Uhr schrieb Charlemagne Lasse
> <charlemagnelasse@gmail.com>:
>>=20
>>> Thank you for the report. It's a known issue, actually caused by some
>>> issues with the LLM provider, nothing sashiko-specific. We're working on=

>>> fixing it.
>=20
> Does it make sense to inform you about this or are you automatically
> informed about this state? Because the whole system (LLM provider,
> ...) is again in this state and no new patches are shown on
> sashiko.dev since 3 hours ago.
>=20
