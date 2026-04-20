Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA6E3A9D9D
	for <sashiko@lists.linux.dev>; Mon, 20 Apr 2026 18:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776708540; cv=none; b=KW0AAp6Khq0aO+/eQr57lftpY3kVPGy266myoOvKh3fHQjcsB+x18gffi07Oy+n/Vp8Il6n14EdQHl/u37xNEaq90lTtbwBHS3274Hl3cES3wcqxZv6a6k26XDCFAlCr9Irl0TRKTAZOTd9RKEucdPgjvRds1/AmVfY3ydRC5/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776708540; c=relaxed/simple;
	bh=A8yyj/crXE/M7L62h86VD1i8sAS1UMvSTuXrc+Y21Sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jx7LNjRTBmUuCHAOgy/1znHiwVx1W3wss3//mx5fQ36heo3xN2PV87l9ZHPnzr4/qtFtFilsfXIArrIBgZcwcWq3gzMOPiw0SyekZ4jwF8C4pplXrnWJ2rFvhe50mdoXb9T1PkxNroAcnog+7NMmf1KPT/vVecUlpXEaXctimwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=tOhpmR/U; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="tOhpmR/U"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8d67a483d3eso376974185a.1
        for <sashiko@lists.linux.dev>; Mon, 20 Apr 2026 11:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1776708536; x=1777313336; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iI3K23he8gHUPdxooOA7+4g/6PX8z/wQB0OJ/JOEpO0=;
        b=tOhpmR/UBiCumdRQeINemCLUistaFKpxqXdx7DfGQvAUV3FsP0a38qSzrvjzhvy8lm
         R04kUZ9xw5dKSb9bGAPGYRg1SQn2r2Hoo32PPuVUMnxRUU1fJ1kG3V2juJ7rW49btX6B
         CCYfXLna29cFqhgoRajMhvQ6t+bjTubzX6ZxcUIpUQC1yudy88WVbcZNTbtyeBQHUaTJ
         64H6+3jByakqU7qw8zjxM9hilRL0FqVnzT/bhqCDpTR9N2ttyqgg6rvYXscFrTx01Hed
         hzp3QSuNAw5Vmn75MgsBjc/dZviNC7dgx1irbSV9T6i+ptwP5JrYsfGOpoB2JqO8dQls
         zqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776708536; x=1777313336;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iI3K23he8gHUPdxooOA7+4g/6PX8z/wQB0OJ/JOEpO0=;
        b=PPObefz1XazHCMQMSAEB8HF6aCHIMaIRa8u2rhVkQLyh8JqqowEw0kq9ke8jjhz2ml
         VFIAng4gWMXnbO66mUH03Ev1Bm+8KZw/eXuhYID+GZ98I4rwxZkLpunWMYVRXRv9Rm0U
         3yr3weRxPycKTxBjmbrtC/+C+Y3Knl0+wkmCN7rptWGm0WfZfyAjxnAl5rfFz1cXvN12
         C4apD0cRip0RSqlJQV0JUkq3HXbe6Bua0bzR+Wg4Xe3sejgJdGR7SQ7C2PNf0sk6wk1H
         WCJbd4ZJLDYmIw2/jAsrnm6f3BPwcyQaes3hN8JSRefqVHGzcrOtgC5nTBNly6HYsOz5
         7hiA==
X-Forwarded-Encrypted: i=1; AFNElJ9YhWg9QKtqBl0BLl49D6gRjvweHFZu/fqexXWe9mBnCC0/p7YN4R4tNaoaX3FLOAUHtn1l5kgf@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6qGHIK1QfqOBJm12K9KMTqsrCYWMLZ2AJgFV2SmyPDSVWM0Qx
	RAnxY4CkxA/RpANCxWqDHYDVXlbW0hp2obCEsqE4pXQT15nLYqKeJprkZMNYhzAdRiffvH1gHZ4
	Holg5
X-Gm-Gg: AeBDies3LOhzU2SQgcyIW2JM1WvGwcv+XmDMMcsXxtQBCrBh1r/ex102Im8ti6rBnbc
	PUxbUemVj9g684/x9bmdIbpWXL0mr8hGA68+I/0xjiPQJz8jzq0r7QzggTu5mOeG8ZTQy4Ne1yv
	PtYpu+pBtnNwVFQUdVcISubOHgy8emEV+9pTBQvZ+ajfT6km5nFaBiMhKNzej1bFSv5KaY31Uqc
	KJbUD8DShRThbsjjHfNxhqRcjE8mzU6LmH6pxH5OZMFO8LgstwPy99WorZG6sMOSUQCo6GfV8Ri
	I/HNkauMFF7ozJjpxkii+3Osju7iHFZrD3ooszkByXpJJ7Ic4/gfJDTOYiQ6r2/vWNjvFtNecv+
	MZua4bo411bJWo4jDL1PcDPylD9wCAkbSOpNuWlyRiJTy+bBXXDvIBuQ+trnZonE/Bv/4ifvqBl
	GLul6xsSG1Vzwr0aXNQZSiLNdOS1CJbwzl
X-Received: by 2002:a05:620a:444f:b0:8cd:8a55:510d with SMTP id af79cd13be357-8e792865b31mr2075327885a.48.1776708536016;
        Mon, 20 Apr 2026 11:08:56 -0700 (PDT)
Received: from localhost ([2603:7000:c00:3a00:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d69ae320sm989027985a.20.2026.04.20.11.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 11:08:55 -0700 (PDT)
Date: Mon, 20 Apr 2026 14:08:54 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>,
	"sashiko@lists.linux.dev" <sashiko@lists.linux.dev>
Subject: Re: Delivering reviews over email
Message-ID: <aeZrtiE4hT66NvzA@cmpxchg.org>
References: <7ia45x5tuj88.fsf@castle.c.googlers.com>
 <z4eztn7epx6kghtm3nyoiexhnbxxc755f5vvh73gtir3nra6yl@etqgkhrpx6r5>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <z4eztn7epx6kghtm3nyoiexhnbxxc755f5vvh73gtir3nra6yl@etqgkhrpx6r5>

On Mon, Apr 20, 2026 at 06:51:43PM +0200, Michal Koutný wrote:
> On Wed, Apr 15, 2026 at 01:04:39AM +0000, Roman Gushchin <roman.gushchin@linux.dev> wrote:
> > Sashiko is now able to send reviews over email.
> 
> Great job! E-mail interface is something I've been looking forward to.
> 
> > If you're interested in your subsystem to get email reviews,
> > please, write into this mailing list or me directly or send a PR changing
> > this file:
> > https://github.com/sashiko-dev/sashiko/blob/main/sashiko.dev/email_policy.toml
> 
> Roman, IIUC, this considers maintainers as all non-ML addresses that are
> CC'd in the original posting?
> 
> > Please, make sure all maintainers in the subsystem are onboard.
> 
> Tejun, Johannes, would you be OK with the change below?

100%. Thanks for working on this
