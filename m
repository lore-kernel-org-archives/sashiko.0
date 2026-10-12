Received: from mta1.migadu.com (out-241.mta1.migadu.com [95.215.58.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C5A32E73E
	for <sashiko@lists.linux.dev>; Mon, 12 Oct 2026 22:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791842446; cv=none; b=SweqmfD+Thg7yKmY75l+P6OFUx7qCkZrpkjB+EOcWBT1Ai+sIoeN1+8PuK8dX16UKGJJOYpJPCL35E81DVRDu1/U7Jaa5zL86DQRegfEdvwNd1RKVKNewdSPzoewPO2d+1H49ETKVMHW1XYQd8XQaHMv5QUqOzTat97I1D4Gew0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791842446; c=relaxed/simple;
	bh=mRTnvN0IvqF/6LV4ynXuP1ng8neznW15cTVeQRWrGFM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=rcXMCunPSSPEPOCTfE8KhkNwk8MmZdMzTNJFVGL+A94VVyx7WBiAzGmvyEoQic3Oha2uOL+fJBerXO3EZU/xnQaOYhcyRPWwYx3h7AzMMmj/rkgclIBN9Ub9kfoSq+IbkzTUVEUFUyxlRxZsiydAj1jL4haO4Cp0uUvC3WQ9ifs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gK7oNhcN; arc=none smtp.client-ip=95.215.58.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gK7oNhcN"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=mRTnvN0IvqF/6LV4ynXuP1ng8neznW15cTVeQRWrGFM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791842442; v=1; x=1792447242;
 b=gK7oNhcN7ztDhCCCaLnvNyLy8rAUA48D+YU06osm93yUbdxYkHXQCfG9y6KLukorx/P3ZLWl
 KmMuBUanPdfhir3S+hvWQUgAj30/VEXLvCKdQ3pf+7dr0SI14U3VJKX6AqElZEyIYaQbIXlAn4n
 8nNp9+nJQTSaGP0GhHjglwos=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta11.migadu.com with ESMTPS id 6750af14b285ce33;
	Mon, 12 Oct 2026 22:00:41 +0000
X-Mizu-Trace-ID: 6750af14b285ce33
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: Request for access to Sashiko bug
From: Roman Gushchin <roman.gushchin@linux.dev>
In-Reply-To: <CABA5Sf6zcXfobuYQ+8Tm+q9BeYj8R=H_O3_RTcBszPf7fQNoKg@mail.gmail.com>
Date: Mon, 12 Oct 2026 15:00:29 -0700
Cc: sashiko@lists.linux.dev
Message-Id: <DC27FBCB-2038-4D21-9123-BF1D6A7649FE@linux.dev>
References: <CABA5Sf6zcXfobuYQ+8Tm+q9BeYj8R=H_O3_RTcBszPf7fQNoKg@mail.gmail.com>
To: lorenzo ferrari <loreferro01@gmail.com>
X-Mailer: iPad Mail (23G90)

Hi Lorenzo,

what kind of access do you want? I=E2=80=99m afraid I=E2=80=99m not able to g=
ive an unrestricted access for all bugs,
but if you have a good track record in some subsystem, I can provide you acc=
ess to bugs in this subsystem.

Thanks

> On Oct 6, 2026, at 12:46=E2=80=AFAM, lorenzo ferrari <loreferro01@gmail.co=
m> wrote:
>=20
> =EF=BB=BFHi,
> I=E2=80=99m a Computer Science student with a strong interest in Linux ker=
nel
> security, vulnerability research, and exploitation.
> I was wondering whether it would be possible to get access to the
> Sashiko bugs page for research and learning purposes.
> I understand that access may be restricted, but I wanted to ask
> whether students or independent security researchers can be granted
> access.
> Best regards,
> Lorenzo Ferrari
>=20
