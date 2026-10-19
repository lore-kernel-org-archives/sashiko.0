Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.90
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792423433;
	b=C+svw/vMMNQbAgKWPSHl5e2k37AFDjXuJsBa/T9EKBH7lUgHc7KofOyvkZJrY4AAIGmn
	 hH4sH6jgETUvuyUTGplMCo0n4El+0Y+zViS3sHxHZNoR91zqFA/h8l8XCKsH3CLvuJv6t
	 TC7OLOlWnEnOMbxnAv32x/rX29lxW8SDhh5GayQADTdiqcZhXFY6g4+Cj3Jf97tDG+oX/
	 OnxDoIb2wFC/lMZj+K6nvqEN+FMSXiCIalwFpys6lVLFhh6aGHUY2ctd20raA6NYXLTuc
	 S8odAciupSbRk/uNVGdiTjWVAyxa5PQKcT2Nx5EL7+pIPSmHU/U0de316I5iVFpdTDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423433;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:In-Reply-To:
	 References:User-Agent:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1zbkPszo+jmYvjq0IjIJtIFskXPEWfiA1IAWR7acPVc=;
	b=3ydSroV29ndLc9X5A8mnqWarYMt/l+ucfITb2gc1z9kq378AZBxlH/CTpfUVJRNyXgyR
	 Gs/ldkPLZDUb/64VWYCGWBJqaiaQtj0IMQDegC7dKcFYoJcY/fvUUVh6SfayuZdIjUpzS
	 xrWMeWS64vemfI5z9823mBEaX4P7y62GAzNuV3zOfy4yxaWtHg3YPjyPdDkxEHBxVWUb7
	 /+QCS5Lo+m1a2o50CHl1eHiuw7AM/10M8+UauGk4tIcfWjWiF9deuwACC5/BC1tKebV+S
	 8B5yz2C04DKS1asklwkLcxvl3sJHdJCh2fg0ALR0KHkAFy+cTZt1CrhAKyekfQmp8Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kEmHV2Dy;
	arc=none smtp.remote-ip=95.215.58.90
Received: from mta1.migadu.com (out-90.mta1.migadu.com [95.215.58.90])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEE360ACCFC
	for <sashiko@lists.linux.dev>; Mon, 19 Oct 2026 15:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BEE360ACCFC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kEmHV2Dy
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=1zbkPszo+jmYvjq0IjIJtIFskXPEWfiA1IAWR7acPVc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792423428; v=1; x=1793028228;
 b=kEmHV2DyClXJqPXD/Zui84Kok98381QzXksWQdBQvmVCzrTyOsuYmsYZJUyelreH5pyyJ3K7
 q74TFFzO4hSgtRVU0j1m631gx5+V3q9dXQFgauBueAiGQj5Ov6OCPgWhXrUW0Rj298Y2aGaSTIu
 44iaRxZE1mllTpjzgOzCk7J8=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id f74677477a60879c;
	Mon, 19 Oct 2026 15:23:48 +0000
X-Mizu-Trace-ID: f74677477a60879c
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Cc: "sashiko@lists.linux.dev" <sashiko@lists.linux.dev>
Subject: Re: Sashiko support for additional OSS projects
In-Reply-To: <CAPDEY+VjQ2p3uWXV19DLWCotW2wJwf1PwRdDkuzjyw6fvGx72A@mail.gmail.com>
	(Mariia Nikitash's message of "Sun, 18 Oct 2026 21:14:25 -0700")
References: <CAPDEY+VjQ2p3uWXV19DLWCotW2wJwf1PwRdDkuzjyw6fvGx72A@mail.gmail.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Mon, 19 Oct 2026 15:23:46 +0000
Message-ID: <7ia4a4o9btod.fsf@castle.c.googlers.com>
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Mariia Nikitash <nikitash.mariiaw@gmail.com> writes:

> Hi,
>
> I=E2=80=99ve been exploring Sashiko=E2=80=99s support for projects beyond=
 Linux,
> including the ongoing work around GCC, and was curious whether there=E2=
=80=99s
> any broader direction toward a generic/default review path for
> projects that don=E2=80=99t have dedicated Sashiko workflows or prompt se=
ts.
>
> Is this something already being explored, or is the intended direction
> to continue adding project-specific workflows as new projects are
> supported?

Hi Mariia,

My current thinking is that we can apply the approach tested on Linux to
other OSS projects semi-automatically: agentically build benchmarks
based on historically known issues and/or public discussions, then
agentically build a custom framework and prompts and iterate based on
benchmarks. This is what has been done with gcc.

Is there a value in fully automating it? Maybe, but I'd first prove that
it works on some other large OSS project, like gcc.

Also some projects unlike Linux have extensive test suites, so maybe
they should be better integrated into the workflow.

> I=E2=80=99d be interested in contributing to this area and would apprecia=
te
> any pointers to existing discussions or work in progress.

You're more than welcome!
