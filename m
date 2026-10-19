Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788FD4A688D
	for <sashiko@lists.linux.dev>; Mon, 19 Oct 2026 11:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410066; cv=none; b=S2TxdBXd+DNSQQ2zesDz0MciOZqKIHK2zW53h7gdCt33Vt/kj6b3LAooH5RHlNgmLA7Mcv31HxWcf0lCEMIrjHoWiUqe9i7n9wIHjutG4lvBIWjSmGGL3K/NE9yP2dDUdMi3ynCP5rhyYqOfN/b42QIcWllz3MElf6Kg5H1IWsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410066; c=relaxed/simple;
	bh=x5rb5KaGzlbxLtE8bSPd5LPcrqeysw9kRXcOnwrxfEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XdXtqCxN89ygxl5/trDkPm2xm7XSHn9qshIfPzph2cm9QLBcqsQKVnUdQcFdS7BHlSmGWlO4B45OEO/NjOrAqcJ7pLV/9c8OwHDSyDTjE3rtpLeS3fCvcKvP+OuLqkx/y0SqRR0E8TopLJQVUKmC7bnYRiUfAJGMG8v171S4mDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu; spf=none smtp.mailfrom=monstr.eu; dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b=RNU9ri4M; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b="RNU9ri4M"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c263415982eso225037266b.0
        for <sashiko@lists.linux.dev>; Mon, 19 Oct 2026 04:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1792410061; x=1793014861; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1X6hPdC1leO5321RFEyl/hVIzyixGdAcU0CBPn8BX1Q=;
        b=RNU9ri4MI3r14Z/gNF2d2ZXb2u0Suf90gpi8snok0xjcp0t7+HLrGhBsh/hYZAhqwu
         pHuOkMR3fINWjP+xB8Ig5/FKjPOG/G6II/zgAaMFmvTDBbXr4SlLl7c4qsSzVrlKzsrM
         jR9M07sMMAbOztzNjEkBY+GO76Rz2AbpxOQmbr92azKRMuUU54z0PEFB/EBpuRuXUDMA
         cra4aaRuxTl/FUJGVZbGWOIrO4Dn9o7hysDnuhJp971nW6OSQUYzDvweFLTEWN0uV2lG
         KV4aaHkbZpEyVyk5xT/uF0NcG2eVUjhUY+Zk+aaVeLtaPHMxId00FGJtdnL+tiUvvcKJ
         X3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792410061; x=1793014861;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1X6hPdC1leO5321RFEyl/hVIzyixGdAcU0CBPn8BX1Q=;
        b=YOa4KZvyQqhHMAbNP3FxRXpmbT/3sn6/D4j85hXRUk/OREqveZktjVzEmzcq1JvmBR
         /QZrrc+C773acyu4iJvkgOveqV00VoJ65jHi6AOyneneWbe8uyu/1Q6ZopFTxlbUz/OS
         KsFbgqqm9OYePo6jdonzqa+wkQRYbSYv3mtQlalrNkLuQiqKtJdNz6VesRK2jfAUo+Gz
         9QFgHmaahw607bhtgUYVEZcdnHlUDRWDyc+P5n7NjdkRZsEiVJ7YIr/SQvXmM/ObDeZ0
         mF2VV5My34eOwRk0o+yGH4GCCc5+FpNYSIGn4b1BJg21HrNcIEwLyUgMaNO4eoBcrjA1
         jUAA==
X-Gm-Message-State: AFq9FYLNJhGK2d9egDQTX1XEVxw2URtAX1jOx+tkStKQNNdaj9qpDcQj
	mAtfOL8CBu2B4xEXPdJYLgHq0E9s1mFCp5f8LsEJvof5sxjawVUCf7a53TnmiRh+v4EityYhmnB
	l3GjmGLbD
X-Gm-Gg: AYBFou28KlEsOZ5qBS2/E8rE5AX8e3MEWuuWkt+5Zb+d2gE7cUyYsGsxZpiEwdUgdzV
	+YGL4YneOZrXRhlJhrOkAeMoXc/qji7J6nb15avfTqzJQ9YWlWA8U3eQrJxGkcVDAVhuPTrfjPa
	Wy83z8yjuJgmYE8+hiKt5BVsptXlG86wF2Bc1Y3Ek/pjmLHC3Qrnd/Qs6MT6Yd3bjdZll8wg3ig
	ED3j1lgEk2Fpz5F39y29FvjLqT/f95nRbGFhkS+J6qZUYXU87JhoIH317kBBS7dJuuNnz/NXakr
	mpn67ng+peMgrqTmfI+eGuZDnhNbqCOiiXg5HCHWmlXwY1O3ND/Gc7LXkf7IWlxyAg/atQ8Cl0A
	n4Js5qpXA2CeUJnMitC8p8bSlS64/RQjhKJtLHBslDN/ZFeR42dScaBdGjex7gvDG+LBkavgw00
	uZY2GMr3DxRl2jIOV5j20YZT7gCRGcRuYxeB5d1Z7J7qg0T0ju3pn5B3AVHlN3wSxkkT0nIAGNj
	hGJmeDEMZ+tsqaNQifNzyuBbT7wiVKZSMU9cesubuRhxic=
X-Received: by 2002:a17:907:96ab:b0:c40:38b5:d784 with SMTP id a640c23a62f3a-c419e23dccdmr523696566b.22.1792410061230;
        Mon, 19 Oct 2026 04:41:01 -0700 (PDT)
Received: from [192.168.0.105] (nat-108f.starnet.cz. [109.164.53.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ca52esm365219766b.38.2026.10.19.04.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 04:41:00 -0700 (PDT)
Message-ID: <99b1de44-a550-471b-8e0f-c2e1f95d35d7@monstr.eu>
Date: Mon, 19 Oct 2026 13:40:58 +0200
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patch pre-submission to Sashiko
To: David Woodhouse <dwmw2@infradead.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 ksummit@lists.linux.dev
Cc: sashiko@lists.linux.dev
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>
 <350c7564-a833-4dd4-abf3-b8488280b0fa@kernel.org>
 <2989609157ab7ef8e9df06dbfce7a1584a987fb1.camel@infradead.org>
Content-Language: en-US
From: Michal Simek <monstr@monstr.eu>
In-Reply-To: <2989609157ab7ef8e9df06dbfce7a1584a987fb1.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/19/26 09:26, David Woodhouse wrote:
> On Mon, 2026-10-19 at 08:25 +0200, Krzysztof Kozlowski wrote:
>> I assume you mean they will be running it through Sashiko
>> infrastructure, so using sponsored tokens. Otherwise that possibility is
>> already there - you can run Sashiko, just a matter of money.
> 
> I have a patchset in flight where I *have* been running Sashiko (as
> well as lots of self-tests) locally, and then got further feedback on
> the list from the public Sashiko which my own run hadn't seen. Twice.
> 
> I still need to send v3...

Isn't it better to create a new mailing list and filter all CCs/To?
People can send patches to that mailing list and get reply without CCing 
maintainers and mailing lists. They can run a lot of iterations like that.
When it is clear they can send clear v1 in a normal way.

Thanks,
Michal

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs

