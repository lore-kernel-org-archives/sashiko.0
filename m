Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.184.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650007;
	b=VK1ti22sD7VTQg7+kjn6oWf5/2Twr38HMbQ+FhU+kvB6dq4eBgIXSB8loPE5DfDvE6Dk
	 LG2gNgGnIGnHC25rZsabK2dhotQf9Gb35ylPSiLMHzZqFGe3mlOURX68oooNKgZP2v7GL
	 iYZPQknaxdxz+udQjeJ4fc0PcZKCYxFLbIU663BOgu6XLl4X+8cRVzpJA1j1OrBs2mrol
	 YniOpaOTKSKokZA3POIHEVvdnzBS3ImUca0YG8i3rz/kQ2sgbqq/jbdsoWjWgIM1p7pue
	 zVFoADg1TA8kb/K4MmwjBDyA4QOUfLuF+gqd3HevPX25TnOz4TptlO0+TOfoTOT1vHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650007;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Content-Language:To:From:Subject:Content-Type:
	 Content-Transfer-Encoding:References:X-Mailer;
	bh=Zes/N0mmuefrtgDj6a7AB2cAeiG7JOi2pRbdlSkjGrA=;
	b=Ka/x61jq2DRRK6tf2YUelP2hrJ+L3AY3bp2Bz5y5VYnsFRYqN1HETSdQJAjkmVW8OZgN
	 dI42AfQYbEQpXeQKEI3ATBrT1oPs3hBhaPhMwBXdlN9QrFcFxe0IFgFNENsNY3T/3GD4F
	 CwHObVMuRewbE2Is8Srlg4a1oCaSjPuNSSut0P3XoZDm3wvIEMy0S78hf4a6J0c69yUpR
	 BaF8azsSKnRf6Tn2Z1vfuOFZgX7IFJgEU9clIbqVeoTu+2BH/RWdIjQttP1KwBIHHf6RW
	 pQuhezioM2RiJ2yr2q1pMxNlkM+gn1h6t54VOYbtQavF9fAKzN/VrYXDT5aTA/GF03w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=htZ8EC3F;
	arc=none smtp.remote-ip=66.163.184.43
