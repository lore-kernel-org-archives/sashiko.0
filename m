Received: from out28-89.mail.aliyun.com (out28-89.mail.aliyun.com [115.124.28.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1113034E745
	for <sashiko@lists.linux.dev>; Fri, 18 Sep 2026 01:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693267; cv=none; b=U+X7uAaN/56JxzRHRnXBvyngBDCvC9rjX3aTu7ZyA1LU0kjdASJggPBHtjpsNpnGrXITJUmwMoDkAm2r84/6zPb+j5tLLp6/VzqwVDxqEINLL+2ZLtEbqmLxMCKy1eBdxel/6RGKmVDvIGgn8RPkms6yCtqk3ES1ebjljy/6gcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693267; c=relaxed/simple;
	bh=AG7124INh8KW2o02jqpELa4ckSXRxHizRCdaCmaaNA0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FEx0EyBHow5qkHBLWAQQN7vbRMYb7fAyPgQHyb1odpZPoNY9ise+4XVmoQ4rE2oM4H5/fzrbRorDFYuyN/LBFLpHYfY2bX3h/5VzJZ+Zw6N2Ne+Niug61CBYFAVBJ6ZWD6o+2fafAYqOUO3Wdoh1PTh0okzQcmhl8Imj0mEC5Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infistar.cc; spf=pass smtp.mailfrom=infistar.cc; dkim=pass (2048-bit key) header.d=infistar.cc header.i=@infistar.cc header.b=ossqf29j; arc=none smtp.client-ip=115.124.28.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infistar.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infistar.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infistar.cc header.i=@infistar.cc header.b="ossqf29j"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=infistar.cc; s=default;
	t=1789693255; h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version;
	bh=AG7124INh8KW2o02jqpELa4ckSXRxHizRCdaCmaaNA0=;
	b=ossqf29jWC304iqPJpxbNqnGOlzyBvF5Ef0T52rWkqX7csJX8Rgq4RAZ1889yT/SB17JY9AcrUBWFqaH0XbLEnJsRO0FE5oPnxKC+3iSzP/nKwll+JQoEC6/+GpnsRWVc4DC5d/cilKYVKrziL4ckwIu/SS9unuUY1VrNywUg8bL/KZwpwN0KuGuee7eSfoV7G4oUuTA4r2zFuozjsT3zpdK8EwnklNkAH9f1FHb9IUZ6NurIOq6eCHwtCB/C1yfjfKCQ0pNp6HbGfxgjyAADk/iM9wMdyzNi0958xsyg/JOkPLEkSHyWLisjwzv3lSDGEZGFFku4AQH1dfJFLCP1w==
X-Alimail-AntiSpam:AC=AD;BC=0.5163766|-1;BR=01201311R121b1;CH=blue;DM=|CONTINUE|false|;DS=AD|ad_activity_exhibition|0.588433-0.23975-0.171817;FP=16533208473126153591|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037006180;MF=outreach@infistar.cc;NM=1;PH=DS;RN=1;RT=1;SR=0;TI=SMTPD_---.jGGKi7V_1789693254;
Received: from 127.0.1.1(mailfrom:outreach@infistar.cc fp:SMTPD_---.jGGKi7V_1789693254 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 18 Sep 2026 09:00:54 +0800
From: outreach@infistar.cc
To: sashiko@lists.linux.dev
Subject: Business and Sponsorship Collaboration for Sashiko
Date: Fri, 18 Sep 2026 09:00:54 +0800
Message-ID: <10aebdf872e44ef0564b547f3a063dcb2d01b08505da2e91509be2c3c254b493@infistar.cc>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

I am from the Infistar team (https://infistar.ai), reaching out through this =
public list as we look to connect with the team behind Sashiko about sponsors=
hip opportunities.

From your public documentation, we learned that Sashiko performs multi-stage =
agentic Linux kernel patch reviews with support for multiple LLM providers an=
d OpenAI-compatible endpoints.

To support your development and users, we can provide direct financial sponso=
rship, multi-model API usage credits, and exclusive discounts for your commun=
ity, as well as hands-on compatibility assistance and co-developed configurat=
ion guides for multi-model workflows, along with sponsor placement across you=
r documentation.

Could you share your current sponsorship options, standard rates, available d=
isplay formats, expected cycles, and the appropriate business contact for the=
se discussions?
