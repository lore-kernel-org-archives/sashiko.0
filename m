Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B296B36B076
	for <sashiko@lists.linux.dev>; Wed,  6 May 2026 10:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778062970; cv=none; b=LcItNRpCekEI53kdsVVasWRAek0/Llzo+rvSd6F4mOtTKyAT/IVddiav6YcJSMb8i8rAVDMrzBUbzvvDiifOGLoeHZSAAT9b9HGesknEaFHb9/pDZKL+XEsTV9mgh+UIPobXN2fKi6FnIjR/JknE89Gdh7dsID4jZ4xQvhRPjLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778062970; c=relaxed/simple;
	bh=EIPDHOj0tbJ9LOh36kG1JvSGPwJjQct9wKcW54ISabA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YoLG5Go450tKbamh+pIpDWF+eYxf3EUseDYVNBH0icH3Yb7/q2vAqAwSScT3BuF1zJhwUlw66pB9RPW4ymJqh4kCbBC7Yr3IGBNbHgujfzV5INzARIqGfrW1dNsLSTfQgbNRzYDs2W3tbz9Pc4CspwXw1p618muQYaS9+YyWleM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B6R9hGfx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B6R9hGfx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778062969; x=1809598969;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EIPDHOj0tbJ9LOh36kG1JvSGPwJjQct9wKcW54ISabA=;
  b=B6R9hGfxCVVt0YCna6fTJtAUxWKhy/m8SS8cSSJ72jHfN52y7O2TA4Wf
   SO3WBhdWw/w8APwBBwN8gXfKgd9lg3frhSfvoJVDjBifoU3PiwKopnIAW
   BR21P5Mf/ww+tSpCnDic7HL+GtzjMDlnh3B5HDNZ2IHKzEbrhibhjlXjl
   b6EVWrmliyIrJmVW+B1W+upaUReINk6piq+vkk/uIUc4FPlekeQe+IKCE
   mWVVWjy3pAyN4Q7I58bHABGEjvIBFuiE2KZwFVXUQgTx0gnxlzCwmuCJP
   qyuySHcn2b2RfUcp1gyFihf9awmqzvMwmcapTyib5nhPjP0DwwMuy1dI8
   g==;
X-CSE-ConnectionGUID: rTgrfdotTWiGFdLUvNBJ9g==
X-CSE-MsgGUID: bHj1WLPvSCOhk+D53XR/Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="89298447"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="89298447"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 03:22:48 -0700
X-CSE-ConnectionGUID: WIR2gwUtRni1MYxxF9yvvg==
X-CSE-MsgGUID: 9cgHl3cmRtW7jiW+T/zTgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="241109438"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.183])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 03:22:47 -0700
Date: Wed, 6 May 2026 13:22:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: sashiko@lists.linux.dev
Cc: linux-pci@vger.kernel.org
Subject: Re: [PATCH v1 2/4] PCI: designware-plat: Drop unused include
Message-ID: <afsWdYkh-aMlpjcT@ashevche-desk.local>
References: <20260506084858.867884-3-andriy.shevchenko@linux.intel.com>
 <20260506101651.D6FD6C2BCC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506101651.D6FD6C2BCC4@smtp.kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, May 06, 2026 at 10:16:51AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] In `dw_plat_pcie_probe()`, `pci_epc_init_notify()` is incorrectly called on the error path if `dw_pcie_ep_init_registers()` fails, falsely notifying EPF drivers that the EPC is ready.
> --

Nice, but completely unrelated to the scope of this mini-series.
Whoever knows better the code and wants to address that, please do.

-- 
With Best Regards,
Andy Shevchenko


