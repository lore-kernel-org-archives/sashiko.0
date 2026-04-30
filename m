Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26715421886
	for <sashiko@lists.linux.dev>; Thu, 30 Apr 2026 13:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777554840; cv=none; b=Ya93CLr9YxNVv+6lg/VqO1im+ugyhKlKAi0k1RCRKuYrlIupCtLHYoOymRZw7enulGmIJZAiVFYW0LtXCIMRL1Kw+GL5A3TGLwXq5/P6ZZFeMEnkZDT1pol9/1urCRAbH7grsCgLOepTXI+U15RQxrJLmVL4FIl2CWb8aoqhwGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777554840; c=relaxed/simple;
	bh=xJjJzowTCghhIo1M1BBoQR1p6lnqeUhBs3J9/RR1jz0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=rsgTrLZ90zBf6iyhYRwsnk6fpaDm6VwaUEw1OX90cixx5SEz1TCpoMII89WmNbO9fbjr1YpjNYqO4wQgHGEdKUMkXhOpwphgaYO6Pwm/vqDtr7r/1V22RUhmsIjjK0Y07FAPxhgeaprhWIpc3vw7upcXgLL11SZkaK/jpLmDCMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gKv35gUt; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gKv35gUt"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso10235875e9.3
        for <sashiko@lists.linux.dev>; Thu, 30 Apr 2026 06:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777554835; x=1778159635; darn=lists.linux.dev;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRe/Of4HXhlzR8gGS5doxSOHHPYhsd1Ia0Z7yzBuFU4=;
        b=gKv35gUt//MZDxjk6VWwX3Ngas4POgnhPn9KclBDX43O9rVq1fvvAVGuWIoEzWjxH3
         vl7Gwr34axL3f2qkFSZQSoAmcHMUZFPFQOD7ZZ0BTzT1mw5fN8f8Fq0A46L+GSttFFCJ
         uziijcDm9pY0EMFXy/hpLJrA355tMFtEwQ7T8FIf/pvNhOUVwh1v9vAHDXHfMYRfi7oZ
         s2Uc2DbMUjX0ynbtWIw+kxI5c+uA9/iN5gjBKykmLv66adwkHB/SiYQsYG/23T4B0sBF
         oM8/loMez+678ANNf+SxfLQkxAntkXx/XTGQC8VwNCO/8h1Yv5X0kBCGect4x53kBg5X
         D7cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777554835; x=1778159635;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zRe/Of4HXhlzR8gGS5doxSOHHPYhsd1Ia0Z7yzBuFU4=;
        b=KXA6cbqV+Co40JgaLKx1TdDfYhpvuWlOCwdXqoIpDey6+kAuOac9iqL5B9iucKWPQv
         UObwSOPEuSs2hAVBcInxuNOH/ppBS8po3JOWwea8SIyyig4bQYXMPpt0dtAnZvrbud69
         a04Kl2ByyUTMpNQpnQA6mvwab5qf9Dxz8jsOfEP8tN5lC0tBq1gfFx1ZBFK+v/9DGh1H
         mQoGRKzf/lYvLPXx+l74CELeH1kmUJhIIJ+6UC+IvYImmqHUE6R2qbE3xWQ4p4yPzfHb
         M3UdnMkiiFaDojtxxhc6S30AIuOGJ7eBLC48tDWtID6v0R/E09ZddF5Xa5RA3PmO3Mon
         v21g==
X-Gm-Message-State: AOJu0YxqVjaDpH20IuTDPJ/ScZE1HtHeWSGQFVFISV2F7r8JdHrpQSVR
	dRWXzNfaYwEJyXKOToenKh0OkXF93MHZUz7k3JR65fMu0yQL/9i1quDocZ14J00fVzRPeVQsTRL
	TJQJjmco=
X-Gm-Gg: AeBDieuTUq1gQ9IzrEWwDjWmSCxVfxZlJyzQJaRZ4+G/yWaBHo+NIO1+esIa7wBw0Lw
	5ejxp0tyMnzWLSwArJgOoUGLjpcv4luuchn/xVhwqtytnOBLIEJqC8jiKMT67VXfaMeX7nrLGgV
	OgKNlsVoL267xLcSXx1UN/FSxJLIJacDPOg6JHeypl6f7kmmwTH18bWGpznIlOZe4pUmJstsszF
	DbjZ5Wi6FlbePjCR+Ru7wc53OKFzbCXoZBBYDV6hCMqNrfRt808KI7bDNyG0oE4LeRaopSYc7VL
	wAcY9/xALrXGqLiIzxIibJlekjAUtondjelEoxJ0uKwJf+TJvpWOo0EfXEWa+fpVM4JJATQZCLd
	XS3fRw45SUxZYgKstoJCdH8WPt8oFlLnbP/717xqV4greoelMiVgCk1UApLiL2P2co3vvV2dWX7
	ytU+VcH52rhF1C+jeTl9CXDk76iZDq6QIxPQ==
