Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3596733ADB0
	for <sashiko@lists.linux.dev>; Thu, 18 Jun 2026 19:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781809933; cv=pass; b=l1TuFhqqw0aLvgszkcLR0smcZIPw5QmprBWv6QEsVyYvdiG2FllTQWx7ufkrbAV0bgsw5NKbsgX+h5GMzXFXpbRc4J4WZpAvDZNXu8hvNZcWvQxs6M0EDt1LNJA+EvVdYG8bdNURbcRNtgLaxWI3SxJeb1zGMgH88IOsdc4cHqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781809933; c=relaxed/simple;
	bh=3Fmx1/NWlSdlrVWsmjsg3GX+6zUKFn7I4SilO4AgsLk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=FPiDhD4WbotqB2VlEfimV4F70s8XThvdLHOGCBSs2k24LcQEPOmvP0lnm+K8ZxgH/bCHVr4rIWOaBrTjaXq+yKl3+ul3fXQ3PZGFtPd/+aTLRrZ/cWrttp6YbrsXCYKGOHVyVydRRMmg6Zap46DxMT1YT2Wv1Ur+HaxOT4KOE6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gieOI/RS; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gieOI/RS"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-68e5f7c1131so2133781a12.2
        for <sashiko@lists.linux.dev>; Thu, 18 Jun 2026 12:12:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781809931; cv=none;
        d=google.com; s=arc-20240605;
        b=SD7srN1kYtShm/a0v5hoRDK2fyvPTO0Yqlwf8ypfwLrhNlwFJxcnN7jwpIOC/aTxSF
         B54pb9356+TjpU5987B3lVbftrBdJYIN6KyHMOZaB7BL2gANbkrFCV05fZ3tPr5gpEPC
         P9Y8J6ns3Tu5bOGY6GxSC96EeFei2tJNIINZ/y/va/QNMCLV+xMwyq4/hIKuFJ6OFhaQ
         6b3koFjVm5/ririY3b1LRKeIn7BlVsNTidVBiKfWUuO/uCr5EFVsC0Y9ygpia4r2SAph
         ZFvAayuxLKt9Hnp06UOabDrQzVv70DcOIIR6zgfW6q4gHNU3jlpCreLX6x1cKY0iP8nr
         1bsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=3Fmx1/NWlSdlrVWsmjsg3GX+6zUKFn7I4SilO4AgsLk=;
        fh=4+GFgoH7NM65EHCuuis3IvCaKuBtuIGNGVXKQ/pKbQk=;
        b=NNqh+nkOgMDUbFPLl4uL0wX1J2Quu+UQ0o5YNSrPMQwnBhLQ89aIpzcznKwHHIZFAJ
         gzB10q7eeQYYVCo+P0VQypaSaLXC74k6icbkr1Eq8/FZuTRBVHiVJwwl1mC/qGKXW8vt
         qIOQqOODXqE4FQokrvUvdTc36fxc81v5Mebyj3Ejbkfi3/DQZq5r8sqTkqRqwdrqmMBM
         XK8kj+9WWR77AdPfpGpS6vzB0xyppmGpzdg9hwR3Cy4aqoVHic78O4lfRazI5fJhhmpZ
         ZnMa3Y3ZAdhb/c9I4wcY44YH+u4JdLXejt+99YNE0HF9UXSgbPdbJfddMFtFCtC4vH9m
         Dc6g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781809931; x=1782414731; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3Fmx1/NWlSdlrVWsmjsg3GX+6zUKFn7I4SilO4AgsLk=;
        b=gieOI/RS6kTPVrtfrYzE116NyYkDmOREreklkcHuW1QAcdY1SH7ek4UUs7cMD3r5Y5
         6Z0czSiTX3ErJ9P03hlTRhmV44G3jZg1Z2wQfu93hchlZbd626aauvyCk9EITwmP1WFk
         4ok4PvP5+NtbhlpTI4BAhMzQcYtHjT5WP+EvHKdLSG/vleI7ueHmWfnGDc7FAbtX77us
         7Wcx+W80W5Fyhx4zNjrfmbbn/tKYGLBXQBPI5zoN4X+yTSaObXZz40f4H7VTtb5Pnq/N
         xVuRodNPD77sc0RowQYjZOSStGVDppF737uM73kAn7Ds+s1lvVU6JFzXx+VxL/8AVooa
         WUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781809931; x=1782414731;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Fmx1/NWlSdlrVWsmjsg3GX+6zUKFn7I4SilO4AgsLk=;
        b=JUwVK8Tz2JsDUNyLdBXvQHsUOz65S1iGeiiRnYWFaA+vm01eyRIM9FAxaisK/M7z91
         f56JlQe1Xa5+R6ioR0UYhFj1ttV+irW9R0qOVATn542yAoFuYAgG0zOQUeRFDClAVgJR
         4hfigKPvAmgZVEcSJkxNcdWmM4cpqQ4YGggTCljOb7lAFS+xMN7pMN/LRPL+HzGGMION
         SjYWzw1vn63kwlQzjkqNKPKL0noMuny5EzimOmUJsfPNfeAYYPGIFazaAJv2Ca6xH3ir
         oDOwn4ynUKaDbXwf41G3bKX2Z3Y5RHqR5t1XTjq0cWMxo1K/hc+D2nyBWe1kVKrmJ3Hx
         CM9g==
X-Gm-Message-State: AOJu0Yz+/DKoJ/X6dINKEmmLBVCAOyUp+9wlj/EArGj9jyzvSyOOceAb
	rI7e8Ao8GHTwqudIBR7Gk7AINKTYTl8/tSn5LH+b8zcB/PHYDcH60X6kYMgEypFCIN5a+gGrst4
	Wbwvr7wNNMcirALFbvDg6KZhFeWdokVgfyLJZepA=
X-Gm-Gg: AfdE7ckFLSm0+26A9J2/JqgpFYZtPc07vd59n1dxt9eR9itq6qqr4lEN6GvRUlPo8d8
	a/NbgNOdW9OLjjTcD89rGaS9wmxWNXMywqZHcbs0vx7fpRTPE/G9DlDBDz1mHkr7+OP6XUA53Bh
	7ooFyp6Z5QyCO0VZhhC0zfYKsOMSgzeLh5aZR8k0DpLl/xlAKq4GcbIvJaxY5OV7V6AkTKbXMYP
	IyXG4yq+JV7oOm0/Be9/+UaolZ4qg5NY+QFjfa1SwmcU7n4lR/hhirwCGAm4zccrZ8L6Vd+SsRA
	cmxhZJBGu60hsNFoeUq1yT7+LTtRKGs=
X-Received: by 2002:a05:6402:3205:b0:696:c770:cd14 with SMTP id
 4fb4d7f45d1cf-69711dffeb0mr348705a12.27.1781809930364; Thu, 18 Jun 2026
 12:12:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 18 Jun 2026 21:11:59 +0200
X-Gm-Features: AVVi8CeQslpxCSdpgRa4gpirrcupCG9eJ2LgJ1z3Ch-ANwgwQC4HgTz-290fuHA
Message-ID: <CAOQ4uxiJjVvrAwB4kcSsKsjgjtDyfy-1zDS=sMMt5Ke0ZQRSHA@mail.gmail.com>
Subject: Sashiko reviews for overlayfs
To: sashiko@lists.linux.dev
Cc: Roman Gushchin <roman.gushchin@linux.dev>, overlayfs <linux-unionfs@vger.kernel.org>, 
	Miklos Szeredi <mszeredi@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Hi Sashiko,

Please review patches sent to
linux-unionfs@vger.kernel.org

Thanks,
Amir.
