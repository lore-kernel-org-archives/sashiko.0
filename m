Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39222E5B21
	for <sashiko@lists.linux.dev>; Wed, 17 Jun 2026 02:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781662844; cv=pass; b=lRPekcby+QN9GBAH7x9v9N2e3gqsIukB0d1H0UalA9oQ9+yClo/KD0a2qPbwcaZE7JMGi9SxLzMIr3o8/F9jmoh/PDLDFjKiEv6ISpG77ZjDcVQJw3T3sBVXwmPJtjVluvXU+eMhzEJq1vX78ksPA/hiu6tcYbQWAan7dnYXsh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781662844; c=relaxed/simple;
	bh=AMPQnUYpygK6FIcZ14/7t5A8fOJ+npmCw9faJljwUGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m5oEJUik7hwig2f01J1/j6tqsMXGreOAqgRqN7L5glKpegTaWAZD3q+HQ/j0SCcGXd1JekKPSwuVpfmOe0tM9wJBrCMDi15uPeMxdsdAtf7Y6OV27bL3P60aP3hMMYnqp+wph20LTEeWNDAeCLxiD8Cz6ZzEZHm+pDsi7DoVxQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=PBYNHEVX; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="PBYNHEVX"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36ba285e98bso5308546a91.2
        for <sashiko@lists.linux.dev>; Tue, 16 Jun 2026 19:20:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781662843; cv=none;
        d=google.com; s=arc-20240605;
        b=icoOIMy5KpdBQy6XEZo9Ho8julCo8sZGmvV8aDxzraHKebQafd8OcsopF4PO4kR3Rv
         gQC+3gHCLPgUcTMX93sYJ/p58zMeDe7FZxhm8IsU10BmxI/ewezIWaN6RbIuGJbmmALY
         s/tjOa6uCId16CFWogrWYN2Bk92tvvEqPzV9tDMOP2YCtBiTt7IgxXTPD8XBNl4iaDhi
         EyivcsJAPLJqbV/tfKJeSuD9IMXZy4C/Nis/+nhXVgPLRsDwCpbev74moUPsHqJDGiL2
         iSth/myw+b1LBeTWrF4nEqTxqtkDaAQnpu8uOpPSXKS9OkaESXlFkpCVu3fueJHMLYoF
         mqIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xnCH2xzLuqc+3Jfi7d5JBNf1kt13tjywRYwCEyR5/Qg=;
        fh=C6zRMjP1ITR3WtwVAZhrLDjxrEFPMJgOAURVlWfftso=;
        b=k7HswQauG+ImbZQUm+yVG0KG/qJhpHH6sfrDarjz2dYDJKuOcTgO1nWRUMwJjn2UyZ
         fpcmBtrKLrFbRJuhA+CCd6RI4o5d8V/lYsFTkoKMC3TR5l4z4nvuiiXv3DPMo76iqB1y
         dvhruwBzLlLH1VgnDXDLNQo9lIPzinnoImN//Mz6+NZ7iw3wjj+djSGC6PW2XYKE/GTb
         SvTxDZI6VRbSiKEmiyibIVwc+gmyQUEFROBS9M36l1pl76//NdugG6g8gZOLqrKmd0hc
         zw6oxgleBEvFSeINSyrQ01M6sB3DEqDVdrwEOz6JY8ShkJnkfYdItEdcuHrWOsLwg4AR
         EApQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1781662843; x=1782267643; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnCH2xzLuqc+3Jfi7d5JBNf1kt13tjywRYwCEyR5/Qg=;
        b=PBYNHEVXsHQPxxH9Wnf4y4Vqsx5JMjUF8kg/piBMsxgdYSJzuveX7D4d829FKnyRLs
         ACm6KqWpj9V1rBsEgj7eqM/cXewPX6xNSEppLnrquJf4BNo6ko57WRGSWSgES7kEaYgX
         jq4QD2HqmCz6JLPhryiBdFq5cc4N3lucgvPVv6XRA09uYVm6nELJ24Nh7YFKkCw+/MWv
         aBd9hU0deqDi/UiUjSFkm/SCnWEME3JIv0z1Nsl0SAuX1N+bdNpgIqgUvv542qgIi7lI
         iizGE4nc/Sh5EZSrzUPpB2JT67goe2S7wTptQAFUWzitH+E90BTzW8dytn1mfQUgRJUe
         8Y+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781662843; x=1782267643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xnCH2xzLuqc+3Jfi7d5JBNf1kt13tjywRYwCEyR5/Qg=;
        b=jF65Eo6JX+bkrlkVHiHJxAP9JAYC+LKDVmzGf3/RKgbn+EGCSruvDnASgRkDE3yUd2
         C9gbhKZAn1OVfnS9y0QWAchhr7iW0BmseEKjGc5G1TSyG/DlRof8Slhch3MSuKwwIDd1
         v2W7iQ2ufAFPXZ/xw7nnPHMCEa12+iDOTEdEogcnvHEGNQ07UVnpdTGghthL5OL/5+gZ
         6p2tsfoBpicJ2Xoh4Wsc/ld2ZyAE/HYZOiIZSRMLW0fTG8juIoiFUUjmYJOlr29jwz7A
         HQzJxfyU/u3E7nkh1APUAuBqfBO2GM9C1pOIeT8jfC/02TxLNvZxR7e39CjkTCHbz22B
         Y5+w==
