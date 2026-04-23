Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B5D3793B1
	for <sashiko@lists.linux.dev>; Thu, 23 Apr 2026 22:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776984690; cv=none; b=doO95B9d+epsPzZkjVMLZhkR3K6y609Vsr4RGNqu6jQ5I0YeN1Tya3Sr5IbHAj4PQkjg2f7AF+avgEidub1AT0VS4q5jtjTJk+YuRaiTQOuj3JbpOqirKV2NEw0vXDHGXfvbkpJ2mXQ3JJmMLd4fG22u3nrmGMYBhYqJthqYZDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776984690; c=relaxed/simple;
	bh=e9MfDyXwYaJ/aO4M5Cb9Rn2CBNJ/FcZoKFJvLAZtXmQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TNRK8AG/I+MxBbRsIgTmj5a65krFn4+NbxYKshgekjkDCstcxTW1OERU1dezy1zbeV8wwNrxjdJv1seilwni2Upqp0yxPE8q4lEr3QGD5K4Bz4xOvxviQFAG1O3hvLTbZtb8XakjXuiX4jAJ3+bvXIRSr4DbYvQIDM93JnsjIb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MfKZ8Hy+; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MfKZ8Hy+"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35d99bae2ebso6456681a91.3
        for <sashiko@lists.linux.dev>; Thu, 23 Apr 2026 15:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776984687; x=1777589487; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zRWMw5VSTAJILnLr0n8Ol9m5yWC5GJz5TAzV/Evk7Mg=;
        b=MfKZ8Hy+XdgGFiuO9MQq704weWnBFcJPaIC3mvqSP40Dtyso+9THN814DLfDxwefAS
         w2mWXUbmQNNcPix0UhysaJKVMPnc15Aq27RoIcPxWS16AxiVNPWw306YEukRraFhE0mp
         7OVVZfq0Mt9qrQyo8JajpTuqRJ7XV6t6TW3jzfpdR3YNZNVfZwU0u5Ok34nAhK7sWOsC
         ELTHJKZI0eCmvxMTdwP3/DcwXbwVAjg911dcNMsL8hgGkY9LMiwO3kqX2/KmusxSXwQG
         4MQOpdIYN7K1vXWLoZW16wb8AecLN1NR2KCsO9u6LupYwyHPNkQ1RnX/hoe9ZuWd2OCF
         XSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776984687; x=1777589487;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zRWMw5VSTAJILnLr0n8Ol9m5yWC5GJz5TAzV/Evk7Mg=;
        b=fLB2Diuun+TQp4LncgYNKjxAOqcduN8U67gBJbJxxRFrUgeoMdPSKnZc/N9hTW7enN
         JgUXZa+6vkQ3HZkqvqvLt+q+OlEc4fVrZFQ5LH/7pF2p9BtGSzTslpH5fIUXDuOTUvvB
         riqyb24Ck4K1zKiWqVuuN86fXVF3SjJFw20qFAgWta0Nks3osEfrbHvjS9lvdq8CB5Ys
         KyOna7xyafcvSKfkXIX3CWL+RElfa55AqBXzm8r6q2wx9e9vejqq4/Gq+b0R8bFBK3i7
         B7Tf/fXCGqV8N8/K92H0v7XGYUSMYdyDMQPJLg7c1GaA8pSOVusUv5RqadCMu95+YcQy
         O+gQ==
X-Gm-Message-State: AOJu0Yy6hjoYMavfgo4S712SNIkk8oqSOoHC4qyUele0bdL4en6jaTji
	MtdgI40jCpg2SeNqb6+W1L7N7xAybxlfFrITX1O9+9sJcRiYZ5fCsn9FhBgO/E4i
