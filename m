Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC253E024F;
	Mon, 18 May 2026 08:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779091484; cv=none; b=igFJR71yWTIymQenTexRjQ/eN1JAJSuE6Unh8bbuUtPaVTPRAcDLNp4Q+gvQezqagyLDFveJkyq69ymJj8QHA6+sy/9Sj8QgVYOAOQ7zQsgcd9Nrk0+aoSMcxFnzWkKm8zehrCrEqu9/ZXhOunSpyPQO85R7yfP53j0Encl4xNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779091484; c=relaxed/simple;
	bh=Lu+aBJLncolAnZylqK1/zSO8q0BQP54nVceRdNyunvA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PlWgJezuLdebrq/EdJHwr5DlPS8UCBNz1i1BhdiVuGf0OHcIsSydkRs5yEI81mAULa3FC7jdXtZzHpMlydN674oDEcH50NgMAcruwzsms5YOdUcJ60CpwKrHLdOj5dTT52K5LMIn0+QrFgjhejFsvUAUzG/xnBjNWU8+DGRSmFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BPds9Veu; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BPds9Veu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779091482; x=1810627482;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=Lu+aBJLncolAnZylqK1/zSO8q0BQP54nVceRdNyunvA=;
  b=BPds9VeuBT0xbMCZ6faItdiSKSXN3Te8OLhLMYxM/OtkSzkVVaJIQozK
   zkG27p511LTnYvnlmhr4yr+tBxcUOIQ+zgdV34/D0Ru5g6K9eY9sDqoqx
   u7euL50OpTTSjfKXQ9d3/yePQdqlsnr7C/qS2CuOpVjW+Y73eDwMuNHrg
   +cXO8ym0Bh8RrFoHRh4ONgWa5BcmkWZlcwde3b4owE3oR2ziFuHQKKRyQ
   MK8CCZ4ve5eJ14d55QT0qdELXT6dFeiOisBRzLpP+ZaovkB/EObumhXt+
   LoJHP2+oi3vlYTjqbsczZuUPxWaoVjduDGNxN2tgRqX4VZzGeWSfw9vAv
   A==;
X-CSE-ConnectionGUID: edTCKUtNQgyXqQHoZCM/GQ==
X-CSE-MsgGUID: w8UuthnfSMuiLjrmBKa5jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="82503658"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="82503658"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 01:04:38 -0700
X-CSE-ConnectionGUID: 8pV11JjCRUCb7hXc2UrCpQ==
X-CSE-MsgGUID: 3UTOWr3/R02AlgEu8L57qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="234897689"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.1])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 01:04:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Krzysztof Kozlowski
 <krzk@kernel.org>
Cc: debarbos@redhat.com, Arnaldo Carvalho de Melo <acme@kernel.org>, Greg KH
 <gregkh@linuxfoundation.org>, Konstantin Ryabitsev <mricon@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, sashiko-bot@kernel.org,
 sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev, Linux Kernel
 Workflows <workflows@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
 kfree@google.com
Subject: Re: Stop false review statements
In-Reply-To: <07602616-412B-4ED8-95D7-588C0D077EE3@linux.dev>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <4f3d7f48-5766-425b-91f6-0acdb5554584@kernel.org>
 <07602616-412B-4ED8-95D7-588C0D077EE3@linux.dev>
Date: Mon, 18 May 2026 11:04:29 +0300
Message-ID: <2e20badf27b6910d619329841e37d2961556056f@intel.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, 16 May 2026, Roman Gushchin <roman.gushchin@linux.dev> wrote:
>> On May 16, 2026, at 2:33=E2=80=AFPM, Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>>=20
>> I find it opposite: clogging commits with useless information, because
>> some arbitrary and completely closed-source tool did analysis means
>> nothing to me one year later when I look at the commit in the Git histor=
y.
>
> This is simple not true: Sashiko is fully open-source, under Apache 2.0 l=
icense
> and the code belongs to LF. Yes, the instance behind sashiko.dev is using
> Gemini 3.1 Pro LLM, which is not open-source, but it=E2=80=99s not a fund=
amental limitation -=20
> Sashiko is supporting various LLMs, including open models - it=E2=80=99s =
just a practical
> choice: to my knowledge the quality of open models is not on par with fro=
ntier closed
> models and it would require a non-trivial amount of hardware and infrastr=
ucture to run
> an open model at the required scale.

In the context of the "Reviewed-by: Sashiko" discussion, this actually
makes it really hard to assess the quality of those reviews. It is
*currently* using a boatload of tokens with a specific LLM, and I find
it's often asking pretty good questions.

People build their reviewer track record and gain trust over time, but
the reviews from what is portrayed as "Sashiko" heavily depend on the
models and resources spent in the background. As a maintainer, it's far
easier (though still laborous) to deal with the negative feedback from
LLMs than the positive, because you won't really know how rigorous the
review was when the response is just "LGTM".


BR,
Jani.

--=20
Jani Nikula, Intel
