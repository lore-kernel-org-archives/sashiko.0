Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF473D646C
	for <sashiko@lists.linux.dev>; Thu, 23 Apr 2026 21:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776980690; cv=pass; b=Qwdbx11F1pi2WrAOuDiR/DPTgVymIReO0xJDDA+Iff16a2dBiM4QtHL3N7OquZX1HajloC3ApDFQFWr1MUUZsdq6o03DAlgryd42NYwjwNMoQv1S213gVH63nZhVVAgOQ/Ihuj3myO6w+jIWFfKZPrAwNLvLNBJW3SqsGTYhmIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776980690; c=relaxed/simple;
	bh=OU471vN5WHbf/E97j3Av4mFhucZsFb2ZlukPT180myo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f3Qz0a2fGDH7MY6r8XoVC2tHJ2Lxao9uoYfbiebz16S1o1l5tl7hn3Or5/Z3FRKWUvqXF0y+kBYPGgzh0G7rq4N1MmTwcD8OhDrN8fnc9/9tkCfEHkXAPUl6XX4G9TkWw1e94CJwUFcLHnQOJ42C7RM/1lmtj7RPR2Wb8bxi2Pw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s02YscsF; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s02YscsF"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7a469383e0bso57584657b3.2
        for <sashiko@lists.linux.dev>; Thu, 23 Apr 2026 14:44:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776980688; cv=none;
        d=google.com; s=arc-20240605;
        b=Vqimj+kHDv9M5vJZ7QUqf9rxgMWKXceUEE+xyRxRpwjtp5C4W3RXuN/5RYZhrzppV8
         PmjjIA92TVNjpvFK+cdTSiw1AUCsCJEhS8IsnD8fOa+oM0vQoUlB9aQedSrGEd04C+b4
         jhJY/EVl59lowXV5VwyYE9OpI58J47F/FtncyzFgQuRuql65hiEjFFYEXEtRzfls5RMm
         ezTY/WGuquXaR2LfI8kMN0mTfe80Fn5R3/0VREAMMRdeX6csuNNKo7LWygxFL3wmpliF
         iDhqmcJ6QXJW6Qsnqq+FYP+Yr8ocHU5JRq5YFPuR0EG2hT8oW+kcMZ9o2ETU6G9PmjST
         QHVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OU471vN5WHbf/E97j3Av4mFhucZsFb2ZlukPT180myo=;
        fh=jK8kwTgBpCM+pWLh7Jr8ML16X1eQBKiWMvcmmRavBIA=;
        b=Wh9NY6ovyTNS3ihnbq2bJiIWFxE91qTILBw1lTJkKmcqjMeBwr/Zj/2JHVmLR8n6Y7
         fgEyga5BI5KogfYpXEkWbPxkPCTBiUDU/QJVzPcNquioCxXyTbma/rIJvNXK7PRPWSCF
         Jnk7ZLxDk/3s61rt8+FEjBtjBvfernKZ9LXcDj+iSKYKuxHWOA0I2HMsDXHjTO3YmOCs
         k9IeK8Mdj0FVDQ3JTHebC5C4xQiBoYMYnINsbmlYE5IhBbovZr+rhyFnjSXeq4pxP18R
         cjzD1swZj6wTtPBLXmGIe4SS2A8DijkeLhId1B4vsZtFI9WPoYI3DluyWuxDbkyvwuUA
         gwag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776980688; x=1777585488; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OU471vN5WHbf/E97j3Av4mFhucZsFb2ZlukPT180myo=;
        b=s02YscsFD4QJCSMIKVtXAIFte2765HIv1ZGtozu1oyYpzhlUAl4LXkKFqdclzJuQby
         o/FI+waraoIy6z++R/UXcUh9O2CF0yKOpWk1UypKIGpT9z4dHF7pUkNKdQ+hAVNvfeOj
         6rTwmNsIny/aYcze2CITM7Zg0jjDMksIWCsVQjCusNv6Hp0qzoJ2vKV5nmN/lE16F/m/
         RIfjJ1GEgVKWLhYm0/SGu/egmopuW6ZHeIaN/HXkShW7O4BXe9/Ru05mptxE8twSJJQH
         D4qcwKVIJCqJjMfi8vQyCrzdPTaKQFHpCVtC74nE9fl2rc0Q+pFOm11hOBa8Zo5eRWCZ
         eeBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776980688; x=1777585488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OU471vN5WHbf/E97j3Av4mFhucZsFb2ZlukPT180myo=;
        b=BnUwSyv43FlX0Ek7txbyIWPP0GB63M87aTHMgrz3TebcQXFkCzrAUdwepQ4OaA+Ed5
         2HpSDAwQG62LlkxOi2o+3ZZbrlzmDwLgU18QTAahXcGPpCMR6skF/SevRML+UltVeN+z
         9V53YWNwV/sQ8xAfnA6kLqgLY/2488DTu86fCFwtI2GUgZ1Z0Qo/s2diz2M1smWXYkz4
         289ZYevELuXT8ptBktXAjs9OP1urTud5NftfIQWJ3n/Rnuh5fJRfaPmSumhvjW5E8WuU
         Ra+p8DchseYMoqDlZTewMHIp4ju/gMCA+zd0LkcmOUsCvwYEjT/Nyts8iPrDJWxxrFrZ
         ty8A==
