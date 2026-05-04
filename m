Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CEE3DE420
	for <sashiko@lists.linux.dev>; Mon,  4 May 2026 14:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777903496; cv=none; b=itnDlwRRqej6WLo1bo2dkg87uycDkV6t+zRVgsxUWkmYhuGpjMxAQtLxE5BVbE3TE30YOX80UFZC1c3e+4AhrYgRKOMAhuUBqxmibEKsfcD5iGBRsTpgxCvxnlKa6EEb9devHxHv9olGdRlSW7OxLK+WfJozkJbJ8PbvU2k5/Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777903496; c=relaxed/simple;
	bh=e5A7TNuClHv+JZ1tGkRV2KbMiHhdOQnVozYbGaniwbU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=F2lQJxOFPZtF2DpVGLWwTbaEfeEPjKvxdtwGfp9uxBLak+NAV+oNo92rTgTsfdXk/F72v2xBrDqnE3hmt4GSyOM6Zz15p6TAkjPrfvIl72CCP7KUAq4Z4wxfRNfHzRn9ZhRoIFmSFZ6wB6QBF6c9NpW81ZcnC/x8oRb1Bvb6GsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Vz7py2tW; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Vz7py2tW"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38e7d983f79so41658001fa.0
        for <sashiko@lists.linux.dev>; Mon, 04 May 2026 07:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777903492; x=1778508292; darn=lists.linux.dev;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83bjCd7DYBvN7wEuphGjy3Mtk7MEDyYzlTQwjp3YiJg=;
        b=Vz7py2tWuzLz2QUO8g81cudVrSU0v79n9fDTr1C9kwwCp1Nuhkbk61CEkXb/P8aqfQ
         Mcje50gFzDXAzzRUJ9ENvpzVEFcFyoG1XX3zwm//LGoPmTkgsKKaY/eHNBGBWgBJbDKM
         p0W5ue9x+8/L6F3SJGTOvbp9LYeVAwl3RT3QIZeaKVxylxxpLoyrTmvhehbFnLY+oMPy
         3q5rqDL3LISnW4HKSqf4EqIWTifza4BK5BSdB9jILP/2gu32beFefaIQPYhFJ7/KwpCX
         lCmWz15v6eZp7b/pViMyugVQpvz8E/w7/glkS7wjRo/ONwQ7B9cu1K8h86FMtW1nM/hH
         Dkwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777903492; x=1778508292;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=83bjCd7DYBvN7wEuphGjy3Mtk7MEDyYzlTQwjp3YiJg=;
        b=rgAJQ7gTko1mgYscYVR9P/im7Ha/UrqZBKU6xkNbwUINNs72q+JQIk3AtiChOttGTm
         X14UD93hzSU5wHchYv94hAG07XF431FLfZAf4vBjH94GS8n8sBEaMp/UV9kmlp7zw6Rk
         fwW6LKJJWAr3DpEifTGxQNCb4YgEmfILcEtn5Stw5UmTjAGkDunruVkbe+bwRgQD7+D9
         NpbOCdZ3SzxbCMToJh2K1iHTQdXfIdMGMb5MwZQnqEoJGR6MyWG5ZpaijB0BBNcg46V8
         PfIF6L+NGH2yN3Nw5Gbrvb62ZyTfQ13F/Z+BTgdLmABjX/VM0qzubHrd+rLeGUlf0vWA
         Ypkw==
X-Gm-Message-State: AOJu0YzsGro0ZmifSYAR3mL3lynjNqwMh13GHvMLpXrx6Ibzz8TrdJE7
	cB36HR1uiXJGhkynR/YjBtIpG4YnYjmKJo3aDTE5OpHR3L4BK7UNxarvpXk3s10Pvfw0Vy8fdss
	2AEE/KT4=
