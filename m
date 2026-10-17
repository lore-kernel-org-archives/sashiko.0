Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448B93BE172
	for <sashiko@lists.linux.dev>; Sat, 17 Oct 2026 18:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792261272; cv=none; b=GSMZUHq7I2qcRLqZWQbVKXZ5yT9L8Br+j3STRE2ZsXlw0OUmgT12D2FXwjN5jm7zwyE6bfXu1ohxI/Jma9FfMTqsVFDar47r1V3jT8h8cEoM0GJ3n7T0GaKV9nnV2NxoH+bpZ3u9im3L8KAZtaEO/2VJ/0gE5MZyjPLO3QueBbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792261272; c=relaxed/simple;
	bh=hFNjsAHWXjRuYrJx37STMe5GE9Kzd1SVBQGqToOMIEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ptxjpo9q80Ohgv41our/fmKD2DUIBRsG08dpjBHDVLm8iavV00VEb/GGpY98h4z1Mw+Ptntf+gcVekai/i8PL6v5uCTWyHPtxEvpDemKng/BacahyPXY124PG3w2GzzvOIgmjzqiNTCidabf2ly2yDN0L0FkoEsp0pzu9zeKNsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RSzN/s0U; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RSzN/s0U"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c3156e7705cso131026966b.1
        for <sashiko@lists.linux.dev>; Sat, 17 Oct 2026 11:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1792261268; x=1792866068; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L4Dpe4z/fwIWi0F/OI3i1gPV69tD6ALa8RU3ygQJx90=;
        b=RSzN/s0UZhAkI00IKHdXDDagloSOFraOmoadblpABog0TTrFI43XNgzw15rlh7iX6i
         h6ylXN2duJDd1jmv35I8kZuoeG1s0agk3nhsPWNNXKxgvnt+JB0V8XQl9CDH4O57CIuC
         7WdcGUjUK/SmGIBvSvM+XeQehGI8sXY9d1mlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792261268; x=1792866068;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L4Dpe4z/fwIWi0F/OI3i1gPV69tD6ALa8RU3ygQJx90=;
        b=f0PGysbJh1T52cLay/en0Vk/XC1RSk4gK/X0gTpIOfFz4uQ8ghjaIuteU8dmt8vG9J
         Gh1K4BXxikbhl7rqRgR67A26vbMJWKUI+BPmGyY94BnxomVmIWYSnmr7JnSaWUbrZN1J
         f6QusNyDAZENM4hpCBGkw5tT4wnzR4yfAx3CeuUSdaMswRePn1czUx8QtnZS7x82I+Tt
         e7cVlvfGpsOrNwRWi94YTqR43BN9SXxwRM41IKxED092oWPboA7Im762jpHnxowTR6sf
         NK4Jg01Hl28UdUEwfdkt7i5V3NLjLOKgBDWwBb/gnex079wC+T4f6UfAkF2EjKTHHURw
         piAw==
X-Forwarded-Encrypted: i=1; AKwUvBzjEnxMl0ajvNH9p9xo2d0FEINMOaUJgAhTMk5qaoPTchZ7e+5yTFzpOdxRwA20HTg/JEEoS2jl@lists.linux.dev
X-Gm-Message-State: AFq9FYJqIJqJN2FY7K2zOKlgPMsu7kxhIJML527TIHR7kMYuqC2cpoK5
	NsYhHoPe8o+fg91Oa3yj40anjIRf2H5eTnVkKU78zCs2ijqn0LawH8uWar2OFtIcCoXUMcGEOtz
	3Dkf5nX0=
