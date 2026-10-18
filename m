Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79FE388E58
	for <sashiko@lists.linux.dev>; Sun, 18 Oct 2026 18:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792349953; cv=none; b=Ne/BJ9aCeQ4ic/oU/prVIhoAuiNgEmjG67B8TfOMhzmDN3vDHgxmdWP6RhB/SWrAoAf/EuRyapwKZjnfWZFEl664XWEhauRqPp2VoVFe1nBoyHXOFgw8oGoTz1sJ9ohF550ZOy9Lm9aR4UYP/9hKqImDjnwhw3jXfUwBpJL/wwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792349953; c=relaxed/simple;
	bh=Lo7ZxKPZsJJkkMcB5M43Ky1nPj/z0LeGRyhnEuK5cuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sj/Hg9sCeZIthfwkK9VL64xYZgG0EKSi4WBvu1M62caq3tLc2JXjA+xcGkHBaM+pYde706k1rPtwKea3o4NqcZzMfm6bWysOBIx0CvBBrt7M+1ucWiecyesXuKG/KbZHMy9bFiR6IIUuc6XmHQZGDJ/Kwn8VTA1axgXb0x59Oq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fR3OkuNr; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fR3OkuNr"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c445c95d553so12639966b.1
        for <sashiko@lists.linux.dev>; Sun, 18 Oct 2026 11:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1792349950; x=1792954750; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ced419opuHB8e0e135UczeLqVKIED5ie3I6gjhxnxGw=;
        b=fR3OkuNrsJUtj36URLjNpr4uQVkVv2JEE8hCxGX5pSVYfxNx1RiaDrURGMBlpRKCHP
         t8M1BvntQQnR8AdcoEUhXrbBnuNs8xT3BYbW53eWgDTKYIF4xBpgDwuWa6niBMi0pAvx
         DogMT0z7jK7UUaBShFfMH1FVrvksloak2Y5ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792349950; x=1792954750;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ced419opuHB8e0e135UczeLqVKIED5ie3I6gjhxnxGw=;
        b=GV5kdQANEIKuMz5Y3UXaGOkXbnbErdKbvxgusewnm/Vzk/AenRRyB+fiYC+IZLRfjw
         7z/OjTTVnB6eulA61VOUSyU/Qjh56LVbA9WrQHNBjZRJRPzcZ7WuRj79jIxwnMimPqfQ
         /QSsXtxogLxNRLYC89h4Cnr3jnR2faaIflLbB5+3sATsfqtKu1QlcqcskcK4GbXQMWgD
         pD4XslTsVwXjEBrOx4IV3eQrekL7O6vzDr1jY/FEPQeJE+IJwNEN/DzQJllFwVpZVhyo
         qTLH579TMC8dK9XqcNXleMTmg5+prPu+49FYlCaBNE2rlhPcZRwTrl68e4oacEA7JvVu
         H/gQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9U/GG3v6bN13XAPzDTPK8nfIm9KFtUU/ZgE3KM95Q1Hxfpseav89EyarO1qaHxnl1zPmY0V6u@lists.linux.dev
X-Gm-Message-State: AFq9FYKEu018swxVGRjK4HvSK4AuHUgiEQFB2cPdCGPPPY0fKM4yiVPH
	uAQvp0VDgclXdxCtUtAN+a7tjXmsfSBqGhleW9AEVHvr/4pAJdrbsTz2DO1IL2HyDT5MxdjojF/
	MUgmwdEo=
X-Gm-Gg: AYBFou3iSGXc1Tv7cpnoNVmMETRz2fxGau0EKl2aW8PxePV7SP9Yj6sLzugtINqoMfr
	NbF32G6ii1PB0ZGCWKPyAhpqXdYQluHi+PFaF+LCdO6CuaHfR4ki8F9I1MKnjSqut+7SBsSKmWf
	xEM/dVDc/FTtwlqAfPho50kshViZl09FpRUBKqPBD02WRrZWRg7KaUT3aEPCwEwPGnfHwbKkgx3
	lK7sVnBSZ/KopToHE94tHPNg2YNTX69cbZBlzN8yF2oyWtmvaaYp9Dog7yhnFgr8aDwcsrXNpDt
	IPa2kuF1My+9Z3SZjgEgkVAFkh1fUsTa5HsoS4ZEm5nYvLJWrDVAedc2U13WFU10gHkTW/7cyYZ
	3xcGh+/igdkbvXG0sb871EamwZx6iz6qH24Ic97BsCMunNukk2ffvigEMNviEuaquUCdueN621e
	gprnUp89DxTz0/2wnLUQWPRXz3FyRYNUO3k4ZLE+VDg2rVlz04MMezlhCPKTiBVPMqY7g7A/+qR
	ZKs8NV20LNi/NcIcri4Zt0KuSCRaKyxgvBCXHC1iOH+jwuB
X-Received: by 2002:a17:907:3fa0:b0:c34:d75b:dde0 with SMTP id a640c23a62f3a-c419dc396ddmr421951466b.20.1792349949976;
        Sun, 18 Oct 2026 11:59:09 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32876asm289130966b.10.2026.10.18.11.59.09
        for <sashiko@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 11:59:09 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1aa29e06bso2308611a12.2
        for <sashiko@lists.linux.dev>; Sun, 18 Oct 2026 11:59:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxCLeO6MOpYLa2p6ouzDEVUyCaUrkdzHCHrh3V140PDPVSVRTJQ59a05Ft5k/I9PyF+G0ZgJENA@lists.linux.dev
X-Received: by 2002:a17:907:944d:b0:c2e:317e:d711 with SMTP id
 a640c23a62f3a-c419e93a4aamr384493966b.27.1792349949125; Sun, 18 Oct 2026
 11:59:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>
 <CAHk-=wj24dSSRDQjvkmcw9LMC=K86d-Xys9=qX=gKoXgrQN1UQ@mail.gmail.com>
 <7ia47bjg141n.fsf@castle.c.googlers.com> <202610181138.E3AC979EF@keescook>
In-Reply-To: <202610181138.E3AC979EF@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 18 Oct 2026 08:58:51 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjaAtm=d=kop+nabwDPvfdHkO2hWG7QUa1x+JE3x9uV_A@mail.gmail.com>
X-Gm-Features: AclHuK_ZUzziQz8NNYkXZTiGqj6yKwxN6q0vlCU1UFZMXEI4WPrVTzacZ6LSxcM
Message-ID: <CAHk-=wjaAtm=d=kop+nabwDPvfdHkO2hWG7QUa1x+JE3x9uV_A@mail.gmail.com>
Subject: Re: Patch pre-submission to Sashiko
To: Kees Cook <kees@kernel.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Jiri Kosina <jikos@kernel.org>, ksummit@lists.linux.dev, 
	sashiko@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, 18 Oct 2026 at 08:41, Kees Cook <kees@kernel.org> wrote:
>
> On Sat, Oct 17, 2026 at 08:10:44PM +0000, Roman Gushchin wrote:
> > It is really easy now:
> > $ cargo install sashiko
> > $ sashiko init
> > set the LLM key
> > $ cd linux && sashiko review HEAD^5..HEAD
>
> FWIW, I have been using this for a while now (and making this "local
> review" mode more ergonomic). With Anthropic's recent "API credit" stuff,
> this works very well with the Haiku model (Opus is outrageous over-kill
> and charges you 40x more than haiku).

So we just need to make sure that people get this automatically, I think.

Right now you need to *know* to do this. That's a problem when at
least some of the noise comes from people who don't know the kernel,
and don't know where to look.

Hopefully the agent updates will sort some of this out and just mean
that people get a sane baseline.

               Linus