X-Forwarded-Encrypted: i=1; AFNElJ8RxTMW0yd914JrJ7kUn4jXtAbU4b9butXEHC7E5xweNVw4fNdzCfKGF067NnL4mUFdUeUpK0RD@lists.linux.dev
X-Gm-Message-State: AOJu0YzgAXjIHIBU60LTq0uie95mnvuRCIoFClNrZY+SezBp/dz0B1sb
	v5KP+IF+D7ASJHq/Qj6YX2JfWESyHESyDVl+9rLUjAFznkb7Qrq+RRemD3fAVK5M63mPnfpRMfV
	1Kgk8W6x23xlM+H3XO+zGmG+NbfGw18M0vsmXqrqo
X-Gm-Gg: AfdE7cl6x059mU5ORuY5mFLGVKhZeWnGU0FG9hcWdyL2Tppqaqybb+Kxl32WiyKnGJH
	IRyzCkvc5C6wvxdY5c1oVo5VhYwmoRGAPK0f5vlX/dWLBQDgHjnV/UmUYLdRq8/thrmNC/6WBGt
	Smp3cHpHewyuP7MAAxyx1rn5U3js4PNvUz6VRxtb+ujlXj/XOm5PA51+lgYb6qYjEVvZnvACcmX
	fmPQ3TKCx0Yw1w3zuwX0S+o22NqPV83mk6bRZCxSEOpSGt7mKj7H3npq+XwC+mI1VCVOdj5
X-Received: by 2002:a17:90a:ec87:b0:36d:ae6a:22f0 with SMTP id
 98e67ed59e1d1-37c9e9c8c71mr1394485a91.14.1781662842958; Tue, 16 Jun 2026
 19:20:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260615.zeinurej8oZ9@digikod.net> <CAHC9VhQxHEuznN-xiMJ-LCsz2z-UB0ri6MeMn+Ajyn1WUTDNDw@mail.gmail.com>
 <20260616.EPh8ked0niko@digikod.net> <CAHC9VhRa8DQ-ekrmPQSg2pO9pBFj6GA9DO=x5kguGFTbKKyv7Q@mail.gmail.com>
 <20260616.aiGaim8xie8z@digikod.net> <7ia4v7biqe64.fsf@castle.c.googlers.com>
In-Reply-To: <7ia4v7biqe64.fsf@castle.c.googlers.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 16 Jun 2026 22:20:31 -0400
X-Gm-Features: AVVi8CcLmT2NiJnxN0ELE51mZvuIEGkps9HXU2nQpLi2RgQNJurQjCV5pgbJtRk
Message-ID: <CAHC9VhQ7Oj8v7D1EzkgdCHvMKxo_Jxxr0AzrDB519PHBsrq7qw@mail.gmail.com>
Subject: Re: Sashiko reviews for the LSM mailing list
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	linux-security-module@vger.kernel.org, sashiko@lists.linux.dev, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 7:06=E2=80=AFPM Roman Gushchin <roman.gushchin@linu=
x.dev> wrote:
> Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> writes:
> > On Tue, Jun 16, 2026 at 10:11:42AM -0400, Paul Moore wrote:
> >> On Tue, Jun 16, 2026 at 4:49=E2=80=AFAM Micka=C3=ABl Sala=C3=BCn <mic@=
digikod.net> wrote:
> >> > On Mon, Jun 15, 2026 at 04:13:59PM -0400, Paul Moore wrote:
> >> > > On Mon, Jun 15, 2026 at 11:41=E2=80=AFAM Micka=C3=ABl Sala=C3=BCn =
<mic@digikod.net> wrote:

...

> >> I would suggest enabling Sashiko for the LSM list, but not enabling
> >> the email replies at first.  This would allow people to view the
> >> reviews and perhaps make a better informed decision.
>
> I just did this: 611f4cd410d9a7f7ad923a068a6ced455e3a244e , for enabling
> reviews I don't really need maintainers consensus. (I might roll it out
> a bit later)
>
> But when it comes to email policy I do, so I'll just sit and wait here.

Thanks Roman.

--=20
paul-moore.com
