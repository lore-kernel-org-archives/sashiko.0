Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795121276;
	b=HwdjaoTU9jtXoJmPW3T0Sus3LRaCpLgSSnmwt8sHZfznK1OssHFi77retqt9bOgCUwMk
	 ooU6mWs0AJ4ilid40kBGZKiwZyv7agBV/5RM+zdsGC3luTRG9mKpA0RZvYU/8c7M/XVkV
	 dR+DOD+/2jeMrELixPYc0rCK2/xS5Uh0WS6uDXPw9v7liTSAqgMLMEt9pBwOM9SAjVd3H
	 3vH6U4TQdiDAUH+tVQszpqqvvPLuoifrxc3aowkb5FhWPLkmoHk41cSW97JPUkuTFch6k
	 FS7FlGV6Y2H0Q3e/lVxS5uUDyU+QVETWwkobUSjYtPyPPex4ouhBXayBvVLLZuBiTBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795121276;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:From:
	 Date:X-Gm-Features:Message-ID:Subject:To:Cc:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type;
	bh=xNhRlwtx5cb5bPluBNfUqeLFGIE6EjJ66WbcDsWZVak=;
	b=fj51KS4r76zMIIgtZ17rUJ5x2l/lf2Vflp7RmEYSqThod0g43JYrKGcouLiFGyI3/O1l
	 EG68DrDE/MgtoN4qeeHx561zW8FkTp4rypbhqWCgCCmYMaKWj6lFagx4APDMijXAOf7ZJ
	 wS48W8Uk35qcPbeR0+qcC105q01HONsckhQBdWbbB2XQk1bSwVq3BT/hHWFXQxqqECe9w
	 hMya2sccyj+YJX+CYKi+rNQVuEjRy0cPJpkMOuAmTUSmHuxWocuZkmiS/XVLG4yiS0kIo
	 QU1K/tmoQgXdXvMxc2TDCz9PmVTZMBSxET59UnYPQsTImQk83pkGcSkI+VqTZ79dpQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="ZL0/13BA";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F55606BBA1
	for <sashiko@lists.linux.dev>; Thu, 19 Nov 2026 20:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6F55606BBA1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZL0/13BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795121274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=xNhRlwtx5cb5bPluBNfUqeLFGIE6EjJ66WbcDsWZVak=;
	b=ZL0/13BApitsJoKQ+M7Aa+6U3wfJT6s5TfmYbaYm0G2T/i+I+TIFy2dyK31aOhves3fMFb
	qhezXMMLv1IhsgnwiqPwjtfFx7UBKtU118Y9++gW5hBm0yAFvRXx0VNsqtJjqC319PEq2H
	pIx5536EUviEcS7SqyYkF7ofEgl/CEc=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-4c9yJbKgMdOsb_y1IrJfKw-1; Thu, 19 Nov 2026 20:47:52 +0000
X-MC-Unique: 4c9yJbKgMdOsb_y1IrJfKw-1
X-Mimecast-MFC-AGG-ID: 4c9yJbKgMdOsb_y1IrJfKw_1795121272
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-6790b1d3bc9so551417d50.0
        for <sashiko@lists.linux.dev>; Thu, 19 Nov 2026 12:47:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795121272; x=1795726072;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xNhRlwtx5cb5bPluBNfUqeLFGIE6EjJ66WbcDsWZVak=;
        b=C+bqm13Ki0Xb8QN2/+5eZKgaijIBoWoO4T4lbG99UYbWoptnwzSviHOu+9C4bgRojR
         EmeR8Yalg5OVNut4y0j5uPmy7spTST4Xk17h620c1DOcHrTNMhH5J4WDFX5teGe2gOOf
         JxT4B+N3x4dsC4pvzaKGFug0dmAQ32AeWvoOLYg41m4/FLkTS/QUYxA5CON3Vi5b4nJE
         hlh/uWQjO7kgI7cH9n2ILv3SEFWRs7JPo5NVj34SWgsaCXGXELLBGrZE0jpmEB96qN62
         T3FdbsbIjyf21c2n8qN4rPHOk/Si85Ty3zZtBY1DWuCQhGO4ReFERkYfTvY7CHsPjuHc
         ZsOg==
X-Gm-Message-State: APuU4Z8ykG262e5oELAwFapCWGAFObVUgCRKhvaO55DcjoOeyrLcAztz
	5qr3285xidPxzN6eMrmzt5cT8vjThTebKs9I2l4iYTUcuByTSw5PoNgSafdi5F0zIubMN8FgCLM
	lnSxwtsBXRgFc3aJWqZ/7Q0bbAPTQ7ayrRET0kErwBOk7alr9rMvbHy1OA6BefDv2tL9xx+YKNz
	Oqx/rFsFzkkBgI2D0mnRFiyfYg3fe9E3pySvFCfK+LDV+4oKM=
X-Gm-Gg: AZFdTZcf+9JNzXQs6CHYzNj2HJIQYhMRNYacoXmh+31A2Wkq2J2egarbfAZrG/+xo8U
	2UMHwbVPekfUzrmt3A1SuYytmKz/K1z7su7RZIvaguzHzfqApE+gC+2BOhwFug1vDJyz3aP/bO9
	6R+HGp9lpYiqvte/eqKDKxT9ko+clQFPQmb0WcUKKAxlA3phyrFeljT+HZ+OjLTBzeaupPIM7Ve
	Nj0vrakW2Kx6CMr3Azm9MlE0iD50P15MIIIVvJI2ApFgQ==
X-Received: by 2002:a05:690e:47c7:20b0:67d:bbf9:11d5 with SMTP id 956f58d0204a3-67df443ce21mr278102d50.55.1795121271516;
        Thu, 19 Nov 2026 12:47:51 -0800 (PST)
X-Received: by 2002:a05:690e:47c7:20b0:67d:bbf9:11d5 with SMTP id
 956f58d0204a3-67df443ce21mr278092d50.55.1795121271047; Thu, 19 Nov 2026
 12:47:51 -0800 (PST)
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 19 Nov 2026 21:47:40 +0100
X-Gm-Features: AclHuK9Fi9WpTfO8Eb-J-_o_skDYGjLio4LrxDauXEbi3tf7evrk9xnz3_GIFLk
Message-ID: <CAHc6FU7EXurbE8vb6zzfhsURRAYnCfqJ2ttDXYsFHMsHsvbH4w@mail.gmail.com>
Subject: linux mailing lists: add gfs2 - #921
To: sashiko@lists.linux.dev
Cc: Roman Gushchin <roman.gushchin@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wxY56va_BY2gBAQC0RhHBAIgkVpy2vdYikbRqccKy5w_1795121272
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

could I please get Sashiko review emails enabled for the
gfs2@lists.linux.dev list?

https://github.com/sashiko-dev/sashiko/pull/921

Thanks a lot,
Andreas

