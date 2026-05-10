Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1D036828A
	for <sashiko@lists.linux.dev>; Sun, 10 May 2026 22:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778452707; cv=pass; b=uqnxPhDfAAAsTTeu43t1RCC85rIH11TIVmHBRYrTwy41zIU2jvibXMS2HPy0Fpe/y9b1pKvswCpYa8K/ZjGTSCTzwDay7XhRuVwZb1DcaIiLi+UtmYoUI7mCwmOCp9Muy6RUzLuhauj1GsnKqBTR+Bd0kaXy1G00EQLsPoBevhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778452707; c=relaxed/simple;
	bh=+RCvzX3O/zZVOe06+QEUzmxxLt4XHCNKPDCKitF87/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MbGTVh+ApR0WUuxz7REUeJCGDLspAHZFX/Bd9foRR+uBjm0KNVKzcrLPtUEQWtULITyN+a2eA4Vd0qOxwWrbHxW6vCNPrym+BY8YFkkua6oC8dw5aM1mEOZsIM2syUg4M+tbhZcv/UO4iSm+Iq0v9A12DHAbHCxjFdAYRTnSboo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CxUiq/H4; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CxUiq/H4"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so2664512f8f.1
        for <sashiko@lists.linux.dev>; Sun, 10 May 2026 15:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778452699; cv=none;
        d=google.com; s=arc-20240605;
        b=ctdGiBBqWashrEXJ8ypKhn6DYXQl8zKBY6gJt3eTPr4cPbKrCsSaF9wT4d3S46BwDh
         t7srZoBQuyHGfcdf4cU8RCk4URnYcb5+F7N0DflkPRNL0KNhJTsZ72dHLHmt4Ufq7SRy
         9k5IX+TQO99wtCZ1XO+WPC8pb9vrvhU1gxHR667r9mWrvCAAkEVz8TiTHv4PACI0V75U
         Qm2Djt31wTPOHt8SCPefzsP+P7jGZQqV36qfhIT7z/c+cpZ1PuWJ0w0YVr6ewEqAHFIl
         JMKGQE0QnAAY12bAIxKN2g4drdTA++dVjh1ndTE8563d6Ly6chTJPAyy21sV7KLRpzmb
         Q2Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q742UBUVfHxlrrxIFoluJHcHiucEjbpkj0zuBBjRUjA=;
        fh=6jAZCwCb0wk0XryB5IsHORzFHzZnUZ44mjzC+X7gNx8=;
        b=i8LzCIpv+RCxMh+qhD03GDv8HN2gqpvmGeYCKHSgmLvjWiYkPmTlcl7rR6ZOyUW6Ez
         jaekHy8+K/YQztoJxZhA22hnnreGVwNyysR2IjEjR46f5Bnfbc0/ZGCdF77pLYMoCpJa
         z6hK/DrJW3X/d9MkM5dQhTK3jCgX9NWmnkWCkGa21QWUTwOnxdW9OowEmVRTMbzKveUq
         RVJpy6ZUp7ko2oK2yKMyg2rJMNU4/QXZNd05XWCsABGw21IkY1c+GGXaiLcEsvsCbh+q
         I0QzRXTQ7ltoD3JQTqxYV+5JPKakpPH4brtFjzX3/y9US1EAFW63sluHrzsHA3qBCiXa
         Ukug==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778452699; x=1779057499; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q742UBUVfHxlrrxIFoluJHcHiucEjbpkj0zuBBjRUjA=;
        b=CxUiq/H4E0ZxNm9XL44JtzqsB0wTE1wO5hOY9u1TUvy7nV+EfOgkK6HrTj7rvo8j82
         gWoDOUqAZkWUjjYEhcgsPgzouEZHMTHkb00Yvj3g1OUZuNZacdL0sXKw4oSTWG8iOll3
         etn5YzOocaWCzgR95ECV9uX7HylIeH4cC/G6vfpnJHFsSXXZWjtN6v81vf7v7G6cVqnQ
         BhsGiUa7fhEOsZwgCc5uYLzMr9jIIoWbw5BrMuH6CAzZM5AvB3LDAYWjK5Wcc1+BKqhP
         J2UTgrKeTsqmS+Vk2ZeaEUHQ6L2oz2NfrtPbEDrMp18hng1lyQx6tvjnxUJm5HAtbgXk
         yRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778452699; x=1779057499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q742UBUVfHxlrrxIFoluJHcHiucEjbpkj0zuBBjRUjA=;
        b=MBuFX8+xV+zlfMUooFGTH1P7EYQBPwuDRbNSPHG2hy9ekChD6XZpM74/GYe1vTMGQo
         EWRIKOj1f1GK2LIAKBHxT3VeHMJsxR87rtG/TqOcgE+GDMHdEqWdRnkV99bgGIm1GF83
         r2hQ+bWDY11kRJpE3blTbr55dMwD884t8EGq6QuS700mZK8TLJjDb/QWJ+DxbbUhnckm
         fDihnnnje27NIyRA/Jn1l7bQsHgrJ7Oo0CAb4m1EfCu2zL1O0rpVbmGbRzW5K9PUq5xd
         wqBxfxu5jRBkelgRsNxPNJouygWRYL0FNXHJ5h78BNwYi0h0A8jf2rZS6qnwJ4RDsyzo
         +xEQ==
