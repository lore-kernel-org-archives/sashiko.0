Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AA219E968
	for <sashiko@lists.linux.dev>; Fri, 31 Jul 2026 00:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785458066; cv=pass; b=bi5HhnilXYX5gNqpDy1+mAfGc3Ofxx9GDHsxT0auKTcAPiIl0zFdQfqnvSUHSxvqe409TjSIySm9BeObNKnWZ5U8PqFaVhUTQ5nyGp26rd8Ao+MZmoPCLnNF5Zf0VK+aLGNc64PkFpS4PtQx6tZbO7LCY8FDiqPAqlPon3frCVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785458066; c=relaxed/simple;
	bh=cZY6+XtKL5qUH0AJydXKBK9o4vDEI18sqMDZWta4hj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WJa5hLhNIyj92MDq/sewYAR/JdvHBoNxIOdqWZVjY83BvPnaaCukLOGIQlK0+ZKFupqU8Pf1tww/3imos6NIA9cg6F0+HnfWcS5t+G96xeYjod13JqeJXar4mARBkmOjbVjwYSL2zd06y128oaTnolwFw1YcDxhqkB4XhCLaRRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UA9w8Zx2; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UA9w8Zx2"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f904e80eeso237923f8f.1
        for <sashiko@lists.linux.dev>; Thu, 30 Jul 2026 17:34:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785458063; cv=none;
        d=google.com; s=arc-20260327;
        b=L7JOA88mg/6m6rMn1tWcOQUxXz0FIjllkyBAvtH8KCW2tZttxyicw0zUeOgQ74YRcc
         c1/IX8uyIqttwY+KjpKRkyC3Y0dnOb8zUV/1mCLDSjfjfjVA3Z0JeUkWL0PxIOm53Lql
         Wb13FLy0iqxxDzjQTb63eThNThkHrHSzo466fM0Je0WIAe02KJx8KGOTPYngycYXIpZH
         jsdoRi3GIqvypaXZHou+tZ7ov5Kah1iH70jnnXSxuJ80oj0t+BXydgvlxVk4wlII04A9
         iYiYByIFrco+eSdZd3OYmnYC0/qqJlaeDRgEJyvmfwwGooOKPk82+99p5DhGuVOqf0jB
         pfKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cZY6+XtKL5qUH0AJydXKBK9o4vDEI18sqMDZWta4hj8=;
        fh=Yx5qRVL4WRR21lpBGR15x2ed0J3xs/vdawGlW91S+hA=;
        b=stJ0bTEIudHUX09U+QUGeDVlubOCROVFRLVqnU5z+MHwycrD7kGyV3IAsKibucz2SS
         4gfX18qjel3C3ye2WEEzelIct/fVsDPbSdi3/KapKTUbQGH1iVj4G+WrZi/e2qu++bQT
         nIE3pWxIQXOD3cnawILb5j1OKuaj8vLb8ukoSjAnVSMXLG7idSdC+tIYRt5FQgcRmOsq
         606qrrMeyc/7U1jF0EAJswW+cO8GrH9j6MC7GTmfA3GtSwic5Q/EBg1nQzwan/eg0luK
         fDfOKTtt9HZPDfXd5Erj0rR379j0XUaG17T1od6hKII6L9iolUMV3NiRewo6HC0fjBJN
         WK+w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785458063; x=1786062863; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cZY6+XtKL5qUH0AJydXKBK9o4vDEI18sqMDZWta4hj8=;
        b=UA9w8Zx2xMmAJQ0NVpImmxy5VWDM1L12ZxX/6oF8mw/gFxQRZ1DxMCfuH9fE9csVop
         /GhTKUMunWJ1yGMiW2HHQphQAzP7Qyc24sL/dWtDA+ic/JBctsPUXhLXX1QCOHNa4rFP
         QjhkJ8UOq0b8XTMujrhkuXNagmpKaE3Xgfi+7L47GwRok6BGrVE6c9wmSI55UcuX8BsG
         2yVAuUzblEQjIE736YB62hsf2V8U0rnpXbB4gUnVIqtru1GjV5chHE+F7oCm+ZageHfy
         9r5v+LAYZtoVeSfJ6orcAXOhuys/kbr6/4DRbyh7spu5aUk83MJjHpKc4f1WaG3qO30k
         dfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785458063; x=1786062863;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cZY6+XtKL5qUH0AJydXKBK9o4vDEI18sqMDZWta4hj8=;
        b=o0NSmZwYvZ9ZKQxmE3wgboBFGmRtknDeELw0OJ+S783w1IxwVjc+UzGwr+cYJhKtWW
         SB0eGMTH6L5FWdJjd8fmadX5OVEzZfK+CTeVmFEZVBbr2OFsm+/RgDHPqYAEMzphmw4w
         XNfcitAalxy8t3Fh0PLX58Tflpnb6WynVxAPmHM/YSlb+CUn8PtmqtLPSJi9Ib2fWhlq
         JIBNf5eukhTmI1QNq6F5k/udRypxwhuL0R6tlOayWZQOxkR5j/xSxJZTFsAwYbDVg/Cb
         Ac5HB6DN7G4nSk7eZ0ZKRknmETJKZWWica7wWPPnLYXpdS5jr2EpnlW8J7cWfoiBIKMC
         ihGw==
