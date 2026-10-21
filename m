Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792626457;
	b=xg6O5YEBYyhFaVssY1xh4pthM0Wd0yKvWe1Vw946f9NveCqdL7qATyW5KW5CBcDsCGOl
	 k3QPDNZ27RRmU2afKDcYS0feRQ5SPK93fF0MgUKDgphhU6qw3soA6891U/uotDPkVGp4e
	 Iy0xp3mJFlpXRkho2FG4MOUCzdxixU28QaTPN9t6UgBmoah0bU2Lsm+DS3cf/eYzvceMr
	 wCC/mFNzhOYbTIVVTnq1xwf+X1f5U3bD7uMlhhAnjnFEz7o/lrBhFqG9lZWWK6Ro8iOzQ
	 lmHFu2vzpQVCItsAmE8oc2W9XaFY2h6b1qaPvdiT6BuM9TRkrJ8z/hP2VNMPsMLYa7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792626457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=AipZyfhM8+5vIhullC0uf4EhEFSnwZWcX6gGcABB6qw=;
	b=ZFWpZdxGo/BxMhD4ykD/RMC8xUSZG+5m1G7VBxMoLn73EPzyQIF4+Kmp/4P9KB6Esi+S
	 7lF2e6jIJDSpFtTNZN1ytrWsQJPCxDjdjisMaw8O6adCRJKB4wZPXYoxEX4W//IZmCybf
	 nmBnHVSYbr6Lu044fLBpfTPhErsLLNrC81p28ZQnyPLnFwJrE48LqJXoBNMYHtcbSoUT1
	 /7XMZ46mtE525ir8X5n2Vp1YlbM6Yu/Rc2KlW3sT6t1EkwTfG12uTuPGCnsKBZEcwxbxr
	 uYnC+mi0lZVpBb0SkmQ81/kos5QmfSxugdEbHF5vYMsEPL0zQQU/FNY8UTrkE/b7QMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Kl90E2SA;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1AE606A319
	for <sashiko@lists.linux.dev>; Wed, 21 Oct 2026 23:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F1AE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Kl90E2SA
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-53397554beaso13896931cf.3
        for <sashiko@lists.linux.dev>; Wed, 21 Oct 2026 16:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792626455; x=1793231255; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AipZyfhM8+5vIhullC0uf4EhEFSnwZWcX6gGcABB6qw=;
        b=Kl90E2SAb0UTCJOi7PPxr1tv4iyefrKGSdmVoYTw5mI4khMlpPMhUuI4akRVcnxOFM
         KCQ2HXFmKtYHUtLSqUa0enWBeJxogmzqK7vv++K26fdNShD/SJw35oNoxMPivjv/EWc9
         LW+dEHjDwb1WN+dPqwymd03PniUaUwbF8wppmB6J3UKL2juRiJM/uPYjeAb2Cqnfdoh+
         /auGL39yijyr7N/iRXvidksD33F3ivJ9KerS/wE+PtnwspTuO024rw+JJn+rHTYVYRep
         Bme3jPTbaWuL9Qif3D6Qr8Vt6sdnHRQ2vtdVqUcopv3fdlX0W6Dpe8prITapnFkS2y4E
         GKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792626455; x=1793231255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AipZyfhM8+5vIhullC0uf4EhEFSnwZWcX6gGcABB6qw=;
        b=krylpUSNmQM5TtxUrufhSIR1Y2gFnXYtLKk3TNA3sV5toFI5/S9ibtOZflr/UwsytS
         LsyS88sxqBuFJKKsHWNR3qy4SMm1FOYJM5wD86O4B0wKvjtJjGbHHlBGPR6FLFaybDEc
         l0bvyIHODJgXrN+0drMfVMwXlO+Ieit3sTkIcj74mwKsJ+UHCjoqqL+ZKQ/GDG5A5Fy2
         Uv4IwGVBmEU+O8SaTohDqBVdBOYRYI3goGFk1nQxHGtUMBqAcJd9+ebmCOyvU0DoWPyL
         j0L3Nc0cSam0l9OuWc5BlhONtsAZ05iWjbv61XOcroKrar0ghLGDAJ7BenUF3QSzNA4S
         U7DQ==
X-Gm-Message-State: AFq9FYLh0e+niN4K3IsjeLzb28DLgcWEK4k8fVZUAxH8E9WzYGEexQqa
	i8ifLN4Vhn6KBnVOOFkh2Xz1E4lW6AP1RVM0FpsEcZ998CUFcWgidGJUx3P5oQ==
