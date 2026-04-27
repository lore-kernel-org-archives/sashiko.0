Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14BE2DF701
	for <sashiko@lists.linux.dev>; Mon, 27 Apr 2026 02:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777255822; cv=pass; b=qKghFP6ZbS9bUKhNt4t1X/Mjn0AvMua3s/CYgJt7DDd1IH+IAcdJhkHdAehkixABRc1FlByaPnMKN2Dc0h4DBC+EmEtaCnzJ9nftAes4SiXBZ+yn2VQRdcfeUTh2XNs2GqWtdeI64OCguqCkZ4mEVRvds4aPEXTHirB+L9qseKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777255822; c=relaxed/simple;
	bh=jkK8/0biK4bjAlR9voiM+zgN5Mx2RVeA93tFOSCHKZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O4tofodJdLa6ri5zItp/ZT9y/xgHZ9WHN6iZqJ25IKbD8ug+BIiMDUSYFuP3o52kRiMffmpG9zUpT938RACrjNWeRWAGHV4MNaGHA9JfBZ1a3mG9lIjqH5ms/jLWMCThpqjZ0h+NqLpRUQa7GUdGfw9BzgCBFIPjOU+woAIOxa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uau7FxVF; arc=pass smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uau7FxVF"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8ee7ffd738dso630812685a.1
        for <sashiko@lists.linux.dev>; Sun, 26 Apr 2026 19:10:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777255819; cv=none;
        d=google.com; s=arc-20240605;
        b=hOKh6nBrG/32jdKp7ABnSIXp+eZGsBqwfgn7soquwXhv7FAiAbJmeNPthxp7onvtLC
         rTtWDppSGnMRGnmKNESUsQDRaOhyvyNzKnJi91S9jn7uBJj015iYWbo+sXMaxRSJe1gJ
         lMsRx3HGadOx7uoU+hna4vyfIneb/OefqIuoVz+Cbo0pSqu8rQEMD/i18lnGIAQWHQig
         BMa1MS0SrNvurWQ0fd8xW/JvNIaRnaKoFQupravfvCyYJkvT7AIIdrkoGny+zeY4Mpzd
         BmCbQ6tyflORZKphT2MdqZkfntPmvI9WNKcnG3hCP6dVRnt/MXeKAm3tcFrcvQ0RXK79
         Jwtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jkK8/0biK4bjAlR9voiM+zgN5Mx2RVeA93tFOSCHKZs=;
        fh=7pQPbM1mTaKjUbZ75iTISJbipA72wUVZwkXXTYMxzFw=;
        b=FVBX3JMMzeXis39q3As0K9rSPYygrCjSk6lAMULsVZBAGQXzrOq3Ssse1y1wrwUR4S
         kxsPI1PniGHpXOXiH9IQMbJLfD570nw/QopdHFwzLwwNLz0n8ygsnY3zuKeu3veNUsQ/
         5JXm/iGVPmh7hx3Nm/mAJCfHslwnNdsQsuZWw+s26Hn+oXTnh7gg7s/EqXBy4Dl7TGg5
         o1P2q5ukGvkj51SfUfkQADqylG2nplTWAQH45AlMQ4YnG9N1mpCONn1po7s8OMrq/mFC
         Ngqj9lH03DOAKONMZTQ2q+cnsH23pA5g5pGSYTwTN5ObB5PiU+8t96buhB88q0X3rGFr
         p/Eg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777255819; x=1777860619; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jkK8/0biK4bjAlR9voiM+zgN5Mx2RVeA93tFOSCHKZs=;
        b=Uau7FxVFt+S9XHxYA3BQWQenRzgsw5Da1jsIpOeF0D5xbzVXpoLoF1b6AA+6wZ+7uQ
         N0Sp49SmeJ8Sg2Mj4w+Q0cLodI8VyeTu68N/TsIoEbEYkMwDS2KRQvKp298AddVUqPwo
         rP0QafIoOaqr+zIyg7xQ2aDcEHgqud7+SECjTI924r3sXtFdpn9ojY18hi1t7pccVMU4
         JJ2vHWiqdWVxnmgTEljBj2YG6uyre7gobQsx5h6zGNVv4GEts64PXd1GASI0fI0xyg2+
         Zl1ydwZs5wZakCs8e1+dYZxCSFMxxOvuuAVHcfi11g46dyOe8ZaED9ubahOMerUJvYn3
         pvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777255819; x=1777860619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jkK8/0biK4bjAlR9voiM+zgN5Mx2RVeA93tFOSCHKZs=;
        b=NU5SgQHIHOy8Yb2J/dazHxhtmGtZf243qK8fQKQY4TOMxIxrWjuJRpTjUv+VKr1mLx
         5nWythoiWEmSOJhBhGho0qma7eAQPvtKuKizJt4g9im++24vs1XfI+kUSdG/WP1u3uv2
         uBCscWRXhBBQqCmOn1zIgRuJoXOXnlh2APGk+Qc5sqZ7gLfHwIxr26z0t2zDsSRrJqNT
         ODWAF2OH4NrMKUz/q0PJOliFqS+Vh1L5ZtUCi7VOVzB/HGtFTr5Mge1ojhOPM5pxNVur
         ESG3coRfKHjQ9UXiTPxiJAITgArp+ekFCQDSjajOiY1E/uwnwXnfaC0NHxcsFcL8xASJ
         BW7g==
