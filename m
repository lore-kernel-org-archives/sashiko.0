Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0090C287268
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 03:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778556196; cv=pass; b=SNzKjf5n3T2GQdQBQIwFlKl2FgNBURAyzrzWgfWNcrUGXVyRvBXQ0m+HKvRGq0xggxLPZ1Ck0/Xy65i0PmGx7hylPlg50htLPJHMkPsqhYSzFaAvrxNhV4kUocBDaGWV4m0dffHOVqnlIBUbwhH3a574yTNgtk8XM2+h3eCArPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778556196; c=relaxed/simple;
	bh=E7iq/aL/xgpSFvAV8M6VI0zRLxJN22qDfKQRNMALdHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SZQY4iQTkCObykQ/ac6Hq2agIwcJr5DbfD6/T/1gVPcwVmiWa5Uda/3lf6CAoZZvkH7uF1gEeXGFxcIJ9o0NA2qmCc08flUl3lHU5TSRpcV+c4VGWB5g3UgZiJ4lo//CcJtOdDmaqgmn3o5J7JbIUSr/EL5IUMXacJbkQqhgxu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CYV5wSdY; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYV5wSdY"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso54708865e9.3
        for <sashiko@lists.linux.dev>; Mon, 11 May 2026 20:23:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778556193; cv=none;
        d=google.com; s=arc-20240605;
        b=QaTsCRE+E6a1VbYJJr61b9HY2sE39PwZ+4bYfv5iHKhW8wD/t+7C5FyidyMHc17/2t
         WS5HGG+yFGAHwncNaeyRutBJz6xGOYJ7Mx4bMkVmB7miBaBhwOmvd58AwmnVRvSbwUJr
         ykC8E6C2F9NIzoCDM4dxS/LWh9cN1SoGqK+ESInlmhh8j2FQmDgqKXzFkXV3to17jT81
         KufhSJgiydIbt9xPWWyV5xhLnURN/X/dH0j0ivUr3LXxkSO9zLBpoCjuV1wontxvWrPY
         KeJmQ/Dymoe/QqCSnCqTXVCkdxCWFTBWMGlziNKtUGZOFDIb8X8ghLZcgrlHjctTDJEe
         wPdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E7iq/aL/xgpSFvAV8M6VI0zRLxJN22qDfKQRNMALdHc=;
        fh=2TaaujK+uUQ1L9LQOJl2qKWaXbbpf+a1sX+8PZ/aSLI=;
        b=IH7PpbF360NXjdEES+QaK3DVnxTDTCN/uBC/Ds6BvkeT4sKYEqvLV9DUToSSQr9Ycl
         Pbsg6n3nyfttr+SmhF9DMLgmmwW3sFQUxUqXrUyH3ICnYzxfczn2xRpwOBILxH8jNeVE
         A12GAq6vX/XL4gO9tJC/ndivPeOet4xRkoSKMNU1D6odUfYiCunqp+hJ9Lo/3lq/SsNI
         r7uxntFuCOZxEH2EHJ95HB2SAqKPZJvFpht/BdsG5ewXL3uPGVmuLH6pvZyfhMwIj4LP
         SUfwiTUX7wRKRWbvkNCxPjd9KoyhEoRYzLzQyg5AR2OuyTTvom3MWIGtvBiLx9vkICH5
         2BTQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778556193; x=1779160993; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7iq/aL/xgpSFvAV8M6VI0zRLxJN22qDfKQRNMALdHc=;
        b=CYV5wSdYKjZhJns3x5gR+NzJMZyauMQg8G7ynRj0RufToXgz3aaGlE4omtv0I6FajO
         rLGUu3TFR4K/BkOPMFBsTj6f5qPdZkdgHmcgCsbb5wWeYOIZUNDoDNBPSTWEpHSKHO1W
         XU5Re7sCbdviy9SNmvLUaYh0Nu4aKSZZMw76mCJWTljgTPXzO7y6X1gZmtVVAoZknp72
         XiBJdNIqw1ONCMi+qBxfyu1m8+zzAhy55P0JOwfwQit8Q87VQ7pKiTiKwrd75pIihM4B
         hGXmV8mPfUqGIgwmgE+5995BGVLZEpu4b5kzbCrYhLcpA+Cgi4hse1LtBCknXfPzwdlP
         lHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778556193; x=1779160993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E7iq/aL/xgpSFvAV8M6VI0zRLxJN22qDfKQRNMALdHc=;
        b=YEsGfoKRQGwR3k4yYbIilvIJAng9f6gZIalT3+Mty4JowWByNeLeKqU34ypgroftFI
         /ptxgDwGDQrb5/myUomsdAzAhYosr08tORYQgrt08Y4/9l4b0dN/EEbfWcV2lsapjwKN
         iKW1PKNBg31x92Q0FmeqrEGBbyJGN+Wg0YVfqvHzF6+Mql43gb05SRzsrB166U1cEy/+
         WDPDk/Om/MYwB2vQKraE7MZxrImx+QoeiIxxbSdhD1A8HVoVFiTLSL7JCRqFm0BGJwIo
         kf3W6DcFbNSpxMXq/anfsccMQI/neFvMgE2FmjMaWxNATuhy3qSzAh5sQvmOnnPn71vo
         aftg==
