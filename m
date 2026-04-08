Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25B83D411F
	for <sashiko@lists.linux.dev>; Wed,  8 Apr 2026 18:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775672943; cv=none; b=YYmLWoE9ofETM6J9TKBJJVPtbow3xy5k2RQ9m2EZXRd2SSQxqMjJ6TwPr6/h6F9yn5d3TlHAG46LXXR7hjXsdK4ZSGd9Pk6SnLwjYO2RMc8VbHo8DIRK7sT3dtaOMcSQ4fcq2SD6cdLk37uxTM1k34Dt5dr7LkzXJq/2dJ+6CaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775672943; c=relaxed/simple;
	bh=5S8VYa0GXE/Zlaad2TIy8VmhgVNqxvPebGLVsszAja0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GUIlBPFbhVkLfysGFKv5+VeXrEea0vL6ONFBQxu58FlEHqdQI5+8oMjK3vteHv8q9JLVmOGvnTjjDBewv1Akso7ixfLyew2E5r4ZJ263FXGeeuIWEswSbKC59Bq7dKUQiloeusDuVxnQl0gn52SMetTl4lDCyRc4RzA35CHswbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rDoh/hWH; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rDoh/hWH"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ad617d5b80so593225ad.1
        for <sashiko@lists.linux.dev>; Wed, 08 Apr 2026 11:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775672942; x=1776277742; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OyngqIxaxFYzpV/6aMw4CPqFH32qvm844RCrcmvEmMg=;
        b=rDoh/hWHljzW6GRZBmrm3hafjBxdxtLB5k2rq0o6Q3m6Bcm9uQD4ZRgr77D4aCkENJ
         BcfrZZN4tCWcOnz3qsOcypL1q4X32BZvNCQGTlWomwCu/DCiAUob2lWOu7NI3wvAp72a
         mTDenbdLvgf2CYUpTboVly07HZi8/ZkUqlt09K/t3YbMohnQ6YqKQbMziBcOQ6tpV1MO
         kMP8S04696G1hrOBEx0Xyn1dQ4aFk2I1faZuWXK5bJBMFI5DOMiRzVy7jyvP7zBskVTT
         e17FLaVvL7En1yFjrRyodrzLQjOY+lbrleUrFGRIGMRAJfiHxXqZ+zdZmvOl0B/pivsC
         Rgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775672942; x=1776277742;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OyngqIxaxFYzpV/6aMw4CPqFH32qvm844RCrcmvEmMg=;
        b=Y4MZsvVWZZBkJuL+T7s8YJUgsKBJ8d5KksbkcFDBgC/QWFNEUSxeP31s/Spt7++16I
         9IMslNzOrkklo00P9skkMTx55Wr1nkA9cKfUGFYL+IeEkN7p8QFtU6kFy4q4wpjLQqPF
         XPTDbpEi/v/Y8Vg/qc+GOy4DOxG9oIWQaAKEjuRDI5DE0io6IlRxhqHx66vk/xedgxaK
         mWw4K5GpWm7A45QuCBigWTeW2m5VoqhvrXG7gJLSls8oYJt4M2CjqQBPbfMXSqAmDiYY
         dnqxv2gZigEsjGDytMa1jM4EQz97v4s5YlLSa0uw0eCiyMUxjGar5nhsou/HdF3SIG5H
         bpoA==
X-Forwarded-Encrypted: i=1; AJvYcCVRq6GeqJIfioEly5c0kaD57aKJjnT2xoCRv0GicdmyX0iNsbpbjrrBtFzMoHCC0Mm6xrBDadBB@lists.linux.dev
X-Gm-Message-State: AOJu0Yzs4BOPHCr4l2dusscx2tyNbtXM1Mr2QlpwS81zRSAnLb2E5TPI
	ggh/h+ntAND5QO7csRRqxFzW+F9Hpb2Fxttu4eIvd0iyq/k9wTI+2LNRzvwacQ==
X-Gm-Gg: AeBDievjUAq/BDlDCFxxuVH7iUBWRm5Ite+XWZ3a83SuaMLk28v0iPcLQUGVRDNFXQr
	p/7m0laHFhMuqBN0b2ieYmBSQm381nHHDBquEdKyZvQtjx/dXDChHsT4KE0J2dD+wtB0cesAaZN
	boS8+o9p1idRu7NageHwC0yP4AkEM4RLBJ1Qavm00Xs/QLwZ7bPy8BPH81Be/TvPiQcNBiu24Dz
	p0IKyiWu4Uf/Il3AHJz+GNpAqbpY/1mWQ4l725gFSTRLFdcNYmPrDR77ZSEULCPn8o9pZiI9Kd4
	ybBIf8+tLj1CwqwBHEHhkRED1/KcYX93zzZUqFzoXAXMmVfw+ZyuejfhF0IccQZpJ9jvwCzn178
	LkM8c9Hw1yvrvk9k47rq0E3/U+/8mBJ5ltw63fJBkgLFse5eBO3UzD104nUgWTd7UzBmAZLfM1e
	DoEt3QVrdk6Z97ycSVZR/4J0hmtdPL179W72HX/tkOKH+41OkIhAUFvHa0O3B8W2+2hIKvCGEd
X-Received: by 2002:a17:903:22c5:b0:2b2:a6a2:c8ca with SMTP id d9443c01a7336-2b2a6a2ca50mr118110235ad.13.1775672941942;
        Wed, 08 Apr 2026 11:29:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbd4dsm208012555ad.76.2026.04.08.11.29.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 11:29:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <746e049a-4fad-4d90-a667-1c730adfa226@roeck-us.net>
Date: Wed, 8 Apr 2026 11:28:59 -0700
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] hwmon: (pt5161l) Fix bugs in
 pt5161l_read_block_data()
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "cosmo.chou@quantatw.com" <cosmo.chou@quantatw.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "sashiko@lists.linux.dev" <sashiko@lists.linux.dev>,
 Sanman Pradhan <psanman@juniper.net>
References: <20260408163029.353777-2-sanman.pradhan@hpe.com>
 <20260408170851.86E78C19421@smtp.kernel.org>
 <20260408172240.357487-1-sanman.pradhan@hpe.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260408172240.357487-1-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/8/26 10:22, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> I think in this case as well, the feedback from the AI, would be a broader
> pre-existing locking question in the driver rather than something introduced
> by this patch. This patch is only fixing the buffer size and unexpected
> positive return in pt5161l_read_block_data().
> 
> I'd prefer to keep this fix focused, if that's ok, and look at the
> debugfs/hwmon locking usage separately if needed.
> 

Yes, that is ok.

Thanks,
Guenter

