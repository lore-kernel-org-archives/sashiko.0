Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242673254B2
	for <sashiko@lists.linux.dev>; Sun, 17 May 2026 18:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779044249; cv=none; b=mLNEfOOPBI9waJQM2ux81N7NdiqjS2rUMLiuf502G+2MhgmnkYV7gMXsfj+B9s7pVacOlHmbCWa3gqFhBRWEbJ/y2Z0k0lZDDL0PIFB29CNsmVx2cAbQll1rhNFHSQ8s/mxRt/g+Dckb2vxiwVQj/N461PYZeTTV0dGWBL+Kn3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779044249; c=relaxed/simple;
	bh=GAlUXZMnGCwaO4GCNvb5ECNdeyV3RiQVKVMK4gtbep8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CnwKH/yJvuUnPYB+wR/xy8rEwlLr2JZlW4PYwcRRQ9WUdxEkG4IhH5FChf7VE9LQzs1dSzs/EcxV6ecygN52qa7jMmoRk114morM3d9ztgasXAMhTVUgvdGTabizlyRViMrxkDTUFJprS/Eq/EofSyHF02N8mul2X33zGbXL+vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=QhXt2BAA; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="QhXt2BAA"
Received: from macsyma.thunk.org (pool-173-48-113-30.bstnma.fios.verizon.net [173.48.113.30])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 64HIv17E032614
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 17 May 2026 14:57:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1779044225; bh=gMINBBiTbNeV1bgnblj89ASPAmSxdgbY/zBx9eb7Ifc=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=QhXt2BAAR/HOJpDyDXiyH97kbvLhc1YrOlXzk396LThKtdPAUlwCaq9zJRTJKmHQJ
	 mb5P5Y/MjL0DB8mZHJVZNgWHKiSRTj7RzKe+n3YXXSh0BPpe1/58/B+rAoRtZccCZI
	 JjhHEP4vxsmfjfgV94ZhwzopqQYGPcXGAd2XefIofkWoM99uQlgxLvSz+4v0jtYPBg
	 /apXhBJzcTtKSeWrmd3ZdG7UxsK/hhC/YmuwhQCEBNegV+KA0dvaDnwkDZ2A//5Npb
	 VQHbC6avZ/g+VOGo2mPWRXu/64sbFvp8uGHmITseTsUqiUmzay/SUzWD5eTxMAmYR3
	 RUQNff5+FmX/A==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id B472E67EE9A8; Sun, 17 May 2026 14:57:01 -0400 (EDT)
Date: Sun, 17 May 2026 14:57:01 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Roman Gushchin <roman.gushchin@linux.dev>
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
Subject: Re: Stop false review statements
Message-ID: <20260517185701.GB53471@macsyma-wired.lan>
References: <20260517183959.37441984@foz.lan>
 <F2FBD939-179D-467B-9FA8-BAA44F6C7524@linux.dev>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F2FBD939-179D-467B-9FA8-BAA44F6C7524@linux.dev>

On Sun, May 17, 2026 at 11:17:06AM -0700, Roman Gushchin wrote:
> 
> I actually tried to run it with ollama on my
> personal framework 13. Adding nominal support is trivial, but the
> whole thing is not really useful: I can get maybe few hundreds
> tokens per second using a quantified model with reduced quality; an
> average sashiko review is consuming 3.5 millions tokens (with Gemini
> 3.1 pro, it’s also model-dependent).

I'm curious.  What hardware and LLM model were you using?  A few
hundred tokens per second seems surprising high.  My initial
research[1] showes that an M5 Max Macbook Pro costing 5 or 6 kilobucks
can do 31.6 tokens/second on a 27B 4-bit Quanitized model (Qwen 3.5).

[1] https://www.reddit.com/r/LocalLLaMA/comments/1rzkw4x/m5_max_128g_performance_tests_i_just_got_my_new/

The model matters of course.  With Gemma 3 27B and a 6-bit
quantization, it's 21 tokens/s, and with Deepseek R1 8B Q6_K, it's
72.8 tokens/second.  But unless you're using a really low-end model,
or a really expensive, splufty hardware platform, I haven't seen
reports of hundreds of tokens per second on hardware costing a
reasonable amount of memory.  (I'll set aside the question of whether
spending $6k for a fully spec'ed out M5 Max Macbook Pro, or $15k for a
fully spec'ed out M3 Ultra Mac Studio is "reasonable".)

As a result I'm not entirely sure how realistic it is to do reviews
using "free" (you still have to pay $$$ for the hardware) local,
open-weight LLM's if an average review requires around 3.5 million
tokens.

Cheers,

						- Ted
