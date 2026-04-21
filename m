Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388BF3630B2
	for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 18:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776796329; cv=none; b=oG5BQu065PeS5L3QmcJE19zOnPjD4Fwz4puuq4NAAGjCia+c9UlkEmvJ+o1NQFrQjqzs/JT2yGhib+3xg0gydM093VXgkZEteHBWU41b+4MRtrWUF6vw83BZkbdDhqK9AXc+rapEEDYosQP0OE7nQkdBLO11WjsJxf9sRshzUYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776796329; c=relaxed/simple;
	bh=ij+QIHpFUQyZIYh8EZt9NenTS4afIzL27SdoH8Ox4Ck=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YPwqohzy+HjxNhDL2hR0c0NzZBY4iEhVhSe/tnFAxItj2+fQymAcfUhnEhkSM9LMqHomDfpRqN/Mwi8ggh1LOWGjfjooCXYlh3RUKyBnMQbmejlHgfs6SrS3Bi+R8QCtYmdPF4tqpUomrcYr+KUgNheG1Vvkh/dq0dHauYDjmRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SlHRhZO6; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SlHRhZO6"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso2665356a91.3
        for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 11:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776796321; x=1777401121; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lK7+3C2uByBRR9Frq1UsNZvguw0WhkY54cekKawpE+o=;
        b=SlHRhZO6LLRMhOAXZRWieVlHBijbZ4u0ZV0yaj3C7umBjqrEb9bx8FMWzbJPlI/ajR
         De7YDD7/6dPSJSFcROhg9ITiuF7JbshIP/VFokLH8xYHhbFprYuXWoVqg8T8GIRJArkP
         s8vyBqlH2qB7pss+Mg2GZJfQmuoxvGUj17Tzgdn1e009G2g6+ACV9ojppOc+RJw+2BDn
         mt9ZY/PDMMM97EbIbwNzo0/7EZmPjVQWeu8DgrhM8vmMLoVrNKnIs/PSRdGllm6iuUBv
         vOGrhYAXSx6XRUvnzz4p0qyqsb2LtIbFW//0s9SnfUcOYzesyAfvKvDWEEMzIqKecnxc
         RTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776796321; x=1777401121;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lK7+3C2uByBRR9Frq1UsNZvguw0WhkY54cekKawpE+o=;
        b=rH61FmiHbvpqn4o7YAVXJDmC3LELlYYrZKgRxhjOX4eLhmeQc71B9iYgnNNaabYLjS
         K9GOlP0aWrxembEM7jaP31lMHHD59/IR5vlfqSfPhaHdd5Tvd0/r6gDXjyFJXzyLXokY
         tAZfgPOflenpsxV7mytsvpTYWGZ/m0ihrrEjS+bVBsNiOpNwXxhPf6DY8eSmgjla8twV
         eh/oyjw8iKCOGECEG0ydbBOzg/PTn522g27qQVrW9PDndWFkt+R6rOFK3RevuV/D2d/R
         WZl9kSPnKArvXdy2Ekp2H4F5PuYzsJ8UfoOWVPBkic/vH2s2+sdeyNGdf0fp6ZIeeI9h
         PicQ==
X-Gm-Message-State: AOJu0Yx0OYPdeIr5YN1fzZheZ735klko8ao8rSf0k0Rri1Ep7GDsqKsh
	vG4UxfpeTQ+KyiR/dvn2eKkzJcHX1WTOv3IeOwPZe2iYYspMPedst5z8D2ipnIf9
X-Gm-Gg: AeBDieve0kdOFn5OFoa+j9fPABhGQcWMhS0+oZC/YQmOKNpnEvPpJ9oSaLQrjsWUPFL
	i7xegZAYDes4alCO2Zd9nqoZTHabjt3SHe6FsYMEKIzQnPo4fBUP3mTmb8A1qa2xzSCt/ji5DZw
	tLNKFR7lkCkbyr9WqsXzPsCFaj0ZTsPf7UVattQmdp55CHgt9FQRJHuUWZgLb5lsyfiz2/m3wpP
	ST1sNQlBkapIfHz7zNeDi7/yVldu2FJzVHbdb1jtOh2i2wp+ym8Wt7Yg9UKSw8fOIjQNsaqsdKA
	26KaVcuLQStktD6GfOrReAAv6Z3rwriSuBVg3Pa/04Z/XSZ3bZjJ9tGzEIe1en3MV7nqfX+ODfR
	VZ1HPhpyg8GIlKtodS8nipjnxWJv/YCmEPO8ALaCZOGpmwuJu1LrjkGCiwMKKNCsuLgH7uxZ70f
	iT+qFi7p6uybHA/NxCK0KewtZ3bE/y/Fq7L96jnbhA2S3tma9WsQzB/UK4EfvDUk8=
