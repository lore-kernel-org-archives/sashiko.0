Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AEE33B6F6
	for <sashiko@lists.linux.dev>; Thu, 21 May 2026 15:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779378563; cv=none; b=GjvFahiseDAo+tjFJX/T0OC+9zFuDumtYYwgB0HTAobK2BCROo2ogt0Cp5Yg1Ho3m2LJcRDQBjkdHrsJ4qXB1nAGTos4ZFVo4cj0Om7M76p61CeGVN3wmatCpAvgbiLmphfcNZJDdr56qh6pEUdD9jtV73g9MXMmosviVKSBQXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779378563; c=relaxed/simple;
	bh=1T2EHw8MKAiVBvR6F9KQRwhtZCBtU5Qdkg/4mw1rb50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMmHRknJcJblxDuX3x/6qhPqUWvaxLkMKpp8m3lRZRa95/CvVMhOx9+xXUwc6Rn67WHYM1x25AGHqJibrK+qDQfAF/vNoUQu3Kixfhx8Dym7bZLa1uRZ5L+65cgh99Zcfc1Ywqn3fNYpWtJoOV4G0xIjan1uOQFnaFhOiqLUJiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=a/RCByoj; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="a/RCByoj"
Date: Thu, 21 May 2026 08:49:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779378560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nIhirawt7T+aceGoDlJbr55pbwU6Y1X0lRC4dykZP58=;
	b=a/RCByoj2d2ULlqs4eIINiLH8lWDfAD9+h/g8RGo1bRQ8IETQFEB7qvLWQjPVFnnyGYJUc
	E+IUjkS1vs4fUsTR66j/QAvmviV7D9IgF/doHF5RqT6AZzowidiCjDmxVoDIm1+pWrxzYC
	BX1AMNTPadycUNilniNQtNUAfeGO8MI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Martin KaFai Lau <martin.lau@linux.dev>
To: "Hudson, Nick" <nhudson@akamai.com>
Cc: "sashiko@lists.linux.dev" <sashiko@lists.linux.dev>, 
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>
Subject: Re: [PATCH v6 6/6] selftests/bpf: tc_tunnel - validate decap GSO and
 encapsulation state
Message-ID: <2026521154338.mbd8.martin.lau@linux.dev>
References: <20260504101759.3319427-7-nhudson@akamai.com>
 <20260505041431.CD280C2BCB4@smtp.kernel.org>
 <56083B7A-B13B-4133-8857-FAD8201F6D7C@akamai.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56083B7A-B13B-4133-8857-FAD8201F6D7C@akamai.com>
X-Migadu-Flow: FLOW_OUT

On Tue, May 19, 2026 at 10:52:12AM +0000, Hudson, Nick wrote:
> 
> 
> > On May 5, 2026, at 5:14 AM, sashiko-bot@kernel.org wrote:
> > 
> > !-------------------------------------------------------------------|
> >  This Message Is From an External Sender
> >  This message came from outside your organization.
> > |-------------------------------------------------------------------!
> > 
> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > - [High] Pointer arithmetic `kskb->head + kskb->end` causes build failures and runtime logic errors on 32-bit kernels.
> > - [Medium] Missing kernel feature causes test to fail instead of skip, breaking CI on older kernels.
> > --
> > 
> > commit f73fb4725baa7b601a1b82c32e5095c6b4294f5c
> > Author: Nick Hudson <nhudson@akamai.com>
> > 
> > selftests/bpf: tc_tunnel - validate decap GSO and encapsulation state
> > 
> > This commit enhances the tc_tunnel selftest to validate post-decap tunnel
> > state for both GSO and non-GSO packets, and checks IPXIP decap for IPIP/SIT
> > paths.
> > 
> >> diff --git a/tools/testing/selftests/bpf/progs/test_tc_tunnel.c b/tools/testing/selftests/bpf/progs/test_tc_tunnel.c
> >> index 7376df405a6b..853bca962910 100644
> >> --- a/tools/testing/selftests/bpf/progs/test_tc_tunnel.c
> >> +++ b/tools/testing/selftests/bpf/progs/test_tc_tunnel.c
> > [ ... ]
> >> @@ -621,6 +645,11 @@ static int decap_internal(struct __sk_buff *skb, int off, int len, char proto)
> >> break;
> >> case IPPROTO_GRE:
> >> olen += sizeof(struct gre_hdr);
> >> + if (!bpf_core_enum_value_exists(enum bpf_adj_room_flags,
> >> + BPF_F_ADJ_ROOM_DECAP_L4_GRE))
> >> + return TC_ACT_SHOT;
> > 
> > If the kernel is missing support for these new decapsulation flags, will
> > returning TC_ACT_SHOT cause the test harness to time out and fail the test?
> > 
> > Since selftests often run on older kernels, should missing features gracefully
> > skip the test instead of failing it to prevent false positives and CI
> > breakages on stable or LTS branches?
> 
> The current TC_ACT_SHOT fallback prevents silent passes, but it does cause affected subtests to fail on kernels without the new decap flags. We should move feature gating to prog_tests and skip unsupported subtests there, so older kernels report SKIP instead of FAIL while preserving strict checks when the feature exists.

imo, it is fine to stay as-is and fail early instead of skip.
The new test added to the -next is targeting the new feature
of the upstream kernel. The new test is not supposed to be backported
alone without backporting the kernel changes.
