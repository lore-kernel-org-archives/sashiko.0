Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B88C359A91
	for <sashiko@lists.linux.dev>; Fri, 24 Apr 2026 23:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777072849; cv=none; b=PpBuycYNDsBeF4qKu/mALyEfPRcAiymdhp4QHogpPPWV6gnhvipXxC9uGMIts06TTmLxr98jsVZpUqXXV3XHtCS1wnvh7m7RnDDBn8MtaWz+RKuP2UT40w5vV8npLmoYhdxIl9G1hmF6SZrKx3hXZ1IYoMiLGSMp/OJfotwFhsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777072849; c=relaxed/simple;
	bh=dgFCF5P7v1dzu10VkbpiYjCRlLibMMbntJJJrYltWZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGrMPuisORZPv+i4PQ9+BONX8rh0vnDbL6o+HQU8SPkMH4nW2l5KlQDFTyGkoeVXIBWwoENzvw3B8a3ObJRmLAkz+A5XgNs7V8thret7Krd64o9KwX3HnHdysBLMcSrDij6uHJ49jpC8QjKiMwty5VQEeUosvaEooZtJfXgUaRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RvO8+FkP; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RvO8+FkP"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-65075c2ba66so6678570d50.1
        for <sashiko@lists.linux.dev>; Fri, 24 Apr 2026 16:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777072847; x=1777677647; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iCIji13baonMmgPO0ajNnq9HOSixeTXLQT62scUgHDU=;
        b=RvO8+FkPvY0xgeACawV6Zy3zWeElsU95MRgtc80O9w9w4/bCTHiUKp2zP10q6yEU5V
         yMtaHxr2RTRfr9tH5SuEq1hwpu9BYOabivZhEVXHD1j+im9aeKyVKUqbp08iId+09zoP
         fEDjAxC4IFWlB8nNWsikxjVbqwlrPj65EoSqJNPd5R7sTbzU3v3uwuIIu/fhr1yaZwVo
         MyMJtCwWA3DTSe2GYHwHG/El/VqjvpVquawyMyKefx9UsH6WvIK80EP888qjnynwu6Va
         C8kVz6ZuICbjZphTRlD/R0N9kpgf8lnjzDQz2Vb7RbUMfwSJMgrpCs2VRL78IeLbpepH
         BkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777072847; x=1777677647;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iCIji13baonMmgPO0ajNnq9HOSixeTXLQT62scUgHDU=;
        b=NShJi7tX77dnD/pvQ7ep7vBFd7upb5b8kgHXg/9xgNJdUHb/zqqhHl12eEyGsSk115
         MG6aYoc+yZMW6fEoq3TgrTL3hxQuAdliEkC/cIjMvIgixbiedCjbUK/ncUvmL/CwrA8R
         +j2SYOnwHhf1NcHHcI46QSbBGBHntj+kwvD8cEjrUPut0acBFQRtnhLtfqd4z0EqmGnw
         +NnthYIMHgymVn5hni3txIA+W2u8I06V4YLuZIRvNAGfFx3CC+muZd8sjptHbvpWdNzc
         0EjKrn9VmHYxCmF7a2fWOXKYdOxsCB5uf+vSkVjdimGjS+GbMIwVN0TgJgfhixu8W2eg
         jR/A==
X-Gm-Message-State: AOJu0YyV2cPtkn4cye+d7OGo0ZUuqMWpuyG3H0cfUvGviWSICn6XjzEs
	AVRHyKa5aosF+UB/TZNJAV6UyCSoFWtAQAMh++nnoJrT4njSXmuJ/jXz
X-Gm-Gg: AeBDievD4HsasdPkqmFtw065rXiIFF+UzuwN2s8kgGHpvQfrrAMaUJGiIc+3jbid4nq
	KZVOAJ8RrKJgEiSaFrmSfpNWJugNTrmf1kzDhR++TkvZLJeW1oYciVQi4Prh08pcL59QiZHX2cC
	unPBXGJpPnoVlSWikfBguT+W4MVL9IpOgsH2oeh7Xwx2NsRjaanbIeyA81LdvnlZimhyA3YxxQl
	qHsh/nGqZD+++0Dpri0+qaqR4xvqDqu/kCXcSQ76xINbzul2WyTKd8VGYyzO1g7XsHzt1FGtA0o
	7K9j9gZYTfkXoFXgX4S1tk0UFGjVwu5NkWSeaFgD+/39NCwS0eWVM+ng6jxtsyaDs0tbEMjoj4b
	KVvkfGJTBHFwT6aJfblI3LBliRw+XaF/mbpd1MQq9lRCaOoeCCc3H6FcjWOwa3XyY2mgSFrtP8+
	8PnatKHfEqJfJjiru5jnI0h+L4zG44knQeVtAcVGq5wr1TdprvETKqFz1p05uY3Y0QZmlcrZw4y
	Ew5LQ==
X-Received: by 2002:a05:690e:128a:b0:650:1cf8:f608 with SMTP id 956f58d0204a3-65310a62a92mr32055488d50.45.1777072847319;
        Fri, 24 Apr 2026 16:20:47 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:cc96:e003:f6cc:4ed])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65314b5faf0sm11182555d50.5.2026.04.24.16.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 16:20:46 -0700 (PDT)
Date: Fri, 24 Apr 2026 19:20:45 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: sashiko@lists.linux.dev, bpf <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v3 1/2] bpf: Implement dtor for struct file BTF
 ID
