Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680323;
	b=FL6//3fN/f1PJPYJfgAwSPHzopbj+r1RgPpKexjhBYXZkHf5ozFZyPT4TJEvtXK5Z5Q+
	 RwGzNxUueK3Z8YIkHhBcD40SsmoaE7X8u4kPe5YGIeewKQKGZ1MhsjmHqRefalCuiwXXa
	 6EXFBqr/t7QGBf2RiQhg1uylmmNF1T/ND1iC0CrT7MsH5gyb+H0/rCXBdyys4MmwP9UFl
	 mPThXc5rF0G0PfjPZik1vDPZfqlLagEO+e3wCDtTQmst2KTsUpEpLsdVgBt40ANntoKRT
	 wuzU6gc11BDXHo6OnHyp9jiRNAr7RhdxEi4yBscqQLy7ETREXQqIzEikCpumNfv3NBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680323;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=pALpS5I1KlGpkLUKtzKBtS/+k8KKUj01q0cLyiifzu4=;
	b=A902EdF74tX9JRIqb8r/PxhgeCGPXq7/tuBUB5T+2K+FM+d8C7atprytz0aRCU8OVjc3
	 HoYpoU//e4c3LoHirLFVOm8rDkJlKokDtUZ84oiu2eWED4G2WUXoYqchHW5746zFLQpLX
	 QFLpPIn/WA31XvqE33y8Yi5DSe2HQiVdKJT2Qy1w3Y5VG58P+49bECJMYIT2kiZk/9u/y
	 W2Asmg5RbVDRrTkkOr+XQxNCvlCwk9AU42g/uIN1bTBa0jDAUW8sUlAe7eXdZCUsz9sfp
	 FsFkkI6K76jD5FYHv1hmpcf9iZ0w0DWksoEg1n1J4v8fQ9O6fGhuyNR/nIkppIw2YIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KmBaQ+YB;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67F1606A319;
	Thu, 22 Oct 2026 14:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B67F1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KmBaQ+YB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pALpS5I1KlGpkLUKtzKBtS/+k8KKUj01q0cLyiifzu4=; b=KmBaQ+YB1L14xyLnhfcOfFWQpf
	/0McU6VTeH77acsbCWl+nKKoNN4Ql/8dRNKhvyIPtWrjB/Y8zMlaUlohRjBsP5/81mepRtVyFGfRP
	MM+vM+569+9T68zhU8DeNyvTvMvs0ZF4jOUoNY+nSHwsSdfVQsC1OGKB4JJDkEXUZ3vdT6pabNv29
	Gc/wHWkK/lL+rDSjVM05AMj4mgUzQRXaMnHBFJdRiCOgLWFSN6W7hJGTuiXYjluVjKVkJIZGBN6W0
	V2OQqndtERNegK3xqlnzc9TBW7/JHmQB9gBfu1pH/2gGa7NOuQcTtUr9LIxZmCszDgp7hrKKDhOgv
	NqOmmDFw==;
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJu2g-0000000EKZP-2QNZ;
	Thu, 22 Oct 2026 14:45:18 +0000
Date: Thu, 22 Oct 2026 10:45:15 -0400
From: "Liam R. Howlett" <liam@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Theodore Tso <tytso@mit.edu>, 
	Shuah Khan <skhan@linuxfoundation.org>, Bart Van Assche <bvanassche@acm.org>, 
	johannes.goede@oss.qualcomm.com, Jiri Kosina <jikos@kernel.org>, ksummit@lists.linux.dev, 
	sashiko@lists.linux.dev
Subject: Re: Patch pre-submission to Sashiko
Message-ID: <aadiwe7siqcwoe6t2sulkwt4hfu54rpvch2aphyoz2s4vnzpua@7xuhfabvjdk5>
References: <atO3pCuUxI950ftN@mit.edu>
 <3354ebda-5158-489b-a577-5cb10e5d5fb0@oss.qualcomm.com>
 <atZ4J86j7CXF82HX@mit.edu>
 <2fef166e-088d-4ffe-8d0a-0143aebc1b26@acm.org>
 <ate8oESqneK-3sQJ@mit.edu>
 <7e473af8-2f7a-4a36-a926-e756873c9c52@linuxfoundation.org>
 <atic3bbDeyJI6MJs@sirena.co.uk>
 <atjlUoEmTagZjrYI@mit.edu>
 <atjpS__OwjZ-Q_Fh@sirena.org.uk>
 <20261021114524.4c2ea2a31a9d527b78e78768@linux-foundation.org>
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021114524.4c2ea2a31a9d527b78e78768@linux-foundation.org>

On 26/10/21 11:45AM, Andrew Morton wrote:
> On Wed, 21 Oct 2026 17:33:15 +0100 Mark Brown <broonie@kernel.org> wrote:
> 
> > On Wed, Oct 21, 2026 at 12:20:43PM -0400, Theodore Tso wrote:
> > > On Wed, Oct 21, 2026 at 12:07:09PM -0500, Mark Brown wrote:
> > 
> > > > TBH having seen some LLM patches that come with LLM generated testcases
> > > > the testcases are much worse than the patches themselves.  Open coding,
> > > > weird structures, asserting bizzare things without explanation - just
> > > > generally really hard to understand what the test is trying to
> > > > accomplish and why.
> > 
> > > I recently posted a patch[1] to add KUnit tests for
> > > fs/ext4/extents_status.c.  It was completely AI generated, and used
> > > these instructions which I gave to Gemini Pro[2].
> > 
> > > [1] https://lore.kernel.org/all/20261021031231.40107-1-tytso@mit.edu/
> > > [2] https://lore.kernel.org/all/atbZWze194QiSOTe@mit.edu/
> > 
> > > I'm obviously biased, but it seems to me these test cases were pretty
> > > good.  I'd appreciate criticisms and suggestions for improvements, but
> > > if your experience is test cases written with older models, the latest
> > > frontier models have gotten way better.
> > 
> > Yeah, it's not that you can't do it but rather that I'm nervous of how
> > much of a useful gate it is to require tests - my general feel is that
> > if the commits have problems then any associated tests tend to have more
> > problems.  One example I reviewed earlier today is here:
> > 
> >    https://lore.kernel.org/r/ed22ebf64ed00a56d5e1eff31ac639fef00dcae6.1792179433.git.ivanrwcm25@gmail.com
> > 
> > which will get the issue it was looking for but isn't something I'd want
> > to maintain long term.
> 
> If someone's fixing something I don't see much value in
> retaining/maintaining a test case for something we've already fixed. 
> This is considered good engineering practice but why bother - we fixed
> it!  Move on.
> 
> It is good to see testcases during the fixing process though.  In these
> cases I prefer that the test code be included below the --- with a
> brief mention in the main changelog.  So interested people can later
> chase down the Link: and find the test code.
> 

Having a regression test ensures old bugs don't happen again.  Issues
that are overlooked often get overlooked repetitively.  Considering the
next person to edit the code may not have learned about a specific bug,
then they are likely to reintroduce it.

Tests also prove to yourself and others that you fully understand what
is going on.  I try to have a new test case for every bug since most of
the bugs are exposing corner cases that may be missed in the future.
Often people go away to write a test and come back with a different fix.

With the tests that have accumulated for the maple tree, we have been
able to rewrite sections of the code to change algorithms and have a
functional machine.

They are so valuable that I record fuzzer failures into test cases.

There is validity in Ted's comment about time vs return, but things that
are harder to test will inherently be harder to fix and so having a test
that can run on code changes will prove invaluable.

Thanks,
Liam