X-Gm-Message-State: AOJu0YwApmVnqedXO6XBRoo9dIlpPhzmosf9UzU+fXwrIE0D1LzTR4Hu
	vteqm72IsazgITCI1MUQK7zJr9ag+GVUINt7/2LmEuD+lrgKvHw0seuzwvhW+1A6xaD7zQZ+e3W
	Bn4XlHU8nW+6ItSYk5EK0z4Yxb3D8OTPtDS2568M=
X-Gm-Gg: Acq92OHEW+dImAV6Zw0Bvk1DZY3KabAENLWaNZ5279Ft4dN/3lOAJqBUgHNn9zi0lpa
	0XwEUwdb7KpAuS5Ok2rIWVUev7Aj5G4a8dHE3bc6lezD2ullHW5v+3k9ZGi9AH18CrPbBHpeNGt
	JLJyh8twC72w7RfX2HIzUDVPe4o9dXeTzNFLpxpBu5fUd8innksRK6HOGNAqcqFPauBzj99Mcz5
	qlLEi15cuPTeMQVve3/5OGqn2XSfHAhKo19UABW/DZ33+HkrgGMU+y7yf+XRTbp652GCc3P8ogE
	ozLirpM=
X-Received: by 2002:a05:6000:22c6:b0:437:711c:8754 with SMTP id
 ffacd0b85a97d-4515b056c9bmr41045834f8f.7.1778556192946; Mon, 11 May 2026
 20:23:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260511054003.1205-1-horiiyuk@ishida.co.jp> <20260512000455.44AB2C2BCB0@smtp.kernel.org>
In-Reply-To: <20260512000455.44AB2C2BCB0@smtp.kernel.org>
From: =?UTF-8?B?5aCA5LqV6KOV5qi5?= <yuuki198708@gmail.com>
Date: Tue, 12 May 2026 12:23:01 +0900
X-Gm-Features: AVHnY4JXqiCbgcaO0dSCCIbA4hH7sZTeBdkheQnG2w7s9AJy_5G5rzjIoxrlA38
Message-ID: <CAMARicOm-QwVrBnR+giVjzqfJ4hZP5PwZO7+o9o_SkLhEtxUZw@mail.gmail.com>
Subject: Re: [PATCH] Input: tsc2007 - fix resistance calculation when A/D
 value is saturated
To: sashiko@lists.linux.dev
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	andreas@kemnade.info
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for AI review

> Does this code read uninitialized stack memory? The IIO path initializes
> tc.x, tc.z1, and tc.z2, but it does not initialize tc.y before passing th=
e
> struct to tsc2007_calculate_resistance():

I knew this code existed, but I didn't realize it hadn't been initialized.
I'll fix it.

> Is it safe to return 0 to invalidate the sample?
>
> In tsc2007_soft_irq(), if there is no pendown GPIO, !rt evaluates to true
> and prematurely breaks the polling loop, causing an early pen-up event.

I'll fix it.
In the original code, I had set touch input to be disabled when the
value was 0, but after submitting the patch,
I realized that setting the resistance to infinity=E2=80=94rather than
disabling it at 0=E2=80=94would allow the interrupt handling to continue.
