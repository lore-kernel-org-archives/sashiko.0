Received: from mta1.migadu.com (out-190.mta1.migadu.com [95.215.58.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B483B6346
	for <sashiko@lists.linux.dev>; Tue, 13 Oct 2026 08:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880529; cv=none; b=dZeJ9Edc6+Ua2NJml4i8Vj/EGF3dk96OR1urH77U8cUBg+us2at7m5KSynjRY+L9HVXjwTkXQ8KGU//A9D7R0oNNf/hEKUbqfEoBt/g1I9m7pgl0aa7Zm/XP8wvQiBGakBwfyzCxuJVUcjXrM349Voge00QhgeVEAKfzEJ4sGvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880529; c=relaxed/simple;
	bh=m/m02naCxilGcooeiEO+V9uEmhZerdZ4psG0Q952Y50=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=JxUeRZpPBeawXY0L29P9pKJBTZdMCGOJVfD9sLEjm7xlliCtkRN+Gp50ez3AKAnXzCyyTmACsZvWYh2K4IiiRPRr4J8AIBntRuSfAA6Vs0wNDGeh5jpfhJXH8kD2yftha0VbDmaUNMlLfOVMnIR1xMU+bPcpnBw128+Zm5gYd6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bS39e6FZ; arc=none smtp.client-ip=95.215.58.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bS39e6FZ"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=m/m02naCxilGcooeiEO+V9uEmhZerdZ4psG0Q952Y50=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791880525; v=1; x=1792485325;
 b=bS39e6FZoiFKa9Uz5YVoZj2G9XO/ETtW+EoHIUMvwCNXs4JZLg/fsIeljBJ0B0JVjSBfsG5s
 MMjoO5U4lQkHkaHmDc08W3UWigQZE26pqMyyCdmRPfgK5LDqV80rZgkZX7q0w+g/53uM4BiVhrb
 qFeBCp7V9LG08mnqbjupb8wQ=
X-Envelope-To: sashiko@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 53f409bf4b530670;
	Tue, 13 Oct 2026 08:35:24 +0000
X-Mizu-Trace-ID: 53f409bf4b530670
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bcf03d95b8so13757e87.0
        for <sashiko@lists.linux.dev>; Tue, 13 Oct 2026 01:35:19 -0700 (PDT)
X-Gm-Message-State: AFq9FYJhM+72/vYWZ4EhAr6f9lo8EkNm/ukUxfJOQlxZhkLOff4lHnF/
	3RS9z4S92YlWZ+jOBgfF0H83nuup4BYnh/6F/Bds1Lr+1npu01mXn6VcN60Bkpz1FIxsK7tn983
	q29TiFgyE1iKt9r8eQ3eghcml/RUcbdopQUjq1USP
X-Received: by 2002:a05:6512:3043:b0:5bb:661:7db4 with SMTP id
 2adb3069b0e04-5bce97ff24cmr289768e87.0.1791880518830; Tue, 13 Oct 2026
 01:35:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 13 Oct 2026 09:34:42 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzi7fbbA_t3-9Q3KD7Orn=ptphXPQw6TMO=n9_z9t2OyQ@mail.gmail.com>
X-Gm-Features: AclHuK-umisSq85iA6y_hAQf1_e9sG8tWF7KUcfNxPXa0PziO91eRok9fy-WSNc
Message-ID: <CA+EHjTzi7fbbA_t3-9Q3KD7Orn=ptphXPQw6TMO=n9_z9t2OyQ@mail.gmail.com>
Subject: Notifying the assignee of a sashiko bug
To: sashiko@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Roman,

I really like the new bug database, and I've been using it to triage
KVM/arm64 bugs. One thing I noticed: when I assigned a bug to a
colleague, he didn't get notified.

Could the database email the assignee when a bug is assigned? The risk
of people using it to spam others seems low, since only maintainers of
the affected code can assign a bug.

If you're open to it, I'm happy to send a PR. I wanted to check here
before preparing one.

Cheers,
/fuad
