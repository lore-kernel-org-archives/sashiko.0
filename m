Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7370B3C09E4
	for <sashiko@lists.linux.dev>; Sun, 17 May 2026 17:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779037392; cv=none; b=TjtsV8N2CzR69Tm1Gzwl4G1eEcvKkRBy/etwNkKtsagUauBZcD2Iqvg3I9vGGedLSmBf7ewLnVBvvp/+j2sTKmaHuOAHXSt/Sx/uiCgYnkYurVVU2t4UWuuZuexq8/6yb5OgM+vazmivJbOOMgscpdddAclazEf6RN5Y2b6FDF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779037392; c=relaxed/simple;
	bh=fmGU1a3JUtDAfSkb1ysgjk50Igs9SZg4YO7mAgTgXMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kNrxkndfQawzn1Gdy3joQrZ4vsdNtOJ1Our5pkiREns1jpn/dt5f53lTLm/aQeiBu63w3s0QmV3PDopt8PoTdgMlZtHUZO5dgKubgGRkKAQFeYjBEDJ2/sXRPO+KRIirXFeblXQiJZu7sVH6jCu0q4OQIKP7F3Tqi0tyunw6XD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/FzPLLy; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/FzPLLy"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1354403c610so4127872c88.0
        for <sashiko@lists.linux.dev>; Sun, 17 May 2026 10:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779037390; x=1779642190; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RxZzJ8loHsHzHiG1YGaaDtbPexPWvx/aX5IWl3+N5yg=;
        b=I/FzPLLyIO79F8TGJNqTBN6EDW3QJ5HI8yXHSiLnw+UyNn9KU85T1G+4qp/Ip+ghbd
         38RRplqqL3UNxeDEpuhtYrpzRaO9+oMYnA1mzXhKBQnhGZm4B1ZtOT1HaXwtXKpxun8r
         7C+QRoUQfciJu9UgT6hX7ZcCCf75/pz0Zm9q5tJ2/bGpM0yCnXoKWQ9GM9V3xMd1KkHj
         dU6PJBngtm0EQ9So8llXlcrJ2m+G3tyb3HZ6liG6QkdpYtD0yhphQxPOmWKvg07HSS3v
         zG03ByX+vxzNJU0tZQtvFklfFLJpU4EoBbtvWMHN6H2JF3+GP8edCC9bLOXeKLWM9Fwb
         n3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779037390; x=1779642190;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RxZzJ8loHsHzHiG1YGaaDtbPexPWvx/aX5IWl3+N5yg=;
        b=FYD1UvrA5bKq1WBhuGaiP3JZObrrjEu0uFPO67wFzX6Rx3cyWDo9Gj7hchhjuu0Xz1
         uAoo9Ehrnt8v9QbqYOge1+bhM8AtJayltft44Oi+Om/hobImLxxInyPN8RLLs0S22+zT
         X1V9uWR4Y3VHybvI25T8sAe3kRLC12ltBj6pW+BYBOMg6WdjIuZO59dkVmX6zR9cRPTi
         fYmxNC0u62wsXYBgiDQRbP1u8o/LvvO3Q2nbQSfPtbPhOhfWz1QSt3MrV1WhkA5qgkXt
         WXbI1wLRDo6vrMcCzZ11vZogaPfArLedYAW5j1PkrmOuqAfm+Mqt/qf3ECvW9wmtALhs
         QYCA==
X-Forwarded-Encrypted: i=1; AFNElJ8fynGIbiaSZ0H3uy9Ge3S/QaKX+ik2OfjeVKltZqAPjaj9BUzgHh5nzSDw7nb5eH6PmhywA31G@lists.linux.dev
X-Gm-Message-State: AOJu0Ywx6P2sVojI75RE+faBd1pgfAHNlszsRBGhD0uGll833wZqsWjx
	CYhWkSXaVyxydzjB3FlL2w7mj7WtQUKriIM6Iy87YBiCwVpq7SUowZ47
X-Gm-Gg: Acq92OFVvoRlbQ/VKNfVm6zyP/GO9VrtUgUDgFQJdCRdX2R8jeBd0gcwFymp5oSy4jw
	R3TbB/lZ3P4oJwTLuxxTKC9B0Gh+Oz8hAnMZIj0c1E4u401EOQsEXRacyxy5ovHtWdF4rwSMUUX
	eP1t7Mfv/knTjuK34YlIuQQxcKqfT7ybHfX8B6fyXiiSyHLbzL7AzMIUDBDQ2jvOYj9oVn1mzSX
	p5LlohPcAdIsiR2FioZVgziVPpGetTJ6X8i2p4XF1mYP03RBeTQOQbtAQ1ZNR71K4/NNpkZJNYz
	Kodr++Zf1LkeWBGRirHrifMdwWdr0fD8xjRPqbL04S3m3MtgufxDlohsxvb1OlCiucAWsZ4MrYq
	oes+WnQ5FijkleljU6uciQGbsoJR6r6LhL+gZiu5+ifR0F1AMXRLhm/BqJxyvlUYHfL82sBdVdQ
	zKzO1q9QLGKv9wbtgzR31juUIBxiVEXQVOL2bVzKGpmT+F/XCiQ77b2ov3wJ5auxBUV57hXPKZ
X-Received: by 2002:a05:7022:ead3:b0:133:1be4:a357 with SMTP id a92af1059eb24-13504b5ca77mr4953896c88.1.1779037390462;
        Sun, 17 May 2026 10:03:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbdce9fasm14793397c88.4.2026.05.17.10.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 10:03:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <229aeac7-5799-4af6-9fb8-9381b3b476f0@roeck-us.net>
Date: Sun, 17 May 2026 10:03:08 -0700
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Stop false review statements
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
 Krzysztof Kozlowski <krzk@kernel.org>, debarbos@redhat.com,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Konstantin Ryabitsev <mricon@kernel.org>, sashiko-bot@kernel.org,
 sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev,
 Linux Kernel Workflows <workflows@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org, kfree@google.com
References: <4f3d7f48-5766-425b-91f6-0acdb5554584@kernel.org>
 <07602616-412B-4ED8-95D7-588C0D077EE3@linux.dev>
 <20260517120556.248852d8@foz.lan> <2026051758-superbowl-baritone-2705@gregkh>
 <20260517183959.37441984@foz.lan>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260517183959.37441984@foz.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/17/26 09:39, Mauro Carvalho Chehab wrote:
...
> 
> It is not about the model itself. It is about being able to easily
> install a sashiko locally on a container and easily make it use my
> ollma server with the model(s) of my choice. Right now, at least at
> from its README.md, it sounds that only closed source services
> are supported.
> 

The README file says:

- **Self-contained**: Doesn't depend on 3rd-party tools and can work with
   various LLM providers (Gemini, Claude, and GitHub Copilot CLI are currently
   supported).

Sashiko is open source. No one prevents you from adding support for different
LLM providers. I would suggest to submit patches to have it support whatever
underlying LLM you want to use that isn't currently supported.

Guenter

