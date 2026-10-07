Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA9E47532F
	for <sashiko@lists.linux.dev>; Wed,  7 Oct 2026 09:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363697; cv=none; b=j0AgCHxSV4Gq7vW2/7hXtXjAg42CanA4oFsxO1OjQok82w/GDGMxRpWRHREL5VSep674pSeDhlJvOFCeZ1vo8SsbHrO2IEDRYanVneihZR9X9VzhOZv3aGwp/JBjO7Foxd0SJDr9CiQpqqw5r+7gUold35otbwE/bJmI6IuTYWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363697; c=relaxed/simple;
	bh=Q+sExwKvW/koXGQnk87sMjBzjM+053S7/IakL6fxj4A=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=TUzQohlcHXcZN7CxG0G2eevSu/kizauBqrzeBwcoS0/inyFvEzAWeDJ1D63bBtbOz0nasX+6eLyc/W2dAcUV1HqzsS4wWgZStpG6sQVdROC9hodjf8px8aUEfzg0bBkb832b5f/2CaBJ1mbPy97LJ8UdA9Np9Qrr1qg5wavDd9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dbzzfIHZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dbzzfIHZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BAD31F008BF;
	Wed,  7 Oct 2026 09:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791363677;
	bh=I5JUWRkLGMsbmGLsbQlhWVOzFg9TmDGB/WV23is89vU=;
	h=Date:From:To:In-Reply-To:References:Subject;
	b=dbzzfIHZv0mPdHsTxI3Yob0TmDCVvRVz6+Q9aUlBJ6qSgAspFbuquuzjpLwohasjy
	 ypRhALvc2HemVdfTm4QopFx5AB58jaOot2Efv1ZbqsdmePleZo+GALMeT6bDPelpmP
	 f5CDHQWu+udEh+UBohd8V1QQymqSRAgn9yBY/F423ySDP11wd2hcGOFtZ4yd+nfFAe
	 vUZa/kKIxFWWKXcYgiq0SWO7SxTk9V+0RxCSveHzriRWYVbUsOX8qVl+lhag+Gn1fp
	 c52VhqFipNDCj6NUm+O85UDAYuUW70A5+bohQdtZKI/74+VXeJDflAPLEWi1QASYfn
	 +mcswsXMGhF6Q==
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfauth.stl.internal (Postfix) with ESMTP id 1896B780043;
	Wed,  7 Oct 2026 05:01:17 -0400 (EDT)
Received: from stl-imap-13 ([10.204.2.104])
  by stl-compute-04.internal (MEProxy); Wed, 07 Oct 2026 05:01:17 -0400
X-ME-Sender: <xms:XArGamBnYt-OUvNZzbFT--VpGv_X0hoStxqIH9qBWs6XdAA19DKESw>
    <xme:XArGarUX1e2CKjNVIJIFz99tXRZ919EWszdvHWSXXQgtVc6nuMDBMAddIIspfoCMD
    FvUg2KgH3nR4Z-6LcjIPPEeQBtf2mFIyfCRL_rPASZQXjqBSSfH90Zo>
X-ME-Proxy-Cause: dmFkZTFxkBiOEIt93Afyi6VsviWontn+o2lb3RWJK2UchpykbMXFztXhUk4TfK5cjaCDli
    IhDTYDiV764pMUynvTME5JFV2cE6TE1WpRnq9YADAyMCSllJdbPDir0LTW1QFgjEVWth8E
    mT266iBFf2mQBg3Q4O72Le2ycCXZgC3UQxJbcIZ1CD9tkBAyWFUXrL25bsJdAvpE4IRc4L
    c+4Qqmsnv0MoQ6tyWjbsf4SkwqbVAWGx3uw5PJP6vTjeNfhhXZums43SRGUpv5FeIs3I//
    KrZxTuUuKXL47lD25T8cK7nUqOpanTk4qLY2Dz+Uf55oy0fM3jQ5os+gf+Br/baDVlJoh2
    1jAZmeCRAMpQs8kNFGqEjK09aYmItvf1xJaaO3zoISQEBPbnlwGvV3329mFrER773aCNR+
    D+iCSe0klGUuOXwgtoCJL77yssqqk2JkCnnZ+zocUZXymxtFNFjHYeCNDafpL1z5B5QTkM
    cj1sUFKbsZUvZRz3viGL6smh9IEnFih8i91zzLbXCOrjaOWwhUkSCKBsECQ8GjaFD4EfhL
    cHBWMAqqrNet3VJc4YBU+j2bV7JIgwveAIZJOxVhtdK8vEW0vSS2lJTWfUbcENOKCQqv6f
    qnD62TODxz78XHRE5T30fVK4gVAzC5MdLSXguPXY16A/7ldlDnAbN/gV5/IQ
