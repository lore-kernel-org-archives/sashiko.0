Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794394041;
	b=29tXQw2gLbhzlxY208S2/CZt2f5b2m3rcNcsBSXV7Lrr/MEAq+Iv5UczdXEU+nmZWd5E
	 Uuc7nzt6koFSdO7Lbyif4LmVbzWX8znNnGsUFJGRkY7i8zGSZehhx/jZjRZm+sbzGMlQJ
	 mdO5WYu3I66XUU4Cqx3JHpayOF8fpok6P7j5+8l87uvbvD7AcigW5gM7iVBA+adQv8YGJ
	 RQglVpoZllTHyJNZCRtxRpLT3Iycqcz9SqPFafI4WAd4BtvM6gwEUDs3Uc0+MCNZpyxU9
	 7bV1FJY3YB72b9eky0z0AEt3nNz7m7dMjIO3XHrpC1ou66cjlufzXAuwv3OvRw5NXEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794394041;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DoUwLhuWf6WlHVes9z3kn+MTA7CoHnx6xjHi9vvj7Zw=;
	b=dL6P6JHGaM3y3D6RrFvJWnIHGUa8OrTvlmHHl+QCS2qjhssxPM+ZjFheQ3htorZeGBAH
	 fBFS/0RmxQ2SojLouUH7qGeslGVy8AdBobFE+e80HMPOf4whGOfFg076cYqH5lFpBAOra
	 CmutgawLaf1N8z0sJ8rZkqI34jKpYwwJZ7g6N0U/uunPdEYHPbM7i5VntOcsoNTkhioVY
	 RcvWvGS1OtulvfOqDe8oAo3FRQhP38xcbFWSD+zfuHaNr4KNkdfw0X6PCocC5+GcPEdxg
	 AxS8MGSwA1KqE1vxaoF6rpqyF9LrFeuIeQuSqxf9FV2+524H/tl2Gg5dpmcBpvrT4FQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="GOS5aS/u";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="IVudQA/c";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083C6606A31C
	for <sashiko@lists.linux.dev>; Wed, 11 Nov 2026 10:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 083C6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GOS5aS/u;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IVudQA/c
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KgYB300708
	for <sashiko@lists.linux.dev>; Wed, 11 Nov 2026 10:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DoUwLhuWf6WlHVes9z3kn+MTA7CoHnx6xjHi9vvj7Zw=; b=GOS5aS/uqwJBzhP1
	csgEdomk+to04FaCt1ulm6I9Dast6fVEPr1B8ZN74emZ5/6Dm0WfMWVUku6IVlfJ
	0wp5qTF+4e58eFEc4ftI3HsfBi2FQNZnxVu9ESHUxmMSTGts6VXKQIS3Pd2d8KQ4
	AkHkR1b2/gTzQQ0l9zX3qVh12+6Tbad2QQsphSHH0ucdJ4aoCqnqp3TFvo6QlpQH
	L6QdTz9rIVkmpufLMYDE2npoPSg8KuOTs0AOfEuDI439DiTqtqYlqRYd2HFowd4q
	lFyp+QGuF0TrOQoo2XYwTe8WfxKRpTNKvNAB+CPuWgaXwcApiBHRvGIN4rv/7av/
	ZDvaAw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv7c5kvmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko@lists.linux.dev>; Wed, 11 Nov 2026 10:47:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so4975733a91.2
        for <sashiko@lists.linux.dev>; Wed, 11 Nov 2026 02:47:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794394039; cv=none;
        d=google.com; s=arc-20260327;
        b=Tdx+QAA1yzbyQ7C9e8niHwLiuVz+XqmuOzoD0F6wLI5MD4dCW1bAHl3nxYYkGlxtXz
         gFkvEXat5sRWhsANN6h+EOowcxBCjWPpFTQkHXp4AZtQnhb6zYGOIIw9WPQ9MAYJyoB6
         6tEXZu72zEuz4cv69LpfplILKSzcQhJUcCzvxQxDlf0cMNn9Rjwow2gzY8HSUt6kBlFD
         T5U72e3abMHzDBcb5o8KDgJ9kRWEazwdGvavc7Qkx6AULtJwFKaPEmx/L46BHqQGoftV
         wgeQYA/WNY0fzXP5KEVxD7LgR6MoE1fKuDXE/psLHiDSdvCN+i/8wi/CprBdzoONQbOR
         U7yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DoUwLhuWf6WlHVes9z3kn+MTA7CoHnx6xjHi9vvj7Zw=;
        fh=jwOSEAHLG8b2VNV0QpzkD8FIQ/F+Bo2rr6OoXatxGXs=;
        b=VepDR2i4RPSMBXxAUKJIRXa71yUYKEOjVU1rLCvKiQ8exPs3tfhfSQSlyjO+z0dMmi
         Nn5+Ol2/A+dseBhRWI8dwZaIIG6oAsMoffPkWHkVXoOzvMiZrehecEmltLECDSFIbSog
         +0CoAYf3zLDWBQawuXN3DjxxJ4i0x6n2G7I+v3dVHg5yJSAj6KuSz7wQC30O+ptusP6M
         y0ZMyG7znkAXhp1qQfKWTTngQ/ibV6iW+mUT0JYGzLfKJF4m3AalILyxUgyslzDPdTkV
         Slsrebm3YsOLtNX8En2tNQzJaHLPwkmgXTa+JQlRgVX86jVneC1a7//S7y3TQ2r++ynY
         nRtA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794394039; x=1794998839; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DoUwLhuWf6WlHVes9z3kn+MTA7CoHnx6xjHi9vvj7Zw=;
        b=IVudQA/cu5fgiWqlNc9ukPH9rmuFlw9jzWBf5giGmU4KS33F50HAhzq1ish96oqA7J
         i6TaYLcU71Las23ZUxe54ScGY5Q9wQ1LSdpBQ/Z0k6IFwGc72CSVDwnQFMyIsLgfv6/F
         k1DcZoZ7db6OhnrnPbwhzla2T51KlSg4a9MSBNYSk2pfuT3CU2yYrdtoTu0jwrvxqKO3
         XZ7Keg5uNcbknOxCciLRRgQcpkMUNAvYgDDHD9mVT5Vk02nNS/XfBbSunWmbnxrn2cjT
         SLZE89gci3YWt2waTyXIZBK9FxTJXZAxzazM+XAeUxV+uV/4gtS4/+NwvcZuo2vilJM4
         5mGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794394039; x=1794998839;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DoUwLhuWf6WlHVes9z3kn+MTA7CoHnx6xjHi9vvj7Zw=;
        b=GmDnAvPJe8hQCTMw7jSLEEPAxQL+QuCH3D+kPkoBFqW9BQsoszbj8ExT9euRQjBhvk
         LkXnDiqXRvmVF2QeoEGa7IUHeZBPoZiVqTIoH36Apbzq818vr8Pn0/+QnmQ6oSr+2aaN
         xQ+QwUaf3zkIt81Z5GbjwvzzanzwHfeyyPfPfkWgfNHLGlocOoT/bWzd0AozCZ2xndsG
         ImRDThHmOiy+vgkA/9ig0QvsJ1slhF5OMM71Uy8/wbGqfW4qOwlNsLkXkAlTymyZtEFG
         m2H3bMYNFzG+Ld182d/HfDBxpWWNSUodOtfMfpZptaBcImoS9yqvk8A3E+25bhG9sUER
         J30Q==