X-Gm-Gg: AYBFou1rv5/WvWOH4KLzOnCZM8ZTcH9/x2+4GYNdfB8RXCuWmaC4E5KXBSZwY8mfuvV
	XiiAib4VheZW8Ci7wVnSEzBKad78QgXCZG0jRMap59Hy1a+nhILfeUsmzEE2f2Nlg0XogJ359qN
	nW3xNFicAjNiZ42u6sVyj9ASAFh29PbVOgXkwjKMca9oa1/AF2a3uW2SXkMkv+ns4k8g4H6vUBH
	M057AERtvtp2d/A3ax5yNdTtMKQ/5HhndKQSNt+bPLWSZzTYc455bnN1zPzKrGQmYlWBXIdzYdV
	avQMOv3AxuRlZa2aDqo/mm0DtHoyysnP3ZCafzI5rMQ/SVSQEdqU9hWrKvoWWXUjEvB/TzHpsvl
	j8btB2YcJ5vmPGYlVuruEdT7MUUy4rftUhHQ7mtK7INh5iYPVuoCoXNX+5Lv1l/Q9tUt0helTw2
	erIaO+iaWNV2uBYlwxN73cwBZzlQPAxVbvwusfh5QQeZmLnt+ecR8zBv27uf/QAOcJcx27ScV2N
	jaoGn+MvtrzAt4Cfgq1qBLW8R6PyTiC8h2GsezcMlV8iBNmzPr5nIAFB60=
X-Received: by 2002:a17:907:6d28:b0:c41:9228:baf8 with SMTP id a640c23a62f3a-c419e0390fbmr250806166b.14.1792261268390;
        Sat, 17 Oct 2026 11:21:08 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e328775sm199343366b.7.2026.10.17.11.21.08
        for <sashiko@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 11:21:08 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso128259166b.2
        for <sashiko@lists.linux.dev>; Sat, 17 Oct 2026 11:21:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy4Tx61uiu4uVtfVP5BmWq4HBCg1/cLwI2bP+ZlpcHD5JxeCku7IVjepSDTMtN4Ownnp5G5kjx4@lists.linux.dev
X-Received: by 2002:a17:907:8687:b0:c2e:412e:5121 with SMTP id
 a640c23a62f3a-c419a93cd3amr220764466b.4.1792261266435; Sat, 17 Oct 2026
 11:21:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>
In-Reply-To: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 17 Oct 2026 08:20:49 -1000
X-Gmail-Original-Message-ID: <CAHk-=wj24dSSRDQjvkmcw9LMC=K86d-Xys9=qX=gKoXgrQN1UQ@mail.gmail.com>
X-Gm-Features: AclHuK8lwyjkCqaaDIJRP7PXRWcejmZqYtcfUmprndKXr2Ef6X_rkfn6IJPB2xk
Message-ID: <CAHk-=wj24dSSRDQjvkmcw9LMC=K86d-Xys9=qX=gKoXgrQN1UQ@mail.gmail.com>
Subject: Re: Patch pre-submission to Sashiko
To: Jiri Kosina <jikos@kernel.org>
Cc: ksummit@lists.linux.dev, sashiko@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Oct 2026 at 07:39, Jiri Kosina <jikos@kernel.org> wrote:
>
> Another option I'd like to propose would be to introduce a way for
> submitters to run patches through back-and-forth with Sashiko even before
> properly submitting the Sashiko-polished v1 to maintainers and
> mailinglists.

I think maybe we should make it really easy for people to run their
some kind of sashiko setup on their own, rather than rely on sashiko
itself. After all, these are all people who use an LLM to begin with.

And assuming they sre starting out, they are probably are *not*
building their own local LLM for this either, so presumably /
hopefully they have a fairly capable LLM setup, and the problem is
primarily lack of kernel knowledge (and possibly LLM background too -
that side was certainly a learnign experience for me).

So maybe at least one piece of the puzzle is us pointing to existing
sashiko (or sashiko-like) rules so that people who use LLM's get the
"basic rules" almost by default, rather than burdening sashiko more.

.. and I do still think that we should have some kind of "sashiko
doesn't answer for 18 hours" kind of limiter. Possibly with some
back-off per submitter (and by patch series size) so that repeated
submissions get spread out even more.

                 Linus
