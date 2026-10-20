Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792527319;
	b=ow5jXgEgvQ/3oshKU4YrbWX5nNS+VMAkV7QKJ0s0cMlFAbJv5/aOl9/khWhkp0pyU1o6
	 Ur8fywqctcK1PdaVjC7foJoWsFg1V2YsnbCXQsn4O2Gi5ceihu+DTCutWzTc83YT9HCAt
	 yeMQRrdHFHxLzN9HVv94blM6Y9ju9qpAvDAfubNsSRRadwkzb+baZAE31ySsTk3UJbP0m
	 2yE8shiLBWOd1N8Uexf/zkYD7nRnC63a0dBYl4JUCnEJZzwCKqFSem3f3UDjhagWc1J+6
	 x4aRlD9dFskOCMfpDyH4BI/xdAcU1XVfLKjogH3E4Uu5FQrtK0PGdON1q+hBt6/hJhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792527319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zuMGgZ7Lo23Sg0+pGBSKzCAKw4QwjSQ2yujNqSDyYA4=;
	b=HuWGTHL3rOSnSrsKxZaDogyPhnBuRptXvLJ7MCFsxpYirFIl4YGuzBbwD2oH5c9Ky8Vn
	 MgnPS5Etes3uM6ocJLMpRlaWrMi7PEVlPiVWjoonlrfg9Cv9racOtrmswpq4CPVjjgGIr
	 i0kFRwOzWT0iWZfYV3fGpFOuL2PGa61oNmazTzIdvMa8bXP6JP8LVED5k/wpEUe8f1ZP0
	 w/+9ySngMelxPeBgCjuy3UW56JuSqF9QsyCF7dT2rkMFSZkIW4k5uLMGm0dg9SlH5ulFV
	 0pbdFQPpxuRgp+SdfAb06KIIunPKbqfoeu288fsBf42H0Tpd3LDtuhP0r9WvyhQa5nw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N717E4Ur;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E8C606A325
	for <sashiko@lists.linux.dev>; Tue, 20 Oct 2026 20:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7E8C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N717E4Ur
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3584f70a5aaso498340eec.1
        for <sashiko@lists.linux.dev>; Tue, 20 Oct 2026 13:15:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792527318; cv=none;
        d=google.com; s=arc-20260327;
        b=DwolUm7quaqECbbHL71PPkLqYzW7JdOod/0QKe0B75nylL0uSKDH20Sx7aUY4+0em1
         pr3cJVompfpeLzw4ed0SN+2XW9IpTTbKgsE/w5G//9sXUA0DUSc4x4VLv8jxa8y8nRYC
         RznhU7pG/tyVpdBIF/m2saPooSFVkECA+w/z57T8L/gGXN8z35ezmzaXt4Q9iOU9sjok
         0CvntHfO9n5o+D28G0o1S1lqEYV95vzswyjmfhfNco0sa5IHT9IiOs7BfmTOVhPW6iyg
         mGz9bWEDIFDLbNOOyR9ECu0A5NBRssuGH/IHVbRJNvRv6elbQ9IRPS5rgNSNBB/SmqJ5
         rZhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zuMGgZ7Lo23Sg0+pGBSKzCAKw4QwjSQ2yujNqSDyYA4=;
        fh=yJxc9Ou4ugJlyQh8868gxj4A6uonam+0ZpFI9PqWXgw=;
        b=Ha/YX3vHpELyOI52JxD5nj3jiWn239HWqvcQEMcfBt4OO4YbwDrF2LKRYXid4O18Nk
         f0GPnnjYthjbXrDREHleQ4GAv/UL93ts6FMFCiJ5hhoOj+83k20kzQcSskjcl/syzdf7
         M1SifqD2mczAtvuGvnmKTUqha9mhZqgNiZLt6hHVR8JHuJT4ZosZTakNfV7z5V/SvnpG
         Le8nagXjlHknH0EEEqFkQoEuUwT8gjawM6oaFK3P54VOtMRNYJBx9T3O3tX4GNWREJpH
         WVj+mHZ53PWZGszna0KtMUiemK4klLOkUjN/P5HVdn16JIq1i3uST04TdzMcTH/X9BGp
         Hmsw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792527318; x=1793132118; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zuMGgZ7Lo23Sg0+pGBSKzCAKw4QwjSQ2yujNqSDyYA4=;
        b=N717E4UrBJeY+Ve1WNqszdg+AQDBuw5/3vuqFDaN9J1bvJJaOMQWy7yXLUW4A91R5k
         y5T/ijzrPArp8y3HJeCmLx2w19s6N5jphjXKFA9954hJ+yPnCXy4sDyg570RjX9oV5Xa
         TD+FV70WwrB76q7gMJOqut1VO9uB9g9F1Qe9DettSs+lfDiQ5BAaQhIvVzER6smrOjar
         39nO9LiLjaaqPAwV4mUcSpvRYrzXvK7FMQXN9FZ3TEmsX+OTDUpj9O1mRvjy3FcLkkPw
         i5sR6aM5eK2s6PraCfK/YevVGHDBZro3WKOfWGof8FOKPKfd2ewrHizHvNSMl/IwRTUD
         /YOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792527318; x=1793132118;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zuMGgZ7Lo23Sg0+pGBSKzCAKw4QwjSQ2yujNqSDyYA4=;
        b=02I6XXfmU5R8EENsuA1KgY/I1P2CRkjQ8IMRDXZypzmeWYhgg9RAurQkXPk6c8TYu8
         y1gqAeY+GT0UwsH7jAFEbxCroTw47gmJJssszMVWl+/6VitKhsF7N61zfAf3wqBhUPt2
         uQDOjv2nbemfdCAG7h4kEtjOcjRNn6gOY01/rfvGJlt2lR7I21j3hQ30IxOiaRInNYEw
         qkjTRaLyqDycQhLDh8OVaIEiIzL/Rh0DAk6N10e91KXDgSQeedXRMLf150TE6pOjrkvc
         Go0jk2R4Xilk0NGTREmjcR8hnKNUdEQYJzwmyQMLOKYmyhjEMJ1IzYm35yG/5iWnoKwJ
         wpSA==
