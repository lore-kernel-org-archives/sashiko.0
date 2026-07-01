Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AD22561A2
	for <sashiko@lists.linux.dev>; Wed,  1 Jul 2026 03:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782876045; cv=pass; b=ZCHM6PmXfXqtR39anuo8cxCpm1lgfkfpa8L/K93E4tVpMxjo+aktIt2LmJUtR8LmHPZjeccU90zKze7vuhuqnKfQia+uiQE5B6UoQ18tESCo7eP0SPibrqS0vecgUao+fUZoABM2q92tfehs/676nb3pizNs4ytg/F52995dZ98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782876045; c=relaxed/simple;
	bh=RxtcwpztGp0mYEgrZ9qMRhx4+bmsCvWD3JFqEp/tmHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WEFuVvHFxLRFxfrcI18ajT2W+9+xIUGnm0WC+1N+RpFf0J9MKEFEi0bKwdZjWNSG6IBXFB/mwW13gpY4cXTFJtDLZQSj91seyT4NrkdPzi/DiFuF9niDv7IUVhgIDvBcpMHUUaKndaan93cIJTK3fp2LwkVDlzhk9p62AXLJm5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=lqEQLm3l; arc=pass smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="lqEQLm3l"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6a168dc590cso121538eaf.0
        for <sashiko@lists.linux.dev>; Tue, 30 Jun 2026 20:20:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782876042; cv=none;
        d=google.com; s=arc-20260327;
        b=ByXtVIHunip6JRVaK4DHM1HE4bdM0vGW7COra03FkxBTyNn9wWc66Cv8KLhanjTi9Q
         IMZQfVVSBnfmITE1jaCX+x8hNvu4wv5KbAu3Q9Qp4DggRE2qerQMJz1QjdZ7iW2+xHsC
         ecv6Ispx822f8Ct4jX0h1BTYXq7AIK89LGI9xcK4sMjc/oKHWufTpsGb+tiAI10YPtnJ
         eEdCV6HgL41ZTQaoWZzzVdEApqS+ryEyw4uWPJgFPFImlqoW5ACL6LuG2KBNU8z+CGAR
         GaVbwCQXDLo6D+WZbKAPL00wyz3qmdMYeqQWS3d/vrfbFrTeFTrtoZu4DLCmrRmUwbgn
         aTeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2N+msG67XKvItUVY55FS4/emZkqDvzrnsWiB4SJXA5o=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=fXNMumXSsS0X2RWY3PVeBfNtUGWH4rLJIMZxp4k1vAGcFxRTCwdcaT/r1a9474N0zC
         isclE9L/d9mdM7PwlyvKFS8aFq5xZzYA3tXlac9EjVYpF5uIXAVaAoLTmVZJhkMUJBJb
         kbjrGL9MwWmhnPKD7jHIthfNCpUyE8IKDK/TrHizJYStOIh8Udg8ehmidG86GneXtUqv
         nEOwiEXYFBMPYgLmqGEPoaMrXHtwPjNKfdoT467RcBXhq/QRP3qqqp1X1ue8ot4nSdD2
         NTwalkBe33hGIP5KJ2VMPD26ZS6seYulX8s3mk7NZlzW1R7xhYxA25eGqpzPZXp28THX
         fSfw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1782876042; x=1783480842; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2N+msG67XKvItUVY55FS4/emZkqDvzrnsWiB4SJXA5o=;
        b=lqEQLm3loCsfyXeQ4qLab3GQ2ckicIp4Tpc5Lg6F97X2ndPW1AlaZ9LoeAxQXU2F0U
         UAGZOdDJvJIjUul4AioUUze7oxAl3c9dnJ4+18MgugWObl9xaOKzka6SgaZqyvxI1oqZ
         k44MnVoGzrdHXLl2EImQgeotyK/QdRbMzBGetQ5NvmJQBGZuapqqOMSFqftcZlHlDrhp
         TySt79Btb0SoqplKssBd3sX4Ns1hvUDz4dq4N8bHjgWfmzRhdz+rpdXckNX9TW27vX1R
         TwsnrB97XXBi9JJyC7y4ZBt6+2qhgnXesLwDhzejnIK427SuQiSc0UrSQ9uIMdqBcpSg
         eVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782876042; x=1783480842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2N+msG67XKvItUVY55FS4/emZkqDvzrnsWiB4SJXA5o=;
        b=JKy7C3H3vrlIzAtAdM6m2FIxPNoOH+sA5mDdkZUHfj9bsTrG98r2juzEy6/Mk25RqG
         FhgSbxciIW5//HYnWgEEQa8lzIe4J5B4qMlbNo45AdekalXCbk7tHRI3EOqq+2xuThfL
         qIiiHUM3ChC01uHJ35x2y1U21vi3hnvCGEpYuNWC6UhOo+REvTUM5Qgdtuy9dZaoEZXh
         iS253uQ5+4XLTodnxfu9pBK74JomcyD+c8kOSlwd41bEsnklv01X7INR/vJrmVZk9LBf
         y+3Wm8rTycsjcURIGVYa4sbfVXQAcNObMQBB8bfL2avNeDGKc6ximaOWaFTXeFW09Was
         l+lA==