X-Received: by 2002:a05:600c:3e8d:b0:48a:53ea:140b with SMTP id 5b1f17b1804b1-48a844a4728mr48868965e9.28.1777554834909;
        Thu, 30 Apr 2026 06:13:54 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:2ecf:67ff:fe81:9da0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed46afda3fsm3707956eec.30.2026.04.30.06.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 06:13:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Apr 2026 10:13:51 -0300
Message-Id: <DI6ILKHKXCTR.2TAXUY0YUC5DS@suse.com>
Subject: Re: [PATCH bpf-next v10 06/11] selftests/bpf: Tolerate test file
 compilation failures
Cc: <bpf@vger.kernel.org>
To: <sashiko@lists.linux.dev>, =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?=
 <rbm@suse.com>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>
X-Mailer: aerc 0.21.0-120-g22b95d38161f
References: <20260430-selftests-bpf_misconfig-v10-6-cd302a31af16@suse.com>
 <20260430131052.3E683C2BCB3@smtp.kernel.org>
In-Reply-To: <20260430131052.3E683C2BCB3@smtp.kernel.org>

On Thu Apr 30, 2026 at 10:10 AM -03, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The inline condition `$(if $(V))` incorrectly suppresses the `BTF=
IDS` pretty output when `V=3D0` or `V=3D2`.
> --
>
> commit 0d69d461adbd02ed2bb765aad81f923aeaf2a8da
> Author: Ricardo B. Marli=C3=A8re <rbm@suse.com>
>
> selftests/bpf: Tolerate test file compilation failures
>
> This commit makes per-test compilation non-fatal for test_progs, skipping
> missing objects during linking. It adjusts the BTFIDS step to use standar=
d
> printf instead of the msg macro within the shell conditionals.
>
>> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selfte=
sts/bpf/Makefile
>> index 608e6dff03926..9becc077eb231 100644
>> --- a/tools/testing/selftests/bpf/Makefile
>> +++ b/tools/testing/selftests/bpf/Makefile
>
> [ ... ]
>
>> @@ -717,11 +723,14 @@ $(TRUNNER_TEST_OBJS): $(TRUNNER_OUTPUT)/%.test.o:	=
		\
>>  		      $(TRUNNER_TESTS_DIR)/%.c				\
>>  		      | $(TRUNNER_OUTPUT)/%.test.d
>>  	$$(call msg,TEST-OBJ,$(TRUNNER_BINARY),$$@)
>> -	$(Q)cd $$(@D) && $$(CC) -I. $$(CFLAGS) -MMD -MT $$@ -c $(CURDIR)/$$< $=
$(LDLIBS) -o $$(@F)
>> +	$(Q)(cd $$(@D) && $$(CC) -I. $$(CFLAGS) -MMD -MT $$@ -c $(CURDIR)/$$< =
$$(LDLIBS) -o $$(@F)) $(if $(filter test_progs%,$1),$(if $(PERMISSIVE),|| \
>> +		($(RM) $$@; printf '  %-12s %s\n' 'SKIP-TEST' '$$(notdir $$@)' 1>&2))=
)
>>  	$$(if $$(TEST_NEEDS_BTFIDS),						\
>> -		$$(call msg,BTFIDS,$(TRUNNER_BINARY),$$@)			\
>> +		$(Q)if [ -f $$@ ]; then						\
>> +		$(if $(V),true,printf '  %-8s%s %s\n' "BTFIDS" " [$(TRUNNER_BINARY)]"=
 "$$(notdir $$@)"); \
>
> Does this condition correctly handle V=3D0 or V=3D2?
>
> In GNU Make, the $(if) function evaluates to true if the condition expand=
s to
> any non-empty string. If a user sets make V=3D0, $(V) expands to the stri=
ng "0",
> which Make considers true.
>
> Consequently, `$(if $(V),true,printf ...)` will execute `true;`, silencin=
g the
> BTFIDS output entirely. The standard msg macro used for other compilation=
 steps
> explicitly checks `ifeq ($(V),1)`.
>
> This results in inconsistent behavior where V=3D0 correctly prints brief =
messages
> like TEST-OBJ but silently skips BTFIDS.
>
> Could this explicitly check for "1", such as using
> `$(if $(filter 1,$(V)),true,printf ...)` to accurately match the behavior=
 of
> the msg macro?

ugh I forgot about this one

>
>>  		$(RESOLVE_BTFIDS) --btf $(TRUNNER_OUTPUT)/btf_data.bpf.o $$@;	\
>> -		$(RESOLVE_BTFIDS) --patch_btfids $$@.BTF_ids $$@)
>> +		$(RESOLVE_BTFIDS) --patch_btfids $$@.BTF_ids $$@;		\
>> +		fi)