X-Gm-Message-State: AOJu0YwtJr6U27iDoRLBw+cUgPU6NvUc8VgcjjauMUZ5RUzEfL+Gf4id
	dSqB9YVc4fqCcjOqmeqgTZWaFoD0jAdrHRVj5VI5C+Zg1muS5aeDy4IC/ywfxKzYmaWbbntVnYe
	KbV/eZt3/splStZ3pkP0u7f0krbIhSNt7xKRjJSM=
X-Gm-Gg: AR+sD12VG1uaPMNURdEn8aXsHij+I7+D5SYle+URCzX1BARjDXT7dGnflitgerqvQ1l
	j1DrFRUs0j7WICIrV7NqvU9w5d6vSPr9/fU3j8e+eznTEDPL4hKY1iC70mN6pRFJZbmQ9AAuTUz
	LMmqhrJ2AM/0gizWCaLH+/Fc/sFPKZ7R8tW3BvLZO/xErR1Fpn+XNtoyd4JGwOKkzXiW5/ixtE/
	3zxsuYLb7Kr9sc2dxaulGvJDWehEG/rtM49WBdE8TWSv25pDLD9fh4YRTddv07Z+CkS4Vn580AK
	xUtvMU8NljIoYpP024uRKEGR/s1UhJcxdLcuT3gAhlcWuAbEH4zkIHg5+YOVQvnIGnhyi7ckgz6
	gAc3dGYx5NBY3polUdd6bZ6Nb1fNLPkilKI8=
X-Received: by 2002:adf:f911:0:b0:47f:45fa:98e0 with SMTP id
 ffacd0b85a97d-47fd2b92182mr137022f8f.57.1785458063114; Thu, 30 Jul 2026
 17:34:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJnrk1Y6twWcXfFesbLMNfMavg5RWgQ07pGJ1BM98V4o+FYcBw@mail.gmail.com>
 <amqgKj06QbSWJ9RT@debarbos-thinkpadt14gen5.rmtusma.csb>
In-Reply-To: <amqgKj06QbSWJ9RT@debarbos-thinkpadt14gen5.rmtusma.csb>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 30 Jul 2026 17:34:10 -0700
X-Gm-Features: AUfX_mwzMBi81BIyMVontuCxZ2DzSxjzugwqDrM2YkYXohp2bcRlM9uzFYyGSxk
Message-ID: <CAJnrk1ZBtv4-t=Z-oKBybW+ZUuTn-d2spnZnb5DCH9R0=QLp9g@mail.gmail.com>
Subject: Re: Full subsystem codebase scan for identifying pre-existing issues?
To: debarbos@redhat.com
Cc: sashiko@lists.linux.dev, Christoph Hellwig <hch@lst.de>, 
	"Darrick J. Wong" <djwong@kernel.org>, clm@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Derek,

