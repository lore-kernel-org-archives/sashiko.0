Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA13434676F
	for <sashiko@lists.linux.dev>; Wed,  8 Apr 2026 01:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775612807; cv=pass; b=h77k3gnI2H9Sw3aihtoIzlXOk3NqxRjGctA6NJrcvlpBSxqKBV0u5xVc49h3Mr8x8PrLLQjCwz2Vq5jdxH8QZGRJ0z4zCg3dP8wLiYpP0GytjCt0s4JE/L8CcOAY8kImuyfv57LraLk16jOEEvBgclAwHvBFlbh1vBp7h2rJdgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775612807; c=relaxed/simple;
	bh=QL8IUN7qeXYgh5GSXcwUvniUIl1xDMVEjGQWw4EKe7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OcBlmvHyxRB1BpJSAXXLbzhFvZZm7KlSHL331PF8UHanvDUseT+ZyAEAyLnlkUafyYYQawb2qgG6sqC+XNowlJJUoea8lexe2lc7yrOjVos0OIZTp282jRbk9eVjArSac2w93mngqqgNlMJTH1qR5glGsAM4Huh1Lcaysj2lIHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GJQTpo2g; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GJQTpo2g"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2b2591757fbso26395ad.0
        for <sashiko@lists.linux.dev>; Tue, 07 Apr 2026 18:46:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775612806; cv=none;
        d=google.com; s=arc-20240605;
        b=KMAEy9lnVGotxL97yMxoOSdXmTFtURJKjS0ijcLa9y61tkEqkL+9NsxqF81wVflkio
         vfWpsj/b5OMhsHVX3DpTYeIBNw86PttNPzv53XIv+aSxEX5CPPoxhxaVXYgDcX7i0tgz
         lEw2S5lq2jzMNke3kxRxO3Z88K1UO6OOYFvxOVY6H9Nk2kN4jTphBw96kFUsjxdHvPqm
         /OXzeTaakPuiUzRJ0h3fAWE7gdUa8zdau8CEFUvoqis2LNXIdkpTgI+1gu8Sey1Jyuc9
         R/FjGEG9mDFvqokcSSU+Z+cjgfdqpGv7TzIy4NneVo638dc/AqV2EQOwr75hyyHPvrTb
         MX1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jjOFYF51uBM1+TeixF7rbmpu4qyqW6ZVfp/Ch5IaIPw=;
        fh=7h0izHys8KHgVwAHFbDqh8DXgNjj235aXcN4iZY+6bA=;
        b=GpE1Y5pfXmWzNo4bwtcGbVVjQBdagDffWypu1FiEUF8FVaHwm4rSMqSYP5qjz/liSv
         esnYzw6IajH89WUoV70V5DfvayQVQkkWHCtR3AcyNvmi3Tn6a0f5Ffwy3KGns+VUygH6
         li0gIWcYFNTJHalP4FUOd8qi6EJHT60EME9XXy3kl+H9rBemU1BdCFDHWGmYJZZc8VLd
         WN/sBxfG4W9FYmOwGV9VvNTQreQ97K5vZUGlG1/anVFOwow0HhjzKmLA6Yg+RNHDKeBg
         0PPgni5x43A/cIEz57v7yFIPhcnCLCWeq8FrncU2GPLBGw7Pk3QcXLDB3mEcnTcV0SSI
         n+EA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775612806; x=1776217606; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjOFYF51uBM1+TeixF7rbmpu4qyqW6ZVfp/Ch5IaIPw=;
        b=GJQTpo2gdLnPrKqQnnNveaNqwfd4ZTR1FvGwZFN0vdtF9ligGwLdSYM5DDYvt4mn8F
         KR4KqxtGPSeLL+SPBzutCU6aVUsgmgoDgGBwfrN/5+pCuG9HuRSBY3F+9rktXqDhZwRy
         ezxE4IKMvk84IXG+Pn4J0wruTs2CdZxUVhBd5Bo6zVmwCU30HYLk5iVBgUO1o/jv7xnY
         +6FGX1rZGbjx8m5D4+zFl2AEuWHVfsWmRazLSNuyeGYHdtDMPq1vkZmTwsy2DRgBitom
         A+WN2YmJa2VmVWtgfyL6r7IjVNWy0jgZA9ZuUF/HwhSgrQfVdknyB1HBrYuVG6eKkmrR
         LBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775612806; x=1776217606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jjOFYF51uBM1+TeixF7rbmpu4qyqW6ZVfp/Ch5IaIPw=;
        b=ZdLA633CcK7jMQvZDobclPL10cT34Vpzxic2afdtiC9wybpcQXyK51gZcHrFCHuDq7
         aM1GN+0LIVX3ZLoNAF7gTyfMdDaUCK3uI2f40NgzAW2U9fgubLJQxF2X0d2MleiMgnAG
         u14FRghgbMEb/Ewa2ECR3iMaODvVX52WhXgbM57Z0q8t6Me1mJjBFeP2Wwr6Nsupw+/s
         mqsOznDL8HFzLXt5rrfRdUTdSKO6BnFSfDjoEHmpPnfQml2rc0zOmAoV5F9OcTcFCrtf
         i6T1kf/uvBgSRWO31b+V4upv+hhS4OfDJagigBsBXg/8Y0VtvveZk3vowpsryA/AVfAX
         Cw+Q==
