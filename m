Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C404E021A
	for <sashiko@lists.linux.dev>; Mon, 19 Oct 2026 11:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407781; cv=none; b=CWjuB2eRRV5ENVGPqJ0LqRNADS3EWrlgrlafSgyeqZ2TDaCH91LmRaDGcDjHeYfoePcLW1+VXkvPVncagCaoztwGq0LqYouHw9u5x4Macvhwc8iCXN6wR4rdpwUi2VoYTDxuwpvg/ox09tCZhlbL4ddNaNSVc5bbK/yn4qTXsqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407781; c=relaxed/simple;
	bh=aKznYOH6IGnWX4imb3RIzaFogzYPadhAflZ8o/pF/xw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=knkRonXmim7bfvPD2umI0h4Tk1gEGMy0eMSmcXFvatniVv8tEg5kLGC7yFlVThzE36nZa3CBRwYbGre96QwezM39u3Z0l3sUDSPoxj+Zb1WnrJt+cUEZyZm7VXCXgM6n0aUpjY0dV2+/Frc+bZc1BID8luvd/2JpkAtCVJRYA7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pgYOt+Bc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NLiHuRZd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgYOt+Bc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NLiHuRZd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OxeS1168075
	for <sashiko@lists.linux.dev>; Mon, 19 Oct 2026 11:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dk1so2cLuZXw7H6YttGuCdYw4v1avm3bPcBQCMqS9ak=; b=pgYOt+Bc1s0yf5m9
	+zXiw4fRsCA7KkiYbay5L6yfOwtKHHE2Eqg6NVdtt1x54IxrUl7QvQtMQVtiZVH2
	ZXBnVfWotD0+mINQnQa9wr4ZAKYMYPipgzAO0blBwFgkjjQiris+EeipvWSt+Q0K
	+wnPFqHrua8YZR4o3ox7MuLolKSVf+/dNvbxGOukZm0v1gnhDsglciI3O6RISB18
	B22dBtyHbfh2cZPw/e3ERJKdwC4WsVv2r8i404x+yPd2j85MyD5YZ/vJ2DSoDDeS
	4WvMXi2zmZ64VNm5vTEPpxAW9LmHO67oqE8GwbmrsHuL1TdGztg8f+jhuouVJdHy
	dsv0Yg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5c8qv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko@lists.linux.dev>; Mon, 19 Oct 2026 11:02:59 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc37ee6562so104017137.1
        for <sashiko@lists.linux.dev>; Mon, 19 Oct 2026 04:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792407779; x=1793012579; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dk1so2cLuZXw7H6YttGuCdYw4v1avm3bPcBQCMqS9ak=;
        b=NLiHuRZdAL98C55RVa1hffCt3RRrWP30XVX2djq7RkPNODolURCYpYZfGYe93rcksm
         rv6mq9CnMuIVn1vNPD7hgGydibc8XseF4axWaWYwgf53/tUKrb1+8Hz9E5cJHAiFLNsx
         RppvNyU612bPJkh3FKt8Vs1yLariNDfOYbsibCQn35QiT0BNltcaUDaD7koln00jNcco
         lPF6aS20ZDMOtd6I1h/2NWrXnY6Gb7dE/nrAQeqwqU3jT+cU7sAog6Bu1Fb+CmHBKYne
         QGTTceF22Iho3hQeX8c4SI8sA+3hNJ03aFaVIKcMwlwsMqrl6SvcPRsputA4luMQQ3pd
         j9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792407779; x=1793012579;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dk1so2cLuZXw7H6YttGuCdYw4v1avm3bPcBQCMqS9ak=;
        b=NzoStiaJSfRs1bR2mRl/Tng6Ra9dxRbRk5emisF40zbdyOwmaD7ITw2PkDQkE8CxpQ
         NGsEJ5BL6pZm/W8y3sxpKkipIODOBv+5mpramLmjdf+icrwCyLyCAYbrxIRC3BVIAC73
         1ENrLZ5SPOxe5ULcQHH3tlx2PF+c9TRJUYVD0yEBVous61R9EhR4YfqubP573sxRO+a3
         yTAgkqvxHZ4xmjeQW9oRWOKxxT6oqPQtmRrhO6kX7NlCVk4BzrRKXG3BOnCactCGPgyp
         o8/DtQ84NXmaeHG9jAxN3FiT1A5JvLqQUw3wuiZaorVNOi7OMqodfHctEQDY6brn2IWX
         ngjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYrS4zbBNn264Il/9xwcwjYJ5/vBOvJtiolms7mr+HyhSyvTFmBi4goJ61oQR6+AUaB9m5ZkHg@lists.linux.dev
X-Gm-Message-State: AFq9FYIkoQfet1HnE8/NAw04OiDSIQenZ6pq+5ANcA1hfVwkzzXpd3np
	dR++rYnmFXAU406yD8lekWzO5jaSdQKV/f4ju9M2VrhwSNKwFi/2QlTMEVGdJO1Il0HaNzsDukH
	OkkEhlwcEKcGSmBBrPpPHoAQG5s+jvMUYxXGsczt2albhQLwK1+PLySKFekOY
