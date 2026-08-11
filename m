Received: from mta0.migadu.com (out-243.mta0.migadu.com [91.218.175.243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B963B7B84
	for <sashiko@lists.linux.dev>; Tue, 11 Aug 2026 20:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.243
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786478644; cv=none; b=HHRr1Wd1UOeOs7pRWXheerfw22hGbVqVF9rXTkUn1TR9ZWcwNbvKBcY1Ntsh7UbBto18DDVa8yY9+bJAbXd94YEVo2ECPiL3synN0vcuV7WUAi00zbWxfiIoPcOmYL4EstFTDy4qGtav8IvqnQBQfybw9ed5YJHFOHKjwH90bpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786478644; c=relaxed/simple;
	bh=vY3apXwfGZg4e8WzDZh3RJ1vPy5sIry9orFy+RjH4j8=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:Cc:To; b=ZVHIWOr1veqaX/MZ+iNmPhOzo/WRyHU+wA4U7WofyyBQB0S4TJqo6YAuydO2WgBpYi1PiHw9yL+xBBIWnBtTY/NREOjpdmSeIB7tgTI4iuwnKiujS27ckxPOR0McxAQ/0u/7+T6eHHDyjSEhDCVC5pNN5pcWFL0Qm1YStFxSsMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JLrpOele; arc=none smtp.client-ip=91.218.175.243
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JLrpOele"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=vY3apXwfGZg4e8WzDZh3RJ1vPy5sIry9orFy+RjH4j8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786478639; v=1; x=1787083439;
 b=JLrpOeleGPL+DGw+iYBUeG7PromKJpR2a2HUkHRCBt9mJyG6oxYvf8KKa0M8l2fs+TDA7PiM
 7H8oazXNabxDa1O8LiadtEGwArf3u0Unk24/imB0tlFPSWedQwzXDTrunWXOy+JWYdkgP5JqdKe
 ZSLGcw3g1n6gejL4QLYBu4Zw=
X-Envelope-To: sashiko@lists.linux.dev
Received: from smtpclient.apple (37.66.177.218)
	by mta10.migadu.com with ESMTPS id 027caa9157265dd3;
	Tue, 11 Aug 2026 20:03:59 +0000
Authentication-Results: mta10.migadu.com;
	none
X-Migadu-Scanner: mta10.migadu.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Roman Gushchin <roman.gushchin@linux.dev>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Sashiko email outage
Date: Tue, 11 Aug 2026 22:03:40 +0200
Message-Id: <F8DBAB6F-7A3A-452F-A21B-3B8E56FD85E0@linux.dev>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
To: sashiko@lists.linux.dev
X-Mailer: iPad Mail (23G71)

Hello,

JFYI: I merged a bad email setting change yesterday and because of it Sashik=
o wasn=E2=80=99t sending any emails for about a day.
Reviews on the web page were not affected.

It=E2=80=99s fixed now and tests were added to avoid such incidents in the f=
uture.
Sorry for the inconvenience.

Kudos to Arnaldo for reporting it!

Thanks,
Roman=