Message-ID: <aev6zU2vj6wmaRMG@zenbox>
References: <20260424192252.695240-2-utilityemal77@gmail.com>
 <20260424195958.AED4EC19425@smtp.kernel.org>
 <aevOssMWH_Vm9CPG@zenbox>
 <CAADnVQKFtuX48V9Yy88GHGVbQyY30M3b3YBvZ2PmYt_-jbohpQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAADnVQKFtuX48V9Yy88GHGVbQyY30M3b3YBvZ2PmYt_-jbohpQ@mail.gmail.com>

On Fri, Apr 24, 2026 at 03:05:47PM -0700, Alexei Starovoitov wrote:
> On Fri, Apr 24, 2026 at 1:12 PM Justin Suess <utilityemal77@gmail.com> wrote:
> >
> > On Fri, Apr 24, 2026 at 07:59:57PM +0000, sashiko-bot@kernel.org wrote:
> > > Sashiko AI review found 1 potential issue(s):
> > > - [High] Calling `fput()` directly from `bpf_file_release_dtor` can lead to a hard deadlock when invoked from NMI context.
> > > --
> > >
> > > commit 6368f91be1fd91bc9cb38d3498f35d279bad04c9
> > > Author: Justin Suess <utilityemal77@gmail.com>
> > >
> > > bpf: Implement dtor for struct file BTF ID
> > >
> > > This commit implements a destructor for struct file, allowing it to be
> > > stored in a map as a referenced kptr. The destructor calls fput to
> > > release the reference.
> > >
> > > > diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> > > > index 2bb60200c2665e..ee5ceb82e4f812 100644
> > > > --- a/kernel/bpf/helpers.c
> > > > +++ b/kernel/bpf/helpers.c
> > > [ ... ]
> > > > @@ -2752,6 +2753,13 @@ __bpf_kfunc void bpf_task_release_dtor(void *p)
> > > >  }
> > > >  CFI_NOSEAL(bpf_task_release_dtor);
> > > >
> > > > +__bpf_kfunc void bpf_file_release_dtor(void *file)
> > > > +{
> > > > +   fput((struct file *)file);
> > > > +}
> > >
> > > Can this cause a deadlock if the destructor is invoked from NMI context?
> > >
> > > If an NMI-context BPF program (such as a perf event tracing program)
> > > updates or deletes a map element containing a struct file kptr, the BPF
> > > framework will synchronously invoke this destructor to clean up the old
> > > kptr.
> > >
> > > When fput() drops the reference count to zero, it calls
> > > __fput_deferred(). Since in_interrupt() evaluates to true in NMI
> > > context, __fput_deferred() bypasses task_work_add() and instead calls
> > > schedule_delayed_work().
> > >
> > > This leads to the following call chain:
> > >
> > > bpf_file_release_dtor()
> > >    fput()
> > >       __fput_deferred()
> > >          schedule_delayed_work()
> > >             add_timer()
> > >
> > > The add_timer() function attempts to acquire the timer_base->lock raw
> > > spinlock. If the NMI interrupted a thread that was already holding this
> > > lock, the NMI handler will spin indefinitely waiting for it, resulting
> > > in a hard deadlock.
> > >
> > > Would it be safer to defer the fput() operation using an explicitly
> > > NMI-safe mechanism like irq_work_queue() to handle arbitrary BPF
> > > contexts?
> > >
> > For (human) reviewer context: The NMI stuff needs to be addressed separately. [1]
> >
> > I guess the AI isn't gonna understand but just doing irq_work wouldn't
> > be right either as it would break operation ordering for maps and
> > fixing it here wouldn't fix the other dtors broken in NMI.
> > (cgroup/task_struct)
> 
> Will break operation ordering?
> What do you mean?
>
Basically if we just did irq_work_queue for one map op and then we do it
again for the same irq_work it will just fail because the queue has to
be drained before we can schedule more work.

So ordering can't be:

1. irq_work_queue
2. irq_work_queue (again on same queue)
3. hard interrupt ends

It has to be

1. irq_work_queue (everything)
2. hard interrupt ends.

In the first ordering above, step 2 fails because the queue has a
pending item.
> I feel we should fix things first before being subject
> to more of these bugs.
> Why cannot we defer to irq_work the whole map element if in_nmi
> and call all dtors there?
irq_work won't work if there's pending work already. It will just return
false and not allow you to queue anything until the task is over with.

So it would work for one element, but we'd be stuck and need another
free irq_work to free the next element.

So we'd need an irq work, one for every element that we free.

So either: 

1. allocating memory for a new irq_work on the fly, which is an
operation that can fail. So if we're under memory pressure the
element never gets freed.

2. preallocate an irq work for every element ahead of time.

...

I think the solution for this might be to just reject any kfunc or dtor
that isn't explicitly marked NMI safe from any programs that may 
run in NMI.

With a kfunc flag that marks it as being nmi-safe. KF_NMI or
similar. And extending the concept of kfunc flags to dtors to handle
them in the verifier as well.

My reasoning is:

1. it's very easy to inadvertently introduce new kfuncs/dtors that would
break under NMI. (there's two examples in upstream, task_struct and
cgroup dtors).

2. There's very few NMI contexts reachable from BPF. I only found three
cases, tracepoints for irq_handler_entry irq_handler_exit and
nmi_handler.

3. If the user really needs to no nmi unsafe stuff, why can't we just have them
call bpf_task_work_schedule_resume_impl which is designated for this
purpose?

Justin
> should be a simple fix.
