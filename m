Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9367241A568
	for <sashiko@lists.linux.dev>; Thu, 16 Jul 2026 11:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784201058; cv=pass; b=Pc99GS6A+enHKWjuTwvRWGz6UC+rvaRyWilmvKdYcvwlljqS+FSZ7IRPsm9XIiSrkOy87uDuTNO83OQRETSbfbtP2CGjeep4rOTYlAxtpni0ptiAvpmIWqOSrbN4THN2y/Cjt1Op9D1Tqt/wUAzBRXt9w5JvTtWTmT5QMM59l68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784201058; c=relaxed/simple;
	bh=RjkS9Bhp0HE460kk/xkt5aacVExekADMsvpFCXckEtM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Z+bxSc29cToYyAxMX0+LtkoW3vjGge24W9GY8EgRucLKLxxDKs0qBWrPkq5D2NagixplFaGxsyF4Z20L4/3BSTifI7lrXdiPUFz0xB7Dg0D8qJSadWof/MB7M4I/FWHINIoo7VN+olCDCZRM3tAzdYaaFHjh+kD4k/NDyT+SSu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AAosQH0/; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AAosQH0/"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b013084dc2so2701734e87.0
        for <sashiko@lists.linux.dev>; Thu, 16 Jul 2026 04:24:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784201047; cv=none;
        d=google.com; s=arc-20260327;
        b=C6R7VQFmdF5DHV/muI7RGtU+AD/D630gALhPLO3orVKdY4YpMrE+m7BN3duw/OEwAu
         PLc//WxgWTO2kXOVaJsTMSYYeeXvVBpL0i6wea7ZY1Zt1iznpF6+OO0E07w7kA0lBaV4
         45jPYrHZs3/sDrilE1qg2aSgLVjDPQDREHBaFTp94+FgP6VxNC+wrmGP6KnzKU1Y+m8x
         fMVJoZae/+RBUxh3nW79GRj0uEeWTy3m14v3qbANx4ybxt78Bzx612ZhxdZd07/jYVF9
         Ul3eE1nWvccQg2jjhnIlOM6CqE9swUpGTwrgwwzbbRCj7GzeGN1vVlBc5+CTpIRBtmiy
         RbSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=RjkS9Bhp0HE460kk/xkt5aacVExekADMsvpFCXckEtM=;
        fh=8fHWDMmuffFx6LZ7jIPAWgDNRN/tmrjD/royzmkiEZI=;
        b=SOb7LiFXTLdwpIQ8mMqFD1L2GFHYlEtl0uGk3R73pMs21j7Y/T5SGO7xOkX5QWr1nB
         kbIqFaeuXnZiWE75Dz2LLrux6met01BPsG+7nj6H0elc0K5ppiUGYWI8qIqx7EBxe+iH
         +DkWyCAhQuJ2BQxx3rWZ4UUkHPOhjQ2U5n2CQFGvyXzOAUkGyt5RIU8qqlrE8DLyrTGQ
         C9pTddTW7AP8Iw9Npmqz5NiCk4f5E46c+THWLdjBGUiaZG9sOUX/z1fywOLlZV8jvDCI
         6RULKXWpVdYzvp93EdUsamiDwz9C2lSGD8hrRKlQslv+AWDyKnWAxHfboJdN+kZCJHJ8
         iabw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784201047; x=1784805847; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RjkS9Bhp0HE460kk/xkt5aacVExekADMsvpFCXckEtM=;
        b=AAosQH0/B3qZx8hLI7THALLGxrEq2zVDP1buSlaKYcePekA+s7sHA6sTkkNz4YlHXQ
         58OnEeaEt8LYvrYV2GGmf84NGNJ2WpTZHiASoDv0hYSn9gTPCo+Owel0+0AVxIEd11hA
         xocctIjRy+N4WygfTYoqswcOWOnzP+U5fMBrVlp/nsG1d1l9oAfAXKIg7dd8Ef/RYoi+
         We5r8Su9YmuPiA8oMI+mYrO3cx3uqQE7/UCQ1WhIeYpEI6KkXbSZZYkLpOe8VQiLTxzA
         EeOJ6y/jBFF+Uw0HgeIAXMfb820CRHO27udV7iqTYfikoda9qH8yEH7oWbpea8hXQ3vP
         VT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784201047; x=1784805847;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RjkS9Bhp0HE460kk/xkt5aacVExekADMsvpFCXckEtM=;
        b=qLEDXpCE1uwl7EqJa+P/ickH/8DhLCCmuVVnC2f6RA5/mG6dD4zB2TMpIoAm+BwBiL
         xxw18lKyFzgcIUAWT+7unlua9y56+OOtOzQqFwe7hq9PJApeHPL6WVCldKd3WkcmZhBS
         QKVhQBMSBn6iJiqD3MOPBVuS2clcaVdG0uMdEbVMZI5X1FOYBcvrozpzfeia1MR5I5u5
         Lh8iY3TfPizBo0DwH5h4X8sV4A4mg+JS31bjKS+XxLPLvji6H7QWoZX8cdQooTiTy9V9
         9sdlRVsALNYJW20xwl35e1c5Z4ysMW5aIl6xtMAn9MFPuLagc0C9xeRmuRzuEeJjOueM
         sNyQ==