X-Forwarded-Encrypted: i=1; AKwUvBwNjc58U6+phLLHxHcCF98s2J+IzcPJ3O0ft7vYtNUWJMAvNkQLOjbLchVKjEgGtQaPID0lKk6T@lists.linux.dev
X-Gm-Message-State: AFq9FYJ2H06H+5RmX2CtZn7a6VwV0qm/zKqY929m8YrxRza/vQnXxpSG
	NOM+qAa+6acP6BpcChxRN/VEKXGmXRi23MJkMVGf7hJNDEcjzEMgM629lr6Q4Rq4GPrite9wEgE
	S8XcfPttZ4WG71E6/TFRGlXsHEFyS/8w=
X-Gm-Gg: AYBFou1WtSsZKRZA+eVkRzWtYTSD2pohmZzMjJNvTFVdV4Nj98vdrvNP0Dgjrz341ix
	DXLGhLH7r38ArbogyyKr8e74BUxqnu9mQx1b0EzNdRuCs9PzbIq55ae2wTm9wWz9wgAWzqp8oL0
	USGCPnrQiDBJqxJ3LBj5yuzeAD+FxdIyk1+TBWkIZ+9PBYRh8dCCiGdp8Jr8SBPcR4SfmLbzKdr
	LVDJ23C1LEr6jE1uWZTS6lTYUnJooKhx2bM/ydRYv3glyLOPtNFoMmBcbv8FL+4DQs1AzOzy6+6
	N/8Nd6iZwAKeXSV8Q8chQuYucR+TSDCR6wJ9gysCsA4x3wj2BQwqn6bjI1kXleevDi1wCWyUGbs
	N9dY2509J7nB2ePFbCoLiOHKbUJ0YSKkTmPKxztTXaKEmGTPEGL2DtPn/Ioc0qRNSZfMkfauE1x
	nuIRaQj7e9gpbZ7sQNU+ePQNq5TX64yC2n7P0Db3pE/yNldt+fN6U=
X-Received: by 2002:a05:7301:6192:20b0:33e:6714:3945 with SMTP id
 5a478bee46e88-3674c43a7dfmr646530eec.2.1792527317682; Tue, 20 Oct 2026
 13:15:17 -0700 (PDT)
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>
 <atO3pCuUxI950ftN@mit.edu> <3354ebda-5158-489b-a577-5cb10e5d5fb0@oss.qualcomm.com>
 <atZ4J86j7CXF82HX@mit.edu> <2fef166e-088d-4ffe-8d0a-0143aebc1b26@acm.org> <ate8oESqneK-3sQJ@mit.edu>
In-Reply-To: <ate8oESqneK-3sQJ@mit.edu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 22:15:04 +0200
X-Gm-Features: AclHuK9I0xWcrNX7NXWJq9hOOMbg7Ab2-5YDs1sW7wOP29vOQ4OJEZYTGTgJ8Rc
Message-ID: <CANiq72kaVqxKtH=mYTbD53M=tawzB5P+GBCuu4yHmCUgVgqPJQ@mail.gmail.com>
Subject: Re: Patch pre-submission to Sashiko
To: Theodore Tso <tytso@mit.edu>
Cc: Bart Van Assche <bvanassche@acm.org>, johannes.goede@oss.qualcomm.com, 
	Jiri Kosina <jikos@kernel.org>, ksummit@lists.linux.dev, sashiko@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 9:23=E2=80=AFPM Theodore Tso <tytso@mit.edu> wrote:
>
> but that hasn't been particularly successful.  Should we ask that
> human code contributors do more, such as running kunit tests?
> Perhaps.

I think KUnit is a reasonable ask -- in Rust we already essentially
require it, because examples in docs are transformed into KUnit tests
there, and we ask people to write examples for new APIs.

Cheers,
Miguel
