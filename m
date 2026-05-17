Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DE631E857;
	Sun, 17 May 2026 19:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779046603; cv=none; b=h7R53i5pfkBb0VPATR4C3QUFvGMfisfwngKajLLOSBVaUfGFOSHK7wnicv04GUnPkhInryYgMFUF0lmvb1Kt22h7oivJEttu9gI098fvu932HNx0K5BHKfQfuaRDk9xrHD/6kb/jkZj3HddHx3HBrdZ4y2ZMtnw6EFtMLf/a2W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779046603; c=relaxed/simple;
	bh=VDtlqj2EeFq4cUo6AZgisMkvU67McHUjL/LopfxblMs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MeSRTgf/+/0KQF8VoLF9eoagUQKm/qepCZSRl/fPc6XYkVYh+fpDW1fRIHEXxZh+sU9V4LKPmwFNpPqsVBb07DyrzncrN/9v4UkhwcgfctnyXXOkowo79m5lj0aVJHv8oZwkyBg9MSqk1JKHUOlLAiZ+zosSuwtige1hzU+rvY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ossV31Wo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ossV31Wo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BAF4C2BCB0;
	Sun, 17 May 2026 19:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779046603;
	bh=VDtlqj2EeFq4cUo6AZgisMkvU67McHUjL/LopfxblMs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ossV31WoLiRsqCsoazkYJ7zxFvY5Bi5oOpjtTVmafJu9DvLRy5bzGAIqh4jiQpp9K
	 2R384XjEg9RfEmNTNQ/NChs5stkTfYIGTNHd3QkxlmLyFI6kYnWE2iDMT1HHrOCXli
	 wlUVe5J2rOd1J/8Q1AC0nLifxDvaXeLOvT/cqNjw+iOaZgRwO6WHW8Vau1vJcbVgOt
	 x8NcP1GQXSt6Sr6mfYz3qWmyxpp9Xo4/evlEhmtcoqGWp23uXhJQIgIizOtfGgCRqO
	 nE87zgMIZHXJOlxSV8VIroZwFN+4lWRvQToBG2dK8yXX6AKOvpaO3Ik8lElFaqh5TF
	 6KNi0TzBzc73g==
Date: Sun, 17 May 2026 21:36:36 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Theodore Tso" <tytso@mit.edu>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Greg KH
 <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 debarbos@redhat.com, Arnaldo Carvalho de Melo <acme@kernel.org>, Konstantin
 Ryabitsev <mricon@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
 sashiko@lists.linux.dev, Linux Kernel Workflows
 <workflows@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
 kfree@google.com
Subject: Re: Stop false review statements
Message-ID: <20260517213636.19f332e5@foz.lan>
In-Reply-To: <20260517185701.GB53471@macsyma-wired.lan>
References: <20260517183959.37441984@foz.lan>
	<F2FBD939-179D-467B-9FA8-BAA44F6C7524@linux.dev>
	<20260517185701.GB53471@macsyma-wired.lan>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 17 May 2026 14:57:01 -0400
"Theodore Tso" <tytso@mit.edu> wrote:

> On Sun, May 17, 2026 at 11:17:06AM -0700, Roman Gushchin wrote:
> >=20
> > I actually tried to run it with ollama on my
> > personal framework 13. Adding nominal support is trivial, but the
> > whole thing is not really useful: I can get maybe few hundreds
> > tokens per second using a quantified model with reduced quality; an
> > average sashiko review is consuming 3.5 millions tokens (with Gemini
> > 3.1 pro, it=E2=80=99s also model-dependent). =20
>=20
> I'm curious.  What hardware and LLM model were you using?  A few
> hundred tokens per second seems surprising high.  My initial
> research[1] showes that an M5 Max Macbook Pro costing 5 or 6 kilobucks
> can do 31.6 tokens/second on a 27B 4-bit Quanitized model (Qwen 3.5).
>=20
> [1] https://www.reddit.com/r/LocalLLaMA/comments/1rzkw4x/m5_max_128g_perf=
ormance_tests_i_just_got_my_new/
>=20
> The model matters of course.  With Gemma 3 27B and a 6-bit
> quantization, it's 21 tokens/s, and with Deepseek R1 8B Q6_K, it's
> 72.8 tokens/second.  But unless you're using a really low-end model,
> or a really expensive, splufty hardware platform, I haven't seen
> reports of hundreds of tokens per second on hardware costing a
> reasonable amount of memory.  (I'll set aside the question of whether
> spending $6k for a fully spec'ed out M5 Max Macbook Pro, or $15k for a
> fully spec'ed out M3 Ultra Mac Studio is "reasonable".)

Ted,

Here, I'm using a RX9060XT, with is a relatively budget hardware.

It is also at the range of dozens of tokens per second. If you're
interested, I ran a benchmark this weekend with 3 models (just
for the sake of testing a set of turboquant patches - those aren't
the models I normally use).

You can see results here:
	https://github.com/ollama/ollama/pull/15505#issuecomment-4467278354

llama3.2:3b with f16 speed gives 72.5 decode tokens/s, and 37 decode tokens=
/s
with tq4 (actually a modified version of it) which, according with the
PR author, has quality almost identical to f16.

The main issue on such hardware is to have only 16 GB VRAM, making
it a little bit slow for models like qwen3.6:35b, as it will partially=20
use CPU. Still, you can get a pretty decent answer in a couple of
minutes, with thinking enabled.

> As a result I'm not entirely sure how realistic it is to do reviews
> using "free" (you still have to pay $$$ for the hardware) local,
> open-weight LLM's if an average review requires around 3.5 million
> tokens.

Yes, 3.5 million tokens is indeed too much. I wonder why. Maybe
Gemini spreads the same query to multiple instances, making it=20
spend a lot more tokens?

Here, I did some tests asking some LLM models to review code,
getting answers on a reasonable time (but didn't try to use sashiko
prompts).

Thanks,
Mauro
