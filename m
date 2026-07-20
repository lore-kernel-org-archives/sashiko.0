Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53A23AC0DD
	for <sashiko@lists.linux.dev>; Mon, 20 Jul 2026 22:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784586249; cv=none; b=Q3w1MPhA4CuSQMwuwXuA+dKMH2VNLoAeSXFn9a1nbxDWT+Xyl4Yz7BrzC+xAvyMR2JvmKSSN4RU6e6MbX3j8NdXlukNBucr5DQUQPC17nNfINXz45rbZYPXF4kuSrZe1cCig3bLrrWErRM+w//tvPoPhrQ4b9HXlhwutEaMdyDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784586249; c=relaxed/simple;
	bh=a7NK/sN4hiRNkWniyf9M3iBUy5rI2JyLZar/PfVKIAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QX8cHVq2rYGTxFRz7UaPLIMqN3eILQMqPUStac/+4+ZC8JUw6qujOP5+Sta7zgFXl/5fqxlFybch7wMJTq+Rg+HkXxZlAPI3F93pdrgaam8O2MkQUi7uhstCZ5xn8OlCbGfGut7XP6yO44Esrag72Wvp0146REItqwetFd+1Yx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FnLBpCDb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZMUVU+Rk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FnLBpCDb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZMUVU+Rk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KJTPAW447161
	for <sashiko@lists.linux.dev>; Mon, 20 Jul 2026 22:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UxVovOePdJ7xF2E/PqcWDoW4
	EyLSREIDjr7ZgGqdxM4=; b=FnLBpCDb6YBrO7/4ypvTKe2M0yVgOw1y1Yk8YE6I
	kOPHsUvMV4viYDA/E7qUtO9r3Uvj5qLKmIXAvCUi/0Q1Vr6LwLhym0Z7Eh6GqJm3
	hcDCjTvpFdDwnfAH2I2k9OnfO8ZTK9fax8jK7ifnlhE2V6D8l3XLAKIWpMOFwQIO
	dJH5Clr1udFDMtAeZ+Qt/iNtQQcAKaoBsG7Ju2ocZIuc0V/ViqsynXGUEJeF3ALj
	UR6aB+6rEY00i8pQEbuZPlnZafoZ3EI6oVkFAE6p3hFq36D5/ahRRFqv5t3LQsDj
	8VeHlJpiW86OQyoHaRWk5PUXzNWVmFqbjTNNcu0fMq91HQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5s4w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko@lists.linux.dev>; Mon, 20 Jul 2026 22:24:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1a9764f0so212994291cf.1
        for <sashiko@lists.linux.dev>; Mon, 20 Jul 2026 15:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784586246; x=1785191046; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UxVovOePdJ7xF2E/PqcWDoW4EyLSREIDjr7ZgGqdxM4=;
        b=ZMUVU+RkCP/h+byUg8tSA0AF/k/T/1sJDtNz2hIAG14RvnuqrTAoZ1sd+FtZ5Dtoml
         7I1+U69qaCOBbxy9Ep4hsaXyyriAN/gyJWbke2FTrIvrA3jcaZOX0YskjDCD7Xq64mtY
         7LtE+v/heIN1SWoBv+gFDtJakBuM4c9VaNL1T1+33rEn5dH54jCuvjWKVf5DfKKL00Pv
         m4QV/QLfaa67bTflxVsZhv4tHLW0h6ZmNdVuz5oGxUC+fMa3NzVRNkoQ0OKUtj7u1bJE
         vx5j9KKaF6UATH5jc5gpkwAjXDh4Hffi70CTfVl3r1xezrBs1vP0f67hu+Erxt0seNkx
         k71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784586246; x=1785191046;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UxVovOePdJ7xF2E/PqcWDoW4EyLSREIDjr7ZgGqdxM4=;
        b=Js7CQgokdhVDgoGcgsoKUppPZWKQcSGlW//sQMScCYBZjptGVUCPNRnQ7hqWbKKCE7
         nfpduG3NmFLE7lyx3gyx1idI+QSOZQRWIBSewD0stgz5PXNQ1+23gpSsfrVT2hMhouu1
         B9Nx2c5xxCtJqNLJGo+1QessZ3AhrUdocMqzIZPg44H2k6V9Xfyha4gYonmZNTFeNfOi
         jpTo0wOs3+EB1xJ4Jmb7MXBUm5xTN5j7cY4GADtPwz6oDsXNpUB5MXA1lfcTvGiWSVup
         Q1ergDrqxOcrWTjiBH8GwHOcyRwz6d1PvI9+2O6fv1ikVmxTRIAOflhaYTC5SHn6iIzz
         SGxA==