X-Gm-Message-State: APuU4Z9Y7M50yFbFh+Kfz4WMDke+vMBHoTnncWxxbd2njRhSkN4BBnoK
	YBJJcTBMbRyjMizHlvXJQMV6SLaabd3YbkzmAliRXTazYaSZff7qNcssIIedwf7TnPkrLkPboBi
	eI1o/hDPNeeoq1+v+kt8CpYUiENSTAigeGF63SZn8Ut4K8Ao4qRT/uyHkEdjDLBwIKjNjnKG9US
	VgbRgrWHYBEG6NnLZ/WJ9zBqt8+GgFv681wbhetj4GU5I=
X-Gm-Gg: AYBFou2TFKDiqKbB0ib1MYqRJFQhRT7JMRPfFiDeTsAJQZ5UjGWCK69T0t9bgfFP/EI
	u8UCyrddrDV4DBxkpSrWzdcPqk4MXPJTR8vPTmWgdFEY0aQW7YPRrVa8TileG2fqq3E3j3/w3Zl
	R/M2aUuxl65M6AOpUbk64QLrI01EyTN5UkC8NtR4g5ZnIKzHk6P89YLTcQAw==
X-Received: by 2002:a17:90b:5105:b0:3ab:2737:3393 with SMTP id 98e67ed59e1d1-3b182efbbdemr1822996a91.40.1794394038785;
        Wed, 11 Nov 2026 02:47:18 -0800 (PST)