X-Gm-Message-State: AOJu0YwYSUm/J/izyJ8r3/YeIWAI7sgsHzw5rx6iNahQdwHSAixLPL7h
	AsJH+KXCOpOClFf+jv4kkWbB5ntSgxtexr2oDxbDxMxPHhw3pEDrQrbc4Tw8ZKSr3Oku0f0En4J
	Ji090to4JB98xKcSYmeT0c5Rn7F5D3YI=
X-Gm-Gg: Acq92OGNjmEFvp+AsUfzdgb3V+VqJkRSr0Q9ri8RKDsN+ZMGr5E32jHjpThGvPFDjs1
	nZFzETw+V3/V2zBDxqTGBs6MrYDR7PsJcgGM4U4a0T3dTCgr+NgsrsdsCNLJneUJsPNEtHJa6fX
	ng7ZsmlRsBlT1lSNlQ5RNlEqPzW+0GhTvvcF5L0GpdhCaUyRveFg//KjxcgNS3SWjAEAs9Cq8i3
	/5obWu56s9cBD2nszsf+Y1Pp+y+stpO/wNTwGAlUgLnTXR4vm63IfgK/6s73BKPNPTH1sfWS8ie
	jA/cIHdYYaTnc0wqb+V7RtRvnoxyL26R43Jamuh6AaVRJPi8GnfMSF0tszAcTPwKG/YZnQXDj//
	s88z9noBwj4hwlK2hQPenm3iSFkR1N2uvHbJnJ9sazzxbV2E=
X-Received: by 2002:a05:6000:144b:b0:43d:714:34e5 with SMTP id
 ffacd0b85a97d-4515ce1bd58mr33450874f8f.24.1778452699023; Sun, 10 May 2026
 15:38:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260507175453.1140400-2-utilityemal77@gmail.com>
 <20260507234520.646C4C2BCB2@smtp.kernel.org> <agCXEJKJh-JGMhjG@zenbox>
In-Reply-To: <agCXEJKJh-JGMhjG@zenbox>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 10 May 2026 15:38:08 -0700
X-Gm-Features: AVHnY4JtWp5-wHurTbGbNe4pndwrP5XL9-KsYnPlCg2TVbgg5WbvM4DrSuh5aYM
Message-ID: <CAADnVQJdFCFJcg0Pqdnx=D2h5vHj_q4mrwSJYxRC5RW0NTFNvQ@mail.gmail.com>
Subject: Re: [bpf-next v3 1/2] bpf: Offload kptr destructors that run from NMI
To: Justin Suess <utilityemal77@gmail.com>
Cc: sashiko@lists.linux.dev, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 10, 2026 at 8:14=E2=80=AFAM Justin Suess <utilityemal77@gmail.c=
om> wrote:
>
>
> Any help or guidance on this would be appreciated!

sorry for the delay. Everyone was at lsfmmbpf for a week+.

All of the solutions so far are way too complicated.
bpf_kptr_xchg() has to remain inlined as single atomic xchg
without slowpath otherwise it ruins the concept
and makes usage unpredictable.

Let's step back.
What is the issue you're trying to solve?

the commit log say:

> A BPF program attached to tp_btf/nmi_handler can delete map entries or
> swap out referenced kptrs from NMI context. Today that runs the kptr
> destructor inline. Destructors such as bpf_cpumask_release() can take
> RCU-related locks, so running them from NMI can deadlock the system.

and looking at selftest from patch 2 you do:

old =3D bpf_kptr_xchg(&value->mask, old);
if (old)
  bpf_cpumask_release(old);

so?
bpf_cpumask_release() is fine to call from any context,
because bpf_mem_cache_free_rcu() is safe everywhere including NMI.

hashtab introduced dtor in bpf_mem_alloc,
so bpf_obj_free_fields() and corresponding dtor's of kptr-s
are called from valid context.

What is the problematic sequence?
