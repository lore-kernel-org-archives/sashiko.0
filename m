Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AA1449EB7
	for <sashiko@lists.linux.dev>; Mon, 11 May 2026 17:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778519896; cv=none; b=fDoabHrduVIam2qBqt41ArlB8BCu3iI/9SsXnmFwE8Mwl/UzumOwmjgewFnkyoR4h6d4CzEFBEwP9xrbNh/OZwAV09l9roWA3XZeMWjhVpfh/5+PAul3eA3h7Nn5f4D07ZW0E7hphVX/zR6Hgei2Jk8d9laXrZquW2qJr2O2E1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778519896; c=relaxed/simple;
	bh=z3kOpY9ViUaUyJU3gdXhJD52Ymct6W+YUbAiOGuCXgg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=HG9YoSEmiLpkfpM2Ri2rb3XhypTed5Oug/1Xazr7uHKLf5CemGWsYsLqtNJHkuWJoCQFDECgsPJP+TJGuuEDMlPaGwW7kgXlYtL3QSpONFIrg6qSA5IZRU80HGwA/KWi3DqWzhmD8J2+rPRPY9ehu0FsVTnb6i1UALMsCq6o/kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPVmXizX; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPVmXizX"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7dcdd23fcdfso2455717a34.3
        for <sashiko@lists.linux.dev>; Mon, 11 May 2026 10:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778519894; x=1779124694; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2PJULk4XF26NffsCR/AJr8MgFQb7EUc2SMqGgA5Onac=;
        b=PPVmXizX8Wytu86Hp8Z3xgdoSRje1I2vj1OCOU0yXOBRcTOJjGTfm01hFtIWgP8eoE
         cjQ/EKZib3jnHI+VP+IjQSf4qTa+l1mWQTxSYdozMzHS1lcKwxA/IVgPlaGLy2khGS09
         gyniscfJupgBUwrMoxxxLgjPCiPZZv2centEBx6eMFo4OAi7sXX1mM4Y7hGN2HDFy7Ox
         5NcP07kIOUGjjkiprClPxFdzGORcIQqafH1T7t0X/MATlBQEz25YW9H6LA7uiqhyb0vp
         qsfh0PtZfLRCcGRuu77jXLARj2yA046pTnlY1FQ74I9zB4+Vlmc9mWs9FU3YfGICj9mX
         TBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519894; x=1779124694;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2PJULk4XF26NffsCR/AJr8MgFQb7EUc2SMqGgA5Onac=;
        b=fy0AUNqCIjHgE/TbpiHZD4dAORi/KfzpQhRZn8pQsv8eU5idbWXIOjJbFygz6Nex5j
         vGFjpWeJ4K6giOnYVFn0z49X1YebEkmqVjncuuCozQHr+0TAYj23nTk9acXdptvDhVbL
         2g+ltjPrbCl5sEPPT7m9rdJWO/9vczm4sMYwIvBE7a5jA38KZUa6pwFSSXK0Z4dFXe/b
         LMy5tc0SN2MUfgfBgNM6jUz1fuGmTaAIzyraeGEDp/HMVDhjL4/fBGhlYFdFUOqeoLsc
         x4rlh596w9mBuJLZZhegBWXnuXyLb2gtLwOQc4ObYzSNIL/UnaHNf9DmSGCBp7IvEnG5
         4+MQ==
X-Gm-Message-State: AOJu0YwaMb2WIaohn0Sm6mLCFYSsKvr3/e8Sv/UYTLaR7vI57gGTsCqt
	LEqErvZDTg3Y8fPP+akwlWeb2kSiN43GvffUvBs5Nzwtd8wMpn6iQnnH
