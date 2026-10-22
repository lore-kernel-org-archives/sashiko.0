Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792684154;
	b=t9XkPMn0smKZGAmrlv4MlfiTx+J9Kqj5n7cH87j+f08ED0Al6pVJ1Yx6OwmhjU6eLtTp
	 VIWzb/zT3oEIvaYER2X52kh8AJuVcZYM4uibVPbA4gf1D18GuSh6VJ6OvNP2W+K8uUweU
	 lztiRPNf0r8Pfx1bGkNDQ/xcwaCkxRH5HsKm2u6qbOsUVLnHLQTSgNn74WRxxEQrdYynH
	 /rAhe4et9JchF5ePCocyUt7ED59yhz9SiaTUf9T1ItoXR1jP+wQQmxKUp2fv+x706/+HI
	 FxbnkNar4gebyRGgS6TkAo1DePbJMJg0UaC6Jn2QRaFe7mWcKf0PHmX1Q5BY6uwLLuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684154;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:In-Reply-To:
	 References:User-Agent:Date:Message-ID:MIME-Version:Content-Type;
	bh=fT8Ya1Op87GUrpK4YMhzZpBMHsNUcdW4n48pCvXCzHQ=;
	b=ypWYtMDslMrgwmIpUF0OHTe7B7/tyqJNnle9Eme3Wm2oTE9847HbmKE3Ce463vrrpfdS
	 mZF9yy6KnhtvxWguKNsbzwpeXwio/4+7x/x+a/8fdisuZ9NOBAfUQio1C1w6gpjXJAWOC
	 2N/xayPNJ3Ie2Xyuj64bmLPuA9SZVkyW9Zpt3DdfoCy6LTxDiKnbz3AHi1DNfYTDDAgYf
	 CVuigur+AtyP4fLAZd4A1zxNFBQD3E4tKN8yUuzLRqs82B4xj47BzsgAnp88aR/t02/Py
	 XxAo3b5bsyT+kqKIw/H5xS3XSH5YaWFMRb23jQmdywi4+t7P4N93vhYaGPnv6qWEx6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gm0QHVFv;
	arc=none smtp.remote-ip=95.215.58.86
Received: from mta1.migadu.com (out-86.mta1.migadu.com [95.215.58.86])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71571606A319
	for <sashiko@lists.linux.dev>; Thu, 22 Oct 2026 15:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71571606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gm0QHVFv
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=fT8Ya1Op87GUrpK4YMhzZpBMHsNUcdW4n48pCvXCzHQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792684151; v=1; x=1793288951;
 b=gm0QHVFv6pqEbyGAJYdWYBPG/owToPsM3u5iAS5nrm6+JOYVEjaF2YlaZvcfj9y0lwWPNOdU
 a5zrlbI8YCVvJDli6aln7A09ACXf0LKNGpVVBtFoShCu8NB5Z0isTxIPhcdrn+xiyemyVga/PE/
 UgkzVuRn5V8fsjks+8vtEN5k=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id 7cc6c7ca1ef52428;
	Thu, 22 Oct 2026 15:49:11 +0000
X-Mizu-Trace-ID: 7cc6c7ca1ef52428
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Andreas Larsson <andreas@gaisler.com>
Cc: sashiko@lists.linux.dev,  sparclinux@vger.kernel.org
Subject: Re: Enabling Sashiko reviews for sparclinux mailing list
In-Reply-To: <a08430ed-9e39-456d-8863-3fa478368134@gaisler.com> (Andreas
	Larsson's message of "Thu, 22 Oct 2026 16:54:16 +0200")
References: <a08430ed-9e39-456d-8863-3fa478368134@gaisler.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Thu, 22 Oct 2026 15:49:08 +0000
Message-ID: <7ia433txrb0r.fsf@castle.c.googlers.com>
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

Andreas Larsson <andreas@gaisler.com> writes:

> Hi Roman,
>
> Could you enable Sashiko reviews for sparclinux@vger.kernel.org?
> Preferred configuration:
>
> reply_to = ["author", "list"]

Hi Andreas,

Added:
https://github.com/sashiko-dev/sashiko/commit/bbb84c8e441f9000de69f5a93ccf460cbd5b233d

I'll roll it out later today/tomorrow.

Thanks
