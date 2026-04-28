Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B67043D50C
	for <sashiko@lists.linux.dev>; Tue, 28 Apr 2026 13:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777382005; cv=none; b=PQmoC7BpaWtC5isOJwwN7MPkwxtFNPWF6Lxu517OaMwku/T5T6D3wE2qh1LZ5XoUxerx8eNE5T7ZtBhNAkngWWaMD2uFawHpnNJEyU4jC+mIw/8Md2tGcoNwbqKf9uf9z/uW5impKivmQEokpplvDTE+sOnw9jzgGNWfwaiDYeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777382005; c=relaxed/simple;
	bh=WLTyOgn6Yo2LBw9Q51BSSkcRxJInShuvEO903qRo0V0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DX5nZp/BghWs8K87E1VDrryuDEKLaDseUTVwBtBKjBB4YbKB3OzDFUlRt7KuiM1WwIoxTNp3/l3O8I1FjLHRwbwGTPSCcZQ83MgboFSD4Vl+jiOEL4FaJLEkiFARggyOPMQBR6xh1LAlJQTsXHQ3taHTEkty2ZHwqWeDzUIRooY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EdRmJ5i1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EdRmJ5i1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777382003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r6UCJWpe6oz0LWXsTSAYtgVExWdfBVYtrUT8ubfZ6Y8=;
	b=EdRmJ5i1uUaffemZt7KK1RAoIcyE1MzEV0ZN3zsD25l9WcrU9nOB2FOj3UVTuPLQR5HTgq
	piuHZ6khfSHTDOX1kgnvOQVgwL37aFIk2HfO1yXEFAD1vk4D+oFXgRw1Bf6D/FrtRAhGqh
	alpbkz6HNbM0j6bWr0kCY1Tyhfdca5A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-PxKmBZsnNfKXnL8JhGWTXg-1; Tue, 28 Apr 2026 09:13:22 -0400
X-MC-Unique: PxKmBZsnNfKXnL8JhGWTXg-1
X-Mimecast-MFC-AGG-ID: PxKmBZsnNfKXnL8JhGWTXg_1777382001
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-48919890a95so65968335e9.2
        for <sashiko@lists.linux.dev>; Tue, 28 Apr 2026 06:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777382000; x=1777986800;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r6UCJWpe6oz0LWXsTSAYtgVExWdfBVYtrUT8ubfZ6Y8=;
        b=NqZnEr2+EOBAuZh7EvgbLsoZWI4qbugbMqmEAf1hBjA/hu/t8owwoEyZlREYPR9nAu
         XuUjVl7l7nt4HxTmnnLvWp/JOEGBPExrDXF1Wv2/qRbnGE/Q6rqnx9iweyOeH2lN4Zx5
         2FlkV/cyS74ZZ7Fni0CCvtn21g2g3dTCNQ8x5DnCccNXYf2AbiwIl8L3qMr7V37Q/smW
         gAZ3Gh/ZVQmoSPntoqPoDspxM5j7He25PWQB/7iHmTuQyb0a7FqWL4UHjSswIBD7kuAu
         3MUm1rBfRMgva3eEFEBxuOtgRBlQ+3s9CpaF2NmWwahWvdalAU62SoMRhpqjkrxscOHO
         ed3w==
X-Forwarded-Encrypted: i=1; AFNElJ+VlPBiRfKFs58LE40xZGVxDl2B6Im/04LiwMwU2ogVcbOQGXSoCxNS0js4BJLXeiQjdlnTrxt1@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8WRDYZq+qM40hqbLbMkTZW+5OXnLwDQxwIj9ZYgL7iWaIrw7D
	yfon25za2U3J6VRX0TSVoBGLF69unmF06TBOq8B93PfeLh4HOjZXDKKx17HBR4rUb/xqsn1EPTl
	27tVFsKJ/5Q4WTh+fPzh9TmakYk41b17dCuVigGErzoGZy35h1YxnunuDSUdl1nQfXcU=
X-Gm-Gg: AeBDietwHQb8cSYf6k+/5GWtzv3NaK8jfP1+HXNlcfADfvpElVW/UfzTj0IndLLm20l
	KUDk+UTY7zhmJs1v7xhAwNcOFmYBqQBau+M1Jqey840WOESeFfOas5fGoW1sDw8WmkFa9AIYFqi
	5jj/L3rOZwKtDymzdgkcg/3LlE4z1pjZgB403KCflBnaK/sk2cMO/0593bgd64gKGvlL0tGpq7h
	ceQdYvvVPJjJ/r8jl7RUAtgni0sTJvlZT7uc4UNqPwq8IbeUmewi3/g6QT5pkkt4MZs+vk8Jrog
	3cweZXmLVv9ONOW1Avit48JwVpFtz8NyHZSGu7AdJn61zL3xZlTfJsOUyIADDsGCdI1N3c3+nf4
	rTcdNcHtTzMIMYC64p8Gl6LFSwroMBv03pHbfJPafRV6zPFChHOn/Yyl76+FA6/Ha6Q==
