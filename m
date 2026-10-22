Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792698616;
	b=e3JmqZchrrBHvcPTsI5FLX/3Yl0dc/iNfhBBVhf+V2pvXl7fUCBwp5unDHy0m7uYmVEb
	 yRu45WffgrnvOYg9y5w92DgTUBaP7E7j+Sp2VVOQslGpSDTRgvsp2P4n559U/HBq8lRHY
	 e4rQwurJ6fXFwoDctsjOij+/2QAbNOnuDLR7P5+3ef15HYhcmtc3iSgLh6xChs2OnF598
	 RmxhveYcLD/8W5mS/ru6Cd67xQ1UaTtmgo+8p5zPxZT+WCITV33MsfyFQ9IfxGFMKJlEe
	 aUlj0HjtTW4jCXk0i4+pY64sdN54P4SDjsi5zTpp9ogD3oOB7K16g5ELi8c670HY4Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792698616;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:In-Reply-To:
	 References:User-Agent:Date:Message-ID:MIME-Version:Content-Type;
	bh=v8PX0ZY3IFzoglLZVBjlxqHnkwDoO6s5iHEL/cFXDQE=;
	b=pviNefDkKUcI7EMhwiLi4wYGgeZSeVLAuAUjLverrAZwYp62wvoScwcTJFgm1dqsEsnt
	 jXO6R6hcoTYizzx8CO5m2yk/TkuWyCswiqnkHo/QqbYZtSKJjy2shDC4H+8caIun+P+p1
	 Nz+Wf/MCN9qTkXrQ6PUlOsZmCVk0b/Rk6XCzD4Tj5FgI/d83TH/qrWT/upcLl5kyi0HIy
	 g9P5A/RsJbJH+gIB8WbFlX1GMczdjkINwTO/s+P4Th8ZMp03lOdWKJzHKl2ZsrpxKFO7g
	 Wmd5ABgNMUPaXfzAhpY+sSwBywvkTgPtGZVX2eFMNMgGPlS9JKStHgU3Fc/gTx2yt1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TyLzfk2E;
	arc=none smtp.remote-ip=95.215.58.1
