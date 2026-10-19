Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88436481FD9
	for <sashiko@lists.linux.dev>; Mon, 19 Oct 2026 07:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792393359; cv=none; b=ZiLmL8pwz1mAk7PnCw83N8alUijdEIfQAk6gEFPDs07xxOaOv/rckGVxrfEw3zvz27kE6bv6z64DWi2b7iBCbzmMcdkN8N0MDdkkfjlhrRAYBO/+lY6LBy9pl4bp3ES0XUnOHQfVKy/hOXNjvUoeyq3opXlkUomM7+LBP6nbYLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792393359; c=relaxed/simple;
	bh=caiOAC3ZMfnRb6Cow7Tm52Ond6WJxeDuC6N5cXWzJ0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rnNGavVfRzEMxzWdpE4DTofn7G1r9dY2GgJ47zZhxVjlPPIXpr9bCbc/SOLYC5bTlBlQsCf0S80dqwKNKsTKTFSogDFtjFPc/fRv+LqmFUeEIgfSKwRkVfx1UiTqkmz8rbeeSI69EdFP9ltAtHfFy9t7NWfUAS0+QAYQSGdI0m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lzMx6Oy5; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzMx6Oy5"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2afa22e1dcso261819066b.1
        for <sashiko@lists.linux.dev>; Mon, 19 Oct 2026 00:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792393357; x=1792998157; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ss1sPKwGjZIHMoq6AIRLY4p1Jhwf9GL2A3EDWJrTFIM=;
        b=lzMx6Oy5vYpyFkG4QUfat7cUtL3mG12Ggohn5AbPeWa3lg2VqpDNHgaqYc4i9OsV2s
         hjcc9J3o+vFf0NwH/U7DSPIMJ/WhWs97TvfmuZI+uwkRdV0/OR+3rkSw0nUNB+wbsRsT
         NHkzRY4+EV2n9b+ItaOqp6jSLK3nWSSbx9F2DwcdDnQT11IUOJ3dYSH9dGJlLk3iFiAp
         gH+yAgpteQRuf07sp/eSsuGpApUr+HiBOBO/E62AzR4zEIm8S8bvisAOA1ho6xum0VWj
         9poZVlPe8+AOducSiHHe4VXY8UBaGh89SSrMQG+HNw/RlrjepMhBICVeLu4zOQYt8RXF
         J3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792393357; x=1792998157;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ss1sPKwGjZIHMoq6AIRLY4p1Jhwf9GL2A3EDWJrTFIM=;
        b=rX3A9eLVFrrn2n/SP5+UANM/iW2ciVjGbJpUQeqaOow75Q1wlrni8KTcdE2I6LHaEb
         b8sMkOqI7AJc54sqoUp2n+dOOtQNyPX2gVj4xeDxewPxiceh2ut4M02qqGdP446B7JLA
         8t8//qDoUgvUWuVBAxgSuLFiAtm/Tck5CdmdYHj3G8TRG6v3j9S0nNwc/u5SZklsacG+
         JPjcisSYTtnZpIu5yU2zdBZUs/OniPjeKMIIxf9XJO+4J3DZkhZrHY38mqQEnMHff86w
         Ir37+4WKE/0Xz2MjuBq5rsVadxgG8oWsz7ZRN47wHMBReUvLVVg+4YyDTDLpshPRE2HX
         dhNw==
X-Forwarded-Encrypted: i=1; AKwUvBywZymScy7HKPhzcYMtNuz1KbdV6uYeE42hCzHH6n8K2w7tDbJMvpSbm6kTuWQ5etPs7sqJH24u@lists.linux.dev
X-Gm-Message-State: AFq9FYLzRv3SxlTcl7jwkZuMlyat4PUia4fAUKTdc622NjGFo0pogId9
	KAHYr7O6ff2LF+fl7mV27/g47BgREq6mfQRcBEubqNwE/TyCF/u4hAaF
