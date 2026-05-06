Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F7546AF11
	for <sashiko@lists.linux.dev>; Wed,  6 May 2026 13:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778074036; cv=pass; b=cPoL2epltUJkPA9MrNpjlr3VGLKVT19DuyS1hY+Dmk8/78AyVIHDpYFR4c1DOJBpPgzH9KPwjgiQaN3Fnj9Wif6678AXbbLmoSxVhijGfnIrKMjRi25tJa1d87gUi4IpZnRVAGxVZdX+1JTfpetfmmihxdrwGULOcH30aC30P9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778074036; c=relaxed/simple;
	bh=pFDIaO3ijrgVBN0tzYnOqs0tlVPFCNUED/bjUZob+Jw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a+b4vki5/5loapfBcmxBQtGHMliRz06WScIuPI09Qm4lLgcK1Q2Tc6Chx3LuxIj0VNorqUdVQrY5r2CvlfSwfcL2Sdb2nUZqCrJd3z6CZHvMwWOngONTxGvOFoVHEQDQA5VleQMtnqk61ity8OX4+adLMmgrykNPmQmdoL8ZIOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ijdk2X8K; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ijdk2X8K"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-393a44854d2so25641291fa.3
        for <sashiko@lists.linux.dev>; Wed, 06 May 2026 06:27:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778074032; cv=none;
        d=google.com; s=arc-20240605;
        b=Po3MA0wla14xhGUBq/MWH1/qsbaEq0U6kR+TAVu2nxbLSFUmHGb56yGydc+jNsGmJA
         IQtAQMgq1XTuq19/UV06EsbzJIRMM7WJw50FUKen5AdOmHQJ0gTu5DXHFEgLTvZw5nw4
         CoyHyXIIoHWwE+jQgGRoW5QAX2JNT9QOudOK+oA4vmoNb/xyHBJlp/HVvxN2zgw8ZXCV
         TTiOVowg1ZLqslx81ulX/6jOylcuYR7E8AuKiPIgoO+D9tJcNjYiuwzkqaoRpmVgNGvg
         05g0qbP5xe/BM37Zk5UI5os9s1HCl45EbwLN2HegHSyccdTH6/MfqEqneAmU7DEjh91A
         QFnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G8+O6WlrTVqaZn8/F7q6B9USYK4FirbixL2u42VdTFQ=;
        fh=TehjY1t5eGpLR12A70uh3MyGVP6T186N9ByKaUcxf4Q=;
        b=QWlKqKib/oGcKGoTlBJ/6N5HwPP05Eh96wdGhqXyKzEONfDMqVHjLLuE6ULcHJnF6/
         uyjDDyHlLCDpi8t/EZ9cfWGWwN7+p/v8IMwsTC0ur9fDG+QhZE1ckIZta62FLBeZa8Go
         40S77b3ijG/ZeATPoOStrtfWQl5ooepNT+pjjbEXhFDdVhxjdxvMh1vyZxJp3leTnVHl
         JNo771z8R5plhsHB/hAPcF7Rn0h/MrM2VxF6TLmPAp9muP0+5MEC9rmSO+Mjzcj9XyGj
         KSdQWuROcpb5MMeFLW+J7n34ONYBN0X0snICBYUYEisYPlqlJywiH+cB9e1MGkmM8FEV
         1hRg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778074032; x=1778678832; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8+O6WlrTVqaZn8/F7q6B9USYK4FirbixL2u42VdTFQ=;
        b=Ijdk2X8KKjvcqmU+wMVmhm9IygkGuenxu8JoSjFdwDAZLhLFJpb06nSe4aRGra872x
         CJ9+Uj8c+yLDL+4juk+OEDrVhkB+CLrF7XSa59kEIJh3SMR+IIVXYe1xP1tTGh4UanV2
         RmS/Wrli04EpCNgw2intezZlC1Vdar8YVJ/fWJ6/CLaz51enTsfroogrWzO/PlzmLeIL
         MIrHGgtWE6riQg1Zl6k6E0UTEnpuO9fe6NFTPSg8UwqHV6VIOI5jYUqsGQmTqgH7c3/i
         +c5jq7HG9nyyzKdb1YpLVqpuuTJBPq2SZp6qywjRGLfyPEIj4+7N8zm9ko1a5AM+tbE9
         d9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778074032; x=1778678832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G8+O6WlrTVqaZn8/F7q6B9USYK4FirbixL2u42VdTFQ=;
        b=a53JUpqTl2QwPZwzJt3pwEXig2xmGOpYFLYeeDfWjHDNqPhQy3Og1iRmgc01we+PFy
         vX5uoNlUpvjwcv9AClY8zg8qDoh1UtOIPL9W+DCspiYjEO6UKqKVD4ca5rK+9urn5jYU
         6imDOWSHlUmhFJ5OEaLMANzKyesh3FZ+HumAumK87xCiPpNjJhNdMjyO79DDyh4y4aFf
         eLwD4hhpFBOSNghhpJAOFjM54Ib1VIhuXhENK7pQq00wCbNWQBsL3cftOQ9R9ki2BqGv
         KUDlIbCMOlcrAVi9+oeY/aD5ORK1kXhshujhQAYs0gnOMNpzkV3GYalp+H3VN3/B0Heg
         uN+w==
