Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCB2374182
	for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 19:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776800307; cv=none; b=FCyd3JWB9znQ5l9alydj1+3dvZtv3/ZzjBqRDtn/Rht9E252y+cp0SIUaDMw0mjeX3J0gA0Q+SKG5HPoou6phOAqOpGKGZLr3C7K3G4JSthUPE6XZ84mm7va4wkgo1MRbW6NHzZp81lBZ10w7LwT50hp58TMG6lwCFH0W80zFtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776800307; c=relaxed/simple;
	bh=T31XkmK3RYAHLWgtLcpdoMfs6Ligmd+vlyTVMJlJYnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eRxKzJNzsr6Qn5Mrkye3XMbOtfGqLPpQ5ymtGvvEPrWaMSW0ObkpmPWM3kqq9KAhyJlOzMJHq4ALWInLHxIC0UsPgellvYMg/6oSeBVeRHLdMJPXuOVZgpgMVjTWA1RcgZsP4NPg3nbvrHQW3G+WI5GNCpZDygS9Fq2XQIB5Et0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YOCRbMQJ; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YOCRbMQJ"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7b4ee3a88e1so43943297b3.1
        for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 12:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776800305; x=1777405105; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2e0TKxjpXGN0t5xUf6j3MFPELJVwvbaTnpZJeQDZ8C8=;
        b=YOCRbMQJfXpwc6CeO++U2sTU1rjLCozDN72Ru0pgNaSC8ibqdCm/QBS/yPFAYg5zoN
         +FlY49H6PIJ6eUNlqMEime8BtmJK0Y7e3IhE2jl2T2RSPDa7XhPKQBinYxnRE6DPPqCA
         dGRCAy7X8tizdzqE2tz1Lw6K3yYgTbvMAqmNvJeV1Ui53iLgvdTJJPFDz830Qj/BQmX/
         YpNCBiODm+RBMzSMD1/NWIHw8uiZqpFXKWHmaXA+xhoxhIzbem05Rjf0sNgWxChWIGF2
         CfjUG5uQx4PEZZyhLDBMZ8fCJHb4Ol3/JxxdqrI5iHEJDCYfwIp+Zzjoh/EXz00LI0QF
         MIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776800305; x=1777405105;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2e0TKxjpXGN0t5xUf6j3MFPELJVwvbaTnpZJeQDZ8C8=;
        b=RxJknJ23YRd8SwgdmhT1bg1OiWyH/Arj/KKs8b9+sfGD6gUvBuMXVIeO6XEZiAoV9L
         c+MjTYd0oV65+uycBLz7xugw0OWrkc6KrcaPJp5topQY1/N5Gfaop/m+5Sw6R1wIx59s
         A3rytVeHN8ZdacnValI27/WqquCnRsvCNKu/kp3ZMS/BfrCtlIFupiAdKGI/a3geq3kg
         alPCe2M661sqOLjb8Rxm4ae5LmmUzt2Iqtp6AsikrFth1m8oNUdNtpUfVWIoWJy8h7BH
         ann66IFFGHTx9qFdgbr1+pSaRjD1NOWpPUxromPOsHj7Jk59Vi/CCYnFt4PCTVS+1UjE
         Pb6g==
X-Gm-Message-State: AOJu0YwWo8FFBDnf4wDXDy76KnpK389OOfDiRpoxDATcMBe9gQXk/yMA
	TBDWLXiiPz6fqORr99luNDwz99BIk0WlRkb15Tgn9B3HPngB+N/F9jaQUokG7A==
X-Gm-Gg: AeBDiesFR2/lY2MaKRha+3n2mCP5Oyr6tU+BvEmVD983gVzdK8lfZNt6YDNB8NxWKZf
	Xt1PNaiySfRpyPQQ35QBkjFlEQjGDKb9xZfRYXSALLOdK6wzPpxARVdjZD04H8XBN0BTBGPJ+5K
	M6itbuh4FO0mQtZFFjR3lUyW61TvSf7B5zA+XygP0bnj6qY574MemGxJ0UvOwSCJ9bFtWTLzdu6
	Ko9AbEjDe446StDpbEKTregLvXZeReLN+Xtu0kj/ku6cR5AVbfI3du9JteE4NJC3Pm3JQD5Vfaq
	aMCMUCXJBbglxkktxDJWp0SFqHSCkgWBeCRdrB6jbNMU2VdfXmrzCp/0aRikJ5kw6/9RwI+5LPH
	9TciZdylR3AX/wvFB55xIw4LuhukwMB4gghW6h6TqeuC2D1kIF6GTdHfJ81X8d5ZKw9DJkZgbyr
	8osglGwGg/9Jxnmmv6NwheLvR2/FE9k6yyRSSdTxFabpirrGuOW0a0hUQpRWkruap2mLoR
