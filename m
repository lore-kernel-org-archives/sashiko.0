Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A90383323
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 02:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778551632; cv=none; b=ZVt6QwMkxWr5n0l9KH7nWPw8hd5yl227/pNvGDiPi6C2Jk3yv903XKQps+nLaiSrcL+70lsx83APxeOzCsB1eukld/IEDNdj9FTjMkB8F1XWbHXm5W8062cq1Qnx9L7OhxAGIwsSqdfm5i1yfmKrmEvZM6XrwdVttRMddNMyz4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778551632; c=relaxed/simple;
	bh=uCnPTczXRGCjJkasxe+ExAASvngVWa567A59zopNH78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LrTYYC68mekSgQ8o5USHH5WgFsnBIiMyt8s3O/pykdHmDtRMygNQ5ngRne+8oBl8GAq+1JJkLC/+q+8htzom8Xdd/DEC9n/94jXojrhQ1px3ZESG2zM0K6xzmB1ZOVPn50NHY9w+9NKHRd0M0Z6ndTJwd6/oSyzNCMMZOqKWqQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ygig6l06; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ygig6l06"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-65dbe04fc1bso1837141d50.1
        for <sashiko@lists.linux.dev>; Mon, 11 May 2026 19:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778551630; x=1779156430; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VMuUQCVEJE6aMa+W2DJMi+Yspl9yx7h60YzqRdzSdYs=;
        b=Ygig6l06jSQBJRcf29+2H9ao9IZ4ubIN+jq0RP4NogOXzIhxY/6JxKVI2QIn3B388l
         l+aG7zsKQuFBRCRn6ZNDY8B/N8a0dkGDBc9c+feO7tp0RXLEkdOnwk5VXXuAj9C5xVse
         6azlxFAyYQcUWf0x4/KIeIw9P96GOAQ4QbqosxjeIT7OAm7JRq9QAJ8IYNbyqR9e1xYt
         uhfINHKFnHjcqfIUZ8D2KkV1iAzTCV031R29K26VfmNdQkZ2eabYw/m3pBhZlkzLHXOc
         /5UZda/0G6RbNa1fzwMBvkM8kGiA0D1SggSQSejUCo1zNkhVCyPq11w/NWA4d/aCJfYV
         VfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778551630; x=1779156430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VMuUQCVEJE6aMa+W2DJMi+Yspl9yx7h60YzqRdzSdYs=;
        b=qP8l0g75+N+SqRE+9cBpVwdfDLLXeX7gXVhKeqYWXs8md+2d2X1+uQkBOdrdwsvcht
         WIU+nmlqkfx6wMbtk+vwLHSCOJ9/gY48R6XLecYbh0fJASj9jr+GQrYUz/aDvIMeCX4U
         CDO/1PkahodOw9Cv2ikMd/JdXcKpoowwdsdv29IiTgFzkd8gF5/zVkQjl7a/O/VsmoqR
         t5qGww/0W70KhJGN7oS4URew/0wGD2M3VkTE0zGeHgTYmF4+z6u4i/5J30hQVn4DU68G
         Dm10xnsm+yzelGbS79YeKmtSmOFl/MPLJE+QnA52/TQqKIrQviP+ludu/3xgmUM4TFKl
         7Fzw==
X-Forwarded-Encrypted: i=1; AFNElJ8swhSDq+6FE/jCTa9VGZ7zel+0yW15E8c6dgHCEjgmZJ8CYA/FLIKADSfTA8vi6r1+op5PXiMY@lists.linux.dev
X-Gm-Message-State: AOJu0YyupncVcCEb5VTCAVrqIL67V/L7w37REyMmCMYg+fiPvuKzAV5M
	Zs4SSUhoTOcZPf2ul5QarpFww34xyrwIFYA8jjrQ+zzwHru98Sm+cZ3E