X-Gm-Message-State: AOJu0Yx/47m/xTC4PeaCD8wSnwPVJiN+oVKMOophhbhmlG5HgbCktNfC
	VkGTzVdhpgBaIQCmnaWEoiOTWkWCeflAVu37h+182rbH1BwATugNmUVVILSlI4oX6g4b8y5ZbH1
	yemENZ/jqpiMaXf4ZEVA7kVDThYPa+cJcvKFg
X-Gm-Gg: AeBDietNCguFqLpomTRt9ccfJv0RANJFVYTsZDVs7Mj3HDFjTkWfnMgaT1xVjLJq6Ca
	nQ7WULzeToBiijgRy/SUeJb/t2nt/m9M182H4eJR0Iv3h0J9h7Wi3m0UU+kydu6RSa1eMakI45K
	S8GPaPqiMKo60RSiAo5UTeXWSh4gYoI9h/TJqdCCqSRaM42GO5Ok5CmmBigQAdqCutWsS8idpbF
	vZbfyXmGfLhzHDDY9R1ml593rWt5UDBSrm20E0DENW823FNS++lRQ58Fs0fOPwLoT0dkkXcW6OI
	Vn/asLbo2MUEyI9b
X-Received: by 2002:a2e:8952:0:b0:38e:98b0:3a7e with SMTP id
 38308e7fff4ca-393c4211654mr10682631fa.22.1778074032033; Wed, 06 May 2026
 06:27:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260503165024.1526680-4-vernon2gm@gmail.com> <20260503174125.2C949C2BCB4@smtp.kernel.org>
In-Reply-To: <20260503174125.2C949C2BCB4@smtp.kernel.org>
From: Vernon Yang <vernon2gm@gmail.com>
Date: Wed, 6 May 2026 21:26:57 +0800
X-Gm-Features: AVHnY4Ljul8CUzS_G-va6ruKGX3ZCJiSzHij9r9KLJr3ECHCCjVxfY92mQxB2T4
Message-ID: <CACZaFFO9-xe-LewtzcUn9XHaJOUiMv60==M6TVOPVJHFafAefQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] mm: introduce bpf_mthp_ops struct ops
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	"David Hildenbrand (Red Hat)" <david@kernel.org>, "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, inwardvessel@gmail.com, 
	Shakeel Butt <shakeel.butt@linux.dev>, ast@kernel.org, 
	Daniel Borkmann <daniel@iogearbox.net>, surenb@google.com, linux-kernel@vger.kernel.org, 
	linux-mm <linux-mm@kvack.org>, baohua@kernel.org, Lance Yang <lance.yang@linux.dev>, 
	Dev Jain <dev.jain@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Forwarding sashiko review

On Mon, May 4, 2026 at 1:41=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 6 potential issu=
e(s) to consider:
> - [Critical] Use-After-Free vulnerability in `bpf_mthp_choose()` due to i=
mproper SRCU locking.
> - [High] NULL pointer dereference of `link` before validation in `bpf_mth=
p_ops_reg()` and `bpf_mthp_ops_unreg()`.
> - [High] Newly created cgroups silently bypass the hierarchical BPF mTHP =
policy.
> - [High] Silent registration failure leaves the cgroup hierarchy in an in=
consistent state.
> - [Medium] The BPF program can only restrict allowable THP orders, not ex=
pand or select new ones.
> - [Low] Compilation failure due to dereferencing an incomplete type and a=
 non-existent struct member.
