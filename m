Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75C0389E07
	for <sashiko@lists.linux.dev>; Tue, 28 Apr 2026 09:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368832; cv=pass; b=Zk+Mln12RFXMNEtSBoX2UpKZgOdwChnRgqO0xaD/2/Qeah5sB7K8rE8Ig8wUfU4UpK1Ikuar7L6W4yYznGVn1qjNZ+ixSsrzqFYMzVlu0q6wqY1PedqVQdmDc0pf0FVk96MmHWWcjB1T/mLC3nJzgn2rym17sGHM7akvdX7vgvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368832; c=relaxed/simple;
	bh=h6NwF3Le6XVIQrwiJdwOGL8CtReUBCUsNCqF8bCvia0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OfPFxhEppEoMWrQvYObji3VhY8tu/V46j+qREZC4csHeSqCfTDhcQKtMfQW6Y+o6YDCi4A9EOiuL4R9c6QUT0q2IgXpJQrway0TbueouQyttyrK4RBg5TdY5N7YqkiLmaNgWplaMl8amyCCe7sWg1vkzSDuOI7LRAjjnPoBjdv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pY9dHHwC; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pY9dHHwC"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6720c7968e4so10247872a12.0
        for <sashiko@lists.linux.dev>; Tue, 28 Apr 2026 02:33:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777368829; cv=none;
        d=google.com; s=arc-20240605;
        b=k4NzeyUKj9HCa0uade2j31i5mZ1WDIIjC1NdGao2j/nZ5SFBmtGBnQoJp8owTRjI8D
         MR/pvG7/F+4EBNQgG8uZ8nTRFqsJFSc75R0PxVTSkfBzs9FAM1ZFyARzS7CHPpFRWntQ
         VKGN21E8D/wY6WRXj/TCeRbozsvJRSAch8PM75dMO4ptO+aTnvipAFtHISC+T+jw6Cv1
         uqDWtZtVkk0s+pCPQ3sl6THm5+soUn0HK0kqVIWeZaYbwz4gqySJTSDTC8P8Y5Y0uMBV
         acXvQm1kg59m7HPVAaPjvVmfSi0JhpDPElR4BIZJlQMBi+Rat1SaxR6rWmIqF4MIhA6/
         9v3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YvsHjcWiucfudrzDgP/AG+IkarbArZuB1gzHdGlxxm4=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=hqpKOg4O/oSdPJTiyTtFJzIr6DbrMxGGAszIQo1lFdZQxix8I4PnVisBpM1/gsfPwU
         gQbLAauSF6yZMvPGng8HN/WGNZrHLarOSJzVcMfrQOHo3JY0qEHU31NIibYsBGMLJdNs
         3v6vV+eqREoyp8xDrKe6hgkIZ6zshweibXpIELYok4Rti3IFPdqLs4R3dvZ6htPCvF+0
         wF3BF2tqWvj9r5IFbYIb/fogkkp/KfntfcJNU42TKESrYk1iu/FxH31TvdpED+uEAg/h
         5cEjTTP38YxPSerVXc2x3YB/ZN/6EZXyxd+kXFQAizbZsCNhj2EKrVo739rs2FcA2pIW
         Lulw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777368829; x=1777973629; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvsHjcWiucfudrzDgP/AG+IkarbArZuB1gzHdGlxxm4=;
        b=pY9dHHwC15NHYlFQceuSK5z1s6Cl0twalIt/0JuOxrkYnpu4MQgaO+OwU2/PVI+Kr7
         /Ew+udaoUuPSytlwr+dAIcipQ28qBsUFNRzWwfYe+IjJt9l6wRTbN/rwoz6F1mnfR3el
         umQCJn9CNgJ7zNx+ZmCtVBHemoIRQer/TJMWgtWZvuZbXKWrQieB1HEWiqniOAtKabv3
         qN2YyBggog2j86JFn2kbgMVGz4B8JlUN00Njf9CcIlC8uKOwX8weo7OIDMPOh/jF2aWY
         WkL2FXQ4IqQw8dR+4j0s6Paz7gkcntBgMG3xqenSK4r3nE/uu81uJnVrVaICRtJa1l/S
         QvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368829; x=1777973629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YvsHjcWiucfudrzDgP/AG+IkarbArZuB1gzHdGlxxm4=;
        b=eXaGD9KqayOXaEhj6OuTOmhBviCOTqODZkUBG9i8dxGqLLTPCIoUu/qFgOpAdoV6d8
         C8apl18y9bnnJ1fgShjQGBleiVvB5A5phHkmWGMEHgDggBwzCPSiGtAF9Cx62kh7/LPN
         929P4dbzJjW8UqOjWjGwS0AjvT/RXT9IGXOApWf7iJXZrA7STn9ps1C4xGQ4u20rWVl0
         YGWJelv+CtjvMYlIDh5T+trAXV4fi0eoLHMCt0SDHCrM6ZLFFzRQD3BcfBZ5rD/MDG1h
         OKvNU5JsOimJtGld2BPUFP6YjcVIU3mxdNRTpl7Ve8eNLEUNb+A8b1Sgok/epHNtNAhp
         sc+Q==
