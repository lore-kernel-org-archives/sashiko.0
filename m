Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07161351C0B
	for <sashiko@lists.linux.dev>; Tue, 19 May 2026 09:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184488; cv=none; b=JyTW3yh2DmZ58B2eRRiFBTyrHX8utxxcwvUxYbAJmRfTrkuZ13SdFfe1soM7WludbTMEhUDUlSBNQ/CIRTABOp3NVaMaRzDJ3H4xmp8CqhMBmaICgHrkMoc4TVjaUDV7dsuBf3T1L2hHOwfaTB4CKpkjNOHuVS6ru5XVsT82EdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184488; c=relaxed/simple;
	bh=ENZWpn8rBzs9yzkMI1r3ORu8oRIJaZgD8C/7AADxctc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rQl7bacXv7NTQnWvDAxV0NVED1QNdPzHICrujfPH6AEO8hGOPzouX2IrWhDj0lrB7C5Me5DXnVezOfTQVO2sSmhWdhicpmrK73UPlr7IzDVH/Y+LkcaUaZIQ6GVkht2fLf77rXRcXcPFBnCGa+txSWj9d3vBreKZ5McUOt+pIwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RH8LKPcy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RH8LKPcy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC02C2BCB3;
	Tue, 19 May 2026 09:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779184487;
	bh=ENZWpn8rBzs9yzkMI1r3ORu8oRIJaZgD8C/7AADxctc=;
	h=Date:From:To:Subject:From;
	b=RH8LKPcyBrl+KJLZdchiXLH2qzvMoiFIBFMdjgq67wRyWs/nhMyffV4L3veU6jpVd
	 8kWKrB8NqatX4Ncunxcxdef1DqQP+UPF0gdhCHdptnZ2vdPiXBCgI2/nm4SLHhJTT6
	 uzykecCdmiaA+dq0Goix6PV1BlKiOeQCifZqdBGflvzp59q7vMaDGo9mg4x3LWRF31
	 MlPhVdqoZN42Aa3z3fyEY48ZnY/Yu1PHf5ozT1QDBcUJ/ftaBUulqriZw1Wk/VoRIA
	 MkFIUOJN9d6UzWm4LBM2LLiNKbrQBwBCycgSiyvuYa36gqk40hIO6ScWkaCfw3rCYA
	 Hct3Di7oIr1mQ==
Date: Tue, 19 May 2026 10:54:44 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko@lists.linux.dev, Roman Gushchin <roman.gushchin@linux.dev>
Subject: Incorrect/lacking References in mail headers?
Message-ID: <20260519-google-salary-aab923033a86@spud>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sAFs8W7Ws+5pjmo8"
Content-Disposition: inline


--sAFs8W7Ws+5pjmo8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable



Yo,