X-Gm-Gg: AeBDieu8oPPr2+d9AKUQxlyucVRvhqc7vVmSa872VxJbL1QHgVJfN4KqKWY002r06Yc
	JRyqaakh3PJZ2ThXF2fHkhsijae88mCL0dJgIkIDa7WjfDGuT65vbX/ezC8BBWz8AD2ASKtDcKa
	vHLH4QvaklwB4KBwAeDdHdtOyXiRpSHrKSlaYNU2VEbgvSism3SiaUv45xWoP/UfpFLv8DtyCUQ
	OZknredb95CeDBP1Fr5VCVtKj5ZicUpg85sGXpzyAG6Ahlj9foxTrF43UAgsJ226N3m69DtzDOZ
	BEy2wtG0K5M0Nik/jmGf5Cg0RZFfL5CMb5ON2Nu6xmi8J6PsbPDDNPYcpsNsu7gm0vmzWn4iSNH
	zusIGcEcouW63miukikro8tnx2qiqJZxAWeJowQ9rVPAe3rAD06PAaw0+dw0JQsYU+dm/iCQt+b
	v0/Mih61JGSCCWaoGUKjZZUHRGmsVc0tmIr/1ehB0s0XCG66nrB3GAwK1+h9Ko7Ok=
X-Received: by 2002:a17:90b:3d0f:b0:35f:b5df:463 with SMTP id 98e67ed59e1d1-36140469b62mr27636560a91.14.1776984687464;
        Thu, 23 Apr 2026 15:51:27 -0700 (PDT)
Received: from [192.168.0.226] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410b998fsm21195718a91.13.2026.04.23.15.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 15:51:27 -0700 (PDT)
Message-ID: <0c47b0b7ea476647746806c46fded4353be885f7.camel@gmail.com>
Subject: Re: [PATCH RFC bpf-next 1/4] bpf: representation and basic
 operations on circular numbers
From: Eduard Zingerman <eddyz87@gmail.com>
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Date: Thu, 23 Apr 2026 15:51:24 -0700
In-Reply-To: <20260421171830.3881BC2BCB5@smtp.kernel.org>
References: <20260421-cnums-everywhere-rfc-v1-v1-1-8f8e98537f48@gmail.com>
	 <20260421171830.3881BC2BCB5@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2026-04-21 at 17:18 +0000, sashiko-bot@kernel.org wrote:

[...]

> > diff --git a/kernel/bpf/cnum_defs.h b/kernel/bpf/cnum_defs.h
> > new file mode 100644
> > index 0000000000000..28dcb79ba6950
> > --- /dev/null
> > +++ b/kernel/bpf/cnum_defs.h
> [ ... ]
> > +#if T =3D=3D 32
> > +#define ut2 u64
> > +#define st2 s64
> > +#define utt u32
> > +#define stt s32
> > +#define EMPTY CNUM32_EMPTY
> > +#elif T =3D=3D 64
> > +#define ut2 unsigned __int128
> > +#define st2 signed __int128
>
> Will the unconditional use of unsigned __int128 and signed __int128 break
> compilation on 32-bit architectures? Since the BPF subsystem and verifier
> are built on 32-bit kernels when CONFIG_BPF_SYSCALL is enabled, this
> might cause widespread build failures.

