Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8415C3603DB
	for <sashiko@lists.linux.dev>; Mon, 19 Oct 2026 04:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792383279; cv=pass; b=diVXEdU1B6zdgLOLu3DDC2u8I77PufOldXnJhqhWBCvWapUNCrBtvvASTZlbwRABxvLQtZws+86SGC3wboBs8IYBKPiRjgU8cML/e/4uudSC9aXHwMM+JYqOdhN23rncTbv8bQPH/LLcCrN1169F1v1FC5o12L8zAP+7zy08YtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792383279; c=relaxed/simple;
	bh=55tmbt/V3ewIE01Vrxscpvi4uFpdQzgX7C0216bqSyk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=gLzB070MslScPi0DuYRu+IsTD4XbH8eHxI1t/HoL0M8WDgcbvmqMZUllyvcvhV1ncUTfzHmCxcs/Nh9SoR9F9UMkEyZ9yI+xBevUjnPV9G0wCKb2XIjWvsTbFjd8lwJxNvA/yUzOYv5epfwc8/zj2Hed8uUo4Q4hedXfpWG/k/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YorsJdkl; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YorsJdkl"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso847591f8f.1
        for <sashiko@lists.linux.dev>; Sun, 18 Oct 2026 21:14:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792383277; cv=none;
        d=google.com; s=arc-20260327;
        b=DaU28o/vUX3oxJbPAiQ2dHmO3/P1jMiasm4OkIVat1++Y11zhyw3730MI474EyUKf4
         0Y2ezxsE2TCK8IxQeclD3jX0F0xkNhThwjr1HLQ4nEUJ/y+5ALFaYSdewy7Sx7Iy12XZ
         xZ8ZQrT/ufJtcDDgATLZop2r9q9rTvdcGL/XrU8T/wTRoOyThMYIF/F1a6vJy83uQ2ko
         bJC3uH8zAhk+wLDtVJPfPU+M5Gmx5KVW8U+XsGo9z8LgxFWENk+2SBmsIfWrgjIFtHq7
         FDdymgPDID2Dloy8YvJq0zYy8rpHeqpEm12nyeWlRNHb5aYneMS1RrIhE++OMUZiVD2C
         IZ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=55tmbt/V3ewIE01Vrxscpvi4uFpdQzgX7C0216bqSyk=;
        fh=9hADUdzORoJLTRjc0NjUPIUiPw4aygk1+y89grEdTHo=;
        b=VzkGpQ0rjeKGsmUmV92Zl4W91y1aqByrTrBppBTIWM/EBZkqJsjymGs+yxjz4fskmW
         DuxTJFM6fRmeoImTYNVAkPlIk+v9SGc2QYKkPsVL8v0ymzGrGTWSnppqNfhPEPGSCZgK
         ZFAgH4Fqy2s2lIYY+miGEM2ztsEJY/jLMr5iJzN7PdqdsTDk3r8qgfdGtniNVLGqjvqY
         lf8qI2tahJwQ9vsUIdGzsKUadvAn/54KmWP5i/vzwabDf7TSibldi8a6JgS7u07RuUAQ
         6P2eeG8Skd52iK6vgudnLiUybZn3XMVzvaS2v9KLObm5G6LkpQbzSUvqFEKEOwN10o8d
         rTsQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792383277; x=1792988077; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=55tmbt/V3ewIE01Vrxscpvi4uFpdQzgX7C0216bqSyk=;
        b=YorsJdkl29BTgVDr8s2/FRpzXl2XcBc/Q3g/stqURD8q427OdPvY49UDaOISEwEtQL
         LUIqVuhIIpc6LUMTHArvjp/XeqGvvrQM8NU4sfQIUXKdusbpaMyraQNQhPZEqgrihPuj
         ZdFjoj8sqAQBiiKxqdFg29N8ziHySyaHJvJ9HQ5MDVXEuPtlAwKdRHY//qNiBk//mk0p
         H6RkQKW3r0MBZ5nRw5SSpcJyg5I20zC4DX4yKXGnxchYIHOxsp9yLbnqNuSmKR2kXr1C
         xahBdTXey0e5ldRd7arCA5MCk2M35vTAEPoK9lkN8c9Q05pGZbdcd4QxvnAEeAkOqImY
         4JLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792383277; x=1792988077;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=55tmbt/V3ewIE01Vrxscpvi4uFpdQzgX7C0216bqSyk=;
        b=kaNAnJsbp3n3IvGBsBfBI4Y+/zlwijVWeyhW+nZsWKQ2MNRJNY4oDL7tGRtMvPLjJm
         dPp4R5qq3GR9qfwesI5YjdeGpIOTrEWniK79z2WydijnoEMXPVyOBEO3Ob4CZM0wfTUj
         tTdmg5Grqgr3khHgbYPKzECPxv7ggN+vpp3yMJCNZc3St54PhDRU1Wn4XMLug+S3Gd2U
         c5YspLD1xGdhrLrcFdcS9WIMeVcmswouoKa6q60I3RV+7Mn5zmnSicRIvV6V0UwXdEr+
         a08hcoqDUFK0WFCXGgqAF6iOaO6aNVBSDjUwpmXO2rt6qUaMhrk5bfBeKSU3p6wCoBz9
         mprg==
