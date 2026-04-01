Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20AD315D53
	for <sashiko@lists.linux.dev>; Wed,  1 Apr 2026 23:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775086554; cv=none; b=ZydsKLe2EPr1JngnofXtiTXHOnymyrmSSETkPb5fUtp5hGFfdNeYPuXH+/TSZlxseUxXr8ABB6yjVYCL6WRmcHvebR2O7luV5Y/+gQ8Tlua7iF86s9pS3RTzF6OmCAj6tehVr3AmvtAruy/aKgk2/+qkyVM2X4PNumLBCFQrVy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775086554; c=relaxed/simple;
	bh=h5k3Xx4lObwj4IO8cFxWfuy9O+uGkMuCLqqzf6mDyFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kcT7xA1pp+hpB7ZDg6XO1i02A2tndpLA7J5qHPCIeY57gUpRnbShemq5AI3R7puJ7OegAYcMjGgKZRW3pBzPnUp86XpSG62Luir6S6mtWd8+pB8ZNeVwW4xbsHD9FyrUp/w/qvvgzysgMvKCC7Yy1gep4AOOr9k6Xqvcn3OmXDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PQPNnKK6; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PQPNnKK6"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-67c22b05346so183384eaf.2
        for <sashiko@lists.linux.dev>; Wed, 01 Apr 2026 16:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775086551; x=1775691351; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zfjh2JtIM03zvg4bBCmPSybeaL43I2wt5CLM1EweZGM=;
        b=PQPNnKK6f1m51A+91SLDgy/AbWJhTWzsK9ccBzQgUOvEc8/Y2MPuzxawItiYMDHb3u
         Iwb1vvsDnRFdwiGw8LDP+FclMiiiTJP7nyU+n83rhFHdxy0jjd1WpTieixYyx1uPISjw
         AZ9ZPjd3/yOAxSwOV2GkieQWBGoVKHVS66suE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775086551; x=1775691351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zfjh2JtIM03zvg4bBCmPSybeaL43I2wt5CLM1EweZGM=;
        b=FoJ6a9nru/az2weBYau3x29fuImtssC+/pBivZv9vSHzsdmHnVOLOSgimF6cclJzo/
         WP7q84sOKIndGTKpbNBxvHAkazjTYYj0gYt6UkWDX/kE3U7OtiSBrI+X4gl3LIxkhkzg
         N7pX1sDQXoxxpQ+slw8mTug3E+J7cUThY/XFSXy3ioVBTi+Mps3cMXQbLA4MArxS0oQj
         F4WS9EAm3++wAVCDmaFt/w8h3JhDTZGQ/dZ0nYvYU5JDJVFJ0kcV6+VXyr3RYf3wu3PP
         N4wQ9k08C5AocTT8FlvYIkxapp9IXpPRow0Mw8wqeVYEEfll/Uhr53yJyv9I+JUdgyOx
         K47g==
X-Forwarded-Encrypted: i=1; AJvYcCUpl+UOrFSRTFl5Dzi6K5HQdOOT6ia0EEPXBFTR4MrNcG3KH45UYADbNzRbIngWWtwuGbZgyRVD@lists.linux.dev
X-Gm-Message-State: AOJu0YyOqJldMKW3eA0e7aSK+L3WB4SmPpLqyunTD+ge4SYUzCBWsjaY
	YQalv7Y2u8cfy0EgdRRdV6C5bIncYPGohTuP71r+jq2ZShlakiWdY1mnYMnUzxHzp34=
X-Gm-Gg: ATEYQzz++OXLZqXg0/SJwYzPGlWEh4oOGOIfXNlFhKjHilHEIDuVIWpEEIPwmVxgtM0
	i1lCkxK9MFjzXCKXABggAv0uv6n0SVWQKsS0tehCYrzPXWH6rBjUi5m4dKyHBKCW7Uov1oGzt3z
	0P1wrCLrImRjFNUrrMIma6ik2cyNodCR17mZanIhdzzG9j4lGquQYfqEtVd4UfK/Quz7NZul5LL
	K4doRUyoBW5UVBDdIKBcR5MFD6UGNYIIUcT5wgY3ukMCjSDp+bievwVPJ13v/MeDcOfd/D7lEPR
	hYOzLWbBzOvcgjtnGnUMFUNeU0O1f2G1C6P3TXP+uvCeW5y+FgCOX5UZSImazRHx+6lz6+JJmb2
	1YtVGinLkN539kocQd6QnTipe0TTh7jzvxhgvZVbcH4t26vj9Oqd5d0dGeW+fSUA6HJvjIHOvVK
	JrESsL50VI/YDyYyyKqjgZx3TduaEs68UutsQ=
X-Received: by 2002:a05:6820:1897:b0:67b:b0bd:8bd2 with SMTP id 006d021491bc7-680a8548b56mr858545eaf.59.1775086551530;
        Wed, 01 Apr 2026 16:35:51 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-680a63c7fd1sm751543eaf.8.2026.04.01.16.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 16:35:50 -0700 (PDT)
Message-ID: <8290d427-ae1f-4e90-b988-c209e81ec85c@linuxfoundation.org>
Date: Wed, 1 Apr 2026 17:35:49 -0600
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Sashiko.dev for kselftest
To: Roman Gushchin <roman.gushchin@linux.dev>, Shuah <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, sashiko@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <d0dc7caa-052b-4d50-aeb8-60d3327d1130@kernel.org>
 <877bqqh11y.fsf@linux.dev>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <877bqqh11y.fsf@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/26 14:34, Roman Gushchin wrote:
> Shuah <shuah@kernel.org> writes:
> 
> Hi Shuah,
> 
> Sure, will add later today.
> 
>> Hi Roman,
>>
>> Please add linux-kselftest list to sashiko.dev for reviews.
>>
>> There might be double coverage for patches cc'ed to lkml
>> and other lists such as mm, net, bpf etc. Hope that won't
>> cause problems.
> 
> It's not a problem at all.
> 
> What I believe might be a problem: kselftests are mostly userspace
> code and at least some parts are written somewhat loosely (which
> is totally fine for tests), so Sashiko will report a ton of issues,
> many of them are not worth fixing.

Good point. Maybe we can also find things that are worth fixing. It will
be an experiment.

> 
> So I guess it will be good to put down a kselftest-specific prompt with
> some guidance what we believe is acceptable in tests code and what's not.
> 

I can definitely do that depending on what we find.

thanks,
-- Shuah