X-Gm-Gg: AeBDiesUc03T5gp+KLEqDiDcBeIxlSAZDvmDmI6YsVczb8+tFFZ+esvmFEjZBtCqvIw
	+hUP9fB/z8bPqp84PJlY6MIlxwRpkwaSMdNUStxlHx6D643osemYsCp4FY2PNA+gPk7map7i1pW
	YPiMa9qsn4/p+dxZ+s/V7coJVM+njJ7cFsVPK+hfsuHp8/jB4PWRNxHIYi9uDKamhIKxW5rTEA+
	KCe18lYygyMXT5rt3QaA4E+j2+8dmALX0ddF9TueVnEA/W+td0/i5qbiYbVW0QUOQZStYRbA2a1
	YNZgo593yWXRPGlNN2tD/QsiHaa49QfvZ/DTsTp1KAO+KjGDDS4OZt+CRN96W4A7ECNA/57Emrd
	ip7KEa2VUyiOmIBzK/3iAW5ehXfyFym03L4Wr26bb956p6ygs1FvZA3FN9cwFGOmDODMjR5Ox61
	Z18AdQyUOrOgt5udoeXciXtA==
X-Received: by 2002:a05:651c:3242:b0:393:9579:2683 with SMTP id 38308e7fff4ca-39395792925mr16892061fa.5.1777903491730;
        Mon, 04 May 2026 07:04:51 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:1294:2ecf:67ff:fe81:9da0])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62bfd8b5886sm5727147137.8.2026.05.04.07.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:04:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 May 2026 11:04:48 -0300
Message-Id: <DI9Y6R84C029.16EELKNHG5NEL@suse.com>
Cc: <bpf@vger.kernel.org>
To: <sashiko@lists.linux.dev>, =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?=
 <rbm@suse.com>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>
Subject: Re: [PATCH bpf-next v11 09/11] selftests/bpf: Tolerate benchmark
 build failures
X-Mailer: aerc 0.21.0-120-g22b95d38161f
References: <20260430-selftests-bpf_misconfig-v11-9-e11f7a8c4fdc@suse.com>
 <20260430163852.E33CCC2BCB3@smtp.kernel.org>
In-Reply-To: <20260430163852.E33CCC2BCB3@smtp.kernel.org>

On Thu Apr 30, 2026 at 1:38 PM -03, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Skipping the 'bench' binary compilation will cause 'make insta=
ll' to abort.
> --
>
> commit 17b45ab67f584992f6ac2a400e83d514968d8c98
> Author: Ricardo B. Marli=C3=A8re <rbm@suse.com>
>
> selftests/bpf: Tolerate benchmark build failures
>
> This commit allows benchmark object compilation and final bench linking t=
o
> be non-fatal when PERMISSIVE is set. It emits a skip message and removes
> the failed outputs so stale binaries are not reused by incremental builds=
.
>
>> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selfte=
sts/bpf/Makefile
>> index 04634e6e0661e..a460f2ad3cffa 100644
>> --- a/tools/testing/selftests/bpf/Makefile
>> +++ b/tools/testing/selftests/bpf/Makefile
>
> [ ... ]
>
>> @@ -988,7 +989,8 @@ $(OUTPUT)/bench: $(OUTPUT)/bench.o \
>>  		 $(OUTPUT)/usdt_2.o \
>>  		 #
>>  	$(call msg,BINARY,,$@)
>> -	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$^) $(LDLIBS) -o $@
>> +	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$^) $(LDLIBS) -o $@ $(=
if $(PERMISSIVE),|| \
>> +		($(RM) $@; printf '  %-12s %s\n' 'SKIP-LINK' '$(notdir $@) (some benc=
hmarks may have been skipped)' 1>&2))
>
> Will removing the target via $(RM) $@ here cause make install to abort?

This is a non issue for the default BPF_STRICT_BUILD=3D1 case.

>
> The bench binary is registered in the TEST_GEN_PROGS_EXTENDED variable in=
 the
> BPF Makefile. The selftests framework (via tools/testing/selftests/lib.mk=
)
> unconditionally attempts to install all files in this list using rsync.
>
> Because lib.mk does not use the --ignore-missing-args flag for this targe=
t,
> rsync will fail to find the bench binary if it was skipped (and thus
> removed) during a permissive build. This non-zero exit status from rsync
> would break the make install step.
>
> I note this is addressed later in the series by commit 99f5f021f0516
> (selftests/bpf: Tolerate missing files during install).

Yes.
