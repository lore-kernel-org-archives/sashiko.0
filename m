Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F0239EF27
	for <sashiko@lists.linux.dev>; Thu,  7 May 2026 12:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158549; cv=pass; b=DDjFUL3xcbR8JCfTRwiC2ecQA09cUsR0DLZrSLMMhfebGygxsP0Pk7FWemTXXNOfX0S6wrsMdYoBTov84ssOYNFi48IJhT+Gmlj0HCP93W0oTHFzFNOC5nsj0sWBkzV5I75EpME8Usqg111ZUS/EUsczcCJgbb3jtdILFFl65iI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158549; c=relaxed/simple;
	bh=4X6FHQLnWfxk2g//RhR5g1H/TpYP7f0F2v3qSNZn3ss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WhJf6I+Q4cCGVG7nvHMyV1QZgOt4ZgH13u1q9CG/DPODP4CAqEN643RdWsKxOugUeSamWViOAwGdRKtwPoIpuTBGpmEBGEZMhsd8PFZtLyPnD7jwBIsbc51yVmGxFNZStiMfx9t7uYbIStez08GEf14Wowia7mHfo6F5urufhIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rfyi6y+p; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rfyi6y+p"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7bdaa68cf81so7272237b3.3
        for <sashiko@lists.linux.dev>; Thu, 07 May 2026 05:55:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778158547; cv=none;
        d=google.com; s=arc-20240605;
        b=TE/mz7y5Q33/T9xnA8NBNkJ1Vdga5PVpjG4sBDhrt7cGT694/bmwBXjKEwlGfZ7FYr
         FmRhAr/9yOV0jqAB/vWPbaIlW7Wd1/Knz7xcIrxWqUZKZX+dPpxt6dUcASTkH59+jHdC
         n/AGdCbwrT42i7ZejmtM+G2an7MMbdEx23NdwecVoPrz3gTZcF0yoZocaAiFkWkLm24T
         RBFDIXbqq1VZxuQcg5uSrxNOEBzVVzzQUUoCbaG/f3+sk63CkOmo0EdjoRp7dyFlxfia
         ex1FVgqYlb9mAQugT+C0n862sGnMj8u0n46PoLmsxLhC9yRolyY7cLSxiz7nXiqhCNtt
         QV0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p3xGu5RBGL9IoizFlhBR8QgmO552FaQukua12pxcpWQ=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=DGDBDywMeJeJ3KuA3AeP0j3cs2GLaOsklFF6HM2VQg7udBcwjaYd1N3Hs/Gf3C0fJW
         uRAgRXrHoFCqYJmLkWSi3/lwpPJ80ngkKzKzF/nt9RvQ8EsEAn9ffIBCtYOxpbBPSKqn
         +CATQnLrbRhA0/tOs/6iGr6MKcWXqPdvJpL0bJCxEiDX1pPHY1TZx8muClPbwvgxOPJd
         jOR2tYjGyY+YqxjAKN0sJei49xyyMt7BI+WChadOrRj+Mr6rUQTGTjAt4ZQ6Qxfpm6Lj
         MKZcELvcezFOPE5lzIvcCixje+19sE4LV8U93iZKuAZkkVbSORPFc+rCumJxTVRN/9gn
         OrsQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778158547; x=1778763347; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3xGu5RBGL9IoizFlhBR8QgmO552FaQukua12pxcpWQ=;
        b=Rfyi6y+pKG6cOBKeHg7L1owVBYfsUkfdiXHGMMrURvwhB+3v67928f8COoNZNna2fZ
         RuaV2vMFQw271LEwCY3gPx/OVLK6vK58GAY9KxMSal5/r8nfKYucbZa9ZyZntZLZiEnX
         s3aQh9TRuFV5DYNLq0PqJfZntAv/GXUjt8PieR9UodE168YKaaqKlAw88/3+9stWUgJJ
         5PJArFM9aRrZ2XusUKaOjGzmAm87dsmoZq6P+DXdt8V0P3V7aeFurP6ueiaVNPB1toJ2
         g2rXVL9ERT7PLqDTHYwZh2xW8ueASpkdgXOaKNh5B9BSPgn9kHqpp4Fq9Al0fviBWWSe
         N4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778158547; x=1778763347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p3xGu5RBGL9IoizFlhBR8QgmO552FaQukua12pxcpWQ=;
        b=KOoyP55ZNrP6kFF2U727A+RZdXh/DHR0Ku7vw7mhMqLp9LBpI7XuPEAqwoWqpItbtF
         FN9wOLZK5EHNFOFjq/JyrOu5GVM+tf/6Jyl7BRvYMBTEd7QYutxMZfo3oDBkXlybcgGT
         KTHX8SV4ZsXhIFb3AAi2fRY+4rv5WYmIR05wkopaHLBjE6SnNLsvZ5tRJ/0ubZIceXe/
         /BGFjXms8hmhWkOYDAL/5iezn+oWTuRu5V/Ph51O7CAPxFPDywJoKaizgJdgxAn5S2AS
         OpPebxTprj3vxkXHT987GdioX2rO2dJJCMX0W+vbKVUDaGjdDrHiPTazP6zUBrjZzbpp
         1n6g==
