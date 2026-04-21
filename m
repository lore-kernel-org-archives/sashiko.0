Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A5836680E
	for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 12:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776775213; cv=pass; b=AjjPg8CDm2HDSCj6ErkdQzNQyluEL9hh+rrF1vSRGNhdeiZAP+HIcVAJHHvLdyzNoRTxR9huh6jjgBtXHtt1NKvLRvJ3pbxjAGDWJLgadO8F6H/9uVAqhm+GtCp52UHNd0cyhD3+XhgFVtf8ha/66bS5sg722tzoZEpkSRH0jxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776775213; c=relaxed/simple;
	bh=lvdgawJx0ujua+qiUXuRIWl8gU6rTNtB+COcEdCquEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Am7KDDL9KqrjchuwniVtP60ijqnaqSnciqXKQuMs9HOFd+IQG0AWcF1XhVq465Q7EMDG7FmOy8M5dwU8IyJq3YbpFKWw+NSp53EYquYESy3yIwolorxbfwO8CG1TKLh50YAsVK3tiAyHCfITfc7nJYgKjE5F3ozJcMWyMc9TBZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QiF5FcBt; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QiF5FcBt"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a402b2d102so4875889e87.3
        for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 05:40:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776775208; cv=none;
        d=google.com; s=arc-20240605;
        b=AbsT9I+s/uR3q41c9MlPNHUnxWqohVysJkWUqNjTflhPbRLUJSTNagXrajRVdSUIFe
         idzpvDWbvSETz+BITvv4COL7J0NdQhUJR4vyEpnkQLeQbyZGUFwYKFsC7HnffHBRrmuV
         WUa9xKeJ8DHUOz1fEj+dQen7iAX3USf/fhChEmmjS/I7O1DkUVagLyRP1LWTUTvGFke4
         nFu7kt7zEAOYJ0XrLxnO/EJdNByRYC9XEag7Hu8s/73sg7OayWf7r5PNBdo1oqCLpdzD
         IroodyNefWspueMRMfucqSpMHOChD3SFZvwFZu0gkNCsQG17yCpZbDbJ8ZdFiGAllS/1
         ZAyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=APV63OegD/VBoeZuqLkoZ95g/HZtt3yngwmMzUSUz1A=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=CwtZkopyELiDgyoE/vBO7MZn7pDuCVa6EfqgLxuLB4QeZKW1VEas9Wfce8LcZ3/o09
         5v0RIRqkccgI4aFg7YKgxZtXKEG9Miq8FQ4T+lwHooxZEPyR6B1iFEi3jK+Wcj+HTG3O
         tjcXC5xa0G21vP/3jrS0MEVd6NfwgIuFcetCluUdoo5KrM8N8uV7bWASWn66PRT4kwIE
         EbvCUtnWqfrqgVFyX6LNAMst3NS3U1l8RQ3Ahsf7x2mFZE8G938j6TzzlXK+MFbLCM5c
         6MOzsACr+T0Xm1HVzxE+oJxR92c9GFaZFmFbqTzoKelV3iS2RQbmJF1IsMkjuEmwRady
         CWPg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776775208; x=1777380008; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APV63OegD/VBoeZuqLkoZ95g/HZtt3yngwmMzUSUz1A=;
        b=QiF5FcBtYt0uv3IOELemk3Zba1InUmKbk2z0glxJV9JwGGBTvwJqdzbQIK99npDZQx
         qWLN0uIcapJLWGmUamjOeGO8XF2IUPTTeRbT4HVOPkmk+NybgEaSnMDp+PYEKnd/r2ku
         yGoyQ8TYj6MrSurMxXcHqN68aQq6nunaY0nw7etudceR8uFghsktseu9r6PLKgemQEA+
         dNjAWmh+zpF7QvVBR7Dm/15+GXx9jHp6gZk/EmL+YMJ8qpchwZX+MyAnrDomttlx5O9H
         Ut95VzBwFqzNnWUgsnldcc6anTxhFGVgmVKE4eocVVRvFUmztsS12dbIoZyDHxsoRw0w
         P5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776775208; x=1777380008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=APV63OegD/VBoeZuqLkoZ95g/HZtt3yngwmMzUSUz1A=;
        b=WaJk2NdJjmc3sN9KPeP6mVrtll0kTyneelc/emtXzEUkBS9WjAvL30IwJM6wYAoSId
         mirVAmsCpSIgL/SLPwYqdeoaUwsNgWRV0CuyS9/oLYFPVPV8IpK9rz+7L5yNsaPT93dm
         Ih5p49VslHLPuzv9KOuvvsj/IoveCZM2+kMZAJfESLSAaatt2edceZCiH1DR8Ao9kigX
         SXadsrR9ex4Z2cPvRZRCd5AHP/azoBoD8Gh25AnboGkqeTVsZg0BV9UGQtEdESnoJOvQ
         GAejOuWnxaWAeFARr2I3rOTf9VZhkJ0qJEwq5U0sVIjFO1ubw76SJ0cnIC8+rlvJEFay
         /Y/w==
