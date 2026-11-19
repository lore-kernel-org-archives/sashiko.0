Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795122786;
	b=Z/Y2h+AwJBKffHaguApamu6QdOZ840AuG4vKV3f2G84vTRXjTE05Jey28LHkvebT91ys
	 rextM4GihvlE4jNJAfVkFK2rUs2eno/CbRqywPE2Vplgr2MkJcNFrptDyyddR5Lyt9wXZ
	 LyqPZ3M1sR7iIU/GxEkaOu+upRUtWNrOBsw9tgscKzQtOCJNnMIJFyuUxhunwiPJWGGBj
	 VhyA2Lx/2GkwaTlczRcmlNxKCr3WMkKSPYFsbgDee4CdOwoPFIXXKkelb4j4wwYYxet48
	 9XNNPheYe3dqBW14fvc2Vmqd788HXG+BFV5qLKmXCw/8pJuNdCQy8GCr80ZZxI8HKNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122786;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 User-Agent:Date:Message-ID:MIME-Version:Content-Type;
	bh=NEVEdxpCfiETkhOO0yhOqSYkQCAF7nvkqLTR0MHnnQ4=;
	b=rjBuC7PTasreiK2AqvPZZoMkhS96hG+s/uPXVRpb6LI0ID367QVQvbjv1IGP/4f5+QV8
	 mmjBQrcDNvrnWF4Sx+4evLnsuYWRwmZs5QY7KC8+ct/MLuSDNOAc6foM5kWTvMviVIEB+
	 U2jJ9GYkb8eIaXIwSYRKRpw8/t8cxKv2MhZVsMIrL5zJCmvvNXA4dExYYnsMDgGs1Lddm
	 Cg8TVV0ttbOoWm5oR+/D89JdONemkZT/VwYmyhzhbdDRRrCi9vqJtFy1UpqxxHgvpBxCz
	 aZ69YJcbTAP6UdLy7bFtFMD2HkikzE2yHiij3HapvbXP5XkJL8dtTLIT7TTG+vmMSIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=korg header.b=Avb8kS16;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B0360A2603
	for <sashiko@lists.linux.dev>; Thu, 19 Nov 2026 21:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=korg header.b=Avb8kS16
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A81E1F000C6;
	Thu, 19 Nov 2026 21:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=korg;
	t=1795122786; bh=NEVEdxpCfiETkhOO0yhOqSYkQCAF7nvkqLTR0MHnnQ4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Avb8kS16nsXwPIwYynebCvUGfy986Ss3mqhMoKjecVOizcVI+aZdUpJdmTExFz4Mv
	 6GEMpACD1e4+Y62uTNYdBOJIVaDOU/yLmJ9bGNIng32nkkcMlxhX2BdlrTrONRtJ1w
	 R58AgA1AxV2Ef5GuMjnW0VAHcWXvIRmYDISpDpa8=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: sashiko@lists.linux.dev,  Roman Gushchin <roman.gushchin@linux.dev>
Subject: Re: linux mailing lists: add gfs2 - #921
In-Reply-To: <CAHc6FU7EXurbE8vb6zzfhsURRAYnCfqJ2ttDXYsFHMsHsvbH4w@mail.gmail.com>
	(Andreas Gruenbacher's message of "Thu, 19 Nov 2026 21:47:40 +0100")
References: <CAHc6FU7EXurbE8vb6zzfhsURRAYnCfqJ2ttDXYsFHMsHsvbH4w@mail.gmail.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Thu, 19 Nov 2026 21:13:05 +0000
Message-ID: <7ia433swcyou.fsf@castle.c.googlers.com>
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Andreas Gruenbacher <agruenba@redhat.com> writes:

> Hello,
>
> could I please get Sashiko review emails enabled for the
> gfs2@lists.linux.dev list?
>
> https://github.com/sashiko-dev/sashiko/pull/921

Merged, thanks.

I will roll it out later today.

Thanks
