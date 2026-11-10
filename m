Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794312532;
	b=IhdCDGJhxN2i/QU2w0eBQn4YEVF9oMQz+zUj5sfvqW0zFicELOdX9khIBP5cYP9RWI5I
	 xCJmDF3moKDhmd3xGItpwm0zJe4uu/lcX2JRQ/fjx1UJkqy4l9XLnY0r2fwy6jy8iAtWB
	 lGw4l7Rc5m8DVy54ZdkbkHpTvTI3AqZlJsNDGkYLo/mCFl7/mvp5/zTy2RMrf6CgTzItt
	 W0IRTGQTwaYVrkaYuLaqTLMc8/dyK+r9Aiwr1Ii4IE2diSgFzfaBFrT26IbvnYo2WWKDv
	 epnwHyC8Kaq6EKZJ6hTWAYcuPyv3ueLCPHmgvK1HwTRAxZTIwieqt4+23DrT40XgyKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312532;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Content-Type:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J7NPkg1x59xvuslhRf7UpKReslaQztnTtfAQ6uzBtQo=;
	b=jdL3YlMYtt2aqVCnmpRk5KtgAQJFNgaHIJqOXwXrTcW/CjHuvMUUXv4Bmk+5VpugWww5
	 3yOReX+UEs8han8bZ5Xbst3WBpTGO0+szJk7j1cShRCIg8iHWNnmRBjluzqa2KgkNhPoS
	 nvcxy0mCNdonV76XIBqvdnoUuAvNjxX7hKqiUGL95QlCY4Jhe1meAILcbZ1x4uVKqbI+u
	 aUqFvGRKAuStYL2jo8YnoiDtkZYz9YRcaaWfo1fuH8d9IN/PbDoHyMjDXKTHItCUhdt1W
	 /PcQr9i3W3QjugMvZJ4A2VjNXpuyItkFGtowg9PtLnpjXJtoJfNY4+FxG0i9mApPxlw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o2fCxzVA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T7InXBaS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAA260A3804
	for <sashiko@lists.linux.dev>; Tue, 10 Nov 2026 12:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEAA260A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o2fCxzVA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T7InXBaS
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAGrT3178207
	for <sashiko@lists.linux.dev>; Tue, 10 Nov 2026 12:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=J7NPkg1x59xvuslhRf7UpKReslaQztnTtfAQ6uzBtQo=; b=o2
	fCxzVAD2BSrAs2gIM5N7YUyBNc35ob4McWQekGCaPMG0RyIRpyddj49PTJhU2EVH
	aa5rdyTGgxMfDXtaKXoxic6q92i35PCne/2K2HlfPjCJoUZ8Jc26qIMA9ylUi/I2
	Kd0uTeuHiKGKhEOZObyweL5VokPTq7iW7m6M5fQFlBgo8gDhfpI/1bWxUniSxJYI
	yl72zgH2O/+isRxZ2Y3dyOfi2pcKIVRkFJeU0/SqZCG9yxfHT/A4Kxgi1jcdVr+W
	r97qakJeZchw/38KZInVEeOqxZ4TM1TzbVw3AqliMusxzF+U1JS+sQ7mEfdvBV2h
	ZPvapR7V8ayCjhBxbQVw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufrraj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko@lists.linux.dev>; Tue, 10 Nov 2026 12:08:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b167bc8e16so771812a91.1
        for <sashiko@lists.linux.dev>; Tue, 10 Nov 2026 04:08:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794312530; cv=none;
        d=google.com; s=arc-20260327;
        b=JlTq+/UHgEblMnuYvhLPGx1lzMvZBhzvNiwOSHptIqW+8TOdW7uqRF/OuExiRAO2on
         xuRZsGiEs3Eb0HEUEthFMuTCUQPf/p1Zxjae4fENn6x6SzlDlCx1n1rJE00e5ow9R1bB
         Km74RG35LZnKdhjLLx2rDuZ95kB9XZMNWWpo9zKMH88WIm8JGRAYNYFeiRxVzwtYb9PP
         VeQhj/5ZOfUJtZWaW45aFdOnxI6LHQQonbn8RhBObHSq8WPJtT6rMJhNCm6e/iPkK8VM
         YZDAB6/eQ9q29M/uBp8E8uHUw/fwNTh9V/8ducPIL+r2Inaw6vl96BQXZyz9nJXg6Z02
         sv3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=J7NPkg1x59xvuslhRf7UpKReslaQztnTtfAQ6uzBtQo=;
        fh=enKcpezHDAvmpDVQgGSh8O7B2GfNPiTTDQB0qwag+QY=;
        b=GeGr2kE5m4BPB+b5xoCtOwqlgKrtWAeWUFGKb8b1nyp/od3efqYjtY4FTPExp/lxH4
         4mYkrMb9Q12PJKyFu9meUQBkEoqRSnUR3gAH1cNmzP/gxjBoiIFyzrROSslFQvvHd1QJ
         XH4aKOvMdPJC1K+YoyOkBj+rVZiuU2KRRypSvAcw07kf6xq01wSZ6bI3NXxMS+Lz+5a0
         ld5O5H9rAXVL0CI50oShQb8Ou3Ehy33mv5+DOFQufQYEBdwQjHkBrECPuuwCPSmc2Kyh
         daIOWFRTLhxIzvt9lENINLOBjAHhfySG9zgfNnAvcO9FPZy1v1/pb3B1mfdbnl2TU95z
         hqnw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794312530; x=1794917330; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=J7NPkg1x59xvuslhRf7UpKReslaQztnTtfAQ6uzBtQo=;
        b=T7InXBaSSfA4ArxOduKvAgvNd2Ei12Pwkvp/wGYP1fdt+a2vHtS5IBtaTGLKD70/1F
         ooDLMLE9ZlklnyvFARbte9aVQCOAYWdF+NCXBKEVTmMFG5DIMz6Iew015pqGD5rqnGte
         5Ev/GRFK0mzLPp/EonyBEgQ00+RzmJsAQsed5rJp/68A6GiuF+NHGsj4JRG/uxHoIYXu
         s3E2AYk0iyZfa9hEc8pPoeemFAEraucVW5kULW/wT1PQzGIVGEI1UUMDrc/pYb5nqMXs
         MpKUHOJvZ2/kVQ/H39UPgNX0+bthYwN0L1pYnABBpupc1xyQf0xG6wjAYXBGcPXtT0Fv
         O+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794312530; x=1794917330;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J7NPkg1x59xvuslhRf7UpKReslaQztnTtfAQ6uzBtQo=;
        b=vTQ0wCsd+aaWDHwCvWcGHCo38mL2S72BTfFVfX+gclCl84dWPJwBrApQvPOx6R97nn
         ivnTEN0nQQew9KiA4AIBANHvqNFNNDhtX9zXUapkI0sDB9MaTvACLiBpqDNdvjTP91qM
         bMe+jFsNEzoj52ybzs318UfrAAke1Y8WrhI0STGE+iZ9Ceiq7UJHszyVgjbjRQ4l79+K
         +v6cFx5+yEE70BxB/8Ddacva6j7Dr8LjcwfJb1KxklAULUXNNRgpb7LMRdzdQtfHYZuQ
         fJmWwwmgQiESVGF9NoIH23qNckgqfQrs2KpdNf44NJ+YgIq3pNk+ItjG/3ec9BtvDGKt
         /dGg==