Received: from mta1.migadu.com (out-1.mta1.migadu.com [95.215.58.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FC6606A319
	for <sashiko@lists.linux.dev>; Thu, 22 Oct 2026 19:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55FC6606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TyLzfk2E
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=IsA35mqVEcMUoMdz6kL55S+JP6kaVGyyloEvpldPvHk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792698610; v=1; x=1793303410;
 b=TyLzfk2Er8j08yq5Vo0UHs6O96o79D0wbBB5zrC8ka4b1fN4dWuursQBWq+5JNmOCrF3I/hH
 PkPiJ66zqLHWvHtW2GREb2fceVykymEVqzepkcvl0uIIHggQwjY6D/zV+cOY/oDBY/4ytGiR7wZ
 ggLh/uHyuSJo5+nX0wdpxqio=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta10.migadu.com with ESMTPS id 0c9a925d9be216fc;
	Thu, 22 Oct 2026 19:50:09 +0000
X-Mizu-Trace-ID: 0c9a925d9be216fc
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Chih-En Lin <shiyn.lin@gmail.com>
Cc: sashiko@lists.linux.dev,  "Chris Mason" <mason@kernel.org>,
  rawat10@purdue.edu,  pfonseca@purdue.edu
Subject: Re: [RFC] new design of review prompts management
In-Reply-To: <20261021234442.136214-1-shiyn.lin@gmail.com> (Chih-En Lin's
	message of "Wed, 21 Oct 2026 19:44:42 -0400")
References: <20261021234442.136214-1-shiyn.lin@gmail.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Thu, 22 Oct 2026 19:50:02 +0000
Message-ID: <7ia45wyty0ph.fsf@castle.c.googlers.com>
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Chih-En Lin <shiyn.lin@gmail.com> writes:

> Hi all,

Hello,

Thank you for the proposal!
Many ideas here resonate with what I was working on/was thinking of
recently. I'm about to publish a big rework of prompts which separates
them in auto-generated part and subjective small part for maintainers.
It's somewhat close to what you're proposing, but not fully. Let's maybe
restart this discussion after this?
I'm sure there will be a ton of room for further improvements...

Thanks

> I would like to propose a new prompt management system. This will likely
> require changes to the prompt structure and how prompts are managed across
> both Sashiko and the review-prompts [1] project. Therefore, I would like to
> open this up for discussion before beginning implementation.
>
> Currently, prompts are maintained in Markdown format (including the indexed
> version of review-prompts [2]), where all guidelines for a subsystem are
> stored in Markdown within a single file.
>
> While this format is convenient for human readers, it lacks the ability to
> track at scale which specific parts of the review prompts are effective,
> which ones provide incomplete guidance, or which ones cause noise.
> Consequently, it is difficult to verify and demonstrate their concrete benefit.
>
> To address this, the proposed prompt management system manages each specific
> guideline as an atomic "invariant unit" in JSON format, tracking its usage and
> feedback trails during reviews.
>
> Here is the overview of our design in Sashiko:
>
>                      Incoming Email (LKML)
>                                   |
>                                   v
>                       +-----------------------+
>                       | Is feedback to a      |
>                       | prev Sashiko review?  |
>                       +-----------+-----------+
>                           /               \
>                     Yes  /                 \  No (New patch)
>                         /                   \
>                        v                     v
>         +-----------------------+   +-----------------------+
>         | Ingest Feedback       |   | Review Engine         |
>         |                       |   |                       |
>         | - #sashiko-feedback   |   | - Evaluates patch     |
>         |   (explicit ack/nack) |   |   (record which unit  |
>         | - LLM sentiment       |   |    is used)           |
>         |   (natural replies)   |   +-----------+-----------+
>         | - Grace period expiry |               |
>         |   (unknown / timeout) |               |
>         +-----------+-----------+               v
>                     |               +-----------------------+
>                     |               | Send feedbacks toLKML |
>                     |               | with unit-id          |
>                     |               +-----------+-----------+
>                     |                           |
>                     |                           | Author / Maintainer
>                     |                           | replies on LKML
>                     |                           | (loops back to ingest)
>                     |                           v
>                     +-------------------------->+
>                                                 |
>                                                 v
>                                     +-----------------------+
>                                     | Update Trails DB      |
>                                     | (nr_used, ack, nack)  |
>                                     +-----------+-----------+
>                                                 |
>                                                 v
>                                     +-----------------------+
>                                     | Invariant Analysis &  |
>                                     | Prompt Optimization   |
>                                     | (Retire noisy rules,  |
>                                     |  tune high-value ones)|
>                                     +-----------------------+
>
> ## Design
>
> The upcoming indexed version of prompts [2] already provides two key benefits:
>
> 1. Reduce context window size:
>    Retrieves only relevant guidelines instead of dumping entire subsystem prompts.
> 2. Automated synchronization:
>    Keeps subsystem guidelines synchronized across prompt bundles.
>
> The proposed invariant unit based on it to achieve further improvements:
>
> - Identify which guideline is used during review:
>     - Allows tracking which guidelines are useful in practice
> - Provide metadata per unit to help Sashiko retrieve relevant invariants:
>     - For example, during a security review stage, Sashiko can selectively
>       retrieve only security-related invariant units.
>
> Here is the prototype schema for an invariant unit:
>
> {
>   "seqid": <...>,  /* unique invariant sequence number within the file */
>   "title": <...>,
>   "type": <generic|concurrency|security|etc>,
>   "source": {
>     "type": <email-thread|commit|source-code|human-edited|etc>,
>     "value": <message-id|commit-SHA|source-code-version|name-of-human|etc>
>   },
>   "last-modified-time": <...>,
>   "context": <...>,
> }
>
> To cleanly identify which invariant Sashiko uses, we form a ID from the
> filename and its seqid: <filename>-<id>.  This also helps the indexed
> version [2] achieve cleaner referencing (i.e., citing a invariant ID rather
> than a file line number like <filename>.md:<number>).
> For example, the mm-reclaim-1 invariant in mm-reclaim.json:
>
> {
>   "seqid": 1,
>   "title": "...",
>   "type": "concurrency",
>   "source": {
>     "type": "email-thread",
>     "value": "XXXX-XXX@example.com"
>   },
>   "last-modified-time": "2026-10-21",
>   "context": "..."
> }
>
> Later, when reviewing a patch, Sashiko records which invariants were applied,
> and labels each review finding with its ID.
> For example, when Sashiko posts feedback, it will contain:
>
>>
>> <patch context>
>>
> [Severity: XXX][invariant: mm-reclaim-1, mm-reclaim-3]
> ... <sashiko feedback> ...
>
>
> Maintainers (or authors) can confirm or refute findings in their email replies
> using rule-targeted command tags to indicate which invariant was useful:
>
> #sashiko-feedback: mm-reclaim-1 ack
> #sashiko-feedback: mm-reclaim-3 nack
>
> This allows Sashiko to collect direct feedback from developers. If there is
> no explicit command, we can either categorize the finding as unknown after a
> grace period (e.g., 24 hours or 7 days), or, if there is a natural reply
> without an explicit command, categorize developer thought with LLM.
>
> Sashiko then maintains a database aggregating all invariant metrics.
> Here is an abstraction of the tracked telemetry:
>
> "trails": {
>   "mm-reclaim-1": {
>     "nr_used": 18,
>     "ack": 15,
>     "nack": 1,
>     "unknown": 2
>   },
>   ...
> }
>
> "nr_used" counts how many times this unit was cited by Sashiko in review feedback.
>
> ## Discussions
>
> In addition to the above design, there are serveral things for discussion:
>
> - What metadata should an invariant unit contain?
>     Depending on the prompt indexing design [2], if prompt files are rebuilt
>     from scratch for every kernel version, "source" and "last-modified-time"
>     fields may not be strictly necessary. We could also consider adding fields
>     to record which questions or checklists generated the unit. On the other
>     hand, if prompts are maintained and synced incrementally, preserving
>     provenance and persistent IDs allows us to maintain long-term telemetry
>     trails and perform filtering, ranking, and analysis on guidelines.
>
> - Whose feedback (e.g., ack) should be counted?
>     The straightforward approach is to count feedback only from maintainers,
>     but this places extra overhead on them. An alternative is to consider both
>     patch authors and maintainers, perhaps with a time buffer before finalizing
>     feedback status so maintainers or other reviewers have an opportunity to
>     review or override it.
>
> - How to let the human read the prompts after chaning to unit-based one?
>     We can provide the script to convert it to the Markdown format. But,
>     this means that either we need to have a copy in the repo or the one
>     who wants to read will have to download the repo and run the script
>     manually...
>
> - How to interact with embargoed feedback?
>     Probably just hold until it is released, but need more consideration.
>
>
> [1] https://github.com/masoncl/review-prompts.git
> [2] https://lore.kernel.org/sashiko/91e21331-ed6d-4ac0-b237-b01aeadca2d1@app.fastmail.com/