Forgoing __int128 would require something along the following lines:

  /* *result =3D c*d - a*b, if fits in u32; all operands unsigned */
  static bool check_mul_u32_u32_sub(u32 a, u32 b, u32 c, u32 d, u32 *result=
)
  {
          u64 size =3D (u64)c * d - (u64)a * b;

          if (size > U32_MAX)
                  return false;
          *result =3D size;
          return true;
  }

  /* *result =3D c*d - a*b, if fits in u32; all operands signed */
  static bool check_mul_s32_s32_sub(s32 a, s32 b, s32 c, s32 d, u32 *result=
)
  {
          s64 size =3D (s64)c * d - (s64)a * b;

          if (size > U32_MAX)
                  return false;
          *result =3D size;
          return true;
  }

  /* Return (s128)a * b >> shift */
  static s64 mul_s64_s64_shr(s64 a, s64 b, unsigned int shift)
  {
          return mul_s64_u64_shr(a, abs(b), shift) * (b < 0 ? -1 : 1);
  }

  /* *result =3D c*d - a*b, if fits in u64; all operands unsigned */
  static bool check_mul_u64_u64_sub(u64 a, u64 b, u64 c, u64 d, u64 *result=
)
  {
          u64 cd_hi =3D mul_u64_u64_shr(c, d, 64);
          u64 cd_lo =3D c * d;
          u64 ab_hi =3D mul_u64_u64_shr(a, b, 64);
          u64 ab_lo =3D a * b;
          u64 borrow =3D cd_lo < ab_lo;
          u64 hi =3D cd_hi - ab_hi - borrow;

          if (hi !=3D 0)
                  return false;
          *result =3D cd_lo - ab_lo;
          return true;
  }

  /* *result =3D c*d - a*b, if fits in u64; all operands signed */
  static bool check_mul_s64_s64_sub(s64 a, s64 b, s64 c, s64 d, u64 *result=
)
  {
          s64 cd_hi =3D mul_s64_s64_shr(c, d, 64);
          u64 cd_lo =3D (u64)c * (u64)d;
          s64 ab_hi =3D mul_s64_s64_shr(a, b, 64);
          u64 ab_lo =3D (u64)a * (u64)b;
          u64 borrow =3D cd_lo < ab_lo;
          s64 hi =3D cd_hi - ab_hi - borrow;

          if (hi !=3D 0)
                  return false;
          *result =3D cd_lo - ab_lo;
          return true;
  }

For use in mk_mul_{u,s}. This is on top of the following functions:
- cnum{32,64}_gap
- cnum{32,64}_extend
- cnum{32,64}_bigger
- cnum{32,64}_union
- cnum{32,64}_cut
- cnum{32,64}_mk_mul_{u,s}
- cnum{32,64}_mul_chunk
- cnum{32,64}_mul

Overall +230 lines of non-trivial code.
I did some work to consolidate existing checks in [1], and was unable
to get union, cut and mul_chunk verified for 32-bit and 64-bit domains,
cbmc does not converge to an answer. I'm a bit hesitant regarding
brute-force 8-bit domain verification: there were a few non-trivial
bugs in check_mul because of C implicit cast rules and 8-bit testing
did not reveal them. Looks like a theorem prover is needed indeed.

[1] https://github.com/eddyz87/cnum-verif/tree/consolidated-checks

I tried reinstating the old mul implementation:

  static void scalar_min_max_mul(struct bpf_reg_state *dst_reg,
                                  struct bpf_reg_state *src_reg)
  {
          s64 smin =3D reg_smin(dst_reg);
          s64 smax =3D reg_smax(dst_reg);
          u64 umin =3D reg_umin(dst_reg);
          u64 umax =3D reg_umax(dst_reg);
          s64 tmp_prod[4];
 =20
          if (check_mul_overflow(umax, reg_umax(src_reg), &umax) ||
              check_mul_overflow(umin, reg_umin(src_reg), &umin)) {
                  /* Overflow possible, we know nothing */
                  umin =3D 0;
                  umax =3D U64_MAX;
          }
          if (check_mul_overflow(smin, reg_smin(src_reg), &tmp_prod[0]) ||
              check_mul_overflow(smin, reg_smax(src_reg), &tmp_prod[1]) ||
              check_mul_overflow(smax, reg_smin(src_reg), &tmp_prod[2]) ||
              check_mul_overflow(smax, reg_smax(src_reg), &tmp_prod[3])) {
                  /* Overflow possible, we know nothing */
                  smin =3D S64_MIN;
                  smax =3D S64_MAX;
          } else {
                  smin =3D min_array(tmp_prod, 4);
                  smax =3D max_array(tmp_prod, 4);
          }
 =20
          dst_reg->r64 =3D cnum64_intersect(cnum64_from_urange(umin, umax),
                                          cnum64_from_srange(smin, smax));
  }

As it still handles cases like [+-a, +-b] x [+-b, +-d] reasonably well
for bounded a, b, c, d. As a result:
- no tests failed
- no difference in veristat results.

Therefore, for v2 I'll drop cnum{32,64}_mul completely and defer to
the old code (or move it inside cnum_defs.h to avoid code duplication).


[...]
