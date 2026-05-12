Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C72F299AAB
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 02:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778551770; cv=pass; b=QLyAOUMZlIigvdEfB9WiFcw2FPJ4Mf5qYLz5iqAMGOZJKjXze13JALY/D1hMnuNoOjpkcqiGebUCK9LtGhpuzOEVsuVtQC3pHxyILCt/7pMbN8iQ30irvS1pOHr3IcSeJD5ziEVF2Y4wL7rw1XIWMWdwA07Eez6G5Auo8ri6h14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778551770; c=relaxed/simple;
	bh=Jh+iMjgNyFQszMCiB1NQMMTdb4aDvjEfdudedfcNapA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EvXNgkY8bD0Il3cvIKsLqTI7PGs4+op0EwyZGEWuST1LZ4h5cuR9cltfEnu2GHIm859mC5+Ybapc11waZv8UAH6QjndfrJDzyzt8aaR0ztCwI4xsagFktPoqiM4mLof9vlbLdTl1duCCk2nRQd/SwyxAGv03pBOSIam13PSGSEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3KgteBm; arc=pass smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3KgteBm"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-44c4cc7c1cfso3985693f8f.0
        for <sashiko@lists.linux.dev>; Mon, 11 May 2026 19:09:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778551768; cv=none;
        d=google.com; s=arc-20240605;
        b=QXsUp7UO086ruKtJGE49zoq6UEZ0pvwluWX1fMyn4jO+FZ8tViBT2ZqOGaCuHfD8HN
         o1/xWVmpbEc+wCXZw0Gx/ZV2cq5lxEVQNQZ1cP8XUnuvd4IUHYm4rKgiVzpwKQPHRpGl
         i1uI3KH6R5YD9GxWD4EPNa/VHXaah9c6fZBLE5/42csMmoyLeQ8pWszI7kMvCL7UJBiN
         G8qqMy7OSDWTFxBiilA/V1TnZuzcVX+sAX5N3WuKVaofyUUZFSC2WJ8Hh//qaYPJNtOR
         Q9xtoG6qIHMms9caV5C40g50RC8xmt8DVOhE4I1F3OSVoo7vumQZe/T18jKoaOAROiZu
         o++w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Jh+iMjgNyFQszMCiB1NQMMTdb4aDvjEfdudedfcNapA=;
        fh=aCY0OUxCXkZYEQZfLNSmGJ1GVZ7qDCcH0RRkYpO6yZk=;
        b=MdslIkD0VcGbhPzqYTnI3xm1dQobva4SYCWlHtj2+Itq8qljn4TpAPdEFU/Jkzlf1z
         se7DyJ9fMcs41mhKGxT4GExX8H2dEeMEffhP3V7AvR50voMOKZ6LhIoVEb4igM8P+mIu
         FFUqZbVuWtkqPYd3MrNd4jEcdZSecgTeb2ZhR2I2zqEmliQuc7V/EMF6Fhx9Ye/rrIOK
         8c6TVB3owDfWPZxn+v2rni92jqKAFJQvhHFPUsK+6PcBhnfPP9eN3DEqQAQ6DrVjUwfI
         TxrwhfCBjfvo3D0j2L9nvYY9nw8fx9ysQYbzL4cyulBLRl1urzyDFLEnvk7xtxmEX9Ot
         vRrA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778551768; x=1779156568; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jh+iMjgNyFQszMCiB1NQMMTdb4aDvjEfdudedfcNapA=;
        b=V3KgteBmxKJ6wLTIn4QInpI9wPyR0aQRZJrl5b+e8ass5uFWQIm1cj2hrs7rQrER56
         2/Fmj82SgAoy6SjHRN/uHu6TqOnnMo6sF59+bNoeGqgquvn889oTAzbcZ2WICYiLumrA
         1dl2fxClVTqWadV/7gEZa389fAynHqOaIRvN0DxccD30B1t7YyX4FNcqhw6MozKjguGE
         NvlM8RPwrVGFUy+9AuXTRKByWsautDGAsG1+G0VNBONy0A7S9/oaSpExLWupVfjFbm+Z
         E/9muqa5FUFerrDQTxn09X9BfEYbWiEaMW01Fq483X4lnLlxGk8It809801UtgUQujX9
         14UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778551768; x=1779156568;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jh+iMjgNyFQszMCiB1NQMMTdb4aDvjEfdudedfcNapA=;
        b=WXtkO0lpGTHJQTw0Hk48wkZ9IjJIUFC/5ZppM/N9JB3EZSYETx3TfZvm304pEI/dyd
         bHlLoZvp8oNlXg5BqSz165b4WYwzocOm93sfrlPSmih+CJBLEkqqyE3EQNpzvh0XX+bk
         SAQX0KiiCT0AKa+DjLmPAItDPZq9MLQpAKYkCuPvk8L+KC95zGlGod6HVG8ZAS5e9ouN
         RtLEtHo0l0eTBAL6FSIlE9AShUNa1cDxjBv2s5uFra9+x0u181zg36eLiIl8XzakB/KZ
         KCw4kQVgl6G2WDYYji/oWgutjQmVBEzrGySSKKJ/atEZQ5h9DlRZAlNLDWaMDdV26nmI
         hLLA==
X-Forwarded-Encrypted: i=1; AFNElJ+JnL/0/nuTrPGli+R/RPVAjl8gxxxdOkdbslpnLZZSXz4LEtPRXmr0rN6OeL4yBY6GG3e/lise@lists.linux.dev
X-Gm-Message-State: AOJu0Yypk+K8VPPOfIRJXFxQlFOBj5TX705jcFqEjwFqKegVF3qrt4tj
	+A+YOy8TZukU/P7HzLyF0/7iIkYZSrvO7iatjRfi8ttn5mb//XsbGZnDkqpoOENxrFMphM0u9Hz
	GKr6t+74RaNUqGsJOwVXSKRehy/LiL71KRwpL
X-Gm-Gg: Acq92OE88mG267CX3pbYJ0v+riwtflvWZtzmXA6XOGydpX0bSCorlwjppDv28DQdEPo
	lZSbptboYhIEMgJC1N/e0/F6muFEM6mXbsbhgXF3I4vPaDx9GyxU2zTiAwMdDVMu7Se88NYvqh3
	wPcft4W//6nIZq95Q0SJJPqtPCk4vRY5jHW6FvWrab4k6/EWwdic+ij0XcMYKbErQ3oEvrygs0t
	6rzKuv+AoP8swz/wRuzIwvw5mbEoPKbpcf4oliHjXn9RVpWPlAcJ/qU76SEpUOfA1II6v9F/xNj
	j9evjcacUf2lkHm48Bb7kFJ2kBdL7ENcEynlUqkfMoQ3Om7MlCgpXxzp9+AgKsCjZudz/VLeaw+
	bFSYMOYfeFCtCvcldZCNRKtJDq8Zx3Zl4Z7PBKlR/TV9V2GcAEsm/quQJirmBkR5Int4=
X-Received: by 2002:a05:6000:200f:b0:43d:7275:c1ec with SMTP id
 ffacd0b85a97d-4515dc80c49mr40689298f8f.40.1778551767666; Mon, 11 May 2026
 19:09:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <agCXEJKJh-JGMhjG@zenbox> <CAADnVQJdFCFJcg0Pqdnx=D2h5vHj_q4mrwSJYxRC5RW0NTFNvQ@mail.gmail.com>
 <agEnc0aYMhuIeDlq@zenbox> <DIFYUK5DKGAT.189D9YYSQFCUZ@gmail.com>
 <agH_0MEw4b0pB11-@suesslenovo> <DIG0ONMVOP0L.3QFYUPWFSKWI4@gmail.com>
 <CAP01T75942V+wKJD0yhs8yb7U5vj+y9s6efJ+UdpTMfzP31CWg@mail.gmail.com>
 <agKBE4Ci4_LmJ1Dc@zenbox> <CAP01T76i3S93kvXnQvK+NU1ee82s+ka2jQfmf-yL86r9AS2tuQ@mail.gmail.com>
 <DIGBOYWXZ95S.3GAGVQGUJNQD4@gmail.com> <agKJzaG6U9-XppgE@zenbox>
In-Reply-To: <agKJzaG6U9-XppgE@zenbox>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Tue, 12 May 2026 04:08:51 +0200
X-Gm-Features: AVHnY4LdMq09AYWTdREsN1g0HNk1L-NmIPCvlLrhaBtburmlHA4cpo0l3Pqz9yM
Message-ID: <CAP01T744a+hHqS83jC=eh_kwR1jCqdak=tjAEeQob0N3L4YMsA@mail.gmail.com>
Subject: Re: [bpf-next v3 1/2] bpf: Offload kptr destructors that run from NMI
To: Justin Suess <utilityemal77@gmail.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, sashiko@lists.linux.dev, 
	bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 May 2026 at 04:07, Justin Suess <utilityemal77@gmail.com> wrote:
>
> On Mon, May 11, 2026 at 06:55:50PM -0700, Alexei Starovoitov wrote:
> > On Mon May 11, 2026 at 6:46 PM PDT, Kumar Kartikeya Dwivedi wrote:
> > > On Tue, 12 May 2026 at 03:43, Justin Suess <utilityemal77@gmail.com> wrote:
> > >>
> > >> On Mon, May 11, 2026 at 10:10:07PM +0200, Kumar Kartikeya Dwivedi wrote:
> > >> > On Mon, 11 May 2026 at 19:29, Alexei Starovoitov
> > >> > <alexei.starovoitov@gmail.com> wrote:
> > > There is no deferral here. I'm saying that we just cancel for timer,
> > > wq, task work, and leave other fields as is. So we don't have active
> > > work pending for async items.
> > >
> > > So as long as the item keeps getting recycled in the allocator, we
> > > don't free these fields. Once the memalloc is destroyed, the dtor runs
> > > in a known safe context where we can assume bpf_obj_free_fields won't
> > > deadlock or run into any problems.
> >
> > So the plan is to do
> > if (in_nmi()) && case BPF_KPTR* | BPF_LIST_HEAD | BPF_RB_ROOT
> > just ignore it?
> > And no other changes anywhere at all?
> >
> > That would be too good to be true :)
> I guess the last question I have is what would prevent an xchg() out of
> a map on a recycled kptr from causing a UAF?

xchg() is atomic, so either a program now has the value, or the map
has it. Whoever has it will end up freeing it.
If the program has it then the program frees it. I don't see why there
would be a UAF.