X-Gm-Message-State: AOJu0Yy7xh68ta/BTC8kS9zfglO/M3U3O6+0r1mfDWs3em3p+kBlNXSP
	YBqB2e3qCP2BlUAnvUs1yBegEhsRtupn58qVK6QvbaMIpGQMJ74vE8bZMJoYfbzR3CzkqYwg/l5
	fDhar/lw7OCdYu+lI1G3tdsERahk7Fh7ZXd4Rh9Meb5olCPP07y3UqUM7PLL+1MbDsCIz
X-Gm-Gg: AfdE7cl7dz53/bkt3oma5roU3VWUhsRYJMFd1RBV5qpo6swKa2ojEwhgiiwy2zL4X2a
	NgbmrSMulel37F6F8JoHALmf7wf/V/+3w+2eNkiF1AeSU1EQojZzxn1IHVltWaMtVoG7ZwPvxZq
	ClGzwHxjBkAuKOUd1oWoYET2IN2ExUEo5tW6OGIua51tdabjwopOUil21A+ujKRFPqwSoJwmcLo
	Eq8OpzXDldn0oABWXKwhE2SwCB5RhNbefwhHU7f1mxxwa5w1dFh8+WuNe5oGZojuDUloF3hpf22
	7+6vSzXnRnVKeAJGflvDAUju2d2gHYxKx85pqDbMA7bjf4fzx6F1fKnNWSxkDguB8HUrXuOJiQv
	2vleo8+xoYc/3jTiXxAGlGtjb4WcD9YkbAoL8ZiSZhF5PHAQpdk+LMOArmXgy8cfMbdh+gjLuxc
	P+jZm+k0tRrRTCdw==
X-Received: by 2002:a05:622a:15d6:b0:51c:2cd3:ae7e with SMTP id d75a77b69052e-5213cad922emr144364071cf.45.1784586246168;
        Mon, 20 Jul 2026 15:24:06 -0700 (PDT)
X-Received: by 2002:a05:622a:15d6:b0:51c:2cd3:ae7e with SMTP id d75a77b69052e-5213cad922emr144363761cf.45.1784586245730;
        Mon, 20 Jul 2026 15:24:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291d8a46fsm2601531e87.13.2026.07.20.15.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 15:24:04 -0700 (PDT)
Date: Tue, 21 Jul 2026 01:24:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko@lists.linux.dev
Cc: Ronak Raheja <ronak.raheja@oss.qualcomm.com>, robh@kernel.org,
        krzk+dt@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org,
        vkoul@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 4/4] phy: qualcomm: qmp-combo: Add support for Hawi SoC
Message-ID: <jc5ckw2gouz3kbblp4mm4n6td3warmxk7j7tfsg5wvuglcc42r@3rneedbxzxmw>
References: <20260508213234.4643-5-ronak.raheja@oss.qualcomm.com>
 <20260508232620.2FD04C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508232620.2FD04C2BCB0@smtp.kernel.org>
