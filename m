Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B32D2556E
	for <sashiko@lists.linux.dev>; Wed,  6 May 2026 07:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778051442; cv=none; b=m0nXRl9Gas5WQmLvUfjbQW27NlKbTmV30tgOjR7P/Zo6xKGAMCUEfU1UnOI5uabGKNXdkwNdEzlBLPQeHI+hVQA9qrF0u4dGJN1nw8fA0tZRdboOTWzBuVh2wu3KmGrpTWjHZdVjntX3sfGtlobnZ4kDKIt4tFxMEhsp6CQ9uvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778051442; c=relaxed/simple;
	bh=zJ1c930LLX/p2bfo9foYE86jylDYv3jvcEbedLI34ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hIOmCMsnUZkTNwuB/tJ+0wL6O4Kahfh068o//t1P01mSZKTqbRhddf8unDX+a6sFTjumM7jSe7K4mqS7P21WTFYXzBUSKi31xwIf3yD8WZqZfrNBCqDXjt7S6XWC7qfYY9NVqok7Tx1iAniLUvP4sS6q5lkVhohbTrjnPi8fMKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=Zeh6TuGT; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="Zeh6TuGT"
Received: by dvalin.narfation.org (Postfix) id A278520074;
	Wed, 06 May 2026 07:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1778051437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mrGgeCmhs7hPTaVRheg0hnRjioyQlDb9m2wSdWYkJi0=;
	b=Zeh6TuGT1ttQFYbItBHEXZb73Fj/RocK3bLk8sUMb0jAZv0DTtRiQ31MA0Tf5tF27W4P7P
	muIuzb7yIf/xEnBK/Pclr1jBybR9IIbX1+hpSa8wMP8ygv1LazJNuhfvMWX64BiHVJDzJe
	5lZw1A5JPQudslyuf9zEN3l7OXMma6w=
From: Sven Eckelmann <sven@narfation.org>
To: sashiko@lists.linux.dev
Cc: sw@simonwunderlich.de
Subject:
 Re: [PATCH batadv-next] batman-adv: use neigh_node's orig_node only as id
Date: Wed, 06 May 2026 09:10:32 +0200
Message-ID: <11781550.T7Z3S40VBb@ripper>
In-Reply-To: <20260506035812.39119C2BCB8@smtp.kernel.org>
References:
 <20260504-neigh_node-no-orig_node-v1-1-33b282272711@narfation.org>
 <20260506035812.39119C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart13949906.nUPlyArG6x";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart13949906.nUPlyArG6x
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: sashiko@lists.linux.dev
Cc: sw@simonwunderlich.de
Date: Wed, 06 May 2026 09:10:32 +0200
Message-ID: <11781550.T7Z3S40VBb@ripper>
In-Reply-To: <20260506035812.39119C2BCB8@smtp.kernel.org>
MIME-Version: 1.0

On Wednesday, 6 May 2026 05:58:11 CEST sashiko-bot@kernel.org wrote:
> > The orig_node member of struct batadv_neigh_node is no longer used in
> > B.A.T.M.A.N. IV. But batadv_neigh_node_create() is still storing it.
> 
> Is this description accurate? Looking at B.A.T.M.A.N. IV, the orig_node field
> still appears to be referenced in net/batman-adv/bat_iv_ogm.c in functions
> like batadv_iv_ogm_neigh_new() and batadv_iv_ogm_calc_tq().

According to the patch description, following patch needs to be applied before 
adding this changes:

prerequisite-patch-id: 8d01950de12c8f4715e9f4723a0b6f1c349e6a84

You can find the patch at 
https://lore.kernel.org/batman/?q=patchid:8d01950de12c8f4715e9f4723a0b6f1c349e6a84

And in this patch ("batman-adv: stop caching unowned originator pointers in 
BAT IV") removes the B.A.T.M.A.N. IV part.

Regards,
	Sven
--nextPart13949906.nUPlyArG6x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCafrpaAAKCRBND3cr0xT1
ywuyAQCyzY/LQ2+G2QSiPMfbm+Ply+KfDKWpH1BdicnY4/eT0AD/RY8qcV2Ss6Q7
3povFY8DU0Srrr/QkiF0VzPSQSg9SQs=
=zlh1
-----END PGP SIGNATURE-----

--nextPart13949906.nUPlyArG6x--