X-Gm-Message-State: APuU4Z+ofOkUpmcMTsdzbl3f/FnVqUg3Od95uSv/SCRssbwTjCYOTp58
	gfoLoNkDw8RvZ8R7jXILIgRTFIDlRXM+dma04tv1WyqQznT+osg8MiBX570GAwWWlQqheMloy+S
	EIPmwEj2A86DFN61lqeLo9blpBxwTx8MRjaB8O6bYqWi+GOOSuPCgE+KEQU9Gbw5njXYYJBxYbF
	h8v9oSxilOLuhyFoMls+YyxNoSWq0deneQjbE9gT9qCEw=
X-Gm-Gg: AYBFou0DVGV6EaVamMKwibGtTy8nrzMRElYbrz4DKnJZJewLgagz+w/vlEL2EmeURU9
	50iWtJ/cr3VDQZ+2neCItGE98jaJNYauAWkBzOD2D7TTbvNHhciYEStw76NPHJ35DVE3UBZdxKD
	57NNJvRRPq0OSwMF/GJbA31hvd2zVCdF9ERGstaz9NYDDn5oi2ctgirm5CAw==
X-Received: by 2002:a17:90b:2e0d:b0:3ac:452b:4a63 with SMTP id 98e67ed59e1d1-3b166d28b9bmr2643040a91.55.1794312530138;
        Tue, 10 Nov 2026 04:08:50 -0800 (PST)
X-Received: by 2002:a17:90b:2e0d:b0:3ac:452b:4a63 with SMTP id
 98e67ed59e1d1-3b166d28b9bmr2643023a91.55.1794312529698; Tue, 10 Nov 2026
 04:08:49 -0800 (PST)
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 13:08:38 +0100
X-Gm-Features: AclHuK920BnxFWHwjxdeFk-ZCjFtpzo2F2HAFHMjbYCHdKPISgSDsQixzv4bVbo
Message-ID: <CAPx+jO_YeCeu3tN_8tKL5M3mZJT3VM2vVLLH6WdCpC04Mk=iAA@mail.gmail.com>
Subject: Request to add linux-mmc
To: sashiko@lists.linux.dev, Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: iiNhuUAgbk4p6YnF8MF5RS1qzvFtdSzI
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af30952 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=beX5v3aCHef_Nx0AjcEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: iiNhuUAgbk4p6YnF8MF5RS1qzvFtdSzI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0OCBTYWx0ZWRfX3mNRtO2EZLIb
 +thVlXtV7qeednp2PmJs/o+T7LtOwiLTPzy/vFQ7di9PuaWOR8HDxUBKp2eF+38wU2wFHrPlmZO
 IRe57nkHqRs5vBWEOY6NsdlfExVRXoY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0OCBTYWx0ZWRfX9/z0WrjRBx8Y
 lGYVFxI0lGHtiVWqKmTsAfgw4YunsukJuavrFO0HeELUP1dIiyTprk+dh/3lhsABqbfOnsXWI2l
 /OS58vTVSgc+Z6HAJLOmtiUg6V9HhcYGTSD1MlQ6c4A6ekUqFZrJxZkIJfGhpc+1Kn0RWg2ZZpm
 H3PN4h5znLPuvJIs3SYhao3QwkR9YpJXFWXOvCEstnjdvTxEyii68T3/59N0x/jzmp2adscjNc2
 O8KIjYaHvLamJZtHvxx+/CVBNpPz57mTeHQ7KPjHnIsHol2f2S6LtJaT6wrZhMIMxUqWQZ4Q6hZ
 anLZEl6UDKobD58Z97RSCNSAmOo+wpWlsNpjr36gs7YhDnyTVfNCNSwi5YrfQWEvfCL59yBofdz
 PRYCW3xizIxIS2pWt1fO1dyK5Te+5utKAmAtxmVHLrrELZ8YIiE4+wdDV67DI+q8xMmO1oiwp11
 5RKJamynMF3gPKE9K6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1011 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100048

Hi Roman,

Can you please help me to add the linux-mmc list to Sashiko.

Kind regards
Uffe, MMC maintainer
