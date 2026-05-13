Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0003AE70A
	for <sashiko@lists.linux.dev>; Wed, 13 May 2026 08:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778661411; cv=pass; b=P8Mi3zmDoQzTQg+BBstjoofVzfE+FwmpCN6p+NXa3xtEFhoaVHeAbc4POiuoksh8oF2cQep/7O9aQZsKSYFIrbMjww7LtEUd4pGSqqTf6w++EHO37rJo0WPU2r48haoktg2l28Wxl+B7u1OILewkXRyyTwIinefaPe2VY57l6j0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778661411; c=relaxed/simple;
	bh=Jjm9bQfuF7SmgMw1JUCEvkV8aeZQ1nKBrU5ALxUNHi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZPr9weLXVmFx5yV3+E6E4bLNl4GAxSqDMqxHmpGrB2//xAwHb6tyUxqNzw56xJzAXzqEjA7MD8ecPi573SLxTJ94F8NkL53P4u9CrpGAJT/JKuxV6BTWd6/h+AsmRlEi+QZSGoUCFf0+CTbi7ywHOCh3H51zXSqb96DdLulH5wk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZaC/rtwy; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZaC/rtwy"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2c15849aa2cso8607498eec.0
        for <sashiko@lists.linux.dev>; Wed, 13 May 2026 01:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778661409; cv=none;
        d=google.com; s=arc-20240605;
        b=kWwqm3FFFtbkkiFynUGX4bq5K164lF2RIAyGOJWC6pX3eq7HLt4rj+51HIbpwKJj0V
         6FHTTpAFxR7W2lTIE0HQkPpv8cPalkJzpsbbccTdV4nfanLZj1zYBVQJvB5FZUNpCGV/
         1yNj/MG7Jim6GqcejN7yvK5vTOQhK9eH9gZOTe8IzoCdy8ueqWOiQctmwmnk6JDUkRg7
         4AIDKzCPNgD7DbsqhMPr+4bmLYtUKsZxNozmxReooYY/sLa46hSE0H6aO8h5dcMLLcd9
         4njR3raNGWqc9QJ158bYHbeZ36203ReT9ieIaPrZPIePiDaKapsyIQY4uE65OGkcUlGf
         CPIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Jjm9bQfuF7SmgMw1JUCEvkV8aeZQ1nKBrU5ALxUNHi8=;
        fh=jwOSEAHLG8b2VNV0QpzkD8FIQ/F+Bo2rr6OoXatxGXs=;
        b=NLDpC7VZZ0DYW3YjOKRVneZs8P8ThlcQ7Y4mVT8DC/aDvoAI3AgQc5sS4Xe0xU3rVz
         q5zpw+rptCivzYylcYNBL22zNnNsme1Tf5zqDN2mX4zsxlTS/tQTH0HuFKMBMZ0MEamA
         IXo+YhRVNzZ9y4QOwfv/gCSnSXwzEEE1XO2m5bQDDbEhf3ieLP94iYpiPyU8yInq4xKW
         YR+XWpWSUQv4sWR+XfBfmaTyTaRPYGqw8GnxNs3aztzNcJpKs7njTrzw5VEXN96XRJtc
         vw32q6Iz9CbGnrTlq8mHL0Cx1a+a+oynZP9Ca/ktmhJJ3OMi08f6eM1JBPTLI01GoqPE
         hr5Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778661409; x=1779266209; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jjm9bQfuF7SmgMw1JUCEvkV8aeZQ1nKBrU5ALxUNHi8=;
        b=ZaC/rtwyaR186Dn4aLtFb32t/7P/VqFHzhHm04lGP6CbtSmqY3mQtpy+V7617n4NT4
         XT3WPYCaOh6RcmzIUPVfhB+mBFu3WgXTge1OHnKPES8cMjlriRryP0cxmYRmTrgaPSTs
         brAJu1zB+biX3jmVuUWOxjl/I39t8x3619RhnPcJ3MUiX7k8R5qQxpc8mMd3L9alx12V
         0ExalKsA0YmDMn3xYkdG4B5ZmQ/oBgHngy/G+lC+1qHTYWT0jzPn3HVGGPY0pf7hwjGk
         /7EcDkeUVPN5CMxzPjOwYLhnRc5sDYS63qDokbxSnchrBdtIJjUFkQArrMKcuc4KMd2K
         TjLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778661409; x=1779266209;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jjm9bQfuF7SmgMw1JUCEvkV8aeZQ1nKBrU5ALxUNHi8=;
        b=Bj07MjUkKDvvBv5DsOYDL045695C9rg6o5+qtAc09jALkSXpgyEF5gqNqlqwT0UO7J
         1ssVhomPeVU0VQs/v3Vts3Ih51MgdbMrXaa82x1zLtCQ3qhO8cSCGoqB37hw/dgdQXc9
         Eq/bgZfBtaSdpAFW10uB5UwZ0KCm4YNf9zFPW03uf3kSiHeYwltMgbIOFp1ou6BCKd7D
         krxy62ZjmS/1zTDLvoDawK5Je4BS4HOTuZl9Od2z2AIAjiMrOG0GXqFp4JeRtmAMJ6qO
         +Iz+eHrO4Fo1U0vH3azjmOQTVSMBhdzugtgvN9hlcanu3yJca6WIaJpEbVDwKXs1mKbr
         et2g==