X-Gm-Message-State: AOJu0YyoTt/xJTyvSC/sgZvBaRgm6bfkab/PR28Ekth54PC3skeRXxBA
	KhNCRZjgp34wJh+JhNnjxU2eMkX1EqseAdQREXpo3ej6Nb2W5Z68vS1Cw2E++BVzdqZG6KuyTax
	8ZV3cvK7OHrL7Fq/URTYawXavTn8C/aSCuFXapgg=
X-Gm-Gg: Acq92OG2WlQJRber5NDK8OQLC+HcSPxQKOpZE72wjKMLvSU8fQS6ODecL77Xj8In3UC
	C1OghhEPavQC9y9ba09/FEKJteRc1NfOIV5MR9MTUx6i7EmD/3RgKjrU6f7vlZZ4soJQiGCEb+r
	mRzBeWJHLh9LwC9ATSI109TgHPBnGP/0UnXz/wmwv0wiVi+yPYh+f+D4fr/6H5eDE2Yzi2FW3a0
	x8JSgvUV2o0LRLtrgvihQZpt2dzKSk4FsZbGFb3C2HIzbkexRKzTY5xA1CF44OPtekC87QnbZMR
	dLfZspqA70j5uax8c6Q=
X-Received: by 2002:a05:690c:6101:b0:7bd:95d1:ed51 with SMTP id
 00721157ae682-7bdf5e9bf09mr83497147b3.28.1778158547307; Thu, 07 May 2026
 05:55:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260506142709.2298255-8-ameryhung@gmail.com> <20260506224833.71FC4C2BCB0@smtp.kernel.org>
In-Reply-To: <20260506224833.71FC4C2BCB0@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Thu, 7 May 2026 14:55:35 +0200
X-Gm-Features: AVHnY4LhQWpxqATck-XP8OifpQI6HAh1GPN_0ZQbGDq937QCrpiD455I4L60OU0
Message-ID: <CAMB2axNQ+W7OUa8vkuedT7hGebn0TS=-aA9FJd+ZvsFCWE1+sQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 07/12] bpf: Unify referenced object tracking
 in verifier
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 11:48=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> >               }
> >               /* Track parent's id if the parent is a referenced object=
 */
> > +             if (ref_obj && ref_obj->ref_obj_id) {
> > +                     if (ref_obj->cnt > 1) {
> > +                             verifier_bug(env, "function expects only =
one referenced object but got %d\n", ref_obj->cnt);
> > +                             return -EFAULT;
> > +                     }
> > +                     parent_id =3D ref_obj->id;
> > +             }
>
> Since ref_obj->cnt is determined by the number of referenced arguments
> provided by the BPF program, is it possible for a user to intentionally
> trigger this verifier_bug() by passing multiple referenced objects?
>
> Since verifier_bug() expands to BPF_WARN_ONCE(), triggering a warning
> via unprivileged or user-controlled input could be problematic if
> panic_on_warn is enabled.
>
> Would it be safer to gracefully reject the program using verbose() and
> returning -EINVAL, similar to how it is handled for release kfuncs earlie=
r
> in this patch?

Ack. Will change to verbsoe().

>
> This same pattern appears in a few other places introduced by this patch:
