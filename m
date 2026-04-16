Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40323DB645
	for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 14:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776349132; cv=none; b=ob3Y1dsRUTq3y4nUtPUfKI0TqYls/lhL5COdxir6Cz3144MutqAcIIqia3ltfgSRo8mCA2Xg85FKePPBgEwwQ4/SwntcowbxzPOmKk9ehcdeBYDPuz8LwfLGyXmIfV+Gg3B05CyOC6vddsyIct3eKecJaqGnIeAxRNhklsaqsjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776349132; c=relaxed/simple;
	bh=smAy18PTxlqKtr0fAfOQjvSthiR1gMkFArrDRBaE+8w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=knWiyNL3O2XDFOGzL2uBi0Bh5JSjkDcKmPEkDkH/QuHm5SpQ6+wtOlSGex87hQ03sSS6S6PDGEEnOT2UQgdkDdZse/hPeQ9ixhdk2xFDSiIiJBdPpGO44DH3yuH17XUsj7NnQTkb/GmQN1qaWOTvMb1vVSMvCCvoG6YgdgQqYZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Opycarb6; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Opycarb6"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso3023002a12.3
        for <sashiko@lists.linux.dev>; Thu, 16 Apr 2026 07:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776349130; x=1776953930; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4m0FAz6UNeMEXijwgItkdeyvCcIHaqfir++jBgGhak=;
        b=Opycarb6k12ArgNlxCv+mvYoH3Jthncd/zMKJRO7ZcgC5MIH0VNN2wF6JFgJAgv+TW
         LFXPFt3DBjtT9RstsoFrNUyL0q1t0ZDJvCcIb8/u1HEsAx6cJ2miIL23nBC0PZxXRTsY
         3M5wQ8FTUXsBUxTbneku1IYY2KHdCj0GFRGQR3t7O0gK3JdopX/ItNkWX0WcMPZf1/W/
         0UIFzSVfWB6pl8MW1BK4xfUE2sLkxMSJM0phHPC8iSTsLgTppmrXBhTiv6kx04EkqYi6
         seC8aFe6n35GuGyJ01Nhi+dCwfS2+DakNOMlVP5Krg41r0eJU2YojEpBysFVjRYswun0
         2kyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776349130; x=1776953930;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t4m0FAz6UNeMEXijwgItkdeyvCcIHaqfir++jBgGhak=;
        b=YLTJzl9dRPkbBCdIf/iSAQJ4QuF8LZ2qYjO7RC5N0RG08NsVcWBR/AzeAjMoX3Qu40
         Ac3MkyRGM3L48CTI9LHd2djFmpgA5ikZY4IZAR0Wg4Lo7rS/5UqlRpbQ7NF8zfYzoQMu
         XPDy2UcMnjiVdAmprAjv9kYqAtytO0LsN/wLnB8FaAvP7jPXj9svrz8QI1807T5u1eia
         hMvO5BGYtHaYQSzUtDUXp8TUJLN7VHXQSotbclBhUhK8SiUK3Z/Ab+L9rOeKToVY4MKK
         ce/dwCd6sTu7SDv9GU8MtH0dwWUzsb9iXGv7SpvjzCC+8O8FmsHpUS69FEzu/LAYzrBg
         tp2A==
X-Gm-Message-State: AOJu0YyT8p51Dja7I9x8hmbndhBG6xf0jx0l5npqejjTkqhXcQAlyaL9
	stSjYG4UGTzpedUdKvRiGsCcOXH4ZI7qL5WB/nmbuG1/HbQoM4uCkomnA5fF4g==
X-Gm-Gg: AeBDietR4swAtj97MppGmbHtBAqWy4sdkbSZxqcQywWNFrW2Qa1GwP4DwIJKmlao937
	plBTJMlf47Qzfx7hyX6SbGbqPtjex8KiM/BV22kKYGPCyjJAWmpBIN3IA7HPXi/JoV2m5cZCfhT
	RibGiqz9qPvf2Uw+WsijeEnzvYVJxQSHD5aoKseVUeBJ4zqUKTw0+ZridnR8Yr3Gal0/pNvTSce
	eTQsevh7K3EEuRsUITDvv+UgECYZXsUjHpMj2pVp/AmgWnDBQwzlZBpGwLn8zUvX4Merwa2Gqp1
	lo5PoqsBgtaGV9y+rzvyvYLpOQ20lgafjj7eJOuS/SbupOCFQO3SOBn6FEh8sf5dLBUEa/rl+xX
	7C7lYl9Z9Cmq3O4FxBhiR8IigRsbC2T9JUUFwDEzZKZJHEeO5zhj1tfZyY4e9VeajRSwXTrBbqQ
	5I7yeGa0/gdAx69OzWxuGucRjSYYY0c8FlP7uMgSX42QByikJsT8nYNR8mOnlWYSiNDieIDFzfU
	O4znOgdz9BmoTrJF1TixuPtPCLgyfOjz/A31w7Ee/gaBvx1LF5vY9kEw2LPgYaHJPA=
X-Received: by 2002:a05:6a20:12d2:b0:398:9ae9:710f with SMTP id adf61e73a8af0-39fe3d53b21mr28501431637.13.1776349129943;
        Thu, 16 Apr 2026 07:18:49 -0700 (PDT)
Received: from localhost ([2601:600:837f:c470:1879:8422:922b:e5d3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79581a31a8sm4408141a12.18.2026.04.16.07.18.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 07:18:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Apr 2026 07:18:48 -0700
Message-Id: <DHUN7O2WOLPC.107WH88I4E15I@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v4 1/6] bpf: name the enum for
 BPF_FUNC_skb_adjust_room flags
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko@lists.linux.dev>, "Nick Hudson" <nhudson@akamai.com>
X-Mailer: aerc 0.21.0
References: <20260416075514.927101-2-nhudson@akamai.com>
 <20260416100225.178D6C2BCAF@smtp.kernel.org>
In-Reply-To: <20260416100225.178D6C2BCAF@smtp.kernel.org>

On Thu Apr 16, 2026 at 3:02 AM PDT, sashiko-bot wrote:
> Sashiko AI review found 1 potential issue(s):
> - [Medium] The newly named `enum bpf_adj_room_flags` will not be emitted =
into the kernel's BTF, rendering the intended CO-RE lookups non-functional.
> --
>
> commit d9be60117de7ebbae2642c8a29e31a5aa11ff502
> Author: Nick Hudson <nhudson@akamai.com>
>
> bpf: name the enum for BPF_FUNC_skb_adjust_room flags
>
> This commit names the previously anonymous enum for BPF_FUNC_skb_adjust_r=
oom
> flags to bpf_adj_room_flags. The stated goal is to enable CO-RE lookups i=
n
> BPF programs.
>
>> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
>> index c8d400b7680a8..bc4b25eb72ce5 100644
>> --- a/include/uapi/linux/bpf.h
>> +++ b/include/uapi/linux/bpf.h
>> @@ -6209,7 +6209,7 @@ enum {
>>  };
>> =20
>>  /* BPF_FUNC_skb_adjust_room flags. */
>> -enum {
>> +enum bpf_adj_room_flags {
>
> Since this enum is only declared in the UAPI header and never actually us=
ed as
> a variable, parameter, or struct field type in the kernel C code, will th=
e
> compiler generate DWARF debug information for it?
>
> If it is omitted from the DWARF info, pahole will not emit it into the
> vmlinux BTF. This causes libbpf CO-RE checks for these values to silently
> evaluate to false regardless of the kernel version, which seems to defeat=
 the
> purpose of this patch.
>
> Does the kernel need to explicitly force the emission of this type into t=
he
> target BTF, for example by using BTF_TYPE_EMIT(enum bpf_adj_room_flags) i=
n a
> compiled C file?

Nick,

take bots feedback with a grain of salt.
I suspect the bot is wrong here, but do you homework.

