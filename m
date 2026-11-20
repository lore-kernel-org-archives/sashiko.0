Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=140.205.208.109
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795142508;
	b=LvS/0uUAa3AQ8Irk/DZ65cCREEhulnBVxqUrxuulz2FZGH8VHCWVAEB3mUT9VJSHfHlv
	 pg8yEMWqkbtpjbgA8/PYEjUaBemyCJTvU22YteboennC60F+JO8R4glgxN4Qs3raQdHb8
	 3qkhwo3sV6B5Gox/ckP1Tw6zhTe+opYddCVycQgl6Co2+tPeTklW16SUBFS0dZyuf6mPT
	 gMrhHNY3Gr3IK3DRWPADe8zkWnMouLIruYjSSU0ssQwMV4qDLr4ZxZPspDzPlouAYCjcd
	 N4hEl3kfwQY6pzGKWIi337YtnpKvEEDlYEwbPSq+RJejppYjnehJXFDWnuuXiYsX8nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795142508;
	h=DMARC-Filter:X-AliDM-RcptTo:Feedback-ID:Received:X-EnvId:Date:From:
	 Reply-To:To:Message-ID:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ks/dLwwUk6HT8w68czYSev3ifcnTcjuMn/vaNjJ5Msg=;
	b=vf1enhKw94WrwbNxdsn7Mpyrxu16IINTlBejK5XlUdbLLV3TnjXnkKyyiH1SmALblGOe
	 sLcj9Mav4NSF7p/9jLt/bweftSHMEF4dBZqL6CbsgR1ZDnxar17RZbkxxxGH4dhrY35QN
	 LrBfOIwju+aAoN7os0xKUvmILFwPlOOiQic671eBvVcq5gGOOfQrn/H/e30+cmjVUv3UW
	 K9GaR5ypLxsD8svktSAK1TUCh22C68GgJiV/30821IR8PGGCnO9VJEXgFiFMVhcHK55ae
	 zxPx3USw/yDuyKg3w89FIpA59Ds1W15wjIwtGCcQTEuoLzBEeKd9EdzamxvHsJxhIYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mail.wang.market;
	spf=pass smtp.mailfrom=mail.wang.market;
	arc=none smtp.remote-ip=140.205.208.109
Received: from out208-109.dm.aliyun.com (out208-109.dm.aliyun.com [140.205.208.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53772606A320
	for <sashiko@lists.linux.dev>; Fri, 20 Nov 2026 02:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53772606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mail.wang.market
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.wang.market
X-AliDM-RcptTo: c2FzaGlrb0BsaXN0cy5saW51eC5kZXY=
Feedback-ID: default:hezuo@mail.wang.market:alibabak_SmtpBatch:23154
Received: from a40199255368(mailfrom:hezuo@mail.wang.market fp:SMTPD_-VHcGaIaVVY cluster:AY35D)
          by smtpdm.aliyun.com(127.0.0.1);
          Fri, 20 Nov 2026 10:41:37 +0800
X-EnvId: 600000375329265782
Date: Fri, 20 Nov 2026 10:41:37 +0800 (CST)
From: hezuo@mail.wang.market
Reply-To: 921153866@qq.com
To: sashiko@lists.linux.dev
Message-ID: <832094796.411.1795142497649@a40199255368>
Subject: =?UTF-8?Q?Let=E2=80=99s_talk_about_how_BizBot_he?=
 =?UTF-8?Q?lps_promote_the_Sashiko_project?=
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The Sashiko project is very interesting, especially its intelligent code re=
view for key systems such as the Linux kernel. The design idea of =E2=80=8B=
=E2=80=8Busing Rust to automatically detect bugs is very solid, and it has =
indeed captured a core pain point in the open source ecosystem.

 Our team has been helping technology-focused open source developers like y=
ou solve promotion problems - many excellent projects have strong technical=
 capabilities, but they are often unable to let the outside world know and =
let more people actually use them. BizBot is an independently run AI promot=
ion system that can automatically search the entire network for open source=
 projects or technical teams similar to Sashiko, identify potential users a=
nd establish initial contact, helping you deliver value to those who really=
 need it.

 BizBot is free and can be used directly after installation. You can direct=
ly search xnx3/bizbot in github to see it. If you're interested in learning=
 how it can help you expand the impact of your Sashiko project, I can show =
you how it works in a similar scenario.
