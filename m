Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916EF31E844
	for <sashiko@lists.linux.dev>; Sat, 18 Apr 2026 20:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776544526; cv=pass; b=hxbNIdfPJuaMyqG/dIXgLtqkngNPALW8UJ4Hhr5ykwO4gFRLhHRAF6uu4zdaF3fr282S48xlsZz/Kh6ngCMSR5fsK6dLGSp5oybdAIY1Fhee2qKelJQUNW2B4it2DWCkOk05xY1DFz5nxO8LMjVraKVaug+bJs8ASLI1USy7I6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776544526; c=relaxed/simple;
	bh=ddY40nerMOGiy2obCVU74bBWLOYhBAtp8dWA0lZJlCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qmjR7Qe810/FOfMDSZ9fKZjQmda+Q9P9TtciL4FgXmalnhWY9Tx2GMVQ5Ab10ftY1dQIlSiiIAt6uTGYijJBNYNX8wrdPZWmsondo7e2stgnL9h6r4hw4izM9Mi5ufXWYimYHxwKc9z8uD0XU+2DeDx1QVJD66G2/USdkGI50UU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glF31wY0; arc=pass smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glF31wY0"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-43d75312379so1735368f8f.1
        for <sashiko@lists.linux.dev>; Sat, 18 Apr 2026 13:35:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776544524; cv=none;
        d=google.com; s=arc-20240605;
        b=TtkL5MttDUIfxbCRS+pizJQ3ThYN2YOBLFfa8I7oIr10HpIyy9ijS2933ftxIABYxY
         ge9aaVgt38c3pK6x1G2W9ABygVC3dFIRAQkTTUlMqt0MDeLnI4wypBXFSx1S62BrJJf0
         xHiATxEW1I0qT8kCa3S2DAmUkMbTIntlJ/c+zw0sVPiHOUvxkaQ7ZIK1fnNiuuTRAUVZ
         AZW6fv2AmsnnDsK3j1EqVl240Lzw7LSdGFm0eYjqUxmVi61Bdwycj3MwXCedT1EcszXP
         1k+upVmGGEszLLalTI7IExr0x2xMNJ9gpxrJPAAsckSdqa27r9r/1F2alzOPSKZpqZFr
         cyEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gA6/qC3I22utPvICxA7yoeIbXFjRb2Lz3SXP6oyKczQ=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=Y3oUK9m2+GtZ7yQJPnnpngg+8VufVhfQAYBzzF0U4Z2sGr+NdUdsVvtn7pSsh0XlOI
         BkQbdt8qX6vI/s8D067/jTNCjSuPxvXR6IztprDRlGHPjnKF/EsMwTmYEm9uxJHsZYSf
         YOSGtJqnEsPz2vVWE6B02RupBzIbKzePZvUCoFI7dKJnvKJszbs+8cWh8m6upC8tDYvF
         r7ZbrVZxcxZ4vZFZyEb1mxPZdxDC1gmyhMvlV8WTQn61zNSyQSignpcWtShUaTAZz7yv
         2n7Jm0IRSFSgIqP+lQtVTZ+Kv57+mSnt2sQH56zUVlbh//OkqQTilYeLQnU414BGqM+j
         z/rQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776544524; x=1777149324; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gA6/qC3I22utPvICxA7yoeIbXFjRb2Lz3SXP6oyKczQ=;
        b=glF31wY0jsI97n1XGwAEBEER/qV1BN1Z9pESSTOuoZ9UEnYvf2E7t/tXqfO0RyG+2S
         DKG5FmpOXYoQhfqT2SpN0BnFjP+oz+orV3XBkMsSZPPJctLsCdWDRunEcAvrRFZ+F7EY
         uG2BTiSUX09Q6AlGEG3WEkIH9ORE1t3nZx3YeUrTJyTA5oLlFvEAPki/6CRslVCSSZPh
         ANfZfm8h1UDRZSKYfVTIeRHppRpKmGtDxkukv5Svf20DAt8+O83FuEEvPlNPZUfQYFch
         Fn06FSQ5jYRjlrONHXKdsioOSEKIoq2A8u/pKAxJJ8q18wr0YAjfG4tjY0KC9jUEYkAp
         b5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776544524; x=1777149324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gA6/qC3I22utPvICxA7yoeIbXFjRb2Lz3SXP6oyKczQ=;
        b=CmodCIOKBNi7E2e/kPu1Mhbt6DdhoynxhKXjrgan9X0XqN9NUstEbmt3uJg0NQgPpX
         RDRZBUS6TwLmOZ8k0hCnQKxOVLfLgxlgnyHHRC+Bbm19mJmEySM+Acyp7PkVV7+/LO+/
         HR8mBhqOMd9bSvjAs0/uA/chjwKsWvfE/9lPCnXa4xRBdCF24YAt78umevzGDRPCntck
         +JvBpNC1PMDboMZu9OCjGT+sqMK4M+70Wnlk7xCOLJZIATBluA/hU4+ISzceb2vwD64H
         FYaHhMyUL0rlTjT7TtoYYBVm5FxnZlZHl2KoNplDNqIem4LnEokGiaNnEhMTm0pNW8aG
         kknw==