X-Gm-Message-State: AOJu0Ywi/jfobxq63FBPRexo3XszyN6om8Jh09CMrzW/UjHrwnTLr3Rv
	O53d+HvP1Bpsu5jrPA0YRRu6faKHnHIDtrKtz2zSrayCCcIuU4BqzWvZGmFO2Y3+ytfkuGtwEPF
	FPQP+Ve0ohPGrJJqjBdgczHVYk6ynkISa5w==
X-Gm-Gg: Acq92OELJ7JFuV6wQc4GL7gDbZwyH4bivatd17M/P9C4Y2TUm3t5Inyx8IImYssFy5K
	n/I8tX3n4MdMck2tswTNsPnFFPJw+JqqR+o3X0/b/HnhWNx43uxJ4Wa8al1bHTZss9LP/1PCb7G
	+u84av9+bFL2VB1lVELBQ2QN/Y1CZj45DqqXlt36VFmerA9nEcyV8svUyvY6MvXJhYTIS3iRpCd
	7k14fxUDmmWoFFGl0Hqv/R9tiphc38mg8B5mRErVOL9K1HbUQ6+pe9/okjUN0hfiaFb81ByMeSr
	0HMrmfolWGPWFWYczIBKZ5WE6pNXhAA5ARDrFbA5l4W9i/eThw==
X-Received: by 2002:a05:7301:198c:b0:2da:d4b4:c85a with SMTP id
 5a478bee46e88-3011747e13bmr1542733eec.11.1778661408933; Wed, 13 May 2026
 01:36:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFGhKbx53f0Y4XPpTcpqaYbXVd+Gu7c8L1pWKnEfVLxG-Aktcg@mail.gmail.com>
 <87tssd51c0.fsf@linux.dev> <CAFGhKbzB3UmuHsh_7i8p42Csd3kKx0bgtf0GF-7emxo=vu_jMw@mail.gmail.com>
In-Reply-To: <CAFGhKbzB3UmuHsh_7i8p42Csd3kKx0bgtf0GF-7emxo=vu_jMw@mail.gmail.com>
From: Charlemagne Lasse <charlemagnelasse@gmail.com>
Date: Wed, 13 May 2026 10:36:37 +0200
X-Gm-Features: AVHnY4IUZPUagOU6zY2202ksi5ijonNSVeCt9l1wfzSIkdVP1U7w4X4GlAyQ2dk
Message-ID: <CAFGhKbyLpcnKw+owas31umGsaiYd7op2gWbEFpViWG3vfmxjww@mail.gmail.com>
Subject: Re: Sashiko.dev webview not getting updated
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: sashiko@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Am Di., 12. Mai 2026 um 17:56 Uhr schrieb Charlemagne Lasse
<charlemagnelasse@gmail.com>:
>
> > Thank you for the report. It's a known issue, actually caused by some
> > issues with the LLM provider, nothing sashiko-specific. We're working on
> > fixing it.

Does it make sense to inform you about this or are you automatically
informed about this state? Because the whole system (LLM provider,
...) is again in this state and no new patches are shown on
sashiko.dev since 3 hours ago.
