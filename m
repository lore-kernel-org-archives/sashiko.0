Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9738B499F12
	for <sashiko@lists.linux.dev>; Mon, 12 Oct 2026 15:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818098; cv=pass; b=C6kneSAYjkE/YcvvKbBoUZF/4j5PtsGa0vuPCOfG8KcKkSdMjCHKwu65pQMLiaoCT6yiHuKy2hCJT98f4a/nmQFmytpGqlIcoAdlf6sUiVAVq+2D/3F1KVYF7F1r2cyzN2ze60DamyY+jv/FAdpLje+mErMFacM5QjEhh8GMqBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818098; c=relaxed/simple;
	bh=gOgQI+0EMTTszB0LD8AL3zsuVqBT+qw29dmgomr+PB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZwLxu+HpGnxBtDoXHz+sgmK2G66zkcp54Nb3DoJcQqA/yM2wqccAxX4g6hiXjU9BYzEzJNQY0Z9Fwaj6B/K1cWMDW/+jw+fMgZkATilYgXc+qWqUVzUb8PIOtCSgkp7v1KmLb6A65OvY2Kryms5EQwG0IjiB0qyJsXP3IRESa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rRsV53a1; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rRsV53a1"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so8271e87.1
        for <sashiko@lists.linux.dev>; Mon, 12 Oct 2026 08:14:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791818094; cv=none;
        d=google.com; s=arc-20260327;
        b=X5WhxbT0v2VrCuxehAzpScdVbQa/x8YqiIm85gnWsuIi1dKy0RqwSlqthJQF5YzKTR
         KBqmUcJddYaKwloXbbSQhFd+ODa1fEAUlxFY8z0ct+ntSSzGHByxVHuxJd8SCFi1U9P5
         kWQ80ibTpAPdgv2vUBClAhCFuLIJTmCuGHa71biKVejiHfyhmHR7jHIBVhKImSx9SEaL
         wt9lAntvZrkuf2VTRqEQQyB/0nXoQ6HWhpKtxzUuqyJ3FtsZRBCESCbXIOaHf1bCz+q8
         Lv+wp86SYKX4qJyaQKM8QPGiZAuBvnPwHFOujpBrGOer1ncmb29h5/7Y5SZlWUPCBt1e
         nfxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gOgQI+0EMTTszB0LD8AL3zsuVqBT+qw29dmgomr+PB8=;
        fh=9HN5mGBGE/uVFXxhhrRYr3gxuPWsZC9RvGcnVk1NVIc=;
        b=CWqN39qwqwqB6w2O2lYQdd0Fsq6viRPU5uFXoR6KABTtaywsNGRKvaDCrcZ1fVpQSJ
         m+78WRYBz8VGk1AEfKT/SOQ//2/iG5eq2byB4sh7R/Kr7uibMV/NfW1lm9ddPMDbSrZ+
         +AzIo9L66DUoIOoj0Nl9dYxrJOB3eoEEC/6/kUeUOwAAIqgo/qw5cQst/XGFiRtflODJ
         wc0L2vx68EtoHi6SOmlGFRkKloFMx9MwySrWE+PIrO37U4BBn5RVkpEK2t/Y+3tGMF5J
         Bn7QI5ri9I5UJHZ5V9J9Cs8la0Di+zVQGWuNArBPTwFdrEgArDTK4k1GBvq/InhsMf/j
         Wm5Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791818094; x=1792422894; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gOgQI+0EMTTszB0LD8AL3zsuVqBT+qw29dmgomr+PB8=;
        b=rRsV53a1cPRhCvsPKMyeU7NC2dZjiVhow28WybqJgaLv8XPTU4CNcoivKqCLtnyHtH
         A4Jd+KBujZFNnv9eU1KlhTgC0wjkTmvZxa5oVCJj9/7bkWebM7L6i1nSERlVP9Nk0vJS
         HAwiflnM8Ni7goAb/+h/LND/4rC9QTcoA4Yk7ViEOthdmUiRfMHNeVNu2ZwEyD1lpUzT
         QGER2938+jXyNDrfmco7H5KcvW04PlQKGPdJ+7BetqnB0dqES0JuB5WaAx8+TGi0rQ5n
         XXlT/dMeFgRZy3HAyFIkpAdFUNcUV6J5t2u0qC9QS8I4yygJLwxFVW9e7qHEiOnSPLKV
         wdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818094; x=1792422894;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gOgQI+0EMTTszB0LD8AL3zsuVqBT+qw29dmgomr+PB8=;
        b=f6DeY4Gk2/IDWAekoFbsN221LFFsrxyTN8qlhspHbD/BlW4+Z6YnGMeJ4vyp2rbEWA
         PaSVDC2O/GsFtWhaq7aLek2DazUXB42HzukZjhuUIwwyaCv0ucIdqTMt1/g0Koft9lWf
         9D+XMutO/0H2QLZyD0VUflBOoizeyBj3upwqptWbTJVbRga8fDhWsgKzAmeyAip7FwgM
         Ay50BiWZgKo7qSCe3wWcTDxmO0AA4RNBiqjCoc7pD0suCFW0n+GFDFJzwNZivyTnt2ef
         auU9LhpTZmZOZX2cCv6fZ/dDMNb0uFR4kAwO8tp6plKKM+ZLiHlktXMOkutGUdmIdRsi
         5PLA==
