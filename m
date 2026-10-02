Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6E5367288
	for <sashiko@lists.linux.dev>; Fri,  2 Oct 2026 08:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931394; cv=none; b=gyFErTEJtKhpJROaroOvZgwC3Y5uYoJmMxno4OzbwdHqrRZhl3yh/eetK1FRMTXC0nPO+LSJd3neKEVDZznwjjJ1ju52LAzGx9Xl6cdALeXOeYM16M9p+ipaEvMxLwbIIPL6hsEwzq2PaiKiOsVa/98xfLpIZnZtNxLqOpkyCtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931394; c=relaxed/simple;
	bh=cmUQUCeQAoYnGDT91reLWJbxUKLTRy9MgNffDhb2nqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NwwJxMZzc4Wo6YzRYUUZ9DIWioTPjYTfNogulah63maUc83jdNMqLTqm270GPk4oql4J2H5842Zi8WP/JazUxUoI021xIqnthOb5pt9gtp6YF4f05pEErGABCtqE3Aa8xprHEsDrQ1qFGIyQTBza1+k6CnQS1cCNolulpwSbyu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3ABDQAC; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3ABDQAC"
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2e4ba830297so148805ad.3
        for <sashiko@lists.linux.dev>; Fri, 02 Oct 2026 01:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790931392; x=1791536192; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nOcaKLVfII7RgZKy5BxuAtPIUFPxb+tff2UlmwE9XpI=;
        b=m3ABDQACfS+81wNPlpngndvikfucjRC55frYq7zIOkeoQcLPCla/fKh9dpKqd5kdA3
         yq6IeLBdGe+YDJXLE+G4g6TIfVJQFCXT6kHHL2zooovoknqU6L2CETM5CZ+6zdAwTtRf
         RSEQej6mcXc5kCJZ/3M9BsCK6+DQ5yH2UVEgcYpjPkBdzOtTLVRZ/nGJdoalnyHfcqRh
         RJy53pXrHxzMuqdgejWSL40ikPxeKZH/A9DTvTGsmUGhURFmm5YglHYcnnoV9B91F1WU
         tiEYYET2m7x5nl0D84kqvf67JH+VqrNpk/zD/fzgphneKz66o/kM6wuE13kCo6uPxqBT
         PELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790931392; x=1791536192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nOcaKLVfII7RgZKy5BxuAtPIUFPxb+tff2UlmwE9XpI=;
        b=Xo2wiuhxfjMns08QpXvFGNWWWbnNroLlzr1YSc8wYtcJTWovRP/Me0EJy5AqCVH2Sa
         kJ3gIwIYY2grjVwxS0Y8GQkBdYTpvZgPCfjDs6Vs1MkqencnQsb27T2sNRGZqF1siF7p
         ekQD7HNY19hH60PNQFlF+ux2rX6ods9okFJwYlY5zsLLB/9RXu6A+K5+Q2QKFe9khBBK
         BwE7cbM98NSsqIhA8sL6Nm5z+PzYWfDRybedgFEJWqCUh+mptwALDsipOzkMahX2i/ja
         TZZtzazfWLQ1yxu6q7bdsYJNayW44DR7T6SGAbohG7tfGeDYjp146foaevztjaravJ8n
         ktsg==
X-Forwarded-Encrypted: i=1; AKwUvBz875PGZMzuoQNigVkHS8UJJvKu0BuESunWAk77phQnzcdfJXafycI+rrnlbKQOAx9cgnmMTNia@lists.linux.dev
X-Gm-Message-State: AFq9FYI6LaS0GvRUqeeOcbIQt3tRW8QeFI6accBOd6r1Rh76eLF7wnG1
	0o8fX8EnTs7cRqyZ4jEoMmgFQMbegugqpqpC+k7TAfTuHCzBMYfcuJxd
