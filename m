Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617395;
	b=qIAvdWe0lrKclWwzbaWBZI7JNXIGaq3SDbXN5WF8WUi+lNg1dDYRBFE1oWfOw2e4PweJ
	 qqsr+I4igkzQOFm3Kiy+zz0M3VQO6E8WjVhaXMnaBWsnJ6uZ4141t18z4htrw312VOupq
	 Hs0WiZCxEUPmzuhdIMYz2oOtSK/B5h9m9CefsnjGXiTOFsZ8TYIoClCJZP+0qKRknz3K1
	 OvtSYPrMu1fJurO/m5Ru76O++ZiYNIWAeLhi7lPbPl64XqKLC6fDuFLka23pboMUQPv5S
	 dGFfwLtIPz/fcte20DUiAsjaZT+KyoEKWnlrwPQrx7YtP77VSzg41ycxkaYadq+B39Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617395;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xKKR/qHTIq0VaqoBdG7BgjScoQgqWS6Y3y7CnOluqJ4=;
	b=YDciCxfleodYhhcoDOYjyA8FMh9JiBHxsuIm1D26u69Vaqhz7765edcDkdbIFJOhdWGI
	 hT809trVQJwoiz6oicA8IksvqoriPsti8w53vrX0Sug5uqo4mCrhxtz1p+RvQe6Oayt/d
	 u8+SE1L4/ImDpigwa1eS4myXLLRV/q0XgtaLsMbU7LDt5pcpr0TU/M4r1KXkAmKqZfwRw
	 0tTJ+UceEJwEmfzsJdGRC7I7TJf4h4dipDRvSBdqYsjdKRJWl8+/653iVYqlOrtjz7vR3
	 8KTicxe3uPBxmMcFL4BjWCN1MaC4AefC77rucjQrnHz3Sx+f5z7p5xELEyVO4y2vjwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bGNxwHfB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X9cDyo+Q;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95504606A31E
	for <sashiko@lists.linux.dev>; Wed, 25 Nov 2026 14:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95504606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bGNxwHfB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X9cDyo+Q
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEMIkp175467
	for <sashiko@lists.linux.dev>; Wed, 25 Nov 2026 14:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xKKR/qHTIq0VaqoBdG7BgjScoQgqWS6Y3y7CnOluqJ4=; b=bGNxwHfBcYESYW72
	w9vmnmEHFSYY9CiX56h6KiWqXTny3fxaRyxbW3Lx1hDKu/CNxJrGbmMQ6iE7bocu
	lba/wDu9zwMA6lX3xWdyKW8mcd/B+JYc7lKlK1CuWXLlHCJXCwMKHtxZJ6YiBZuJ
	gcqg4vQViIl50U8KWbTHpnTPIUAWA7EdQgdk8LY+uxDK9I/UKO+Xh/A2XCL9F2iT
	mpEp8X2Lk/JUAnwW19VZfdrAwtJMXWVvw7f5lbx3LeZokc2lzt6SmAiQKY6w6h7k
	NddPNJ8qBhYw8yHHZgUl2/nWWK22Dcq2z6XMzmM6s6UmF9ruaahBTr5jv7V4Rm2X
	qe30Sw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vv2s898-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko@lists.linux.dev>; Wed, 25 Nov 2026 14:36:32 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99e0e774882so3036612241.3
        for <sashiko@lists.linux.dev>; Wed, 25 Nov 2026 06:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795617392; x=1796222192; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKKR/qHTIq0VaqoBdG7BgjScoQgqWS6Y3y7CnOluqJ4=;
        b=X9cDyo+Qm8sSJUrMwONf1uK7ymgubKia800izfHc/yAPx7YFG9Seh8O0Ve1R7qBvqW
         JmSRHfKXP/g39nP07SLqVpmV25pDaJGZuhIavA7DUrmu1fTVv25KxdSFsWBB/CBskO09
         4aRJjePQDDLJVIK+Er9h8KktFLr7rOV6cD0hJrP95pPmpeOebaCM6Ozic1Nme3GRtdTn
         yUDW+j8z/O6G8q+uDIsm6NrupNPNKsHJfoAr4pM8dKHUxjyT36dHur/gB52RTBF/IoMV
         xhGyKG3u/65dQv4ef0CU7PiX90H0/0mO6RqSyHwNPc35qUU9g6WpM0UTfP+xUaguZfmx
         HtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617392; x=1796222192;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xKKR/qHTIq0VaqoBdG7BgjScoQgqWS6Y3y7CnOluqJ4=;
        b=DXeanrQ+NR0QP/KuaF8YWq8/+G6AWTySLFo70694IoircaD9AyBZNp6NZZTj5gcxmf
         HEJEIoOQ1dMqdzBbibLd12N3mxefTE1iTPY497XA9bNCS1t31xqdmtt76R2CdQn7dKGO
         FuXYPq8tljJ231bdU5nTNNzWXHmFzpKk8MVJ33zx58VZ5DzBVQBdsRG+Tg2YCy3m3Wam
         2XGlEh32x+bYieZVMcIs7uNtmtMZ6LKr8IH+6LqQXlNkOUjZUGbmcIlxJTQpM1c/obgp
         CPZagPikrzDtROflV6qRcP8J/4Tc+iLCtbZIxIS75X+68JgIBqwFhfgo8iQUeJpRtzfr
         R8gg==