X-Gm-Message-State: AOJu0YxsGMq1zy9rZBrmtRas5qtiuTYO8VwmKBieYbH0lXrsTNJI6Er+
	b8ed3I0iqgrWa8JlEZk6eXT/9+ABXdQ7RJmYQbF05PZ9ij4dJ4q42TUPYDcZA2koTdqqyUXrITh
	u9n4sgHDGYI58vATyrCKTZRat+m3fruDPrOxOusD5UvuP1LhsgszhoAvHvg==
X-Gm-Gg: AfdE7cmM/HmUfbc7yoygHXbxXc3UJNHkSTCPKntC5waWFWqGb3wlKuT68o+CLKslJY7
	2fYEJ6lZ8cOYh5XFgZRV2k9of5AX2ZEp+NuIqAQ1OSf8vrAey+htfKFYEonpkwefS/KT5ySH2cf
	oxrl6tfTiZ3GoM0QTq2v4HvGvSKHus5KqnkJ0C3uXGCnwgCfLz+muxctQw0BhlkcKVNcf+gMHUO
	hBPq27k0NytiXC4XDF7CMSgXtjTVUbm8BhUEQAaaXx+myDvjJH3zHUhvmcoK9/8QMWEogAKUt8=
X-Received: by 2002:a05:6808:191f:b0:496:7ba:89b7 with SMTP id
 5614622812f47-49607ba95b6mr657735b6e.6.1782876041837; Tue, 30 Jun 2026
 20:20:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260505062026.91724-3-cuiyunhui@bytedance.com> <20260505072635.27923C2BCB4@smtp.kernel.org>
In-Reply-To: <20260505072635.27923C2BCB4@smtp.kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 1 Jul 2026 11:20:30 +0800
X-Gm-Features: AVVi8CcoFpqxF5PhV14dTdaZbZMkY9ne_n8LdC7VwoKZ_u2i4GWjbagj4k94u-I
Message-ID: <CAEEQ3w=KmjNTn5NwyoU8DX8hkB74PiTyp=vNKnG_1P1WVCekrA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v4 2/3] riscv: introduce percpu.h into include/asm
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi sashiko,

On Tue, May 5, 2026 at 3:26=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [Critical] The 8-bit and 16-bit `this_cpu_add` fallback logic fails to =
mask arithmetic overflow, corrupting adjacent percpu variables.
> - [High] The 32-bit and 64-bit `this_cpu_and` macros incorrectly perform =
an AND-NOT operation instead of a bitwise AND.
> - [High] Missing early-clobber modifiers (`=3D&r`) on output operands in =
`PERCPU_8_16_RET_OP` allow destructive register overlapping.
> --
>
> commit f4a490dc0b24e17cbd874e03d02e506d017e61b6
> Author: Yunhui Cui <cuiyunhui@bytedance.com>
>
> riscv: introduce percpu.h into include/asm
>
> This commit introduces a RISC-V percpu header to implement direct this_cp=
u
> operations. It provides macros for 8, 16, 32, and 64-bit read, write, and
> atomic memory operations.
>
> > diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/p=
ercpu.h
> > new file mode 100644
> > index 0000000000000..3b26fe45e70f4
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/percpu.h
>
> [ ... ]
>
> > +#define PERCPU_8_16_OP(name, amo_insn, sz, sfx, val_type, new_val_expr=
, asm_op)                      \
> > +static inline void __percpu_##name##_amo_case_##sz(void *ptr, unsigned=
 long val)             \
> > +{                                                                     =
                       \
> > +     if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&                        =
                       \
> > +             riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {     =
                       \
> > +             asm volatile ("amo" #amo_insn #sfx " zero, %[val], %[ptr]=
"                      \
> > +                     : [ptr] "+A"(*(val_type *)ptr)                   =
                       \
> > +                     : [val] "r"((val_type)((new_val_expr) & PERCPU_8_=
16_GET_MASK(sz)))      \
> > +                     : "memory");                                     =
                       \
> > +     } else {                                                         =
                       \
> > +             u32 *ptr32 =3D PERCPU_8_16_GET_PTR32(ptr);               =
                         \
> > +             const unsigned long shift =3D PERCPU_8_16_GET_SHIFT(ptr);=
                         \
> > +             const u32 mask =3D PERCPU_8_16_GET_MASK(sz) << shift;    =
                         \
> > +             const val_type val_trunc =3D (val_type)((new_val_expr)   =
                         \
> > +                                        & PERCPU_8_16_GET_MASK(sz));  =
                       \
> > +             u32 retx, rc;                                            =
                       \
> > +             val_type new_val_type;                                   =
                       \
> > +                                                                      =
                       \
> > +             asm volatile (                                           =
                       \
> > +                     "0: lr.w %0, %2\n"                               =
                       \
> > +                     "and %3, %0, %4\n"                               =
                       \
> > +                     "srl %3, %3, %5\n"                               =
                       \
> > +                     #asm_op " %3, %3, %6\n"                          =
                       \
>
> Is it possible for an 8-bit or 16-bit addition to overflow here? If there=
 are
> carry bits outside the subword boundary, they aren't masked out before th=
e
> result is shifted left.
>
> Could this silent overflow spill into and corrupt adjacent per-CPU variab=
les?

Thanks, will fix this in the next version.

>
> > +                     "sll %3, %3, %5\n"                               =
                       \
> > +                     "and %1, %0, %7\n"                               =
                       \
> > +                     "or %1, %1, %3\n"                                =
                       \
> > +                     "sc.w %1, %1, %2\n"                              =
                       \
> > +                     "bnez %1, 0b\n"                                  =
                       \
> > +                     : "=3D&r"(retx), "=3D&r"(rc), "+A"(*ptr32), "=3D&=
r"(new_val_type)             \
> > +                     : "r"(mask), "r"(shift), "r"(val_trunc), "r"(~mas=
k)                     \
> > +                     : "memory");                                     =
                       \
> > +             }                                                        =
                       \