X-Received: by 2002:a17:90b:5105:b0:3ab:2737:3393 with SMTP id
 98e67ed59e1d1-3b182efbbdemr1822984a91.40.1794394038222; Wed, 11 Nov 2026
 02:47:18 -0800 (PST)
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAPx+jO_YeCeu3tN_8tKL5M3mZJT3VM2vVLLH6WdCpC04Mk=iAA@mail.gmail.com>
 <61C9D3E6-7E62-470B-B942-AFEA3ACFFCD7@linux.dev>
In-Reply-To: <61C9D3E6-7E62-470B-B942-AFEA3ACFFCD7@linux.dev>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 11:47:06 +0100
X-Gm-Features: AclHuK_kVvbwScsLjKUVOr5Enm3YUhUCYFEMlw_MYTkY4XAdYE71pmybsdO9JeE
Message-ID: <CAPx+jO-1r+rkJnYyBacOPBePEYFFCj2htTyUxh02NfOCA2QGNQ@mail.gmail.com>
Subject: Re: Request to add linux-mmc
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: sashiko@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0MiBTYWx0ZWRfX1SEo/17HS86G
 jeW9uAGQaokPZa3Z0RcCy3NSrQ6pQsvrxqhFl34m4V/lEBVlEYkuHYlM3re3UOPKODIC+lmKYi0
 xntHxI1vItwa0B0v4rAg5VtCXr0YsfmC+QvkRwGafNVgk8EzX7ckJ6EyoaHpJayC8oK8ju9Xtw0
 +Ir37dvrzz7S9BFiEDXYl0+g2o2fcPawEPlqz+zvkbsNs6JT1+gpI1IlpUE98wnvHkjXbrhNKwB
 5iu2vhb7DWjomlPN/DKUp+LRe+iiIIjxYtgUCdUV15Mpg8nsdMLeL2l75fsJZpQaqybgAC5pqNl
 6p+iSuJVID4So/DPUeeg3vjb9FWpF90zIXwFPn5F0aLgkpLV6oAMn/L9jKBm7lbq+JA3q4J8Dv3
 sW7OkT6HEoSZhruCNKA9XkH3ePhlJqWqhFUGeqidJQ1ABxO9AKdqn5PPyUCQOJQnSuUoibmGnJH
 eUz7JcWiiJGSRZ/WjLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0MiBTYWx0ZWRfX7LmPSeH71rnW
 jg86ZG4r8R1qpuztS8fSRiYhVi7W4nKMOu5+WJF7q2JttW0Mx/4JDGn4XUiIal2jSfxjQ92Ze7i
 6nq9nXQFTkFc2tC1z58PIjZgrQ/muc8=
X-Proofpoint-ORIG-GUID: rVXW_2GEp2ccypvv0ykSEb7LEm3hqt20
X-Authority-Analysis: v=2.4 cv=eq9KXYpX c=1 sm=1 tr=0 ts=6af447b7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=XJcPBoWi-kt7CiHrVVsA:9 a=QEXdDO2ut3YA:10
 a=vmtfsuncZyMA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: rVXW_2GEp2ccypvv0ykSEb7LEm3hqt20
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110042

On Wed, Nov 11, 2026 at 2:04=E2=80=AFAM Roman Gushchin <roman.gushchin@linu=
x.dev> wrote:
>
> Hi Uffe,
>
> Added.

Thanks!

> Please, let me know/send a PR if you want to enable emails with reviews.

Let's give it a try to enable it for the author only.

[...]

Kind regards
Uffe
