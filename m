Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993801E49F
	for <sashiko@lists.linux.dev>; Mon, 11 May 2026 08:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.194
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489217; cv=pass; b=cDHXoVChQslzs+PPMObPHkCWgs+CkKaBlqNC+JtzQcNanNhmpcnZS+YQsRS2gYMj1mtLmGld/WDdZaNbbZjSnHvYNs0Gg7XN0yoElHtc7e4UTqaG2A4Oa1slf4NrQ9HDj7w8JejwrCp5/MMhxtQPlS3NsWVhSI74RjzhE8MI6EM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489217; c=relaxed/simple;
	bh=gU3xptgbIAZ2oqXUiGIVyoPYGX06agsWhyiXCoTdynI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=eyLJ9TtqcnMCOcSH9zotl2rB61HPD9Bvd7LGRwweESm1JaMV1pR9cRhwU3jGPwwrpjxDzOHQi3t/yTxdhzM4KF9OCrm8OZTdKG79fCJp0siarSUWZ06IEgb4O87WC9FGYaE+0fMkjEp/n6P92kZweCaJHI5YZutWiBKJfdhG8Dc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iDGGkSr9; arc=pass smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDGGkSr9"
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-2ecf9e398f4so10905883eec.1
        for <sashiko@lists.linux.dev>; Mon, 11 May 2026 01:46:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778489215; cv=none;
        d=google.com; s=arc-20240605;
        b=HcIe3TC1Kow7GMp0+pBAWfCAHWzAwQeOkks47efJh2Z4AlyBV2GfJ3njs+3c0zQQbp
         tGjWoiehFrTmey3T5aJ2S2lLG96Tc7lagOdrUwjh9kIHJW4RldEIvJsyh+pRcuRSRaVq
         Wwctk5l7ZOPrvdErDSHMiFWxMILJypr8smIRUanZzOUzkC8LIzUkXfgCnXeGhIgMBnMb
         wZkxCzLb5ifC06L879wwejuC8dBM9dVWuuc4CfR2utNp/XGUGTZ+o+CHZNyQLKw12jbr
         2jbu+z9ziM6hYKBlMmaurTVZQ7HUgV41TxAD6/3/JVOp7CNEL9uHyNwEkDadRghsRh8p
         Ij6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=gU3xptgbIAZ2oqXUiGIVyoPYGX06agsWhyiXCoTdynI=;
        fh=LcMId+TopX0WSAxs2ndtut/cYerzQG0DSnDu6SK040A=;
        b=I76p9rz2usG2T8Joi5fcOHB4q5Z6IxgbVFUFiHpE/SV/nD5iquZnQlkqtz1DkjdnGn
         +zMLsP45OAceURc2GPq57nktKuNKYauqVImnOskQqD9OGg2SfWiNcfDGpMrj3werfUrN
         rhPdTXQq7cTN3o6g+9ZkBSS7kCHNwDZsG946g0YlvloaBVY6XRv77Xry4IwXIjywKdCz
         PpcauUeUDHRrWlYDJuWH+8Ru18jpA5erEB0dDIJDiSAwKs5cu1NCOjVVqAd25Hsq4GZi
         FoiSkQ4cNhYeR16iMfPGWaYrjXN4p2sQd+y1VvBEzTYF6nvzSytIJh13MPchrOEoOccf
         DZSQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778489215; x=1779094015; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gU3xptgbIAZ2oqXUiGIVyoPYGX06agsWhyiXCoTdynI=;
        b=iDGGkSr9+y3aROXw2CA5miSkC3gysyp+d1vGVmKmFWiWPW+nRP/sLEII7W/+cvNcaa
         xJFHgI640KCyZlUKpcFRcjiTQ7i/DWK/dFLj5OU6lKjv3Dg3JuOClq+uemVee+SIPP09
         8zRXJP/64MLLhj9rHIg2nzzw634OFCiYFcZSShqIWV5hJzMfHMLRdA9wJRXqsecDaQzY
         OBKdsAabC4W2lkDX+aHdUVbwDdWEaSAiCDtzOUwpa2CboMC7P/4HrCvd4E0VCbTM9OFC
         ZZd4pVXJLmFJZIw9KGyHpTKgCv0/vD99NmVkhNhxZP72g55TWKO+V2nj3+t8CosRn/EU
         jQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778489215; x=1779094015;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gU3xptgbIAZ2oqXUiGIVyoPYGX06agsWhyiXCoTdynI=;
        b=AK5iMi2XW96WSlUlqgSiBs5CRkaSjbIVf1pU1sIbSMGjpPyVJOfqkpLyKG/CgEPZPs
         ne2KUR9JdcwSvSfqYQOR1ArCDTSrNVL2Ve+4FkYwWJlc+smG3tGrM/5thhTpms/kWWXy
         +DsYv8H3mNkid9GV6HyD8S7sjTVa6EmbhSyIDSrt/ut4vpbaoj4Ma4T/NDLLUfGAPTXo
         gEEBBT8FWMQih6co1CIO8ztV85qMhbwBzbuxxHuojU6YJhvi2aPVq/tC/zHqRNm8euCr
         H+EH/xZDKzxlqQDZfnrEVay8cpZ3CIklUG7ptkLEXl5pE2kdkcuIib3Ar08K0/3MOYx7
         9UyQ==
X-Gm-Message-State: AOJu0YxKrjt/SVm/0gZUN41AgZ6ic4oUjw0B0ZMJNBXYmoxjjwiybp4H
	Bb/2xGNtZNSZpCpzZUJhjRctS5C/pamHQBfW4lcd2efGUb7q3OTHBMIhQJPOhTQ2CakZG6pg1/9
	PakbH9o1zIMbmZAB37+NqW1QKilb+00w3J/PcZSQQkw==
X-Gm-Gg: Acq92OGlr1upAyuQEEgjSS8uqTsHDNiahWUhdACfnvLQqLSL/G1SAG5rKkfNBvfvDF8
	ST90odZANsDvww5v1Mb+lpSds4gBjIp5bxjwyLgjjd6M6j31dxCiYekUGtgPdpjWc3RowLY2lpT
	MwyLFSjavW0IcMIzuN/X6D3i/AkziHioM2c+TeQiAtpAUvrJ24QW+tGdzxxVvjNTFzK7AuzcpYy
	eGZM28DsQYv5rdrYoF4UIvuZ8tNDtAHb+H7qhjItb7C9LKRnPySD1ir0O9su1fJ+/qnew563vOz
	FMUO10FGcu4l5IXLK6N18mLzQbF6KldqUqodPg==
X-Received: by 2002:a05:693c:2c01:b0:2ce:f3d7:221 with SMTP id
 5a478bee46e88-2f54c97183cmr12313347eec.17.1778489215415; Mon, 11 May 2026
 01:46:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Charlemagne Lasse <charlemagnelasse@gmail.com>
Date: Mon, 11 May 2026 10:46:43 +0200
X-Gm-Features: AVHnY4KxTT0BSdftT3UaDcjI12aKf7iP8DRALfyD1B_KIAsOXF6v56cIWxmIxXI
Message-ID: <CAFGhKbx53f0Y4XPpTcpqaYbXVd+Gu7c8L1pWKnEfVLxG-Aktcg@mail.gmail.com>
Subject: Sashiko.dev webview not getting updated
To: sashiko@lists.linux.dev
Cc: Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi,

I just noticed that the web frontend is basically stuck since
5/10/2026, 1:53:04 AM. Ok, there were two more commits around
5/10/2026, 2:17 AM (most likely GMT+2 - not sure).

Is this known?