> > +}
>
> [ ... ]
>
> > +#define PERCPU_8_16_RET_OP(name, amo_insn, sz, sfx, val_type, new_val_=
expr)                  \
> > +static inline val_type __percpu_##name##_return_amo_case_##sz(void *pt=
r, unsigned long val)  \
> > +{                                                                     =
                       \
> > +     if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&                        =
                       \
> > +             riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {     =
                       \
>
> [ ... ]
>
> > +     } else {                                                         =
                       \
> > +             u32 *ptr32 =3D PERCPU_8_16_GET_PTR32(ptr);               =
                         \
> > +             const unsigned long shift =3D PERCPU_8_16_GET_SHIFT(ptr);=
                         \
> > +             const u32 mask =3D (PERCPU_8_16_GET_MASK(sz) << shift);  =
                         \
> > +             const u32 inv_mask =3D ~mask;                            =
                         \
> > +             const val_type val_trunc =3D (val_type)((new_val_expr)   =
                         \
> > +                                        & PERCPU_8_16_GET_MASK(sz));  =
                       \
> > +             u32 old, new, tmp;                                       =
                       \
> > +                                                                      =
                       \
> > +             asm volatile (                                           =
                       \
> > +                     "0: lr.w %0, %3\n"                               =
                       \
> > +                     "and %1, %0, %4\n"                               =
                       \
> > +                     "srl %1, %1, %5\n"                               =
                       \
> > +                     "add %1, %1, %6\n"                               =
                       \
> > +                     "and %1, %1, %7\n"                               =
                       \
> > +                     "sll %1, %1, %5\n"                               =
                       \
> > +                     "and %2, %0, %8\n"                               =
                       \
> > +                     "or %2, %2, %1\n"                                =
                       \
> > +                     "sc.w %2, %2, %3\n"                              =
                       \
> > +                     "bnez %2, 0b\n"                                  =
                       \
> > +                     : "=3Dr"(old), "=3Dr"(tmp), "=3D&r"(new), "+A"(*p=
tr32)                        \
>
> Should the old and tmp output operands use the early-clobber modifier (=
=3D&r)?
>
> Since they are written to early in the instruction sequence before inputs
> like mask (%4), shift (%5), or val_trunc (%6) are consumed, could the com=
piler
> allocate them to the same physical registers, leading to clobbered inputs=
?
>
> > +                     : "r"(mask), "r"(shift), "r"(val_trunc), "r"(PERC=
PU_8_16_GET_MASK(sz)), \
> > +                     "r"(inv_mask)                                    =
                       \
> > +                     : "memory");                                     =
                       \
> > +             return (val_type)(tmp >> shift);                         =
                       \
> > +     }                                                                =
                       \
> > +}
>
> [ ... ]
>
> > +#define this_cpu_and_1(pcp, val)     _pcp_protect(__percpu_andnot_amo_=
case_8, pcp, ~(val))
> > +#define this_cpu_and_2(pcp, val)     _pcp_protect(__percpu_andnot_amo_=
case_16, pcp, ~(val))
> > +#define this_cpu_and_4(pcp, val)     _pcp_protect(__percpu_andnot_amo_=
case_32, pcp, ~(val))
> > +
> > +#ifdef CONFIG_64BIT
> > +#define this_cpu_and_8(pcp, val)     _pcp_protect(__percpu_andnot_amo_=
case_64, pcp, ~(val))
> > +#endif
>
> Since the underlying __percpu_andnot_amo_case_32 and 64 macros directly u=
se the
> amoand instruction on the value passed, does negating val here with ~(val=
)
> cause the hardware to perform an AND-NOT operation (pcp &=3D ~val) instea=
d of a
> bitwise AND (pcp &=3D val)?
>
> > +
> > +#define this_cpu_or_1(pcp, val)      _pcp_protect(__percpu_or_amo_case=
_8, pcp, val)
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260505062026.91=
724-1-cuiyunhui@bytedance.com?part=3D2

Thanks,
Yunhui
