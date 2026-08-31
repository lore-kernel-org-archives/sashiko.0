Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF5A42E43A
	for <sashiko@lists.linux.dev>; Mon, 31 Aug 2026 13:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183030; cv=none; b=WaFaHgWvZTzj29cEaAHuGHXmpJbiO+RT87wHoT9EhpEGqJdhlUunsnZOAb0hliz5xRCxHH+eLYuXDcMoCExYKVWiICHXWd8bxfABCqQxMLMvc77M9GkYlIhtkGChczH6oLbxZVJ5TR0DnzW+dK79YcrbMvgX4+/FWO26lMctaCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183030; c=relaxed/simple;
	bh=Pvo/l2mddm7+j3Ns3zLJfKZUVhRXPbUA4tiZWAGXJh8=;
	h=MIME-Version:Date:From:To:Message-Id:Subject:Content-Type; b=Fas0IOYwpGxpolAdqpPmGBvM0gr0ri/rZfpIL0uQLTaXTKYd90HpkI7z30sz1q2M/OkmKJ32/vv3M+t+HqUIaTWWL8v6WKGO4t7ujvT5UFjbUYuACNYXDYQHN9w1KQtR3xOLG3u4dIb9QAqQZUXLnnZOePGiktAqb3scaZAwNxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=atKN65ls; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="atKN65ls"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90AA21F000E9
	for <sashiko@lists.linux.dev>; Mon, 31 Aug 2026 13:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788183028;
	bh=yuBkgkMQt7syCZo+xoMgOkkZRdb+BYOxkOL9MCsNF4Q=;
	h=Date:From:To:Subject;
	b=atKN65lsm7qZJUnGkf2XyRZbQ0lM5b651ieJ23Oamn+t6d1ku1R2Sk33yt9+R8cEn
	 azuSbz4YVyQ8kA/JRU7NjXlVsCTyll2a2aP6kKRXWENVIk8Ip/6Xoz9nraQVWY+wmh
	 fJ5SScnyxCq8xzaNsUpZnniRZeOwM0Ov+lSx7OXzT4A8evgbYy/29XaAyBt9b+euQd
	 3yXFXYzX/SzOnOAVzyCnHgCgGEdUxLbYqcvUOGlFEbTjKiQbpYcZRBD/wqm3Dz0NDo
	 ZnD9DqTAVvrXtwoMnG/M03hadHxFcy/lJOdOhFBBZDk0DpnEMl1TAPBGA2GmhJrqgD
	 nZPvwHE83VEWg==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8811BF40067
	for <sashiko@lists.linux.dev>; Mon, 31 Aug 2026 09:30:27 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Mon, 31 Aug 2026 09:30:27 -0400
X-ME-Sender: <xms:84GVajxGAO4-fOcgj-MqYQIlg2rrYmLl6W-7QId2Tp7fHs7Yl2XmNw>
    <xme:84GVamGjFjhXbf6ZxuferFOdGEjHst0iO3mK5iI2jEAlSJjDyx31eiRp7O-MHAFJ9
    wo7b-z9VINDXMgFDLRCyFODXdNdUXtyQy3KBkFT_HnsvRKXanQK5zE>
X-ME-Proxy-Cause: dmFkZTGviLmyfaaNXMvFkzfYtmOJNOQvTnDE20aXr9NlgPSfWSKqoJvjLR1zEfnDMl5Mr+
    NsCMiPim3uM3nmg8qovjCe1Rx+dN354c8Lr/ii2PklLMMqS+4Wop2qA43+qLx864Q9khKO
    qM1uwPRqNc5SWWY+3zcOilV79jgzM54Y4llR0TL98p1z4IOCShG2D+H+9HkizYjEQfYMl5
    jBhXmJ5omQisEgHoAFv+bpLUb4cIwDNGL+ysXmnKRUpJd7BDCGKkb3BYpZ8HK7ObcbifgJ
    +HfVeq7/NjATCD2+HutaI6RNFfjuF8+rCYbAp+gqlMHlT5Rw5gCkYGNPKwVO0kTFgxDmE8
    vE4fdrecGVciVvHNkdn2gBhy9VHTXuISYsC9w19CMxHazHYSjqsEp9ZEmhQqAOSTl2iual
    G+XI+EZIj1NAQcY2Kz5fa+eBbnuQEmYZkSgFLP9ftBEXnFZs+xffR+UX97ltltHaCwCg7V
    D1fc6yjMW52zPGbXXsKXa2xdbX2STgwMD2A9+t+onGmdxsDvhXxy8eoDFwPE7lMS3bEa/K
    YdXFi1ZW3nS8v7nx61Te2Qv4Nb+NLJ0ba9ltiSkbxFEEPCGS61RauL3EFhv+HOpYNF9krK
    greF9Kli0mds0DgcElB5FIq1dKt43wN01GCb17xVF5blX0Wscvv+tYC8pxSw
X-ME-Proxy: <xmx:84GVavD-DLCUe46LGG-SLwo1VeuDIaxmfnwlr-mbDDOUjAm1b8RxVg>
    <xmx:84GValetSTB-1zVnAzESa2WnfSpcole7AU1Z2seF-FKKCgJPZqT1Iw>
    <xmx:84GVanftc6BrUmdhGdxsdbvty3Vj55pWrsF6iuGtySpK5ftouUDUCw>
    <xmx:84GVapjyE1aA_P1OUwKTOJAv95T-OhbOnploCL6ktaImMGFicuKJvQ>
    <xmx:84GVajTkkRUxjDcSul7De3WuNM5YBPqjBwd8fmB5K0JNsYZ5ELHxEzYa>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 66DD77811F3; Mon, 31 Aug 2026 09:30:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 31 Aug 2026 09:30:10 -0400
From: "Chuck Lever" <cel@kernel.org>
To: sashiko@lists.linux.dev
Message-Id: <e0a5f515-0292-443a-a0a9-1b505ed6e36b@app.fastmail.com>
Subject: Ingestion of patches to linux-nfs@vger.kernel.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi -

I've noticed since August 27, sashiko.dev is not ingesting and
reviewing mail from linux-nfs@vger.kernel.org.

-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
