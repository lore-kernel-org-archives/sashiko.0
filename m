Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B0E3016E0
	for <sashiko@lists.linux.dev>; Wed, 15 Apr 2026 18:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776277852; cv=none; b=IhyGmXpOjuNCl1nMjbiHTprdlIY1LzILsXzyvTxFnaotP17lLQ0mApksCQ/foXsaIujwMZZ47H7h3ejAY/hF15XjG28cYe3iQCLICpVHQPM2kG02JPBkGBG+g5nhlFtna21fCoO9pZbFwRe+1SaamC4RHgtsGMsC25AiBC3nzi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776277852; c=relaxed/simple;
	bh=BVUA7N2yaeCQv6TbIR9RaYMc7eBqBCpeEQlxFB7Rkak=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ploTGIW2P9kEHI6kO3lD+YQKgr+gaZt2JPRoHYnGTp+p5XUT8ypqU/U/zv6ADMyxIbGH6hUmh8O6XWArsiri8WEvD9N1NNhYxt6t9SQasXgTuy9cAMOwhODhHl9m0+3rFDfnDSDpuCXHv42WInL4PF9wTYhvW18GJl5u8K99kJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHNIs5SU; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHNIs5SU"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2d8ffdc31d0so7834350eec.0
        for <sashiko@lists.linux.dev>; Wed, 15 Apr 2026 11:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776277851; x=1776882651; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NKK54Iv6FoJSV+Ee9e/EOm1dSYdLDZIIeDygmYMlKIM=;
        b=mHNIs5SUKr7DHwPqkuRubSEKC/i4+xhZvpnqQphJ64ZaRXaI18NBqiE1+WpYsU6EQw
         nKt+Bi0aSpPx1HVd9jJ3lVi0e4WosPDnHMUSEu4mSQnKY42VL7EiaxCXzZxHVvWJr739
         TdRGFBX/I1ZcUDFOAvVN7+L+4//MalqFynq2OUrJ6Is0rxlHDrePTAPOJ+sM5u79wDD9
         f/n8t46uT9BfiPxzghzcjVjMJt1On1/x9rCP1YRhOzGIu4VgTzKQGCB/Xx0qZX5MLuqG
         E6ii5B3hnYrO4XLeT5sSB/aByefaFBNr8iNvfmERvJoQLO0nAlKYUP7N+ScTp7pyIocm
         miVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776277851; x=1776882651;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NKK54Iv6FoJSV+Ee9e/EOm1dSYdLDZIIeDygmYMlKIM=;
        b=A2nKhvWYG56vlusqyC8opPVmO8wDmsEKfVdUxAHW2qpFEWfDxVYfiIQJF0zGF9BuNJ
         lyEr94tt8AA4XS0Z4TdiZMBEjXoLVHqDasbvTisx5gXYc/vQ9AsTZDx19H451RdLo9OI
         2LzNlQXUP5oRzY8+rkizF7GUpnXmyyGz/jkNoG8Qe66oyg8XUTsoUJ7DMz6zY8KoMxUV
         ye3txd1FId7oWFk/57w8dPcpOr2gGLgrNfU0qOrCKpmOo8Op1OBkmSnRe4cOFO26I4cw
         30AK6ekYMEqHVnyc4koSBiMQTcPsnECjy6QKFLnJotgS8jNBUUyqHlauQ6zefkgOxFCU
         DQUA==
X-Gm-Message-State: AOJu0YzJXByzPnqCXhBEVWNBSnqtrU3GYbZKwWBlMuOhtOXeP0YTTsie
	RJtPogvUo4ZumexXT5P1v9P0k0r6GK7xdz6ZCKQPCBnEY7PGVDNX+u65bMiePZS+