X-Gm-Gg: Acq92OE9R9AKo5z33MOVkRe8HRxaV/au9gzpGecw+IvSFDGZoiKVoV6f5Yv6Samhh41
	JSv5PLGOYKGS57tVKyS0mEGTzs1jzw44oLlV88UYqwyexV2yP/aG4gtrGYjNYXODtxdGrvdsYJi
	XYmLqLPAFEjpullORBgif3q6q28ftFj7M2tWcAxFUqjldtZGvByE2Y8PUXUt1nvKwcYV1plqzP7
	mDiol9jgKRgMANPnzmsfFuQjrXPh3AYMQkmd+7jfRBLcALULfY1Qk/m2WaAAMK/urHu7Wy6DJUA
	Af+MPzaTniVOpG41Y5XDDEntHG/SHswUNkGPMsS5O3Wq0R9L6K4CD3K2C4b4EBFyfh+HiFpgsP2
	aQ1r6LoybFHzRoT7j940AnIMJtTuVm8nZD3sc5M6Uq+TpDV5jXHkaEszbebW5ItAEavuggIfmFN
	/xLSSO+EUdFhSuOPYoBzadYHVYgIR8jHRkmDgORE5YYej9k78I9Hb7r6v7x2wFwoAB9LjW/85wp
	anwHpUz3aLxuq9Q2g==
X-Received: by 2002:a05:6820:161f:b0:696:1860:8baf with SMTP id 006d021491bc7-69998cc094bmr12581594eaf.20.1778519894549;
        Mon, 11 May 2026 10:18:14 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:48::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69b25c9a23fsm6023546eaf.7.2026.05.11.10.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 10:18:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 May 2026 10:18:13 -0700
Message-Id: <DIG0ONMVOP0L.3QFYUPWFSKWI4@gmail.com>
Cc: <sashiko@lists.linux.dev>, "bpf" <bpf@vger.kernel.org>
Subject: Re: [bpf-next v3 1/2] bpf: Offload kptr destructors that run from
 NMI
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Justin Suess" <utilityemal77@gmail.com>
X-Mailer: aerc
References: <20260507175453.1140400-2-utilityemal77@gmail.com>
 <20260507234520.646C4C2BCB2@smtp.kernel.org> <agCXEJKJh-JGMhjG@zenbox>
 <CAADnVQJdFCFJcg0Pqdnx=D2h5vHj_q4mrwSJYxRC5RW0NTFNvQ@mail.gmail.com>
 <agEnc0aYMhuIeDlq@zenbox> <DIFYUK5DKGAT.189D9YYSQFCUZ@gmail.com>
 <agH_0MEw4b0pB11-@suesslenovo>
In-Reply-To: <agH_0MEw4b0pB11-@suesslenovo>

On Mon May 11, 2026 at 9:38 AM PDT, Justin Suess wrote:
>   [   21.604660] Call Trace:
>   [   21.604662]  <TASK>
>   [   21.604663]  dump_stack_lvl+0x5d/0x80
>   [   21.604666]  print_usage_bug.part.0+0x22b/0x2c0
>   [   21.604669]  lock_acquire+0x295/0x2e0
>   [   21.604671]  ? terminate_walk+0x33/0x160
>   [   21.604674]  ? __call_rcu_common.constprop.0+0x309/0x730
>   [   21.604679]  _raw_spin_lock+0x30/0x40
>   [   21.604680]  ? __call_rcu_common.constprop.0+0x309/0x730
>   [   21.604682]  __call_rcu_common.constprop.0+0x309/0x730
>   [   21.604686]  bpf_obj_free_fields+0x118/0x250
>   [   21.604691]  free_htab_elem+0x85/0xd0
>   [   21.604694]  htab_map_delete_elem+0x168/0x230
>   [   21.604698]  bpf_prog_f6a7136050cb5431_clear_task_kptrs_from_nmi+0xe=
b/0x144
>   [   21.604700]  bpf_trace_run3+0x126/0x430

that's better.
Looks like we moved bpf_obj_free_fields() into htab_mem_dtor(),
but left check_and_free_fields() in free_htab_elem().

I think the fix is to remove check_and_free_fields() from ma path in free_h=
tab_elem()
and fallback to bpf_mem_alloc at map create time when map has kptrs
with dtors. Even when BPF_F_NO_PREALLOC is not specified.

Kumar,

thoughts?

