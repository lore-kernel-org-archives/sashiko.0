Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FD8318B9B
	for <sashiko@lists.linux.dev>; Tue, 14 Apr 2026 03:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776136531; cv=none; b=JzZdqvMbkJ2qQq/oEmp3i84eDOl+u3EwRxWB3KY9OI1AxGvk1GOKL4QDVdY/vp1x8EyEXa9bPgdaaE+Fl7WXTE/eXFNwSZEWXuH3UI3vnR7Qh8tIJmUgMSBcp8vrUfZPnrDyGMmo4uoiV3DVLB2KuOOU2GEN1pVv1/vUuHWsd54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776136531; c=relaxed/simple;
	bh=w2I2htOhR4xqrGhYZWGBdeFtVdaAo3RLkHkwx+Kep4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lwZVXZ5cje4YJu0tuKNAXHzhvsMWdlwAEkbEDpc8Jdp9STpxSQ7ysevNI7cSMwDZO4py+xjXOSk1BYbdjQIZ17qr+VFfqePO4UA+WtOhxfcRSzDmiTSEQ8CdzEpBOLH43cyuyyhdGhNZAl/KRAV+Z5uTdNqU/8MjAUNu67lNWOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k0FBYLpv; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k0FBYLpv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776136530; x=1807672530;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=w2I2htOhR4xqrGhYZWGBdeFtVdaAo3RLkHkwx+Kep4g=;
  b=k0FBYLpvX3RCn3QU1ko7LP4nlNTg+MP0pFYkUjuIfQsb+aOpPkeS3nGr
   dzkyYUZ6HspRVn74Hz88v+i23MwYVujia79FxvlzXEHdjiBWHL0xtHDXW
   rCby3SduRtrzBvFfSGQ3bA139vu0D8y2K46m0wxQ97ofJpSKFfC8nG6qf
   avTHXMIuyvFRcThqxKdLBqXyy+uhIlEM19uVBBvc9ZmwSIzxPVIkSLp0K
   YGOnJCyzX2+Ud8F2bRiP5LaAhlrKZKUcprm/9jKeEOx7WHsVBMU9xC/vY
   5nM2yNwJedXsK8I/P3IxKO3TNClOUyil+lq0vagX8X92gxJCwzZ6I4/l0
   Q==;
X-CSE-ConnectionGUID: RNCuJzWPRcK/XS2oqAHm8g==
X-CSE-MsgGUID: OENkU8kVTTeXbL3yS4MUEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="80673548"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="80673548"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 20:15:29 -0700
X-CSE-ConnectionGUID: u5WhMYxiQEuOQdYHlMIKBQ==
X-CSE-MsgGUID: Yo+6E5geQUWjkP9/2OF4NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="231691990"
Received: from unknown (HELO [10.238.1.30]) ([10.238.1.30])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 20:15:12 -0700
Message-ID: <9f634c87-ca72-4b31-8001-3d0fad4e884b@linux.intel.com>
Date: Tue, 14 Apr 2026 11:15:10 +0800
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf tests: Add auto counter reload (ACR) sampling test
To: sashiko@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
References: <20260413010920.546501-1-dapeng1.mi@linux.intel.com>
 <20260413012636.EE18BC19424@smtp.kernel.org>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20260413012636.EE18BC19424@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 4/13/2026 9:26 AM, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 1 potential issue(s):
> - [Medium] The test fails to genuinely verify that self-reloaded events do not generate records because the chosen sample periods and workload ensure the self-reloaded event never actually overflows.
> --
>
> commit 5e7a7e069f4c078327e3d8166d7f74d9084ec8a4
> Author: Dapeng Mi <dapeng1.mi@linux.intel.com>
>
> perf tests: Add auto counter reload (ACR) sampling test
>
> This commit adds an auto counter reload sampling test to verify that the
> intended event records can be captured and self-reloaded events do not
> generate any records.
>
>> diff --git a/tools/perf/tests/shell/record.sh b/tools/perf/tests/shell/record.sh
>> index 7cb81cf3444a7..1068843282f51 100755
>> --- a/tools/perf/tests/shell/record.sh
>> +++ b/tools/perf/tests/shell/record.sh
> [ ... ]
>> @@ -402,6 +402,47 @@ test_callgraph() {
>>    echo "Callgraph test [Success]"
>>  }
>>  
>> +test_acr_sampling() {
>> +  events="{instructions/period=20000,acr_mask=0x2/u,cycles/period=40000,acr_mask=0x3/u}"
>> +  pebs_events="{instructions/period=20000,acr_mask=0x2/pu,cycles/period=40000,acr_mask=0x3/u}"
> Does this test configuration actually verify that self-reloaded events do not
> generate records?
>
> The test runs the thloop workload, which is a tight CPU loop with an inherently
> high IPC (typically > 0.5). With periods of 20000 for instructions and 40000
> for cycles, the instructions event will always overflow first.

Hmm, makes sense. I would check the IPC of the thloop workload. Suppose
setting periods of both instructions and cycles to 20000 (IPC=1) could be a
better choice.

Thanks.

>
> When the instructions event overflows, its acr_mask=0x2 triggers an auto-reload
> of the cycles counter, resetting its progress toward overflow.
>
> Because it is continually reset by the instructions event before reaching
> 40000, the cycles counter never overflows.
>
> The test asserts that no records are generated for cycles and passes, but is
> this simply because the event never fired rather than due to self-reloaded PMI
> suppression working correctly?
>
> If the hardware PMI suppression for self-reloaded events was broken, wouldn't
> this test still pass?
>
> Additionally, if the test ran on a system with IPC < 0.5, wouldn't the cycles
> event overflow first, resetting both itself and instructions (acr_mask=0x3)?
> This would prevent instructions from generating a record, causing the test
> to fail.
>