X-Gm-Message-State: APuU4Z/0QRuMZA2A+JtLVG4dFjI81XEc5jhwuiiTed1SLbBLm3ziVpLH
	BE+wRjwWc8zGwtr5mIMX96shU7pKT+ZQbvTQR19nKTTaXWE88GU89B4yTcIv4oo8tPs0G+IGCPC
	vG9/cxrGw9eyXJievRoWuXlglWpYKWwdIupUUXx7PTYvrtgvqX17ap/ZvZ/wvHBJ8ts04
X-Gm-Gg: AZFdTZfu0siOoQXID+onB+Sicco7qcMnXV6nQJcK68QXbaA+A42eFocpzC3w5Me8xY7
	dQx5JcCzUy5xbO1Th6uilAawmix3qmJOjnqKa3SQ0shb0J6MxHvVP++j7+iCWMsvkvouj8bUiud
	tZ0Ll8hoZvJM6M85MKmRc5n6Ip7uLl0Kf/qdw/LvCPqqZiQoOBDNEsFHKXfoaAzR+aAfBf/ebV7
	9XlxvxTSSeIzFEGq9lW8oOfq263/rrFHPhMPN3ZiwaQCTyQ0fks5BJSnKk0R5oLMLIkG2GL3Xuw
	WtlpYVOus61k9qwQ20rRCowtg20xN2xC4SeULKUBaO5QyVeZILUi9ioITs5PP4Uin1Jxn/hJbsG
	PL/SHc+GuNYL10UzzcZUr+a54fwnl6ASKOSK32EWneQz0e8Nho28oJjqVTbM6OcER4vacxIjJBT
	fuZgTh0AppboNuW0+PYuS06xVBi2mS3aiUWzg=
X-Received: by 2002:a05:6122:d03:b0:5ec:b8f0:774a with SMTP id 71dfb90a1353d-5ee8adf6c85mr10430858e0c.3.1795617392073;
        Wed, 25 Nov 2026 06:36:32 -0800 (PST)