X-Gm-Message-State: AOJu0YydeZX0srdaVcLW73fWWTyMDbty4Db2amP4TbKXHbAy0XNucFSe
	DX5o2brsD74Q3qY9GFH2tMSpYOf4cS5glevjDdG/WuyWbFYvPmgS8PYQCC0aGInXrJbuIBMrN4v
	7L9UYtljpjqqh19g1e3wBAnnOTO7EroOKgR8BmUU=
X-Gm-Gg: AeBDiet7NDQHzc2iw/dMfjqKSC2DlAhrowO2oX9gTNKcy3CtqYXa5HLW7cOz2nMVTVA
	qfHixVrtdsthuAOgy/vT0/6HYQStEihq4Mzskm9PFrBqdH6mI6Pdtm1tgpzoLj0abBXawgIAhjQ
	XeLPZWfVNEtwwkP5uxmn2ShfmanfR5ni1IVWcQCprgZgT1aiXc2KojxJHMBDPQgyqv3bN0BIjjl
	fnA5NRrqDqasw9ZPj+DMCeBUwuV+npjxhSdUPP3zz4TizzHgOtBKWSw5oa0e0JDFxjwUu0Iel5c
	Dl4zPba7KwpCw2wLPQ==
X-Received: by 2002:a05:6512:31d6:b0:5a4:6a5:9904 with SMTP id
 2adb3069b0e04-5a4172e4778mr6776661e87.31.1776775208122; Tue, 21 Apr 2026
 05:40:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420082805.14844-2-kerneljasonxing@gmail.com> <20260421094022.8D0EAC2BCB0@smtp.kernel.org>
In-Reply-To: <20260421094022.8D0EAC2BCB0@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Tue, 21 Apr 2026 20:39:29 +0800
X-Gm-Features: AQROBzC6v5br0D-CBK31naqRqEMmYy5gMertLuz_4WyOh5lkdmYFWJjx8l3cw5M
Message-ID: <CAL+tcoDp2ZgO629J0fw1TBJ=fdf0KmWz3i6mWODdLnSbmLv_sA@mail.gmail.com>
Subject: Re: [PATCH net v2 1/8] xsk: reject sw-csum UMEM binding to
 IFF_TX_SKB_NO_LINEAR devices
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 5:40=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 1 potential issue(s):
> - [High] The patch unconditionally rejects pool assignment for devices wi=
th IFF_TX_SKB_NO_LINEAR if tx_sw_csum is enabled, which incorrectly breaks =
native Zero-Copy (ZC) setups on those devices.
> --
>
> commit 5beba1aaed8c200424f98af3c07472ab4da8d451
> Author: Jason Xing <kerneljasonxing@gmail.com>
>
> xsk: reject sw-csum UMEM binding to IFF_TX_SKB_NO_LINEAR devices
>
> This commit rejects UMEM bindings for devices that advertise
> IFF_TX_SKB_NO_LINEAR when software checksumming (tx_sw_csum) is enabled.
> This prevents a warning and panic in skb_checksum_help() which relies on =
a
> linear skb head.
>
> Link: https://lore.kernel.org/all/20260419045822.843BFC2BCAF@smtp.kernel.=
org/#t
>
> > diff --git a/net/xdp/xsk_buff_pool.c b/net/xdp/xsk_buff_pool.c
> > index cd7bc50872f6b..d981cfdd85357 100644
> > --- a/net/xdp/xsk_buff_pool.c
> > +++ b/net/xdp/xsk_buff_pool.c
> > @@ -175,6 +175,9 @@ int xp_assign_dev(struct xsk_buff_pool *pool,
> >       if (force_zc && force_copy)
> >               return -EINVAL;
> >
> > +     if (pool->tx_sw_csum && (netdev->priv_flags & IFF_TX_SKB_NO_LINEA=
R))
> > +             return -EOPNOTSUPP;
> > +
>
> Does this unconditionally reject the pool assignment even for native
> Zero-Copy (ZC) setups?

It's weird. Nobody uses sw csum in zc mode.... If someone uses this
and gets warned, he will surely root cause the reason and finally
adjust the code in application.

>
> In native XDP_ZEROCOPY mode, AF_XDP descriptors are sent directly to the
> hardware. No sk_buff is allocated, so skb_checksum_help() is never called=
,
> making the tx_sw_csum flag irrelevant and safe to ignore.
>
> By placing this check before determining if native ZC is available, does
> this break ZC mode on drivers like virtio_net for applications that pass
> the XDP_UMEM_TX_SW_CSUM flag as a fallback?
>
> Should this check be deferred until we are certain we are using generic
> copy mode, such as when force_copy is true or after native ZC setup fails=
?

It's more complex. I'll keep my code as-is unless someone screams at
me to handle this trivial case.

Thanks,
Jason

>
> >       if (xsk_get_pool_from_qid(netdev, queue_id))
> >               return -EBUSY;
> >
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260420082805.14=
844-1-kerneljasonxing@gmail.com?part=3D1
