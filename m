Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6082139E9DD
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 12:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778589344; cv=pass; b=Q/315o2A8HRjsHV/mC0iqxt+NKlhxwoC54frqZZbJWBa4PyY6vbDBtR83+oqV6wzqAOfbEZiV46r+/2htNAqF6mTITCo2L3IARpjyVPeLXrBwBoDo+XbItK29+trt+szwsbBfcMs6w50O07GcB6ihIKqxb8sM5H2CK4mXrTw8c4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778589344; c=relaxed/simple;
	bh=zmP1rFX6qc3fWMYwls1hzVQH7Xwp2zzFxeWDcYKJoJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BZCo7maM0LOiK74goGn/y52Jii7kZcil0lw8xLfN3oyeh78/kgk3FQdOKDrOWb6h062SpLX6fN1OyxcvGKlQJwwuVR5dGxDZl411yxXlRKswqiIIEMC1n4Q+WnCd0cz2fLYzyWfTAa6bb1v0l84qXwRGvledh0YblkDjIuXAtFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PaxvtUdr; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PaxvtUdr"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-448528f4e69so3258776f8f.3
        for <sashiko@lists.linux.dev>; Tue, 12 May 2026 05:35:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778589326; cv=none;
        d=google.com; s=arc-20240605;
        b=VUi7a0qbKG75SAWc6x2QXHFo4M4NqnVNZE3XV4VJp6PBB3vlb4syTggEUsHoa6oQlk
         NEZx2Co3YJQ217uZQIgbVUl56H+028n1TJCFA3Pke6YiRabWxHTeIOh9LbdYB6gRsy7O
         Snr0fLd4hRANEGs26yp/Q1qC64uS3ZztxHtNqYV53A+ZHgluIj41vdHYcBFeTbTLD2Dj
         oPdF+ufgzR3xrqGL+s5//z0xHYpvsAiqs3EMKIl6JaRQ5UExWCe5FlD/d25twh1HA3Dh
         k1NQT0SnpvgLlRKOoa2ncuzq7aSSu79fwUBZ0YNu+4efEfpPyPu1cVTgnIqjZqUblA9D
         B6YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zoj54LTJUq55xyS7TD5R4Dc+Opd/luBrG056DdUpw1A=;
        fh=1fTFRV/ZfumOq5o+zS71Juec+XsQgpIGtZ9Q/sQM5XE=;
        b=LTQsV+4oMq+R7Gu9/L5z+b+AeyXGpt33F98lSJT5NYFiC4tKa8D5knoGM/vFjGd3/l
         jZ0skHH+NZO6CdAGFUM+1cdXvqGsHNl6D6j94dzXaENKyMe00qoPI9y+jPRhojJAtWMn
         ngPfyFQhv38IR7Xs6u70O3gsjjcP/mllRAqP50h45CL+KOV0wBN2NG+HXmsMxilFhoH8
         lwm0BIqTfG14Ql2MvIDAyFCsYHNZ+6fFETETQEmKA1SN2UAXaGVciv8Rgb5EXiy4cDue
         DHlu2HIwXSVOSBoQpaXNnYRgSoVjiNuaKD3/Ebi7EicO/REEQR2FsCAUkzzPNBr6owLt
         DB/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778589326; x=1779194126; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zoj54LTJUq55xyS7TD5R4Dc+Opd/luBrG056DdUpw1A=;
        b=PaxvtUdrrOW9A65+o1tccEDR6cHVH3zrw18u8rR9aTPXRDPuNpIeNpesdbWhmG/sBi
         FZ3iGVhs5+mTyxVuVmmsoKmLi1ue8/ZUzi+6XMhi27pdnbTgS7GlkhiXhfEHb2X01sBM
         PsjS8hGkX2+3gmjemKi7WenjV5WrJxgO2GaODs0mYlmSXHmlqQrimNyY7BSGtR/vAsdT
         EYc8PGBdMoHh237LYyg3kzC48RVgaZMBjdsQFhcRdh2mgJeRZT5YPLdNJxQdFjPV1EpI
         gTPpFcnVEUluiiFkn1/X8WDYiX7bRcXppw/o0FUI90y4Rvpp+yL+Lj6QfUI9PncWjR3z
         yEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778589326; x=1779194126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zoj54LTJUq55xyS7TD5R4Dc+Opd/luBrG056DdUpw1A=;
        b=X+5umhUdeMYaCyrjkOOL4x6o+UgExZAgP+zwA0mBkWvDofq7I8Z7t3FHjLmZbKRuDW
         If1VS4dl1EhzY51WBTEWPBvU1YP57Vep37G+dOpVH2xcEgvV8WPS3PVjqyPhoYi9dA9p
         xbMWWL+GhTKdXyJCbhT02C+fKM2xdHgJQP1WxVABTspYqVJKATkj+nhC6qApsH2ZOQ5g
         la5gvzWrqlTyy0odpjGxhsyNkRXFK96VmTdNpWAvwdOYNf+weBWtSNh/WBjvNN3Z1bBV
         hHmjeMz5bs5c1Toxvso91LLRHfD9rEkE3Tt0iV93YnQB2K9jBjqZLRc85ixJ0LS7XFdB
         VPnw==