X-ME-Proxy: <xmx:XQrGarFSuV7YAtkHXNxGAAkquBxEhssO7bDWVToZcj_Jiy9Bd1MlpA>
    <xmx:XQrGap1lABSrRLLWYOZLYNKUXsgVFvhPimn8vRGCtraL35lMDWajhQ>
    <xmx:XQrGatMOSOeImq0SZzcv2Pnx2WsY1r0RvrYdO7UATiJQmIYS5X8qQQ>
    <xmx:XQrGao47gN9Cy2tUe2PlW_W-NPHRO3INDm0URPJBjbTUnBEC_6H62Q>
    <xmx:XQrGan03PMBs4n_DSZ_d9JY3hdbMf-qXIRECi3yKgyT-kLV9OZQx1QXT>
Feedback-ID: iccae4b50:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id C3B98F6007C; Wed,  7 Oct 2026 05:01:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: A_YYAiGKKP7V
Date: Wed, 07 Oct 2026 11:00:56 +0200
From: "Chris Mason" <mason@kernel.org>
To: "Ihor Solodrai" <ihor.solodrai@linux.dev>, sashiko@lists.linux.dev,
 "Roman Gushchin" <roman.gushchin@linux.dev>, ast@kernel.org,
 "Jakub Kicinski" <kuba@kernel.org>
Message-Id: <e1131e0e-f447-47bb-9e74-ed2c60a0d5e5@app.fastmail.com>
In-Reply-To: <f8295279-7af7-4b3e-bc9b-112bfc49816b@linux.dev>
References: <91e21331-ed6d-4ac0-b237-b01aeadca2d1@app.fastmail.com>
 <f8295279-7af7-4b3e-bc9b-112bfc49816b@linux.dev>
Subject: Re: [RFC] reworking the review-prompts subsystem guide
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Oct 6, 2026, at 11:22 PM, Ihor Solodrai wrote:
> On 10/2/26 12:04 PM, Chris Mason wrote:
>> Hi everyone,
>>
>> I've been updating the review prompts, and you can find my current
>> work here in the subsystem-build branch:
>>
>> https://github.com/masoncl/review-prompts.git subsystem-build
>
> Hi Chris,
>
> I've set up "shadow" AI reviews for BPF, taking advantage of our
> existing bpf-rc infra. It's a copy of the entire BPF CI pipeline that
> we occasionally use for testing of the CI itself.
>
> The shadow reviews are using your new prompts from the subsystem-build
> branch. The reviews are posted on kernel-patches/bpf-rc PRs as
> comments and are not mailed to the list. I configured the reviews to
> run on every 4th series (so 25% of prod). I'll let it run for some
> time (couple of weeks?) and then we'll be able to analyze the
> difference and either switch or iterate.
>
> One quirk I added: a datetime cutoff of the semcode's lore archive,
> so that the rc reviewer doesn't see prod reviewer's comments. Not
> sure how reliable that'll be, because AI may potentially figure out
> to read them from github or something. But we should notice if it
> doesn't work.
>
> You can find the relevant PRs like this:
>
>     $ gh pr list -R kernel-patches/bpf-rc --label ai-review-shadow:subsystem-
>     build --state all --limit 50 \  --json url,headRefName,title --jq
>     '.[] | "\(.url)\t\(.headRefName)\t\(.title)"'
>
> Note the "ai-review-shadow:subsystem-build" PR label.
>
> The reviews run with debug output, and also the claude session logs
> are captured as artifacts. Ask your agent to write a script to pull
> those in with github cli, should be easy.
>
> I just pushed, it'll take a few days before we get any real samples.

Oh this is great, thanks so much.

-chris