X-Gm-Gg: AYBFou3KD7bHBL/uLS2ZsKe0yXAhwX/Z+kU5j+RdcH27UWPLdq4NfnVN7O6+yRXrJuf
	SqDZiXrFtQG2/T1bp0au3x3FsVIm2HWyXpBGYOxL+rPZhzRZzc5XrPL7uhBxoTQERDG1t3id3uj
	S84Mm8yypcPxD/guxbTe/VGli/kEND7o9seIOn1pYbxrG8h13ef3DS/xMb+fNKb5SrdUJWWUd26
	OiVCM568CONo9EK3fKcWxjLDCw0Y968rE5ZNS2iQxy8bTJ/ZvEb6Un+CiNkyn7AoIAj6oYlKxXX
	Oyj8jlgKN3zpfXndX8Os8m01nU+RekczM3lF211zf0bd+K7mYAK5CDy2GqHOqpI+rReszHsn6tk
	XIz3kEuu24V0SvjLD1fTu/iIqIEE0q0xhIlrl4rX4jjNZUYuf9fai07qFj/5+YgrKAM9G0+aVMc
	G+9uK1MB6pzdYfMfjiCrproY2euSoL0OQreqA4E6Es2vDFHfnd2nPOLIQsN+3AqXU4uv1ORg7gc
	l26SJ9pFpMR0TnHG1JTqe3KVawkRp7SugaH4pdOfjdg0Om6OVJnTpnSKRIMmO4HWs8W1A6u1T5O
	7SsH0hwJLA==
X-Received: by 2002:a17:902:e881:b0:2d9:2149:57c0 with SMTP id d9443c01a7336-2e49b67dadbmr20290125ad.22.1790931392031;
        Fri, 02 Oct 2026 01:56:32 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6aea8csm5480465ad.35.2026.10.02.01.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:56:31 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	sashiko@lists.linux.dev
Subject: Re: addressing sashiko's false positive rate
Date: Fri,  2 Oct 2026 17:56:28 +0900
Message-ID: <20261002085628.1955443-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <7ia4fqyst6b2.fsf@castle.c.googlers.com>
References: <7ia4fqyst6b2.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 29, 2026, Lorenzo Stoakes (ARM) wrote:
> 3. You could even get a weak signal from detecting whether code at the report
>    site was altered or not, that wouldn't require voluntary input.

On Tue, Sep 29, 2026, Roman Gushchin wrote:
> Agree.

I tried this on three lists to see how weak the signal is.

I took Sashiko reviews from 2026-06-15 to 2026-08-31 on linux-input and
bpf, from the review emails, and on netdev, from the sashiko.dev API.
For each finding not marked pre-existing, I found the next version of
the same patch on the list. If the code the finding points at changed
there, I counted it as acted on. If it is unchanged, as ignored. Then an
LLM checked 50 random findings per list against the next version.

                                 input    bpf      netdev
  findings judged                501      578      1899
  acted on, LLM check            21/35    13/31    12/37
  automatic label correct        27/35    29/31    30/37
  LLM check undecided            15/50    19/50    13/50

This measures whether the author changed the code, not whether the
finding was right, so it does not compare directly with Lorenzo's
useful/wrong split. It also leaves out pre-existing findings and does
not deduplicate across versions.

The automatic label matched the LLM check 77% to 94% of the time. It
mostly misses fixes that only reorder lines or that change code away
from the snippet the finding quotes, so "unchanged" over-counts ignored
findings. As a weak signal for picking candidates it works. As a
verdict on its own it does not.

Lorenzo's point about repeats shows up here too. A finding that Make
drops the space in $(if $(3), $(3)) was raised on v6, v7 and v8 of the
selftests/bpf Makefile series. Running make shows the space is kept.
https://lore.kernel.org/all/20260921075855.2065871-4-nickolay.lysenko@gmail.com/

Some authors already mark findings as rejected themselves, in their
changelogs. A bpf v3 changelog has a "To sashiko:" section, and a quic
changelog starts with "Sashiko, do not report any of the following
concerns". That text could feed the "rejected" marking Lorenzo asked
for without anyone being asked to label.
https://lore.kernel.org/all/20260808140720.293604-2-jiayuan.chen@linux.dev/
https://lore.kernel.org/all/375ee7fe827d9df248a27a8072c84a7c167fc50a.1789393775.git.lucien.xin@gmail.com/

On pre-existing issues, my data predates the split you just landed. In
the 907 netdev patchsets I fetched, the preexisting flag was set on 38%
of Critical and 37% of High findings, against 4% of Medium and none of
Low. So separating them should remove a large share of the severe
noise.

I would like to work on this in Sashiko, in small steps:

1. A script under scripts/ that reports this signal per subsystem from
   Sashiko's own data, run by hand and never in CI.
2. Collecting findings that came back unchanged on a later version, or
   that an author rebutted in a changelog, as candidate negative cases
   for the benchmark. A person confirms each one before it is added,
   which is one way to answer #426.

Would that be welcome, or would you rather fold it into the continuous
analysis you mentioned? Either way the scripts and the verdicts, each
with a one-line reason, are ready to share. I used an LLM to help write
the scripts.

Thanks,
HyeongJun
