Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FA803CC9EB
	for <sashiko@lists.linux.dev>; Fri, 10 Apr 2026 14:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775830148; cv=none; b=eq8RYkXM85s1s9VgZZS57SQx0B0LvUW4hZPO9XaybIc1xSr3JA9o7aEAKTSiGqDSZwkVlVmpcTtdulPuixNyXOM/dO1ll/eoKhn44wUYsY9/hMsllAVk60ijFwGQwvs8C/2gPdzKTDyfIJayDMn3pe3NpIAm8o68afP6YxF9j5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775830148; c=relaxed/simple;
	bh=PWUdipTXwKBx8jeLCzhNEDbIPUVGdnPKwgmKrR2E4GU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JlQC4G99JkhbbvwH8Ul3UH9eiJ67Xn5/Q75Ul57BIkiJFvY+vyt4IhSDIt8V/YlZkXT3QY4Hmcf2/0JYzk0jAgJec2yfpYJg1vNG4FejwpR6MotlB7K1SrgXrNtrS2n/P47lY2ogbaur3LjiFd8slvqrEO6WI79zyaB6KhlcFpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ciOjqjVF; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ciOjqjVF"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FD35464B;
	Fri, 10 Apr 2026 07:08:59 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E8BCE3FE53;
	Fri, 10 Apr 2026 07:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775830145; bh=PWUdipTXwKBx8jeLCzhNEDbIPUVGdnPKwgmKrR2E4GU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ciOjqjVF6hSH8S9JYpWGU56/9N9tfz69e3PbKPnUfh+YI19NMWDCO35wnVvyhM3Pe
	 NYdCmMdPPiIpaGN3Xe0PslJRhV7TdqR462OaKYN0MJ9sXKM+q5nnP2EJCeY2t5A1uB
	 Pv2rFxmGVglct78r/wXMUTghuGb4lbaZr3mdwgI8=
Date: Fri, 10 Apr 2026 15:09:02 +0100
From: Leo Yan <leo.yan@arm.com>
To: sashiko@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v2] perf pmu: Skip test on Arm64 when #slots is zero
Message-ID: <20260410140902.GZ356832@e132581.arm.com>
References: <20260410-perf_fix_pmu_metrics_test-v2-1-61826ab3ca8b@arm.com>
 <20260410112824.839EBC19421@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410112824.839EBC19421@smtp.kernel.org>

On Fri, Apr 10, 2026 at 11:28:23AM +0000, sashiko-bot@kernel.org wrote:

[...]

> > +static bool is_expected_broken_metric(const struct pmu_metric *pm)
> > +{
> > +	if (!strcmp(pm->metric_name, "M1") || !strcmp(pm->metric_name, "M2") ||
> > +	    !strcmp(pm->metric_name, "M3"))
> > +		return true;
> > +
> > +#if defined(__aarch64__)
> > +	/*
> > +	 * Arm64 platforms may return "#slots == 0", which is treated as a
> > +	 * syntax error by the parser. Don't test these metrics when running
> > +	 * on such platforms.
> > +	 */
> > +	if (strstr(pm->metric_expr, "#slots") &&
> > +	    !tool_pmu__cpu_slots_per_cycle())
> 
> Does reading host capabilities via tool_pmu__cpu_slots_per_cycle() bypass
> the fake PMU abstraction used by these tests?
> 
> The fake PMU tests are intended to validate the metric parser across all
> architectures without requiring the actual referenced PMUs or hardware
> capabilities to exist on the host machine.
> 
> Because tool_pmu__cpu_slots_per_cycle() checks the host's
> /sys/bus/event_source/devices/ caps/slots, does this break the test's
> hardware-independent validation?

I agreed that the test is designed for hardware-independent, however,
the low level's parser has already invoked
tool_pmu__cpu_slots_per_cycle() for event parsing, even with the fake
PMU.

[...]

> > @@ -852,8 +873,7 @@ static int test__parsing_callback(const struct pmu_metric *pm,
> >  
> >  	err = metricgroup__parse_groups_test(evlist, table, pm->metric_name);
> >  	if (err) {
> > -		if (!strcmp(pm->metric_name, "M1") || !strcmp(pm->metric_name, "M2") ||
> > -		    !strcmp(pm->metric_name, "M3")) {
> > +		if (is_expected_broken_metric(pm)) {
> >  			(*failures)--;
> >  			pr_debug("Expected broken metric %s skipping\n", pm->metric_name);
> >  			err = 0;
> 
> Does unconditionally clearing the error here create a testing blind spot
> for genuine syntax errors?
> 
> If a metric expression contains "#slots" on an Arm64 host without slot
> support, the failure is ignored entirely. Could this silently hide other
> issues, like typos in other events or malformed operators within the same
> metric expression?

The test will run on PMUs that support #slots, so any malformed metric
expressions can be detected.  Simply say, if a metric is applicable to
a platform, it will be verified on that platform.

I don't think I need any update on this patch.