X-Proofpoint-GUID: N8RuKQFB2HcmiMvyz_SedERYlNZfa-oq
X-Proofpoint-ORIG-GUID: N8RuKQFB2HcmiMvyz_SedERYlNZfa-oq
X-Authority-Analysis: v=2.4 cv=e+U2j6p/ c=1 sm=1 tr=0 ts=6a5ea007 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=cO4G4PFFuWa09AuA6MYA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDI0MyBTYWx0ZWRfX3IwuLDaecXYr
 mo17KBxv+0eahg/5sShb/e8D+hE9W9w/BHfuCO3DqWFPgelMsOR0xHtDva6K3x3yco3AgXoQhqz
 IPAMwoMExDpW+6iOg6O5WvcAJXE4a/I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDI0MyBTYWx0ZWRfX9b+AK0AlGq/m
 6cLCJfzF565dsUUFSnBXwmOOdYUyAKFf5pCBEZ8GhadoMlOTQVH0lfgC4auqzaRevaVdrhhec5N
 qmYW52/Ali/cmQTyAmMb2EiZ1Kx1wCeSXXVsLnASXLFc+7ee48cTlJGap1WLQJ4VFwXLpp9Hj78
 jigW9oqU8IPFfBttGE+pyeYO7lRLsUFZFB+UgsS3M4uHEcG+xrcySyDP4nW7+Cc6zLdOfbWW413
 OvaGNOF9XHkaZ+KuKasKeqLNhJwOgS0iFfUqAPOPYos9IZEaK9fHUVqWYgEOZfCWCg7KZSINaxI
 C+JL0U5FrgTE+mlcsN3TtfzPKka6t+6NAr4K3ds+0UOmAIVLTdwir22Omv4ZvAJy1VY7RZaE/9K
 dQFOl8hQnzLOqjLLdoi/HS2P0ubz0vkwWevQNQWtIFEhgTTuySHEXrbkIqjDIW/IPbKbhQmHTHz
 P4XrTCU92BIuHLSxecw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200243

On Fri, May 08, 2026 at 11:26:19PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Missing DP PHY function pointers in `hawi_usb3dpphy_cfg` lead to NULL pointer dereferences when the DP PHY is initialized.
> - [High] Valid register offset `0x00` causes the AON toggle hardware reset override to be silently skipped.

Please add DP programming. There should be no NULL dereferences.

> > @@ -3699,9 +3915,9 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
> >  			SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
> >  
> >  	/* override hardware control for reset of qmp phy */
> > -	if (pcs_aon && cfg->regs[QPHY_AON_TOGGLE_ENABLE]) {
> > -		qphy_clrbits(pcs_aon, cfg->regs[QPHY_AON_TOGGLE_ENABLE], 0x1);
> > -		qphy_clrbits(pcs_aon, cfg->regs[QPHY_DP_AON_TOGGLE_ENABLE], 0x1);
> > +	if (aon_toggle && cfg->regs[QPHY_AON_TOGGLE_ENABLE]) {
> > +		qphy_clrbits(aon_toggle, cfg->regs[QPHY_AON_TOGGLE_ENABLE], 0x1);
> > +		qphy_clrbits(aon_toggle, cfg->regs[QPHY_DP_AON_TOGGLE_ENABLE], 0x1);
> >  	}
> 
> Is it possible for the hardware reset override to be silently skipped here?
> 
> The V10 register layout maps QPHY_AON_TOGGLE_ENABLE to
> QPHY_V10_COM_AON_USB3_AON_TOGGLE_ENABLE, which is defined as 0x00 in
> phy-qcom-qmp-com-aon-v10.h.
> 
> Because 0x00 is a valid register offset but evaluates to false in C, the
> check for cfg->regs[QPHY_AON_TOGGLE_ENABLE] will fail. This would skip the
> qphy_clrbits() calls entirely, bypassing the necessary hardware reset override
> sequence and leaving the PHY in a broken state. 
> 
> Could we use a different way to check if this register is supported by the
> layout without relying on the truthiness of the offset value?

This deserves a comment.

-- 
With best wishes
Dmitry