X-Gm-Message-State: AOJu0YxyRAz2D08Cz3rHRwWjKHBZYQSkFwjg+v0WeulcmXI7r5bmctJV
	ByBFJqHiXeuY2F84R+wWeHHNQ3BuliyzYFvoZKRkP1tFltZ2bb0ZCgRxw/y72A7JNue4jg9gHJ5
	T5mvZyhB2plAFR0/jG40DC8B64ygEnZz+3e3JFiKznOsxKYwTheybgQT0
X-Gm-Gg: AeBDietCIq1lKX+7qNx8sp9SqZjs/ZdqiRgXe5yOj4m80eBj0uojh0zmGB9IfY0SD35
	MFt5vxrvS+D8hQxZQcVtEli4k62N5PKg2QhCF5Qzr6FfcD5Tpf7N+vix33r6TddeV2k1kAo+N2A
	IP8SVpAZAxwx8aaDucs1hqaq2xhsfoZ3ua5g1CP2B2Lj+fMiMHOC1r60uxG93xuizH7jEaw4Rvw
	5MJS/N0Cr3Ze0Jc05XGelZYPv9Jux4W8fdAbhpmG6ae9QzTckPg2PIyW/2L7hl7glP5+HZIkGxY
	3zl29SpE
X-Received: by 2002:a17:903:94d:b0:2b0:5193:1212 with SMTP id
 d9443c01a7336-2b2b96da1d6mr872985ad.4.1775612805134; Tue, 07 Apr 2026
 18:46:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260408001521.102140-2-irogers@google.com> <20260408005152.C599FC116C6@smtp.kernel.org>
In-Reply-To: <20260408005152.C599FC116C6@smtp.kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 7 Apr 2026 18:46:31 -0700
X-Gm-Features: AQROBzB3a6iMxFzVZyOw186cpShdVhA7om-DXRfo3ON5lKkC2wLIhQD5lNshF1U
Message-ID: <CAP-5=fVqaqNo1VyGPWhZ+DvEv+oRUU=sMtBtpFbm4D-sJb-JNA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] perf maps: Fix fixup_overlap_and_insert that can
 break sorted by name order
To: sashiko@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2026 at 5:51=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 1 potential issue(s):
> - [High] The maps__copy_from function corrupts the maps_by_name array by =
populating it in address order but flagging it as sorted by name.
>
> --
>
> commit bd0adc21836e1932db4199fc14353b8a08f98a0a
> Author: Ian Rogers <irogers@google.com>
>
> perf maps: Fix fixup_overlap_and_insert that can break sorted by name ord=
er
>
> When an entry in the address array is replaced, the corresponding name
> entry is replaced. The entries names may sort differently and so it is
> important that the sorted by name property be cleared on the maps.
>
> > diff --git a/tools/perf/util/maps.c b/tools/perf/util/maps.c
> > index 7dd6da9d1e4f0..b44bc41f51f3b 100644
> > --- a/tools/perf/util/maps.c
> > +++ b/tools/perf/util/maps.c
> [ ... ]
> > @@ -955,6 +955,7 @@ static int __maps__fixup_overlap_and_insert(struct =
maps *maps, struct map *new)
> >                       if (maps_by_name) {
> >                               map__put(maps_by_name[ni]);
> >                               maps_by_name[ni] =3D map__get(new);
> > +                             maps__set_maps_by_name_sorted(maps, false=
);
> >                       }
> [ ... ]
>
> This isn't a bug in the newly added lines, but while reviewing the maps
> sorting logic, I noticed a regression in maps__copy_from().
>
> In maps__copy_from(), when copying maps from a parent to a destination
> (e.g., during thread fork), the dest_maps_by_name array is populated
> sequentially inside a loop iterating over parent_maps_by_address:
>
> tools/perf/util/maps.c:maps__copy_from() {
> [ ... ]
>                 for (unsigned int i =3D 0; !err && i < n; i++) {
>                         struct map *pos =3D parent_maps_by_address[i];
>                         struct map *new =3D map__clone(pos);
> [ ... ]
>                                 if (!err) {
>                                         dest_maps_by_address[i] =3D new;
>                                         map__set_kmap_maps(new, dest);
>                                         if (dest_maps_by_name)
>                                                 dest_maps_by_name[i] =3D =
map__get(new);
> [ ... ]
> }
>
> Because it clones and copies the elements in address order,
> dest_maps_by_name is strictly populated in address order.
>
> However, at the end of the fast-path copy block, the code executes:
>
> tools/perf/util/maps.c:maps__copy_from() {
> [ ... ]
>                 if (!err) {
>                         RC_CHK_ACCESS(dest)->last_search_by_name_idx =3D
>                                 RC_CHK_ACCESS(parent)->last_search_by_nam=
e_idx;
>                         maps__set_maps_by_name_sorted(dest,
>                                                 dest_maps_by_name &&
>                                                 maps__maps_by_name_sorted=
(parent));
>                 }
> [ ... ]
> }
>
> If the parent's name array was sorted, does this explicitly flag the new
> destination map's name array as sorted by name, even though it is physica=
lly
> sorted by address?
>
> Could this cause any subsequent lookup by name in the copied map
> (such as maps__find_by_name during child thread symbol resolution)
> to execute a binary search on an address-sorted array?
>
> Would this cause the binary search to take incorrect paths and fail to fi=
nd
> legitimate mappings, leading to missing symbols or missing maps for
> child threads?

This is legitimate, I'll do a v3 with a fix for this issue as well.

Thanks,
Ian

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260408001521.10=
2140-1-irogers@google.com?part=3D2