X-Gm-Gg: AYBFou09KA9b3kpwWeCHqV1TD8MBCPwJIptaSG/HhsQnbGgiKO9y74RzJuMOOxpqu0u
	a8ENdPJ23AuuM+TYUI7ToGLg2Hm3VUBPE6oWgxbCt2tDdGIwSjm/Wy0LRcnd2f/CMg70wXdFVnR
	J1aenFm9ekQ75II0pBifFPDe9ZrClYYyI4YOHpPiavppHJIE6Vmf9mdFdQjtTysYvhDZxq7Yrz8
	6hRu5NESt6JvjZpNlNfXIf7L+LDMDzHJGvvljF1e0Eo9/uM8mLmJSSqx5aAANl/bmDkuUPH+G0S
	vdzu1pxPZqa8yxEh4DYB9FDWe1r1h+Y/4lbiS2WYF1Z0GEc1TQ6i6jCb0TduQ4vrEu2dI6h9G1Y
	w9LgUzmGIAyEjbKA2whEMEE5+X+Vc4LOdcOez0SdQYk9tbU+BEKDquF1G/D0GPGN5lrCOTS/Qzg
	LMkMG3b82qbmN0uZKZcqXiY4SP6QYb+Z0SNLmRcQLsOUjK/NL7EeuFMPIIE/3+5T7LHZI0BDwkL
	EhQsQd3v0Ig5n4K41tym4HoECgdvLhe7pJ++9pLqMZqDMHLSHwrUJeyhfBUs/RrE7l+c245TJRM
	V9830n0y2yc8p77iMw3o+zt+8WnJ+aAbjkwO5+6UKg==
X-Received: by 2002:a05:622a:1305:b0:533:7a4c:d8ec with SMTP id d75a77b69052e-5369b69e330mr59477051cf.43.1792626455347;
        Wed, 21 Oct 2026 16:47:35 -0700 (PDT)
Received: from thinkbook-16-g7-arp.it.purdue.edu (pal-210-106-61.itap.purdue.edu. [128.210.106.61])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-536ab6cd0dcsm12649871cf.6.2026.10.21.16.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 16:47:35 -0700 (PDT)
From: Chih-En Lin <shiyn.lin@gmail.com>
To: sashiko@lists.linux.dev,
	"Roman Gushchin" <roman.gushchin@linux.dev>,
	"Chris Mason" <mason@kernel.org>
Cc: shiyn.lin@gmail.com,
	rawat10@purdue.edu,
	pfonseca@purdue.edu
Subject: [RFC] new design of review prompts management
Date: Wed, 21 Oct 2026 19:44:42 -0400
Message-ID: <20261021234442.136214-1-shiyn.lin@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

I would like to propose a new prompt management system. This will likely
require changes to the prompt structure and how prompts are managed across
both Sashiko and the review-prompts [1] project. Therefore, I would like to
open this up for discussion before beginning implementation.

Currently, prompts are maintained in Markdown format (including the indexed
version of review-prompts [2]), where all guidelines for a subsystem are
stored in Markdown within a single file.

While this format is convenient for human readers, it lacks the ability to
track at scale which specific parts of the review prompts are effective,
which ones provide incomplete guidance, or which ones cause noise.
Consequently, it is difficult to verify and demonstrate their concrete benefit.

To address this, the proposed prompt management system manages each specific
guideline as an atomic "invariant unit" in JSON format, tracking its usage and
feedback trails during reviews.

Here is the overview of our design in Sashiko:

                     Incoming Email (LKML)
                                  |
                                  v
                      +-----------------------+
                      | Is feedback to a      |
                      | prev Sashiko review?  |
                      +-----------+-----------+
                          /               \
                    Yes  /                 \  No (New patch)
                        /                   \
                       v                     v
        +-----------------------+   +-----------------------+
        | Ingest Feedback       |   | Review Engine         |
        |                       |   |                       |
        | - #sashiko-feedback   |   | - Evaluates patch     |
        |   (explicit ack/nack) |   |   (record which unit  |
        | - LLM sentiment       |   |    is used)           |
        |   (natural replies)   |   +-----------+-----------+
        | - Grace period expiry |               |
        |   (unknown / timeout) |               |
        +-----------+-----------+               v
                    |               +-----------------------+
                    |               | Send feedbacks toLKML |
                    |               | with unit-id          |
                    |               +-----------+-----------+
                    |                           |
                    |                           | Author / Maintainer
                    |                           | replies on LKML
                    |                           | (loops back to ingest)
                    |                           v
                    +-------------------------->+
                                                |
                                                v
                                    +-----------------------+
                                    | Update Trails DB      |
                                    | (nr_used, ack, nack)  |
                                    +-----------+-----------+
                                                |
                                                v
                                    +-----------------------+
                                    | Invariant Analysis &  |
                                    | Prompt Optimization   |
                                    | (Retire noisy rules,  |
                                    |  tune high-value ones)|
                                    +-----------------------+