X-Received: by 2002:a05:6122:d03:b0:5ec:b8f0:774a with SMTP id 71dfb90a1353d-5ee8adf6c85mr10430831e0c.3.1795617391472;
        Wed, 25 Nov 2026 06:36:31 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:ae4e:e70c:bc04:68c3? ([2a05:6e02:1041:c10:ae4e:e70c:bc04:68c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm488204165e9.4.2026.11.25.06.36.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:36:30 -0800 (PST)
Message-ID: <c3623718-8783-421a-9051-c2addac5ba9c@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 15:36:29 +0100
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
Subject: Re: sashiko racing with maintainer for the review (duplicate work ?)
To: roman.gushchin@linux.dev
Cc: sashiko@lists.linux.dev
References: <ecb65bde-3d85-40fd-8c6c-782071bfd5be@oss.qualcomm.com>
 <EE7C9947-83A4-4056-97BE-9F26D744E7E0@linux.dev>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <EE7C9947-83A4-4056-97BE-9F26D744E7E0@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1OCBTYWx0ZWRfX2Pe+sfOZNezk
 KEIx+AqSZH3Np7B+TnhgCBVTSLuLeNJfBpyep7cbawimArY3pR61g+5289PDmFC+hjX7G1AUqB/
 A/ocGrFgzI0ryVcldAg2UrDNhcjAo7A=
X-Proofpoint-GUID: 350e17qh6KiQNSmYTLetLfXb5LJavxRZ
X-Proofpoint-ORIG-GUID: 350e17qh6KiQNSmYTLetLfXb5LJavxRZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1OCBTYWx0ZWRfX5TAqMLGHd/Ql
 gVe3JMoXmDSHEOYqHHOEliL+Qy8Loj+6IA3x3LrzVQNtHBOzpx4cWcDVy7/fy6d2d7eGhcor1uV
 TEUVoZ33VknrV8nmBPVe/ZxgIncN4eYptY2WOntuflsGZtnYzdu6Cfae7yAhPNymfx3DLSiLV8R
 M/DNM8CjlhpOKjflvjiCPpSDt/o10bUwQPCEvnNB+KUDvZcvfTD5KjdK9DHy89hNf8/GrjXqRhM
 aSdibnJ1gNfllC2+Tkb+sO+ro2Acr/g1OlygJzB4NV6CBApqpNnxuBoy0jO/rATz/ihvc5sQKC3
 Ui0F1Izh88OG4jgMC9oa/L+BBz702irSzv/4+mTYJUTcFoS+8gWcUSaH/W0yowFhZmXtDHrT0XW
 L+V7QcxuAWb7jaFCSjiTr2FSYSkHKG0PsaXGCtQVOk9BGjAc7tf5dvOgFc5fIkbp9CKnkK8C8qN
 rsZNtZwtoMTygsDDhIQ==
X-Authority-Analysis: v=2.4 cv=A/z5rKWG c=1 sm=1 tr=0 ts=6b06f270 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Mny7AIAWUuP7ha50ixMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250058


Hi Roman,

we are receiving more and more patches resulting from AI assisted code.

I would like to filter them out based on positive review from sashiko. 
That is pay attention to them when they passed the sashiko positive review.

However the mailing list where the patches are sent is shared with 
different maintainers (the linux-pm@ ml) and only me is interested in 
getting an email when a positive review is claimed for a specific series.

As I can log in sashiko as a maintainer, it would be nice if I can add 
myself as a positive_review recipient for a specific mailing along with 
a set of criteria (eg. positive_review + I'm in to | cc)

If the result in the patch workflow is not satisfying for any reason, I 
should be able to drop my subscription.

Is it something which make sense ? Or may be it already exist ?


On 4/25/26 02:24, Roman Gushchin wrote:
> Hi Daniel!
> 
> It’s definitely possible, but Idk if it will generate too much noise.
> In general I aim to review all public submissions and in theory
> (subject to current AI budget and stability) reviews should be within
> an hour, maybe except large patchsets. But I certainly can add emails
> notifications as an option on per-subsystem basis, as well as emails
> on clean reviews.
> 
> I’ll be likely a bit too busy next week and then attend lsf/mm/bpf,
> but after that I can certainly add it.
> 
> Thanks!
> 
>> On Apr 24, 2026, at 8:41 AM, Daniel Lezcano
>> <daniel.lezcano@oss.qualcomm.com> wrote:
>> 
>> ﻿ Hi,
>> 
>> as a maintainer, I don't know if I should spend time on reviewing
>> series while sashiko is may be doing the same review in parallel.
>> 
>> Is it possible to have sashiko sending an email to the
>> maintainer(s), reviewer(s) telling it began to review, cc'ing the
>> submitter and send another email to the same recipients, telling the
>> review is finished and is ok/nak ?
>> 
>> That would let me know I should wait while the submitter takes into
>> accounts the sashiko reviews. When sashiko review is ok, then I can
>> review the series
>> 
>> Does it make sense ?
>> 