X-Received: by 2002:a05:600c:82c3:b0:48a:7772:c26b with SMTP id 5b1f17b1804b1-48a77b2608emr50277695e9.26.1777382000599;
        Tue, 28 Apr 2026 06:13:20 -0700 (PDT)
X-Received: by 2002:a05:600c:82c3:b0:48a:7772:c26b with SMTP id 5b1f17b1804b1-48a77b2608emr50276565e9.26.1777381999597;
        Tue, 28 Apr 2026 06:13:19 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.9.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a775eb983sm18943475e9.19.2026.04.28.06.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:13:19 -0700 (PDT)
Message-ID: <99816901-6026-49ec-9c20-b548ed362d11@redhat.com>
Date: Tue, 28 Apr 2026 15:13:18 +0200
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4 1/8] xsk: reject sw-csum UMEM binding to
 IFF_TX_SKB_NO_LINEAR devices
To: Jason Xing <kerneljasonxing@gmail.com>
Cc: bpf@vger.kernel.org, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 sashiko@lists.linux.dev
References: <20260424053816.27965-2-kerneljasonxing@gmail.com>
 <20260425054032.28A27C2BCB2@smtp.kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260425054032.28A27C2BCB2@smtp.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OkMJf-XmVyYwgAr__aifYUrjdWUcDVyyWSrM_ICMYxY_1777382001
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/25/26 7:40 AM, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 1 potential issue(s):
> - [High] The patch incompletely fixes the WARN_ON_ONCE in skb_checksum_help() triggered by pure-fragment SKBs. It successfully prevents the explicit fallback in xsk_skb_metadata() (which wedged the TX ring), but leaves the implicit generic network stack fallback vulnerable. If a user sets XDP_TXMD_FLAGS_CHECKSUM on an IFF_TX_SKB_NO_LINEAR device and the hardware checksum offload is disabled at runtime (e.g., via `ethtool -K eth0 tx off`), the core stack's validate_xmit_skb() takes over. Because NETIF_F_SG is allowed to remain active even without checksum features, skb_needs_linearize() evaluates to false, leaving the SKB unlinearized. The SKB is then passed to skb_csum_hwoffload_help() -> skb_checksum_help(), which hits the exact same WARN_ON_ONCE(offset >= skb_headlen(skb)) because skb_headlen is 0.
> --
> 
> commit 86ab0a4900aa60bee0c3df7393a2846b5ff74ccb
> Author: Jason Xing <kerneljasonxing@gmail.com>
> 
> xsk: reject sw-csum UMEM binding to IFF_TX_SKB_NO_LINEAR devices
> 
> This commit attempts to fix a warning triggered in skb_checksum_help()
> by AF_XDP pure-fragment SKBs. It rejects sw-csum UMEM binding for
> drivers advertising IFF_TX_SKB_NO_LINEAR at setup time.
> 
> Closes: https://lore.kernel.org/all/20260419045822.843BFC2BCAF@smtp.kernel.org/#t
> Fixes: 30c3055f9c0d ("xsk: wrap generic metadata handling onto separate function")
> Acked-by: Stanislav Fomichev <sdf@fomichev.me>
> Signed-off-by: Jason Xing <kernelxing@tencent.com>
> 
>> diff --git a/net/xdp/xsk_buff_pool.c b/net/xdp/xsk_buff_pool.c
>> index cd7bc50872f6b5..d981cfdd853578 100644
>> --- a/net/xdp/xsk_buff_pool.c
>> +++ b/net/xdp/xsk_buff_pool.c
>> @@ -175,6 +175,9 @@ int xp_assign_dev(struct xsk_buff_pool *pool,
>>  	if (force_zc && force_copy)
>>  		return -EINVAL;
>>  
>> +	if (pool->tx_sw_csum && (netdev->priv_flags & IFF_TX_SKB_NO_LINEAR))
>> +		return -EOPNOTSUPP;
>> +
> 
> Does this still leave a path for the warning in skb_checksum_help() to
> trigger if hardware checksum offloading is disabled at runtime?
> 
> If a user sets XDP_TXMD_FLAGS_CHECKSUM on an IFF_TX_SKB_NO_LINEAR device,
> and hardware checksum offload is later disabled (e.g., via ethtool -K
> eth0 tx off), the core stack's validate_xmit_skb() will take over.
> 
> Because NETIF_F_SG can remain active even without checksum features,
> skb_needs_linearize() evaluates to false, leaving the SKB unlinearized.
> 
> The SKB is then passed to skb_csum_hwoffload_help() which falls back to
> skb_checksum_help(). Since the pure-fragment SKB still has a headlen of 0,
> won't this hit the exact same WARN_ON_ONCE(offset >= skb_headlen(skb))
> warning?

My take here is the issue describe above should be handled separately.
(And on top of my head I don't see an easy way to address it short of an
additional check in the tx path, which I think we want to avoid).

/P