X-Received: by 2002:a17:90b:2e45:b0:35b:e4f8:7cc7 with SMTP id 98e67ed59e1d1-36140473f8amr18060116a91.17.1776796321078;
        Tue, 21 Apr 2026 11:32:01 -0700 (PDT)
Received: from [192.168.0.226] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-362bbf963c9sm4437875a91.16.2026.04.21.11.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 11:32:00 -0700 (PDT)
Message-ID: <273f0062e24d927208c46da5b0a323067ab876e0.camel@gmail.com>
Subject: Re: [PATCH RFC bpf-next 3/4] bpf: replace min/max fields with
 struct cnum{32,64}
From: Eduard Zingerman <eddyz87@gmail.com>
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Date: Tue, 21 Apr 2026 11:31:57 -0700
In-Reply-To: <20260421180631.B0A44C2BCB0@smtp.kernel.org>
References: <20260421-cnums-everywhere-rfc-v1-v1-3-8f8e98537f48@gmail.com>
	 <20260421180631.B0A44C2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2026-04-21 at 18:06 +0000, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 1 potential issue(s):
> - [High] Incorrect range constructor used for BPF_JSLT (signed less-than)=
, causing verifier soundness issues.
> --
>
> commit 1fb11732c3d626f4a1777699934aa05d07b7eb56
> Author: Eduard Zingerman <eddyz87@gmail.com>
>
> bpf: replace min/max fields with struct cnum{32,64}
>
> This commit replaces the independent s64, u64, s32, and u32 min/max field=
s in
> bpf_reg_state with two circular number fields, cnum64 and cnum32. It also
> refactors how bounds deductions are performed and updates conditional bra=
nch
> refinements to use circular numbers for set intersections.
>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 2e896f5d92a2d..90ed32f064650 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
>
> [ ... ]
>
> > @@ -15861,38 +15209,54 @@ static void regs_refine_cond_op(struct bpf_re=
g_state *reg1, struct bpf_reg_state
>
> [ ... ]
>
> >  	case BPF_JSLT:
> >  		if (is_jmp32) {
> > -			reg_set_srange32(reg1, reg_s32_min(reg1), min(reg_s32_max(reg1), re=
g_s32_max(reg2) - 1));
> > -			reg_set_srange32(reg2, max(reg_s32_min(reg1) + 1, reg_s32_min(reg2)=
), reg_s32_max(reg2));
> > +			lo32 =3D cnum32_from_urange(S32_MIN, reg_s32_max(reg2) - 1);
> > +			hi32 =3D cnum32_from_urange(reg_s32_min(reg1) + 1, S32_MAX);
> > +			reg1->r32 =3D cnum32_intersect(reg1->r32, lo32);
> > +			reg2->r32 =3D cnum32_intersect(reg2->r32, hi32);
> >  		} else {
> > -			reg_set_srange64(reg1, reg_smin(reg1), min(reg_smax(reg1), reg_smax=
(reg2) - 1));
> > -			reg_set_srange64(reg2, max(reg_smin(reg1) + 1, reg_smin(reg2)), reg=
_smax(reg2));
> > +			lo =3D cnum64_from_urange(S64_MIN, reg_smax(reg2) - 1);
> > +			hi =3D cnum64_from_urange(reg_smin(reg1) + 1, S64_MAX);
> > +			reg1->r64 =3D cnum64_intersect(reg1->r64, lo);
> > +			reg2->r64 =3D cnum64_intersect(reg2->r64, hi);
> >  		}
> >  		break;
>
> Are the unsigned range constructors cnum32_from_urange() and
> cnum64_from_urange() correct to use here for a signed less-than compariso=
n?
>
> Passing S32_MIN and S64_MIN into the unsigned constructors might cause th=
em to
> evaluate min > max, resulting in invalid or empty ranges being intersecte=
d with
> the registers. Should these use cnum32_from_srange() and cnum64_from_sran=
ge()
> like the BPF_JSLE case does?

This is a bug as well.