> --
>
> commit e5c9c74b11f76b4de7ba4ef8ff94c10bae978e16
> Author: Vernon Yang <yanglincheng@kylinos.cn>
>
> mm: introduce bpf_mthp_ops struct ops
>
> Introducing bpf_mthp_ops enables eBPF programs to register the
> mthp_choose callback function via cgroup-ebpf.
>
> > diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> > index 2949e5acff35..80ec622213df 100644
> > --- a/include/linux/huge_mm.h
> > +++ b/include/linux/huge_mm.h
> [ ... ]
> > @@ -291,6 +292,11 @@ unsigned long thp_vma_allowable_orders(struct vm_a=
rea_struct *vma,
> >                                      enum tva_type type,
> >                                      unsigned long orders)
> >  {
> > +     /* The eBPF-specified orders overrides which order is selected. *=
/
> > +     orders &=3D bpf_mthp_choose(vma->vm_mm, orders);
>
> Does this inadvertently prevent the BPF program from enabling or selectin=
g new
> orders? Since the return value is applied using a bitwise AND, it appears
> restricted to only disabling existing orders rather than customizing them=
 as
> described in the commit message.

Yes, It is restricted to only disabling existing orders.

> > +     if (!orders)
> > +             return 0;
> > +
> >       /*
> >        * Optimization to check if required orders are enabled early. On=
ly
> >        * forced collapse ignores sysfs configs.
> > diff --git a/mm/bpf_huge_memory.c b/mm/bpf_huge_memory.c
> > new file mode 100644
> > index 000000000000..e34e0a35edac
> > --- /dev/null
> > +++ b/mm/bpf_huge_memory.c
> [ ... ]
> > +unsigned long bpf_mthp_choose(struct mm_struct *mm, unsigned long orde=
rs)
> > +{
> > +     struct cgroup *cgrp;
> > +     struct mem_cgroup *memcg;
> > +     struct bpf_mthp_ops *ops;
> > +     int idx;
> > +
> > +     memcg =3D get_mem_cgroup_from_mm(mm);
> > +     if (!memcg)
> > +             return orders;
> > +
> > +     cgrp =3D memcg->css.cgroup;
> > +     ops =3D READ_ONCE(cgrp->mthp_ops);
> > +     if (unlikely(ops)) {
> > +             idx =3D srcu_read_lock(&mthp_bpf_srcu);
> > +             if (ops->mthp_choose)
> > +                     orders =3D ops->mthp_choose(cgrp, orders);
> > +             srcu_read_unlock(&mthp_bpf_srcu, idx);
> > +     }
>
> Could reading cgrp->mthp_ops outside the SRCU critical section lead to a
> use-after-free regression?
>
> If a thread is preempted immediately after ops is read:
>
>     ops =3D READ_ONCE(cgrp->mthp_ops);
>     <preempted>
>
> Another thread could execute bpf_mthp_ops_unreg(), set the pointer to NUL=
L,
> and complete synchronize_srcu(). The original thread would then resume,
> acquire the lock, and dereference the freed ops pointer.

(Report is identical to bot+bpf-ci) Good catch, I will fix that in the
next version. Thanks!

> > +
> > +     mem_cgroup_put(memcg);
> > +
> > +     return orders;
> > +}
> [ ... ]
> > +static int bpf_mthp_ops_reg(void *kdata, struct bpf_link *link)
> > +{
> > +     struct bpf_struct_ops_link *st_link =3D (struct bpf_struct_ops_li=
nk *)link;
> > +     struct bpf_mthp_ops *ops =3D kdata;
> > +     struct cgroup *cgrp =3D st_link->cgroup;
>
> Can this cause a regression if link is passed as NULL? st_link is cast fr=
om
> link, and st_link->cgroup implicitly dereferences it before the validatio=
n
> check below.

(Report is identical to bot+bpf-ci) I will fix that in the next version. Th=
anks!

> Additionally, struct bpf_struct_ops_link is defined privately in
> kernel/bpf/bpf_struct_ops.c and does not contain a cgroup field. Will thi=
s
> cause a compilation failure due to dereferencing an incomplete type and a
> non-existent struct member?

(Report is identical to bot+bpf-ci)

This series is based on linux v7.1-rc1 (26fd6bff2c05) + "mm: BPF OOM"[3]
first four patches.

All of the above definitions are in  "mm: BPF OOM" PATCH#2.

https://lore.kernel.org/linux-mm/20260127024421.494929-3-roman.gushchin@lin=
ux.dev/

> > +     struct cgroup_subsys_state *pos;
> > +
> > +     /* The link is not yet fully initialized, but cgroup should be se=
t */
> > +     if (!link)
> > +             return -EOPNOTSUPP;
> > +
> > +     cgroup_lock();
> > +     css_for_each_descendant_pre(pos, &cgrp->self) {
> > +             struct cgroup *child =3D pos->cgroup;
> > +
> > +             if (READ_ONCE(child->mthp_ops)) {
> > +                     /* TODO
> > +                      * Do not destroy the cgroup hierarchy property.
> > +                      * If an eBPF program already exists in the sub-c=
group,
> > +                      * trigger an error and clear the already set
> > +                      * bpf_mthp_ops data.
> > +                      */
> > +                     continue;
>
> Is it intentional to return 0 at the end of this function when we skip ov=
er
> descendants that already have mthp_ops configured? This appears to leave =
the
> hierarchy in an inconsistent state while userspace assumes the registrati=
on
> was fully successful.

Yes, that is exactly what I will do next.

> Furthermore, is there a missing hook in the cgroup creation path? Since t=
his
> loop only applies to existing descendants, any newly created cgroups will
> have their mthp_ops field initialized to NULL, allowing tasks moved there=
 to
> silently bypass the BPF program attached to their ancestors.

Good catch, I will set WRITE_ONCE(child->mthp_ops, parent->mthp_ops)
during cgroup_create(). Thanks!

> > +             }
> > +             WRITE_ONCE(child->mthp_ops, ops);
> > +     }
> > +     cgroup_unlock();
> > +
> > +     return 0;
> > +}
> > +
> > +static void bpf_mthp_ops_unreg(void *kdata, struct bpf_link *link)
> > +{
> > +     struct bpf_struct_ops_link *st_link =3D (struct bpf_struct_ops_li=
nk *)link;
> > +     struct bpf_mthp_ops *ops =3D kdata;
> > +     struct cgroup *cgrp =3D st_link->cgroup;
>
> Does this code similarly dereference link before it can be validated?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260503165024.15=
26680-1-vernon2gm@gmail.com?part=3D3
