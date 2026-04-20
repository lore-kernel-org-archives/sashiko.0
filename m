Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9985F158535
	for <sashiko@lists.linux.dev>; Mon, 20 Apr 2026 06:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776666943; cv=none; b=YxUEs67CGp6AeGdECx7wTXQgQ9mThYWgPKISoiKhXkUfxo1hONGf/pTi8BUX16FWt5dinHVEyoI7ENpMLTROSSu6uq/EbetQmTK3HHRifAdNXdGXDr0j50JHmOUT4ITneUsutkq252sekkPbzuJXWukDDjcfZR3VlttkDgt8QrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776666943; c=relaxed/simple;
	bh=IEjHf6kgvr5rO5bK2Nqufdu1Jd/LWFNYRQ9YF/t8SVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ngIWVS0ahIxvrjniceM63qLsZ5KuP82Xl8hBsv1f0gHbfn/AvhIMMBjU+/0LnHddXz2Bc2LOyI1ZkZYHfOtyOWurakL5oq1J9z3ShVFynSxK7loYMNciZBYz+krDYIJaGCOpAABRNXogNfcnPguCdkoTm+VXJ1SeErIU/XAybyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WRC411p7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WRC411p7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776666942; x=1808202942;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IEjHf6kgvr5rO5bK2Nqufdu1Jd/LWFNYRQ9YF/t8SVY=;
  b=WRC411p74ukSGZkLQxw8NS28+q75DTKNzfhuM2mRJigNKNw65B/THDrk
   j84vCmHevJaOLkRzd4FnkFjM4KCFt4tx8wyJvbcDb8qqx3GmT3dQ7+mkL
   hsemsizepwIfMELw2F4LQtQutQBdPwGl5bmmkyDMsQXXdHIaixGqdsEzB
   ba2AQunrplVeAXQcPQDdK987YehleiJY0iDyDRaQ5rAFiSxhZ3+XVOqPB
   V7PWQhqeyMAFtL2gBGfYBUiA1JoNXWEOJZpbq+yxRvLNrdGicDBpzJJlO
   nMGT8zf1+gk2gFPTFIU/N6lgfXoI+Wk/HSq0vLs8HM+sALkdZibEvpBa8
   w==;
X-CSE-ConnectionGUID: 2Lzr1L8SSoibr0+uCTcg8g==
X-CSE-MsgGUID: 2yODD8wWQRCZ9xjiIn5/YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="87876745"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="87876745"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2026 23:35:42 -0700
X-CSE-ConnectionGUID: p/d5Wr0jTIWNQGnjAYungA==
X-CSE-MsgGUID: QLsLrC9pQgCSeXcC2Dy3qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="236618103"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.241.147]) ([10.124.241.147])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2026 23:35:39 -0700
Message-ID: <339de842-c00c-4b99-8a1b-1473c644d29e@linux.intel.com>
Date: Mon, 20 Apr 2026 14:35:36 +0800
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v2] perf tests: Add auto counter reload (ACR) sampling
 test
To: sashiko@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
References: <20260420025501.2133495-1-dapeng1.mi@linux.intel.com>
 <20260420031020.CFDE8C2BCAF@smtp.kernel.org>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20260420031020.CFDE8C2BCAF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 4/20/2026 11:10 AM, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 1 potential issue(s):
> - [Medium] Early return in the PEBS support check unintentionally skips subsequent ratio-to-prev tests and the final success message.
> --
>
> commit 4863d01ec678cdb7aeb26a69a3ff812dd0a8e16c
> Author: Dapeng Mi <dapeng1.mi@linux.intel.com>
>
> perf tests: Add auto counter reload (ACR) sampling test
>
> This commit adds an auto counter reload sampling test to verify that the
> intended event records can be captured and that self-reloaded events
> won't generate any records.
>
>> diff --git a/tools/perf/tests/shell/record.sh b/tools/perf/tests/shell/record.sh
>> index 7cb81cf3444a7..a05b0c8b6d6b6 100755
>> --- a/tools/perf/tests/shell/record.sh
>> +++ b/tools/perf/tests/shell/record.sh
>> @@ -402,6 +402,94 @@ test_callgraph() {
> [ ... ]
>
>> +  if ! perf record -o "${perfdata}" -e "${pebs_events}" ${testprog} 2> /dev/null
>> +  then
>> +    echo "Auto counter reload PEBS sampling [Skipped not supported]"
>> +    return
>> +  fi
> If PEBS is not supported, this early return exits the entire function. Does
> this unintentionally skip the subsequent ratio-to-prev tests and prevent the
> script from printing the final "Auto counter reload sampling [Success]"
> message?
>
> The ratio-to-prev tests use the u modifier rather than the p modifier, so it
> appears they should be allowed to run even if PEBS is not supported.

Hmm, maybe It's a better choice to integrate the ratio_prev_test sampling
test into the test_ratio_to_prev case. Thanks.


>
>> +  if ! perf script -i "${perfdata}" -F event | grep -q "instructions"
>> +  then
>> +    echo "Auto counter reload PEBS sampling [Failed missing instructions event]"
>> +    err=1
>> +    return
>> +  fi
