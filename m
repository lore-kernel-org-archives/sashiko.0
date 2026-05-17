Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952A63D16F5
	for <sashiko@lists.linux.dev>; Sun, 17 May 2026 19:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779046950; cv=none; b=M9jRpcVUN1wJuiyHlVPZy+b6R+TcFMq8uX0loXfTAnVWy+YbMF+NYdcXIGAq/0rsgWFyKDTdGVMWKcTJXLgimYb6CsjyM8C24zS/NqSVLEkZ1zheltS6hTrsd56a/pwQymEx4iiFaoZwTNznGN4daFfjQ8TfyqMLfg+n6uEDLh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779046950; c=relaxed/simple;
	bh=g98agNYGLvJmlG0gWzhVWz4MCGR9K8snakUyUvhsPE4=;
	h=Content-Type:From:Mime-Version:Subject:Message-Id:Date:Cc:To; b=qgwWnRb9f+9U716j1YFBxNnOEgoidHnHK2hXbjvacYLoeS7X0OpA3S06nXHiHwfdBmNRX6aSwonTwO4KpoG3Mp9jinGAIDNOGlUPxY3gxbkM1waA/+FLnD4O9CC3KB3Uom5z10eweDnRKvnFkMfUuBBe1JZ6VK3wLhDLqbVJFAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lWQxxzYB; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lWQxxzYB"
Content-Type: text/plain; charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779046946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7hDRf778T5lKPPnA0L91lKI2KUkCmaCfyUDmNKqu4DU=;
	b=lWQxxzYBHxd1llWzpocEgJCr61/BFBXK1Ed97FxbusSZ4CzZmtObvWalYdevZM1+Jq+kaF
	m7O90yKnUuA8IW+3IM/mtuV15GvyXunvTkFxHEmuGFlyX3snAWr5P8ZffYkoVKGli8tJlg
	wrrvjCeHegR6CKUYSlfwkjb0sYCi0S0=
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Roman Gushchin <roman.gushchin@linux.dev>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: Stop false review statements
Message-Id: <4ECB5626-01E2-4AEB-AD11-524AB224CAA0@linux.dev>
Date: Sun, 17 May 2026 12:42:12 -0700
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, debarbos@redhat.com,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Konstantin Ryabitsev <mricon@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, sashiko-bot@kernel.org,
 sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev,
 Linux Kernel Workflows <workflows@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org, kfree@google.com
To: Theodore Tso <tytso@mit.edu>
X-Migadu-Flow: FLOW_OUT

=EF=BB=BF
> On May 17, 2026, at 11:57=E2=80=AFAM, Theodore Tso <tytso@mit.edu> wrote:
> =EF=BB=BFOn Sun, May 17, 2026 at 11:17:06AM -0700, Roman Gushchin wrote:
>>=20
>> I actually tried to run it with ollama on my
>> personal framework 13. Adding nominal support is trivial, but the
>> whole thing is not really useful: I can get maybe few hundreds
>> tokens per second using a quantified model with reduced quality; an
>> average sashiko review is consuming 3.5 millions tokens (with Gemini
>> 3.1 pro, it=E2=80=99s also model-dependent).
>=20
> I'm curious.  What hardware and LLM model were you using?  A few
> hundred tokens per second seems surprising high.  My initial
> research[1] showes that an M5 Max Macbook Pro costing 5 or 6 kilobucks
> can do 31.6 tokens/second on a 27B 4-bit Quanitized model (Qwen 3.5).

I=E2=80=99ve framework 13 with amd 7840u. I=E2=80=99ve tried several models b=
oth on cpu and gpu.=20
Sorry, it was a couple of months ago and I don=E2=80=99t remember all the de=
tails, so I won=E2=80=99t=20
claim any specific numbers, but as I remember the best numbers were around=20=

a hundred tokens per second. In any case it=E2=80=99s few orders of magnitud=
e slower than
 what is realistically required.

If someone has a powerful hardware and is willing to benchmark sashiko with o=
pen-source
models, I=E2=80=99m very interested in results.

> [1] https://www.reddit.com/r/LocalLLaMA/comments/1rzkw4x/m5_max_128g_perfo=
rmance_tests_i_just_got_my_new/
>=20
> The model matters of course.  With Gemma 3 27B and a 6-bit
> quantization, it's 21 tokens/s, and with Deepseek R1 8B Q6_K, it's
> 72.8 tokens/second.  But unless you're using a really low-end model,
> or a really expensive, splufty hardware platform, I haven't seen
> reports of hundreds of tokens per second on hardware costing a
> reasonable amount of memory.  (I'll set aside the question of whether
> spending $6k for a fully spec'ed out M5 Max Macbook Pro, or $15k for a
> fully spec'ed out M3 Ultra Mac Studio is "reasonable".)
>=20
> As a result I'm not entirely sure how realistic it is to do reviews
> using "free" (you still have to pay $$$ for the hardware) local,
> open-weight LLM's if an average review requires around 3.5 million
> tokens.

Fully agree. But it might change in few years, things are moving quickly.=
