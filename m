Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D5F2BDC29
	for <sashiko@lists.linux.dev>; Thu, 21 May 2026 14:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372284; cv=none; b=MU2Oh/QJigPgNuzSwoXzrDXe+W4xP+fixAmTaNoBWX9d3wPOjWTnGNT4l7VhuZfrNmDHQ7ed9wpkyw+et7FRsgRbjK3GuPn4sshbpVwgnaQzLpmQeQMw8Ja9srk+5Ff3WwAWbsEeeyo+3aB1gSF+Aq5erFeEJ1jKUDOpWJHw1FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372284; c=relaxed/simple;
	bh=NnstC5Hke9f+n/cl42WhEXFSYAsNvzvaQit4caagZaM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VvV7IaknsNw4Vq2W3gKLT0/O+7BM+2aby157gveDic5D/k7jV9yRxw9YPDsr+osmB10frUYzLn0mbc4G5fBhUjx/lPvhbg1rOJFgFfmBOYe9Kgc6KWGg29Q4RhI3djw8zGuXzhTtrzDUSHhUsZebK+rD6nE1jFarnNryDQoT6Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FmqprlIv; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FmqprlIv"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82f6a5b4f88so9647468b3a.2
        for <sashiko@lists.linux.dev>; Thu, 21 May 2026 07:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779372282; x=1779977082; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hUtO7rz9VBhPIeAyEinR1g2aBGB2g8CuUCtOdEHoYPA=;
        b=FmqprlIvNnrqskZGhMx3Ww0a8QDgUwXiN6H7ivmZh75UizQYp4k3fbax1frIWknec1
         SDJCXzNa12SoOZNMbNGQUawYF6XZqgKcOqGvT3tpt7Vk0DQ3lLgQWYsS1eHJliypnW/O
         aRKgBAhvB5cGaAlFb/iIBlp1bsKz7m5SKTL3ZrUDwjtPxNjIL6kwUGHt+lcSykXXKUeh
         taOSRL8eqHUOHxVHuuGZqGHopdIgxJwk6ZIfGRa7mkZ50A2+pIuQZ74svIZLbBYsiQ0c
         BnJXzLIp13AZnsQPv+5BPGU4VJgq/JU0G0VM8NLA7PCaMgKwrED32V5UoTkYIm4YnsFN
         8IgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779372282; x=1779977082;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hUtO7rz9VBhPIeAyEinR1g2aBGB2g8CuUCtOdEHoYPA=;
        b=hVwoaycV02LA2f6Y1dRl054yxIrE25MOZsi5o2INm2tAnT/SpiOHjRnP8gug/reg5v
         RsCWsfUPDqKhKHGx3kcLLSXVEz0HRnjMOjEaD1BPAURHPF6OyUbyPtZV0/UUagVl0L3t
         M7K9PjDgq8FQGoIuS1hOEMvz9OBlu+EAN1IzR0ok63P3Tc91OFAIk1EUWR+U5d5QO99s
         mIvv2FhT8uQair5pZTvdR4WeF4cDxqNPlxNNzF/a32sBNsCM4tNkjDqYaXbo4tDz6Emw
         9ved8Gg+xWGgPZt99WjkYLz28TSaebt3XJf366nnUaQWKwLW34ULTpygJpCHiP0Xg0Hv
         +0cA==
X-Gm-Message-State: AOJu0Yy/lpM8xBCuNSj4cWcO+O4qI8fSKP/fjYs24dp2w2H0uC9580Tx
	W9ASzYycMbQOw99mCtLDzeJ0OBsE1wuG8Tq+9ZxVNQc/aNfY+BjJxJd6DL6+Kzpm0fNZQqlWJ90
	t/8nmJQ==
X-Received: from pfblg6.prod.google.com ([2002:a05:6a00:7086:b0:839:7c0f:3e02])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:21ca:b0:83e:e05d:ebb
 with SMTP id d2e1a72fcca58-8414adf7bf5mr3255925b3a.25.1779372282132; Thu, 21
 May 2026 07:04:42 -0700 (PDT)
Date: Thu, 21 May 2026 07:04:41 -0700
In-Reply-To: <a75397bd-6122-4fa8-8197-334b2fbbb5af@linux.intel.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260508231353.406465-2-seanjc@google.com> <20260508234018.F06AEC2BCB0@smtp.kernel.org>
 <ccea937f-8ad5-4a6e-b6a4-917f2ee02579@linux.intel.com> <agZiTeGgRO4PJ9mI@google.com>
 <02461927-589b-4179-9f93-2f9e10172879@linux.intel.com> <a75397bd-6122-4fa8-8197-334b2fbbb5af@linux.intel.com>
Message-ID: <ag8Q-UM5dcVtBijd@google.com>
Subject: Re: [PATCH v3 1/9] perf/x86/intel: Ensure guest PEBS path doesn't set
 unwanted PERF_GLOBAL_CTRL bits
From: Sean Christopherson <seanjc@google.com>
To: Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: sashiko@lists.linux.dev, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, May 21, 2026, Dapeng Mi wrote:
> On 5/15/2026 9:49 AM, Mi, Dapeng wrote:
> > On 5/15/2026 8:01 AM, Sean Christopherson wrote:
> >>> Anyway, we could optimize the code further like below and thoroughly filter
> >>> away these extra bits. (only building, not test on real HW)
> >> Hmm, I think I'd rather figure out what it would take to drop the FIXME entirely.
> >> And if we need to keep the check, I'm a-ok risking false positives until we have
> >> a better understanding of why the check exists.
> > Kan Liang should be the best man who knows the history, but he has left
> > Intel. I would check this with other guys internally and look at if they
> > know the reason.
> 
> Just checked the commit history, It looks the reason of disabling guest
> PEBS here is to avoid breaking the host !exclude_guest PEBS event sampling.
> Host may create !exclude_guest event to profile both root and non-root
> mode, but it's conflicted with guest PEBS sampling in non-root mode. So
> guest PEBS sampling has to be disabled if there are active host PEBS
> events. Thanks.

But that doesn't make any sense, because the host can't use PEBS to sample non-root
mode due to the DS area being virtually addressed.  It's entirely possible that
was pure oversight, given that commit 58f6217e5d01 ("perf/x86/intel: KVM: Mask
PEBS_ENABLE loaded for guest with vCPU's value.") was necessary.

But I'm still not convinced: if that _really_ was the motivation, then I would
hope that scenario was at least smoke tested, and any testing whatsoever would
have crashed the guest.

Though given how buggy this code has been, I suppose it's plausible there was
simply testing.