X-Gm-Message-State: AFq9FYI4yYnVus9lvlEfblgPnCa7Wow7GktYs47WAtfaH79iHLgs7EKk
	BWGI+2V2HpxCUulUrInI+hdOoi/nXVeME8baT3fr8m8jXGCG/Uhg6bBNGafBlUGfeAEGJJD6SEs
	/ocQ7LKdAt3IWF8AbgWTubPCKPWhDgPLI+ZRQ
X-Gm-Gg: AYBFou3QVMApp77aWrvg86yfOY5j25NWWQAyIHIxA2H7RCWbDFicVOmfDbpK/Wp0oPp
	754DjfQ0qVLoTKP72Ofd497JElrTNs5Xi9WsNNFDt6dmAHCV5kf/Z21UunM2V1llsql6/oX6n6H
	Nkr6oXRITefZ7FBl4Iz3Flv1P3jasyuPW7JwAgdK3Xn8W9+jOdDDIUbIAr6F7JXwKTK4ftc1iMv
	NOI6KjSXYVXI/njM5/r74RBjmOR1uIU5RkMAzpr9yOnOKBPue4iXyqF9HkMdsJ8U7ECswwuU4rk
	OIVGKl7eSseLdRH/GkQDO0X+HBrfj+Xypj4ZnBTxqQsklWmwMVb8E8CIwRcL8gYWChZG7QE2Bni
	assketGzU7RgSvw==
X-Received: by 2002:a05:6000:2013:b0:48d:ffa3:714 with SMTP id
 ffacd0b85a97d-48e07baf80amr12317622f8f.19.1792383276555; Sun, 18 Oct 2026
 21:14:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Date: Sun, 18 Oct 2026 21:14:25 -0700
X-Gm-Features: AclHuK_ZGNbfLEwAFV3vlSWvTWacgfIUCSCNaVmwwuV0DYWKBNudyc8NQ_Sv0-4
Message-ID: <CAPDEY+VjQ2p3uWXV19DLWCotW2wJwf1PwRdDkuzjyw6fvGx72A@mail.gmail.com>
Subject: Sashiko support for additional OSS projects
To: "sashiko@lists.linux.dev" <sashiko@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I=E2=80=99ve been exploring Sashiko=E2=80=99s support for projects beyond L=
inux,
including the ongoing work around GCC, and was curious whether there=E2=80=
=99s
any broader direction toward a generic/default review path for
projects that don=E2=80=99t have dedicated Sashiko workflows or prompt sets=
.

Is this something already being explored, or is the intended direction
to continue adding project-specific workflows as new projects are
supported?

I=E2=80=99d be interested in contributing to this area and would appreciate
any pointers to existing discussions or work in progress.

Thanks,
Mariia
