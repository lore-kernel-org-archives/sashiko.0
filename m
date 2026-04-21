Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED49261B9E
	for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 02:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776737924; cv=none; b=NLq8Me5GHkVCOS3ewAD/MDrxsFGgml83qPgNBW1nOhzQUG9qtJ6TMePcwH9jUWrrJoZJab/bXBmcXmI/cabD2LMUYM+icXmxrGHiMPeXj2t2ASVv2J9KNeksH9Yi+W7ALgVnLISbWraCyL5Kt1M8W8N1FbPP55hiFirk0bQxSps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776737924; c=relaxed/simple;
	bh=8rGyBy/ZRN4q7EJ1m1I1QzDr+63hTD5LpQQ0JkAgNIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LUNkxbprSEUJGDfHVDmQOVnE3kb90t5WNevTe6L5GASwWOGUDLFMHqq5zniAZO9QCMYkyA3LVqn/9/t7LTMuIRabpctulbPitNSRQSPm71qu1ayQZASH9Vzo8mguf99Vr9Jlm+rjC6OKYOuO1IQG6hegU7Q/+I5X+kKF0GIHjvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2HKowBY; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2HKowBY"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-65013b72ae3so62969d50.0
        for <sashiko@lists.linux.dev>; Mon, 20 Apr 2026 19:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776737922; x=1777342722; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xCNeYMOizsEqn4WcsJW3FhU4jSP+KC2SeVh9elSYjU0=;
        b=g2HKowBYAGS02IUJI0b7iJPzZLAC1XwHVqlwgM//xYetVciHjVXfMrpdvTi7nPjX/h
         5MElrTtnNtb7wFrWqKqqhD6ZAXM1QT002X+UaPr9jYBn/I2b0T5YiGyxUrvRN6L49iXU
         tEpRlE3kWNyQ8XxayM9+/folKlXsv4H7XlxGJxv4bZEL8xcDmRCcV0gbWHTaVoI7aabW
         6ZZKLsiSiygISvuPVfbS4mUbM0UaA/05E0AFQFD4ZJrdm2YfCUaZpZAr7eh2HB3oU6t9
         cMgeA0kL9MJXIeRtlwidVxEl9LtbzfN+ZFAhpAYrPmJXYZcfl5i7ukolnAdglh/RiDnq
         8s/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776737922; x=1777342722;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xCNeYMOizsEqn4WcsJW3FhU4jSP+KC2SeVh9elSYjU0=;
        b=EJcM4GFX7PJp0RrtJPHWNUXV3WBc5ZMycP/Qea7hHcXe1DWgYLPo6iJTptQNT2dEY3
         eksjV1iCZBf86SfvnfQPRgnaUm3usL62jyY7Mk4rBjplNcKX0+O3qBTtHVbJiw6ZGByT
         XA/CHMiVTCdBLrXpIYUqjDeNCOlKTXsBWzQ+267/N/3rWncbiJM1COzZ8FcrsvnXsSE7
         cZdZpFO59EMs+RB9JAiTsPT3fPhg5RBmfXke0YJuM10RR5tM84T7AUhKUnTV4P7inPRy
         nMez8jqQNJxNqI/fbRL6XMhXIdwM1lDkGQRQRr7yqDuYn3MMr3HP2HAQNduDlPtzgFBj
         njjw==
X-Gm-Message-State: AOJu0YwJ6GyBZUhMAfcXUSOuLhTFEPWYnMXpqgcC0t2BzSe5XIhzVykp
	bpiOCt0PiDkekSgPJPRCzNxfCBwGAcRsceUA8/5qs2SiRmMj7+zGfftt0awikA==
