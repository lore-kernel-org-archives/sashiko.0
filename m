Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.184.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795857249;
	b=i+AF+D3ssiALiRxlXQHYYkZIQljwyF6WyLcvLqymdpjWqe81J21HNSetQOT3olPQeJkh
	 M/I4IYH+kuQx54iqb5vl9Jh7TOIUcUa2LOwP1ecJ/kBSLgiCE/SxXbQeL0R/coY3sHtmZ
	 xlmxYSidXiDoogVoaUqVTxA3o4QBE/E0oESqZpkq8lpkIaQBKTsTdZVXp2VS1ZNxeVepp
	 GDYnv2f43PjQXhpftmN7B3MWC9TLASLNc/3Dj8nhI/BXAqyzH7+DYBh3c617EbHbnSH2L
	 uwZ3wAH0mhwQWtTonbP09Kye11Lgo60cRRi6YzvApBNwXzXC0MtAhNZIhuu+gilEWYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795857249;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Content-Language:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:References:X-Mailer;
	bh=GX2Rf7/hfUCqlpu4BsYl1qE6pH500A8R/ALqqh3LuPg=;
	b=cgXUx9iJPFs+U6CA4pnedHv+h9JftCwLH80pIzVo0a9MPsUFyAwy/qaXeHkQULgJw+Vm
	 VtpuD7oqTyRk+GozC0+iuKO6IDf5vKbnnm1QTMRhNKPmgxHowknwWBYotS21yeBFSE/bS
	 69A6lUl/IhYHuvOT8qN4SMv5mFjYv4VydWUx0A0y2HVX8WT3uTjkf6shOWja8ClGJkgMz
	 jJ0vYr6SgnGmiEhDbLG9dIW3+5rge0hUtWx8Zws3uf38iv7Lg1vXd5vszPm+NlV/4E3zV
	 NC5tn4N03Qfc5jni6CiqX/YEhq7zWqIWOeQd6LkF2lDLGp6inRJIBkx9cb5oIo8qgOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=WaKepx2c;
	arc=none smtp.remote-ip=66.163.184.200
