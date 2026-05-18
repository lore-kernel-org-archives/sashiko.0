Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0E43CDBD1;
	Mon, 18 May 2026 08:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779092552; cv=none; b=gKCzQtA8Qu1QETjJFM5yrhhjVGNde/SVUHSLDgbkuDCWvTkvACmyIk1CbTNqG6C1DgVnRU/9G/HJxwYlApDKZ/nzaCuUe569dYUMTewasNnvYcXShRyzdfcJBcNJG4DkD0AHdteRNjAE6LLugm5twsF++pi5gF5IMcbXnUt022w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779092552; c=relaxed/simple;
	bh=JKQXM+aklvzg+HECTcbU6iBFBwV9nwFA+IONcsJPURo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OzCCscd9VeGn3bGCrIurhT8nHKzUrr6RGm6ecNPwyNspFjxHk6F8HLxDxd7fnO4zJAuSVthDNNPLhf7kbkPjE8diVdNkdLEVqWPTamhj4R6tsm/O2lFbK0FxY2IL7IQye9Hp28Axl/JXvatMpdDD8/qwtvmyMJdYBQEyP7lqOdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b/40gpvp; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b/40gpvp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779092551; x=1810628551;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=JKQXM+aklvzg+HECTcbU6iBFBwV9nwFA+IONcsJPURo=;
  b=b/40gpvpAGxWZauVNT0VcKJyuNnss9ex8mLlKm6ha6XssVBKQ7MMFpkj
   tfxOa+WFypwgrJXebeIILyAKMVMJ7EdiHGrGKE8/5pKkXSSKtJoMJSVxd
   healg+O46s08MZ2Y99mX34M5R9d657S4cBhi+za2k48y9OeimOdfBCpt/
   zvgMTBlnYRSUumMPoaM6GOoEZyhGZ1lotYwGsVyatYPsJQ0yop+1AXLnE
   KkmkJfL/+h0EN0h3cBE8cwFv5mCgCFxNkHZwU38DYzcNufT2rR0eSxFVm
   lsE4oW78/gsuewQT1LCQiY0fm1X8UJ5VBxYf3zXy6f4ZvFaQKMu1pYBxg
   A==;
X-CSE-ConnectionGUID: 0uLhyUPZS3219xFbUcQI0A==
X-CSE-MsgGUID: gDsUaoXRQmuG7arKtrKaww==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79970699"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="79970699"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 01:22:29 -0700
X-CSE-ConnectionGUID: 1uM92fndQOqU2AOGjgD0Rg==
X-CSE-MsgGUID: BrsBKavTSHyg+BioSlzHug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="238480389"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.1])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 01:22:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jonathan Corbet <corbet@lwn.net>, Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
 sashiko@lists.linux.dev, Linux Kernel Workflows
 <workflows@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, kfree@google.com, Dave Airlie
 <airlied@redhat.com>, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: Stop false review statements
In-Reply-To: <877bp2m586.fsf@trenco.lwn.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <ad139e54-a7f0-4d09-832c-6b2bf2e93e03@kernel.org>
 <fcc4b719-2696-4f31-bac4-6c07f8ddec47@roeck-us.net>
 <221cc52e-9918-43ea-b196-622a8cc6db05@kernel.org>
 <fd3b2ca7-4d64-4c4b-98a3-7d3285fa6826@roeck-us.net>
 <877bp2m586.fsf@trenco.lwn.net>
Date: Mon, 18 May 2026 11:22:20 +0300
Message-ID: <6010df0409abe1c9fc922ce57d7baa6c6998fa49@intel.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, 17 May 2026, Jonathan Corbet <corbet@lwn.net> wrote:
> That said, I was certainly considering *human* reviewers at the time,
> and all of the people who agreed with the suggested policy were too.
> Adding bots seems like a stretch to me.
>
> I can't speak for subsystems that require Reviewed-by tags on their
> commits, but I'm not sure that their maintainers would accept an
> automated review as satisfying that requirement.

For the parts of the drm subsystem that have a committer/maintainer
model, one of the requirements for pushing is that at least two people
have been involved. Reviewed-by is one of the ways to record this is
indeed the case.

I can't speak for the entire subsystem either, but to me it was always
about people, trust, and the community.

We may add ways to record that an LLM has reviewed a patch, but I think
the fundamental requirement that two human beings have been involved is
going to remain.


BR,
Jani.


-- 
Jani Nikula, Intel