X-Gm-Gg: AeBDiev6b50D3/atqC12G+aGXeHGVh4AVPLewL9Kc3rEF5+T0leKu0MqEuc+CQQCCUU
	nz0P+yRzgmS2vhQlQ7Bw2c/sb68gRpykmzM9nZrfr/RNmW7z7M+bQ3RLR1mhWZ24n/XS0jTUZCh
	YfTXl6J/5+LoLDbhHwfL9LUakP+2Hrel55wqGBcGf9MhLTVMTH05ITxYELOWxY70igurfYgora7
	/GopiAUIkqNGpBWFnDymDpjB8EjjtoE/6qMYeVsRxguf3JE4/M7DYl7WEeMy/xgicvoUdQMdC1c
	frf/8CqLUSmTCUccPCoRZpyAXXHMhPbky/oNpK+xwibv7XS6UpDeeRUcZb8CQMPofoRfL+iCnnO
	NkhvyAaIHDI3nM4vXhrD7CR5BXHXCY4dKmK5hNY4Nztb6oKGrsRJmR5vkSr+IuSR6IdlEDskK64
	bcnUKjok13LIID3cxZ8WlUlOj5SEtl5C+7fFsegMFa7W6gW/FoRZK0tjEWI77f5R7B5grx
X-Received: by 2002:a05:690e:1913:b0:652:55ec:6a2b with SMTP id 956f58d0204a3-6531086f9a7mr15307746d50.25.1776737921945;
        Mon, 20 Apr 2026 19:18:41 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:2ac1:99d4:1cef:9896])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65314e32a25sm6094684d50.13.2026.04.20.19.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 19:18:41 -0700 (PDT)
Date: Mon, 20 Apr 2026 22:18:39 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next 1/2] bpf: Implement dtor for struct file BTF ID
Message-ID: <aebef2Mz9fLoChwK@zenbox>
References: <20260420203306.3107246-2-utilityemal77@gmail.com>
 <20260421010536.17FB1C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260421010536.17FB1C19425@smtp.kernel.org>

On Tue, Apr 21, 2026 at 01:05:35AM +0000, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 1 potential issue(s):
> - [High] bpf_file_release_dtor() directly calls fput(), which is unsafe in NMI context and can lead to a system deadlock.
> --
> 
> commit b9990bf55467191e86e004a62cdb84e6dc71b794
> Author: Justin Suess <utilityemal77@gmail.com>
> 
> bpf: Implement dtor for struct file BTF ID
> 
> This commit implements a destructor for struct file, allowing it to be stored
> in a BPF map as a referenced kptr. The destructor calls fput() to release
> the reference.
> 
> > diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> > index 2bb60200c2665..ee5ceb82e4f81 100644
> > --- a/kernel/bpf/helpers.c
> > +++ b/kernel/bpf/helpers.c
> [ ... ]
> > @@ -2752,6 +2753,13 @@ __bpf_kfunc void bpf_task_release_dtor(void *p)
> >  }
> >  CFI_NOSEAL(bpf_task_release_dtor);
> >  
> > +__bpf_kfunc void bpf_file_release_dtor(void *file)
> > +{
> > +	fput((struct file *)file);
> > +}
> 
> Is it safe to call fput() here?
>
> BPF programs can update or delete map elements from NMI context (for example,
> in BPF_PROG_TYPE_PERF_EVENT programs), which will synchronously invoke this
> destructor.
> 
> When fput() is called in an interrupt context, it adds the file to the
> delayed_fput_list and calls schedule_delayed_work(). However,
> schedule_delayed_work() is not NMI-safe, as it attempts to acquire spinlocks
> such as the workqueue pool lock and timer_base->lock.
> 
> If the NMI interrupted a context that already held one of these locks, won't
> this result in a hard deadlock?
> 
> Would it be better to defer releasing the struct file using an NMI-safe
> mechanism, similar to how other BPF destructors handle this?
> 
BPF_PROG_TYPE_PERF_EVENT allows the kfunc bpf_put_file which also just
calls fput().

So if calling fput in BPF_PROG_TYPE_PERF_EVENT is safe for
bpf_put_file, why would it be unsafe in a dtor running in the same
context?

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260420203306.3107246-1-utilityemal77@gmail.com?part=1