X-Gm-Message-State: AOJu0Yzi6dMgXBHoL0i/79BfA8Ftg5gQg6nbaeHaZi+eOCPdWMyhwDAy
	S7AMUvL2uL9GJ07Irqt3cCIqZL7neGX7XsQP6qo07q9Z21XJbXYOxK4S9W193vBSxoknRQIT5Ey
	0bi6iSxDkev/y8fu/wniAotxE77NPL1GsGA==
X-Gm-Gg: AeBDietBJA1L4EWVf/kX7t7ZDLfNNps5gT4yQQ6V3B9tN6HWolmOlI8T2AKJ4hZRcHT
	BpJDaA24+msbP0WAx4xc3OURUo5J2VtobhQ0g0yp98IpeNGIdMPyb02WX5Hpa+EIeJIcwsgbDkg
	3jmzwlB7hD4VkDrLRb/uhJFgNrOnbogXALy/P3CZ35t55tfFEryQL1G3wmWeLF5xqz1Q3+XAik9
	omBgiWYi3SEg2MaRLKjTkYaX+oiLh6RYKZOanEsbScMkl/Gw9KOTwkMQYuclRW7O/E6hEf1VBd8
	A5Jv4Dx/4qCol4jhBZZ7Cjv5Sr9W7/8=
X-Received: by 2002:a05:690c:ec3:b0:7ba:fd82:9105 with SMTP id
 00721157ae682-7bafd8295d8mr164498907b3.29.1776980688264; Thu, 23 Apr 2026
 14:44:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260422065411.1007737-2-bestswngs@gmail.com> <20260423073813.13F29C2BCAF@smtp.kernel.org>
In-Reply-To: <20260423073813.13F29C2BCAF@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Thu, 23 Apr 2026 14:44:34 -0700
X-Gm-Features: AQROBzDfAuSwpbDqZsnLm8Fw4sOOGcDz--R2aLvplRKQ7njUWJRtN5OHHs55hjw
Message-ID: <CAMB2axOh3J92OEL_y0UOe4tpWf5sD=tkybE+gDigqiGBD+cXCw@mail.gmail.com>
Subject: Re: [PATCH bpf v3] bpf: Fix NULL pointer dereference in
 bpf_sk_storage_clone and diag paths
To: sashiko@lists.linux.dev
Cc: Weiming Shi <bestswngs@gmail.com>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 12:38=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 1 potential issue(s):
> - [High] diag_get() leaks uninitialized kernel memory to user space when =
dumping BPF map values containing special fields (e.g., bpf_spin_lock, bpf_=
timer).
> --
>
> Note: The format of this review has been altered to provide a free-form
> summary without quoting the original patch code directly due to recitatio=
n
> restrictions.
>
> commit 32307cca407ebdd5cf1feae057cd9956ec19daa4
> Author: Weiming Shi <bestswngs@gmail.com>
> Subject: bpf: Fix NULL pointer dereference in bpf_sk_storage_clone and di=
ag paths
>
> This patch addresses a race condition where a concurrent RCU reader in
> bpf_sk_storage_clone() could observe a selem with a NULL smap, leading to=
 a
> NULL pointer dereference. It adds NULL checks in clone and diag paths and
> updates diag_get() to take the validated smap directly.
>
> While reviewing the changes to the diag_get() function, I noticed a
> potential pre-existing issue regarding how map values are copied to the
> netlink attribute.
>
> Does this function leak uninitialized kernel memory to user space when
> dumping BPF map values that contain special fields like bpf_spin_lock or
> bpf_timer?
>
> The function allocates space for the value using nla_reserve_64bit(), whi=
ch
> reserves space in the skb but does not initialize it. It then copies the
> map value into this space using copy_map_value_locked() or copy_map_value=
().
> However, those copy functions intentionally skip copying special fields,
> leaving holes in the destination buffer.
>
> In the standard bpf_map_lookup_elem() syscall path,
> check_and_init_map_value() is called to explicitly zero out these holes
> after copying. Since diag_get() does not appear to initialize these holes
> before sending the netlink message, could uninitialized skb memory be
> exposed to user space?

Sashiko is correct. Special fields need to be scrubbed here as well.
Will send a fix.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260422065411.10=
07737-2-bestswngs@gmail.com?part=3D1
>