X-Gm-Gg: AYBFou0WX7k9ET9wFqPE79L0r4hC9ettvoVJj4mIYFplVyr1096JHSShhGPMYHZMeX8
	UR+/uH1OwU75GybwJzmFvGb2fIwTUCaDKElaFVEUwqeTgxXAI6zauTkcfth1uFmzurYQViyzKW7
	PxqTUcFINp1bfDUppxjxMs31E4kRDxKqePEEcnox23rZ9mFw4pHHYVJP40mrixL6LrhaMkfB5Xo
	iPiDpo9Z7/YgOtEzn0Gk0rhM0S5SoNIRUJYXQVGPzeTxuCtJ9kf1/8OlIialRuKeED9YAdn7xOo
	cYJGi3W5vWPefqE1qskcCciG+8WTr9Yg4wijP/aflBQEP7pc1N4ogpDF2s6pTWxH6kGxXvTf+1P
	Hv+7ba5qDE6AQ3psvQkQ=
X-Received: by 2002:a05:6102:5108:b0:7c0:e591:4da4 with SMTP id ada2fe7eead31-7cc369c10damr1485610137.18.1792407778535;
        Mon, 19 Oct 2026 04:02:58 -0700 (PDT)
X-Received: by 2002:a05:6102:5108:b0:7c0:e591:4da4 with SMTP id ada2fe7eead31-7cc369c10damr1485600137.18.1792407777988;
        Mon, 19 Oct 2026 04:02:57 -0700 (PDT)
Received: from [10.40.99.41] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32875fsm351730366b.8.2026.10.19.04.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 04:02:57 -0700 (PDT)
Message-ID: <3354ebda-5158-489b-a577-5cb10e5d5fb0@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 13:02:55 +0200
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: Patch pre-submission to Sashiko
To: Theodore Tso <tytso@mit.edu>, Jiri Kosina <jikos@kernel.org>
Cc: ksummit@lists.linux.dev, sashiko@lists.linux.dev
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>
 <atO3pCuUxI950ftN@mit.edu>
Content-Language: en-US, nl
In-Reply-To: <atO3pCuUxI950ftN@mit.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MyBTYWx0ZWRfXwX+f8kZXhwFT
 PBnPB8h0CIfcT3vuMzA05Yu2G2+SYmlIGYK8WdR3Surw1HqO00gspx1slUJnMx0k/gVzQ2Yyddx
 bZKJy0KXpcwPsm5iiNzQW1dKbYTpQ3M=
X-Proofpoint-ORIG-GUID: ot-luDkHaHhYvn2cW3m3AL1MFqEceeTb
X-Proofpoint-GUID: ot-luDkHaHhYvn2cW3m3AL1MFqEceeTb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MyBTYWx0ZWRfX7NJbc/bkLiQr
 muDYGqZCASDFEvGeQi4Izew19U5iqCnYQecxJfb76LEoLmgmBWrTtGA6KGyfd0LZbhwS3B7rOUc
 y9iov4g++6JjG1wS9XgDw7/nAC04zgob7Hy2bngrLTDPJhmvvT2mrZ5945DszJVAfiI/wlNbNEw
 AZSpmzjyjYodd+Q2b5dITZmzyx1gSk/1LmPdbDSIeyhvn+hm/39pro7rOtiJXgAS75O/C5YSiZi
 /TDjtMEKAhrJM+ySb2w/9/S7o3kkoLMTcfq2SY86yVvwdr+BCkt2tslJGHo6G4HQmAf/EkByA0q
 HAckewbN9ZJcaZg8Wa5ltjeJ8BmZCs9nVjkEohj46kpbHTbtAT4Rygv7WiYSwmF1kr91LCu9CXo
 v0QM8lrIwXAXpSNnOTGJdV5V45WoMCTN6IYPmXq65inSKCpW1uKAy+OaD9abUnq1Tr5ccOIi4B2
 NfvrwI/xvEh6NpNAREA==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad5f8e3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=rrvG0T/C2D967D07Ol03YQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=_QQQY8vNCpXisrmCSukA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1011 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190043

Hi Ted,

On 17-Oct-26 8:02 PM, Theodore Tso wrote:
> On Sat, Oct 17, 2026 at 07:28:48PM -0500, Jiri Kosina wrote:
>> I have just received a v1 to v11 patchset submission within roughly one 
>> day timeframe.
>>
>> Neither myself nor anyone else did comment with any review feedback, 
>> except for Sashiko. Which I believe is what triggered all the immediate 
>> resubmissions.
> 
> What some subsystem maintainers have requested is delay sashiko
> reviews from being sent out by some fixed time, such as 24 hours.
> 
> One approach which might want to explore is an exponential backoff.
> 
>> Another option I'd like to propose would be to introduce a way for 
>> submitters to run patches through back-and-forth with Sashiko even before 
>> properly submitting the Sashiko-polished v1 to maintainers and 
>> mailinglists.
> 
> It's not that hard for people to set up a local Sashiko. and then use
> either an local LLM, or their own cloud-hosted AI tokens.  Perhaps
> that's something we can encourage.

Actually it is that hard. Even if you spend the 2000 - 3000usd
necessary to run somewhat large-ish models locally the results are
still quite slow (which by itself would be ok) and they catch
a lot less then the actual Shashiko service.

As for using "their own cloud-hosted AI tokens" I've not tried this
myself but other people with a personal "Pro" level subscription
have tried and they got blocked out of further token use for 5 hours
(throttled) after a single Shashiko review run on a 5 patch patch-
series.

So it is actually quite hard to get Shashiko to do a pre-check without
just sending of the patches to the list and the Shahiko service do
its thing.

Regards,

Hans