X-Gm-Message-State: AOJu0YxxIoay1R5BlEknsQcQClZ62St9y7sZL7v6NCeyY9QfYxr13E2t
	PAiNH8DPyi8KRBVkUJVeSxNYuG0bPc9vRtXQkcOC1XfSy/df93OA0Rs6xw1rIuYKB/zOLcJi9F0
	dKvJwafgNIBTwCHORMQQhVV4c9pJ5MpRZLZigxgY=
X-Gm-Gg: AeBDiet60IgQn1gGk6vjmcMwlsqmP9VKW1ovDJQgmO2/z8n4nWBmA8Lk4kos2+JXiKx
	PhlQFfMYHY/pPGLsbMeId57tdg0YfDWqHl17sezsed0S7MX4QFQ6motHGv9dELEtEnupLm6Qcmf
	7Tx/+eoqrh7FVspHNevvYrAQqv92Kl2akriAGJqvTcnwKwB1VkMO3UuwLKwuYwpqaG3y15ZY+OI
	9zz/diqD0KHO0Yq7Mh7nk5iMD7Jl+Hrc3xyfPdrZeRQwG3pKGKCdgxMhQvr0G4yvrixgeLEFjpk
	vAOXKb++IGwXjHXHV0RB0DrxYHQ=
X-Received: by 2002:a05:6402:2748:b0:677:1d09:56d3 with SMTP id
 4fb4d7f45d1cf-679bafe5717mr1088250a12.5.1777368828542; Tue, 28 Apr 2026
 02:33:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260427232313.1582588-7-puranjay@kernel.org> <20260428012920.C90A1C19425@smtp.kernel.org>
In-Reply-To: <20260428012920.C90A1C19425@smtp.kernel.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Tue, 28 Apr 2026 10:33:37 +0100
X-Gm-Features: AVHnY4Jxb4hehSxDkI_ht63vhXhFkxGUIzfocB3juJXEXlapiQ-CsY7VXNocFKc
Message-ID: <CANk7y0gtBWMxv4DV3tnt78iCFG_Y=0SOiEVcKDcKd0ibxpBp4A@mail.gmail.com>
Subject: Re: [PATCH bpf-next 6/7] selftests/bpf: Add XDP load-balancer
 benchmark driver
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 2:29=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 1 potential issue(s):
> - [Low] Incorrect IPv4 checksum calculation for packets with IP options i=
n test packet generator
> --
>
> commit cc1cb16090fdc833cb82a1c6a168d6cb11005220
> Author: Puranjay Mohan <puranjay@kernel.org>
> selftests/bpf: Add XDP load-balancer benchmark driver
>
> This commit wires up the userspace side of the XDP load-balancer benchmar=
k.
> It covers 24 scenarios and validates correctness before benchmarking by
> comparing the output packet byte-for-byte against an expected packet.
>
> > diff --git a/tools/testing/selftests/bpf/benchs/bench_xdp_lb.c b/tools/=
testing/selftests/bpf/benchs/bench_xdp_lb.c
> > new file mode 100644
> > index 000000000000..0b6709a2b03c
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/benchs/bench_xdp_lb.c
> [ ... ]
> > +static void build_packet(int idx)
> > +{
> [ ... ]
> > +     if (sc->is_v6) {
> [ ... ]
> > +     } else {
> > +             struct iphdr iph =3D {};
> > +             __u32 ip_off =3D off;
> > +
> > +             iph.version  =3D 4;
> > +             iph.ihl      =3D sc->set_ip_options ? 6 : 5;
> > +             iph.ttl      =3D 64;
> > +             iph.protocol =3D sc->ip_proto;
> > +             iph.saddr    =3D htonl(sc->src_addr);
> > +             iph.daddr    =3D htonl(sc->vip_addr);
> > +             iph.frag_off =3D sc->set_frag ? htons(IP_MF) : 0;
> > +             off +=3D sizeof(iph);
> > +
> > +             if (sc->set_ip_options) {
> > +                     /* NOP option padding (4 bytes =3D 1 word) */
> > +                     __u32 nop =3D htonl(0x01010101);
> > +
> > +                     memcpy(p + off, &nop, sizeof(nop));
> > +                     off +=3D sizeof(nop);
> > +             }
> > +
> > +             build_l4(sc, p, &off);
> > +
> > +             memcpy(p + off, "bench___payload!", 16);
> > +             off +=3D 16;
> > +
> > +             iph.tot_len =3D htons(off - ip_off);
> > +             iph.check   =3D ip_checksum(&iph, sizeof(iph));
>
> Does this calculation exclude the appended IP options from the checksum?
>
> When sc->set_ip_options is true, the header length is set to 6 words (24
> bytes) and 4 bytes of NOP options are copied directly into the packet
> buffer. However, ip_checksum() is only passed sizeof(iph), which is exact=
ly
> 20 bytes, and computes the checksum over the local iph struct alone.
>
> While this logically malformed packet might not cause the current tests
> to fail because the BPF program validates iph->ihl =3D=3D 5 before verify=
ing
> the IP checksum, could this mask bugs or produce false test failures if
> the BPF program is later modified to validate L3 checksums?

the current BPF program drops on ihl !=3D 5 and never validates checksums.
