Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4279C343D7F
	for <sashiko@lists.linux.dev>; Sat, 25 Jul 2026 01:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784944491; cv=none; b=lh0XwpHpn1OUtCBZyzeFsGunrGIE7THOzR3nvsgv6JVxiiTUzbNynA9yTKtnVxsQ7o//atIvY/lUwCULcbJEQFli2a0MPCVTaEa6kCoTF5GbfKN/YAWrq8/BL3f4HqEAvdpsBy0sczCd2JKeG2Jgl+3Tziaozp9GAhb2dr1wOI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784944491; c=relaxed/simple;
	bh=3i/Z+vby+nqvf57Z6mCUr0G7dyaJXEhGajZTs5+1d1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HV4sJgHfNwOgRSGtuBDvbkP1hM8iJucPHzttg1xFOMvafjXW+opmPXjFlZWUehhOVc4Acit3o7zQFoxWr+a9/zBHIHFZZuX5EB1RyCqXr3DldbM5q+wPFAGjyFfxFbr9TYcHJc3Pxd37C2cGTbNuG/zpAPVlLrtlw8tRFi7SvUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IbjV5p+4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IbjV5p+4"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 75D501F000E9;
	Sat, 25 Jul 2026 01:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784944488;
	bh=792wOtXlbQDay14PgjUiBZzRna4zN10W7CeB1TrnbQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IbjV5p+4j/UXU16lK8ZO5AWJwfWWkXEfAUwPSaURmBuFgUDZopQNSkw3+3wK9Q6xh
	 WwDC/2tzFTrpOp4lT1QL8taenRrf7kaeFppGzv/Aqw1XsC+AB+OvxcJ9cWFOEYizyL
	 za/JlD11IoDuVTpCF1gEhtphrfv49WxdI2ET0D0Kpo/du2cSMB4eiCP6XyKk8B8Q0g
	 dDSPnoKrwIANLtRRUA0TkCdbeqfJ/6Sw3BldoEug+3hkCktIAbCeySvY0M6ktNglif
	 rbIYu7vFXM+JNU4/gUUk3VBEJq4vDvEgzh7rhcsJXeybihIPAx4r0Z//1QxKk1zKKk
	 WC2wL8wfedETw==
Date: Sat, 25 Jul 2026 04:54:43 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Derek Barbosa <debarbos@redhat.com>
Cc: Mimi Zohar <zohar@linux.ibm.com>, sashiko@lists.linux.dev,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: linux-integrity@vger.kernel.org
Message-ID: <amQXY9PhaZGIQVow@kernel.org>
References: <a517e05580a5f2c0d1db874aa2e9e4fd41bdc564.camel@linux.ibm.com>
 <amNlJJELzzT8tPkG@debarbos-thinkpadt14gen5.rmtusma.csb>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amNlJJELzzT8tPkG@debarbos-thinkpadt14gen5.rmtusma.csb>

On Fri, Jul 24, 2026 at 09:16:53AM -0400, Derek Barbosa wrote:
> Hi,
> 
> On Fri, Jul 24, 2026 at 06:44:56AM -0400, Mimi Zohar wrote:
> > Hi Roman,
> > 
> > Please add the linux-integrity@vger.kernel.org mailing list.
> > 
> > Mimi
> > 
> 
> See [0] -- Roman is out, so it may be a while until it is enabled.
> 
> 
> Cheers,
> 
> [0] https://github.com/sashiko-dev/sashiko/pull/371
> 
> -- 
> Derek <debarbos@redhat.com>
> 

In the meanwhile, what does it mean in practice, when it is enabled?

Just catching up with the topic...

BR, Jarkko