Received: from sonic317-32.consmr.mail.ne1.yahoo.com (sonic317-32.consmr.mail.ne1.yahoo.com [66.163.184.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F534606A326
	for <sashiko@lists.linux.dev>; Mon,  2 Nov 2026 20:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F534606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=htZ8EC3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1793650006; bh=Zes/N0mmuefrtgDj6a7AB2cAeiG7JOi2pRbdlSkjGrA=; h=Date:To:From:Subject:References:From:Subject:Reply-To; b=htZ8EC3FErboietCQj8NqpOyRErGBbxpHEXIZ0KnRl0bdd+MvhAvRi4v4rlbGeEJ82neBJ6GjzWsfiV0lJgDIK5SHSNyV4W7oWWjC5l7reoFvxNjsnYBWZ4mhkDUZs6aHf74qsiw9Yh7IYZiDnSjdtfsKoLtlKtctOzatbxYrquIt1b5UXgf25ERsfOqIhnq5l5nDF1nFc/PoXFNywIZOAlrKMAj6/3O5wlRYmStGOhVZhJljYXA3R5hCpTXozGR6nv7IyTm4+brMVtf3zUjVEfYb4/yDaR/7z/DCDhzX3hHf0ZIU+JffZgHPUxCRAKcfM58bhQCoSRAFH6T+VFNFg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1793650006; bh=no0td4MGlq2FdG4t2JSBkaP7Mvp6Klv6g+ijJACAYpA=; h=X-Sonic-MF:Date:To:From:Subject:From:Subject; b=WB2yz5a3dgWaycOBb6KccpndR/bxHOPH3ATq6r6vMkQ0AhopwzdwWwabbmItOjM/qyI+8y5bBJ3rCnRBUCBgZKFY9sS788IE0wRNF7x+Yc9pbap2k8E9duVC3+lQRSOcadxzZp25xmktIsmpJGy5zHRFOFDNL8+LTzY2TvGFyPkn6hZh4lVaRQFUyLNmVKj6of+S3J3d400BqdlVRxI8xtCbGVhoG+SIxlBaUiXfS9NaMT95glybqZ6gEujn2DDAI1Cu5q0ohj0fCtHmaAF9B7LI679BNEeB2wD96TOEhQlqwBl4H+T/OHRPLzakutPDxmYB9YU5705u0+gXsn4Bsw==
X-YMail-OSG: i3ssKSsVM1kbGu1EBW1x0DA9zI_LW_iJnmW3Np_3VSWEzrnY2Le69r4597Vl_X9
 _yzB.aOgXpLz4ey7TEpGNET2WfVdBDe5Ckllxo2YnFbDfPRqxUNgpf_cGnbPgzTuB7VEIwLNnUe8
 uHs5hQe_FMtkomX6AT.rDUJphj7R17WUvA3pWc1np7Ula6h6doKHqI.VSPIIVk27fSIG6pZttedU
 gJuw.mbLGriCHwXuBeWniY1oK275vNnVdQeiZZfbza.Q18wrZu9uzK1rD68v.9Goi4YLRiVGbFEt
 yTxtuL.Xf4ESyWOFUrbYshRPg2gCQWTt.EnNhgsZJtD3QwnbcjHPDBd9Vp12eNN02PgTzagQWMob
 WrXBHo8c6d3xlnhNsemynQfSKQGiNOMjFYNmcor.TbzTEKtz_8i9g7V1fuY6xUTtUUDtN0vsEp56
 SbRtlBe2Omk5lXUW.5Bij43bbNm7IOPdmYev1IL9bTaBtE6wPvCEr2RkJamd9GA0Kl9iFkOfCtvZ
 pKtHbrZ4GB7cQNO52tgZw5y1xcirMDqGr6FSNqjKaTU5SHlFn.vDLdUV0eQPiuSrlzk_yJB5K_jX
 K2oO3uTWV9Gzrmm718lZdexj0DxogbCJGu6spgaEfh8Ho4EzSPR79899tvEsu0z.BFQnqNsz13oH
 Ap216y5pgJO3KhhipgajPJBhQ_KbtBb9QXsqUVu88aqvVVmM_tpBsXPXmBZj9tbqffk0FLwXEP8t
 mPS9UcRMQi9YwdI7Wv6nABjwmXIcL67CBGuCuLKut9Pwd7pEF7hxnHBMWw4O2QJi4G9CKAkxnj05
 DyZb7VZ2IrxfWufb8v4XW5C4tpf8ucjhGHyJHsKpABN.7YtVNb2T2O95mSao9wGFkj7XCNFw0Hv3
 HFntLGsvyLqHwXjHXJ6KJuk5Yjy4FJeK0wy0wEsRdgy1rU650Djpsf9rei8rtR75yoMiK7YeqJ2n
 lm9KUjJHvYLQmbZ.bpybHZGysDmrrfGgiI22FBjjcNitt9rziCDMkh0spfA_1oxalxXbMYGdwTqF
 easAZWdAeCQez1CrJZ3D9Gh_IDdHVMfwX6UG5WwfbR52vc6F1NRyerZtKcKMNLGnYdJ8Nc56OKCx
 MjcfRUDt1YPIcvMOnEGXDYXXIFWgm2Js3_QspR6g8rdId1Hg7d6XXm57SLpz7TUgEVRynDTVVBp4
 yhLmsFd_uissrw8Vo7JxH2mrwDBCXz6BS9u1gNVbRgRNGkzwCIPmmIjwTBEUgraOGmHt33Z05Vq8
 JjElvlLIBXfZKA0TjYqnQ0YiGKGFLXhtxE4qMsyVLyc77Eo62JC.puCc2ZTzxpxDNcD_b07FlhtI
 28ZzNk87Cy9yqUbfmtYDJAXFDNsTzqKFZPklBXRjv5xBJAI.zxl8G5yW7dkcZBlYnX4HV.sqNVAT
 upBHxQ4oocHTvnDglK0.5.wCZHnYrvD4EepLr.o8N72elrpWzsZxxz9EYsvhohhABQpko79Ia5.S
 PrkGkuVCRihFL4h5kLBhUD0Q0Af8TAYLNltCjblKLeX38ckEjVVv0OivDf0wv8Nc0IYS3EYNoKV9
 UTz1gYXpGG5KoKgSUyii0jtyYABJ1lTaXBU6obxGtORo9TD8qHCD0.uHFPzgxHDcxw_ynuD5B6.q
 o2c31IX3syd.HhgdL0qOkRR5c.BpssxCfLRsnJFHdtJHmGiAbrWng0F1ZWHQb.aqOj10E9XPsd6q
 VzQzJHIycCx18IkHwcLijInocYy54_un8z1ZgmBBCgZZ6xqBFyjJXtFRjE.jaTGTjRkFtJXM7kTn
 zVewveOLvJyjXaTkIqXlDo.otuKHCnZI4Q20_jNWWZwmkCDsO09iJtX0Wj2CuABjLpvlAhM8S9MQ
 DrSZasFvjJ85R8xBjzLCKIVG_Y.h0FCsHbNv.pE3BzVLE5PUuYQTwH4zZkEGbTzhbttLVBjg_rwG
 xtVQYXTv.AMLKWhFgXM_2bqQJ.yuaq3njSzj8rqnem10wQ30tKiO2LUSr3Erhr6k_aiOB9RdSIX4
 Bc.WRY4.avDfPuVKsQPAO1lJ2leGpKOvjc805HwgD2e5.llOC9xP_V43V5rb_3OnL70FllUpomWm
 y8oo9BVEHkSdXPO0a22wlR7swG18cGB5whzdNeU0Ari8I2Myex15hgRwvAPprMK2Af.7hSu56YjD
 475oqq1sxt8eFzaRNx0QVBC3tV0CbZ8OQt1.oI74qBp293XFHV1FabPAJW0PL.PFNThG0BGzH6Yi
 JDPKYhzANznf3gBavSEZoWayO2ahqVrWnK5yfvRIvgOOjTUzwHR5qWRLrHsUTunwg2DEjpEvSkIW
 st.yB2.FEgKYNKfBmkw_OHobC
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: a6433c17-ce78-4c51-9815-5ed81315c18c
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.ne1.yahoo.com with HTTP; Mon, 2 Nov 2026 20:06:46 +0000
Received: by hermes--production-ir2-5dd9bf4598-vvk7z (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID cde5a7d4d616350551e9d31b56a51d4e;
          Mon, 02 Nov 2026 20:06:39 +0000 (UTC)
Message-ID: <f5d2828e-53f6-4d3d-9656-8def5548d014@yahoo.com>
Date: Mon, 2 Nov 2026 21:06:37 +0100
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
To: sashiko@lists.linux.dev
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Subject: netdev-ai Sashiko instance has no record of net-next series v7
 (present on sashiko.dev)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <f5d2828e-53f6-4d3d-9656-8def5548d014.ref@yahoo.com>
X-Mailer: WebService/1.1.26871 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Hi,

The netdev-ai instance of Sashiko does not seem to know about a recent series, while sashiko.dev has it.

Series: [PATCH net-next v7 0/10] net: dsa: realtek: rtl8365mb: add support for RTL8367S-VB
Cover letter Message-ID: 3bf4dd70-9771-497b-8c27-e925e0ef81eb@yahoo.com
Sent: 2026-11-02, between 14:34 and 14:45 UTC (all 11 messages are present on lore, netdev list)

What I see:
- https://netdev-ai.bots.linux.dev/sashiko/#/patchset/3bf4dd70-9771-497b-8c27-e925e0ef81eb%40yahoo.com returns "not found"
- Earlier versions of the same series (v1-v6) are visible on the netdev-ai instance
- v7 is visible and reviewed normally on sashiko.dev

So this is not a "Failed To Apply" status, there is no patchset record at all, which suggests the series was not ingested or not assembled. Note that net-next only reopened today, so I wondered whether the instance's baseline or its net-next open/closed handling could be involved, but I cannot verify that from outside.

Could you check the ingest logs for this Message-ID? Happy to provide more details if needed.

Thanks,
Mieczyslaw Nalewaj
