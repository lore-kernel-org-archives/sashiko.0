Received: from forward205a.mail.yandex.net (forward205a.mail.yandex.net [178.154.239.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9953D0923
	for <sashiko@lists.linux.dev>; Sun, 27 Sep 2026 22:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790548358; cv=none; b=PLLDtHtxG9krudufLS1H/IxPK2jb3vwZDUcMiTi6hWGyVoFpKmMeWRKMNiqxBHI0qDEXcPSu8zDoir7SgCiUay+Nhpj5XVC+UggRH29AHlAY61PCIup73ZP9Me09jWSeoMQ99v5qNOz6TyFm+6VV6173buiCJLmf3otCNiK4Qg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790548358; c=relaxed/simple;
	bh=waodHRbgOubXryIvWh5W7YkCZ/s2Z29rKV6rBp+m+Os=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=Dh3j2gCF2Jwu+Pxw0hNmJwYhGSqJz+5cVMyTeYPwZq/R61dnrBEv8FZF2dhWvjEUIOIeBx0M+KLf4dl99tDiz6eYQxzxhRZG0bnG/F4N8bzj5XLRhgRB6KdYQn2uJWx9qxONP7y38qzLA+CnMDachcaxXM8p3DYZ+ax2HTVkkuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=c64r0TdO; arc=none smtp.client-ip=178.154.239.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="c64r0TdO"
Received: from forward101a.mail.yandex.net (forward101a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d101])
	by forward205a.mail.yandex.net (postfix) with ESMTPS id BFE40C2B35
	for <sashiko@lists.linux.dev>; Mon, 28 Sep 2026 01:27:16 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net [IPv6:2a02:6b8:c0f:714:0:640:b148:0])
	by forward101a.mail.yandex.net (postfix) with ESMTPS id 6CC0F8072E
	for <sashiko@lists.linux.dev>; Mon, 28 Sep 2026 01:27:08 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net (smtp) with ESMTPSA id 4Rpg9kSpQuQ0-RMoXuvtv;
	Mon, 28 Sep 2026 01:27:07 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1790548028; bh=jW3atkc8nuTlywKVspOh5NK1QjaBocIVkGNSXx2dVdk=;
	h=Message-ID:Subject:To:From:Date;
	b=c64r0TdO/h/W2jSLOhlIUmBh0Xv8hfteVzBdKGiqWhxDiL4CFNEfqg2D1oSJWLATs
	 v8eGkPdtCjzYtXpN5D1dJiO+DvdxqFSHDJbMzykHt96stwG8Xw4MBL83WIHvG2eXxp
	 L7uPzX0zXembgSV86Ez3c3EkLcjvubCt/yvsZqqs=
Authentication-Results: mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
Date: Mon, 28 Sep 2026 06:27:03 +0800 (CST)
From: xhzd6964@yandex.ru
To: sashiko@lists.linux.dev
Message-ID: <1837644583.7712.1790548023963@811b6d7f5e3a>
Subject: Introduction translate.js  to support multi-language capabilities
 for Sashiko
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

sashiko.dev Hello, I noticed that Sashiko is an open-source system focused =
on code review for the Linux kernel.

 I am Guan Leiming from Weifang Leimingyun Network Technology Co., Ltd. We =
have developed a product named translate.js  an open-source project. Given =
that Sashiko=E2=80=99s target users include Linux kernel maintainers and de=
velopers around the world, I would like to ask if you are interested in giv=
ing it a try translate.js By means of this approach that requires no modifi=
cation to the code logic, it provides automated multilingual support for th=
e project, thereby enabling developers from various language backgrounds to=
 use it more easily.

 If you=E2=80=99re interested, I can send it to you http://translate.zvo.cn=
  For this demo website, you can take a look at the effect first.
