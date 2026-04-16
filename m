Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB5C33B97A
	for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 04:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776315016; cv=none; b=UVdsBMVfzjZwXKCmPjAjxFIrl0dH0clZW02hcXgwcmBR+2EdKP0e5LX/XdXCz2DAl5D7qSMt6X6vynRVDagkiPzAML1sRhA9z3kqXpJ/vkjZNTZlQ5VHFrZI3O4nRhLVhPSU0VPYsm2zfYj4tkvw9rYNJAEGrWQrhtRt3G5ygx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776315016; c=relaxed/simple;
	bh=Z25tbuVDAtKPUasQhv8bYTLmQCQUVmMKyXLduvwM1m4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fm9HhQ7klXghihCtn7BtGtNvAvdzilLjFywZrRbYO7tOKjilnWFYke0lE7GqOYZfdROBA7N1aqmuZNP2KfcqCr2g/fpHIlS2bPRnXGtewYQCHqIOtn2MePIE5WyhTEVwV76nqpmPUYmQLWs7HRg2SBqC3BZ/WC3wErazCg4KIO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncATzX5k; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncATzX5k"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12c565476d7so1948694c88.1
        for <sashiko@lists.linux.dev>; Wed, 15 Apr 2026 21:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776315015; x=1776919815; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=POYBr04RvjL/xRMpDtloZmJ7yANniaqfk1d/StwPN0g=;
        b=ncATzX5k1e5RtzvfslVvWnUzWZj3k0zWAmhRXI4qlJsyDacV0ihbcZisoFamJHRdej
         gPuU6gb33Uv6dVtdpRnxOekF3njgb4CoMbLcCYOs8UyxHG40ADzlELb6TxZNHchpN7YU
         hLQSJU0JehN5pe6lTkZM2WDp/bnjjK0yV4DE0qdkVB9HLOQiKi6NPs5+HwGP2JcydFTn
         fTDeU15k0DUqViLapcQcSAyoynwOGqtdfUeJ/sZGmFvk/YcREyY8XAVCe5FvotVp3W3M
         tSxguXvakH/SQN3G8U2pNC029eGxg4TO7Ky9xVauSX48q57hFnj6NglY4Qu+tiZQOQZq
         I2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776315015; x=1776919815;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=POYBr04RvjL/xRMpDtloZmJ7yANniaqfk1d/StwPN0g=;
        b=e4NtP/qojvIr07wTZ7jdeqCyBS0vxpuyegfpagCK246Apajh4TfSMU7JRgeUO9257k
         AumcAcIKJlBTt1AkYoaqxqcIsKCt6E6jD0Iwwg4LrWFzDhp+JQXNREGk9GtUn+nvhNyh
         yuXW9nB5GyZaVAgLMirBwAp5HsZyHG3e2Fo8JVvajThj/0HHVpGl6UeRKryIcElfiN4K
         KFFhpUoAPYEM/4YP+VOHfRAwNSDgRSXqVWm2CH7w+xNjkYviIsfGZ807o+GDkFl/9lfb
         G1BQBDdkVZzmBhkD8aygV3xoNdh9fFwsnFL1AfJQzlSyxwX25NhClHNNJD8gJ+MGdSZv
         mocw==
X-Gm-Message-State: AOJu0YyuEXD1lX1+HtfK5fkE3MXWmNXa5tcdCcFK5F+KsO7zuzu6cGL6
	xrWAw3iGFh8u2RK6kSJGTPypfiFxQO0UkEN0wDL/PBFBueXAuu5HB1yE
X-Gm-Gg: AeBDiesRUm0uG/S+b0m2N2ifWW+bnxSDN+NP3UadcXjY8YOnvZVsval9yMz0HgBUfsw
	nuxESCvTcW7mN4FVNdOvqtecSw7Nvn5V91BC77blkNNUaYnO+Nk02M9LOhYdnfkBAgRiKiElyhl
	zNaR1u8DxSISa7l/FLxYf8md6j6asIT2+YNhH41P/aAfypx4ozGroWDHLifw3SlsvTsiDya7HYx
	s6AUtVzK/IiS88BG2PYcY5p31Y8iTfnNmljrsDjatiyspYDe+9VVjzKBBhvnH3yOAMpUAwT0cIe
	R7gRNUD3WPfp+kjhKXSBkYlH8kimBunM85BWcrANbYmYNd+pLp6VAf0cT4qSsMNfTsKMLqjMJ1+
	NqLAU804QnnCxSNvO6jF6Pes/7QYoEgl9cABiG04LQ9Bnkh5v9bzSbXaoX3it0gkrx+bgVke5EB
	fHgrZzzyGlDCpxXHGEeS5w+iNLQck9fEsMk/+mCh+dHPcXzB/xhCI4XshsiJfLieJU
X-Received: by 2002:a05:7022:618e:b0:12a:7165:7405 with SMTP id a92af1059eb24-12c34e599b0mr14444554c88.8.1776315014714;
        Wed, 15 Apr 2026 21:50:14 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:d5d3:8a61:7d0b:71c9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e62b9d1sm4651917c88.5.2026.04.15.21.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 21:50:13 -0700 (PDT)
Date: Wed, 15 Apr 2026 21:50:10 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jason Xing <kerneljasonxing@gmail.com>
Cc: sashiko@lists.linux.dev, bpf@vger.kernel.org
Subject: Re: [PATCH RFC net-next v4 06/14] xsk: support dynamic xmit.more
 control for batch xmit
Message-ID: <aeBp7gJSEIYRfS2K@google.com>
References: <20260415082654.21026-7-kerneljasonxing@gmail.com>
 <20260415093539.4A4BFC19424@smtp.kernel.org>
 <CAL+tcoDUa=MpXSEtweT0LvkBEM2hcYnrjn4FK-ntU3WNMbLEWQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL+tcoDUa=MpXSEtweT0LvkBEM2hcYnrjn4FK-ntU3WNMbLEWQ@mail.gmail.com>

On Thu, Apr 16, 2026 at 11:43:53AM +0800, Jason Xing wrote:
> On Wed, Apr 15, 2026 at 5:35 PM <sashiko-bot@kernel.org> wrote:
> >
> > Sashiko AI review found 1 potential issue(s):
> > - [High] Stalled TX queue due to missing hardware doorbell ring on early loop exit

Does sahshiko bot have reply-to set to "sashiko@lists.linux.dev" by
chance? And can it be changed? I am subscribed here for discussions and
news about sashiko itself, not for replies from all different kernel
subsystems to reviews of their patches...

Thanks.

-- 
Dmitry