X-Gm-Gg: AYBFou2I8CGdJdKMTp88RCvitx9N9dgTLA79/xE0QOIWALTI2B9sIgVj6x8Z8BvNn2s
	Ado3K51C6asnh8ugfT3fgzAEgcEN4CmktU7Tu9Srd2iHbvXTkF/D8I1X75qYfqMhc8qlZnL7AcH
	SdPeA0AHafkcHAWl8ORk3CwqVsxLlOTnoR6tvILoxYDEkOZDvWBEwkXnSspxfqArEMahAJeaGNS
	G/SgbwuXbAdlTs5ZGoZDxoWk6LJL9AQ6yXm57iH9h1y51rBQBDXnB8KuBtgPZlBzp6a0KsZPBjw
	SvckqFvzsr37uxAlacXrjn2YNASI4NQ/ghLJK82X/3zPXhpFnAAwXhpwErAUVDHI4rJt+R8VjJb
	DrwBxdFPaO1e55GJ5RYgJ5oS6ibUTvdS0mopQWH/1HYotBES52yE8Nog4Ge/+t2BY+RD0Y2ZXiA
	OCGB5RwiqmVf/2rSLwmSmU07sK5tgM2eLRSDnUQeEeKvoBfnvy9K7VHZag4il/lGMHvOQ=
X-Received: by 2002:a17:906:478c:b0:c31:7495:e5b with SMTP id a640c23a62f3a-c419d05ed13mr457742666b.10.1792393356319;
        Mon, 19 Oct 2026 00:02:36 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ec8dfsm22184171f8f.26.2026.10.19.00.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:02:35 -0700 (PDT)
Date: Mon, 19 Oct 2026 10:02:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Arnaldo Melo <arnaldo.melo@gmail.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>, ksummit@lists.linux.dev,
	sashiko@lists.linux.dev
Subject: Re: Patch pre-submission to Sashiko
Message-ID: <atXAiG_OL-TOKhJT@stanley.mountain>
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>
 <DM7BL6J0WCXU.1I38BKL4RJLFI@gmail.com>
 <49D0633D-3576-4F42-9934-85663D11EC15@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49D0633D-3576-4F42-9934-85663D11EC15@gmail.com>

On Sat, Oct 17, 2026 at 03:38:36PM -0300, Arnaldo Melo wrote:
> 
> 
> On October 17, 2026 3:20:47 PM GMT-03:00, Alexei Starovoitov <alexei.starovoitov@gmail.com> wrote:
> >On Sat Oct 17, 2026 at 5:28 PM UTC, Jiri Kosina wrote:
> >>
> >> [ in the spirit of the concluding discussion at this year's maintainers 
> >>   summit,  I'm using this list outside of actual maintainer summit 
> >>   planning :) ]
> >>
> >> I have just received a v1 to v11 patchset submission within roughly one 
> >> day timeframe.
> >>
> >> Neither myself nor anyone else did comment with any review feedback, 
> >> except for Sashiko. Which I believe is what triggered all the immediate 
> >> resubmissions.
> >>
> >> I don't think this is sustanable.
> >
> >I think it's just fine. I encourage developers to keep the spam going.
> 
> Yay, agreed, it's not like before AI people were reading all of lkml

I read everything that's sent to drivers/staging.  I've read it in the
order that it arrives and I've done that since 2010...  But these days
people are treating the list like a pre-submit AI checker which sucks.
I feel like people are saying we should just accept that mailing lists
are just AI checker interfaces instead of being intended for humans...

I think adding a 24 hour delay to the AI review solves this.  It seems
to be working for networking.  It will likely push people to use AI
locally which is even better.

> (or other voluminous lists) traffic, just ignore what clearly is a
> conversation that now happens way faster than in the past until you
> see it calmed down 
> 
> The problem was not getting feedback at all, now people complain that
> feedback is being provided timely and then that people are responding
> to feedback in a timely fashion?

That has never been a problem on drivers/staging.  Greg responds
to every email and when he was on vacation then I responded to
every email.

regards,
dan carpenter