I think the mails coming from sashiko-bot don't have the correct
References headers set. When I have deleted a thread that I don't care
about before the sashiko-bot mails come through I end up with my inbox
looking like:
|  99 N   May 19 sashiko-bot@ker (6.1K) Re: [PATCH v6 14/16] wifi: ath12k: =
Switch to generic PAS TZ APIs
| 100 ND  May 19 sashiko-bot@ker (7.0K) Re: [PATCH v6 12/16] media: qcom: P=
ass proper PAS ID to set_remote_state API
| 101 N   May 19 sashiko-bot@ker (7.2K) Re: [PATCH v6 11/16] media: qcom: S=
witch to generic PAS TZ APIs
| 102 N   May 19 sashiko-bot@ker (6.8K) Re: [PATCH v6 10/16] drm/msm: Switc=
h to generic PAS TZ APIs
| 103 ND  May 19 sashiko-bot@ker (8.8K) Re: [PATCH v6 05/16] remoteproc: qc=
om_q6v5_pas: Switch over to generic PAS TZ APIs
| 104 N   May 19 sashiko-bot@ker (8.9K) Re: [PATCH v6 04/16] firmware: qcom=
: Add a PAS TEE service
| 105 ND  May 19 sashiko-bot@ker (8.3K) Re: [PATCH v6 07/16] soc: qcom: mdt=
loader: Switch to generic PAS TZ APIs
| 106 N   May 19 sashiko-bot@ker (7.0K) Re: [PATCH v6 06/16] remoteproc: qc=
om_q6v5_mss: Switch to generic PAS TZ APIs
| 107 ND  May 19 sashiko-bot@ker (5.8K) Re: [PATCH v6 08/16] remoteproc: qc=
om_wcnss: Switch to generic PAS TZ APIs
| 108 N   May 19 sashiko-bot@ker (7.3K) Re: [PATCH v6 02/16] firmware: qcom=
: Add a generic PAS service
| 109 ND  May 19 sashiko-bot@ker (6.2K) Re: [PATCH v6 03/16] firmware: qcom=
_scm: Migrate to generic PAS service
| 110 N   May 19 sashiko-bot@ker (6.7K) Re: [PATCH v6 01/16] arm64: dts: qc=
om: kodiak: Add EL2 overlay

In comparison, a more typical thread where I have deleted the original
mails looks like:
| 165 N   May 19 Janani Sunil    (8.3K)   =E2=94=8C=E2=94=80>Re: [PATCH v2 =
2/3] iio: dac: Add AD5529R DAC driver support
| 166 N   May 19 Janani Sunil    ( 12K) =E2=94=8C=E2=94=80=E2=94=B4=E2=94=
=80>Re: [PATCH v2 2/3] iio: dac: Add AD5529R DAC driver support
| 167 N   May 19 Janani Sunil    (9.3K) =E2=94=82 =E2=94=8C=E2=94=80>Re: [P=
ATCH v2 1/3] dt-bindings: iio: dac: Add AD5529R
| 168 N   May 19 Janani Sunil    (9.5K) =E2=94=82 =E2=94=9C=E2=94=80>Re: [P=
ATCH v2 1/3] dt-bindings: iio: dac: Add AD5529R
| 169 N   May 19 Janani Sunil    ( 10K) =E2=94=9C=E2=94=80=E2=94=B4=E2=94=
=80>Re: [PATCH v2 1/3] dt-bindings: iio: dac: Add AD5529R
| 170 N   May 19 Janani Sunil    (8.1K) =E2=94=B4=E2=94=80>Re: [PATCH v2 3/=
3] Documentation: iio: Add AD5529R Documentation

The difference appears to be that Janani has a references header that
cites the cover letter:
In-Reply-To: <53d547ee-1ac3-42b9-92a6-e7f48b72fee3@baylibre.com>
References: <20260508-ad5529r-driver-v2-0-e315441685d7@analog.com>
 <20260508-ad5529r-driver-v2-1-e315441685d7@analog.com>
 <20260508134843.7646c4f5@jic23-huawei>
 <53d547ee-1ac3-42b9-92a6-e7f48b72fee3@baylibre.com>

Whereas your bot doesn't do this:
In-Reply-To: <20260518072856.22790-2-sumit.garg@kernel.org>
References: <20260518072856.22790-2-sumit.garg@kernel.org>

Not only does it interfere with threading in my mailbox, it adds a load
of extra steps to my process where one ctrl+d should suffice, given that
I appear to get 100s of mails from the bot every day.

Could you please try to resolve this?

Thanks,
Conor.

--sAFs8W7Ws+5pjmo8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagwzZAAKCRB4tDGHoIJi
0gLaAQCCslK6utIRSMlyy1t/ydFmGlzTU0AGCIc8i5sZ7Cr4uQEAowJkQ/wzWUKs
i0PefmG29uf00buAbYu6Gqz2NtiIrws=
=B4xv
-----END PGP SIGNATURE-----

--sAFs8W7Ws+5pjmo8--
