Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F70332EC8
	for <sashiko@lists.linux.dev>; Fri, 24 Apr 2026 06:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777010686; cv=none; b=WxAwJ6EpKXFRvFTgLAKGUIAmbXnRbCaRNSf6EhXtRfRnp4Th5tAnmkNxenHbznUO6Z6R4p+bRSNA0ooMA6WYT8sXWPBkyly4tEVUKE6wU2NFOLsRsn/oKc++epMwZj3B+iK3+cOGBZJXaToYnUb5QF8cLVeX2WG2xfvjuvvYxIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777010686; c=relaxed/simple;
	bh=EAXjdfZDHQ98rbsEJyN+PupMSIpecj0poQom31vLekg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXWImyhjI7C73PZoKATqkmFm7u015CztEo3Lb70T8YrzcP5phhs1Z2bVGpfZHa1kTq/RdRWLW6HfR8j4UnETb9lh95LAt1iXxSd++AWj0CzhxoizqiQpqTAEezdeyDilP4MugtkyZsd5fm/E7eogXSfoU3V1EJ1U4Kq6p3oBSD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rXpdPVDB; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rXpdPVDB"
Date: Fri, 24 Apr 2026 14:04:08 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777010681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D10ap4XpDiIu/2c3K/xfDj0EulPvd+d1ezH9J9JaJG0=;
	b=rXpdPVDBTbnhE6CMFw1LqGBiBgn2VLRBFo3avglIZny08PHPjNUpbqwgaixqnXIMt6Fgzj
	Bfw6GQVRpoVuREhmYcFev1CmhBUU1cMrkoIjQZzElJd72esOmKnVj/TK3/N8ajtTIrn5az
	G3lvYsAd8N/jCawgAqegZi8cxicuY6E=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Li Wang <li.wang@linux.dev>
To: sashiko@lists.linux.dev
Cc: mkoutny@suse.com, tj@kernel.org, hannes@cmpxchg.org
Subject: Re: [PATCH v7 4/8] selftests/cgroup: rename PAGE_SIZE to BUF_SIZE in
 cgroup_util
Message-ID: <aesH2Epoi-HHSyH0@linux.dev>
References: <20260424040059.12940-5-li.wang@linux.dev>
 <20260424051557.8AA6AC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424051557.8AA6AC19425@smtp.kernel.org>
X-Migadu-Flow: FLOW_OUT

On Fri, Apr 24, 2026 at 05:15:56AM +0000, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 1 potential issue(s):
> - [Low] The patch breaks the compilation of `test_zswap.c` by removing `PAGE_SIZE` without updating its usage.
> --
> 
> commit f89f779468515400be3a3b17ce623322ceceeb45
> Author: Li Wang <li.wang@linux.dev>
> 
> selftests/cgroup: rename PAGE_SIZE to BUF_SIZE in cgroup_util
> 
> This commit renames the hardcoded PAGE_SIZE macro to BUF_SIZE to accurately
> reflect its purpose as an I/O buffer size. It also updates test_memcontrol
> to dynamically determine the system page size instead of relying on the
> hardcoded 4K value.
> 
> > diff --git a/tools/testing/selftests/cgroup/lib/include/cgroup_util.h b/tools/testing/selftests/cgroup/lib/include/cgroup_util.h
> > index 567b1082974c53..febc1723d09038 100644
> > --- a/tools/testing/selftests/cgroup/lib/include/cgroup_util.h
> > +++ b/tools/testing/selftests/cgroup/lib/include/cgroup_util.h
> > @@ -2,8 +2,8 @@
> >  #include <stdbool.h>
> >  #include <stdlib.h>
> >  
> > -#ifndef PAGE_SIZE
> > -#define PAGE_SIZE 4096
> > +#ifndef BUF_SIZE
> > +#define BUF_SIZE 4096
> 
> Does renaming this macro cause test_zswap.c to fail to compile with an
> undeclared identifier error?
> 
> It appears test_zswap.c still relies on PAGE_SIZE being defined by this
> header for loops iterating over memory, such as:
> 
> for (size_t i = 0; i < size; i += PAGE_SIZE)

This newline was introduced by a new commit:
      4e89004ee ("selftests/cgroup: add test for zswap incompressible pages")

After rebase, I have resolved it in patch 5/8.

-- 
Regards,
Li Wang