X-Gm-Message-State: AFq9FYJdBZFoPtBb+kUH1BoMCG08nXrJKOrzi3bVslEO/V2b0IRCMSdn
	TrBPIjKUnrtZSHbHFKpZMsB1+aE9DE36YRUdJjWxL2/kCxonB216mI8zkdEXwGbURra1gdSS73D
	k3F9HsXafjZ3ZDCPXnvEyiL/wdRMv3F1rLsq86vrrjI+2m8O54s62Pk1gwGQ=
X-Gm-Gg: AYBFou2Rb5bffw6udm12WT7DfYa/pf4j6WK+OJfyrAX7tXazxWmrmCAYFHt4XFio/KQ
	Dq8hUaoMeF3mNCK6V1o6PwMCIcOTtRaoDYz0r8DXamTUIOgTaYwv33Tr1E7/e6bsAbmANJv68vE
	W/DB9pvcIuriElBvjtmf0GrpIVHPctcIJlmaYjV8heO7R6OYJNndsk7WjrtX80MuaJ6kZ3w5EdN
	Rqn2N9pLhWyVlv9INMdgQz3wVuORzfQwjvrdLdk7Hsbq89eD9dBrZqy4yMiC1tgYn3dRjtVKSl+
	8fI4/bERgYsQYV3loPzffKKwE7oY+dExO1tV1zXqsd/vQES0ExmBnSSbD5n2u1x1ys5aIvqGEuv
	HS+jC5jcx6FbFXw==
X-Received: by 2002:a05:6512:ad2:b0:5bc:ed54:d5b1 with SMTP id
 2adb3069b0e04-5bced735cbamr152333e87.14.1791818093675; Mon, 12 Oct 2026
 08:14:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <91e21331-ed6d-4ac0-b237-b01aeadca2d1@app.fastmail.com>
 <20261009141710.1871697-1-fuad.tabba@linux.dev> <c007a163-91a6-4e2a-b8de-057b61d369aa@app.fastmail.com>
 <20261010155321.2539213-1-fuad.tabba@linux.dev>
In-Reply-To: <20261010155321.2539213-1-fuad.tabba@linux.dev>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 12 Oct 2026 16:14:17 +0100
X-Gm-Features: AclHuK8x9TgFks1GUtzDIAMICpGBLZSDO4hfMWUmJi7OuUjcnFS-vPE6zEsxzG4
Message-ID: <CA+EHjTyY3tT2x8uiGhz+bmFkG6McfRVPTRG-iff0nbXO5zdG=A@mail.gmail.com>
Subject: Re: [RFC] reworking the review-prompts subsystem guide
To: Chris Mason <mason@kernel.org>
Cc: sashiko@lists.linux.dev, Roman Gushchin <roman.gushchin@linux.dev>, 
	ihor.solodrai@linux.dev, ast@kernel.org, kuba@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Chris,

On Sat, 10 Oct 2026 16:53:21 +0100, Fuad Tabba <fuad.tabba@linux.dev> wrote:
[...]
> When it's up I can put numbers on it: I have a test set of 115 buggy
> KVM/arm64 commits, fixed since January, each paired with what fixed it,
> plus the Sashiko findings on KVM/arm64 patches since July that a human
> answered. The hand guides are running on the bugs now; the current build
> and the full one are next.

The runs with the hand-written guides have finished, but the numbers
alone don't show much. With the trigger table in subsystem.md picking
the guides, the review named the fixed bug in 69 of the 115, which is
the score the built guides have to beat. The table picked a KVM guide
in only 45 of those runs, so that's the old selection and guides
together, not the guides alone. It's also one run per bug, and while
the fixes are all from 2026, 90 of the buggy commits are older, so a
model may have seen some of them.

What may be more useful is the setup behind the numbers, which should
work for any subsystem. Take the Fixes: pairs under the subsystem's
directories, have a model drop the ones whose bug isn't visible in the
buggy commit's own diff (191 pairs, 115 commits after the filter
here), review each buggy commit, and have a model grade whether the
review named the bug the fix describes. That scores built guides
against what they replace, on real bugs.

The verbatim policy file and the dropped pKVM questions I mentioned
are in PR #111 [1].

I'll run your full build through it on KVM/arm64 once it's up, rather
than the current one. Would you be interested in the scripts, to see
whether they could score other subsystems' built guides the same way?

Cheers,
/fuad

[1] https://github.com/masoncl/review-prompts/pull/111