X-Gm-Message-State: AOJu0YwdWZSsRBUfHzA7mx9lh6RvWUHTxhv0z/POSQOIFECKqYNuGEPZ
	+JZ/zh7H1LYpCTaPaB4d5wdF1wPYAYcvq1ft57jdWl4ImaNzaL+acV0dSZ0/boVLhBCWXLN0bwc
	QXhLVzvHdX5QyYG297UQM3hya8cIL0R2A+b2/f7w=
X-Gm-Gg: Acq92OFq+v+mVrT5TdL3W2Tpyq8kpibUq11EhqfPDNJLkdv4zQDpS6hIvaxIZiPfsNE
	92nMkv59kYVe43OEgaLFEWjYmhY8cuNVBTsk7LE3GvrYfXwentIxSjn/jiEVGQP+xluUaJMDa8U
	SQVwZue+OL3AgVEvMMdqx+oghdZqxCoEx1/T6WCSZu+JX6wJ8CW9W9EA8FQJouxtqLpWxon7I4c
	v31ZlgtH+MPWpRz/gFTeX6XXu5/zD7wYYnXfMjjxtGirt1hA2Jq4I5OCkTS7nRuzUjG/eg9Ew7W
	Gh6+Fz9fcdRBzgbBtMV42bVIaCc23PGkQqLe31n7JXsm5yfFIwPNc4Zz+bQAqC0hTgFMyA==
X-Received: by 2002:a05:6000:268a:b0:43d:7a97:78b5 with SMTP id
 ffacd0b85a97d-454633e9851mr28949302f8f.33.1778589325997; Tue, 12 May 2026
 05:35:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260508111744.771659-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260508202233.47B7DC2BCB0@smtp.kernel.org>
In-Reply-To: <20260508202233.47B7DC2BCB0@smtp.kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 12 May 2026 13:34:59 +0100
X-Gm-Features: AVHnY4KcjeUlz5_VrrYuyeAhSs9sgkTFkN7i4yolbWX6Jfpg-kNjrphJi5Tlddk
Message-ID: <CA+V-a8sw3uG-6+h1v+fJweR5SqF=aS9GjQqn2CajQEKyn8CxTA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: renesas,rzg2l-du: Add RZ/T2H
 and RZ/N2H support
To: sashiko@lists.linux.dev
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 9:22=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The conditional constraints for renesas,r9a09g077-du fail to expl=
icitly disallow port@1, permitting invalid device trees to silently pass va=
lidation.
> --
>
> commit cd9bf5724c5d57e0dd67fd27e0187153179b0578
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> dt-bindings: display: renesas,rzg2l-du: Add RZ/T2H and RZ/N2H support
>
> This commit documents the Display Unit (DU) support for the RZ/T2H and RZ=
/N2H
> SoCs. It adds new compatible strings and updates the allOf constraints to
> handle the SoCs' specific register differences and lack of reset control.
>
> > diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du=
.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > index 2cc66dcef870a..18776ac9e7c7e 100644
> > --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> [ ... ]
> > @@ -95,7 +98,9 @@ allOf:
> >        properties:
> >          compatible:
> >            contains:
> > -            const: renesas,r9a07g043u-du
> > +            enum:
> > +              - renesas,r9a07g043u-du
> > +              - renesas,r9a09g077-du
> >      then:
> >        properties:
> >          ports:
> > @@ -137,6 +142,17 @@ allOf:
> >
> >            required:
> >              - port@0
>
> Should we also explicitly set port@1 to false here?
>
> The base schema for 'ports' allows both 'port@0' and 'port@1' via the
> patternProperty '^port@[0-1]$'. By not explicitly disallowing port@1 in t=
his
> conditional block for the single-port RZ/T2H DU variant, would a malforme=
d
> device tree containing an extra port@1 incorrectly pass schema validation=
?
>
A patch for this fix already exists [0]; I'll post this fix as part of
this series.

https://lore.kernel.org/all/d1e0d4e0fe74e60345a3d043fb4f9128c1057638.177814=
1145.git.tommaso.merciai.xr@bp.renesas.com/

Cheers,
Prabhakar