On Wed, Jul 29, 2026 at 6:43=E2=80=AFPM Derek Barbosa <debarbos@redhat.com>=
 wrote:
>
> Hi,
>
> On Wed, Jul 29, 2026 at 01:34:10PM -0700, Joanne Koong wrote:
> > Hi,
> >
> > Is there a way for Sashiko to run a full scan of a subsystem/tree to
> > identify all the pre-existing issues so that they can be fixed
> > proactively?
>
> At the moment, no. At least nothing that I am aware of :)
>
> There have been some small conversations about such functionality, but no=
thing
> has really taken shape yet. One of the concerns was trying to validate th=
e sheer
> number of potential-false-positives, and how to present such information =
in an

Gotcha, thanks for the context :) That makes sense, that sounds tough
balancing potential false positives.

Just thinking out loud here... if those false positives are currently
getting reported/flagged by Sashiko on contributor submissions
anyways, maybe it'd still be helpful for them to show up in the
subsystem codebase scan so maintainers can course-correct the rules
for them in Sashiko (and hopefully save contributors not as familiar
with the subsystem some confusion :)).

> actionable manner. IIRC syzbot/syzkaller's way of storing such data was u=
sed as
> a comparison point here.
>
> FWIW, Chris Mason has a repository for a tool that runs such scans on cod=
ebases
> -- paired with tools like semcode. His prompts are the same ones that we
> frequently sync back to Sashiko. It won't solve the other point you made,=
 but it

Awesome! I'm a huge fan of Chris's work. I wasn't sure if there were
differences in the analysis between Sashiko and Chris's tools, but
it's useful to know that the prompts are synced from Chris's repo.
Anecdotally, when I ran a couple of my series through Chris's AI
systems a couple months ago, there were some things it pointed out
that Sashiko didn't and vice versa, but I think that's probably more
due to the underlying LLM being used (eg claude vs gemini).

> may be worth looking into. [0][1]
>
> > Currently, they're flagged on patch reviews, which can be
> > a bit frustrating for contributors who didn't introduce the problem,
> > and adds a bit of noise for maintainers/reviewers looking at the
> > Sashiko report.
>
> Unfortunately, you aren't the first to report a problem with these.
>
> Currently, in the 11th stage instruction in the code, pre-existing issues=
 are
> propagated in the report like so:
>
> <snip>
>
> CRITICAL RULE: If a finding is flagged as pre-existing (`\"preexisting\":
> true`), you MUST explicitly state in your inline comment that this issue =
is
> pre-existing and was not introduced by the patch under review. Use phrasi=
ng like
> \"This isn't a bug introduced by this patch, but...\" or \"This is a
> pre-existing issue, but...\" to start the comment.
>
> </snip>
>
> Instead of them replying inline with "This isn't a bug introduced by this=
 patch,
> but by..." or "This is a pre-existing issue, but does..." how would you l=
ike to
> see this information presented/conveyed?

I (like Andrew) also find the pre-existing issue reporting really
useful and definitely wouldn't want to lose them. Maybe something that
could help is if they were marked even more obviously as pre-existing
issues? (eg prefaced with a bold "PRE-EXISTING ISSUE - " or displayed
in a different font color or enclosed within parentheses). I usually
look at the web ui and sometimes when glancing at a series (eg [1]),
it would be faster to differentiate between bugs I caused vs
pre-existing ones if they were visually marked differently. This is
not a big deal at all though. Thanks for your work on Sashiko!

Thanks,
Joanne

[1] https://sashiko.dev/#/patchset/20260715174305.336261-1-joannelkoong%40g=
mail.com
