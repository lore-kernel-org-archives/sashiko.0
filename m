Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7852464AA4
	for <sashiko@lists.linux.dev>; Tue, 19 May 2026 22:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779230338; cv=none; b=La4wu8WN0NP1TfSYJOg78Y5QXi6IrsUp27EUO8hNKdHP0BnRs0IqWKp8SWQVf289IyFsEprPigM1VDe4sGIk7AF1w/pPr8ePAIKLeTw8N7J+xy0whKpWsBVlaxudeiOCoGmqs+ZPxQlnxprf81aTU4yhJDJs3xIPw1kc/F338Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779230338; c=relaxed/simple;
	bh=s5O808tf1er6ZgFQjzjAYL40Gz7RFAi/iQg/uByRstE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Vk89KDM6v5Xrn6reyNXxIQ2Y39F+GvQ5eELDekT5yRNiSJfnhjh0yNGmleIq6J8UqpGsEnQoamuF8GgQx7prFOOnsXYN4bszkHwv12kCo8ikSj+V8fW2+hpfHsRhUjDxtLPPfq2w8iu0Gj3v/VamnvWDTgEX27LSybGYwVXbPy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iHEtxQzp; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iHEtxQzp"
Content-Type: text/plain; charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779230334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RQMUE7eR29QOwcMIZqr3qggFjxQI1Rt1VO5CQLIDI0U=;
	b=iHEtxQzp5PHMosmOD503rfjgo8F7TnGE8FzI9cd3SVguNVtKIePI1uO765SM7rjw94a9Lc
	Q0KB1utiZ9A3P3eTVDI3xuffloQO6HnJcph5cwUVA0otdLR8qkkzfqe150qhfT1td1GJ+k
	JzaCvz16CNEpzVE5ju1cpt98UuwrNP4=
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: Incorrect/lacking References in mail headers?
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Roman Gushchin <roman.gushchin@linux.dev>
In-Reply-To: <20260519-google-salary-aab923033a86@spud>
Date: Tue, 19 May 2026 15:38:40 -0700
Cc: sashiko@lists.linux.dev
Message-Id: <6817BB75-80D4-406A-84DC-8DEA9A9DEEBB@linux.dev>
References: <20260519-google-salary-aab923033a86@spud>
To: Conor Dooley <conor@kernel.org>
X-Migadu-Flow: FLOW_OUT

Hi Conor,

I=E2=80=99ll take a look, thank you for the report!

Roman

> On May 19, 2026, at 2:54=E2=80=AFAM, Conor Dooley <conor@kernel.org> wrote=
:
>=20
> =EF=BB=BF
>=20
> Yo,
>=20
> I think the mails coming from sashiko-bot don't have the correct
> References headers set. When I have deleted a thread that I don't care
> about before the sashiko-bot mails come through I end up with my inbox
> looking like:
> |  99 N   May 19 sashiko-bot@ker (6.1K) Re: [PATCH v6 14/16] wifi: ath12k:=
 Switch to generic PAS TZ APIs
> | 100 ND  May 19 sashiko-bot@ker (7.0K) Re: [PATCH v6 12/16] media: qcom: P=
ass proper PAS ID to set_remote_state API
> | 101 N   May 19 sashiko-bot@ker (7.2K) Re: [PATCH v6 11/16] media: qcom: S=
witch to generic PAS TZ APIs
> | 102 N   May 19 sashiko-bot@ker (6.8K) Re: [PATCH v6 10/16] drm/msm: Swit=
ch to generic PAS TZ APIs
> | 103 ND  May 19 sashiko-bot@ker (8.8K) Re: [PATCH v6 05/16] remoteproc: q=
com_q6v5_pas: Switch over to generic PAS TZ APIs
> | 104 N   May 19 sashiko-bot@ker (8.9K) Re: [PATCH v6 04/16] firmware: qco=
m: Add a PAS TEE service
> | 105 ND  May 19 sashiko-bot@ker (8.3K) Re: [PATCH v6 07/16] soc: qcom: md=
tloader: Switch to generic PAS TZ APIs
> | 106 N   May 19 sashiko-bot@ker (7.0K) Re: [PATCH v6 06/16] remoteproc: q=
com_q6v5_mss: Switch to generic PAS TZ APIs
> | 107 ND  May 19 sashiko-bot@ker (5.8K) Re: [PATCH v6 08/16] remoteproc: q=
com_wcnss: Switch to generic PAS TZ APIs
> | 108 N   May 19 sashiko-bot@ker (7.3K) Re: [PATCH v6 02/16] firmware: qco=
m: Add a generic PAS service
> | 109 ND  May 19 sashiko-bot@ker (6.2K) Re: [PATCH v6 03/16] firmware: qco=
m_scm: Migrate to generic PAS service
> | 110 N   May 19 sashiko-bot@ker (6.7K) Re: [PATCH v6 01/16] arm64: dts: q=
com: kodiak: Add EL2 overlay
>=20
> In comparison, a more typical thread where I have deleted the original
> mails looks like:
> | 165 N   May 19 Janani Sunil    (8.3K)   =E2=94=8C=E2=94=80>Re: [PATCH v2=
 2/3] iio: dac: Add AD5529R DAC driver support
> | 166 N   May 19 Janani Sunil    ( 12K) =E2=94=8C=E2=94=80=E2=94=B4=E2=94=80=
>Re: [PATCH v2 2/3] iio: dac: Add AD5529R DAC driver support
> | 167 N   May 19 Janani Sunil    (9.3K) =E2=94=82 =E2=94=8C=E2=94=80>Re: [=
PATCH v2 1/3] dt-bindings: iio: dac: Add AD5529R
> | 168 N   May 19 Janani Sunil    (9.5K) =E2=94=82 =E2=94=9C=E2=94=80>Re: [=
PATCH v2 1/3] dt-bindings: iio: dac: Add AD5529R
> | 169 N   May 19 Janani Sunil    ( 10K) =E2=94=9C=E2=94=80=E2=94=B4=E2=94=80=
>Re: [PATCH v2 1/3] dt-bindings: iio: dac: Add AD5529R
> | 170 N   May 19 Janani Sunil    (8.1K) =E2=94=B4=E2=94=80>Re: [PATCH v2 3=
/3] Documentation: iio: Add AD5529R Documentation
>=20
> The difference appears to be that Janani has a references header that
> cites the cover letter:
> In-Reply-To: <53d547ee-1ac3-42b9-92a6-e7f48b72fee3@baylibre.com>
> References: <20260508-ad5529r-driver-v2-0-e315441685d7@analog.com>
> <20260508-ad5529r-driver-v2-1-e315441685d7@analog.com>
> <20260508134843.7646c4f5@jic23-huawei>
> <53d547ee-1ac3-42b9-92a6-e7f48b72fee3@baylibre.com>
>=20
> Whereas your bot doesn't do this:
> In-Reply-To: <20260518072856.22790-2-sumit.garg@kernel.org>
> References: <20260518072856.22790-2-sumit.garg@kernel.org>
>=20
> Not only does it interfere with threading in my mailbox, it adds a load
> of extra steps to my process where one ctrl+d should suffice, given that
> I appear to get 100s of mails from the bot every day.
>=20
> Could you please try to resolve this?
>=20
> Thanks,
> Conor.
> <signature.asc>