X-Received: by 2002:a05:690c:c4e9:b0:7ba:f1a2:a470 with SMTP id 00721157ae682-7baf1a2a7a2mr97154747b3.1.1776800305008;
        Tue, 21 Apr 2026 12:38:25 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:2ac1:99d4:1cef:9896])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee99b964sm59521487b3.23.2026.04.21.12.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 12:38:24 -0700 (PDT)
Date: Tue, 21 Apr 2026 15:38:23 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next 1/2] bpf: Implement dtor for struct file BTF ID
Message-ID: <aefSL_kZ8GSbpdfH@zenbox>
References: <20260420203306.3107246-2-utilityemal77@gmail.com>
 <20260421010536.17FB1C19425@smtp.kernel.org>
 <aebef2Mz9fLoChwK@zenbox>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aebef2Mz9fLoChwK@zenbox>

On Mon, Apr 20, 2026 at 10:18:39PM -0400, Justin Suess wrote:
> On Tue, Apr 21, 2026 at 01:05:35AM +0000, sashiko-bot@kernel.org wrote:
> > Sashiko AI review found 1 potential issue(s):
> > - [High] bpf_file_release_dtor() directly calls fput(), which is unsafe in NMI context and can lead to a system deadlock.
> > --
> > 
> > commit b9990bf55467191e86e004a62cdb84e6dc71b794
> > Author: Justin Suess <utilityemal77@gmail.com>
> > 
> > bpf: Implement dtor for struct file BTF ID
> > 
> > This commit implements a destructor for struct file, allowing it to be stored
> > in a BPF map as a referenced kptr. The destructor calls fput() to release
> > the reference.
> > 
> > > diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> > > index 2bb60200c2665..ee5ceb82e4f81 100644
> > > --- a/kernel/bpf/helpers.c
> > > +++ b/kernel/bpf/helpers.c
> > [ ... ]
> > > @@ -2752,6 +2753,13 @@ __bpf_kfunc void bpf_task_release_dtor(void *p)
> > >  }
> > >  CFI_NOSEAL(bpf_task_release_dtor);
> > >  
> > > +__bpf_kfunc void bpf_file_release_dtor(void *file)
> > > +{
> > > +	fput((struct file *)file);
> > > +}
> > 
> > Is it safe to call fput() here?
> >
> > BPF programs can update or delete map elements from NMI context (for example,
> > in BPF_PROG_TYPE_PERF_EVENT programs), which will synchronously invoke this
> > destructor.
> > 
> > When fput() is called in an interrupt context, it adds the file to the
> > delayed_fput_list and calls schedule_delayed_work(). However,
> > schedule_delayed_work() is not NMI-safe, as it attempts to acquire spinlocks
> > such as the workqueue pool lock and timer_base->lock.
> > 
> > If the NMI interrupted a context that already held one of these locks, won't
> > this result in a hard deadlock?
> > 
> > Would it be better to defer releasing the struct file using an NMI-safe
> > mechanism, similar to how other BPF destructors handle this?
> > 
> BPF_PROG_TYPE_PERF_EVENT allows the kfunc bpf_put_file which also just
> calls fput().
> 
> So if calling fput in BPF_PROG_TYPE_PERF_EVENT is safe for
> bpf_put_file, why would it be unsafe in a dtor running in the same
> context?
>
Disregard.

The AI was partially correct, but my course of investigation revealed a
real bug / reproducible deadlock in upstream.

In addition to my patch having an NMI unsafe dtor, the existing dtors
are also unsafe in NMI handlers.

I was able to make a reliable reproducer that deadlocks the kernel with
the task_struct dtor on upstream (without this patch).

I'll send the full report in a bit.

Justin
> > -- 
> > Sashiko AI review · https://sashiko.dev/#/patchset/20260420203306.3107246-1-utilityemal77@gmail.com?part=1