## Design

The upcoming indexed version of prompts [2] already provides two key benefits:

1. Reduce context window size:
   Retrieves only relevant guidelines instead of dumping entire subsystem prompts.
2. Automated synchronization:
   Keeps subsystem guidelines synchronized across prompt bundles.

The proposed invariant unit based on it to achieve further improvements:

- Identify which guideline is used during review:
    - Allows tracking which guidelines are useful in practice
- Provide metadata per unit to help Sashiko retrieve relevant invariants:
    - For example, during a security review stage, Sashiko can selectively
      retrieve only security-related invariant units.

Here is the prototype schema for an invariant unit:

{
  "seqid": <...>,  /* unique invariant sequence number within the file */
  "title": <...>,
  "type": <generic|concurrency|security|etc>,
  "source": {
    "type": <email-thread|commit|source-code|human-edited|etc>,
    "value": <message-id|commit-SHA|source-code-version|name-of-human|etc>
  },
  "last-modified-time": <...>,
  "context": <...>,
}

To cleanly identify which invariant Sashiko uses, we form a ID from the
filename and its seqid: <filename>-<id>.  This also helps the indexed
version [2] achieve cleaner referencing (i.e., citing a invariant ID rather
than a file line number like <filename>.md:<number>).
For example, the mm-reclaim-1 invariant in mm-reclaim.json:

{
  "seqid": 1,
  "title": "...",
  "type": "concurrency",
  "source": {
    "type": "email-thread",
    "value": "XXXX-XXX@example.com"
  },
  "last-modified-time": "2026-10-21",
  "context": "..."
}

Later, when reviewing a patch, Sashiko records which invariants were applied,
and labels each review finding with its ID.
For example, when Sashiko posts feedback, it will contain:

>
> <patch context>
>
[Severity: XXX][invariant: mm-reclaim-1, mm-reclaim-3]
... <sashiko feedback> ...


Maintainers (or authors) can confirm or refute findings in their email replies
using rule-targeted command tags to indicate which invariant was useful:

#sashiko-feedback: mm-reclaim-1 ack
#sashiko-feedback: mm-reclaim-3 nack

This allows Sashiko to collect direct feedback from developers. If there is
no explicit command, we can either categorize the finding as unknown after a
grace period (e.g., 24 hours or 7 days), or, if there is a natural reply
without an explicit command, categorize developer thought with LLM.

Sashiko then maintains a database aggregating all invariant metrics.
Here is an abstraction of the tracked telemetry:

"trails": {
  "mm-reclaim-1": {
    "nr_used": 18,
    "ack": 15,
    "nack": 1,
    "unknown": 2
  },
  ...
}

"nr_used" counts how many times this unit was cited by Sashiko in review feedback.

## Discussions

In addition to the above design, there are serveral things for discussion:

- What metadata should an invariant unit contain?
    Depending on the prompt indexing design [2], if prompt files are rebuilt
    from scratch for every kernel version, "source" and "last-modified-time"
    fields may not be strictly necessary. We could also consider adding fields
    to record which questions or checklists generated the unit. On the other
    hand, if prompts are maintained and synced incrementally, preserving
    provenance and persistent IDs allows us to maintain long-term telemetry
    trails and perform filtering, ranking, and analysis on guidelines.

- Whose feedback (e.g., ack) should be counted?
    The straightforward approach is to count feedback only from maintainers,
    but this places extra overhead on them. An alternative is to consider both
    patch authors and maintainers, perhaps with a time buffer before finalizing
    feedback status so maintainers or other reviewers have an opportunity to
    review or override it.

- How to let the human read the prompts after chaning to unit-based one?
    We can provide the script to convert it to the Markdown format. But,
    this means that either we need to have a copy in the repo or the one
    who wants to read will have to download the repo and run the script
    manually...

- How to interact with embargoed feedback?
    Probably just hold until it is released, but need more consideration.


[1] https://github.com/masoncl/review-prompts.git
[2] https://lore.kernel.org/sashiko/91e21331-ed6d-4ac0-b237-b01aeadca2d1@app.fastmail.com/


-- 
2.43.0