Received: from sonic301-31.consmr.mail.ne1.yahoo.com (sonic301-31.consmr.mail.ne1.yahoo.com [66.163.184.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E871606A323
	for <sashiko@lists.linux.dev>; Sat, 28 Nov 2026 09:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E871606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=WaKepx2c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795857248; bh=GX2Rf7/hfUCqlpu4BsYl1qE6pH500A8R/ALqqh3LuPg=; h=Date:To:Cc:From:Subject:Content-Type:References:From:Subject:Reply-To:Content-Type; b=WaKepx2cJ+ccQVZuIEENPmYgDI3tF2IvjzB4VkM+43Cr283WK55L4y5Qp9OwPeZ0SItaeMrigs0ChSbP5wT8XPq0LAwTiax7FKjTyNaQUGsKg4DiqdCyughwp8xRMg7R7VPGZdHfnBL4YmYDXCUqJyqAzAeg0OhoYqK0aWHT1UJkNnNg3HZu+8nw4LMjQc/23wVs9YX22THc5/02aO3OABrhHz0vj1/P7MY0/0XwOX2E8j/anMTjewaSlqkcbY7a2UGW51vVZPLzaqPoQJm0r4TWzSX9sUeYzwZUnOUB6NwP6L5POxOS1f4NBYwips3UfhmHYuSBXL5sesLPBteHJw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795857248; bh=ZWX0bifnsSUc08UUGD82fuTYGACN+zArMSdUlT3uiRa=; h=X-Sonic-MF:Date:To:From:Subject:From:Subject; b=DfWPgPimt4WCr2QhXObFeYdvAOxanPp8ufFqraiGK1hIU99KEkEbHSJnsjzyX6irLKI6fMe7g0IJAb4mRn+jXpdaoitAaXiRLFReF7XZT0Y1HTtqPMPAjPK1VBRJYJdOYKZByO6RYktT7y6HqUKVZk6umSr/XGON13wbnhkfaahpwHiATKX5fnU2OGiKNzpvRB1DIawDssHYHkejzvapREuOu5VXIJzOC5fcnQZSQxYrADMRBInMHji4pxW361aAag4aSGR478rm/tnnf41NF+JaDdNKHrQYyLjeQfrtWPp/zs9KGKva0Iy/w1yNmhdwRlGTD7GUThhy6LyRV5Lu/Q==
X-YMail-OSG: RUjnEz8VM1kIoxmBZXGpaeLK2sWTUfUQt3iFVXMpVDG7ky1yFqLEYkQG9JYhnQx
 0nNGsO5kY7EZxKhLP1frEI2kpBYyyQnpfuMg6WrjbleOaRioP7XvaR.8E988r0Wp0QSUN6xtsgv3
 lymhoLEUQXVW1ZIqlOeg9hvGTE4PmS7mWhjHkIbc_NYFPlTbODS5r36GlI_GiDBzKUo3qkjyPg1H
 ZvXdxLhQIL_nWdjVdOrSJcB90k6pUxSku3mBo2RT3XzJHRdCZapmmba9AOskhnGv2HGFQdoacncf
 7zQItbFkLQBgTQTcGLm2JSOlcnD6FI.WPzFxlVT.TUvs8cEh5par22DxwSaYsmr_j7A7248Iiky1
 wDKwIHJlyICwtbPi6ph9_NmXGBJEAU0wVAtSKzgDn1_o2g6SmWflx08C7hIEu79n23NDEnipfdam
 PVax6RqBc17eViR2Wtq.6XQadMCZldRAezEd7QSwogn92iMNJRj9iXNNVMUnX8j1P7fEwm5.42r8
 q.hx0Dh9A6cZKUiSrv5zA1RDJfm3I6JdbJs9s_WmmY_MEUhwPTlOSSJ7T6F1dmCYJCYOyiG3rGrR
 1OcmjTAKvSIQs7aJ.bi2C6rycFrYDeoJbeR_a9USsBtW8GR4OHS7cZfu0.5jkmXGiKXjGYnDWpLF
 2gjKDlpAC4kO0d0ycgF73.7.ypRgg6QT.LWsOCDzVTOlDofCr6cm.GKhvJkzK9JVfTynv5l3U2vq
 571bB5X.VUcfsRnvPzlc5g_Vm6PvYYXva6Ne0aTDl6pJWNuTejRoN7C0JHrknePydTA0y0.JsHV7
 6PiSc8Lbtb_topgfO0UHcG2Op_bcoAX8DjT6l.3S.1D2yCBqziPSIn6NqC9AYNisoMNJXgw0Y7VX
 ZJUUtDR7xKsOcSsvU5ar5t8E445__proWex1I82wjhMKWYOcUJOpbL.jqYhrUDvU0ryXgoHomyht
 OuDsqL9j8DJ3MaGtM9b3GAI55rhBP6ng1mob5XMvLrh.D75tJzdRUqCV3xTw3qYMBhkurRKiuNTv
 A9WjHc6IaPA7FUo3DMb81E3FLlfSsAAcw6Hbc5wRo6h_w3mr1h3fEzorq7bb.omv3nQ9dmFj8xHi
 cOpL0tpCpJlcPsTvGjmGYZz2Y8dTKjhAz._UKBNaHYioIFdtvMRYPXUjPcWv8pBphkVciN38ef4t
 P2GbBWd3Km8EORjW14J7HH0NUo1mN.xWL8fD4jZfzzSb6.ULTI6uZuQlcqrCV8QFMKYLyKuXRVlZ
 CbXxUnf2c8ctLp09bOUe5tUlLnJgeofC6CWh1Yr76OChcEQWtkMzOZWqmjjn2lF21X7uMRgSvOEW
 660VPdlOhdvmYcXfrMjxFcVynK5zHkyg_bZmBYJoPGoPSm7_xdbPAv.xPcjgHIHXUOYuf3fAWm2D
 k9ZdGhj592a8aefi8W.fSRHJWcJoBtXY58zmQSm9Rc4yVI10X_bkenUqK0b3Hz1l9koLAkNiDxH2
 ZVGLAU81auk3ERVQTpCAXuFvzTtKFB0EtdVnCKn6birM1g0frpM_KHemoBjZUUkgoIqulTxsIS1g
 XHHnG0RV_qaqc3seoIPDMF_.3mS2T40V8T0I03HGH4eAfQBEdYJN.iYZ_Zy3k.rFW6W1.EQaGPYg
 Ha8E97qmwXR.S3ozWcy_SvoEyKHeORFoSbPwM3qjDgLrsrVKXrWkTA1QzFpReqrd53AYbSnTUUWP
 bL6eWk.0dGvrKrJ_lHlo4GqZUT18_CDyIaeJX3Y30S43UR6U3u2WBwn.S5ihwreud19iJ0JtX.Jp
 Cm5p9VG_MfQMGEFvHPCD0AUmWWeU7j1gg1IAYeJlf8CdOBuVRVhsynn8CCEuwbKmIyIzt2UsEFD2
 QtF6oqqGEtNHNUqz6StzQIVXTamhPUHK07JilWAT3DfwJPX4YsdKKGvcEVaSqmX8JLwtNqZ9ND5N
 QkVhcj5.m8Gu.JOMr55wRJ8Y0XpTiw9gFWR4SiksM3U6eScPNEkBIx3HsiJGl8xI1eud0jUD4GdA
 F2brdJbMTt0RoyrHeMB3QGIiIiYqFURaL8VQNrIm0gOD6sI4o9MAifYbEOgA4MexprR78manczE4
 rp_8Ua6GsoJG.lTuZ.kctW5DfLoOgKAXqbvk6sYbx3eICjn2LVIRNyMDYSmSRWm6srn7j_m_rMvF
 b1HRiweYbACNc7OvyTmiy2nsX0fROniWSBp5JVXj4M8cJHbSrn3geidsVoSAEsrQUn3UM9MQi0sW
 T9NvYqAk5Z7fpwLF5Zt6eOdYX0kWMVKTrtBc44lDk8wdCo_s2rVpSvtQh.i6x3IV0QdZFbRyrwJ9
 FH75b8vEoKwwLnarBrSwrrDiIjEb1XH6b2Nm826n2
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: fbfba199-36c6-47b6-9980-6a77d65c0cda
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.ne1.yahoo.com with HTTP; Sat, 28 Nov 2026 09:14:08 +0000
Received: by hermes--production-ir2-7c4859dc89-526xz (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID d3f34b57b9a41945a933ce2b7da0ed52;
          Sat, 28 Nov 2026 09:14:04 +0000 (UTC)
Message-ID: <90f997b8-9862-41f2-9577-f935fad75041@yahoo.com>
Date: Sat, 28 Nov 2026 10:14:02 +0100
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: pl
To: "kuba@kernel.org" <kuba@kernel.org>
Cc: netdev@vger.kernel.org, sashiko@lists.linux.dev
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Subject: [BUG] netdev-ai Sashiko instance failing to fetch threads (Failed)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
References: <90f997b8-9862-41f2-9577-f935fad75041.ref@yahoo.com>
X-Mailer: WebService/1.1.27100 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Hi Jakub,

It looks like the netdev-ai Sashiko instance (https://netdev-ai.bots.linux.dev/sashiko/) at linux.dev is currently failing to fetch incoming threads from the mailing list (while the main sashiko.dev instance is working fine).
All recent entries are stuck in the "Fetching thread ..." state and immediately end up with "0/0 Failed" (author: unknown).
Recent examples from today (2026-11-28):
• 20261128080700.3828378-1-kuniyu@google.com
• 20261128083639.1404522-1-yuyanghuang@google.com
• 20261127-mptcp-cmason-fixes-v4-0-3f393ea8c48d@kernel.org

Could you take a look at the fetcher service / logs on netdev-ai?

Thanks!

Mieczyslaw Nalewaj
