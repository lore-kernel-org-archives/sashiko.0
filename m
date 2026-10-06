Received: from mta1.migadu.com (out-201.mta1.migadu.com [95.215.58.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE213E49FC
	for <sashiko@lists.linux.dev>; Tue,  6 Oct 2026 21:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791321806; cv=none; b=grpC4iqEyk3MZmS/0OyhF20IMSdaG1WRt1X2MmeL+C+DkjQ0rORwGNpfoXS6j7LqLhya09hhWeNKjSisO+dGn0FKT/LjUMahDypWYg6Qqqx27R2IITfAqzqdu5YSRYOSoGOoc0JqOhEP9FwM337GS2cr3GYbjqDs1MBx1ebsos4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791321806; c=relaxed/simple;
	bh=lq0enejRfmL3fnhXbPop5E/4GN1SS7DBQ2mE3ztNY64=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UB0jTNmFqckhtfMWYRS8WJZqlWvvPQRY/ALfeYmRpoMIvn1f1HeUI/jORcM6mA+P7Q6oAW/tazWdGknVU3MAQFl6Vl67dfWQXYPcW0aX56DmTTUO6IccwSYUkqoDo/eVWdtr97x0raDNpF4SNvLlxls+DSK+t5uN+86rhoNZ8RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rfSoKbrq; arc=none smtp.client-ip=95.215.58.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rfSoKbrq"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=lq0enejRfmL3fnhXbPop5E/4GN1SS7DBQ2mE3ztNY64=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791321799; v=1; x=1791926599;
 b=rfSoKbrqefuQb8PKPz1BHUIPvubCjCKPugDEiQUA5GCL25wXHCMxHq/e7h+NZA1pVLGLCPER
 gZYVZP5GBzLQGBvDzf/2DfT412Ishr9ak21UAvx3HcHlXVhDNJjpyezpkr6QkqfcvMSJpCEcxwF
 jnMNlkDMAtEcDxx/y7eXKXRs=
X-Envelope-To: sashiko@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 5ba88e49951115fc;
	Tue, 06 Oct 2026 21:23:04 +0000
X-Mizu-Trace-ID: 5ba88e49951115fc
X-Migadu-Flow: FLOW_OUT
Message-ID: <f8295279-7af7-4b3e-bc9b-112bfc49816b@linux.dev>
Date: Tue, 6 Oct 2026 14:22:57 -0700
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] reworking the review-prompts subsystem guide
To: Chris Mason <mason@kernel.org>, sashiko@lists.linux.dev,
 Roman Gushchin <roman.gushchin@linux.dev>, ast@kernel.org, kuba@kernel.org
References: <91e21331-ed6d-4ac0-b237-b01aeadca2d1@app.fastmail.com>
Content-Language: en-US
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <91e21331-ed6d-4ac0-b237-b01aeadca2d1@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/2/26 12:04 PM, Chris Mason wrote:
> Hi everyone,
> 
> I've been updating the review prompts, and you can find my current work here in the subsystem-build branch:
> 
> https://github.com/masoncl/review-prompts.git subsystem-build

Hi Chris,

I've set up "shadow" AI reviews for BPF, taking advantage of our
existing bpf-rc infra. It's a copy of the entire BPF CI pipeline that
we occasionally use for testing of the CI itself.

The shadow reviews are using your new prompts from the subsystem-build
branch. The reviews are posted on kernel-patches/bpf-rc PRs as
comments and are not mailed to the list. I configured the reviews to
run on every 4th series (so 25% of prod). I'll let it run for some
time (couple of weeks?) and then we'll be able to analyze the
difference and either switch or iterate.

One quirk I added: a datetime cutoff of the semcode's lore archive, so
that the rc reviewer doesn't see prod reviewer's comments. Not sure
how reliable that'll be, because AI may potentially figure out to read
them from github or something. But we should notice if it doesn't
work.

You can find the relevant PRs like this:

    $ gh pr list -R kernel-patches/bpf-rc --label ai-review-shadow:subsystem-build --state all --limit 50 \
      --json url,headRefName,title --jq '.[] | "\(.url)\t\(.headRefName)\t\(.title)"'

Note the "ai-review-shadow:subsystem-build" PR label.

The reviews run with debug output, and also the claude session logs
are captured as artifacts. Ask your agent to write a script to pull
those in with github cli, should be easy.

I just pushed, it'll take a few days before we get any real samples.

Thank you for working on the prompts!

> 
> [...]