X-Gm-Message-State: AOJu0Yx8NrTE/B6N48qSkPilm3cEgfHHI3ZehVa88GNpx/J5JdAV+ZVl
	MmuIMnkKQf3VQc3JrY31Xnh+gRFV2ON1onskZPgh01duXqV+aURp6bE5mF/gvagvWQ+qtfoIBfA
	yHsJAFL9XX8lK+eSpnfxPoCHuhSl0TJ8uwR7n
X-Gm-Gg: AeBDievybuPe1iVcDxXRBEG/nUxLwzGnd/a/nknV3aOF7e23vERcJpgaOwmIAcqdhS8
	SxO5R7E15Z4s4QS4J9tdjKwFL/1jWLqlw/MxVgxVI7I2FBvJNguzrZhIzHa31p0atck5KQRKzU/
	kjMDT0XecqYvvfP1JoepNvNgN8ox8z3JdZY0VOi07KWa29hSQxwsZs0qNVThAMNx9MssIQqSFKh
	lAGVJjtsvkabbt17uBYQulmB8QfHZMqLBEhMwuw7ELAneTp3WUE4cIE/eB3HT20011C/8EqiH36
	qzgDqtz6N53dbTiw81oyGvxIKoS+Ri+iqLsVXTufQ2Zu57E1kJGuFN33Inv8xQ==
X-Received: by 2002:a05:620a:b55:b0:8ef:2118:aec4 with SMTP id
 af79cd13be357-8ef2118b76emr2293526185a.27.1777255819419; Sun, 26 Apr 2026
 19:10:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260427001602.38353-2-dwindsor@gmail.com> <20260427005655.9B96CC2BCAF@smtp.kernel.org>
In-Reply-To: <20260427005655.9B96CC2BCAF@smtp.kernel.org>
From: David Windsor <dwindsor@gmail.com>
Date: Sun, 26 Apr 2026 22:10:08 -0400
X-Gm-Features: AVHnY4JtMmIoRwYCWQQyy2UV8X3pukhYq4UbkG2ZS87EeIsJuPnzIznz6GhYXN4
Message-ID: <CAEXv5_hCV0BGG=gDN1kupuhe=o+wCojTW32-R=9J8zmi4SR6KA@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: add bpf_init_inode_xattr kfunc for
 atomic inode labeling
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 26, 2026 at 8:56=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
...
>
> Can this result in a use-after-free of the name string? The name__str
> argument typically resides in a BPF map.
>
> Since the filesystem's initxattrs callback can perform disk I/O and sleep
> after the BPF hook completes, what happens if the BPF program is unloaded
> and its maps are freed concurrently?
>
> The name pointer might then point to freed memory when the filesystem
> attempts to write the xattr.
>

Yeah, good point. We'll kmemdup the name just as we're already doing
for the value.