X-Gm-Message-State: AOJu0YzdE+p1guymFgX8vjb4iaVxvWl9GzhXVcwQEXXHl8aXWyKKNo/f
	ha0XXnwwB8gLbV1Kthtdjo4khMkvzkYq7rp0V65Y/KYy6pdc4K2rVycNbbPD/STBNQgE6ZFnT6G
	YYXAG+vGuhqAz4F9JufLH6MQjzvMa62HQSCdViEkg3yGJ
X-Gm-Gg: AeBDieu6lSY0thwp6Ib7vB0oC5LbDwD5sDol1rGh7OZe54oA5Gt/ymWOZp+p7J9elDm
	4F8+BagfLHmI3fUaibBU21u9n3TZ4N0SiGpdX1eZ1dEwKFC76UNxUUOEWNQaSB2NEisA7x8NuTg
	p51fQTfmRe9dMEMw4G++t0Ib0IWeU7x3WgPx9+emWHT7JRWu2tbYWs3gT2WROp/pa2hZbn5dl9X
	4H7wRfkAMAlCKqqMMQG/YD6T7e2YhdJDCJ2HSVfnVYuFWLZ4/Jf5DCff6U8O3NlNn6ygabe+TNo
	Gjxcp9KeoXjp+6opYnoD16urCnQ4V6iBah1cdrH8amI3ZghHQJ6v/2KOPVBCL/Un/w3uuV33o/U
	x8fvdPtd47lchPcREIx4E0K8gyP5guW8TKRVJTzxzOCa/+0oYl9Y=
X-Received: by 2002:a5d:64e5:0:b0:43d:7606:5a47 with SMTP id
 ffacd0b85a97d-43fe3f358a5mr11579550f8f.2.1776544523619; Sat, 18 Apr 2026
 13:35:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260418171701.610025-3-memxor@gmail.com> <20260418180642.14D95C19424@smtp.kernel.org>
In-Reply-To: <20260418180642.14D95C19424@smtp.kernel.org>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Sat, 18 Apr 2026 21:34:45 +0100
X-Gm-Features: AQROBzBJQZijfK8thBE_ks-0Wf_4ARb0VikANfnwPf_KRKEL7Stt8g5mV5ir04U
Message-ID: <CAP01T76Z7oBJ2TyUOPqaKZnJogqYhrdZDMwi_q1N8-woaauz=g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/4] bpf: Introduce __bpf_kfunc_mark_deprecated
 annotation
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 18 Apr 2026 at 19:06, <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 1 potential issue(s):
> - [Medium] Programs loaded without BTF will silently bypass deprecation w=
arnings.
> --
>
> commit 90e501a1948d112dbb3b96a16249f1f76f84b290
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> bpf: Introduce __bpf_kfunc_mark_deprecated annotation
>
> This commit introduces the __bpf_kfunc_mark_deprecated macro to annotate
> deprecated kfuncs with a replacement. It applies this annotation to exist=
ing
> impl-suffixed kfuncs and modifies the verifier to emit warnings when thes=
e
> deprecated kfuncs are used.
>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
>
> [ ... ]
>
> > @@ -12987,6 +12987,45 @@ static int check_return_code(struct bpf_verifi=
er_env *env, int regno, const char
> >  static int process_bpf_exit_full(struct bpf_verifier_env *env,
> >                                bool *do_print_state, bool exception_exi=
t);
> >
> > +static void warn_for_deprecated_kfuncs(struct bpf_verifier_env *env,
> > +                                    struct bpf_kfunc_call_arg_meta *me=
ta,
> > +                                    int insn_idx, s16 offset)
> > +{
> > +     const struct bpf_line_info *linfo;
> > +     const char *replacement;
> > +     const struct btf_type *t;
> > +     struct bpf_kfunc_desc *desc;
> > +     const char *file;
> > +     int line_num;
> > +
> > +     if (!env->prog->aux->btf)
> > +             return;
>
> Will programs loaded without BTF silently bypass the deprecation warning?
>
> The kfunc deprecation tags are stored in the kernel or module BTF
> (meta->btf), not the program's BTF.
>
> If we return early here, we skip evaluating the tag entirely. There is a
> fallback branch below that handles missing line info which could be used =
to
> emit the warning even if the program doesn't have BTF.

Programs not using BTF are legacy, it is better to just ignore them.
Program BTF is needed for bpf_get_linfo_file_line().

>
> > +
> > +     t =3D btf_type_by_id(meta->btf, meta->func_id);
> > +     replacement =3D btf_find_decl_tag_value(meta->btf, t, -1, BPF_KFU=
NC_DECL_TAG_DEPRECATED);
>
> [ ... ]
>
> > +     linfo =3D bpf_find_linfo(env->prog, insn_idx);
> > +     if (linfo) {
> > +             bpf_get_linfo_file_line(env->prog->aux->btf, linfo, &file=
, NULL, &line_num);
> > +             warn(env, "%s:%d (insn #%d) uses deprecated kfunc %s(), w=
hich will be removed.\n",
> > +                  file, line_num, insn_idx, meta->func_name);
> > +     } else {
> > +             warn(env, "(insn #%d) uses deprecated kfunc %s(), which w=
ill be removed.\n",
> > +                  insn_idx, meta->func_name);
> > +     }
> > +
> > +     warn(env, "Switch to kfunc %s() instead.\n", replacement);
> > +     warn(env, "For older kernels, choose the correct kfunc using bpf_=
ksym_exists().\n");
> > +
> > +     desc->warned_deprecated =3D true;
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260418171701.61=
0025-1-memxor@gmail.com?part=3D2
