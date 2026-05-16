Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F3035FF58;
	Sat, 16 May 2026 22:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778970742; cv=none; b=BK0MSIpVbLQwTNB84t5Nwb1yqK2xM8eVkn3hNI48zJPqbpcSgzeFScigYh9SHP52JVWxRZ1yrNcgzOB7OjP7egwet9qISul9hfI1DwFgUy0y9NNZXRQXiSAg4oVoTD31FXI2QcfUKmWaOOjIc9gdYwqqWsVke2UDhcoujAyIfWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778970742; c=relaxed/simple;
	bh=p8KBhYgvoGa7kcJxmErewC6qFW13N4QtBV+lzLokGMA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LKqlwgNRHMedtMpOGFaoR1UXbrFpS8m+bIDjTV1aRVieA/WmmJ84TiSXOupuLneDsuP9atMEXlBpkCYytzJn07oIovcd+yPHRGzsb5gk8BMQEj/MlMGo5Wa2LzyYNr26zl6sxNiblvipUqIcOPkXPWZAvO87V40tWIDISuCBh2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OS+CEalH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OS+CEalH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 568A7C19425;
	Sat, 16 May 2026 22:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778970741;
	bh=p8KBhYgvoGa7kcJxmErewC6qFW13N4QtBV+lzLokGMA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OS+CEalHMChNgVfOj7EKTRJeoXYxJtzFIbDCSjFkd3w0T+E7Ju4ukVM49QlJ4Nzzk
	 CVD2pexrWsWKVMnY+yXvEe4hz0VPTqVzkYs06NouhfItKPBKzSvMhd5FdewWraLMdn
	 mCaEqqKZe2W9VwW1cCsKUNgTaYN2S1z+Pfu5W9vBN7rsbaXsy6PmoG3bIgf2WK2nPn
	 w24h/TxGzN0GUYkWzx+Cu611+ahwD337jRk/II2gnFVhrOtCErShbYa9g0F2ETGW3g
	 HFivempqUXKFKxYlfjtJUFnvTNhusgSEqti0iw7R/W/sdR+w2fe3RBVfGFh4+tr5G2
	 SgdLUMVwsCcLQ==
Date: Sun, 17 May 2026 00:32:16 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Konstantin Ryabitsev
 <mricon@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Krzysztof
 Kozlowski <krzk@kernel.org>, sashiko-bot@kernel.org,
 sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev, Linux Kernel
 Workflows <workflows@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
 kfree@google.com
Subject: Re: Stop false review statements
Message-ID: <20260517003216.0c6a3b62@foz.lan>
In-Reply-To: <2026051631-trolling-juggling-da1c@gregkh>
References: <20260516-upbeat-tody-of-feminism-4ab00a@lemur>
	<D659E814-069C-439A-B816-1BC383F38E1F@linux.dev>
	<2026051631-trolling-juggling-da1c@gregkh>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 16 May 2026 17:45:51 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

> > I=E2=80=99m not attached to any specific form of it, I thought Reviewed=
-by is the most obvious form.=20
> > And we use Reported-by: tags with various tooling for years. =20
>=20
> Reported-by: shows the existance of a problem that some tool found, a
> subtle difference here.

I'd say that, if an issue was found after a patch is merged,
I don't see why to distinguish. I mean:

if tool or a bot XYZ found a real issue, and a patch fixes it,=20
reported-by applies - being a LLM tool/bot or not.

Now, if someone sends a patch series v1, get a bot report and send a
v2  of the same patch series due to some CI/bot/LLM/... feedback, IMO=20
the right approach is to mention it on patch 0, just like we do with
any other feedback. Eventually, if such feedback is more relevant, it
can be also be mentioned inside patch description(s).

That's said, I would be fine with either a free text mention or with
some tag.

If one wants/needs to justify if/why some tool is relevant for kernel
development, a simple grep would be enough:

	$ git log|grep -i coverity|wc -l
	4267
	$ git log|grep -i smatch|wc -l
	13140
	$ git log|grep -i sashiko |wc -l
	138

IMO, there's no need for an special tag.

Thanks,
Mauro
