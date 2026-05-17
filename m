Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3848E2FBDFD;
	Sun, 17 May 2026 10:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779012363; cv=none; b=KhUyUczOMGhNMFZa24wWm52heaA/DGwFeUSwWMEMfCVxacz58utT6nxQtPgSvw7P8hi+/hVMsDNOkLSxqxd8Cr74zWYownyfCnRiHQOKPKC69cCN02l5F6npURQLrqEl5zdkZQYNeebLmxu+I6ihACad/38Anl5eJwlUfhHFWUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779012363; c=relaxed/simple;
	bh=5ZcF1iuhgpZRaRKi7D1apExht7Ot8MG/oztV7oYXe9o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mLE2oOJ+LhbpjKdns1henkkqmoSJukqAWqHnPiN5iggRql/gy771VW212Ut6p/HuQVcgJ9HwEZjQVqQ8EGTcYw9a670RyQqhuSpP3QplCxHEM5qXWejNzhimWEs4Gkrg6g2CqS1gQywA5ha8QgFLBnLa15OkV1CRfF+IR264CtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MDVg3qoJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MDVg3qoJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C681DC2BCB0;
	Sun, 17 May 2026 10:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779012362;
	bh=5ZcF1iuhgpZRaRKi7D1apExht7Ot8MG/oztV7oYXe9o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MDVg3qoJmQolGF3qv8e+DTjWdIoPIuOIWrNd1h6lz/O2/q2QD3Ndnhv7vJkwowq+/
	 KwDTIwGleJ4Y8xgCiGxwq+VSeqSHKgxxdqBXC3KSOc+qKCfQ8s+YMCXEJKT0pN74gI
	 ZqwJJzF4m2G0v7z0/DCYwIzI8x1KzEXCpPqfZ/I/EHzoSWR+XEw1m2y0g/k2rWOcyt
	 tc5NPxuEptZgYNGsKKtrzf52ykxVaYwmwhu1udihj2IAjvN1g0xL3M6r+WXjvcGAxL
	 atxCZ7VYsIRx7255P1PiReRzHSdlZ6YWyGEJ4DotKLTAbSg9TUD1FpuVF0OXNojurV
	 ACCQoRblK2SCg==
Date: Sun, 17 May 2026 12:05:56 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, debarbos@redhat.com, Arnaldo
 Carvalho de Melo <acme@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Konstantin Ryabitsev <mricon@kernel.org>, Guenter Roeck
 <linux@roeck-us.net>, sashiko-bot@kernel.org,
 sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev, Linux Kernel
 Workflows <workflows@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
 kfree@google.com
Subject: Re: Stop false review statements
Message-ID: <20260517120556.248852d8@foz.lan>
In-Reply-To: <07602616-412B-4ED8-95D7-588C0D077EE3@linux.dev>
References: <4f3d7f48-5766-425b-91f6-0acdb5554584@kernel.org>
	<07602616-412B-4ED8-95D7-588C0D077EE3@linux.dev>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 16 May 2026 14:59:44 -0700
Roman Gushchin <roman.gushchin@linux.dev> wrote:

> > On May 16, 2026, at 2:33=E2=80=AFPM, Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> >=20
> > I find it opposite: clogging commits with useless information, because
> > some arbitrary and completely closed-source tool did analysis means
> > nothing to me one year later when I look at the commit in the Git histo=
ry. =20
>=20
> This is simple not true: Sashiko is fully open-source, under Apache 2.0 l=
icense
> and the code belongs to LF.=20

> Yes, the instance behind sashiko.dev is using
> Gemini 3.1 Pro LLM, which is not open-source, but it=E2=80=99s not a fund=
amental limitation -=20
> Sashiko is supporting various LLMs, including open models - it=E2=80=99s =
just a practical
> choice: to my knowledge the quality of open models is not on par with fro=
ntier closed
> models=20

I would very much prefer using an open source LLM, even if not in pair=20
with latest paid models.

> and it would require a non-trivial amount of hardware and infrastructure =
to run
> an open model at the required scale.

IMHO the best would be to have them running on some infra that would accept
open source models (*). If there aren't enough resources to have our own
infra, there are offers out there which allows running open source models
like https://ollama.com/pricing (I never used myself).

(*) For instance, Qwen3.6 is brand new and licensed under apache-2.0.
    Not bad on my tests running it locally.

Thanks,
Mauro