X-Gm-Gg: AeBDievTVnU9b9TopTG1G8gtvGz6h1WSRFzmwAG5r17Lyybw0gVmBxmkjq8ALlg1F33
	rMB0GSf9GsLgLXz3tlL6fwvKFCg2sYr4DuRWBHrLySLvC2I2crXTOfzxlYGfpkGgz0G1FyW7fU2
	A8zWIu8mmBMTHqsteW0WDjBhIjIC7W4/HSg8hddn5V1tc1o7wduGeF8P7Dn/HbQar+6F8TfEqrD
	E2va77iPFowHE4PNPiPcZxoVKHPZT3aKPvfZCGZ7COBZM4bsy8oROnLwBEKhc3INJlGZuBddMOD
	SYpyce2MncxfMSFF8sD2nBlDrhubAUY/wJIw04HB9ktePDt2AdvhNPtYlJe8PEb7U0oGskTVTlH
	EcqRav/66nfOUa85r1hpRLe9iLNFlXqqsB46vOyuaM/b8mMOSP428yIw0SWMb+q84+sLiOYrm8G
	ZzBnTRyZZaz4qpVJkg+8f8DjeNl6sghEAb1FmHw7DQsoGFS6YxkKrRrWB0B65ms0AeJzwZoBWEJ
	dlABw==
X-Received: by 2002:a05:693c:2c8d:b0:2d1:93b8:bc81 with SMTP id 5a478bee46e88-2d5893632cfmr12879890eec.31.1776277850477;
        Wed, 15 Apr 2026 11:30:50 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:21dc:2944:7f23:f4d7? ([2620:10d:c090:500::cdb0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8c606222sm4742024eec.8.2026.04.15.11.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 11:30:50 -0700 (PDT)
Message-ID: <7178d2fa2b2bd6d9e33b72985d20141ad15bfa81.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 1/2] bpf: copy BPF token from main program
 to subprograms
From: Eduard Zingerman <eddyz87@gmail.com>
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Date: Wed, 15 Apr 2026 11:30:49 -0700
In-Reply-To: <20260415010834.C7DA5C19425@smtp.kernel.org>
References: <20260414-subprog-token-fix-v2-1-59146c31f6f1@gmail.com>
	 <20260415010834.C7DA5C19425@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2026-04-15 at 01:08 +0000, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 1 potential issue(s):
> - [High] BPF token capability delegation is ignored for JIT blinding beca=
use blinding_requested is evaluated before the token is attached.
> --
>=20
> commit 6cda306e3c0e6ae78f183769fc6ebeb4369f35c3
> Author: Eduard Zingerman <eddyz87@gmail.com>
>=20
> bpf: copy BPF token from main program to subprograms
>=20
> This patch fixes an issue where bpf_jit_subprogs() omits copying the BPF
> token to subprograms' aux data. By copying prog->aux->token, subprograms
> inherit the same capability delegation as the main program, allowing
> bpf_prog_kallsyms_add() to succeed for token-loaded subprograms.
>=20
> > diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
> > --- a/kernel/bpf/fixups.c
> > +++ b/kernel/bpf/fixups.c
> > @@ -1110,6 +1110,7 @@ int bpf_jit_subprogs(struct bpf_verifier_env *env=
)
> >  		func[i]->aux->exception_cb =3D env->subprog_info[i].is_exception_cb;
> >  		func[i]->aux->changes_pkt_data =3D env->subprog_info[i].changes_pkt_=
data;
> >  		func[i]->aux->might_sleep =3D env->subprog_info[i].might_sleep;
> > +		func[i]->aux->token =3D prog->aux->token;
>=20
> While this ensures the token is propagated for bpf_prog_kallsyms_add(), d=
oes
> the token delegation still fail for JIT blinding?
>=20
> Looking at bpf_prog_alloc(), it sets:
>     fp->blinding_requested =3D bpf_jit_blinding_enabled(fp);
>=20
> And bpf_jit_blinding_enabled() calls bpf_token_capable(prog->aux->token,
> CAP_BPF) to bypass JIT hardening for privileged users.
>=20
> However, at the time of bpf_prog_alloc(), prog->aux->token is uncondition=
ally
> NULL, as it gets assigned later in bpf_prog_load(). As a result,
> bpf_token_capable() falls back to checking the current process's global
> capabilities.
>=20
> If an unprivileged user provides a valid BPF token granting CAP_BPF, the =
check
> fails, and blinding_requested is set to true. This state is then copied t=
o
> all subprograms in bpf_jit_subprogs():
>     func[i]->blinding_requested =3D prog->blinding_requested;
>=20
> Are token holders incorrectly forced into JIT hardening due to this seque=
nce,
> disabling direct tail-call optimizations?
>=20
> >  		if (!i)
> >  			func[i]->aux->exception_boundary =3D env->seen_exception;

I think this analysis is a dud. The token is correctly set for the main pro=
gram
and then is propagated to the subprograms.
