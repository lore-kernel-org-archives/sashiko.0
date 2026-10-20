Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491399;
	b=f3LePxAZTBveJqxWwQFLDMH1xVI2aSHSEINbZWD0AJ7PbFR3gzaNVbigJpvNlOZ9tun4
	 b3Wq9Xh5Ds0loWDf9Jd1qLBnwcXZ3ro5Dff5xQzRiGbGo8AI5WllyslxocGKVKbY8zVH0
	 eWdqI13lTNgkxiq9a2saC2o4qI4v8bsVTHb78oDU0k3G9qeLd+CuxlAt5K6IedR+2Jaln
	 f3VrU795YqFtvPhLV/rlJVDCkufAQkDKNk0EqJzys1khZV6DGev9NgcCt/kWmqzW1Smfd
	 DAo3/c9fR4uJEd7iMRX6bkdzW+emZW+GYtUa58YvtMMK9NRCc96k78CthKotYtE/q4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oTSkFXns59HAldM7hvavmtjBVDNj9bF5g+FWPzB03+w=;
	b=E3uyzGZwCzzOLSCrQcBynBcM/stjkY4fh1aDis+ERMwezfv5di3AgV0friyoeTBlyGNo
	 d0AHTEKLUrVKjugQf4NfUrFUFTnrbPw7Jpno7a472kMP/ooigWZU+mX7+9hzOKIZ/wmh1
	 bxK09p5nngXdRC1iVGSA/iCh7OcnEDwCmgPbwB6pM+GDyzmeqJTFyZ8DcITRZtfnEWs8Q
	 R1p9c1XJcWA0dGR8GMcsM/5HW97JaOA/5On4xmnpm2kKf900P8tdeVqNZo6mSkonFY+bA
	 5Jx0N9C+M3ciaC11VGnM9VtnCklF1o+/90W4R+MyweS0zQVzevo2AvOd9J6ofjnwOzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J4jcNaR0;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA95606A31A
	for <sashiko@lists.linux.dev>; Tue, 20 Oct 2026 10:16:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADA95606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J4jcNaR0
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so1666771a91.0
        for <sashiko@lists.linux.dev>; Tue, 20 Oct 2026 03:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792491398; x=1793096198; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oTSkFXns59HAldM7hvavmtjBVDNj9bF5g+FWPzB03+w=;
        b=J4jcNaR0HW9XEi6hPbxn0MPsC7VbkwY6yoaCqxTaZhRE2fnXlEi25j0u3Dm/0O9Vtx
         bnG/Abz/3CZ1M8Aaop0VOjH5h8SE7xq/2UeqRL8pN5myt4YpOffzH+D6mjWTBvIHBn4n
         nTlkjwQespXVkIaSOM2kTUsXHFqt2HUsfv3SwOWSoE4rWKE+qyVa3vFYwhlLNEjKbQT1
         DQ3h2NLQjB46+5lKorxOxWueVE+wqRixGS+/7zQiTHOteqFn0hUdxwN0gASqoCmsc9TF
         wm3Vlx1EVOQBqZgYP4jI5bQlPYhOWNkjKF8DA6pCSojQ9Eb1mXsGTdUITCSXokFsyfQq
         1jog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491398; x=1793096198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oTSkFXns59HAldM7hvavmtjBVDNj9bF5g+FWPzB03+w=;
        b=WUsep2mC9oBkZmbCxfkKu49QCkDcd4Hpff5aeOKkwcpfpX2atA3dkWmM4prjJFVVRh
         laZDSRtM/ocfrbc0dxADZT6ZUcW1Rz5RIGK1JO8aY2k5X9Uke1Bc27e2kO42x+sbc75U
         Gy+BBHEzpnRW/fxsYTXU0X82bOfpcRL+ROOw8zZD1hmwvkR+VIb6KPoVkDipTRdLaGE8
         0p9Kc5wm/T9CdSzFJX4A9RIDBk/r574sIAM8021gtvak8HhhmbmUdzcnMmuJpbKHj3Gt
         m2/W45hrRW7FqoF7eZVqJaYZlRbtEzk33kJZ/0DLFY8iF0JEfOZyfi9/JC2+fwGkK27B
         dsXA==
X-Forwarded-Encrypted: i=1; AKwUvBymEJX1yEriAEQBfjAEmgUZ+xwN+1vKWHhom8ciau7PRbNi0o+0wnvn6Q8PDbJqzSnTVFi80dKa@lists.linux.dev
X-Gm-Message-State: AFq9FYIdKJwhBM1zRDDoEKlvLQ/ilXNqcXWPxYdcrI79kWQ/FLKV8kPx
	7F5t6oiM93ZEcNfiGcyEh3yZfxJGM9KSdSPfwdbkdswkH0twWKARoN76J90qaA8Q
X-Gm-Gg: AYBFou24+xpukocHia8QUaaTnmhbjnTJvVZ235tTkfluMFGLhfbxXEIKmGTjGKlcybj
	5noKuJaknWip8/uwpdv+ucnKdUDdqD+k8kg8mIEv0vzZIPV47IcwoELxF7BpkelBgb0Sd4Cqbbj
	G+9p6oMbD2xXlgC9AlhI3OLj4t+JyWNcTdq2yIo9ZifzQbLoXycAvr8ORTpB4CP3EJHuwEXZsIx
	JkFIQfz4wmB+c4BC1Blql3w8knN9RS0E7jDOHmyCJLxfnCX7Xs5m3EWwAmV9m+C5I6KC0bCh7Nk
	aViyYX8I5fZ1epW3wEqNGJayzFv1yp9p8FS+UMtouW5dIuEP3LNHUnFG7TPsnfMb37/RpmbZESB
	uhzZScpK48Dm4A/t/WREGVyg2F1JB8kyTqGo9cfheFCGU3MkgKh9Q09DqGMF1rQbeaAJZ9vbXy0
	xZvGhRRbbsr601NkEwRyulKo9pFisQcJHb4npfUR75NtFqMMhxa/6kNIOg7EYCHz/FJ0NdnyJM8
	ZFpuY4XzlW0i8gDdirF5qqrosu72vUmPjxCAlWEM5xH2E3ASP08iwpOV4DXJYnHEjq76hEL+1qS
	eOIbWfnJYdSOVVBV/FVJTysWS4Azirth1isBZPDVV/IMDwpP6Ogqp42cBmb/aFUhbTE=
X-Received: by 2002:a17:90b:28c5:b0:3a8:c0cd:57f9 with SMTP id 98e67ed59e1d1-3acef10d02dmr8951961a91.25.1792491397862;
        Tue, 20 Oct 2026 03:16:37 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60f34bb6sm3395658a91.10.2026.10.20.03.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:16:37 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	sashiko@lists.linux.dev
Subject: Re: addressing sashiko's false positive rate
Date: Tue, 20 Oct 2026 19:16:33 +0900
Message-ID: <20261020101633.3446359-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <7ia4se21aeyt.fsf@castle.c.googlers.com>
References: <7ia4se21aeyt.fsf@castle.c.googlers.com>
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Roman,

Thanks for the update. I will try the new version. If I can help with
anything, just let me know.

Best regards,
HyeongJun