X-Gm-Message-State: AOJu0YyAGqxu2mNdYZHVNNbay3RzRwVaSrsPtKui3VM6GO8nhqkeUIqM
	HzL/7jxOfHtHtZ9pmH3Wb5tW1W0xTQzLr6HS1P2i7XvxmrHvgTLDLG1NWSSvwhvXNnYzKM53UoR
	YIywOO0DhKkcYRcIRjgd6dZm/8iIhzITwMX5Q
X-Gm-Gg: AfdE7cl4oWB0YQPuNImZ4zQI0Kc3+m+BXkSSUYtz5R4C4sNG9Wq5QH2K9/XW1MSmeMs
	972/wLuzsp4Rf7lZaeDsQ8+9C7xzVAnTh5YEUxy+l5boBnlYE/+bKjWKZ+RFunOlzj1qLC6qIOT
	I7FsEnFFb5TWCoo+NDwjRsaTK+Udzm1/itkg3ZZCQJPcPKqJssGNmjo+fb6r76TfL98QyinjjvY
	2sriL8/mwjuPrvIN2VnWcGqm8KT6ozNBHAY9Ac7nFsFIeMy0jBQWXcmDbw2TUw=
X-Received: by 2002:a05:6512:6883:10b0:5b0:1e16:e5fb with SMTP id
 2adb3069b0e04-5b02356cc26mr3080235e87.15.1784201046323; Thu, 16 Jul 2026
 04:24:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Thu, 16 Jul 2026 16:23:49 +0500
X-Gm-Features: AUfX_mwVGArcSVWFdnaEVMTVq0VdQjd7hzdUWjmaIrCLV1IUTzFRKyyNUQ0WPDA
Message-ID: <CACzwLxgcbUXHpLZi3fz1iyjDY_kp69X4dEnObwg7wEqKdVejXg@mail.gmail.com>
Subject: Execution with sanitizers, integration with syzkaller
To: sashiko@lists.linux.dev
Cc: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hello,

Thanks for the amazing project!

From https://github.com/sashiko-dev/sashiko README.md:

> Stage 3: Execution flow verification. Traces C code execution flow,
> checking for logic errors, missing return checks, unhandled error paths,
> and off-by-one errors.

I wonder if sashiko's Stage 3 can be configured or altered
with KASAN, KMSAN etc. sanitizers. I couldn't find how the execution works.
Perhaps, such as sanitizers could improve the PATCH review,
as the optional flag during Stage 3.

This also brings up a vague thought about sashiko + syzkaller projects,
where sashiko could provide information about the similar bugs found
in the PATCH, if any, among syzkaller reports. Like adding syzkaller
mailing list
reports as context as well.