X-Gm-Gg: Acq92OEUU8phjrAHah/JYW4vMgt+6G9iRy0JC3R7uaE1eDadep5zqzWBuNW5PAfxosM
	Q5y3i4ourQhW+6dolCPsbRviXzxGUEzqe736i1REreOAdGnjvI7tXiRKEQp9P5u7IScKFrfGW6i
	4IJrP7zw/CLwgSzbiJoyCXF9bB8p5JhPNy100y7wW2uNbb0Wewf6JI5j1VSCKrF3b3aIYL50pRn
	FPQuW1GDcFZnimbPe6zlxhygOMpAtt81pICmuo34uk5KQwuH6q4uGz4rJCHp+m+PcYlBAYsyf+u
	/E2KTJzaJcfLnX643tL0n6X+KREvQhzx2KhTwnjp+BX+aEdAqoX2xDgx5de563cU/MnSOCS0a7i
	yuiE5IkUJZ3dMoSY6MXLQ9AsllIOI99EUKIcyhRQ6r/NwQA0Zxkou74ns1NdW6zPtWGYXosXwed
	Oy3rXFGnbnJMVDk3IaKu2VeuL5IzoV1GFmx8cKVEzLods/8objzICRPcBJZw==
X-Received: by 2002:a05:690e:1282:b0:65c:ed33:bda5 with SMTP id 956f58d0204a3-65d94901e32mr16907981d50.0.1778551630402;
        Mon, 11 May 2026 19:07:10 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:6d1b:2c6f:d117:7f3e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd66019105sm159044777b3.0.2026.05.11.19.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 19:07:09 -0700 (PDT)
Date: Mon, 11 May 2026 22:07:09 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>, sashiko@lists.linux.dev, 
	bpf <bpf@vger.kernel.org>
Subject: Re: [bpf-next v3 1/2] bpf: Offload kptr destructors that run from NMI
Message-ID: <agKJzaG6U9-XppgE@zenbox>
References: <agCXEJKJh-JGMhjG@zenbox>
 <CAADnVQJdFCFJcg0Pqdnx=D2h5vHj_q4mrwSJYxRC5RW0NTFNvQ@mail.gmail.com>
 <agEnc0aYMhuIeDlq@zenbox>
 <DIFYUK5DKGAT.189D9YYSQFCUZ@gmail.com>
 <agH_0MEw4b0pB11-@suesslenovo>
 <DIG0ONMVOP0L.3QFYUPWFSKWI4@gmail.com>
 <CAP01T75942V+wKJD0yhs8yb7U5vj+y9s6efJ+UdpTMfzP31CWg@mail.gmail.com>
 <agKBE4Ci4_LmJ1Dc@zenbox>
 <CAP01T76i3S93kvXnQvK+NU1ee82s+ka2jQfmf-yL86r9AS2tuQ@mail.gmail.com>
 <DIGBOYWXZ95S.3GAGVQGUJNQD4@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DIGBOYWXZ95S.3GAGVQGUJNQD4@gmail.com>

On Mon, May 11, 2026 at 06:55:50PM -0700, Alexei Starovoitov wrote:
> On Mon May 11, 2026 at 6:46 PM PDT, Kumar Kartikeya Dwivedi wrote:
> > On Tue, 12 May 2026 at 03:43, Justin Suess <utilityemal77@gmail.com> wrote:
> >>
> >> On Mon, May 11, 2026 at 10:10:07PM +0200, Kumar Kartikeya Dwivedi wrote:
> >> > On Mon, 11 May 2026 at 19:29, Alexei Starovoitov
> >> > <alexei.starovoitov@gmail.com> wrote:
> > There is no deferral here. I'm saying that we just cancel for timer,
> > wq, task work, and leave other fields as is. So we don't have active
> > work pending for async items.
> >
> > So as long as the item keeps getting recycled in the allocator, we
> > don't free these fields. Once the memalloc is destroyed, the dtor runs
> > in a known safe context where we can assume bpf_obj_free_fields won't
> > deadlock or run into any problems.
> 
> So the plan is to do
> if (in_nmi()) && case BPF_KPTR* | BPF_LIST_HEAD | BPF_RB_ROOT
> just ignore it?
> And no other changes anywhere at all?
> 
> That would be too good to be true :)
I guess the last question I have is what would prevent an xchg() out of
a map on a recycled kptr from causing a UAF?
